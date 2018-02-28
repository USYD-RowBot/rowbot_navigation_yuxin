## Navigation ##
Navigation program enables Kingfisher to follow waypoints and hold in a given position. Associated supports written for the navigation can also be used in manual control and other scenarios. 

Support packages for Kingfisher were not used as they become obsolete and incompatible with Ubuntu 16.

Shell scripts are available in the navigation/shellScripts/ for bringing up essential services including ROS core, GPS, compass, serial communication and system monitor.

Drivers for GPS and compass are programmed to be integrated with ROS. GPS driver is available in both LCM and ROS versions.

A system monitor is programmed to check system health in the background, including radio signal, battery voltage, current and PCB temperature.

Configuration is done via config.py where parameters and waypoints coordinate for navigation are stored.

Manual control is written in high-level ROS to control the throttle and rotation. Note low-level manual control with similar functionality is also offered in MCU with no configuration option.

Autonomous navigation starts with receiving current GPS coordinate, then comparing the current position with first waypoint, if the distance is larger than threshold, a target heading to the waypoint is computed, then PID controller adjusts the throttle of each motor to reach target heading. When the target waypoint is reached, the next waypoint is set. The last waypoint in the list will be the point for POS hold. core_nav.py stores core navigation logic which is wrapped up as a class to be called by nav.py.

A typical interface of the Kingfisher navigation services is as below:

![Screenshot](navigation/backup/screenshot/YuxinScreenshot4-cropped.png?raw=true "Screenshot")

## Kingfisher ##
Kingfisher hardware documentation is in /navigation/doc folder. 
