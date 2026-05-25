#include <VRF/gicp/VRF_st.hpp>
#include <VRF/gicp/impl/VRF_st_impl.hpp>

template class VRF::FastGICPSingleThread<pcl::PointXYZ, pcl::PointXYZ>;
template class VRF::FastGICPSingleThread<pcl::PointXYZI, pcl::PointXYZI>;
template class VRF::FastGICPSingleThread<pcl::PointNormal, pcl::PointNormal>;
