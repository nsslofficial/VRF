#include <ros/ros.h>
#include <pcl_ros/point_cloud.h>
#include <sstream>
#include <string.h>
#include <vector>  
#include <fast_gicp/CompressDiff.h>
#include <pcl/octree/octree_pointcloud_changedetector.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/passthrough.h>
#include <pcl/compression/octree_pointcloud_compression.h>
#include <filesystem>

// ///////////////// Goal \\\\\\\\\\\\\\\\\\\\\\\
// Receive infra point cloud, remove zero point, perform diff, compress, and publist it. 
// Inputs: Point cloud topic, data mode (real or carla)
// Outputs: infra point cloud topic 2, compressed point cloud



// variables to get from rospram
std::string data_mode = "";
std::string infra_static_pc_path = "";
std::string infra_pc_topic = "";
std::string infra_pc_topic_2 = "";
std::string diff_pc_topic = "";
std::string diff_compress_topic = "";
std::string dataset_path="";
std::string dataset_name="";
std::string output_path="";
std::string append="";
float resolution = 0.1;

// publishers and subscribers
ros::Subscriber pc_sub;
ros::Publisher diff_pc_pub, infra_pc_pub, diff_compress_pub;

// global variavbles
const std::string NODE_NAME = "infra";
const int LIDAR_FREQUENCY = 10;
const int QUEUE_SIZE_PUB = 10;
const int QUEUE_SIZE_SUB = 1;

auto t0 =ros::WallTime::now();

// global objects 
std::ofstream log_file;
pcl::PointCloud<pcl::PointXYZ>::Ptr infra_static_pc(new pcl::PointCloud<pcl::PointXYZ>());

fast_gicp::CompressDiff compressed_diff;

pcl::octree::OctreePointCloudChangeDetector<pcl::PointXYZ> octree_change_add(resolution);

// Function prototypes
int Sanity_Check(ros::NodeHandle nh);
bool Read_Point_Cloud(const std::string path_to_file, pcl::PointCloud<pcl::PointXYZ>::Ptr cloud);
void Point_Cloud_Callback(boost::shared_ptr<pcl::PointCloud<pcl::PointXYZ>> pc_msg);
bool Subscribe_To_PC_Topic(ros::NodeHandle *nh, const std::string pc_topic);
void Advertise_PC_Topic(ros::NodeHandle *nh_ptr, std::string, ros::Publisher *pub_ptr, int frequency);
void Advertise_String_Topic(ros::NodeHandle *nh_ptr, std::string, ros::Publisher *pub_ptr, int frequency);
void Publish_Cloud(ros::Publisher *pc_pub, int frame_number, pcl::PointCloud<pcl::PointXYZ>::Ptr input_cloud);
void Publish_String(ros::Publisher *pc_pub, int frame_number,fast_gicp::CompressDiff data);
void initialize_octree (pcl::octree::OctreePointCloudChangeDetector<pcl::PointXYZ>& octree_change_add );
std::vector<int> octree_change (pcl::octree::OctreePointCloudChangeDetector<pcl::PointXYZ>& octree_change_add,  pcl::PointCloud<pcl::PointXYZ>::Ptr pc );


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


  if (append=="t") {
    log_file.open(output_path+"/log_time_infra.csv" , std::ios::app);
  }
  else{
    log_file.open(output_path+ "/log_time_infra.csv" );
    log_file << "frame_number" << "," << "no of points in diff"<< ","  << "compressed diff size(bytes)"<< "," << "Latency_pass"<< "," << "Latency_diff" << "," << "Latency_compression" << std::endl;
  }


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


  octree_change_add.setResolution(resolution);
  initialize_octree(octree_change_add);
     
  // 1.4 Advertise point cloud topics 
  std::cout << "Advertising 'infra point cloud topic 2' and 'diff compress topic' " << std::endl;
  Advertise_PC_Topic(&nh, diff_pc_topic, &diff_pc_pub, QUEUE_SIZE_PUB);
  Advertise_PC_Topic(&nh, infra_pc_topic_2, &infra_pc_pub, QUEUE_SIZE_PUB);
  Advertise_String_Topic(&nh, diff_compress_topic, &diff_compress_pub, QUEUE_SIZE_PUB);


  //// 2. Main Loop /////
  std::cout << "Subscribing to point cloud topic: " << infra_pc_topic << std::endl;
  pc_sub = nh.subscribe(infra_pc_topic, QUEUE_SIZE_SUB, Point_Cloud_Callback);
  std::cout << "Going into ros::spin() ..." << std::endl;
  ros::spin();

  return 0;
}



