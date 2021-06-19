#!/bin/bash

sudo ip link set can0 down
sudo ip link set can1 down
#sudo ip link set can2 down
#sudo ip link set can3 down
#sudo ip link set can4 down
sudo ip link set can0 up type can bitrate 500000 
#sudo ip link set can0 up type can bitrate 1000000 dbitrate 5000000 fd on
sudo ip link set can1 up type can bitrate 1000000 dbitrate 5000000 fd on
#sudo ip link set can2 up type can bitrate 1000000 dbitrate 5000000 fd on
#sudo ip link set can3 up type can bitrate 1000000 dbitrate 5000000 fd on
#sudo ip link set can4 up type can bitrate 1000000 dbitrate 5000000 fd on
