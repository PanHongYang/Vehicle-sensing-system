#! /bin/bash
sleep 2
echo "1111" |sudo -S ip link set can0 up type can bitrate 1000000
sleep 2
echo "1111" |sudo -S ip link set can1 up type can bitrate 500000
sleep 2
echo "1111" |sudo -S chmod 777 /dev/ttyUSB0
sleep 2
echo "1111" |sudo -S chmod 777 /dev/ttyUSB1
sleep 5
gnome-terminal -x bash -c "source /home/a/catkin_ws/devel/setup.bash;roslaunch   serial_port serial_port_node.launch"
sleep 5
gnome-terminal -x bash -c "source /home/a/catkin_ws/devel/setup.bash;roslaunch lpms_imu lpms_imu_node.launch"
sleep 5
gnome-terminal -x bash -c "source /home/a/catkin_ws/devel/setup.bash;rosrun socketcan_driver socketcan_to_topic_node"
sleep 5
gnome-terminal -x bash -c "source /home/a/catkin_ws/devel/setup.bash;roslaunch qianradar qianradar.launch"
sleep 5
gnome-terminal -x bash -c "source /home/a/catkin_ws/devel/setup.bash;roslaunch zuoyouradar zuoyouradar.launch"
sleep 5
gnome-terminal -x bash -c "source /home/a/catkin_ws/devel/setup.bash;roslaunch rslidar_pointcloud two_lidar.launch "
sleep 5
gnome-terminal -x bash -c "source /home/a/catkin_ws/devel/setup.bash;roslaunch  usb_cam usb_cam-test.launch"

sleep 5

gnome-terminal -x bash -c "source /home/a/catkin_ws/devel/setup.bash;roslaunch record.launch"
sleep 5
exit 0
