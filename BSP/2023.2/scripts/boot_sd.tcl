if {$argc < 2} {
	puts "ERROR: not enough arguments"
	exit 1
} 

puts "JTAG IP address: "
puts [lindex $argv 0]

connect -url tcp:[lindex $argv 0]:3121

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

targets -set -nocase -filter {name =~ "*PSU*"}

stop
puts "Switch to SD1 bootmode"
# update multiboot to ZERO
mwr 0xffca0010 0x0
# change boot mode to SD
mwr 0xff5e0200 0x5100
# reset
rst -system

#Sometimes A53 may be held in reset catch .. so start it with "con"
after 2000
con
