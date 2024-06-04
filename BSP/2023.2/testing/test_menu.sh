#!/bin/bash

# set parameters according to your system
DEV_UART="/dev/ttyUSB0" 	# UART device
DEV_CAN="/dev/ttyUSB1" 		# CAN device
JTAG_IP="192.168.69.94" 	# For local JTAG "127.0.0.1"
JTAG_POD="SmartLynq" 		# Choose between "LynSynLite", "SmartLynq" or "Xilinx"


#add path to testing folder
TESTS_PATH=$(dirname "$0")
cd $TESTS_PATH

cmd=(dialog --keep-tite --title "EMC3" --menu "Select options:" 22 76 16)

options=(
	0 "Launch Putty"
	1 "Test UART"
	2 "Test SD"
	3 "Boot petalinux from JTAG"
	q "Quit")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do

    case $choice in

	0)
	gnome-terminal -- putty -serial $DEV_UART -sercfg 115200
	./test_menu.sh
	;;

	1)
	./uart_test.sh $JTAG_IP $JTAG_POD
	./test_menu.sh
	;;

	2)
	./sd_test.sh $JTAG_IP $JTAG_POD
	./test_menu.sh
	;;
	
	3)
	./jtag_petalinux.sh $JTAG_IP $JTAG_POD
	./test_menu.sh
	;;
        
	q)
	echo "Bye Bye!"
	;;
    
    esac

done
