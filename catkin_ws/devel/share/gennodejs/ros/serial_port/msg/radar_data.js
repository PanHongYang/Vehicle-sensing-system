// Auto-generated. Do not edit!

// (in-package serial_port.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class radar_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.radar_msg = null;
    }
    else {
      if (initObj.hasOwnProperty('radar_msg')) {
        this.radar_msg = initObj.radar_msg
      }
      else {
        this.radar_msg = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type radar_data
    // Serialize message field [radar_msg]
    bufferOffset = _serializer.int16(obj.radar_msg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type radar_data
    let len;
    let data = new radar_data(null);
    // Deserialize message field [radar_msg]
    data.radar_msg = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_port/radar_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '02683d36c207f710ce232222df4425ac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 radar_msg
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new radar_data(null);
    if (msg.radar_msg !== undefined) {
      resolved.radar_msg = msg.radar_msg;
    }
    else {
      resolved.radar_msg = 0
    }

    return resolved;
    }
};

module.exports = radar_data;
