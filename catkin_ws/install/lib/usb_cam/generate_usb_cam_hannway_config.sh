#!/bin/bash

declare -A camera_serial_number_map
declare -A camera_enum_map
declare -A serial_number_map
declare usb_cam_pair
declare config_path="/tmp/usb_cam_hannway.config"

camera_enum_map["F4F1B43F"]="usb_cam_front_left"
camera_enum_map["B4D9C37F"]="usb_cam_front_center"
camera_enum_map["D940B43F"]="usb_cam_front_right"
camera_enum_map["6530B43F"]="usb_cam_back_left"
camera_enum_map["55C8647F"]="usb_cam_back_center"
camera_enum_map["3D72357F"]="usb_cam_back_right"
camera_enum_map["E1DA747F"]="usb_cam_taipei_spare"
camera_enum_map["65A2DE4F"]="usb_cam_hannway_spare"
#camera_enum_map["65A2DE4F"]="usb_cam_front_center"

for i in {0..20}; do
  if [ -e /dev/video$i ] && [ -r /dev/video$i ]; then
    camera_serial_number_map[$i]=`udevadm info --name=/dev/video$i | grep ID_SERIAL_SHORT | cut -d "=" -f2`
  fi
done

for i in {0..20}; do
  declare camera_serial_number=${camera_serial_number_map[$i]}

  if [ -z $camera_serial_number ]; then
    continue
  fi

  declare camera_enum=${camera_enum_map[$camera_serial_number]}

  if [ -z $camera_enum ]; then
    echo "No corresponding camera enum for serial number '$camera_serial_number'."
    continue
  fi

  if [ -z ${serial_number_map[$camera_serial_number]} ]; then
    usb_cam_pair+="/dev/video${i} ${camera_enum}\n"
    serial_number_map[$camera_serial_number]=$camera_enum
  fi
done

echo -e $usb_cam_pair | tee $config_path
