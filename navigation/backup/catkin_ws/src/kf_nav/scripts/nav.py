#!/usr/bin/env python
# Software License Agreement (BSD License)

 
import rospy,decimal,time,random,signal,sys,math
import config
from kingfisher_msgs.msg import Drive
from kingfisher_msgs.msg import GPS
from kingfisher_msgs.msg import compass
from nav_core import Navigation



# quit when Ctrl+C pressed
def signal_handler(signal, frame):

    print('Ctrl+C detected, exiting program')
    sys.exit(0)



# handle GPS coordinate from GPS channel
def GPSdataHandler(data):

    global longitude,latitude,GPS_lastReceivedTime   # global as ROS callback function does not provide a way to return variable

    receivedTime = data.GPS_receivedTime

    if GPS_lastReceivedTime>=receivedTime: # if the message is not newest
	return

    GPS_lastReceivedTime = receivedTime

    longitude = decimal.Decimal(data.GPS_longitude)
    latitude = decimal.Decimal(data.GPS_latitude)

    rospy.loginfo_throttle(config.NAV['log_period'],"GPS Latitude: %f   GPS Longitude: %f"%(latitude,longitude))



# handle heading from compass channel
def CompassdataHandler(data):

    global heading,compass_lastReceivedTime   # global as ROS callback function does not provide a way to return variable

    receivedTime = data.compass_receivedTime

    if compass_lastReceivedTime>=receivedTime: # if the message is not newest
	return

    compass_lastReceivedTime = receivedTime

    heading = data.compass_heading

    rospy.loginfo_throttle(config.NAV['log_period'],'Compass heading: %f'%(heading))



# compute left and right motor command and send to command channel
def sendMotorCommand(publisher,thr,diffThr):

    msg = Drive()
    #print(thr,diffThr)

    msg.left = thr-diffThr
    msg.right = thr+diffThr

    rospy.loginfo_throttle(config.NAV['log_period'],"Motor command: Left: %f Right: %f"%(msg.left,msg.right))
    publisher.publish(msg)



# navigation function, keeps listening GPS, compass channel and call sendMotorCommand
def nav():
	
    Kingfisher = Navigation() # create an instance from class in nav_core

    Kingfisher.updateNextWaypoint()

    # this is the throttle at autonomous cruise
    throttle = config.NAV['cruise_throttle']

    headingVal = 0.0

    rospy.init_node('listener', anonymous=True)

    rate = rospy.Rate(config.NAV['loop_rate'])

    rospy.Subscriber('/GPS', GPS, GPSdataHandler)             # it finds the newest message
    rospy.Subscriber('/compass', compass, CompassdataHandler)  
    pub = rospy.Publisher('/cmd_drive', Drive,queue_size=1)


    while True:

	Kingfisher.updateHeading(heading)
	Kingfisher.updateCoordinate(latitude,longitude) # obtain current coordinate


	# if reached the waypoint, then go to the next one
	if Kingfisher.checkWaypointsArrived():
	    Kingfisher.updateNextWaypoint()


        # get the heading that boat should aim
	Kingfisher.computeHeadingToTarget()


	# using PID to reach the target heading
	headingVal = Kingfisher.headingPID()


	sendMotorCommand(pub,throttle,headingVal)   # headingVal is differential throttle


	rate.sleep()






longitude = decimal.Decimal(0.0)
latitude = decimal.Decimal(0.0)

heading = 0
targetHeading = 0
GPS_lastReceivedTime = 0.0
compass_lastReceivedTime = 0.0

signal.signal(signal.SIGINT, signal_handler) 


if __name__ == '__main__':
    nav()


