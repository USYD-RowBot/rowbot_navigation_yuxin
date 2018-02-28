;; Auto-generated. Do not edit!


(when (boundp 'kingfisher_msgs::Drive)
  (if (not (find-package "KINGFISHER_MSGS"))
    (make-package "KINGFISHER_MSGS"))
  (shadow 'Drive (find-package "KINGFISHER_MSGS")))
(unless (find-package "KINGFISHER_MSGS::DRIVE")
  (make-package "KINGFISHER_MSGS::DRIVE"))

(in-package "ROS")
;;//! \htmlinclude Drive.msg.html


(defclass kingfisher_msgs::Drive
  :super ros::object
  :slots (_left _right ))

(defmethod kingfisher_msgs::Drive
  (:init
   (&key
    ((:left __left) 0.0)
    ((:right __right) 0.0)
    )
   (send-super :init)
   (setq _left (float __left))
   (setq _right (float __right))
   self)
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:right
   (&optional __right)
   (if __right (setq _right __right)) _right)
  (:serialization-length
   ()
   (+
    ;; float32 _left
    4
    ;; float32 _right
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _left
       (sys::poke _left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right
       (sys::poke _right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _left
     (setq _left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right
     (setq _right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get kingfisher_msgs::Drive :md5sum-) "3a927990ab5d5c3d628e2d52b8533e52")
(setf (get kingfisher_msgs::Drive :datatype-) "kingfisher_msgs/Drive")
(setf (get kingfisher_msgs::Drive :definition-)
      "# Command thrust level for Kingfisher thruster,
# range from [-1.0..1.0], where 1.0 is forward.
float32 left
float32 right

")



(provide :kingfisher_msgs/Drive "3a927990ab5d5c3d628e2d52b8533e52")


