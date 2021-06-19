;; Auto-generated. Do not edit!


(when (boundp 'esr_msgs::Measurement)
  (if (not (find-package "ESR_MSGS"))
    (make-package "ESR_MSGS"))
  (shadow 'Measurement (find-package "ESR_MSGS")))
(unless (find-package "ESR_MSGS::MEASUREMENT")
  (make-package "ESR_MSGS::MEASUREMENT"))

(in-package "ROS")
;;//! \htmlinclude Measurement.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass esr_msgs::Measurement
  :super ros::object
  :slots (_header _status _tracks ))

(defmethod esr_msgs::Measurement
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:status __status) (instance esr_msgs::Status :init))
    ((:tracks __tracks) (let (r) (dotimes (i 0) (push (instance esr_msgs::Track :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _status __status)
   (setq _tracks __tracks)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:status
   (&rest __status)
   (if (keywordp (car __status))
       (send* _status __status)
     (progn
       (if __status (setq _status (car __status)))
       _status)))
  (:tracks
   (&rest __tracks)
   (if (keywordp (car __tracks))
       (send* _tracks __tracks)
     (progn
       (if __tracks (setq _tracks (car __tracks)))
       _tracks)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; esr_msgs/Status _status
    (send _status :serialization-length)
    ;; esr_msgs/Track[] _tracks
    (apply #'+ (send-all _tracks :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; esr_msgs/Status _status
       (send _status :serialize s)
     ;; esr_msgs/Track[] _tracks
     (write-long (length _tracks) s)
     (dolist (elem _tracks)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; esr_msgs/Status _status
     (send _status :deserialize buf ptr-) (incf ptr- (send _status :serialization-length))
   ;; esr_msgs/Track[] _tracks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tracks (let (r) (dotimes (i n) (push (instance esr_msgs::Track :init) r)) r))
     (dolist (elem- _tracks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get esr_msgs::Measurement :md5sum-) "1f00ed2bd4b53e883b8642a3983d0209")
(setf (get esr_msgs::Measurement :datatype-) "esr_msgs/Measurement")
(setf (get esr_msgs::Measurement :definition-)
      "Header header
Status status
Track[] tracks

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
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: esr_msgs/Status
Header header
# from 4e0
uint16 scan_index
#uint8 dsp_timestamp # in ms
#float32 vehicle_speed # in m/s
#float32 vehicle_yaw_rate # in in deg/s
#float32 vehicle_turning_radius # in m
#float32 range # cropped between 0..204.7 m
bool is_comm_error
# from 4e1
#uint16 steering_angle_ack # in deg
bool is_radiating
bool is_failed
bool is_blocked
bool is_overheating
#uint8 max_tracks_ack # 1..64
bool is_raw_data_mode
int8 internal_temperature # in degC
uint16 sw_version
#float32 yaw_rate_bias # deg/s
#float32 veh_spd_comp_factor
# from 4e3
bool is_lr_enabled
bool is_mr_enabled
bool is_sidelobe_blockage
bool is_partial_blockage
#float32 auto_align_angle

================================================================================
MSG: esr_msgs/Track
Header header
uint8 status # 0: no target 1: new 2: new updated 3: updated 4: coasted 5: merged 6: invalid coasted 7: new coasted
uint8 index # 1..64
float32 range # cropped between 0..204.7 m
float32 range_rate # cropped between -81.92..81.91m/s
float32 range_accl # cropped between -25.6..25.55 m/s^2
float32 azimuth # cropped between -51.2..51.1 deg
float32 lateral_rate # cropped between -8..7.75 m/s
float32 width # cropped between 0..7.5 m
bool is_mr_update
bool is_lr_update
#bool is_oncoming
#bool is_bridge
#bool is_grouping_changed
int8 amplitude # cropped to -10..21dB

")



(provide :esr_msgs/Measurement "1f00ed2bd4b53e883b8642a3983d0209")


