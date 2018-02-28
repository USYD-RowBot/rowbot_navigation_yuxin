#!/usr/bin/env python
# Software License Agreement (BSD License)


import rospy,serial,time,sys,signal,decimal 
import config
from kingfisher_msgs.msg import Sense


# quit when Ctrl+C pressed
def signal_handler(signal, frame):
        print('Ctrl+C detected, exiting program')
        sys.exit(0)


# check values from /sense topic
def callback(msg):

    flag=0

    if msg.battery<config.MONITOR['low_battery_voltage']:
	rospy.logwarn_throttle(config.MONITOR['log_period'],"Battery voltage low: %f"%(msg.battery))
	flag = 1

    if msg.current_left>config.MONITOR['current_limit_each']:
	rospy.logwarn_throttle(config.MONITOR['log_period'],"Left motor current high: %f"%(msg.current_left))
	flag = 1
    
    if msg.current_right>config.MONITOR['current_limit_each']:
	rospy.logwarn_throttle(config.MONITOR['log_period'],"Right motor current high: %f"%(msg.current_right))
	flag = 1

    if msg.pcb_temperature>config.MONITOR['pcb_temperature_limit']:
	rospy.logwarn_throttle(config.MONITOR['log_period'],"PCB temperature high: %f"%(msg.pcb_temperature))
	flag = 1

    if msg.rc==config.MONITOR['rc_no_signal']:
	rospy.logwarn_throttle(config.MONITOR['log_period'],"No radio controller signal")
	flag = 1

    if flag==0:
	rospy.loginfo_throttle(config.MONITOR['log_period'],"No abnormalities detected")



def monitor():

    rospy.init_node('listener', anonymous=True)
    #x=port.readline().decode()

    rospy.Subscriber('/sense', Sense, callback)  # it finds the newest message
    rospy.spin() # this fixes the lag/ latency




signal.signal(signal.SIGINT, signal_handler)

if __name__ == '__main__':
    monitor()


