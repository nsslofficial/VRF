;; Auto-generated. Do not edit!


(when (boundp 'hdl_localization::ScanMatchingStatus)
  (if (not (find-package "HDL_LOCALIZATION"))
    (make-package "HDL_LOCALIZATION"))
  (shadow 'ScanMatchingStatus (find-package "HDL_LOCALIZATION")))
(unless (find-package "HDL_LOCALIZATION::SCANMATCHINGSTATUS")
  (make-package "HDL_LOCALIZATION::SCANMATCHINGSTATUS"))

(in-package "ROS")
;;//! \htmlinclude ScanMatchingStatus.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass hdl_localization::ScanMatchingStatus
  :super ros::object
  :slots (_header _has_converged _matching_error _inlier_fraction _relative_pose _prediction_labels _prediction_errors ))

(defmethod hdl_localization::ScanMatchingStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:has_converged __has_converged) nil)
    ((:matching_error __matching_error) 0.0)
    ((:inlier_fraction __inlier_fraction) 0.0)
    ((:relative_pose __relative_pose) (instance geometry_msgs::Transform :init))
    ((:prediction_labels __prediction_labels) ())
    ((:prediction_errors __prediction_errors) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _has_converged __has_converged)
   (setq _matching_error (float __matching_error))
   (setq _inlier_fraction (float __inlier_fraction))
   (setq _relative_pose __relative_pose)
   (setq _prediction_labels __prediction_labels)
   (setq _prediction_errors __prediction_errors)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:has_converged
   (&optional (__has_converged :null))
   (if (not (eq __has_converged :null)) (setq _has_converged __has_converged)) _has_converged)
  (:matching_error
   (&optional __matching_error)
   (if __matching_error (setq _matching_error __matching_error)) _matching_error)
  (:inlier_fraction
   (&optional __inlier_fraction)
   (if __inlier_fraction (setq _inlier_fraction __inlier_fraction)) _inlier_fraction)
  (:relative_pose
   (&rest __relative_pose)
   (if (keywordp (car __relative_pose))
       (send* _relative_pose __relative_pose)
     (progn
       (if __relative_pose (setq _relative_pose (car __relative_pose)))
       _relative_pose)))
  (:prediction_labels
   (&rest __prediction_labels)
   (if (keywordp (car __prediction_labels))
       (send* _prediction_labels __prediction_labels)
     (progn
       (if __prediction_labels (setq _prediction_labels (car __prediction_labels)))
       _prediction_labels)))
  (:prediction_errors
   (&rest __prediction_errors)
   (if (keywordp (car __prediction_errors))
       (send* _prediction_errors __prediction_errors)
     (progn
       (if __prediction_errors (setq _prediction_errors (car __prediction_errors)))
       _prediction_errors)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _has_converged
    1
    ;; float32 _matching_error
    4
    ;; float32 _inlier_fraction
    4
    ;; geometry_msgs/Transform _relative_pose
    (send _relative_pose :serialization-length)
    ;; std_msgs/String[] _prediction_labels
    (apply #'+ (send-all _prediction_labels :serialization-length)) 4
    ;; geometry_msgs/Transform[] _prediction_errors
    (apply #'+ (send-all _prediction_errors :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _has_converged
       (if _has_converged (write-byte -1 s) (write-byte 0 s))
     ;; float32 _matching_error
       (sys::poke _matching_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _inlier_fraction
       (sys::poke _inlier_fraction (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Transform _relative_pose
       (send _relative_pose :serialize s)
     ;; std_msgs/String[] _prediction_labels
     (write-long (length _prediction_labels) s)
     (dolist (elem _prediction_labels)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Transform[] _prediction_errors
     (write-long (length _prediction_errors) s)
     (dolist (elem _prediction_errors)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _has_converged
     (setq _has_converged (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _matching_error
     (setq _matching_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _inlier_fraction
     (setq _inlier_fraction (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Transform _relative_pose
     (send _relative_pose :deserialize buf ptr-) (incf ptr- (send _relative_pose :serialization-length))
   ;; std_msgs/String[] _prediction_labels
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _prediction_labels (let (r) (dotimes (i n) (push (instance std_msgs::String :init) r)) r))
     (dolist (elem- _prediction_labels)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Transform[] _prediction_errors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _prediction_errors (let (r) (dotimes (i n) (push (instance geometry_msgs::Transform :init) r)) r))
     (dolist (elem- _prediction_errors)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get hdl_localization::ScanMatchingStatus :md5sum-) "9482ff8da7c52f631faa8ed74fbad0c2")
(setf (get hdl_localization::ScanMatchingStatus :datatype-) "hdl_localization/ScanMatchingStatus")
(setf (get hdl_localization::ScanMatchingStatus :definition-)
      "Header header

bool has_converged
float32 matching_error
float32 inlier_fraction
geometry_msgs/Transform relative_pose

std_msgs/String[] prediction_labels
geometry_msgs/Transform[] prediction_errors
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
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

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

================================================================================
MSG: std_msgs/String
string data

")



(provide :hdl_localization/ScanMatchingStatus "9482ff8da7c52f631faa8ed74fbad0c2")


