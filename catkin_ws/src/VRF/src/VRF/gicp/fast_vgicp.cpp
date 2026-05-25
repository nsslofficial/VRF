#include <VRF/gicp/fast_vgicp.hpp>
#include <VRF/gicp/impl/fast_vgicp_impl.hpp>

template class VRF::FastVGICP<pcl::PointXYZ, pcl::PointXYZ>;
template class VRF::FastVGICP<pcl::PointXYZI, pcl::PointXYZI>;
template class VRF::FastVGICP<pcl::PointNormal, pcl::PointNormal>;
