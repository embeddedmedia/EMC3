#!/bin/bash
cd ../scripts

/tools/Xilinx/Vitis/2023.2/bin/xsct petalinux.tcl $1 $2

read -p $'\e[32m\e[107m Press any key to continue...\e[0m'