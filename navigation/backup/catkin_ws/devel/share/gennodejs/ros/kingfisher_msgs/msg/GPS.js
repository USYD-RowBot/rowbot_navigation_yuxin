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

class GPS {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.GPS_receivedTime = null;
      this.GPS_latitude = null;
      this.GPS_longitude = null;
    }
    else {
      if (initObj.hasOwnProperty('GPS_receivedTime')) {
        this.GPS_receivedTime = initObj.GPS_receivedTime
      }
      else {
        this.GPS_receivedTime = 0.0;
      }
      if (initObj.hasOwnProperty('GPS_latitude')) {
        this.GPS_latitude = initObj.GPS_latitude
      }
      else {
        this.GPS_latitude = 0.0;
      }
      if (initObj.hasOwnProperty('GPS_longitude')) {
        this.GPS_longitude = initObj.GPS_longitude
      }
      else {
        this.GPS_longitude = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GPS
    // Serialize message field [GPS_receivedTime]
    bufferOffset = _serializer.float64(obj.GPS_receivedTime, buffer, bufferOffset);
    // Serialize message field [GPS_latitude]
    bufferOffset = _serializer.float64(obj.GPS_latitude, buffer, bufferOffset);
    // Serialize message field [GPS_longitude]
    bufferOffset = _serializer.float64(obj.GPS_longitude, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GPS
    let len;
    let data = new GPS(null);
    // Deserialize message field [GPS_receivedTime]
    data.GPS_receivedTime = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [GPS_latitude]
    data.GPS_latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [GPS_longitude]
    data.GPS_longitude = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kingfisher_msgs/GPS';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8f1b89d4744f53db1d3b5b2ee7066ef1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 GPS_receivedTime
    float64 GPS_latitude
    float64 GPS_longitude
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GPS(null);
    if (msg.GPS_receivedTime !== undefined) {
      resolved.GPS_receivedTime = msg.GPS_receivedTime;
    }
    else {
      resolved.GPS_receivedTime = 0.0
    }

    if (msg.GPS_latitude !== undefined) {
      resolved.GPS_latitude = msg.GPS_latitude;
    }
    else {
      resolved.GPS_latitude = 0.0
    }

    if (msg.GPS_longitude !== undefined) {
      resolved.GPS_longitude = msg.GPS_longitude;
    }
    else {
      resolved.GPS_longitude = 0.0
    }

    return resolved;
    }
};

module.exports = GPS;
