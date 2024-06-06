# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/sundance/Emilie_Projects/git/EMC3/BSP/2023.2/software/baremetal_classic/EMC3_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/sundance/Emilie_Projects/git/EMC3/BSP/2023.2/software/baremetal_classic/EMC3_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {EMC3_platform}\
-hw {/home/sundance/Emilie_Projects/git/EMC3/BSP/2023.2/firmware/design_1_wrapper.xsa}\
-proc {psu_cortexa53_0} -os {standalone} -arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {/home/sundance/Emilie_Projects/git/EMC3/BSP/2023.2/software/baremetal_classic}

platform write
platform generate -domains 
platform active {EMC3_platform}
platform generate
bsp reload
bsp setlib -name xilsecure -ver 5.2
bsp setlib -name xilpm -ver 5.1
bsp setlib -name xilffs -ver 5.1
bsp config extra_compiler_flags "-g -Wall -Wextra -fno-tree-loop-distribute-patterns -DNDEBUG"
bsp write
bsp reload
catch {bsp regenerate}
platform generate -domains standalone_domain 
platform generate
platform generate -domains standalone_domain,zynqmp_fsbl,zynqmp_pmufw 
platform active {EMC3_platform}
bsp reload
bsp reload
platform clean
platform config -updatehw {/home/sundance/Emilie_Projects/git/EMC3/BSP/2023.2/firmware/design_1_wrapper.xsa}
platform generate
