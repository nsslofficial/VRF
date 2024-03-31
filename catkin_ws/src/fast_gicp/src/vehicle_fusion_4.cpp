#include <ros/ros.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/filters/voxel_grid.h>

#include <pcl/registration/gicp.h>
#include <fast_gicp/gicp/fast_gicp.hpp>
#include <fast_gicp/gicp/fast_gicp_st.hpp>
#include <fast_gicp/gicp/fast_vgicp.hpp>

#include <fast_gicp/gicp/fast_vgicp_cuda.hpp>
#include <fast_gicp/ndt/ndt_cuda.hpp>
#include <pcl/registration/icp.h>


#include <fast_gicp/Transform.h>
#include <fast_gicp/CompressDiff.h>
#include <pcl/compression/octree_pointcloud_compression.h>

#include <mutex>

#include <pcl_conversions/pcl_conversions.h>
#include <filesystem>

#include <unistd.h>


// ///////////////// Goal \\\\\\\\\\\\\\\\\\\\\\\
// perform icp between vehicle and rsu reference pcd 
// decompress and reconstruct rsu point cloud
// fuse point clouds from vehicle and rsu 

// variables to get from rospram 
std::string infra_static_pc_path = "";
std::string diff_compress_topic = "";
std::string diff_pc_topic = "";
std::string vehicle_pc_topic = "";
std::string vehicle_transform_topic = "";
std::string infra_reconstructed_topic = "";
std::string fused_pc_topic = "";
std::string infra_initial_guess_path ="";
std::string vehicle_initial_guess_path ="";
std::string dataset_path="";
std::string dataset_name="";
std::string output_path="";
std::string data_mode = "";
std::string append="";



// subscribers and publishers
ros::Subscriber vehicle_pc_sub, infra_pc_sub, diff_compress_sub, diff_pc_sub, vehicle_transform_sub;
ros::Publisher infra_reconstructed_pub, fused_pc_pub, fused_pc_pub1;


// global variables
const std::string NODE_NAME = "vehicle_fusion";
const int LIDAR_FREQUENCY = 10;
const int QUEUE_SIZE_PUB = 1;
const int QUEUE_SIZE_SUB = 1;
Eigen::Matrix4f lidar_pose;
Eigen::Matrix4f vehicle_pose_previous, vehicle_pose_current;
fast_gicp::Transform tf;


// global objects
std::mutex m_reconstructed, m_vehicle, m_vehicle_pose;

std::ofstream log_file_vehicle, log_file_vehicle_transform, log_file_infra, EtE_with_icp, EtE_without_icp;
std::ifstream initial_guess_list;
pcl::PointCloud<pcl::PointXYZ>::Ptr vehicle_cloud (new pcl::PointCloud<pcl::PointXYZ>());
pcl::PointCloud<pcl::PointXYZ>::Ptr d_vehicle_cloud (new pcl::PointCloud<pcl::PointXYZ>());
pcl::PointCloud<pcl::PointXYZ>::Ptr infra_static_pc(new pcl::PointCloud<pcl::PointXYZ>());
pcl::PointCloud<pcl::PointXYZ>::Ptr d_infra_static_pc(new pcl::PointCloud<pcl::PointXYZ>);
pcl::PointCloud<pcl::PointXYZ>::Ptr reconstructed (new pcl::PointCloud<pcl::PointXYZ>());



pcl::VoxelGrid<pcl::PointXYZ> voxelgrid_vehicle, voxelgrid_infra;


// Function prototypes
int Sanity_Check(ros::NodeHandle nh);
bool Read_Point_Cloud(const std::string path_to_file, pcl::PointCloud<pcl::PointXYZ>::Ptr cloud);
void callback_transform( const fast_gicp::TransformConstPtr& vehicle_transform);
void callback_vehicle(boost::shared_ptr<pcl::PointCloud<pcl::PointXYZ>> vehicle_pc);
void callback_lidar(const fast_gicp::CompressDiffConstPtr& diff_compressed);

void Advertise_PC_Topic(ros::NodeHandle *nh_ptr, std::string, ros::Publisher *pub_ptr, int frequency);
void Publish_Cloud(ros::Publisher *pc_pub, int frame_number, pcl::PointCloud<pcl::PointXYZ>::Ptr input_cloud);

