#ifndef USB_CAM_USB_CAM_INFO_H
#define USB_CAM_USB_CAM_INFO_H

#include <ros/ros.h>
#include <fstream>
#include <sstream>
#include <string>

namespace usb_cam {

enum IoMethod {
  IO_METHOD_READ,
  IO_METHOD_MMAP,
  IO_METHOD_USERPTR,
  IO_METHOD_UNKNOWN,
};

enum PixelFormat {
  PIXEL_FORMAT_YUYV,
  PIXEL_FORMAT_UYVY,
  PIXEL_FORMAT_MJPEG,
  PIXEL_FORMAT_YUVMONO10,
  PIXEL_FORMAT_RGB24,
  PIXEL_FORMAT_GREY,
  PIXEL_FORMAT_UNKNOWN
};

struct UsbCamInfo {
  std::string video_device_config_path_, video_device_name_, io_method_name_,
      pixel_format_name_, frame_id_, camera_name_, camera_info_url_;
  bool streaming_status_;
  int image_width_, image_height_, framerate_, exposure_, brightness_,
      contrast_, saturation_, sharpness_, focus_, white_balance_, gain_;
  //std::string image_topic_;
  bool autofocus_, autoexposure_, exposure_auto_priority_, auto_white_balance_;

  void ReadVideoDeviceNameFromConfig(ros::NodeHandle &nh);

  void Load(ros::NodeHandle &nh);
};

}  // namespace usb_cam

#endif
