# VRF: Vehicle Road-side Point Cloud Fusion

# Table of Contents
- [Environment Setup](#environment-setup)
- [Build Instructions](#build-instructions)
- [Dataset](#dataset)
- [Run Instructions](#run-instructions)
  
## Environment Setup
For this project, we will use a Docker container to containerize our code.

### Pre-requisties
This document assumes that you already have [Docker](https://docs.docker.com/engine/install/ubuntu/) and [NVIDIA-Docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) installed on your machine. 

### Docker Setup
Download the docker container for this project as follows:

```
docker pull alikhalid3110/ros_essentials:latest
```

To check if you have pulled the docker, run the following:

```
docker images
```

This should output all the dockers you have on your machine and it should contain ```alikhalid3110/ros_essentials:latest```. Now, that you have the docker, you can run it on your machine. We have a [script](run_vrf_docker.bash) for this which will let you mount folders (volumes) to the docker as well. It also sets up different parameters so that you can use GUI programs from within the docker. To use this script, you need to do the following. Open the [run_vrf_docker.bash](run_vrf_docker.bash) file and change lines 4 and 5 to reflect paths to where you keep your datasets and codebases. As you can see, I keep datasets in ```/home/ali/dataset/``` and my VRF code in ```/home/ali/workspace/VRF``. After you have made these changes, simply run the script to fire up the docker.

```
bash run_edge_assist_docker.bash
```

This will fire up the docker and you can interact with it using the current terminal window. If you want to attach another terminal to it, open a new terminal and type the following

```
docker exec -it vrf bash
```

This will open another terminal within the same docker.

If you are curious about the docker, it contains ROS (Robot Operating System), PCL (Point Cloud Library), ColMap and some of their dependencies.


## Build Instructions
This section explains how you can build the code that this repository contains. Again, the assumption is that you are running the ```alikhalid3110/ros_essentials:latest``` docker when you run the following commands. This repository uses the ROS build system (```catkin_make```). To build all the above modules, simply do the following.

1. First, run the ROS master. To do this, run  the following:

```
roscore &
```

2. After the output stops, press enter and you'll be back to the terminal. With that, we can now build all the tools mentioned above as.

```
cd /workspace/catkin_ws/
catkin_make
```

```catkin_make``` is the ROS build tool. It will build all tools in ```catkin_ws/src```.

## Dataset
Download the three datasets (carla, usc_data_accuracy, rit_data_accuracy) from this [link](todo), unzip them, and place in the dataset directory that you have mounted with docker container. A brief descriptoin of datasets is provided below:
1. **carla:** <br>
This dataset consist of three different datasets (Dataset_1, Dataset_2,Dataset_3), collected in varying traffic conditions. Each dataset further consists of five datasets (D1-D5).
2. **usc_data_accuracy** <br>
This dataset is refered in the paper as off-campus dataset and is a collection of five datasets (D1-D5).
3. **rit_data_accurcay** <br>
This dataset is refered in the paper as on-campus dataset and is a collection of six datasets (D1-D6).

## RUN Instructions
This section explains how to run the code and reproduce accuracy results mentioned in Table#3 and Table#9 in the paper. 

1. Download the datasets as explained [here](#dataset).
2. Open five teminals and run docker in all of them as explained in [docker setup](#docker-setup). After that run the following command in all the terminals:
```
cd workspace/carkin_ws
```
4. Run the ROS master. To do this, run the following command in any of the terminal:

```
roscore &
```
After the output stops, press enter and you'll be back to the terminal. 
4. Modify [setup_env.bash](catkin_ws/setup_env.bash) as explained [here](#setup-environment) for each dataset and then run the following commands: <br> 
**Terminal#1** 
```
source setup_env.bash
rosrun fast_gicp infra_3
```
**Terminal#2**
```
source setup_env.bash
rosrun fast_gicp vehicle_ndt_5
```
**Terminal#3**
```
source setup_env.bash
rosrun fast_gicp vehicle_fusion_5
```
**Terminal#4**
```
source setup_env.bash
rosrun ./vehicle
```
**Terminal#5**
```
source setup_env.bash
rosrun ./infra
```
5. Now press space to play bag in vehicle bag in terminal#4 and then in terminal#5 to play infrastructure(rsu) bag.
6. After the bags are stoped, stop process in the first 3  terminals using 'Ctrl+C'.
7. Update setup_env.bash and repeat the process for next dataset. 

## Setup Environment
In this section, we will explain how to configure [setup_env.bash](catkin_ws/setup_env.bash) for different datasets. You have to modify lines 12-17 for each dataset before running VRF.
1. ### **carla** 
  Modify the file as follow<br>
  
  a. **line#12:** <br>
  ```
  rosparam set /data_mode carla
  ```
  
  b. **line#15-16:**  <br>
  Modify these lines according to the name of dataset. For Dataset_1(D1) it will look like this:
  ```
  dataset_path="/dataset/Dataset_1"
  dataset_name="D1"
  ```
  
  c. **line#17:**  <br>
  Modify this line according to dataset_name value. <br>
  
  **For D1:**
  ```
  append="f" # true(t) or false(f)
  ```
  **For D2-D5:**
  ```
  append="t" # true(t) or false(f)
  ```
  #### Note
  For each dataset in carla, you have to run vrf in order. For examle run vrf for D1 first, then D2, and so on to D5. 
2. ### rit_data_accuracy




## Code Overview
This section explains how you can run the code that this repository contains. Again, the assumption is that you are running the ```alikhalid3110/ros_essentials:latest``` docker when you run the following commands.

### Submodules
This repository contains multiple tools that you will need to work with 3D LiDAR data. You can find most of these tools in ```catkin_ws/src/```. I will explain them briefly below.

1. ```catkin_ws/src/Ouster/``` contains a toolset to work with the Ouster LiDAR. You can find more information about this on the [Ouster Github page](https://github.com/ouster-lidar/ouster_example#example-ros-code).

2. ```catkin_ws/src/perception_pcl/``` contains hooks for linking the point cloud library (PCL) with the robot operating system (ROS). You can find more information about this on their [website](http://wiki.ros.org/perception_pcl)

3. ```catkin_ws/src/eaad/``` contains code that I have written through the course of my PhD (and afterwards) for working with LiDAR data.

4. ```catkin_ws/src/ndt_omp``` contains code to localize a pcd in a 3D map. In this project, we use it to localize a vehicle's pcd in a 3D map.

5. ```catkin_ws/src/fast_gicp``` contains the code for RAPID. 

## Recipes
### PCD Playback
This receipe demonstrates playing back a set of 3D point clouds (in ```.pcd``` format) from disk, publishing them over the ROS network, and visualizing them with RViz.

1. If you have followed the above steps, that means you have built the ```point_cloud_publisher``` node in the ```eaad``` workspace. If you have not build it yet, then you should follow the build instructions. 

2. Open the [setup_env.bash](catkin_ws/setup_env.bash) file in a text editor. Set the following variables in it: <br>
    * ```/pc_path```: should point to the folder containing your pcds. Remember, this is the path to the pcds __within__ your docker container.
    * ```/start_index```: assuming you are saving the pcds using their frame numbers, this should be the first number in your dataset.
    * ```/number_of_clouds```: the number of point clouds in your pcds folders.
    * ```/pc_topic_prefix```: the prefix of the ROS topic that you want to publish your point clouds on (if unsure, leave it as it is)
    * ```/pc_topic_suffix```: the suffix of the ROS topic that you want to publish your point clouds on (if unsure, leave it as it is)

3. Now, source the ```setup_env.bash``` file as:<br>
```
source setup_env.bash
```

4. With that done, now open RViz in a separate terminal (make sure the terminal is within your eaad container). In RViz: </br>
    * Press the add button in the bottom left corner, scroll down to PointCloud2 and add it.
    * Goto PointCloud2 in the left menu, goto Topic, and either write or select ```/ouster_lidar/points```
    * Then, goto Global Options (left side menu), and in that change Fixed Frame to ```os_sensor```
    * There are other visualization options under the PointCloud2 heading like size, style etc., which you can explore yourself.

5. With RViz ready, now we can start publishing 3D point clouds using our ```point_cloud_publisher``` node as follows. In a separate terminal (within the docker), run the following
```
source devel/setup.bash
rosrun eaad point_cloud_publisher
```

6. You should see point clouds being visualized in RViz. Take a closer look at the [point_cloud_publisher.cpp](catkin_ws/src/eaad/src/pc_publisher/src/point_cloud_publisher.cpp)

### PCD Stitching
This receipe demonstrates some basic code for stitching two point clouds (in ```.pcd``` format that reside on disk), running ICP over them,  publishing them over the ROS network, and visualizing them with RViz.

1. If you have followed the above steps, that means you have built the ```point_cloud_stitcher``` node in the ```eaad``` workspace. If you have not build it yet, then you should follow the build instructions. 

2. Open the [setup_env.bash](catkin_ws/setup_env.bash) file in a text editor. Set the following variables in it: <br>
    * ```/vehicle_point_cloud```: should point to the first point cloud that you want to stitch. This node expects the absolute path to the pcd __within__ your docker container.
    * ```/infra_point_cloud```: should point to the second point cloud.

3. Now, source the ```setup_env.bash``` file as:<br>
```
source setup_env.bash
```

4. With that done, now open RViz in a separate terminal (make sure the terminal is within your eaad container). In RViz: </br>
    * Press the add button in the bottom left corner, scroll down to PointCloud2 and add it. You will need to add 3 PointCloud2 objects
    * Goto PointCloud2 in the left menu, goto Topic, and either write or select ```/vehicle/points```. In the other PointCloud2 objects, use the following topics ```/infra/points```, and ```/aligned_vehicle/points```.
    * For each of these point clouds, make sure you change the color of the point cloud by playing around with options like color transformer, color and point size etc.
    * Then, goto Global Options (left side menu), and in that change Fixed Frame to ```os_sensor```

5. With RViz ready, now we can start to stitch and publish 3D point clouds using our ```point_cloud_stitcher``` node as follows. In a separate terminal (within the docker), run the following
```
source devel/setup.bash
rosrun eaad point_cloud_stitcher
```

6. You should see three point clouds being visualized in RViz. Take a closer look at the [stitching_node.cpp](catkin_ws/src/eaad/src/pc_publisher/src/stitching_node.cpp)

### Raw point clouds (pcds) and IMU (csv) to a Rosbag
1. Make sure you have build the Ouster toolset as described above. Then, source the eaad Ouster environment as follows:

```
source catkin_ws/devel/setup.bash
```

2. Edit the the ```catkin_ws/setup_env.bash``` file and set ```pc_path_1```, ```imu_path```, ```imu_freq```, and ```imu_topic```. ```pc_path_1``` points to the directory containing the pcds, ```imu_path``` points to the IMU csv file, ```imu_freq``` is the frequency of the IMU, and ```imu_topic``` is the topic on which you want to broadcast IMU messages.

3. After that, open a rosbag and start as recording as follows:

```
rosbag record /ouster/points /ouster/imu -O <path_to_save_bag_file.bag>
```

4. In another terminal (on the same docker, and after you have sourced the workspace (Step 1)), run the ```eaad pc_imu_publisher``` rosnode.

```
rosrun eaad pc_imu_publisher
```

5. The rosbag will record the published data.

### Raw Ouster Data to PointCloud2 Rosbag
1. Make sure you have build the Ouster toolset as described above. Then, the Ouster environment as follows:

```
source catkin_ws/devel/setup.bash
```

2. Then, open a rosbag and start recording as follows:

```
rosbag record /ouster/points /ouster/imu -O <path_to_bag_file.bag>
```

3. In another terminal (on the same docker, and after you have sourced the workspace (Step 1)), you can start playing the raw Ouster rosbag as follows.

```
roslaunch ouster_ros replay.launch metadata:=<absolute_path_to_metadata.json> bag_file:=<absolute_path_to_raw_bag_file.bag>
```

4. Once the entire bag has been replayed (from Step 3), you can stop the rosbag record (Ctrl+C) in the record terminal (Step 2). At this point, you should have a rosbag with two topics ```/ouster/points``` and ```/ouster/imu```.

### PointCloud2 Rosbag to PCDs
1. First, create a folder in which you want to save the pcds
```
mkdir ./pcds
```

2. Then, run the ROS node ```bag_to_pcd``` from ```pcl_ros`` as follows
```
rosrun pcl_ros bag_to_pcd ./converted_bag_file_name.bag /ouster/points ./pcds

```

3. These will be saved in ```pcds/``` named as their timestamps. If you want to rename, a good starting script would be ```/python/rename_pointclouds.py```

### Rewrite Rosbag with Message Header Timestamps
This script ```catkin_ws/src/eaad/src/pc_publisher/src/rewrite_rosbag_timestamps.py``` will reorganize a rosbag and index it with timestamps that it extracts from messages within that rosbag.

Usage is as follows:

```
python3 rewrite_rosbag_timestamps.py input.bag output.bag

```

### PCD Localization with NDT
This recipe demonstrates how to align two PCDs. More specifically, for this repository, it demonstrates how to localize vehicle point clouds in a pre-generated 3D map.

1. The following instructions assume that you have already run ```catkin_make``` and built all the tools in this repository.

2. Goto ```catkin_ws/setup_env.bash``` and edit the following fields:
    - ```/map_path```: Path to the 3D map file (this should be a pcd). NDT will localize vehicle pcds in this map file.
    - ```/point_cloud_topic```: This is the topic on which the vehicle pcds will be played. If you are using default ouster bags, this should be ```/ouster/points```.
    - ```/aligned_pc_topic```: This is the topic on which you want to publish the pcds that NDT localizes in the 3D map. You will need this for visualization in rviz and if you want some downstream module to operate on the localized point clouds.
    - ```/map_pc_topic```: This is the topic on which you want to publish the map. The map does not change and the only purpose (so far) is to visualize it in Rviz.

3. Run the following ```ndt_omp align``` node in a terminal
```
rosrun ndt_omp align
```

4. Play the rosbag containing the vehicle pcds. We keep the rosbag play rate at 0.5x to ensure NDT has enough time to process each pcd. 
```
rosbag play <vehicle_pcd_bag>.bag --rate=0.5
```

4. Todo: Add default config for Rviz    

### Static PCD Transformation
This recipe demonstrates how to transform every point cloud in a Rosbag with the same transformation matrix and then publish it.

1. The following instructions assume that you have already run ```catkin_make``` and built all the tools in this repository.

2. Goto ```catkin_ws/setup_env.bash``` and edit the following fields:
    - ```/input_infra_pcd_topic```: Point cloud topic on which input infrastructure point clouds will be broadcasted, and so the topic we subscribe to. 
    - ```/output_infra_pcd_topic```: Point cloud topic on which we will output the transformed infrastructure point clouds.

3. Run the ```eaad pcd_transformer``` node in a terminal
```
rosrun eaad pcd_transformer
```

4. Todo: Add default config for Rviz


### Rapid
The code for rapid is avaible in ```catkin_make/src/fast_gicp/src```. If you want to add new executable in this folder, you can modify ```catkin_make/src/fast_gicp/CMakeList.txt```. Ideally RAPID requries two PCs connected over a network (wifi router / ethernet) to run, but you can run it on a single machine also. If you run it on a single machine, you wont be able to observe the effect of network on RAPID. 

#### Runing on single machine 
1. run ros master       
```roscore &```
and press space. 
2. source the environment variables. Before sourcing, Set all the parameters ending with _path between the comments ```# parameters added by ali start``` and ```# parameters added by ali end```. Dont change the topics.
``` 
cd catkin_ws
source setup_env.bash 
```
3. run the follwing commands on seprate terminals. The 1 at the end of command indicates that logs file with be appended with new data, while 0 indicates that new log file will be created and previous data in log file will be deleted
```
rosrun fast_gicp infra_3 0
rosrun fast_gicp vehicle_ndt_5 0
rosrun fast_gicp vehicle_fusion_5 0
rosbag play path_to_vehicle_rosbag /ouster/points:=/autopass/vehicle_points --pause 
rosbag play path_to_infra_rosbag /ouster/points:=/autopass/infra_points --pause 
```
The RAPID has five different pipelines. The above commands are for pipeline 5. If you want to run pipeline 1 to 4, modify the commands as follows
1. pipeline 1: replace infra_3 with infra_1, vehicle_ndt_5 with vehicle_ndt_1, vehicle_fusion_5 with vehicle_fusion_1
2. pipeline 2: replace infra_3 with infra_2, vehicle_ndt_5 with vehicle_ndt_1, vehicle_fusion_5 with vehicle_fusion_2
3. pipeline 3: replace infra_3 with infra_3, vehicle_ndt_5 with vehicle_ndt_1, vehicle_fusion_5 with vehicle_fusion_3
4. pipeline 4: replace infra_3 with infra_3, vehicle_ndt_5 with vehicle_ndt_1, vehicle_fusion_5 with vehicle_fusion_4

A brief discription of pipeline is as follows
1. pipeline 1: send raw pcds. ndt fom current frmae, icp with received infra pcd
2. pipeline 2: send raw pcds after compression. ndt fom current frmae, icp with received infra pcd after decompression
3. pipeline 3: send diff pcds after compression. ndt fom current frmae, icp with received diff pcd after decompression and reconsruction
4. pipeline 4: send diff pcds after compression. ndt fom current frmae, icp with infra reference pcd
5. pipeline 4: send diff pcds after compression. ndt fom previous frame with interpolation, icp with infra reference pcd

#### Runing on two machine 

In case of two machine, rosmaster runs on a single PC only. In this case it run on the PC which act as Vehicle. FOr the infra PC you need to inform it to use the rosmaster node that is running on vehicle PC. To do this you need the IP address of both the PCs. To do this follow the steps below:
1. run the docker container on both the PCs and then run ```ifconfig``` on both to get the IP addressess. Let the IP address of car and infra PC is ```192.168.50.4``` and ```192.168.50.196``` respectively.  
2. On vehicle PC run the following commands. 
```
export ROS_MASTER_URI=http://192.168.50.4:11311
export ROS_IP=192.168.50.4
```
3. On infra PC run the following commands. 
```
export ROS_MASTER_URI=http://192.168.50.4:11311
export ROS_IP=192.168.50.196
```
It is convenient to save thesee commnds as network_setup.bash file and then run ```source network_setup.bash```.

After doing this follow the steps below:
1. start the rosmaster node on vehicle PC using ```roscore &``` and press space. 

2. source the environment variables on both the PCs. Before sourcing, Set all the parameters ending with _path between the comments ```# parameters added by ali start``` and ```# parameters added by ali end```. Dont change the topics.
``` 
cd catkin_ws
source setup_env.bash 
```
3. run the follwing commands on seperate terminals on infra PC . The 1 at the end of command indicates that logs file with be appended with new data, while 0 indicates that new log file will be created and previous data in log file will be deleted
```
rosrun fast_gicp infra_3 0
rosbag play path_to_infra_rosbag /ouster/points:=/autopass/infra_points --pause 
```

4. run the follwing commands on seperate terminals on Vehicle PC . The 1 at the end of command indicates that logs file with be appended with new data, while 0 indicates that new log file will be created and previous data in log file will be deleted
```
rosrun fast_gicp vehicle_ndt_5 0
rosrun fast_gicp vehicle_fusion_5 0
rosbag play path_to_vehicle_rosbag /ouster/points:=/autopass/vehicle_points --pause  
```

5. Open the terminals with rosbag command on both the PCs and press spacebar simultaneously. 

#### Additional Alignment
- This module determines whether an additional per-frame alignment will help offline registration.RAPID forcast this offline by using data generated by LiDAR analytical model (More details [here](additional_alignment/synthetic_data/autopass_alignment/README.md)). Instead of offline calculation, it can be done online but it will increase the latency by 40 ms (More details [here](additional_alignment/carla_data)). 

#### Use Cases
This folder contain two folders. 
1. use_case_1 contains code to find the vehicle in fused and vehicle poiint cloud. It perform diff against base map and then do clustering to find number of vehilces. But the output of clustering is not good as it may break a sigle bus into two clusters. Therefore the results in paper are from manual inspection. 
2. use_case_2 contains the code to find the density of vehicle cloud and fused cloud. 


#### Python code
it contains code for ploting the results. 


#### data 
the data for RAPID (bags and resutls) can be found [here](https://drive.google.com/drive/folders/1xC33hptdkqPbshBnkEJWlFbo63cZS1pU?usp=drive_link). 


## Troubleshooting
### 1. Ouster RViz crashes on start
Ouster has a specific Ubuntu, and ROS version with which its toolset works. Make sure you are using the right versions. Confirm this on their Github or documentation page.

### 2. Ouster repaly does not publish anything on point cloud topics
For the USC dataset, we renamed the topics on which we publish point clouds. This can cause an issue because Ouster expects point clouds on a specific topic. Check the rosbag you are playing and see what topics the point clouds are saved on. For this, use:

```
rosbag info <rosbag.bag>
```

Check to see if these topics match what is contained in the launch files for Ouster.
