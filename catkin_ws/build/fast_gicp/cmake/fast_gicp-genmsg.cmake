# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "fast_gicp: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ifast_gicp:/workspace/catkin_ws/src/fast_gicp/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(fast_gicp_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg" NAME_WE)
add_custom_target(_fast_gicp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fast_gicp" "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg" "std_msgs/Header"
)

get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg" NAME_WE)
add_custom_target(_fast_gicp_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fast_gicp" "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(fast_gicp
  "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fast_gicp
)
_generate_msg_cpp(fast_gicp
  "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fast_gicp
)

### Generating Services

### Generating Module File
_generate_module_cpp(fast_gicp
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fast_gicp
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(fast_gicp_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(fast_gicp_generate_messages fast_gicp_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg" NAME_WE)
add_dependencies(fast_gicp_generate_messages_cpp _fast_gicp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg" NAME_WE)
add_dependencies(fast_gicp_generate_messages_cpp _fast_gicp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fast_gicp_gencpp)
add_dependencies(fast_gicp_gencpp fast_gicp_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fast_gicp_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(fast_gicp
  "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fast_gicp
)
_generate_msg_eus(fast_gicp
  "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fast_gicp
)

### Generating Services

### Generating Module File
_generate_module_eus(fast_gicp
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fast_gicp
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(fast_gicp_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(fast_gicp_generate_messages fast_gicp_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg" NAME_WE)
add_dependencies(fast_gicp_generate_messages_eus _fast_gicp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg" NAME_WE)
add_dependencies(fast_gicp_generate_messages_eus _fast_gicp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fast_gicp_geneus)
add_dependencies(fast_gicp_geneus fast_gicp_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fast_gicp_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(fast_gicp
  "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fast_gicp
)
_generate_msg_lisp(fast_gicp
  "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fast_gicp
)

### Generating Services

### Generating Module File
_generate_module_lisp(fast_gicp
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fast_gicp
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(fast_gicp_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(fast_gicp_generate_messages fast_gicp_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg" NAME_WE)
add_dependencies(fast_gicp_generate_messages_lisp _fast_gicp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg" NAME_WE)
add_dependencies(fast_gicp_generate_messages_lisp _fast_gicp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fast_gicp_genlisp)
add_dependencies(fast_gicp_genlisp fast_gicp_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fast_gicp_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(fast_gicp
  "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fast_gicp
)
_generate_msg_nodejs(fast_gicp
  "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fast_gicp
)

### Generating Services

### Generating Module File
_generate_module_nodejs(fast_gicp
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fast_gicp
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(fast_gicp_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(fast_gicp_generate_messages fast_gicp_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg" NAME_WE)
add_dependencies(fast_gicp_generate_messages_nodejs _fast_gicp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg" NAME_WE)
add_dependencies(fast_gicp_generate_messages_nodejs _fast_gicp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fast_gicp_gennodejs)
add_dependencies(fast_gicp_gennodejs fast_gicp_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fast_gicp_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(fast_gicp
  "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fast_gicp
)
_generate_msg_py(fast_gicp
  "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fast_gicp
)

### Generating Services

### Generating Module File
_generate_module_py(fast_gicp
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fast_gicp
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(fast_gicp_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(fast_gicp_generate_messages fast_gicp_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/Transform.msg" NAME_WE)
add_dependencies(fast_gicp_generate_messages_py _fast_gicp_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/catkin_ws/src/fast_gicp/msg/CompressDiff.msg" NAME_WE)
add_dependencies(fast_gicp_generate_messages_py _fast_gicp_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fast_gicp_genpy)
add_dependencies(fast_gicp_genpy fast_gicp_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fast_gicp_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fast_gicp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fast_gicp
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(fast_gicp_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fast_gicp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fast_gicp
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(fast_gicp_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fast_gicp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fast_gicp
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(fast_gicp_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fast_gicp)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fast_gicp
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(fast_gicp_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fast_gicp)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fast_gicp\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fast_gicp
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(fast_gicp_generate_messages_py std_msgs_generate_messages_py)
endif()
