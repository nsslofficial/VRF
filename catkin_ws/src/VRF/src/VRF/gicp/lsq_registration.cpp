#include <VRF/gicp/lsq_registration.hpp>
#include <VRF/gicp/impl/lsq_registration_impl.hpp>

template class VRF::LsqRegistration<pcl::PointXYZ, pcl::PointXYZ>;
template class VRF::LsqRegistration<pcl::PointXYZI, pcl::PointXYZI>;
template class VRF::LsqRegistration<pcl::PointNormal, pcl::PointNormal>;
