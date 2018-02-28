#!/usr/bin/env python
# Software License Agreement (BSD License)
# in development

import rospy,serial,time,sys,signal,decimal
import config
from kingfisher_msgs.msg import Sense
from kingfisher_msgs.msg import Drive



# quit when Ctrl+C pressed
def signal_handler(signal, frame):
    print('Ctrl+C detected, exiting program')
    sys.exit(0)



# send calculated throttle value to motor via /cmd_drive topic
def sendMotorCommand(enabled,thr,diffThr):

    msg = Drive()


    if enabled!=config.MANUAL['rc_armed']:

	msg.left = 0
	msg.right = 0
	rospy.logwarn_throttle(config.MANUAL['motorCommand_log_period'],"Radio controller not detected or enabled")

    else:

        scalar_diffThr = config.MANUAL['scalar_diffThr']

        #print(thr,diffThr) # for debug use

        thr2 = decimal.Decimal(-1*(thr-1500))/500
        diffThr2 = decimal.Decimal(-1*(diffThr-1500))/500

        #print(thr2,diffThr2) # for debug use

        msg.left = thr2-scalar_diffThr*diffThr2
        msg.right = thr2+scalar_diffThr*diffThr2

        if msg.left>1:
	    msg.left = 1
        if msg.left<-1:
	    msg.left = -1
        if msg.right>1:
	    msg.right = 1
        if msg.right<-1:
	    msg.right = -1


    pub = rospy.Publisher('/cmd_drive', Drive,queue_size=1)
    #msg.header.stamp = rospy.Time.now()
    rospy.loginfo("Manual motor command: Left: %f Right: %f"%(msg.left,msg.right))
    pub.publish(msg)



# ROS callback function
def callback(msg): # values in this function might be too aggresive

    sendMotorCommand(msg.rc,msg.rc_throttle,msg.rc_rotation)



# manual control
def manual():

    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber('/sense', Sense, callback)  # it finds the newest message

    rospy.spin() # prevent from quitting # this fixes the lag/ latency issue






signal.signal(signal.SIGINT, signal_handler)

if __name__ == '__main__':
    manual()


