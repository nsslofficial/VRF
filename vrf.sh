#!/bin/bash

VRF_path=/home/ali/workspace/VRF

# Function to open GNOME Terminal with tabs
open_gnome_terminal() {
    # Open new GNOME Terminal with tabs
    
    gnome-terminal --window \
    --tab --title="vrf_infra" -e "bash -c '
    docker exec -it vrf bash -c \"
    cd workspace/catkin_ws
    source setup_env.bash
    rosrun VRF infrastructure_node_3
    \"
    $SHELL'" \
    --tab --title="vrf_ndt" -e "bash -c '
    docker exec -it vrf bash -c \"
    cd workspace/catkin_ws
    source setup_env.bash
    rosrun VRF vehicle_localization_node_5
    \"
    $SHELL'" \
    --tab --title="vrf_fusion" -e "bash -c '
    docker exec -it vrf bash -c \"
    cd workspace/catkin_ws
    source setup_env.bash
    rosrun VRF Fusion_node_5
    \"
    $SHELL'" \
    --tab --title="vrf_vehicle_bag" -e "bash -c '
    docker exec -it vrf bash -c \"
    cd workspace/catkin_ws
    source setup_env.bash
    ./vehicle.sh
    \"
    $SHELL'" \
    --tab --title="vrf_infra_bag" -e "bash -c '
    docker exec -it vrf bash -c \"
    cd workspace/catkin_ws
    source setup_env.bash
    ./infra.sh
    \"
    $SHELL'"
}

open_gnome_terminal

