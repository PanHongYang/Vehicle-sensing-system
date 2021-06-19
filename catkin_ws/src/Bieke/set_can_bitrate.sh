#!/bin/bash

for i in {0..4}; do
  declare has_can=`sudo ip link show | grep can$i | cut -d ":" -f2`

  if [ -z "$has_can" ]; then
    echo "Unable to find can$i"
    continue
  fi

  declare is_kvaser=`sudo ip -details link show can$i | grep kvaser | cut -d ":" -f1`
  if [ -n "$is_kvaser" ]; then
    "Set can$i (Kvaser) bitrate successfully"
    sudo ip link set can$i down
    sudo ip link set can$i up type can bitrate 500000
  fi

  declare is_peak_can=`sudo ip -details link show can$i | grep pcan_usb_fd | cut -d ":" -f1`
  if [ -n "$is_peak_can" ]; then
    "Set can$i (Peak) bitrate successfully"
    sudo ip link set can$i down
    sudo ip link set can$i up type can bitrate 1000000 dbitrate 5000000 fd on
  fi
done
