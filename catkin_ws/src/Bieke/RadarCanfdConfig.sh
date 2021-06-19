#!/bin/bash

## This is the GPal Radar Config shell script.
## Writed by Jacky Sang 20190613(jackysang@geometricalpal.com)

help_info(){
	echo "Name"
	echo -e "\tRadarCanfdConfig.sh - Config Radar through CAN-FD"

	echo "SYNOPSIS"
	echo -e "\tRadarCanfdConfig [--id radar_id] [--id-store id_store_flag] [--out-type out_type] [--out-type-store out_type_store_flag] [--sort-type sort_type] [--sort-type-store sort_type_store_flag]"
	
	echo "OPTIONS"
	echo -e "\t--can can_device"
	echo -e "\t\tcan_device is the can device name in /dev, it can be a unsigned interger,"
	echo -e "\t\tdefault radar_old_id = 0."

	echo -e "\t--old-id radar_old_id"
	echo -e "\t\tradar_old_id is the current radar id, it can be 0-F (Hex),"
	echo -e "\t\tdefault radar_old_id = 0."

	echo -e "\t--new-id radar_new_id"
	echo -e "\t\tradar_new_id is the expected radar id, it can be 0-F (Hex),"
	echo -e "\t\tdefault radar_new_id = 0."
	
	echo -e "\t--id-store id_store_flag"
	echo -e "\t\tid_store_flag can be 0 (Store in SRAM) or 1 (store in Flash), "
	echo -e "\t\tdefault id_store_flag = 1."
	
	echo -e "\t--out-type out_type"
	echo -e "\t\tout_type can be 0-7," 
	echo -e "\t\t0x0--close all output;"
	echo -e "\t\t0x1--only point cloud;"
	echo -e "\t\t0x2--only track;"
	echo -e "\t\t0x3--point cloud+track;"
	echo -e "\t\t0x4--only free space;"
	echo -e "\t\t0x5--point cloud+free space;"
	echo -e "\t\t0x6--track+free space;"
	echo -e "\t\t0x7--point cloud+track+free space), "
	echo -e "\t\tdefault out_type = 7."
	
	echo -e "\t--out-type-store out_type_store_flag"
	echo -e "\t\tout_type_store_flag can be 0 (Store in SRAM) or 1 (store in Flash), "
	echo -e "\t\tdefault out_type_store_flag = 1."

	echo -e "\t--sort-type sort_type"
	echo -e "\t\tsort_type can be 0-2, "
	echo -e "\t\t0x0--do not sort;"
	echo -e "\t\t0x1--sort by range;"
	echo -e "\t\t0x2--sort by SNR," 
	echo -e "\t\tdefault sort_type = 0."

	echo -e "\t--sort-type-store sort_type_store_flag"
	echo -e "\t\tsort_type_store_flag can be 0 (Store in SRAM) or 1 (store in Flash),"
	echo -e "\t\tdefault sort_type_store_flag = 1."
}

#help_info
## 参数
can_device="0"

radar_old_id="0"

radar_new_id="0"

radar_id_store="1"

out_type="7"

out_type_store="1"

sort_type="0"

sort_type_store="1"

#GETOPT_ARGS=`getopt --long id:,id-store:,out-type:,out-type-store:sort-type:,sort-type-store: -n 'RadarCanfdConfig.sh' -- "$@"`
#eval set -- "$GETOPT_ARGS"
#获取参数
while [ -n "$1" ]
do
        case "$1" in
				--can) can_device=$2; shift 2;;
                --old-id) radar_old_id=$2; shift 2;;
				--new-id) radar_new_id=$2; shift 2;;
                --id-store) radar_id_store=$2; shift 2;;
                --out-type) out_type=$2; shift 2;;
                --out-type-store) out_type_store=$2; shift 2;;
                --sort-type) sort_type=$2; shift 2;;
                --sort-type-store) sort_type_store=$2; shift 2;;
				--help) help_info;exit 0; shift 2;;
                *)  break ;;
        esac
done

echo "[Configuration] can device:"${can_device}";old id="${radar_old_id}";new id="${radar_new_id}";id_store="${radar_id_store}";out_type="${out_type}";out_type_store="${out_type_store}";sort_type="${sort_type}";sort_type_store="${sort_type_store}

var_byte1=$[$out_type+$[out_type_store*8]+$[sort_type*16]+$[sort_type_store*64]]

can_byte2=$(echo "obase=16;$var_byte1"|bc) 

cansend_option="can"${can_device}" 800002"${radar_old_id}"0##1.""${radar_id_store}""${radar_new_id}""${can_byte2}"

echo "[CAN-FD Option] "$cansend_option

#cansend can0 80000220##1.14.4f
cansend $cansend_option
