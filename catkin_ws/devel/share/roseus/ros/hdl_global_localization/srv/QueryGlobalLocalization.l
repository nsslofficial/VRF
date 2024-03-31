;; Auto-generated. Do not edit!


(when (boundp 'hdl_global_localization::QueryGlobalLocalization)
  (if (not (find-package "HDL_GLOBAL_LOCALIZATION"))
    (make-package "HDL_GLOBAL_LOCALIZATION"))
  (shadow 'QueryGlobalLocalization (find-package "HDL_GLOBAL_LOCALIZATION")))
(unless (find-package "HDL_GLOBAL_LOCALIZATION::QUERYGLOBALLOCALIZATION")
  (make-package "HDL_GLOBAL_LOCALIZATION::QUERYGLOBALLOCALIZATION"))
(unless (find-package "HDL_GLOBAL_LOCALIZATION::QUERYGLOBALLOCALIZATIONREQUEST")
  (make-package "HDL_GLOBAL_LOCALIZATION::QUERYGLOBALLOCALIZATIONREQUEST"))
(unless (find-package "HDL_GLOBAL_LOCALIZATION::QUERYGLOBALLOCALIZATIONRESPONSE")
  (make-package "HDL_GLOBAL_LOCALIZATION::QUERYGLOBALLOCALIZATIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass hdl_global_localization::QueryGlobalLocalizationRequest
  :super ros::object
  :slots (_max_num_candidates _cloud ))

(defmethod hdl_global_localization::QueryGlobalLocalizationRequest
  (:init
   (&key
    ((:max_num_candidates __max_num_candidates) 0)
    ((:cloud __cloud) (instance sensor_msgs::PointCloud2 :init))
    )
   (send-super :init)
   (setq _max_num_candidates (round __max_num_candidates))
   (setq _cloud __cloud)
   self)
  (:max_num_candidates
   (&optional __max_num_candidates)
   (if __max_num_candidates (setq _max_num_candidates __max_num_candidates)) _max_num_candidates)
  (:cloud
   (&rest __cloud)
   (if (keywordp (car __cloud))
       (send* _cloud __cloud)
     (progn
       (if __cloud (setq _cloud (car __cloud)))
       _cloud)))
  (:serialization-length
   ()
   (+
    ;; int64 _max_num_candidates
    8
    ;; sensor_msgs/PointCloud2 _cloud
    (send _cloud :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _max_num_candidates
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _max_num_candidates (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _max_num_candidates) (= (length (_max_num_candidates . bv)) 2)) ;; bignum
              (write-long (ash (elt (_max_num_candidates . bv) 0) 0) s)
              (write-long (ash (elt (_max_num_candidates . bv) 1) -1) s))
             ((and (class _max_num_candidates) (= (length (_max_num_candidates . bv)) 1)) ;; big1
              (write-long (elt (_max_num_candidates . bv) 0) s)
              (write-long (if (>= _max_num_candidates 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _max_num_candidates s)(write-long (if (>= _max_num_candidates 0) 0 #xffffffff) s)))
     ;; sensor_msgs/PointCloud2 _cloud
       (send _cloud :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _max_num_candidates
#+(or :alpha :irix6 :x86_64)
      (setf _max_num_candidates (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _max_num_candidates (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; sensor_msgs/PointCloud2 _cloud
     (send _cloud :deserialize buf ptr-) (incf ptr- (send _cloud :serialization-length))
   ;;
   self)
  )

(defclass hdl_global_localization::QueryGlobalLocalizationResponse
  :super ros::object
  :slots (_header _globalmap_header _inlier_fractions _errors _poses ))

(defmethod hdl_global_localization::QueryGlobalLocalizationResponse
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:globalmap_header __globalmap_header) (instance std_msgs::Header :init))
    ((:inlier_fractions __inlier_fractions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:errors __errors) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:poses __poses) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _globalmap_header __globalmap_header)
   (setq _inlier_fractions __inlier_fractions)
   (setq _errors __errors)
   (setq _poses __poses)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:globalmap_header
   (&rest __globalmap_header)
   (if (keywordp (car __globalmap_header))
       (send* _globalmap_header __globalmap_header)
     (progn
       (if __globalmap_header (setq _globalmap_header (car __globalmap_header)))
       _globalmap_header)))
  (:inlier_fractions
   (&optional __inlier_fractions)
   (if __inlier_fractions (setq _inlier_fractions __inlier_fractions)) _inlier_fractions)
  (:errors
   (&optional __errors)
   (if __errors (setq _errors __errors)) _errors)
  (:poses
   (&rest __poses)
   (if (keywordp (car __poses))
       (send* _poses __poses)
     (progn
       (if __poses (setq _poses (car __poses)))
       _poses)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/Header _globalmap_header
    (send _globalmap_header :serialization-length)
    ;; float64[] _inlier_fractions
    (* 8    (length _inlier_fractions)) 4
    ;; float64[] _errors
    (* 8    (length _errors)) 4
    ;; geometry_msgs/Pose[] _poses
    (apply #'+ (send-all _poses :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/Header _globalmap_header
       (send _globalmap_header :serialize s)
     ;; float64[] _inlier_fractions
     (write-long (length _inlier_fractions) s)
     (dotimes (i (length _inlier_fractions))
       (sys::poke (elt _inlier_fractions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _errors
     (write-long (length _errors) s)
     (dotimes (i (length _errors))
       (sys::poke (elt _errors i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; geometry_msgs/Pose[] _poses
     (write-long (length _poses) s)
     (dolist (elem _poses)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/Header _globalmap_header
     (send _globalmap_header :deserialize buf ptr-) (incf ptr- (send _globalmap_header :serialization-length))
   ;; float64[] _inlier_fractions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _inlier_fractions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _inlier_fractions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _errors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _errors (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _errors i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; geometry_msgs/Pose[] _poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _poses (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass hdl_global_localization::QueryGlobalLocalization
  :super ros::object
  :slots ())

(setf (get hdl_global_localization::QueryGlobalLocalization :md5sum-) "2e563a5d7af1f98cbac55cf8c1e0a1ba")
(setf (get hdl_global_localization::QueryGlobalLocalization :datatype-) "hdl_global_localization/QueryGlobalLocalization")
(setf (get hdl_global_localization::QueryGlobalLocalization :request) hdl_global_localization::QueryGlobalLocalizationRequest)
(setf (get hdl_global_localization::QueryGlobalLocalization :response) hdl_global_localization::QueryGlobalLocalizationResponse)

(defmethod hdl_global_localization::QueryGlobalLocalizationRequest
  (:response () (instance hdl_global_localization::QueryGlobalLocalizationResponse :init)))

(setf (get hdl_global_localization::QueryGlobalLocalizationRequest :md5sum-) "2e563a5d7af1f98cbac55cf8c1e0a1ba")
(setf (get hdl_global_localization::QueryGlobalLocalizationRequest :datatype-) "hdl_global_localization/QueryGlobalLocalizationRequest")
(setf (get hdl_global_localization::QueryGlobalLocalizationRequest :definition-)
      "int64 max_num_candidates
sensor_msgs/PointCloud2 cloud

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
---
std_msgs/Header header
std_msgs/Header globalmap_header

float64[] inlier_fractions
float64[] errors
geometry_msgs/Pose[] poses

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get hdl_global_localization::QueryGlobalLocalizationResponse :md5sum-) "2e563a5d7af1f98cbac55cf8c1e0a1ba")
(setf (get hdl_global_localization::QueryGlobalLocalizationResponse :datatype-) "hdl_global_localization/QueryGlobalLocalizationResponse")
(setf (get hdl_global_localization::QueryGlobalLocalizationResponse :definition-)
      "int64 max_num_candidates
sensor_msgs/PointCloud2 cloud

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
---
std_msgs/Header header
std_msgs/Header globalmap_header

float64[] inlier_fractions
float64[] errors
geometry_msgs/Pose[] poses

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :hdl_global_localization/QueryGlobalLocalization "2e563a5d7af1f98cbac55cf8c1e0a1ba")


