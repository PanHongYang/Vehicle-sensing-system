; Auto-generated. Do not edit!


(cl:in-package esr_msgs-msg)


;//! \htmlinclude Measurement.msg.html

(cl:defclass <Measurement> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (status
    :reader status
    :initarg :status
    :type esr_msgs-msg:Status
    :initform (cl:make-instance 'esr_msgs-msg:Status))
   (tracks
    :reader tracks
    :initarg :tracks
    :type (cl:vector esr_msgs-msg:Track)
   :initform (cl:make-array 0 :element-type 'esr_msgs-msg:Track :initial-element (cl:make-instance 'esr_msgs-msg:Track))))
)

(cl:defclass Measurement (<Measurement>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Measurement>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Measurement)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name esr_msgs-msg:<Measurement> is deprecated: use esr_msgs-msg:Measurement instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Measurement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:header-val is deprecated.  Use esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <Measurement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:status-val is deprecated.  Use esr_msgs-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'tracks-val :lambda-list '(m))
(cl:defmethod tracks-val ((m <Measurement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:tracks-val is deprecated.  Use esr_msgs-msg:tracks instead.")
  (tracks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Measurement>) ostream)
  "Serializes a message object of type '<Measurement>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'status) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'tracks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'tracks))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Measurement>) istream)
  "Deserializes a message object of type '<Measurement>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'status) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'tracks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'tracks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'esr_msgs-msg:Track))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Measurement>)))
  "Returns string type for a message object of type '<Measurement>"
  "esr_msgs/Measurement")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Measurement)))
  "Returns string type for a message object of type 'Measurement"
  "esr_msgs/Measurement")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Measurement>)))
  "Returns md5sum for a message object of type '<Measurement>"
  "1f00ed2bd4b53e883b8642a3983d0209")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Measurement)))
  "Returns md5sum for a message object of type 'Measurement"
  "1f00ed2bd4b53e883b8642a3983d0209")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Measurement>)))
  "Returns full string definition for message of type '<Measurement>"
  (cl:format cl:nil "Header header~%Status status~%Track[] tracks~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: esr_msgs/Status~%Header header~%# from 4e0~%uint16 scan_index~%#uint8 dsp_timestamp # in ms~%#float32 vehicle_speed # in m/s~%#float32 vehicle_yaw_rate # in in deg/s~%#float32 vehicle_turning_radius # in m~%#float32 range # cropped between 0..204.7 m~%bool is_comm_error~%# from 4e1~%#uint16 steering_angle_ack # in deg~%bool is_radiating~%bool is_failed~%bool is_blocked~%bool is_overheating~%#uint8 max_tracks_ack # 1..64~%bool is_raw_data_mode~%int8 internal_temperature # in degC~%uint16 sw_version~%#float32 yaw_rate_bias # deg/s~%#float32 veh_spd_comp_factor~%# from 4e3~%bool is_lr_enabled~%bool is_mr_enabled~%bool is_sidelobe_blockage~%bool is_partial_blockage~%#float32 auto_align_angle~%~%================================================================================~%MSG: esr_msgs/Track~%Header header~%uint8 status # 0: no target 1: new 2: new updated 3: updated 4: coasted 5: merged 6: invalid coasted 7: new coasted~%uint8 index # 1..64~%float32 range # cropped between 0..204.7 m~%float32 range_rate # cropped between -81.92..81.91m/s~%float32 range_accl # cropped between -25.6..25.55 m/s^2~%float32 azimuth # cropped between -51.2..51.1 deg~%float32 lateral_rate # cropped between -8..7.75 m/s~%float32 width # cropped between 0..7.5 m~%bool is_mr_update~%bool is_lr_update~%#bool is_oncoming~%#bool is_bridge~%#bool is_grouping_changed~%int8 amplitude # cropped to -10..21dB~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Measurement)))
  "Returns full string definition for message of type 'Measurement"
  (cl:format cl:nil "Header header~%Status status~%Track[] tracks~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: esr_msgs/Status~%Header header~%# from 4e0~%uint16 scan_index~%#uint8 dsp_timestamp # in ms~%#float32 vehicle_speed # in m/s~%#float32 vehicle_yaw_rate # in in deg/s~%#float32 vehicle_turning_radius # in m~%#float32 range # cropped between 0..204.7 m~%bool is_comm_error~%# from 4e1~%#uint16 steering_angle_ack # in deg~%bool is_radiating~%bool is_failed~%bool is_blocked~%bool is_overheating~%#uint8 max_tracks_ack # 1..64~%bool is_raw_data_mode~%int8 internal_temperature # in degC~%uint16 sw_version~%#float32 yaw_rate_bias # deg/s~%#float32 veh_spd_comp_factor~%# from 4e3~%bool is_lr_enabled~%bool is_mr_enabled~%bool is_sidelobe_blockage~%bool is_partial_blockage~%#float32 auto_align_angle~%~%================================================================================~%MSG: esr_msgs/Track~%Header header~%uint8 status # 0: no target 1: new 2: new updated 3: updated 4: coasted 5: merged 6: invalid coasted 7: new coasted~%uint8 index # 1..64~%float32 range # cropped between 0..204.7 m~%float32 range_rate # cropped between -81.92..81.91m/s~%float32 range_accl # cropped between -25.6..25.55 m/s^2~%float32 azimuth # cropped between -51.2..51.1 deg~%float32 lateral_rate # cropped between -8..7.75 m/s~%float32 width # cropped between 0..7.5 m~%bool is_mr_update~%bool is_lr_update~%#bool is_oncoming~%#bool is_bridge~%#bool is_grouping_changed~%int8 amplitude # cropped to -10..21dB~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Measurement>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'status))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'tracks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Measurement>))
  "Converts a ROS message object to a list"
  (cl:list 'Measurement
    (cl:cons ':header (header msg))
    (cl:cons ':status (status msg))
    (cl:cons ':tracks (tracks msg))
))
