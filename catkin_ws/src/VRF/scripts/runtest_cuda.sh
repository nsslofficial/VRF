#!/bin/bash
docker build --tag focal_cuda -f docker/focal_cuda/Dockerfile .
docker run --gpus all -it --rm focal_cuda /root/VRF/build/gicp_test /root/VRF/data
