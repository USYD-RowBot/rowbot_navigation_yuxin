// Auto-generated. Do not edit!

// (in-package kingfisher_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Sense {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.battery = null;
      this.current_left = null;
      this.current_right = null;
      this.pcb_temperature = null;
      this.fan_on = null;
      this.rc = null;
      this.rc_throttle = null;
      this.rc_rotation = null;
      this.rc_enable = null;
    }
    else {
      if (initObj.hasOwnProperty('battery')) {
        this.battery = initObj.battery
      }
      else {
        this.battery = 0.0;
      }
      if (initObj.hasOwnProperty('current_left')) {
        this.current_left = initObj.current_left
      }
      else {
        this.current_left = 0.0;
      }
      if (initObj.hasOwnProperty('current_right')) {
        this.current_right = initObj.current_right
      }
      else {
        this.current_right = 0.0;
      }
      if (initObj.hasOwnProperty('pcb_temperature')) {
        this.pcb_temperature = initObj.pcb_temperature
      }
      else {
        this.pcb_temperature = 0.0;
      }
      if (initObj.hasOwnProperty('fan_on')) {
        this.fan_on = initObj.fan_on
      }
      else {
        this.fan_on = false;
      }
      if (initObj.hasOwnProperty('rc')) {
        this.rc = initObj.rc
      }
      else {
        this.rc = 0;
      }
      if (initObj.hasOwnProperty('rc_throttle')) {
        this.rc_throttle = initObj.rc_throttle
      }
      else {
        this.rc_throttle = 0;
      }
      if (initObj.hasOwnProperty('rc_rotation')) {
        this.rc_rotation = initObj.rc_rotation
      }
      else {
        this.rc_rotation = 0;
      }
      if (initObj.hasOwnProperty('rc_enable')) {
        this.rc_enable = initObj.rc_enable
      }
      else {
        this.rc_enable = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Sense
    // Serialize message field [battery]
    bufferOffset = _serializer.float32(obj.battery, buffer, bufferOffset);
    // Serialize message field [current_left]
    bufferOffset = _serializer.float32(obj.current_left, buffer, bufferOffset);
    // Serialize message field [current_right]
    bufferOffset = _serializer.float32(obj.current_right, buffer, bufferOffset);
    // Serialize message field [pcb_temperature]
    bufferOffset = _serializer.float32(obj.pcb_temperature, buffer, bufferOffset);
    // Serialize message field [fan_on]
    bufferOffset = _serializer.bool(obj.fan_on, buffer, bufferOffset);
    // Serialize message field [rc]
    bufferOffset = _serializer.uint8(obj.rc, buffer, bufferOffset);
    // Serialize message field [rc_throttle]
    bufferOffset = _serializer.uint16(obj.rc_throttle, buffer, bufferOffset);
    // Serialize message field [rc_rotation]
    bufferOffset = _serializer.uint16(obj.rc_rotation, buffer, bufferOffset);
    // Serialize message field [rc_enable]
    bufferOffset = _serializer.uint16(obj.rc_enable, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Sense
    let len;
    let data = new Sense(null);
    // Deserialize message field [battery]
    data.battery = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [current_left]
    data.current_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [current_right]
    data.current_right = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pcb_temperature]
    data.pcb_temperature = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fan_on]
    data.fan_on = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [rc]
    data.rc = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [rc_throttle]
    data.rc_throttle = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [rc_rotation]
    data.rc_rotation = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [rc_enable]
    data.rc_enable = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kingfisher_msgs/Sense';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b0209acddc7f26d2e3dc1338d6c4df94';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Voltage level of battery, in volts
    float32 battery
    
    # Instantaneous current drawn by each motor, in amps.
    float32 current_left
    float32 current_right
    
    # Temperature of PCB as measured by internal AVR thermometer,
    # reported in degrees centigrade.
    float32 pcb_temperature
    bool fan_on
    
    # Bitfield represents status of hobby R/C override.
    uint8 RC_INRANGE=1
    uint8 RC_INUSE=2
    uint8 rc
    
    # Pulse lengths received from the three R/C channels.
    uint16 rc_throttle
    uint16 rc_rotation
    uint16 rc_enable
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Sense(null);
    if (msg.battery !== undefined) {
      resolved.battery = msg.battery;
    }
    else {
      resolved.battery = 0.0
    }

    if (msg.current_left !== undefined) {
      resolved.current_left = msg.current_left;
    }
    else {
      resolved.current_left = 0.0
    }

    if (msg.current_right !== undefined) {
      resolved.current_right = msg.current_right;
    }
    else {
      resolved.current_right = 0.0
    }

    if (msg.pcb_temperature !== undefined) {
      resolved.pcb_temperature = msg.pcb_temperature;
    }
    else {
      resolved.pcb_temperature = 0.0
    }

    if (msg.fan_on !== undefined) {
      resolved.fan_on = msg.fan_on;
    }
    else {
      resolved.fan_on = false
    }

    if (msg.rc !== undefined) {
      resolved.rc = msg.rc;
    }
    else {
      resolved.rc = 0
    }

    if (msg.rc_throttle !== undefined) {
      resolved.rc_throttle = msg.rc_throttle;
    }
    else {
      resolved.rc_throttle = 0
    }

    if (msg.rc_rotation !== undefined) {
      resolved.rc_rotation = msg.rc_rotation;
    }
    else {
      resolved.rc_rotation = 0
    }

    if (msg.rc_enable !== undefined) {
      resolved.rc_enable = msg.rc_enable;
    }
    else {
      resolved.rc_enable = 0
    }

    return resolved;
    }
};

// Constants for message
Sense.Constants = {
  RC_INRANGE: 1,
  RC_INUSE: 2,
}

module.exports = Sense;
