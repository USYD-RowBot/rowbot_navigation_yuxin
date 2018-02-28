; Auto-generated. Do not edit!


(cl:in-package kingfisher_msgs-msg)


;//! \htmlinclude Drive.msg.html

(cl:defclass <Drive> (roslisp-msg-protocol:ros-message)
  ((left
    :reader left
    :initarg :left
    :type cl:float
    :initform 0.0)
   (right
    :reader right
    :initarg :right
    :type cl:float
    :initform 0.0))
)

(cl:defclass Drive (<Drive>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Drive>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Drive)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kingfisher_msgs-msg:<Drive> is deprecated: use kingfisher_msgs-msg:Drive instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <Drive>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kingfisher_msgs-msg:left-val is deprecated.  Use kingfisher_msgs-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <Drive>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kingfisher_msgs-msg:right-val is deprecated.  Use kingfisher_msgs-msg:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Drive>) ostream)
  "Serializes a message object of type '<Drive>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Drive>) istream)
  "Deserializes a message object of type '<Drive>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Drive>)))
  "Returns string type for a message object of type '<Drive>"
  "kingfisher_msgs/Drive")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Drive)))
  "Returns string type for a message object of type 'Drive"
  "kingfisher_msgs/Drive")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Drive>)))
  "Returns md5sum for a message object of type '<Drive>"
  "3a927990ab5d5c3d628e2d52b8533e52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Drive)))
  "Returns md5sum for a message object of type 'Drive"
  "3a927990ab5d5c3d628e2d52b8533e52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Drive>)))
  "Returns full string definition for message of type '<Drive>"
  (cl:format cl:nil "# Command thrust level for Kingfisher thruster,~%# range from [-1.0..1.0], where 1.0 is forward.~%float32 left~%float32 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Drive)))
  "Returns full string definition for message of type 'Drive"
  (cl:format cl:nil "# Command thrust level for Kingfisher thruster,~%# range from [-1.0..1.0], where 1.0 is forward.~%float32 left~%float32 right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Drive>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Drive>))
  "Converts a ROS message object to a list"
  (cl:list 'Drive
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
