#include <ros/ros.h>
#include <pcl_ros/point_cloud.h>
#include <fast_gicp/Transform.h>
#include <fast_gicp/ndt/ndt_cuda.hpp>
#include <pcl/filters/voxel_grid.h>
#include <filesystem>


///////////////// Goal \\\\\\\\\\\\\\\\\\\\\\\
// Receive vehicle point cloud and perform ndt against map. 
// Inputs: Point cloud topic, data mode (real or carla), map topic
// Outputs: aligned vehicle point cloud, transformation

// variables to get from rospram 
std::string data_mode = "";
std::string map_path = "";
std::string vehicle_pc_topic = "";
std::string aligned_pc_topic = "";
std::string map_pc_topic = "";
std::string vehicle_transform_topic = "";
std::string vehicle_initial_guess_path ="";
std::string dataset_path="";
std::string dataset_name="";
std::string output_path="";
std::string append="";



// subscribers and publishers
ros::Subscriber pc_sub;
ros::Publisher aligned_pc_pub, map_pc_pub, transform;


// global variables
const std::string NODE_NAME = "vehicle_ndt";
const int LIDAR_FREQUENCY = 10;
const int QUEUE_SIZE_SUB = 1;
const int QUEUE_SIZE_PUB = 1;
Eigen::Matrix4f init_guess;
fast_gicp::Transform tf;


// global objects
std::ofstream log_time_ndt, ndt_poses;
pcl::VoxelGrid<pcl::PointXYZ> voxelgrid;
pcl::PointCloud<pcl::PointXYZ>::Ptr map_cloud(new pcl::PointCloud<pcl::PointXYZ>());
pcl::PointCloud<pcl::PointXYZ>::Ptr d_map_cloud(new pcl::PointCloud<pcl::PointXYZ>());
fast_gicp::NDTCuda<pcl::PointXYZ, pcl::PointXYZ> ndt_cuda;



// Function prototypes
int Sanity_Check(ros::NodeHandle nh);
bool Read_Point_Cloud(const std::string path_to_file, pcl::PointCloud<pcl::PointXYZ>::Ptr cloud);
void Point_Cloud_Callback(boost::shared_ptr<pcl::PointCloud<pcl::PointXYZ>> pc_msg);

void Advertise_PC_Topic(ros::NodeHandle *nh_ptr, std::string, ros::Publisher *pub_ptr, int frequency);
void Advertise_Transform(ros::NodeHandle *nh_ptr, std::string, ros::Publisher *pub_ptr, int frequency);

void Publish_Cloud(ros::Publisher *pc_pub, int frame_number, pcl::PointCloud<pcl::PointXYZ>::Ptr input_cloud);
void Publish_Transform(ros::Publisher *pc_pub, int frame_number,  fast_gicp::Transform tf);

bool Subscribe_To_PC_Topic(ros::NodeHandle *nh, const std::string pc_topic);

Eigen::Matrix4f Initialize_Init_Guess(std::string initial_guess_path);
std::vector<float> splitString(std::string str, char splitter);
void Update_Init_Guess(Eigen::Matrix4f prev_frame_transform);
void Update_Transform(Eigen::Matrix4f prev_frame_transform);
Eigen::Matrix4f Get_Init_Guess();
fast_gicp::Transform  Get_Transform();

