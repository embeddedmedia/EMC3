#
# This file was created by Xilinx Vitis tool.
#


#
# tools
#

RM = rm -f
RMDIR = rm -rf



#
# variables
#

SDCARD_GEN = sdcard_gen
GENERATE_BIF = ::scw::generate_bif

XPFM_PATH = /home/sundance/Emilie_Projects/git/EMC3/BSP/2023.2/software/baremetal_classic/EMC3_platform/export/EMC3_platform/EMC3_platform.xpfm
SYS_CONFIG = EMC3_platform
DOMAINS = standalone_domain
BIF_PATH = /home/sundance/Emilie_Projects/git/EMC3/BSP/2023.2/software/baremetal_classic/zynqmp_fsbl_system/Debug/system.bif

BITSTREAM_PATH = /home/sundance/Emilie_Projects/git/EMC3/BSP/2023.2/software/baremetal_classic/zynqmp_fsbl/_ide/bitstream/design_1_wrapper.bit
SD_FILES = --elf /home/sundance/Emilie_Projects/git/EMC3/BSP/2023.2/software/baremetal_classic/zynqmp_fsbl/Debug/zynqmp_fsbl.elf,psu_cortexa53_0

GENERATE_BIF_XSCT_CMD = ${GENERATE_BIF} -xpfm ${XPFM_PATH} -domains ${DOMAINS} -bifpath ${BIF_PATH}

#
# primary build targets
#

package:
	-@echo Generating bif file for the system project
	-@echo Executing command \'${GENERATE_BIF_XSCT_CMD}\' on XSCT
	-@echo "connect -u TCP:localhost:41105; tcf send_command $$::xsdb::curchan xsdb eval s es [list \"${GENERATE_BIF_XSCT_CMD}\"]" | xsct
	${SDCARD_GEN} --xpfm ${XPFM_PATH} --sys_config ${SYS_CONFIG} --bif ${BIF_PATH} --bitstream ${BITSTREAM_PATH} ${SD_FILES}

clean:
	$(RMDIR) ./_sds
	${RMDIR} package
	${RM} system.bif

.PHONY: all package clean

all: package


