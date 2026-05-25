#ifndef VRF_CUDA_BRUTE_FORCE_KNN_CUH
#define VRF_CUDA_BRUTE_FORCE_KNN_CUH

#include <Eigen/Core>

#include <thrust/device_vector.h>

namespace VRF {
  namespace cuda {

void brute_force_knn_search(const thrust::device_vector<Eigen::Vector3f>& source, const thrust::device_vector<Eigen::Vector3f>& target, int k, thrust::device_vector<thrust::pair<float, int>>& k_neighbors, bool do_sort=false);

  }
} // namespace VRF


#endif