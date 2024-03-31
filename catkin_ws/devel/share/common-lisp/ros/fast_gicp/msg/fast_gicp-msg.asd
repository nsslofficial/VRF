
(cl:in-package :asdf)

(defsystem "fast_gicp-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CompressDiff" :depends-on ("_package_CompressDiff"))
    (:file "_package_CompressDiff" :depends-on ("_package"))
    (:file "Transform" :depends-on ("_package_Transform"))
    (:file "_package_Transform" :depends-on ("_package"))
  ))