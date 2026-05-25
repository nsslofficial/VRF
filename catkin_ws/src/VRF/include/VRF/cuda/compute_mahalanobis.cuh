#ifndef VRF_CUDA_COMPUTE_MAHALANOBIS_CUH
#define VRF_CUDA_COMPUTE_MAHALANOBIS_CUH

#include <Eigen/Core>
#include <Eigen/Geometry>
#include <thrust/device_vector.h>

#include <VRF/cuda/gaussian_voxelmap.cuh>

namespace VRF {
  namespace cuda {

void compute_mahalanobis(
  const thrust::device_vector<Eigen::Vector3f>& src_points,
  const thrust::device_vector<Eigen::Matrix3f>& src_covs,
  const GaussianVoxelMap& voxelmap,
  const thrust::device_vector<int>& voxel_correspondences,
  const Eigen::Isometry3f& linearized_x,
  thrust::device_vector<Eigen::Matrix3f>& mahalanobis
  );

  }
}  // namespace VRF

#endif