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

class compass {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.compass_receivedTime = null;
      this.compass_heading = null;
    }
    else {
      if (initObj.hasOwnProperty('compass_receivedTime')) {
        this.compass_receivedTime = initObj.compass_receivedTime
      }
      else {
        this.compass_receivedTime = 0.0;
      }
      if (initObj.hasOwnProperty('compass_heading')) {
        this.compass_heading = initObj.compass_heading
      }
      else {
        this.compass_heading = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type compass
    // Serialize message field [compass_receivedTime]
    bufferOffset = _serializer.float64(obj.compass_receivedTime, buffer, bufferOffset);
    // Serialize message field [compass_heading]
    bufferOffset = _serializer.float64(obj.compass_heading, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type compass
    let len;
    let data = new compass(null);
    // Deserialize message field [compass_receivedTime]
    data.compass_receivedTime = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [compass_heading]
    data.compass_heading = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kingfisher_msgs/compass';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e353f687f3a4ad2733487eb5dba3f883';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 compass_receivedTime
    float64 compass_heading
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new compass(null);
    if (msg.compass_receivedTime !== undefined) {
      resolved.compass_receivedTime = msg.compass_receivedTime;
    }
    else {
      resolved.compass_receivedTime = 0.0
    }

    if (msg.compass_heading !== undefined) {
      resolved.compass_heading = msg.compass_heading;
    }
    else {
      resolved.compass_heading = 0.0
    }

    return resolved;
    }
};

module.exports = compass;
