# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "radar_perception_msgs: 3 messages, 0 services")

set(MSG_I_FLAGS "-Iradar_perception_msgs:/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(radar_perception_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg" NAME_WE)
add_custom_target(_radar_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "radar_perception_msgs" "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg" NAME_WE)
add_custom_target(_radar_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "radar_perception_msgs" "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg" "std_msgs/Header:radar_perception_msgs/RadarTarget"
)

get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg" NAME_WE)
add_custom_target(_radar_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "radar_perception_msgs" "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg" "geometry_msgs/Pose2D:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/radar_perception_msgs
)
_generate_msg_cpp(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/radar_perception_msgs
)
_generate_msg_cpp(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/radar_perception_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(radar_perception_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/radar_perception_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(radar_perception_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(radar_perception_msgs_generate_messages radar_perception_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_cpp _radar_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_cpp _radar_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_cpp _radar_perception_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(radar_perception_msgs_gencpp)
add_dependencies(radar_perception_msgs_gencpp radar_perception_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS radar_perception_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/radar_perception_msgs
)
_generate_msg_eus(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/radar_perception_msgs
)
_generate_msg_eus(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/radar_perception_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(radar_perception_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/radar_perception_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(radar_perception_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(radar_perception_msgs_generate_messages radar_perception_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_eus _radar_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_eus _radar_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_eus _radar_perception_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(radar_perception_msgs_geneus)
add_dependencies(radar_perception_msgs_geneus radar_perception_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS radar_perception_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/radar_perception_msgs
)
_generate_msg_lisp(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/radar_perception_msgs
)
_generate_msg_lisp(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/radar_perception_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(radar_perception_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/radar_perception_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(radar_perception_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(radar_perception_msgs_generate_messages radar_perception_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_lisp _radar_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_lisp _radar_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_lisp _radar_perception_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(radar_perception_msgs_genlisp)
add_dependencies(radar_perception_msgs_genlisp radar_perception_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS radar_perception_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/radar_perception_msgs
)
_generate_msg_nodejs(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/radar_perception_msgs
)
_generate_msg_nodejs(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/radar_perception_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(radar_perception_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/radar_perception_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(radar_perception_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(radar_perception_msgs_generate_messages radar_perception_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_nodejs _radar_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_nodejs _radar_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_nodejs _radar_perception_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(radar_perception_msgs_gennodejs)
add_dependencies(radar_perception_msgs_gennodejs radar_perception_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS radar_perception_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_perception_msgs
)
_generate_msg_py(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_perception_msgs
)
_generate_msg_py(radar_perception_msgs
  "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_perception_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(radar_perception_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_perception_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(radar_perception_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(radar_perception_msgs_generate_messages radar_perception_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTarget.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_py _radar_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarTargetArray.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_py _radar_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/huashuo/catkin_ws/src/Bieke/src/ros_msgs/radar_perception_msgs/msg/RadarEgomotion.msg" NAME_WE)
add_dependencies(radar_perception_msgs_generate_messages_py _radar_perception_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(radar_perception_msgs_genpy)
add_dependencies(radar_perception_msgs_genpy radar_perception_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS radar_perception_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/radar_perception_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/radar_perception_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(radar_perception_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(radar_perception_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/radar_perception_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/radar_perception_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(radar_perception_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(radar_perception_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/radar_perception_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/radar_perception_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(radar_perception_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(radar_perception_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/radar_perception_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/radar_perception_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(radar_perception_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(radar_perception_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_perception_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_perception_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/radar_perception_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(radar_perception_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(radar_perception_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