bool Subscribe_To_PC_Topic(ros::NodeHandle *nh, const std::string pc_topic);
Eigen::Matrix4f Initialize_Init_Guess(std::string initial_guess_path);
Eigen::Matrix4f Get_Transform_as_matrix(const fast_gicp::TransformConstPtr& tf);
std::vector<float> splitString(std::string str, char splitter);


int main(int argc, char **argv) {

  ///// 1. Initialization Code /////
  // 1.1 Initialize ROS
  std::cout << "Initializing " << NODE_NAME << std::endl;
  ros::init(argc, argv, NODE_NAME);
  ros::NodeHandle nh;

  // 1.2 Argument sanity checks
  if(Sanity_Check(nh) == -1) {
    std::cout << "Exitting early" << std::endl;
    return -1;
  }

   // create output directories
  if (data_mode != "carla"){
    output_path= dataset_path +"/"+dataset_name + "/vrf";
  }
  else{
    output_path= dataset_path+ "/vrf";
  }

  if (!std::filesystem::exists(output_path)) {
    // If it doesn't exist, create it
    try {
      std::filesystem::create_directory(output_path);
      std::cout << "Directory created successfully!" << std::endl;
    } 
    catch (const std::exception& ex) {
      std::cerr << "Error creating directory: " << ex.what() << std::endl;
      return 1;
    }
    
  } else {
    std::cout << "Directory already exists!" << std::endl;
  }


  if (append =="t" ){
    log_file_vehicle.open(output_path+"/log_file_vehicle_pcd.csv",std::ios::app);
    log_file_infra.open(output_path+"/log_file_infra.csv",std::ios::app);
    log_file_vehicle_transform.open(output_path+"/log_file_vehicle_transform.csv",std::ios::app);
    EtE_with_icp.open(output_path+"/EtE_with_icp.txt", std::ios::app);
    EtE_without_icp.open(output_path+"/EtE_without_icp.txt", std::ios::app);

  }

  else {
    log_file_vehicle.open(output_path+"/log_file_vehicle_pcd.csv");
    log_file_infra.open(output_path+"/log_file_infra.csv");
    log_file_vehicle_transform.open(output_path+"/log_file_vehicle_transform.csv");
    EtE_with_icp.open(output_path+"/EtE_with_icp.txt");
    EtE_without_icp.open(output_path+"/EtE_without_icp.txt");
    log_file_vehicle << "frame_number" << "," << "latency_downsample_vehicle" <<std::endl;
    log_file_infra << "frame_number" << ","  << "latency_network"<< "," << "latency_reconstruction" <<std::endl;
    log_file_vehicle_transform << "frame_number" << "," <<"latency_icp"  << "," << " latency_fusion"<< ","<<std::endl;
  }

  //ros::Rate loop_rate(10);
  // 1.3 Read infra static point cloud
  std::cout << "Reading infra static point cloud file ..." << std::endl;
  

  if(Read_Point_Cloud(infra_static_pc_path, infra_static_pc)) 
  {
    std::cout << "Successfully read infra static point cloud from file" << std::endl;
  } 
  else 
  {
    std::cout << "Failed to read infra static point cloud from file" << std::endl;
    return -1;
  }
   //*reconstructed = *infra_static_pc ;

   
  // 1.5 Initialize initial guess

  lidar_pose = Initialize_Init_Guess(infra_initial_guess_path);
  std::cout << lidar_pose <<std::endl;
  //vehicle_pose_inv = Initialize_Init_Guess(vehicle_initial_guess_path).inverse();
  vehicle_pose_current= Initialize_Init_Guess(vehicle_initial_guess_path);


  // creating first icp cuda object takes time (around 70 ms) so making it before the callbacks 
  fast_gicp::FastVGICPCuda<pcl::PointXYZ, pcl::PointXYZ> vgicp_cuda;
  vgicp_cuda.setResolution(1);
  vgicp_cuda.setMaximumIterations(100);
  vgicp_cuda.setNearestNeighborSearchMethod(fast_gicp::NearestNeighborMethod::GPU_RBF_KERNEL);
  vgicp_cuda.setKernelWidth(0.3);

 
  voxelgrid_infra.setLeafSize(0.5f, 0.5f, 0.5f);
  voxelgrid_infra.setInputCloud(infra_static_pc);
  voxelgrid_infra.filter(*d_infra_static_pc);
  voxelgrid_vehicle.setLeafSize(0.5f, 0.5f, 0.5f);


  // 1.4 Advertise point cloud topics for aligned points and the map
  std::cout << "Advertising point cloud topics for aligned points and the map" << std::endl;
  Advertise_PC_Topic(&nh, fused_pc_topic, &fused_pc_pub, QUEUE_SIZE_PUB);

  // 1.6 Publish map point cloud
  std::cout << "Publishing map point cloud" << std::endl;
  //Publish_Cloud(&map_pc_pub, 1, map_cloud);

  //// 2. Main Loop /////
  std::cout << "Subscribing to point cloud topic: " << vehicle_pc_topic << std::endl;
  
 vehicle_pc_sub = nh.subscribe(vehicle_pc_topic, QUEUE_SIZE_SUB,callback_vehicle);
 //infra_pc_sub = nh.subscribe(infra_pc_topic_2, QUEUE_SIZE_SUB, callback_lidar);
 vehicle_transform_sub = nh.subscribe( vehicle_transform_topic, QUEUE_SIZE_SUB,callback_transform);
 diff_compress_sub = nh.subscribe( diff_compress_topic, QUEUE_SIZE_SUB,callback_lidar);


  
  std::cout << "Going into ros::spin() ..." << std::endl;
  ros::spin();

  return 0;
}

