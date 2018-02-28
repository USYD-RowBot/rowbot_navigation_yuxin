COMMON = {
    'forward': 1, 
    'backward': 0
}


MANUAL = {
    'motorCommand_log_period': 0.5,
    'scalar_diffThr': 1,      # this is a scalar on how much effect rotation has
    'rc_armed':1              # this is radio rc value, value 1 as armed for hhigh-level manual, 3 is when SW2 is on (low-level manual)
}


MONITOR = { # values in this config might be too aggresive
    'log_period': 0.5,
    'low_battery_voltage': 13, # voltage volts
    'current_limit_each': 20, # 20A each
    'pcb_temperature_limit': 50, # degree celsius
    'rc_no_signal': 0
}


GPS = {
    'log_period': 0.5,
    'read_period': 0.01,
    'ublox_baudrate': 9600,
    'GPS_port': '/dev/ttyACM0'
}


COMPASS = {
    'log_period': 0.5,
    'read_period': 0.01,
    'compass_baudrate': 9600,
    'compass_port': '/dev/ttyUSB1'
}


NAV = {
    'log_period': 0.75,
    'dist_threshold': 0.02,   # in km, distance to waypoint less than this value then considered arrived
    'POShold_threshold': 0.003, # when less than this value, no action taken
    'POShold_heading_threshold': 30, # in degree, when larger than this value, correct heading first
    'heading_kp': -0.0006,
    'heading_kd': -0.00003,
    'heading_ki': -0,         # no integral part so far
    'heading_iTermSaturation': 0.3,
    'heading_output_limit': 0.75,
    'throttle_kp': 15.0,
    'throttle_kd': 5.0,
    'throttle_ki': 0,         # no integral part so far
    'throttle_iTermSaturation': 0.3,
    'throttle_output_limit': 0.15, # change this value before testing in water! # recommanded value 0.75
    'loop_rate': 8,           # the rate here shall be less than the GPS publish rate to prevent lag
    'cruise_throttle': 0.12,  # change this value before testing in water! # recommanded value 0.75
    'waypoints': [[-33.534600,151.115900],[-33.534000,151.116000],[-33.531140,151.117000]]
}


