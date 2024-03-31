; Auto-generated. Do not edit!


(cl:in-package fast_gicp-msg)


;//! \htmlinclude CompressDiff.msg.html

(cl:defclass <CompressDiff> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type cl:string
    :initform ""))
)

(cl:defclass CompressDiff (<CompressDiff>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CompressDiff>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CompressDiff)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fast_gicp-msg:<CompressDiff> is deprecated: use fast_gicp-msg:CompressDiff instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CompressDiff>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fast_gicp-msg:header-val is deprecated.  Use fast_gicp-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <CompressDiff>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fast_gicp-msg:data-val is deprecated.  Use fast_gicp-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CompressDiff>) ostream)
  "Serializes a message object of type '<CompressDiff>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CompressDiff>) istream)
  "Deserializes a message object of type '<CompressDiff>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CompressDiff>)))
  "Returns string type for a message object of type '<CompressDiff>"
  "fast_gicp/CompressDiff")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CompressDiff)))
  "Returns string type for a message object of type 'CompressDiff"
  "fast_gicp/CompressDiff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CompressDiff>)))
  "Returns md5sum for a message object of type '<CompressDiff>"
  "c99a9440709e4d4a9716d55b8270d5e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CompressDiff)))
  "Returns md5sum for a message object of type 'CompressDiff"
  "c99a9440709e4d4a9716d55b8270d5e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CompressDiff>)))
  "Returns full string definition for message of type '<CompressDiff>"
  (cl:format cl:nil "Header header~%string data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CompressDiff)))
  "Returns full string definition for message of type 'CompressDiff"
  (cl:format cl:nil "Header header~%string data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CompressDiff>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CompressDiff>))
  "Converts a ROS message object to a list"
  (cl:list 'CompressDiff
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))
