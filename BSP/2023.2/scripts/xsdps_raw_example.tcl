# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source xsdps_raw_example.tcl
#

if {$argc < 2} {
	puts "ERROR: not enough arguments"
	exit 1
} 

puts "JTAG IP address: "
puts [lindex $argv 0]

connect -url tcp:[lindex $argv 0]:3121
source ./zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000

if {[lindex $argv 1]=="LynSynLite"} {
	#LynSyn Lite
	puts "JTAG POD: LynSynLite"
	targets -set -filter {jtag_cable_name =~ "Xilinx Virtual Cable localhost:2542" && level==0 && jtag_device_ctx=="jsn-XVC-localhost:2542-14710093-0"}
} elseif {[lindex $argv 1]=="SmartLynq"} {
	#SmartLynq
	puts "JTAG POD: SmartLynq"
	targets -set -filter {jtag_cable_name =~ "JTAG Cable 2023.2 AAo1BIgO0" && level==0 && jtag_device_ctx=="jsn-XSC0-AAo1BIgO0-04724093-0"}
} elseif {[lindex $argv 1]=="Xilinx"} {
	#XILINX pod
	puts "JTAG POD: Xilinx"
	targets -set -nocase -filter {name =~"APU*"}
} else {
	puts "ERROR: Wrong JTAG POD selected"
	exit 2
}
fpga -file ../prebuilt/firmware/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
exec mkdir -p tmp
exec cp ../prebuilt/firmware/design_1_wrapper.xsa tmp
loadhw -hw ./tmp/design_1_wrapper.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
exec rm -R tmp
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow ../prebuilt/software/baremetal_classic/zynqmp_fsbl.elf
con
after 10000
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow ../prebuilt/software/baremetal_classic/xsdps_raw_example_2.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con




