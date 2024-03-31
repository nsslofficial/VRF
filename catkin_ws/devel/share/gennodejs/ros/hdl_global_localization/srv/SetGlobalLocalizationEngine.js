// Auto-generated. Do not edit!

// (in-package hdl_global_localization.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetGlobalLocalizationEngineRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.engine_name = null;
    }
    else {
      if (initObj.hasOwnProperty('engine_name')) {
        this.engine_name = initObj.engine_name
      }
      else {
        this.engine_name = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetGlobalLocalizationEngineRequest
    // Serialize message field [engine_name]
    bufferOffset = std_msgs.msg.String.serialize(obj.engine_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetGlobalLocalizationEngineRequest
    let len;
    let data = new SetGlobalLocalizationEngineRequest(null);
    // Deserialize message field [engine_name]
    data.engine_name = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.engine_name);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hdl_global_localization/SetGlobalLocalizationEngineRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f71639c3aeb058fa00da5a20981c23c9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/String engine_name
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetGlobalLocalizationEngineRequest(null);
    if (msg.engine_name !== undefined) {
      resolved.engine_name = std_msgs.msg.String.Resolve(msg.engine_name)
    }
    else {
      resolved.engine_name = new std_msgs.msg.String()
    }

    return resolved;
    }
};

class SetGlobalLocalizationEngineResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetGlobalLocalizationEngineResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetGlobalLocalizationEngineResponse
    let len;
    let data = new SetGlobalLocalizationEngineResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hdl_global_localization/SetGlobalLocalizationEngineResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetGlobalLocalizationEngineResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetGlobalLocalizationEngineRequest,
  Response: SetGlobalLocalizationEngineResponse,
  md5sum() { return 'f71639c3aeb058fa00da5a20981c23c9'; },
  datatype() { return 'hdl_global_localization/SetGlobalLocalizationEngine'; }
};
