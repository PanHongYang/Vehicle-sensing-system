
#include <ros/ros.h>
#include <usb_cam/usb_cam.h>
#include <usb_cam/usb_cam_info.h>

int main(int argc, char **argv) {
  ros::init(argc, argv, "usb_cam_ctrl");
  ros::NodeHandle nh("~");
  usb_cam::UsbCamInfo usb_cam_info;
  usb_cam::UsbCam cam;

  usb_cam_info.Load(nh);
  cam.attach(usb_cam_info.video_device_name_);
  cam.ControlCameraClass(usb_cam_info, true);
  cam.detach();

  return EXIT_SUCCESS;
}
