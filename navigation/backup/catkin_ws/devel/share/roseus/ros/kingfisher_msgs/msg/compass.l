;; Auto-generated. Do not edit!


(when (boundp 'kingfisher_msgs::compass)
  (if (not (find-package "KINGFISHER_MSGS"))
    (make-package "KINGFISHER_MSGS"))
  (shadow 'compass (find-package "KINGFISHER_MSGS")))
(unless (find-package "KINGFISHER_MSGS::COMPASS")
  (make-package "KINGFISHER_MSGS::COMPASS"))

(in-package "ROS")
;;//! \htmlinclude compass.msg.html


(defclass kingfisher_msgs::compass
  :super ros::object
  :slots (_compass_receivedTime _compass_heading ))

(defmethod kingfisher_msgs::compass
  (:init
   (&key
    ((:compass_receivedTime __compass_receivedTime) 0.0)
    ((:compass_heading __compass_heading) 0.0)
    )
   (send-super :init)
   (setq _compass_receivedTime (float __compass_receivedTime))
   (setq _compass_heading (float __compass_heading))
   self)
  (:compass_receivedTime
   (&optional __compass_receivedTime)
   (if __compass_receivedTime (setq _compass_receivedTime __compass_receivedTime)) _compass_receivedTime)
  (:compass_heading
   (&optional __compass_heading)
   (if __compass_heading (setq _compass_heading __compass_heading)) _compass_heading)
  (:serialization-length
   ()
   (+
    ;; float64 _compass_receivedTime
    8
    ;; float64 _compass_heading
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _compass_receivedTime
       (sys::poke _compass_receivedTime (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _compass_heading
       (sys::poke _compass_heading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _compass_receivedTime
     (setq _compass_receivedTime (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _compass_heading
     (setq _compass_heading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get kingfisher_msgs::compass :md5sum-) "e353f687f3a4ad2733487eb5dba3f883")
(setf (get kingfisher_msgs::compass :datatype-) "kingfisher_msgs/compass")
(setf (get kingfisher_msgs::compass :definition-)
      "float64 compass_receivedTime
float64 compass_heading

")



(provide :kingfisher_msgs/compass "e353f687f3a4ad2733487eb5dba3f883")


