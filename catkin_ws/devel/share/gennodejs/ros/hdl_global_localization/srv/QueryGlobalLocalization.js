// Auto-generated. Do not edit!

// (in-package hdl_global_localization.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class QueryGlobalLocalizationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.max_num_candidates = null;
      this.cloud = null;
    }
    else {
      if (initObj.hasOwnProperty('max_num_candidates')) {
        this.max_num_candidates = initObj.max_num_candidates
      }
      else {
        this.max_num_candidates = 0;
      }
      if (initObj.hasOwnProperty('cloud')) {
        this.cloud = initObj.cloud
      }
      else {
        this.cloud = new sensor_msgs.msg.PointCloud2();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type QueryGlobalLocalizationRequest
    // Serialize message field [max_num_candidates]
    bufferOffset = _serializer.int64(obj.max_num_candidates, buffer, bufferOffset);
    // Serialize message field [cloud]
    bufferOffset = sensor_msgs.msg.PointCloud2.serialize(obj.cloud, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type QueryGlobalLocalizationRequest
    let len;
    let data = new QueryGlobalLocalizationRequest(null);
    // Deserialize message field [max_num_candidates]
    data.max_num_candidates = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [cloud]
    data.cloud = sensor_msgs.msg.PointCloud2.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.PointCloud2.getMessageSize(object.cloud);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hdl_global_localization/QueryGlobalLocalizationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0802ea456537ff7eae03a65bc7019e2c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 max_num_candidates
    sensor_msgs/PointCloud2 cloud
    
    ================================================================================
    MSG: sensor_msgs/PointCloud2
    # This message holds a collection of N-dimensional points, which may
    # contain additional information such as normals, intensity, etc. The
    # point data is stored as a binary blob, its layout described by the
    # contents of the "fields" array.
    
    # The point cloud data may be organized 2d (image-like) or 1d
    # (unordered). Point clouds organized as 2d images may be produced by
    # camera depth sensors such as stereo or time-of-flight.
    
    # Time of sensor data acquisition, and the coordinate frame ID (for 3d
    # points).
    Header header
    
    # 2D structure of the point cloud. If the cloud is unordered, height is
    # 1 and width is the length of the point cloud.
    uint32 height
    uint32 width
    
    # Describes the channels and their layout in the binary data blob.
    PointField[] fields
    
    bool    is_bigendian # Is this data bigendian?
    uint32  point_step   # Length of a point in bytes
    uint32  row_step     # Length of a row in bytes
    uint8[] data         # Actual point data, size is (row_step*height)
    
    bool is_dense        # True if there are no invalid points
    
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
    string frame_id
    
    ================================================================================
    MSG: sensor_msgs/PointField
    # This message holds the description of one point entry in the
    # PointCloud2 message format.
    uint8 INT8    = 1
    uint8 UINT8   = 2
    uint8 INT16   = 3
    uint8 UINT16  = 4
    uint8 INT32   = 5
    uint8 UINT32  = 6
    uint8 FLOAT32 = 7
    uint8 FLOAT64 = 8
    
    string name      # Name of field
    uint32 offset    # Offset from start of point struct
    uint8  datatype  # Datatype enumeration, see above
    uint32 count     # How many elements in the field
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new QueryGlobalLocalizationRequest(null);
    if (msg.max_num_candidates !== undefined) {
      resolved.max_num_candidates = msg.max_num_candidates;
    }
    else {
      resolved.max_num_candidates = 0
    }

    if (msg.cloud !== undefined) {
      resolved.cloud = sensor_msgs.msg.PointCloud2.Resolve(msg.cloud)
    }
    else {
      resolved.cloud = new sensor_msgs.msg.PointCloud2()
    }

    return resolved;
    }
};

class QueryGlobalLocalizationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.globalmap_header = null;
      this.inlier_fractions = null;
      this.errors = null;
      this.poses = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('globalmap_header')) {
        this.globalmap_header = initObj.globalmap_header
      }
      else {
        this.globalmap_header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('inlier_fractions')) {
        this.inlier_fractions = initObj.inlier_fractions
      }
      else {
        this.inlier_fractions = [];
      }
      if (initObj.hasOwnProperty('errors')) {
        this.errors = initObj.errors
      }
      else {
        this.errors = [];
      }
      if (initObj.hasOwnProperty('poses')) {
        this.poses = initObj.poses
      }
      else {
        this.poses = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type QueryGlobalLocalizationResponse
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [globalmap_header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.globalmap_header, buffer, bufferOffset);
    // Serialize message field [inlier_fractions]
    bufferOffset = _arraySerializer.float64(obj.inlier_fractions, buffer, bufferOffset, null);
    // Serialize message field [errors]
    bufferOffset = _arraySerializer.float64(obj.errors, buffer, bufferOffset, null);
    // Serialize message field [poses]
    // Serialize the length for message field [poses]
    bufferOffset = _serializer.uint32(obj.poses.length, buffer, bufferOffset);
    obj.poses.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type QueryGlobalLocalizationResponse
    let len;
    let data = new QueryGlobalLocalizationResponse(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [globalmap_header]
    data.globalmap_header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [inlier_fractions]
    data.inlier_fractions = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [errors]
    data.errors = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [poses]
    // Deserialize array length for message field [poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.poses[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += std_msgs.msg.Header.getMessageSize(object.globalmap_header);
    length += 8 * object.inlier_fractions.length;
    length += 8 * object.errors.length;
    length += 56 * object.poses.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hdl_global_localization/QueryGlobalLocalizationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a537b478ec66ac3888e62265f7d9d901';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    std_msgs/Header globalmap_header
    
    float64[] inlier_fractions
    float64[] errors
    geometry_msgs/Pose[] poses
    
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
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new QueryGlobalLocalizationResponse(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.globalmap_header !== undefined) {
      resolved.globalmap_header = std_msgs.msg.Header.Resolve(msg.globalmap_header)
    }
    else {
      resolved.globalmap_header = new std_msgs.msg.Header()
    }

    if (msg.inlier_fractions !== undefined) {
      resolved.inlier_fractions = msg.inlier_fractions;
    }
    else {
      resolved.inlier_fractions = []
    }

    if (msg.errors !== undefined) {
      resolved.errors = msg.errors;
    }
    else {
      resolved.errors = []
    }

    if (msg.poses !== undefined) {
      resolved.poses = new Array(msg.poses.length);
      for (let i = 0; i < resolved.poses.length; ++i) {
        resolved.poses[i] = geometry_msgs.msg.Pose.Resolve(msg.poses[i]);
      }
    }
    else {
      resolved.poses = []
    }

    return resolved;
    }
};

module.exports = {
  Request: QueryGlobalLocalizationRequest,
  Response: QueryGlobalLocalizationResponse,
  md5sum() { return '2e563a5d7af1f98cbac55cf8c1e0a1ba'; },
  datatype() { return 'hdl_global_localization/QueryGlobalLocalization'; }
};
