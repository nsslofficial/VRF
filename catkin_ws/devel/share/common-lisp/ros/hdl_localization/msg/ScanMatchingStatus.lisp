; Auto-generated. Do not edit!


(cl:in-package hdl_localization-msg)


;//! \htmlinclude ScanMatchingStatus.msg.html

(cl:defclass <ScanMatchingStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (has_converged
    :reader has_converged
    :initarg :has_converged
    :type cl:boolean
    :initform cl:nil)
   (matching_error
    :reader matching_error
    :initarg :matching_error
    :type cl:float
    :initform 0.0)
   (inlier_fraction
    :reader inlier_fraction
    :initarg :inlier_fraction
    :type cl:float
    :initform 0.0)
   (relative_pose
    :reader relative_pose
    :initarg :relative_pose
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform))
   (prediction_labels
    :reader prediction_labels
    :initarg :prediction_labels
    :type (cl:vector std_msgs-msg:String)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:String :initial-element (cl:make-instance 'std_msgs-msg:String)))
   (prediction_errors
    :reader prediction_errors
    :initarg :prediction_errors
    :type (cl:vector geometry_msgs-msg:Transform)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Transform :initial-element (cl:make-instance 'geometry_msgs-msg:Transform))))
)

(cl:defclass ScanMatchingStatus (<ScanMatchingStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ScanMatchingStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ScanMatchingStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hdl_localization-msg:<ScanMatchingStatus> is deprecated: use hdl_localization-msg:ScanMatchingStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_localization-msg:header-val is deprecated.  Use hdl_localization-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'has_converged-val :lambda-list '(m))
(cl:defmethod has_converged-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_localization-msg:has_converged-val is deprecated.  Use hdl_localization-msg:has_converged instead.")
  (has_converged m))

(cl:ensure-generic-function 'matching_error-val :lambda-list '(m))
(cl:defmethod matching_error-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_localization-msg:matching_error-val is deprecated.  Use hdl_localization-msg:matching_error instead.")
  (matching_error m))

(cl:ensure-generic-function 'inlier_fraction-val :lambda-list '(m))
(cl:defmethod inlier_fraction-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_localization-msg:inlier_fraction-val is deprecated.  Use hdl_localization-msg:inlier_fraction instead.")
  (inlier_fraction m))

(cl:ensure-generic-function 'relative_pose-val :lambda-list '(m))
(cl:defmethod relative_pose-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_localization-msg:relative_pose-val is deprecated.  Use hdl_localization-msg:relative_pose instead.")
  (relative_pose m))

(cl:ensure-generic-function 'prediction_labels-val :lambda-list '(m))
(cl:defmethod prediction_labels-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_localization-msg:prediction_labels-val is deprecated.  Use hdl_localization-msg:prediction_labels instead.")
  (prediction_labels m))

(cl:ensure-generic-function 'prediction_errors-val :lambda-list '(m))
(cl:defmethod prediction_errors-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_localization-msg:prediction_errors-val is deprecated.  Use hdl_localization-msg:prediction_errors instead.")
  (prediction_errors m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ScanMatchingStatus>) ostream)
  "Serializes a message object of type '<ScanMatchingStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'has_converged) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'matching_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'inlier_fraction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'relative_pose) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'prediction_labels))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'prediction_labels))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'prediction_errors))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'prediction_errors))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ScanMatchingStatus>) istream)
  "Deserializes a message object of type '<ScanMatchingStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'has_converged) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'matching_error) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'inlier_fraction) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'relative_pose) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'prediction_labels) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'prediction_labels)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:String))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'prediction_errors) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'prediction_errors)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Transform))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ScanMatchingStatus>)))
  "Returns string type for a message object of type '<ScanMatchingStatus>"
  "hdl_localization/ScanMatchingStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScanMatchingStatus)))
  "Returns string type for a message object of type 'ScanMatchingStatus"
  "hdl_localization/ScanMatchingStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ScanMatchingStatus>)))
  "Returns md5sum for a message object of type '<ScanMatchingStatus>"
  "9482ff8da7c52f631faa8ed74fbad0c2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ScanMatchingStatus)))
  "Returns md5sum for a message object of type 'ScanMatchingStatus"
  "9482ff8da7c52f631faa8ed74fbad0c2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ScanMatchingStatus>)))
  "Returns full string definition for message of type '<ScanMatchingStatus>"
  (cl:format cl:nil "Header header~%~%bool has_converged~%float32 matching_error~%float32 inlier_fraction~%geometry_msgs/Transform relative_pose~%~%std_msgs/String[] prediction_labels~%geometry_msgs/Transform[] prediction_errors~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ScanMatchingStatus)))
  "Returns full string definition for message of type 'ScanMatchingStatus"
  (cl:format cl:nil "Header header~%~%bool has_converged~%float32 matching_error~%float32 inlier_fraction~%geometry_msgs/Transform relative_pose~%~%std_msgs/String[] prediction_labels~%geometry_msgs/Transform[] prediction_errors~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ScanMatchingStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'relative_pose))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'prediction_labels) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'prediction_errors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ScanMatchingStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'ScanMatchingStatus
    (cl:cons ':header (header msg))
    (cl:cons ':has_converged (has_converged msg))
    (cl:cons ':matching_error (matching_error msg))
    (cl:cons ':inlier_fraction (inlier_fraction msg))
    (cl:cons ':relative_pose (relative_pose msg))
    (cl:cons ':prediction_labels (prediction_labels msg))
    (cl:cons ':prediction_errors (prediction_errors msg))
))
