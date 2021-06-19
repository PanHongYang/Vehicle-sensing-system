# ROS driver for Delphi ESR

## Usage

1. Connect ESR to the computer with a CAN transceiver.
1. Set up CAN interface with `sudo ip link set can0 up type can bitrate 500000`.
1. Initialize ESR with `cansend can0 4F1#00.00.00.00.00.00.bf.01`.
1. Start `roscore` and run `rosrun esr_driver esr_can_to_topic_node _esr_can_device_list:=can0,can3,can1`.
1. The driver publishes three topics per device. E.g., for device `can0`, `/esr_can0_status`, `/esr_can0_tracks`, and `/esr_can0_visualization` are published.
