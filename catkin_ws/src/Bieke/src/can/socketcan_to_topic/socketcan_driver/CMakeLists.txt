cmake_minimum_required(VERSION 2.8.3)
project(socketcan_driver)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  socketcan_interface
  visualization_msgs
  message_generation
  canfd_msgs
)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

catkin_package(
  INCLUDE_DIRS
    include
  LIBRARIES
    socketcan_to_topic
  CATKIN_DEPENDS
    roscpp
    socketcan_interface
    message_runtime
    canfd_msgs
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_library(socketcan_to_topic
  src/socketcan_to_topic.cpp
)
target_link_libraries(socketcan_to_topic
  ${catkin_LIBRARIES}
)
add_dependencies(socketcan_to_topic
  ${catkin_EXPORTED_TARGETS}
)

add_executable(socketcan_to_topic_node
  src/socketcan_to_topic_node.cpp
)
target_link_libraries(socketcan_to_topic_node
  socketcan_to_topic
  ${catkin_LIBRARIES}
)
add_dependencies(socketcan_to_topic_node
  ${catkin_EXPORTED_TARGETS}
)

install(
  PROGRAMS
    #scripts/configure_delphi.sh
    #scripts/configure_conti.sh
    scripts/set_can_bitrate.sh
    scripts/set_canfd_bitrate.sh
  DESTINATION
    ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(
  TARGETS
    socketcan_to_topic
    socketcan_to_topic_node
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(
  DIRECTORY
    include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
)
