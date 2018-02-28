
(cl:in-package :asdf)

(defsystem "kingfisher_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Drive" :depends-on ("_package_Drive"))
    (:file "_package_Drive" :depends-on ("_package"))
    (:file "GPS" :depends-on ("_package_GPS"))
    (:file "_package_GPS" :depends-on ("_package"))
    (:file "Sense" :depends-on ("_package_Sense"))
    (:file "_package_Sense" :depends-on ("_package"))
    (:file "compass" :depends-on ("_package_compass"))
    (:file "_package_compass" :depends-on ("_package"))
  ))