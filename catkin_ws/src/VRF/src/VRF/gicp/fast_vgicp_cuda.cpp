#include <VRF/gicp/fast_vgicp_cuda.hpp>
#include <VRF/gicp/impl/fast_vgicp_cuda_impl.hpp>

template class VRF::FastVGICPCuda<pcl::PointXYZ, pcl::PointXYZ>;
template class VRF::FastVGICPCuda<pcl::PointXYZI, pcl::PointXYZI>;
template class VRF::FastVGICPCuda<pcl::PointNormal, pcl::PointNormal>;
