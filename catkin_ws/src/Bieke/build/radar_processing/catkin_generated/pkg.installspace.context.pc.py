# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "canfd_msgs;roscpp;rospy;std_msgs;radar_serial_driver;radar_perception_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lradar_processing".split(';') if "-lradar_processing" != "" else []
PROJECT_NAME = "radar_processing"
PROJECT_SPACE_DIR = "/home/huashuo/catkin_ws/src/Bieke/install"
PROJECT_VERSION = "0.0.1"