int Sanity_Check(ros::NodeHandle n_h) {
  if(n_h.getParam("/infra_static_pc_path", infra_static_pc_path))
    std::cout << "infra static pc path : " << infra_static_pc_path << std::endl;
  else {
    std::cout << "infra static pc path : " << infra_static_pc_path << std::endl;
    std::cout << "/infra_static_pc_path parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("dataset_path", dataset_path))
    std::cout << "dataset_path : " << dataset_path << std::endl;
  else {
    std::cout << "/dataset_path parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("dataset_name", dataset_name))
    std::cout << "dataset_name : " << dataset_name << std::endl;
  else {
    std::cout << "/dataset_name parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("append", append))
    std::cout << "append : " << append << std::endl;
  else {
    std::cout << "append parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/data_mode", data_mode))
    std::cout << "data mode : " << data_mode << std::endl;
  else {
    std::cout << "/data_mode parameter not set" << std::endl;
    return -1;
  }


//   if(n_h.getParam("/infra_pc_topic_2", infra_pc_topic_2))
//     std::cout << "infra_pc_topic_2: " << infra_pc_topic_2 << std::endl;
//   else {
//     std::cout << "/infra_pc_topic_2 parameter not set" << std::endl;
//     return -1;
//   }

  if(n_h.getParam("/diff_compress_topic", diff_compress_topic))
    std::cout << "diff compress topic: " << diff_compress_topic << std::endl;
  else {
    std::cout << "/diff_compress_topic parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/vehicle_pc_topic", vehicle_pc_topic))
    std::cout << "vehicle_pc_topic: " << vehicle_pc_topic << std::endl;
  else {
    std::cout << "/vehicle_pc_topic parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/vehicle_transform_topic", vehicle_transform_topic))
    std::cout << "vehicle transform topic: " << vehicle_transform_topic << std::endl;
  else {
    std::cout << "/vehicle_transform_topic parameter not set" << std::endl;
    return -1;
  }

//   if(n_h.getParam("/infra_reconstructed_topic", infra_reconstructed_topic))
//     std::cout << "Infra reconstructed topic: " << infra_reconstructed_topic << std::endl;
//   else {
//     std::cout << "/infra_reconstructed_topic parameter not set" << std::endl;
//     return -1;
//   }

  if(n_h.getParam("/fused_pc_topic", fused_pc_topic))
    std::cout << "fused pc topic: " << fused_pc_topic << std::endl;
  else {
    std::cout << "/fused_pc_topic parameter not set" << std::endl;
    return -1;
  }

//   if(n_h.getParam("/fused_pc_topic1", fused_pc_topic1))
//     std::cout << "fused pc topic1: " << fused_pc_topic1 << std::endl;
//   else {
//     std::cout << "/fused_pc_topic1 parameter not set" << std::endl;
//     return -1;
//   }

//   if(n_h.getParam("/diff_pc_topic", diff_pc_topic))
//     std::cout << "diff pc topic: " << diff_pc_topic << std::endl;
//   else {
//     std::cout << "/fused_pc_topic parameter not set" << std::endl;
//     return -1;
//   }

  if(n_h.getParam("/infra_initial_guess_path", infra_initial_guess_path))
    std::cout << "infra_initial_guess_path pc topic: " << infra_initial_guess_path << std::endl;
  else {
    std::cout << "/infra_initial_guess_path parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/vehicle_initial_guess_path", vehicle_initial_guess_path))
    std::cout << "vehicle_initial_guess_path pc topic: " << vehicle_initial_guess_path << std::endl;
  else {
    std::cout << "/vehicle_initial_guess_path parameter not set" << std::endl;
    return -1;
  }


  // All good otherwise
  return 0;
}


