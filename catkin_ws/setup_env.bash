#!/bin/bash

#### Common parameters

# Load packages
source devel/setup.bash

#### Dataset parameters


# Set the mode of dataset [carla, usc, rit]
rosparam set /data_mode rit

# set path of dataset
dataset_path="/dataset/rit_data_accuracy"
dataset_name="D6"
append="f" # true(t) or false(f)
basemap_path="$dataset_path/$dataset_name/basemap.pcd"
infra_static_path="$dataset_path/$dataset_name/infra_static.pcd"
vehicle_initial_guess_path="$dataset_path/$dataset_name/V_W.txt"
infra_initial_guess_path="$dataset_path/$dataset_name/I_W.txt" 
vehicle_bag="$dataset_path/$dataset_name/vehicle.bag" 
infra_bag="$dataset_path/$dataset_name/infra.bag" 

#### ros parameters

rosparam set dataset_path $dataset_path
rosparam set dataset_name $dataset_name
rosparam set append $append

# set simulation time 
rosparam set use_sim_time false

# octree change resolution 
rosparam set /octress_change_res 0.9

# initial guess path
rosparam set /vehicle_initial_guess_path $vehicle_initial_guess_path
rosparam set /infra_initial_guess_path $infra_initial_guess_path

## Vehicle NDT alignment
# Inputs
rosparam set /map_path $basemap_path
rosparam set /vehicle_pc_topic /vrf/vehicle_points
# Outputs
rosparam set /aligned_pc_topic /vrf/ndt_vehicle_points
rosparam set /map_pc_topic /vrf/map_points
rosparam set /vehicle_transform_topic /vrf/transform

## Infra 
# Inputs
rosparam set /infra_static_pc_path $infra_static_path
rosparam set /infra_pc_topic /vrf/infra_points
rosparam set /infra_pc_topic_2 /vrf/infra_points_2
# Outputs
rosparam set /diff_pc_topic /vrf/diff_points
rosparam set /diff_compress_topic /vrf/diff_compress

## Vehicle Fusion  
rosparam set /infra_reconstructed_topic /vrf/infra_reconstructed_points
rosparam set /fused_pc_topic /vrf/fused_points
rosparam set /fused_pc_topic1 /vrf/fused_points1