#include <VRF/gicp/VRF.hpp>
#include <VRF/gicp/impl/VRF_impl.hpp>

template class VRF::FastGICP<pcl::PointXYZ, pcl::PointXYZ>;
template class VRF::FastGICP<pcl::PointXYZI, pcl::PointXYZI>;
template class VRF::FastGICP<pcl::PointNormal, pcl::PointNormal>;
