################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
xsdps_raw_example_2.elf.size \


# All Target
all: xsdps_raw_example_2.elf secondary-outputs

# Tool invocations
xsdps_raw_example_2.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM v8 gcc linker'
	aarch64-none-elf-gcc -Wl,-T -Wl,../src/lscript.ld -L/home/sundance/Emilie_Projects/git/EMC3/BSP/2023.2/software/baremetal_classic/EMC3_platform/export/EMC3_platform/sw/EMC3_platform/standalone_domain/bsplib/lib -o "xsdps_raw_example_2.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

xsdps_raw_example_2.elf.size: xsdps_raw_example_2.elf
	@echo 'Invoking: ARM v8 Print Size'
	aarch64-none-elf-size xsdps_raw_example_2.elf  |tee "xsdps_raw_example_2.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) xsdps_raw_example_2.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents

-include ../makefile.targets
