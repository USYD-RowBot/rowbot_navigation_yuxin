;; Auto-generated. Do not edit!


(when (boundp 'kingfisher_msgs::GPS)
  (if (not (find-package "KINGFISHER_MSGS"))
    (make-package "KINGFISHER_MSGS"))
  (shadow 'GPS (find-package "KINGFISHER_MSGS")))
(unless (find-package "KINGFISHER_MSGS::GPS")
  (make-package "KINGFISHER_MSGS::GPS"))

(in-package "ROS")
;;//! \htmlinclude GPS.msg.html


(defclass kingfisher_msgs::GPS
  :super ros::object
  :slots (_GPS_receivedTime _GPS_latitude _GPS_longitude ))

(defmethod kingfisher_msgs::GPS
  (:init
   (&key
    ((:GPS_receivedTime __GPS_receivedTime) 0.0)
    ((:GPS_latitude __GPS_latitude) 0.0)
    ((:GPS_longitude __GPS_longitude) 0.0)
    )
   (send-super :init)
   (setq _GPS_receivedTime (float __GPS_receivedTime))
   (setq _GPS_latitude (float __GPS_latitude))
   (setq _GPS_longitude (float __GPS_longitude))
   self)
  (:GPS_receivedTime
   (&optional __GPS_receivedTime)
   (if __GPS_receivedTime (setq _GPS_receivedTime __GPS_receivedTime)) _GPS_receivedTime)
  (:GPS_latitude
   (&optional __GPS_latitude)
   (if __GPS_latitude (setq _GPS_latitude __GPS_latitude)) _GPS_latitude)
  (:GPS_longitude
   (&optional __GPS_longitude)
   (if __GPS_longitude (setq _GPS_longitude __GPS_longitude)) _GPS_longitude)
  (:serialization-length
   ()
   (+
    ;; float64 _GPS_receivedTime
    8
    ;; float64 _GPS_latitude
    8
    ;; float64 _GPS_longitude
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _GPS_receivedTime
       (sys::poke _GPS_receivedTime (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _GPS_latitude
       (sys::poke _GPS_latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _GPS_longitude
       (sys::poke _GPS_longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _GPS_receivedTime
     (setq _GPS_receivedTime (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _GPS_latitude
     (setq _GPS_latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _GPS_longitude
     (setq _GPS_longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get kingfisher_msgs::GPS :md5sum-) "8f1b89d4744f53db1d3b5b2ee7066ef1")
(setf (get kingfisher_msgs::GPS :datatype-) "kingfisher_msgs/GPS")
(setf (get kingfisher_msgs::GPS :definition-)
      "float64 GPS_receivedTime
float64 GPS_latitude
float64 GPS_longitude

")



(provide :kingfisher_msgs/GPS "8f1b89d4744f53db1d3b5b2ee7066ef1")