pcl::PointCloud<pcl::PointXYZ>::Ptr NDT_Align(fast_gicp::NDTCuda<pcl::PointXYZ, pcl::PointXYZ>& registration, const pcl::PointCloud<pcl::PointXYZ>::Ptr &source_cloud);


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


  if (append =="t"){
    log_time_ndt.open(output_path+"/log_time_ndt.csv",std::ios::app );
    ndt_poses.open(output_path+"/ndt.txt", std::ios::app );
  }
  else {
    log_time_ndt.open(output_path+"/log_time_ndt.csv" );
    ndt_poses.open(output_path+"/ndt.txt" );
    log_time_ndt << "frame_number" << "," << "latency_downsample" << "," << "latency_ndt" << ","<< "latency_total"<<std::endl;
  }
  


  // 1.3 Read basemap and downsample it
  std::cout << "Reading map file ..." << std::endl;
  
  if(Read_Point_Cloud(map_path, map_cloud)) 
  {
    std::cout << "Successfully read map from file" << std::endl;
  } 
  else 
  {
    std::cout << "Failed to read map from file" << std::endl;
    return -1;
  }


  //initialize ndt cuda
  if (data_mode == "usc"){
    //ndt parameters for real-world data
    voxelgrid.setLeafSize(0.3f, 0.3f, 0.3f);
    voxelgrid.setInputCloud (map_cloud);
    voxelgrid.filter (*map_cloud);
    voxelgrid.setLeafSize(0.3f, 0.3f, 0.3f);
    ndt_cuda.setResolution(1.0);
    ndt_cuda.setDistanceMode(fast_gicp::NDTDistanceMode::D2D);
    ndt_cuda.setNeighborSearchMethod(fast_gicp::NeighborSearchMethod::DIRECT1);
    ndt_cuda.setInputTarget(map_cloud);
  }
  else {
    //ndt parameters for carla
    voxelgrid.setLeafSize(0.9f, 0.9f, 0.9f);
    voxelgrid.setInputCloud (map_cloud);
    voxelgrid.filter (*map_cloud);
    voxelgrid.setLeafSize(0.6f, 0.6f, 0.6f);
    ndt_cuda.setResolution(5.0);
    ndt_cuda.setDistanceMode(fast_gicp::NDTDistanceMode::D2D);
    ndt_cuda.setNeighborSearchMethod(fast_gicp::NeighborSearchMethod::DIRECT1);
    ndt_cuda.setInputTarget(map_cloud);

  }

  // 1.4 Advertise point cloud topics for aligned points and the map
  std::cout << "Advertising point cloud topics for aligned points and the map" << std::endl;
  Advertise_PC_Topic(&nh, aligned_pc_topic, &aligned_pc_pub, QUEUE_SIZE_PUB);
  Advertise_PC_Topic(&nh, map_pc_topic, &map_pc_pub, QUEUE_SIZE_PUB);
  Advertise_Transform(&nh,vehicle_transform_topic, &transform, QUEUE_SIZE_PUB);


  // 1.5 Initialize initial guess
  //Initialize_Init_Guess();
  init_guess = Initialize_Init_Guess(vehicle_initial_guess_path);


  // 1.6 Publish map point cloud
  // std::cout << "Publishing map point cloud" << std::endl;
  // Publish_Cloud(&map_pc_pub, 1, map_cloud);

  //// 2. Main Loop /////
  std::cout << "Subscribing to point cloud topic: " << vehicle_pc_topic << std::endl;
  pc_sub = nh.subscribe(vehicle_pc_topic, QUEUE_SIZE_SUB, Point_Cloud_Callback);
  std::cout << "Going into ros::spin() ..." << std::endl;
  ros::spin();

  return 0;
}

