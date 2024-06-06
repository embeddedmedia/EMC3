#!/bin/bash
cd ../scripts

/tools/Xilinx/Vitis/2023.2/bin/xsct program_qspi.tcl $1

read -p $'\e[32m\e[107m Press any key to continue...\e[0m'
