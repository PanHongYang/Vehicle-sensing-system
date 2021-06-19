;; Auto-generated. Do not edit!


(when (boundp 'canfd_msgs::Frame)
  (if (not (find-package "CANFD_MSGS"))
    (make-package "CANFD_MSGS"))
  (shadow 'Frame (find-package "CANFD_MSGS")))
(unless (find-package "CANFD_MSGS::FRAME")
  (make-package "CANFD_MSGS::FRAME"))

(in-package "ROS")
;;//! \htmlinclude Frame.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass canfd_msgs::Frame
  :super ros::object
  :slots (_header _interface _id _is_rtr _is_extended _is_error _len _data ))

(defmethod canfd_msgs::Frame
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:interface __interface) "")
    ((:id __id) 0)
    ((:is_rtr __is_rtr) nil)
    ((:is_extended __is_extended) nil)
    ((:is_error __is_error) nil)
    ((:len __len) 0)
    ((:data __data) (make-array 64 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _header __header)
   (setq _interface (string __interface))
   (setq _id (round __id))
   (setq _is_rtr __is_rtr)
   (setq _is_extended __is_extended)
   (setq _is_error __is_error)
   (setq _len (round __len))
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:interface
   (&optional __interface)
   (if __interface (setq _interface __interface)) _interface)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:is_rtr
   (&optional __is_rtr)
   (if __is_rtr (setq _is_rtr __is_rtr)) _is_rtr)
  (:is_extended
   (&optional __is_extended)
   (if __is_extended (setq _is_extended __is_extended)) _is_extended)
  (:is_error
   (&optional __is_error)
   (if __is_error (setq _is_error __is_error)) _is_error)
  (:len
   (&optional __len)
   (if __len (setq _len __len)) _len)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _interface
    4 (length _interface)
    ;; uint32 _id
    4
    ;; bool _is_rtr
    1
    ;; bool _is_extended
    1
    ;; bool _is_error
    1
    ;; uint8 _len
    1
    ;; uint8[64] _data
    (* 1    64)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _interface
       (write-long (length _interface) s) (princ _interface s)
     ;; uint32 _id
       (write-long _id s)
     ;; bool _is_rtr
       (if _is_rtr (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_extended
       (if _is_extended (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_error
       (if _is_error (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _len
       (write-byte _len s)
     ;; uint8[64] _data
     (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _interface
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _interface (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _is_rtr
     (setq _is_rtr (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_extended
     (setq _is_extended (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_error
     (setq _is_error (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _len
     (setq _len (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8[64] _data
   (setq _data (make-array 64 :element-type :char))
   (replace _data buf :start2 ptr-) (incf ptr- 64)
   ;;
   self)
  )

(setf (get canfd_msgs::Frame :md5sum-) "67a2d3c780aad66c439e5e1657c0ce8e")
(setf (get canfd_msgs::Frame :datatype-) "canfd_msgs/Frame")
(setf (get canfd_msgs::Frame :definition-)
      "Header header
string interface
uint32 id
bool is_rtr
bool is_extended
bool is_error
uint8 len
uint8[64] data

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

")



(provide :canfd_msgs/Frame "67a2d3c780aad66c439e5e1657c0ce8e")


