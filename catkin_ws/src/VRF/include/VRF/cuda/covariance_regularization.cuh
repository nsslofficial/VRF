#ifndef VRF_CUDA_COVARIANCE_REGULARIZATION_CUH
#define VRF_CUDA_COVARIANCE_REGULARIZATION_CUH

#include <Eigen/Core>
#include <thrust/device_vector.h>
#include <VRF/gicp/gicp_settings.hpp>

namespace VRF {
namespace cuda {

void covariance_regularization(thrust::device_vector<Eigen::Vector3f>& means, thrust::device_vector<Eigen::Matrix3f>& covs, RegularizationMethod method);

}  // namespace cuda
}  // namespace VRF

#endif