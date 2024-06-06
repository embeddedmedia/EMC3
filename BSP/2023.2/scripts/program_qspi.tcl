
puts "Flashing (will take about 2 to 3min)"
set current_dir [pwd]
set jtag_ip [lindex $argv 0]

set process [open "|program_flash -f $current_dir/../boot/BOOT.bin -offset 0 -fsbl $current_dir/../prebuilt/software/baremetal_classic/zynqmp_fsbl.elf -flash_type qspi-x4-single -url tcp:$jtag_ip:3121" r ]
while {[gets $process line] >= 0} { puts $line }
if {[catch {close $process} result options]} {
   if {[lindex [dict get $options -errorcode] 0] eq "CHILDSTATUS"} {
       return [lindex [dict get $options -errorcode] 2]
   } else {
       # Rethrow other errors
       return -options [dict incr options -level] $result
   }
}
puts "Flashing finished"
return 0