void callback_vehicle(boost::shared_ptr<pcl::PointCloud<pcl::PointXYZ>> vehicle_pc) 
{
  auto t1 = ros::WallTime::now();

  static int pc_counter =1;

  vehicle_cloud = vehicle_pc->makeShared();
  voxelgrid_vehicle.setInputCloud(vehicle_cloud);
  m_vehicle.lock();
  voxelgrid_vehicle.filter(*d_vehicle_cloud);
  //*d_vehicle_cloud = *vehicle_cloud;
  m_vehicle.unlock();

  auto t2 = ros::WallTime::now(); 

  auto duration_downsample_vehicle = (t2 - t1).toSec() * 1000; 

  log_file_vehicle << pc_counter << "," << duration_downsample_vehicle << std::endl;

  pc_counter++;

}

void callback_transform( const fast_gicp::TransformConstPtr& vehicle_transform) 
{

  auto t1 = ros::WallTime::now();
  static int pc_counter =1;

  // find initial guess
  Eigen::Matrix4f  vehicle_pose_inv =  Get_Transform_as_matrix(vehicle_transform).inverse(); 
  Eigen::Matrix4f inital_guess =  vehicle_pose_inv * lidar_pose ;

  fast_gicp::FastVGICPCuda<pcl::PointXYZ, pcl::PointXYZ> vgicp_cuda;
  vgicp_cuda.setResolution(1);
  vgicp_cuda.setMaximumIterations(100);
  vgicp_cuda.setNearestNeighborSearchMethod(fast_gicp::NearestNeighborMethod::GPU_RBF_KERNEL);
  vgicp_cuda.setKernelWidth(0.3);



  pcl::PointCloud<pcl::PointXYZ>::Ptr aligned(new pcl::PointCloud<pcl::PointXYZ>);

  //// ICP CUDA
  m_vehicle.lock();
  vgicp_cuda.setInputTarget(d_vehicle_cloud);
  vgicp_cuda.setInputSource(d_infra_static_pc);
  vgicp_cuda.align(*aligned,inital_guess);
  m_vehicle.unlock();

  auto t2 = ros::WallTime::now();
 
  pcl::transformPointCloud(*reconstructed, *aligned, vgicp_cuda.getFinalTransformation());
  *aligned +=  *vehicle_cloud ;

  auto t3  = ros::WallTime::now();


  auto duration_icp = (t2 - t1).toSec() * 1000;
  auto duration_fusion= (t3 - t2).toSec() * 1000;

   //vgicp_cuda.getFitnessScore() << "," 

  log_file_vehicle_transform << vehicle_transform->header.frame_id  << ","<< duration_icp << "," << duration_fusion << std::endl;


  EtE_with_icp << vgicp_cuda.getFinalTransformation() <<std::endl;
  EtE_without_icp << inital_guess << std::endl;

  Publish_Cloud(&fused_pc_pub, pc_counter++, aligned);

}

