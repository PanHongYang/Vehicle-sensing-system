# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;socketcan_interface;message_runtime;canfd_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lsocketcan_to_topic".split(';') if "-lsocketcan_to_topic" != "" else []
PROJECT_NAME = "socketcan_driver"
PROJECT_SPACE_DIR = "/home/huashuo/catkin_ws/src/Bieke/install"
PROJECT_VERSION = "0.0.2"
