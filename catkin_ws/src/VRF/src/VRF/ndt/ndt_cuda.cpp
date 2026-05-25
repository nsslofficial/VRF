#include <VRF/ndt/ndt_cuda.hpp>
#include <VRF/ndt/impl/ndt_cuda_impl.hpp>

template class VRF::NDTCuda<pcl::PointXYZ, pcl::PointXYZ>;
template class VRF::NDTCuda<pcl::PointXYZI, pcl::PointXYZI>;
template class VRF::NDTCuda<pcl::PointNormal, pcl::PointNormal>;
