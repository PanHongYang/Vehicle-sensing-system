#include <ros/ros.h>
#include <usb_cam/usb_cam_info.h>
#include <fstream>
#include <sstream>
#include <string>

namespace usb_cam {

void UsbCamInfo::ReadVideoDeviceNameFromConfig(ros::NodeHandle &nh) {
  std::ifstream file_stm(video_device_config_path_.c_str());

  if (!file_stm) {
    return;
  }

  std::string line;

  while (std::getline(file_stm, line)) {
    std::istringstream iss(line);
    std::string video_device_name, camera_enum;
    if (!(iss >> video_device_name >> camera_enum)) {
      break;
    }

    if (nh.getNamespace() == std::string("/") + camera_enum) {
      video_device_name_ = video_device_name;
    }
  }

  file_stm.close();
}

void UsbCamInfo::Load(ros::NodeHandle &nh) {
  // grab the parameters
  nh.param("video_device_config_path", video_device_config_path_,
           std::string(""));
  nh.param("video_device", video_device_name_, std::string(""));
  nh.param("brightness", brightness_, -1);  // 0-255, -1 "leave alone"
  nh.param("contrast", contrast_, -1);      // 0-255, -1 "leave alone"
  nh.param("saturation", saturation_, -1);  // 0-255, -1 "leave alone"
  nh.param("sharpness", sharpness_, -1);    // 0-255, -1 "leave alone"
  // possible values: mmap, read, userptr
  nh.param("io_method", io_method_name_, std::string("mmap"));
  nh.param("image_width", image_width_, 640);
  nh.param("image_height", image_height_, 480);
  nh.param("framerate", framerate_, 30);
  //nh.param("image_topic",image_topic_,std::string("image_raw"));
  // possible values: yuyv, uyvy, mjpeg, yuvmono10, rgb24
  nh.param("pixel_format", pixel_format_name_, std::string("mjpeg"));
  // enable/disable autofocus
  nh.param("autofocus", autofocus_, false);
  nh.param("focus", focus_, -1);  // 0-255, -1 "leave alone"
  // enable/disable autoexposure
  nh.param("autoexposure", autoexposure_, true);
  nh.param("exposure", exposure_, 100);
  nh.param("exposure_auto_priority", exposure_auto_priority_, false);
  nh.param("gain", gain_, -1);  // 0-100?, -1 "leave alone"
  // enable/disable auto white balance temperature
  nh.param("auto_white_balance", auto_white_balance_, true);
  nh.param("white_balance", white_balance_, 4000);

  // load the camera info
  nh.param("camera_frame_id", frame_id_, std::string("head_camera"));
  nh.param("camera_name", camera_name_, std::string("head_camera"));
  nh.param("camera_info_url", camera_info_url_, std::string(""));

  if (!video_device_config_path_.empty()) {
    ReadVideoDeviceNameFromConfig(nh);
  }
}

}  // namespace usb_cam
