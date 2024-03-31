#!/bin/bash

dataset_path="$(rosparam get dataset_path)"
dataset_name="$(rosparam get dataset_name)"
rosbag play $dataset_path/$dataset_name/vehicle.bag /ouster/points:=/vrf/vehicle_points --pause