int Sanity_Check(ros::NodeHandle n_h) {

  if(n_h.getParam("dataset_path", dataset_path))
    std::cout << "dataset_path : " << dataset_path << std::endl;
  else {
    std::cout << "/dataset_path parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("append", append))
    std::cout << "append : " << append << std::endl;
  else {
    std::cout << "append parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("dataset_name", dataset_name))
    std::cout << "dataset_name : " << dataset_name << std::endl;
  else {
    std::cout << "/dataset_name parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/data_mode", data_mode))
    std::cout << "data mode : " << data_mode << std::endl;
  else {
    std::cout << "/data_mode parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/map_path", map_path))
    std::cout << "Map path: " << map_path << std::endl;
  else {
    std::cout << "Map path: " << map_path << std::endl;
    std::cout << "map_path parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/vehicle_pc_topic", vehicle_pc_topic))
    std::cout << "vehicle_pc_topic: " << vehicle_pc_topic << std::endl;
  else {
    std::cout << "/vehicle_pc_topic parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/aligned_pc_topic", aligned_pc_topic))
    std::cout << "Aligned point cloud topic: " << aligned_pc_topic << std::endl;
  else {
    std::cout << "/aligned_pc_topic parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/map_pc_topic", map_pc_topic))
    std::cout << "Map point cloud topic: " << map_pc_topic << std::endl;
  else {
    std::cout << "/map_pc_topic parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/vehicle_transform_topic", vehicle_transform_topic))
    std::cout << "vehicle transform topic: " << vehicle_transform_topic << std::endl;
  else {
    std::cout << "/vehicle_transform_topic parameter not set" << std::endl;
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


void Point_Cloud_Callback(boost::shared_ptr<pcl::PointCloud<pcl::PointXYZ>> msg) {
  
  // sleep ndt for 50ms so that ICP can use GPU in that time. 
  // if they both use GPU concurrently it increases compution time 
  usleep(5000);

  auto t1 = ros::WallTime::now();

  static int pc_counter = 0;
  

  pcl::PointCloud<pcl::PointXYZ>::Ptr raw_input_cloud = msg->makeShared();
  // Dowsample vehicle point cloud for faster alignment
  pcl::PointCloud<pcl::PointXYZ>::Ptr downsampled_cloud(new pcl::PointCloud<pcl::PointXYZ>());
  voxelgrid.setInputCloud(raw_input_cloud);
  voxelgrid.filter(*downsampled_cloud);

  auto t2 = ros::WallTime::now();

  pcl::PointCloud<pcl::PointXYZ>::Ptr aligned(new pcl::PointCloud<pcl::PointXYZ>());
  aligned = NDT_Align(ndt_cuda, downsampled_cloud);

  auto t3 = ros::WallTime::now();

  Publish_Transform(&transform, pc_counter++, Get_Transform());

  
  auto duration_downsample = (t2 - t1).toSec() * 1000;
  auto duration_ndt = (t3 - t2).toSec() * 1000;
  auto duration_total = (t3 - t1).toSec() * 1000;

  log_time_ndt << pc_counter  << "," << duration_downsample << "," << duration_ndt << "," << duration_total << std::endl;
  ndt_poses << Get_Init_Guess () << std::endl;

  // Publish aligned point cloud and map 
  // pcl::transformPointCloud(*raw_input_cloud, *raw_input_cloud, Get_Init_Guess ());
  // Publish_Cloud(&aligned_pc_pub, pc_counter, raw_input_cloud);
  // Publish_Cloud(&map_pc_pub, 1, map_cloud);
}

pcl::PointCloud<pcl::PointXYZ>::Ptr NDT_Align(fast_gicp::NDTCuda<pcl::PointXYZ, pcl::PointXYZ>&  registration, const pcl::PointCloud<pcl::PointXYZ>::Ptr &source_cloud) {

    pcl::PointCloud<pcl::PointXYZ>::Ptr aligned(new pcl::PointCloud<pcl::PointXYZ>());

    registration.setInputSource(source_cloud);

    // Registration
    registration.align(*aligned,init_guess);
 
    // Save transformation
    Eigen::Matrix4f current_frame_pose = registration.getFinalTransformation();
    
    // log_time_ndt << registration.getFitnessScore() << "," ; 
    
    Update_Init_Guess(current_frame_pose);
    Update_Transform(current_frame_pose);
    return aligned;
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

void Advertise_Transform(ros::NodeHandle *nh_ptr, std::string transform_topic, ros::Publisher *pub_ptr, int queue_size) {
  // Advertise topics
  *pub_ptr = nh_ptr->advertise<fast_gicp::Transform>(transform_topic, queue_size);
  std::cout << "Advertised: " << transform_topic << " with queue size " << queue_size  << std::endl;
  return;
}

void Publish_Cloud(ros::Publisher *pc_pub, int frame_number, pcl::PointCloud<pcl::PointXYZ>::Ptr input_cloud) {
  pcl::PCLPointCloud2::Ptr input_cloud_pc2(new pcl::PCLPointCloud2);
  pcl::toPCLPointCloud2(*input_cloud, *input_cloud_pc2);
  input_cloud_pc2->header.frame_id = std::to_string(frame_number);
  pcl_conversions::toPCL(ros::Time::now(), input_cloud_pc2->header.stamp);
  pc_pub->publish(*input_cloud_pc2);
}

void Publish_Transform(ros::Publisher *pc_pub, int frame_number,  fast_gicp::Transform tf) {
  tf.header.frame_id = std::to_string(frame_number);
  tf.header.stamp = ros::Time::now();
  //tf.header.stamp.sec = t0.sec;
  //tf.header.stamp.nsec = t0.nsec;
  pc_pub->publish(tf);
}

// void Initialize_Init_Guess() {
//   std::cout << "Initializing init_guess" << std::endl;
//   // init_guess << 1, 0, 0, 0, 0, 1, 0., 0, 0, 0, 1, 0, 0.00000000e+00, 0.00000000e+00, 0.00000000e+00, 1.00000000e+00;
//   init_guess = Eigen::Matrix4f::Identity();
//   return;
// }

Eigen::Matrix4f Get_Init_Guess() {
  return init_guess;
}


fast_gicp::Transform Get_Transform() {
  return tf;
}

void Update_Init_Guess(Eigen::Matrix4f prev_frame_transform) {
  init_guess = prev_frame_transform;
  return;
}

void Update_Transform( Eigen::Matrix4f prev_frame_transform) {
  tf.data = {prev_frame_transform(0,0), prev_frame_transform(0,1), prev_frame_transform(0,2), prev_frame_transform(0,3), 
        prev_frame_transform(1,0), prev_frame_transform(1,1), prev_frame_transform(1,2), prev_frame_transform(1,3),
        prev_frame_transform(2,0), prev_frame_transform(2,1), prev_frame_transform(2,2), prev_frame_transform(2,3)};

  return;
}


Eigen::Matrix4f Initialize_Init_Guess(std::string initial_guess_path) {

  Eigen::Matrix4f pose_matrix;
  std::cout << "Initializing init_guess" << std::endl;
  std::ifstream pose_file(initial_guess_path);
  std::string line;
  std::vector<float> pose ;

  for (int i =0; i<4 ;++i)
  {
    getline (pose_file, line);
    std::vector<float> split_line = splitString(line, ' ');
    pose.insert(std::end(pose), std::begin(split_line), std::end(split_line));
  }

  pose_matrix << pose[0], pose[1], pose[2], pose[3],
                pose[4], pose[5], pose[6], pose[7],
                pose[8], pose[9], pose[10], pose[11],
                pose[12], pose[13], pose[14], pose[15]; 
  //init_guess = Eigen::Matrix4f::Identity();

  std::cout << pose_matrix << std::endl;
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