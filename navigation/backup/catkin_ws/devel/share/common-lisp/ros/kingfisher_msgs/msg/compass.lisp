; Auto-generated. Do not edit!


(cl:in-package kingfisher_msgs-msg)


;//! \htmlinclude compass.msg.html

(cl:defclass <compass> (roslisp-msg-protocol:ros-message)
  ((compass_receivedTime
    :reader compass_receivedTime
    :initarg :compass_receivedTime
    :type cl:float
    :initform 0.0)
   (compass_heading
    :reader compass_heading
    :initarg :compass_heading
    :type cl:float
    :initform 0.0))
)

(cl:defclass compass (<compass>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <compass>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'compass)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kingfisher_msgs-msg:<compass> is deprecated: use kingfisher_msgs-msg:compass instead.")))

(cl:ensure-generic-function 'compass_receivedTime-val :lambda-list '(m))
(cl:defmethod compass_receivedTime-val ((m <compass>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kingfisher_msgs-msg:compass_receivedTime-val is deprecated.  Use kingfisher_msgs-msg:compass_receivedTime instead.")
  (compass_receivedTime m))

(cl:ensure-generic-function 'compass_heading-val :lambda-list '(m))
(cl:defmethod compass_heading-val ((m <compass>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kingfisher_msgs-msg:compass_heading-val is deprecated.  Use kingfisher_msgs-msg:compass_heading instead.")
  (compass_heading m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <compass>) ostream)
  "Serializes a message object of type '<compass>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'compass_receivedTime))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'compass_heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <compass>) istream)
  "Deserializes a message object of type '<compass>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'compass_receivedTime) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'compass_heading) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<compass>)))
  "Returns string type for a message object of type '<compass>"
  "kingfisher_msgs/compass")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'compass)))
  "Returns string type for a message object of type 'compass"
  "kingfisher_msgs/compass")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<compass>)))
  "Returns md5sum for a message object of type '<compass>"
  "e353f687f3a4ad2733487eb5dba3f883")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'compass)))
  "Returns md5sum for a message object of type 'compass"
  "e353f687f3a4ad2733487eb5dba3f883")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<compass>)))
  "Returns full string definition for message of type '<compass>"
  (cl:format cl:nil "float64 compass_receivedTime~%float64 compass_heading~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'compass)))
  "Returns full string definition for message of type 'compass"
  (cl:format cl:nil "float64 compass_receivedTime~%float64 compass_heading~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <compass>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <compass>))
  "Converts a ROS message object to a list"
  (cl:list 'compass
    (cl:cons ':compass_receivedTime (compass_receivedTime msg))
    (cl:cons ':compass_heading (compass_heading msg))
))
