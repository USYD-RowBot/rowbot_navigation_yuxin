#!/usr/bin/env python
# Software License Agreement (BSD License)


import rospy,sys,signal,time,serial,decimal
import config
from kingfisher_msgs.msg import GPS



def signal_handler(signal, frame):
        print('Ctrl+C detected, exiting program')
        sys.exit(0)



def talker():
	x=port.readline().decode() # read from serial port

	msg=GPS()
	#h=std_msgs.msg.Header()
	#h.stamp = rospy.Time.now()
	msg.GPS_receivedTime=time.time()

	east=",E,"
        south=",S,"
        west=",W,"
        north=",N,"
	splitChar=','

	eastI=0
	southI=0

	if "$GPRMC" in x:
		#print(x)
		s=""

		if east in x:
			eastI=1
			receivedString=x.split(east)
			#print(receivedString[0])
			i=len(receivedString[0])
			while receivedString[0][i-1]!=splitChar:
				i-=1
			longitudeS=receivedString[0][i:len(receivedString[0])]
			#receivedString[0].index(longitude,i,len(receivedString[0]))
			#print(longitude)
			longitude = decimal.Decimal(longitudeS)/100
			#s=s+"Longitude:|"+str(longitude)+"|,|E|"
		else:
			receivedString=x.split(west)
			i=len(receivedString[0])
			while receivedString[0][i-1]!=splitChar:
				i-=1
			longitudeS=receivedString[0][i:len(receivedString[0])]
			longitude = -1*decimal.Decimal(longitudeS)/100
			#s=s+"Longitude:|"+str(longitude)+"|,|W|"
		if south in x:
			southI=1
			receivedString=x.split(south)
			i=len(receivedString[0])
			while receivedString[0][i-1]!=splitChar:
				i-=1
			latitudeS=receivedString[0][i:len(receivedString[0])]
			latitude = -1*decimal.Decimal(latitudeS)/100
			#s=s+";Latitude:|"+str(latitude)+"|,|S|"
		else:
			receivedString=x.split(north)
			i=len(receivedString[0])
			while receivedString[0][i-1]!=splitChar:
				i-=1
			latitudeS=receivedString[0][i:len(receivedString[0])]
			latitude = decimal.Decimal(latitudeS)/100
			#s=s+";Latitude:|"+str(latitude)+"|,|N|"

		#print(s)
        	#strToSend = s+";Time:|%s" % rospy.get_time()

		msg.GPS_latitude=latitude
		msg.GPS_longitude=longitude
		#strToSend
		pub2.publish(msg)
        	rospy.loginfo_throttle(config.GPS['log_period'],msg)

        	#pub.publish(strToSend)


'''
		pub = rospy.Publisher('GPS', String, queue_size=10)
		rospy.init_node('talker', anonymous=True)
		rate = rospy.Rate(10) # 10hz
		while not rospy.is_shutdown():
        		hello_str = s+";Time:%s" % rospy.get_time()
        		rospy.loginfo(hello_str)
        		pub.publish(hello_str)
        		rate.sleep()
'''

port = serial.Serial(
        port=config.GPS['GPS_port'],\
        baudrate=config.GPS['ublox_baudrate'],\
        parity=serial.PARITY_NONE,\
        stopbits=serial.STOPBITS_ONE,\
        bytesize=serial.EIGHTBITS,\
        xonxoff=False,\
        rtscts=False,\
        dsrdtr=False,\
            timeout=0) #115200, 8, N, 1, timeout 0

#port.close()
#port.open()
port.isOpen()


#pub = rospy.Publisher('/GPS', String, queue_size=1)
pub2 = rospy.Publisher('/GPS', GPS, queue_size=1)
rospy.init_node('talker', anonymous=True)
signal.signal(signal.SIGINT, signal_handler)


while True:

	talker()
	time.sleep(config.GPS['read_period'])


