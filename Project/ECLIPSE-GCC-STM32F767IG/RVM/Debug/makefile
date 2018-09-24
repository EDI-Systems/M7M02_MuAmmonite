################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Platform/subdir.mk
-include Init/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all:
	$(MAKE) --no-print-directory pre-build
	$(MAKE) --no-print-directory main-build

# Main-build Target
main-build: RVM

# Tool invocations
RVM: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Cross GCC Linker'
	arm-none-eabi-gcc -nostartfiles -mcpu=cortex-m7 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mno-unaligned-access -Xlinker -m -Xlinker armelf -Xlinker -T -Xlinker  /media/pry/Code/Code_Library/MCU/Mutatus/M7M2_MuAmmonite/Project/ECLIPSE-GCC-STM32F767IG/../../MAmmonite/Include/Platform/CortexM/Chips/STM32F767IG/rvm_platform_STM32F767IG.ld -Xlinker --gc-sections -Xlinker -Map=RVM.map -o "RVM" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) RVM
	-@echo ' '

pre-build:
	-../copy.sh
	-@echo ' '

post-build:
	-../image.sh
	-@echo ' '

.PHONY: all clean dependents main-build pre-build post-build

-include ../makefile.targets
