;; Auto-generated. Do not edit!


(when (boundp 'hdl_global_localization::SetGlobalLocalizationEngine)
  (if (not (find-package "HDL_GLOBAL_LOCALIZATION"))
    (make-package "HDL_GLOBAL_LOCALIZATION"))
  (shadow 'SetGlobalLocalizationEngine (find-package "HDL_GLOBAL_LOCALIZATION")))
(unless (find-package "HDL_GLOBAL_LOCALIZATION::SETGLOBALLOCALIZATIONENGINE")
  (make-package "HDL_GLOBAL_LOCALIZATION::SETGLOBALLOCALIZATIONENGINE"))
(unless (find-package "HDL_GLOBAL_LOCALIZATION::SETGLOBALLOCALIZATIONENGINEREQUEST")
  (make-package "HDL_GLOBAL_LOCALIZATION::SETGLOBALLOCALIZATIONENGINEREQUEST"))
(unless (find-package "HDL_GLOBAL_LOCALIZATION::SETGLOBALLOCALIZATIONENGINERESPONSE")
  (make-package "HDL_GLOBAL_LOCALIZATION::SETGLOBALLOCALIZATIONENGINERESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass hdl_global_localization::SetGlobalLocalizationEngineRequest
  :super ros::object
  :slots (_engine_name ))

(defmethod hdl_global_localization::SetGlobalLocalizationEngineRequest
  (:init
   (&key
    ((:engine_name __engine_name) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _engine_name __engine_name)
   self)
  (:engine_name
   (&rest __engine_name)
   (if (keywordp (car __engine_name))
       (send* _engine_name __engine_name)
     (progn
       (if __engine_name (setq _engine_name (car __engine_name)))
       _engine_name)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _engine_name
    (send _engine_name :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _engine_name
       (send _engine_name :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _engine_name
     (send _engine_name :deserialize buf ptr-) (incf ptr- (send _engine_name :serialization-length))
   ;;
   self)
  )

(defclass hdl_global_localization::SetGlobalLocalizationEngineResponse
  :super ros::object
  :slots ())

(defmethod hdl_global_localization::SetGlobalLocalizationEngineResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass hdl_global_localization::SetGlobalLocalizationEngine
  :super ros::object
  :slots ())

(setf (get hdl_global_localization::SetGlobalLocalizationEngine :md5sum-) "f71639c3aeb058fa00da5a20981c23c9")
(setf (get hdl_global_localization::SetGlobalLocalizationEngine :datatype-) "hdl_global_localization/SetGlobalLocalizationEngine")
(setf (get hdl_global_localization::SetGlobalLocalizationEngine :request) hdl_global_localization::SetGlobalLocalizationEngineRequest)
(setf (get hdl_global_localization::SetGlobalLocalizationEngine :response) hdl_global_localization::SetGlobalLocalizationEngineResponse)

(defmethod hdl_global_localization::SetGlobalLocalizationEngineRequest
  (:response () (instance hdl_global_localization::SetGlobalLocalizationEngineResponse :init)))

(setf (get hdl_global_localization::SetGlobalLocalizationEngineRequest :md5sum-) "f71639c3aeb058fa00da5a20981c23c9")
(setf (get hdl_global_localization::SetGlobalLocalizationEngineRequest :datatype-) "hdl_global_localization/SetGlobalLocalizationEngineRequest")
(setf (get hdl_global_localization::SetGlobalLocalizationEngineRequest :definition-)
      "std_msgs/String engine_name

================================================================================
MSG: std_msgs/String
string data
---
")

(setf (get hdl_global_localization::SetGlobalLocalizationEngineResponse :md5sum-) "f71639c3aeb058fa00da5a20981c23c9")
(setf (get hdl_global_localization::SetGlobalLocalizationEngineResponse :datatype-) "hdl_global_localization/SetGlobalLocalizationEngineResponse")
(setf (get hdl_global_localization::SetGlobalLocalizationEngineResponse :definition-)
      "std_msgs/String engine_name

================================================================================
MSG: std_msgs/String
string data
---
")



(provide :hdl_global_localization/SetGlobalLocalizationEngine "f71639c3aeb058fa00da5a20981c23c9")


