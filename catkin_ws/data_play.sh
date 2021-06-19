#! /bin/bash
#sleep 3
#gnome-terminal -x bash -c "roscore"
sleep 3
gnome-terminal -x bash -c "rosbag play /home/a/.ros/data.bag"
sleep 5
exit 0
