#!/usr/bin/env python
# Software License Agreement (BSD License)
#
# Copyright (c) 2008, Willow Garage, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of Willow Garage, Inc. nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Revision $Id$

## Simple talker demo that published std_msgs/Strings messages
## to the 'chatter' topic

import rospy
from std_msgs.msg import String

import serial,time
import decimal
# port config


def talker():
	x=port.readline().decode() # read from serial port

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
			s=s+"Longitude:|"+str(longitude)+"|,|E|"
		else:
			receivedString=x.split(west)
			i=len(receivedString[0])
			while receivedString[0][i-1]!=splitChar:
				i-=1
			longitude=receivedString[0][i:len(receivedString[0])]
			longitude = decimal.Decimal(longitudeS)/100
			s=s+"Longitude:|"+str(longitude)+"|,|W|"
		if south in x:
			southI=1
			receivedString=x.split(south)
			i=len(receivedString[0])
			while receivedString[0][i-1]!=splitChar:
				i-=1
			latitudeS=receivedString[0][i:len(receivedString[0])]
			latitude = decimal.Decimal(latitudeS)/100
			s=s+";Latitude:|"+str(latitude)+"|,|S|"
		else:
			receivedString=x.split(north)
			i=len(receivedString[0])
			while receivedString[0][i-1]!=splitChar:
				i-=1
			latitude=receivedString[0][i:len(receivedString[0])]
			latitude = decimal.Decimal(latitudeS)/100
			s=s+";Latitude:|"+str(latitude)+"|,|N|"

		print(s)

		pub = rospy.Publisher('GPS', String, queue_size=10)
		rospy.init_node('talker', anonymous=True)
		rate = rospy.Rate(10) # 10hz
		while not rospy.is_shutdown():
        		hello_str = s+";Time:%s" % rospy.get_time()
        		rospy.loginfo(hello_str)
        		pub.publish(hello_str)
        		rate.sleep()


port = serial.Serial(
        port='/dev/ttyACM0',\
        baudrate=9600,\
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


while True:
	talker()
'''
if __name__ == '__main__':
	try:
		talker()
	except rospy.ROSInterruptException:
		pass
'''
