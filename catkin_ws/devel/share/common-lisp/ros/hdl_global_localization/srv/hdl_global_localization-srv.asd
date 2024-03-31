
(cl:in-package :asdf)

(defsystem "hdl_global_localization-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "QueryGlobalLocalization" :depends-on ("_package_QueryGlobalLocalization"))
    (:file "_package_QueryGlobalLocalization" :depends-on ("_package"))
    (:file "SetGlobalLocalizationEngine" :depends-on ("_package_SetGlobalLocalizationEngine"))
    (:file "_package_SetGlobalLocalizationEngine" :depends-on ("_package"))
    (:file "SetGlobalMap" :depends-on ("_package_SetGlobalMap"))
    (:file "_package_SetGlobalMap" :depends-on ("_package"))
  ))