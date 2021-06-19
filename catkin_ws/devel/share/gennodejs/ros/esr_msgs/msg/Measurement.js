// Auto-generated. Do not edit!

// (in-package esr_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Status = require('./Status.js');
let Track = require('./Track.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Measurement {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.status = null;
      this.tracks = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = new Status();
      }
      if (initObj.hasOwnProperty('tracks')) {
        this.tracks = initObj.tracks
      }
      else {
        this.tracks = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Measurement
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = Status.serialize(obj.status, buffer, bufferOffset);
    // Serialize message field [tracks]
    // Serialize the length for message field [tracks]
    bufferOffset = _serializer.uint32(obj.tracks.length, buffer, bufferOffset);
    obj.tracks.forEach((val) => {
      bufferOffset = Track.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Measurement
    let len;
    let data = new Measurement(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = Status.deserialize(buffer, bufferOffset);
    // Deserialize message field [tracks]
    // Deserialize array length for message field [tracks]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.tracks = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.tracks[i] = Track.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += Status.getMessageSize(object.status);
    object.tracks.forEach((val) => {
      length += Track.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'esr_msgs/Measurement';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1f00ed2bd4b53e883b8642a3983d0209';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    Status status
    Track[] tracks
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: esr_msgs/Status
    Header header
    # from 4e0
    uint16 scan_index
    #uint8 dsp_timestamp # in ms
    #float32 vehicle_speed # in m/s
    #float32 vehicle_yaw_rate # in in deg/s
    #float32 vehicle_turning_radius # in m
    #float32 range # cropped between 0..204.7 m
    bool is_comm_error
    # from 4e1
    #uint16 steering_angle_ack # in deg
    bool is_radiating
    bool is_failed
    bool is_blocked
    bool is_overheating
    #uint8 max_tracks_ack # 1..64
    bool is_raw_data_mode
    int8 internal_temperature # in degC
    uint16 sw_version
    #float32 yaw_rate_bias # deg/s
    #float32 veh_spd_comp_factor
    # from 4e3
    bool is_lr_enabled
    bool is_mr_enabled
    bool is_sidelobe_blockage
    bool is_partial_blockage
    #float32 auto_align_angle
    
    ================================================================================
    MSG: esr_msgs/Track
    Header header
    uint8 status # 0: no target 1: new 2: new updated 3: updated 4: coasted 5: merged 6: invalid coasted 7: new coasted
    uint8 index # 1..64
    float32 range # cropped between 0..204.7 m
    float32 range_rate # cropped between -81.92..81.91m/s
    float32 range_accl # cropped between -25.6..25.55 m/s^2
    float32 azimuth # cropped between -51.2..51.1 deg
    float32 lateral_rate # cropped between -8..7.75 m/s
    float32 width # cropped between 0..7.5 m
    bool is_mr_update
    bool is_lr_update
    #bool is_oncoming
    #bool is_bridge
    #bool is_grouping_changed
    int8 amplitude # cropped to -10..21dB
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Measurement(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.status !== undefined) {
      resolved.status = Status.Resolve(msg.status)
    }
    else {
      resolved.status = new Status()
    }

    if (msg.tracks !== undefined) {
      resolved.tracks = new Array(msg.tracks.length);
      for (let i = 0; i < resolved.tracks.length; ++i) {
        resolved.tracks[i] = Track.Resolve(msg.tracks[i]);
      }
    }
    else {
      resolved.tracks = []
    }

    return resolved;
    }
};

module.exports = Measurement;
