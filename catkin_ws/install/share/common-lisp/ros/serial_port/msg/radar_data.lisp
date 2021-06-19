; Auto-generated. Do not edit!


(cl:in-package serial_port-msg)


;//! \htmlinclude radar_data.msg.html

(cl:defclass <radar_data> (roslisp-msg-protocol:ros-message)
  ((radar_msg
    :reader radar_msg
    :initarg :radar_msg
    :type cl:fixnum
    :initform 0))
)

(cl:defclass radar_data (<radar_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <radar_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'radar_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_port-msg:<radar_data> is deprecated: use serial_port-msg:radar_data instead.")))

(cl:ensure-generic-function 'radar_msg-val :lambda-list '(m))
(cl:defmethod radar_msg-val ((m <radar_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_port-msg:radar_msg-val is deprecated.  Use serial_port-msg:radar_msg instead.")
  (radar_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <radar_data>) ostream)
  "Serializes a message object of type '<radar_data>"
  (cl:let* ((signed (cl:slot-value msg 'radar_msg)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <radar_data>) istream)
  "Deserializes a message object of type '<radar_data>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'radar_msg) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<radar_data>)))
  "Returns string type for a message object of type '<radar_data>"
  "serial_port/radar_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'radar_data)))
  "Returns string type for a message object of type 'radar_data"
  "serial_port/radar_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<radar_data>)))
  "Returns md5sum for a message object of type '<radar_data>"
  "02683d36c207f710ce232222df4425ac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'radar_data)))
  "Returns md5sum for a message object of type 'radar_data"
  "02683d36c207f710ce232222df4425ac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<radar_data>)))
  "Returns full string definition for message of type '<radar_data>"
  (cl:format cl:nil "int16 radar_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'radar_data)))
  "Returns full string definition for message of type 'radar_data"
  (cl:format cl:nil "int16 radar_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <radar_data>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <radar_data>))
  "Converts a ROS message object to a list"
  (cl:list 'radar_data
    (cl:cons ':radar_msg (radar_msg msg))
))
