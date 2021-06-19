/*
 * Copyright (c) 2016, Ivor Wanders
 * Copyright (c) 2017, Jimmy Yen
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *   * Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *   * Neither the name of the copyright holder nor the names of its
 *     contributors may be used to endorse or promote products derived from
 *     this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#include <socketcan_driver/socketcan_to_topic.h>
#include <socketcan_interface/string.h>
#include <algorithm>
#include <cmath>
#include <map>
#include <string>

namespace can {

static void ConvertSocketCANToMessage(const can::Frame &frame,
                                      canfd_msgs::Frame &msg) {
  msg.id = frame.id;
  msg.len = frame.len;
  msg.is_error = frame.is_error;
  msg.is_rtr = frame.is_rtr;
  msg.is_extended = frame.is_extended;

  for (int i = 0; i < msg.len; i++) {
    msg.data[i] = frame.data[i];
  }
}

SocketCANToTopic::SocketCANToTopic(ros::NodeHandle &nh,
                                   std::shared_ptr<can::DriverInterface> driver)
    : nh_(nh), driver_(driver) {
  can_message_topic_ = nh.advertise<canfd_msgs::Frame>(
      driver_->GetDeviceName() + "_canfd_msg", 100);
}

void SocketCANToTopic::setup() {
  frame_listener_ =
      driver_->createMsgListener(can::CommInterface::FrameDelegate(
          this, &SocketCANToTopic::frameCallback));

  state_listener_ =
      driver_->createStateListener(can::StateInterface::StateDelegate(
          this, &SocketCANToTopic::stateCallback));
}

void SocketCANToTopic::frameCallback(const can::Frame &frame) {
  if (!frame.isValid()) {
    ROS_ERROR(
        "Invalid frame from SocketCAN: id: %#04x, length: %d, is_extended: %d, "
        "is_error: %d, is_rtr: %d",
        frame.id, frame.len, frame.is_extended, frame.is_error, frame.is_rtr);
    return;
  }

  if (frame.is_error) {
    // can::tostring cannot be used for dlc > 8 frames. It causes an crash
    // due to usage of boost::array for the data array. The should always
    // work.
    ROS_WARN("Received frame is error: %s", can::tostring(frame, true).c_str());
  }

  // std::cout<<"Recerived Canfd Frame:";
  // for (size_t i = 0; i < frame.len;i++) {
  //   std::cout<<std::hex<<int(frame.data[i])<<" ";
  // }
  // std::cout<<std::endl;

  canfd_msgs::Frame msg;
// ROS_INFO(
//         "Frame from SocketCAN: id: %#04x, length: %d, is_extended: %d, "
//         "is_error: %d, is_rtr: %d",
//         frame.id, frame.len, frame.is_extended, frame.is_error, frame.is_rtr);
  ConvertSocketCANToMessage(frame, msg);
  msg.header.stamp = ros::Time::now();
  msg.interface = driver_->GetDeviceName();

  can_message_topic_.publish(msg);
}

void SocketCANToTopic::stateCallback(const can::State &s) {
  std::string err;

  driver_->translateError(s.internal_error, err);

  if (!s.internal_error) {
    ROS_INFO("State: %s, asio: %s", err.c_str(),
             s.error_code.message().c_str());
  } else {
    ROS_ERROR("Error: %s, asio: %s", err.c_str(),
              s.error_code.message().c_str());
  }
}
}  // namespace can
