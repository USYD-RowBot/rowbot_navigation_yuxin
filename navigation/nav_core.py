import rospy,decimal,time,sys,math
import config


class Navigation:

    def __init__(self):

	self.heading = 0.0
	self.longitude = 0.0
	self.latitude = 0.0
	self.waypointIndex = -1
	self.targetHeading = 0.0
	self.targetDistance = 0.0
	self.PID_heading_lastError = 0.0
	self.PID_heading_e_sum = 0.0
	self.PID_throttle_lastError = 0.0
	self.PID_throttle_e_sum = 0.0

        # waypoints to be stored here in the list, format [[latitude,longitude],[...,...],....]
	self.waypoints = config.NAV['waypoints']


    def updateHeading(self,heading):

	self.heading = heading


    def updateCoordinate(self,latitude,longitude):

	self.latitude = latitude
	self.longitude = longitude


    def updateNextWaypoint(self):

	# note: when arrive at final point, should implement stopping
	if self.waypointIndex<(len(self.waypoints)-1):	
	    self.waypointIndex+=1

	self.currentTargetPoint = [decimal.Decimal(self.waypoints[self.waypointIndex][0]),decimal.Decimal(self.waypoints[self.waypointIndex][1])]


    def checkIfLastWaypoint(self):
	
	if self.waypointIndex<(len(self.waypoints)-1):
	    return False
	else:
	    return True
	

    # calculate distance between current coordinate and target waypoint, if less than threshold, then considered reached waypoint
    def checkWaypointsArrived(self,distanceThreshold):

        R = 6373.0              # earth radius in km

        lat1 = math.radians(self.latitude)
        lon1 = math.radians(self.longitude)
        lat2 = math.radians(self.currentTargetPoint[0])
        lon2 = math.radians(self.currentTargetPoint[1])

        dlon = lon2 - lon1
        dlat = lat2 - lat1

        a = math.sin(dlat / 2)**2 + math.cos(lat1) * math.cos(lat2) * math.sin(dlon / 2)**2
        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

        distance = R * c
	self.targetDistance = distance

        rospy.loginfo_throttle(config.NAV['log_period'],'Distance to next waypoint: %fkm'%(distance))

        if distance<distanceThreshold:  # if less than a certain distance from waypoint
	    return True

        return False


    # compute heading toward the target waypoint based on current GPS position
    def computeHeadingToTarget(self): # math by jeromer on Github

        lat1 = math.radians(self.latitude)
        lat2 = math.radians(self.currentTargetPoint[0])

        diffLong = math.radians(self.currentTargetPoint[1] - self.longitude)

        x = math.sin(diffLong) * math.cos(lat2)
        y = math.cos(lat1) * math.sin(lat2) - (math.sin(lat1)
                * math.cos(lat2) * math.cos(diffLong))

        initial_bearing = math.atan2(x, y)

        initial_bearing = math.degrees(initial_bearing)
        compass_bearing = (initial_bearing + 360) % 360

        rospy.loginfo_throttle(config.NAV['log_period'],'Target heading: %f  Target latitude: %f  Target longitude: %f'%(compass_bearing,self.currentTargetPoint[0],self.currentTargetPoint[1]))

        self.targetHeading = compass_bearing


    # using PID to reach the target heading 
    def headingPID(self):

        kp = config.NAV['heading_kp']
        kd = config.NAV['heading_kd']
        ki = config.NAV['heading_ki']
        iTermSaturation = config.NAV['heading_iTermSaturation'] 
        output_limit = config.NAV['heading_output_limit'] 
	
	error = self.targetHeading - self.heading
	if error>180:
	    error -= 360
	if error<-180:
	    error += 360 # for cases when the nominal difference of two heading exceeds 180 degree (e.g. target 10, current 350) 

        self.PID_heading_e_sum += error

        s1 = kp*error
        s2 = kd*(error-self.PID_heading_lastError)
        s3 = ki*self.PID_heading_e_sum

        if (s3>iTermSaturation):  # prevent integral wind-up
            s3  =iTermSaturation
        if (s3<-iTermSaturation):
            s3 = -iTermSaturation   

        output=s1+s2+s3

        if output>output_limit:
	    output = output_limit
        if output<-1*output_limit:
	    output = -1*output_limit


        self.PID_heading_lastError = error  # saved as last error


        return output


    # using PID to reach the target heading 
    def throttlePID(self):

        kp = config.NAV['throttle_kp']
        kd = config.NAV['throttle_kd']
        ki = config.NAV['throttle_ki']
        iTermSaturation = config.NAV['throttle_iTermSaturation'] 
        output_limit = config.NAV['throttle_output_limit'] 
	
	error = self.targetDistance

        self.PID_throttle_e_sum += error

        s1 = kp*error
        s2 = kd*(error-self.PID_throttle_lastError)
        s3 = ki*self.PID_throttle_e_sum

        if (s3>iTermSaturation):  # prevent integral wind-up
            s3  =iTermSaturation
        if (s3<-iTermSaturation):
            s3 = -iTermSaturation   

        output=s1+s2+s3

        if output>output_limit:
	    output = output_limit
        if output<-1*output_limit:
	    output = -1*output_limit


        self.PID_throttle_lastError = error  # saved as last error


        return output


    # hold in position
    def POShold(self):
	
	if self.checkWaypointsArrived(config.NAV['POShold_threshold']): # no action if close enough

	    return 0.0,0.0

	else:

	    headingDiff = self.heading-self.targetHeading

	    if headingDiff>180:  #  correct difference value to true difference
	        headingDiff -= 360
	    if headingDiff<-180:
	        headingDiff += 360 


	    if abs(headingDiff)<config.NAV['POShold_heading_threshold']: # if heading is not grossly wrong

	        return self.throttlePID(),self.headingPID()

	    elif abs(abs(headingDiff)-180.0)<config.NAV['POShold_heading_threshold']:# if heading is oppsite

		return -1*self.throttlePID(),0.0 # can optionally implement backward heading adjustment

	    else:

		return 0.0,self.headingPID() # if heading is grossly wrong, only correct heading




