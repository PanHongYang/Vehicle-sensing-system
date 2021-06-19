
(cl:in-package :asdf)

(defsystem "serial_port-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "radar_data" :depends-on ("_package_radar_data"))
    (:file "_package_radar_data" :depends-on ("_package"))
  ))