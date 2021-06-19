;; Auto-generated. Do not edit!


(when (boundp 'serial_port::radar_data)
  (if (not (find-package "SERIAL_PORT"))
    (make-package "SERIAL_PORT"))
  (shadow 'radar_data (find-package "SERIAL_PORT")))
(unless (find-package "SERIAL_PORT::RADAR_DATA")
  (make-package "SERIAL_PORT::RADAR_DATA"))

(in-package "ROS")
;;//! \htmlinclude radar_data.msg.html


(defclass serial_port::radar_data
  :super ros::object
  :slots (_radar_msg ))

(defmethod serial_port::radar_data
  (:init
   (&key
    ((:radar_msg __radar_msg) 0)
    )
   (send-super :init)
   (setq _radar_msg (round __radar_msg))
   self)
  (:radar_msg
   (&optional __radar_msg)
   (if __radar_msg (setq _radar_msg __radar_msg)) _radar_msg)
  (:serialization-length
   ()
   (+
    ;; int16 _radar_msg
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _radar_msg
       (write-word _radar_msg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _radar_msg
     (setq _radar_msg (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get serial_port::radar_data :md5sum-) "02683d36c207f710ce232222df4425ac")
(setf (get serial_port::radar_data :datatype-) "serial_port/radar_data")
(setf (get serial_port::radar_data :definition-)
      "int16 radar_msg

")



(provide :serial_port/radar_data "02683d36c207f710ce232222df4425ac")


