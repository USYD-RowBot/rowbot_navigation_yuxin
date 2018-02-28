#!/usr/bin/env python
# Software License Agreement (BSD License)


import rospy,sys,signal,time,serial,decimal
import config
from kingfisher_msgs.msg import compass



# quit when Ctrl+C pressed
def signal_handler(signal, frame):
        print('Ctrl+C detected, exiting program')
        sys.exit(0)


# publish heading value to /compass topic
def talker():
	#x=port.readline().decode() # read from serial port # to be uncommented

	msg=compass()
	msg.compass_receivedTime=time.time()
	msg.compass_heading=358.31  # placeholder

        rospy.loginfo_throttle(config.COMPASS['log_period'],msg)
        pub.publish(msg)


''' # to be uncommented
port = serial.Serial(
        port=config.COMPASS['compass_port'],\
        baudrate=config.COMPASS['compass_baudrate'],\
        parity=serial.PARITY_NONE,\
        stopbits=serial.STOPBITS_ONE,\
        bytesize=serial.EIGHTBITS,\
        xonxoff=False,\
        rtscts=False,\
        dsrdtr=False,\
            timeout=0) #115200, 8, N, 1, timeout 0


port.isOpen()
'''

pub = rospy.Publisher('/compass', compass, queue_size=1)
rospy.init_node('talker', anonymous=True)
signal.signal(signal.SIGINT, signal_handler)


while True:

    talker()
    time.sleep(config.COMPASS['read_period'])

