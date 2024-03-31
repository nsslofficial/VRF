; Auto-generated. Do not edit!


(cl:in-package hdl_global_localization-srv)


;//! \htmlinclude SetGlobalMap-request.msg.html

(cl:defclass <SetGlobalMap-request> (roslisp-msg-protocol:ros-message)
  ((global_map
    :reader global_map
    :initarg :global_map
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass SetGlobalMap-request (<SetGlobalMap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetGlobalMap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetGlobalMap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hdl_global_localization-srv:<SetGlobalMap-request> is deprecated: use hdl_global_localization-srv:SetGlobalMap-request instead.")))

(cl:ensure-generic-function 'global_map-val :lambda-list '(m))
(cl:defmethod global_map-val ((m <SetGlobalMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_global_localization-srv:global_map-val is deprecated.  Use hdl_global_localization-srv:global_map instead.")
  (global_map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetGlobalMap-request>) ostream)
  "Serializes a message object of type '<SetGlobalMap-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'global_map) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetGlobalMap-request>) istream)
  "Deserializes a message object of type '<SetGlobalMap-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'global_map) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetGlobalMap-request>)))
  "Returns string type for a service object of type '<SetGlobalMap-request>"
  "hdl_global_localization/SetGlobalMapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGlobalMap-request)))
  "Returns string type for a service object of type 'SetGlobalMap-request"
  "hdl_global_localization/SetGlobalMapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetGlobalMap-request>)))
  "Returns md5sum for a message object of type '<SetGlobalMap-request>"
  "5ed403eb1abbaa077410b645f248da4e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetGlobalMap-request)))
  "Returns md5sum for a message object of type 'SetGlobalMap-request"
  "5ed403eb1abbaa077410b645f248da4e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetGlobalMap-request>)))
  "Returns full string definition for message of type '<SetGlobalMap-request>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 global_map~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetGlobalMap-request)))
  "Returns full string definition for message of type 'SetGlobalMap-request"
  (cl:format cl:nil "sensor_msgs/PointCloud2 global_map~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetGlobalMap-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'global_map))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetGlobalMap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetGlobalMap-request
    (cl:cons ':global_map (global_map msg))
))
;//! \htmlinclude SetGlobalMap-response.msg.html

(cl:defclass <SetGlobalMap-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetGlobalMap-response (<SetGlobalMap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetGlobalMap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetGlobalMap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hdl_global_localization-srv:<SetGlobalMap-response> is deprecated: use hdl_global_localization-srv:SetGlobalMap-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetGlobalMap-response>) ostream)
  "Serializes a message object of type '<SetGlobalMap-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetGlobalMap-response>) istream)
  "Deserializes a message object of type '<SetGlobalMap-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetGlobalMap-response>)))
  "Returns string type for a service object of type '<SetGlobalMap-response>"
  "hdl_global_localization/SetGlobalMapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGlobalMap-response)))
  "Returns string type for a service object of type 'SetGlobalMap-response"
  "hdl_global_localization/SetGlobalMapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetGlobalMap-response>)))
  "Returns md5sum for a message object of type '<SetGlobalMap-response>"
  "5ed403eb1abbaa077410b645f248da4e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetGlobalMap-response)))
  "Returns md5sum for a message object of type 'SetGlobalMap-response"
  "5ed403eb1abbaa077410b645f248da4e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetGlobalMap-response>)))
  "Returns full string definition for message of type '<SetGlobalMap-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetGlobalMap-response)))
  "Returns full string definition for message of type 'SetGlobalMap-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetGlobalMap-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetGlobalMap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetGlobalMap-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetGlobalMap)))
  'SetGlobalMap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetGlobalMap)))
  'SetGlobalMap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGlobalMap)))
  "Returns string type for a service object of type '<SetGlobalMap>"
  "hdl_global_localization/SetGlobalMap")