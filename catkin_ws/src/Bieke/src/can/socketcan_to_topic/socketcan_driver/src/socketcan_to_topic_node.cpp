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

#include <ros/ros.h>
#include <socketcan_driver/socketcan_to_topic.h>
#include <socketcan_interface/string.h>
#include <socketcan_interface/threading.h>
#include <iterator>
#include <memory>
#include <sstream>
#include <string>
#include <vector>

int main(int argc, char *argv[]) {
  ros::init(argc, argv, "socketcan_to_topic_node");

  ros::NodeHandle nh(""), nh_param("~");

  std::string can_device_list_param;
  nh_param.param<std::string>("socketcan_device_list", can_device_list_param,
                              "can0,can1");

  std::stringstream ss(can_device_list_param);
  std::vector<std::string> can_device_list;
  std::string can_device = "";
  while (std::getline(ss, can_device, ',')) {
    can_device_list.push_back(can_device);
  }

  std::vector<std::shared_ptr<can::ThreadedSocketCANInterface>> drivers;
  std::vector<std::unique_ptr<can::SocketCANToTopic>> bridges;
  for (auto dev : can_device_list) {
    std::shared_ptr<can::ThreadedSocketCANInterface> driver =
        std::make_shared<can::ThreadedSocketCANInterface>();
    if (!driver->init(dev, 0)) {
      ROS_FATAL("Failed to initialize can_device at %s", dev.c_str());
      continue;
    }

    drivers.push_back(driver);
    std::unique_ptr<can::SocketCANToTopic> b =
        std::make_unique<can::SocketCANToTopic>(nh, driver);
    b->setup();
    bridges.push_back(std::move(b));

    ROS_INFO("Successfully connected to %s", driver->GetDeviceName().c_str());
  }

  ros::spin();

  for (auto dr : drivers) {
    dr->shutdown();
    dr.reset();
  }

  ros::waitForShutdown();
}
