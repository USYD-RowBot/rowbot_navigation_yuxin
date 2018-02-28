;; Auto-generated. Do not edit!


(when (boundp 'kingfisher_msgs::Sense)
  (if (not (find-package "KINGFISHER_MSGS"))
    (make-package "KINGFISHER_MSGS"))
  (shadow 'Sense (find-package "KINGFISHER_MSGS")))
(unless (find-package "KINGFISHER_MSGS::SENSE")
  (make-package "KINGFISHER_MSGS::SENSE"))

(in-package "ROS")
;;//! \htmlinclude Sense.msg.html


(intern "*RC_INRANGE*" (find-package "KINGFISHER_MSGS::SENSE"))
(shadow '*RC_INRANGE* (find-package "KINGFISHER_MSGS::SENSE"))
(defconstant kingfisher_msgs::Sense::*RC_INRANGE* 1)
(intern "*RC_INUSE*" (find-package "KINGFISHER_MSGS::SENSE"))
(shadow '*RC_INUSE* (find-package "KINGFISHER_MSGS::SENSE"))
(defconstant kingfisher_msgs::Sense::*RC_INUSE* 2)
(defclass kingfisher_msgs::Sense
  :super ros::object
  :slots (_battery _current_left _current_right _pcb_temperature _fan_on _rc _rc_throttle _rc_rotation _rc_enable ))

(defmethod kingfisher_msgs::Sense
  (:init
   (&key
    ((:battery __battery) 0.0)
    ((:current_left __current_left) 0.0)
    ((:current_right __current_right) 0.0)
    ((:pcb_temperature __pcb_temperature) 0.0)
    ((:fan_on __fan_on) nil)
    ((:rc __rc) 0)
    ((:rc_throttle __rc_throttle) 0)
    ((:rc_rotation __rc_rotation) 0)
    ((:rc_enable __rc_enable) 0)
    )
   (send-super :init)
   (setq _battery (float __battery))
   (setq _current_left (float __current_left))
   (setq _current_right (float __current_right))
   (setq _pcb_temperature (float __pcb_temperature))
   (setq _fan_on __fan_on)
   (setq _rc (round __rc))
   (setq _rc_throttle (round __rc_throttle))
   (setq _rc_rotation (round __rc_rotation))
   (setq _rc_enable (round __rc_enable))
   self)
  (:battery
   (&optional __battery)
   (if __battery (setq _battery __battery)) _battery)
  (:current_left
   (&optional __current_left)
   (if __current_left (setq _current_left __current_left)) _current_left)
  (:current_right
   (&optional __current_right)
   (if __current_right (setq _current_right __current_right)) _current_right)
  (:pcb_temperature
   (&optional __pcb_temperature)
   (if __pcb_temperature (setq _pcb_temperature __pcb_temperature)) _pcb_temperature)
  (:fan_on
   (&optional __fan_on)
   (if __fan_on (setq _fan_on __fan_on)) _fan_on)
  (:rc
   (&optional __rc)
   (if __rc (setq _rc __rc)) _rc)
  (:rc_throttle
   (&optional __rc_throttle)
   (if __rc_throttle (setq _rc_throttle __rc_throttle)) _rc_throttle)
  (:rc_rotation
   (&optional __rc_rotation)
   (if __rc_rotation (setq _rc_rotation __rc_rotation)) _rc_rotation)
  (:rc_enable
   (&optional __rc_enable)
   (if __rc_enable (setq _rc_enable __rc_enable)) _rc_enable)
  (:serialization-length
   ()
   (+
    ;; float32 _battery
    4
    ;; float32 _current_left
    4
    ;; float32 _current_right
    4
    ;; float32 _pcb_temperature
    4
    ;; bool _fan_on
    1
    ;; uint8 _rc
    1
    ;; uint16 _rc_throttle
    2
    ;; uint16 _rc_rotation
    2
    ;; uint16 _rc_enable
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _battery
       (sys::poke _battery (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _current_left
       (sys::poke _current_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _current_right
       (sys::poke _current_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pcb_temperature
       (sys::poke _pcb_temperature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _fan_on
       (if _fan_on (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _rc
       (write-byte _rc s)
     ;; uint16 _rc_throttle
       (write-word _rc_throttle s)
     ;; uint16 _rc_rotation
       (write-word _rc_rotation s)
     ;; uint16 _rc_enable
       (write-word _rc_enable s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _battery
     (setq _battery (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _current_left
     (setq _current_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _current_right
     (setq _current_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pcb_temperature
     (setq _pcb_temperature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _fan_on
     (setq _fan_on (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _rc
     (setq _rc (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _rc_throttle
     (setq _rc_throttle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _rc_rotation
     (setq _rc_rotation (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _rc_enable
     (setq _rc_enable (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get kingfisher_msgs::Sense :md5sum-) "b0209acddc7f26d2e3dc1338d6c4df94")
(setf (get kingfisher_msgs::Sense :datatype-) "kingfisher_msgs/Sense")
(setf (get kingfisher_msgs::Sense :definition-)
      "# Voltage level of battery, in volts
float32 battery

# Instantaneous current drawn by each motor, in amps.
float32 current_left
float32 current_right

# Temperature of PCB as measured by internal AVR thermometer,
# reported in degrees centigrade.
float32 pcb_temperature
bool fan_on

# Bitfield represents status of hobby R/C override.
uint8 RC_INRANGE=1
uint8 RC_INUSE=2
uint8 rc

# Pulse lengths received from the three R/C channels.
uint16 rc_throttle
uint16 rc_rotation
uint16 rc_enable

")



(provide :kingfisher_msgs/Sense "b0209acddc7f26d2e3dc1338d6c4df94")


