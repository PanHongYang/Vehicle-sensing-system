/*********************************************************************
 *
 * Software License Agreement (BSD License)
 *
 *  Copyright (c) 2014, Robert Bosch LLC.
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *   * Neither the name of the Robert Bosch nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 *  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 *
 *********************************************************************/

#include <camera_info_manager/camera_info_manager.h>
#include <image_transport/image_transport.h>
#include <ros/ros.h>
#include <std_srvs/Empty.h>//创建参数为空型服务头文件
#include <usb_cam/usb_cam.h>
#include <usb_cam/usb_cam_info.h>
#include <fstream>
#include <sstream>
//#include <string>

namespace usb_cam {

class UsbCamNode {
 public:
  // private ROS node handle
  ros::NodeHandle node_;

  UsbCamInfo usb_cam_info_;

  // shared image message
  sensor_msgs::Image img_;
  image_transport::CameraPublisher image_pub_;

  boost::shared_ptr<camera_info_manager::CameraInfoManager> cinfo_;//定义一个共享所有权指针

  UsbCam cam_;

  ros::ServiceServer service_start_, service_stop_;

  bool service_start_cap(std_srvs::Empty::Request &req,
                         std_srvs::Empty::Response &res) {
    cam_.start_capturing();
    return true;
  }

  bool service_stop_cap(std_srvs::Empty::Request &req,
                        std_srvs::Empty::Response &res) {
    cam_.stop_capturing();
    return true;
  }

  void ReadVideoDeviceNameFromConfig() {
    std::ifstream file_stm(usb_cam_info_.video_device_config_path_.c_str());//c_str 是c++ 中string类 (class)的函数，它能把string类的对象里的字符串转换成C中char 型变量的字符串

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

      if (node_.getNamespace() == std::string("/") + camera_enum) {
        usb_cam_info_.video_device_name_ = video_device_name;
      }
    }

    file_stm.close();
  }

  UsbCamNode() : node_("~") {
    // advertise the main image topic
    image_transport::ImageTransport it(node_);
    image_pub_ = it.advertiseCamera("image_raw", 1);
    usb_cam_info_.Load(node_);

    cinfo_.reset(new camera_info_manager::CameraInfoManager(
        node_, usb_cam_info_.camera_name_, usb_cam_info_.camera_info_url_));
    //image_pub_= it.advertiseCamera(image_topic_.c_str(),1);
    // create Services
    service_start_ = node_.advertiseService(
        "start_capture", &UsbCamNode::service_start_cap, this);
    service_stop_ = node_.advertiseService("stop_capture",
                                           &UsbCamNode::service_stop_cap, this);

    if (!usb_cam_info_.video_device_config_path_.empty()) {
      ReadVideoDeviceNameFromConfig();
    }

    if (usb_cam_info_.video_device_name_.empty()) {
      ROS_FATAL("Video device name cannot be empty");
      node_.shutdown();
      return;
    }

    img_.header.frame_id = usb_cam_info_.frame_id_;

    // check for default camera info
    if (!cinfo_->isCalibrated()) {
      cinfo_->setCameraName(usb_cam_info_.video_device_name_);
      sensor_msgs::CameraInfo camera_info;
      camera_info.header.frame_id = img_.header.frame_id;
      camera_info.width = usb_cam_info_.image_width_;
      camera_info.height = usb_cam_info_.image_height_;
      cinfo_->setCameraInfo(camera_info);
    }

    ROS_INFO(
        "Starting '%s' (%s) at %dx%d via %s (%s) at %i FPS",
        usb_cam_info_.camera_name_.c_str(),
        usb_cam_info_.video_device_name_.c_str(), usb_cam_info_.image_width_,
        usb_cam_info_.image_height_, usb_cam_info_.io_method_name_.c_str(),
        usb_cam_info_.pixel_format_name_.c_str(), usb_cam_info_.framerate_);

    // set the IO method
    IoMethod io_method =
        UsbCam::io_method_from_string(usb_cam_info_.io_method_name_);
    if (io_method == IO_METHOD_UNKNOWN) {
      ROS_FATAL("Unknown IO method '%s'",
                usb_cam_info_.io_method_name_.c_str());
      node_.shutdown();
      return;
    }

    // set the pixel format
    PixelFormat pixel_format =
        UsbCam::pixel_format_from_string(usb_cam_info_.pixel_format_name_);
    if (pixel_format == PIXEL_FORMAT_UNKNOWN) {
      ROS_FATAL("Unknown pixel format '%s'",
                usb_cam_info_.pixel_format_name_.c_str());
      node_.shutdown();
      return;
    }

    // start the camera
    cam_.start(usb_cam_info_, io_method, pixel_format);

    cam_.ControlCameraClass(usb_cam_info_, false);
  }

  virtual ~UsbCamNode() { cam_.shutdown(); }

  bool take_and_send_image() {
    // grab the image
    cam_.grab_image(&img_);

    // grab the camera info
    sensor_msgs::CameraInfoPtr ci(
        new sensor_msgs::CameraInfo(cinfo_->getCameraInfo()));
    ci->header.frame_id = img_.header.frame_id;
    ci->header.stamp = img_.header.stamp;

    // publish the image
    image_pub_.publish(img_, *ci);
      

    return true;
  }

  bool spin() {
    ros::Rate loop_rate(usb_cam_info_.framerate_);
    while (node_.ok()) {
      if (cam_.is_capturing()) {
        if (!take_and_send_image())
          ROS_WARN("USB camera did not respond in time.");
      }
      ros::spinOnce();
      loop_rate.sleep();
    }
    return true;
  }
};

}  // namespace usb_cam

int main(int argc, char **argv) {
  ros::init(argc, argv, "usb_cam");
  usb_cam::UsbCamNode a;
  a.spin();
  return EXIT_SUCCESS;
}
