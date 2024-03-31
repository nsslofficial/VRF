; Auto-generated. Do not edit!


(cl:in-package hdl_global_localization-srv)


;//! \htmlinclude SetGlobalLocalizationEngine-request.msg.html

(cl:defclass <SetGlobalLocalizationEngine-request> (roslisp-msg-protocol:ros-message)
  ((engine_name
    :reader engine_name
    :initarg :engine_name
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass SetGlobalLocalizationEngine-request (<SetGlobalLocalizationEngine-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetGlobalLocalizationEngine-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetGlobalLocalizationEngine-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hdl_global_localization-srv:<SetGlobalLocalizationEngine-request> is deprecated: use hdl_global_localization-srv:SetGlobalLocalizationEngine-request instead.")))

(cl:ensure-generic-function 'engine_name-val :lambda-list '(m))
(cl:defmethod engine_name-val ((m <SetGlobalLocalizationEngine-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_global_localization-srv:engine_name-val is deprecated.  Use hdl_global_localization-srv:engine_name instead.")
  (engine_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetGlobalLocalizationEngine-request>) ostream)
  "Serializes a message object of type '<SetGlobalLocalizationEngine-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'engine_name) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetGlobalLocalizationEngine-request>) istream)
  "Deserializes a message object of type '<SetGlobalLocalizationEngine-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'engine_name) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetGlobalLocalizationEngine-request>)))
  "Returns string type for a service object of type '<SetGlobalLocalizationEngine-request>"
  "hdl_global_localization/SetGlobalLocalizationEngineRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGlobalLocalizationEngine-request)))
  "Returns string type for a service object of type 'SetGlobalLocalizationEngine-request"
  "hdl_global_localization/SetGlobalLocalizationEngineRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetGlobalLocalizationEngine-request>)))
  "Returns md5sum for a message object of type '<SetGlobalLocalizationEngine-request>"
  "f71639c3aeb058fa00da5a20981c23c9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetGlobalLocalizationEngine-request)))
  "Returns md5sum for a message object of type 'SetGlobalLocalizationEngine-request"
  "f71639c3aeb058fa00da5a20981c23c9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetGlobalLocalizationEngine-request>)))
  "Returns full string definition for message of type '<SetGlobalLocalizationEngine-request>"
  (cl:format cl:nil "std_msgs/String engine_name~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetGlobalLocalizationEngine-request)))
  "Returns full string definition for message of type 'SetGlobalLocalizationEngine-request"
  (cl:format cl:nil "std_msgs/String engine_name~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetGlobalLocalizationEngine-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'engine_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetGlobalLocalizationEngine-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetGlobalLocalizationEngine-request
    (cl:cons ':engine_name (engine_name msg))
))
;//! \htmlinclude SetGlobalLocalizationEngine-response.msg.html

(cl:defclass <SetGlobalLocalizationEngine-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetGlobalLocalizationEngine-response (<SetGlobalLocalizationEngine-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetGlobalLocalizationEngine-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetGlobalLocalizationEngine-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hdl_global_localization-srv:<SetGlobalLocalizationEngine-response> is deprecated: use hdl_global_localization-srv:SetGlobalLocalizationEngine-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetGlobalLocalizationEngine-response>) ostream)
  "Serializes a message object of type '<SetGlobalLocalizationEngine-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetGlobalLocalizationEngine-response>) istream)
  "Deserializes a message object of type '<SetGlobalLocalizationEngine-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetGlobalLocalizationEngine-response>)))
  "Returns string type for a service object of type '<SetGlobalLocalizationEngine-response>"
  "hdl_global_localization/SetGlobalLocalizationEngineResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGlobalLocalizationEngine-response)))
  "Returns string type for a service object of type 'SetGlobalLocalizationEngine-response"
  "hdl_global_localization/SetGlobalLocalizationEngineResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetGlobalLocalizationEngine-response>)))
  "Returns md5sum for a message object of type '<SetGlobalLocalizationEngine-response>"
  "f71639c3aeb058fa00da5a20981c23c9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetGlobalLocalizationEngine-response)))
  "Returns md5sum for a message object of type 'SetGlobalLocalizationEngine-response"
  "f71639c3aeb058fa00da5a20981c23c9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetGlobalLocalizationEngine-response>)))
  "Returns full string definition for message of type '<SetGlobalLocalizationEngine-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetGlobalLocalizationEngine-response)))
  "Returns full string definition for message of type 'SetGlobalLocalizationEngine-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetGlobalLocalizationEngine-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetGlobalLocalizationEngine-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetGlobalLocalizationEngine-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetGlobalLocalizationEngine)))
  'SetGlobalLocalizationEngine-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetGlobalLocalizationEngine)))
  'SetGlobalLocalizationEngine-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGlobalLocalizationEngine)))
  "Returns string type for a service object of type '<SetGlobalLocalizationEngine>"
  "hdl_global_localization/SetGlobalLocalizationEngine")