void callback_lidar(const fast_gicp::CompressDiffConstPtr& diff_compressed) {


  auto t1 = ros::WallTime::now();
  
  pcl::PointCloud<pcl::PointXYZ>::Ptr infra_diff_cloud(new pcl::PointCloud<pcl::PointXYZ>);

  std::string s;
  std::stringstream compressedData;
  s =  diff_compressed->data;
  if (s.size() != 0)
  {
    compressedData.write(s.data(), s.size());
  	//compressedData << diff_compressed->data.c_str();
 	pcl::io::OctreePointCloudCompression<pcl::PointXYZ> octree_compression (pcl::io::MANUAL_CONFIGURATION,false, 0.001, 0.1, false, 1, false, 8);
  	octree_compression.decodePointCloud(compressedData, infra_diff_cloud);
  }

  m_reconstructed.lock();
  *reconstructed = *infra_static_pc + *infra_diff_cloud;
  m_reconstructed.unlock();

  auto t2 = ros::WallTime::now();
  auto frame_time = diff_compressed->header.stamp;
  auto duration_network = (t1.toSec() - frame_time.toSec()) * 1000;
  auto duration_reconstruction= (t2 - t1).toSec() * 1000;


  log_file_infra << diff_compressed->header.frame_id  << ","<< duration_network << ","<< duration_reconstruction  << std::endl;

}



bool Read_Point_Cloud(const std::string path_to_file, pcl::PointCloud<pcl::PointXYZ>::Ptr cloud) {
  std::cout << "Reading: " << path_to_file << std::endl << std::flush;
  if(pcl::io::loadPCDFile<pcl::PointXYZ>(path_to_file, *cloud) == -1)  //* load the file
    return false;
  else
    return true;
}

void Advertise_PC_Topic(ros::NodeHandle *nh_ptr, std::string pc_topic, ros::Publisher *pub_ptr, int queue_size) {

  // Advertise topics
  *pub_ptr = nh_ptr->advertise<sensor_msgs::PointCloud2>(pc_topic, queue_size);
  std::cout << "Advertised: " << pc_topic << " with queue size " << queue_size  << std::endl;
  return;
}


void Publish_Cloud(ros::Publisher *pc_pub, int frame_number, pcl::PointCloud<pcl::PointXYZ>::Ptr input_cloud) {
  pcl::PCLPointCloud2::Ptr input_cloud_pc2(new pcl::PCLPointCloud2);
  pcl::toPCLPointCloud2(*input_cloud, *input_cloud_pc2);
  input_cloud_pc2->header.frame_id = "os_sensor";
  pcl_conversions::toPCL(ros::Time::now(), input_cloud_pc2->header.stamp);
  pc_pub->publish(*input_cloud_pc2);
}



Eigen::Matrix4f Get_Transform_as_matrix(const fast_gicp::TransformConstPtr& tf) {
  Eigen::Matrix4f transform;
  transform <<      tf->data[0],  tf->data[1], tf->data[2],  tf->data[3], 
                    tf->data[4],  tf->data[5], tf->data[6],  tf->data[7], 
                    tf->data[8],  tf->data[9], tf->data[10],  tf->data[11], 
                    0.,          0.,          0.,          1.  ;

  return transform;
}

Eigen::Matrix4f Initialize_Init_Guess(std::string initial_guess_path) {

  Eigen::Matrix4f pose_matrix;
  std::cout << "Initializing init_guess" << std::endl;
  std::ifstream pose_file(initial_guess_path);
  std::string line;
  std::vector<float> pose ;

  while(getline (pose_file, line)) 
  {   
    std::vector<float> split_line = splitString(line, ' ');
    pose.insert(std::end(pose), std::begin(split_line), std::end(split_line));
  }
    

  pose_matrix << pose[0], pose[1], pose[2], pose[3],
                pose[4], pose[5], pose[6], pose[7],
                pose[8], pose[9], pose[10], pose[11],
                pose[12], pose[13], pose[14], pose[15]; 
  //init_guess = Eigen::Matrix4f::Identity();
  return pose_matrix;
}

std::vector<float> splitString(std::string str, char splitter){
  std::vector<float> result;
  std::string current = ""; 
  for(int i = 0; i < str.size(); i++){
    if(str[i] == splitter){
      if(current != ""){
        result.push_back(std::stof(current));
        current = "";
      } 
      continue;
    }
    current += str[i];
  }
  if(current.size() != 0)
    result.push_back(std::stof(current));
  return result;
}

//////////////////////////////////////////////////////////////////////////////