int Sanity_Check(ros::NodeHandle n_h) {

  if(n_h.getParam("dataset_path", dataset_path))
    std::cout << "dataset_path : " << dataset_path << std::endl;
  else {
    std::cout << "dataset_path parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("dataset_name", dataset_name))
    std::cout << "dataset_name : " << dataset_name << std::endl;
  else {
    std::cout << "dataset_name parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/data_mode", data_mode))
    std::cout << "data mode : " << data_mode << std::endl;
  else {
    std::cout << "/data_mode parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/octress_change_res", resolution))
    std::cout << "octress change resolution : " << resolution << std::endl;
  else {
    std::cout << "/octress_change_res parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("append", append))
    std::cout << "append : " << append << std::endl;
  else {
    std::cout << "append parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/infra_static_pc_path", infra_static_pc_path))
    std::cout << "infra static pc path : " << infra_static_pc_path << std::endl;
  else {
    std::cout << "infra static pc path : " << infra_static_pc_path << std::endl;
    std::cout << "/infra_static_pc_path parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/infra_pc_topic", infra_pc_topic))
    std::cout << "infra_pc_topic: " << infra_pc_topic << std::endl;
  else {
    std::cout << "/infra_pc_topic parameter not set" << std::endl;
    return -1;
  }
  
    if(n_h.getParam("/infra_pc_topic_2", infra_pc_topic_2))
    std::cout << "infra_pc_topic_2: " << infra_pc_topic_2 << std::endl;
  else {
    std::cout << "/infra_pc_topic_2 parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/diff_pc_topic", diff_pc_topic))
    std::cout << "Diff point cloud topic: " << diff_pc_topic << std::endl;
  else {
    std::cout << "/diff_pc_topic parameter not set" << std::endl;
    return -1;
  }

  if(n_h.getParam("/diff_compress_topic", diff_compress_topic))
    std::cout << "diff compress topic: " << diff_compress_topic << std::endl;
  else {
    std::cout << "/diff_compress_topic parameter not set" << std::endl;
    return -1;
  }
  // All good otherwise
  return 0;
}

bool Read_Point_Cloud(const std::string path_to_file, pcl::PointCloud<pcl::PointXYZ>::Ptr cloud) {
  std::cout << "Reading: " << path_to_file << std::endl << std::flush;
  if(pcl::io::loadPCDFile<pcl::PointXYZ>(path_to_file, *cloud) == -1)  //* load the file
    return false;
  else
    return true;
}

void Point_Cloud_Callback(boost::shared_ptr<pcl::PointCloud<pcl::PointXYZ>> msg) {

  auto t1 = ros::WallTime::now();

  static int pc_counter = 0;
  pcl::PointCloud<pcl::PointXYZ>::Ptr input_cloud = msg->makeShared();
  pcl::PointCloud<pcl::PointXYZ>::Ptr diff (new pcl::PointCloud<pcl::PointXYZ>());
  
  if (data_mode == "real"){
    pcl::PassThrough<pcl::PointXYZ> pass;
    pass.setInputCloud(input_cloud);
    pass.setFilterFieldName("z");
    pass.setFilterLimits(0.0,0.0);
    pass.setNegative(true);
    pass.filter(*input_cloud);
  }

  auto t2 = ros::WallTime::now();
  
  std::vector<int> newPointIdxVector_add;
  pcl::ExtractIndices<pcl::PointXYZ> extract;
  pcl::PointIndices::Ptr inliers (new pcl::PointIndices ());
  octree_change_add.setInputCloud (input_cloud);
  octree_change_add.addPointsFromInputCloud ();
  octree_change_add.getPointIndicesFromNewVoxels (newPointIdxVector_add);
  octree_change_add.deleteCurrentBuffer();
  inliers->indices = newPointIdxVector_add;
  extract.setInputCloud (input_cloud);
  extract.setIndices (inliers);
  extract.setNegative (false);
  extract.filter (*diff);

  auto t3 = ros::WallTime::now();

  std::stringstream compressedData;
  pcl::io::OctreePointCloudCompression<pcl::PointXYZ> octree_compression (pcl::io::MANUAL_CONFIGURATION,false, 0.001, 0.1, false, 1, false, 8);
  octree_compression.encodePointCloud(diff, compressedData);
  compressed_diff.data = compressedData.str();

  auto t4 = ros::WallTime::now();

  Publish_String(&diff_compress_pub, pc_counter++, compressed_diff);
  //Publish_Cloud(&infra_pc_pub, pc_counter, input_cloud);
  //Publish_Cloud(&diff_pc_pub, pc_counter, diff);

  octree_change_add.switchBuffers ();
  initialize_octree(octree_change_add);

  compressedData.seekp(0, std::ios::end);
  int size = compressedData.tellp();

  auto duration_pass = (t2 - t1).toSec()* 1000 ;
  auto duration_diff = (t3 - t2).toSec() *1000 ;
  auto duration_compress = (t4 - t3).toSec() *1000 ;
  
  log_file << pc_counter << "," <<  diff->size() <<  "," << size << "," << duration_pass << ","<< duration_diff <<"," << duration_compress << std::endl;

}


