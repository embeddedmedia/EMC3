if {$argc < 2} {
	puts "ERROR: not enough arguments"
	exit 1
} 

puts "JTAG IP address: "
puts [lindex $argv 0]

connect -url tcp:[lindex $argv 0]:3121

puts stderr "INFO: Configuring the FPGA..."
puts stderr "INFO: Downloading bitstream: ../prebuilt/firmware/design_1_wrapper.bit to the target."

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

fpga "../prebuilt/firmware/design_1_wrapper.bit"

targets -set -nocase -filter {name =~ "*PSU*"}
mask_write 0xFFCA0038 0x1C0 0x1C0
targets -set -nocase -filter {name =~ "*MicroBlaze PMU*"}

if { [string first "Stopped" [state]] != 0 } {
stop
}
puts stderr "INFO: Downloading ELF file: ../prebuilt/petalinux/pmufw.elf to the target."
dow  "../prebuilt/petalinux/pmufw.elf"
con

after 4000

targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor -clear-registers

source /home/sundance/Emilie_Projects/git/EMC3/BSP/2023.2/petalinux/project-spec/hw-description/psu_init.tcl
puts stderr "INFO: Downloading ELF file: ../prebuilt/petalinux/zynqmp_fsbl.elf to the target."
dow "../prebuilt/petalinux/zynqmp_fsbl.elf"
con

after 4000
stop

psu_ps_pl_isolation_removal; psu_ps_pl_reset_config
puts stderr "INFO: Loading image: ../prebuilt/petalinux/system.dtb at 0x00100000"
dow -data  "../prebuilt/petalinux/system.dtb" 0x00100000
puts stderr "INFO: Downloading ELF file: ../prebuilt/petalinux/u-boot-dtb.elf to the target."
dow  "../prebuilt/petalinux/u-boot-dtb.elf"
puts stderr "INFO: Downloading ELF file: ../prebuilt/petalinux/u-boot-dtb.elf to the target."
dow  "../prebuilt/petalinux/u-boot-dtb.elf"
puts stderr "INFO: Loading image: ../prebuilt/petalinux/Image at 0x00200000"
dow -data  "../prebuilt/petalinux/Image" 0x00200000
puts stderr "INFO: Loading image: ../prebuilt/petalinux/rootfs.cpio.gz.u-boot at 0x04000000"
dow -data  "../prebuilt/petalinux/rootfs.cpio.gz.u-boot" 0x04000000
puts stderr "INFO: Loading image: ../prebuilt/petalinux/boot.scr at 0x20000000"
dow -data  "../prebuilt/petalinux/boot.scr" 0x20000000
puts stderr "INFO: Downloading ELF file: ../prebuilt/petalinux/bl31.elf to the target."
dow  "../prebuilt/petalinux/bl31.elf"
con
