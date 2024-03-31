// Generated by gencpp from file hdl_global_localization/QueryGlobalLocalizationRequest.msg
// DO NOT EDIT!


#ifndef HDL_GLOBAL_LOCALIZATION_MESSAGE_QUERYGLOBALLOCALIZATIONREQUEST_H
#define HDL_GLOBAL_LOCALIZATION_MESSAGE_QUERYGLOBALLOCALIZATIONREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sensor_msgs/PointCloud2.h>

namespace hdl_global_localization
{
template <class ContainerAllocator>
struct QueryGlobalLocalizationRequest_
{
  typedef QueryGlobalLocalizationRequest_<ContainerAllocator> Type;

  QueryGlobalLocalizationRequest_()
    : max_num_candidates(0)
    , cloud()  {
    }
  QueryGlobalLocalizationRequest_(const ContainerAllocator& _alloc)
    : max_num_candidates(0)
    , cloud(_alloc)  {
  (void)_alloc;
    }



   typedef int64_t _max_num_candidates_type;
  _max_num_candidates_type max_num_candidates;

   typedef  ::sensor_msgs::PointCloud2_<ContainerAllocator>  _cloud_type;
  _cloud_type cloud;





  typedef boost::shared_ptr< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> const> ConstPtr;

}; // struct QueryGlobalLocalizationRequest_

typedef ::hdl_global_localization::QueryGlobalLocalizationRequest_<std::allocator<void> > QueryGlobalLocalizationRequest;

typedef boost::shared_ptr< ::hdl_global_localization::QueryGlobalLocalizationRequest > QueryGlobalLocalizationRequestPtr;
typedef boost::shared_ptr< ::hdl_global_localization::QueryGlobalLocalizationRequest const> QueryGlobalLocalizationRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator1> & lhs, const ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator2> & rhs)
{
  return lhs.max_num_candidates == rhs.max_num_candidates &&
    lhs.cloud == rhs.cloud;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator1> & lhs, const ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace hdl_global_localization

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0802ea456537ff7eae03a65bc7019e2c";
  }

  static const char* value(const ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0802ea456537ff7eULL;
  static const uint64_t static_value2 = 0xae03a65bc7019e2cULL;
};

template<class ContainerAllocator>
struct DataType< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hdl_global_localization/QueryGlobalLocalizationRequest";
  }

  static const char* value(const ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 max_num_candidates\n"
"sensor_msgs/PointCloud2 cloud\n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/PointCloud2\n"
"# This message holds a collection of N-dimensional points, which may\n"
"# contain additional information such as normals, intensity, etc. The\n"
"# point data is stored as a binary blob, its layout described by the\n"
"# contents of the \"fields\" array.\n"
"\n"
"# The point cloud data may be organized 2d (image-like) or 1d\n"
"# (unordered). Point clouds organized as 2d images may be produced by\n"
"# camera depth sensors such as stereo or time-of-flight.\n"
"\n"
"# Time of sensor data acquisition, and the coordinate frame ID (for 3d\n"
"# points).\n"
"Header header\n"
"\n"
"# 2D structure of the point cloud. If the cloud is unordered, height is\n"
"# 1 and width is the length of the point cloud.\n"
"uint32 height\n"
"uint32 width\n"
"\n"
"# Describes the channels and their layout in the binary data blob.\n"
"PointField[] fields\n"
"\n"
"bool    is_bigendian # Is this data bigendian?\n"
"uint32  point_step   # Length of a point in bytes\n"
"uint32  row_step     # Length of a row in bytes\n"
"uint8[] data         # Actual point data, size is (row_step*height)\n"
"\n"
"bool is_dense        # True if there are no invalid points\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/PointField\n"
"# This message holds the description of one point entry in the\n"
"# PointCloud2 message format.\n"
"uint8 INT8    = 1\n"
"uint8 UINT8   = 2\n"
"uint8 INT16   = 3\n"
"uint8 UINT16  = 4\n"
"uint8 INT32   = 5\n"
"uint8 UINT32  = 6\n"
"uint8 FLOAT32 = 7\n"
"uint8 FLOAT64 = 8\n"
"\n"
"string name      # Name of field\n"
"uint32 offset    # Offset from start of point struct\n"
"uint8  datatype  # Datatype enumeration, see above\n"
"uint32 count     # How many elements in the field\n"
;
  }

  static const char* value(const ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.max_num_candidates);
      stream.next(m.cloud);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct QueryGlobalLocalizationRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hdl_global_localization::QueryGlobalLocalizationRequest_<ContainerAllocator>& v)
  {
    s << indent << "max_num_candidates: ";
    Printer<int64_t>::stream(s, indent + "  ", v.max_num_candidates);
    s << indent << "cloud: ";
    s << std::endl;
    Printer< ::sensor_msgs::PointCloud2_<ContainerAllocator> >::stream(s, indent + "  ", v.cloud);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HDL_GLOBAL_LOCALIZATION_MESSAGE_QUERYGLOBALLOCALIZATIONREQUEST_H