void Advertise_PC_Topic(ros::NodeHandle *nh_ptr, std::string pc_topic, ros::Publisher *pub_ptr, int queue_size) {
  // Advertise topics
  *pub_ptr = nh_ptr->advertise<sensor_msgs::PointCloud2>(pc_topic, queue_size);
  std::cout << "Advertised: " << pc_topic << " with queue size " << queue_size  << std::endl;
  return;
}

void Advertise_String_Topic(ros::NodeHandle *nh_ptr, std::string topic, ros::Publisher *pub_ptr, int queue_size) {
  // Advertise topics
  *pub_ptr = nh_ptr->advertise<fast_gicp::CompressDiff>(topic, queue_size);
  std::cout << "Advertised: " << topic << " with queue size " << queue_size  << std::endl;
  return;
}


void Publish_Cloud(ros::Publisher *pc_pub, int frame_number, pcl::PointCloud<pcl::PointXYZ>::Ptr input_cloud) {

  pcl::PCLPointCloud2::Ptr input_cloud_pc2(new pcl::PCLPointCloud2);
  pcl::toPCLPointCloud2(*input_cloud, *input_cloud_pc2);
  input_cloud_pc2->header.frame_id = "os_sensor";
  
  auto t = ros::WallTime::now();
  std::cout<< t << std::endl;
  auto t1 = ros::Time::now();
  t1.sec = t.sec;
  t1.nsec = t.nsec;
  pcl_conversions::toPCL(t1, input_cloud_pc2->header.stamp);
  pc_pub->publish(*input_cloud_pc2);
}

void Publish_String(ros::Publisher *pc_pub, int frame_number, fast_gicp::CompressDiff data) {
	//data.header.frame_id = "os_sensor";
	data.header.frame_id = std::to_string(frame_number);
	auto t = ros::WallTime::now();
	data.header.stamp.sec = t.sec;
	data.header.stamp.nsec = t.nsec;
	pc_pub->publish(data);
}


void initialize_octree (pcl::octree::OctreePointCloudChangeDetector<pcl::PointXYZ>& octree_change_add )
{
  octree_change_add.setInputCloud (infra_static_pc);
  octree_change_add.addPointsFromInputCloud ();
  octree_change_add.switchBuffers ();
}

std::vector<int> octree_change (pcl::octree::OctreePointCloudChangeDetector<pcl::PointXYZ>& octree_change_add,  pcl::PointCloud<pcl::PointXYZ>::Ptr pc )
{
    std::vector<int> newPointIdxVector_add;
    octree_change_add.setInputCloud (pc);
    octree_change_add.addPointsFromInputCloud ();
    octree_change_add.getPointIndicesFromNewVoxels (newPointIdxVector_add);
    octree_change_add.deleteCurrentBuffer();

    return newPointIdxVector_add;
}


//////////////////////////////////////////////////////////////////////////////
