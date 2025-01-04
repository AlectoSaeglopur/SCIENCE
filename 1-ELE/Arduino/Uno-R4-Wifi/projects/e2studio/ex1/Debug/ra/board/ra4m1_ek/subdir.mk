################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ra/board/ra4m1_ek/board_init.c \
../ra/board/ra4m1_ek/board_leds.c 

C_DEPS += \
./ra/board/ra4m1_ek/board_init.d \
./ra/board/ra4m1_ek/board_leds.d 

OBJS += \
./ra/board/ra4m1_ek/board_init.o \
./ra/board/ra4m1_ek/board_leds.o 

SREC += \
ex1.srec 

MAP += \
ex1.map 


# Each subdirectory must supply rules for building sources it contributes
ra/board/ra4m1_ek/%.o: ../ra/board/ra4m1_ek/%.c
	$(file > $@.in,-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-strict-aliasing -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal -g -D_RENESAS_RA_ -D_RA_CORE=CM4 -D_RA_ORDINAL=1 -I"H:/SCIENCE/1-ELE/Arduino/Uno-R4-Wifi/projects/e2studio/ex1/src" -I"." -I"H:/SCIENCE/1-ELE/Arduino/Uno-R4-Wifi/projects/e2studio/ex1/ra/fsp/inc" -I"H:/SCIENCE/1-ELE/Arduino/Uno-R4-Wifi/projects/e2studio/ex1/ra/fsp/inc/api" -I"H:/SCIENCE/1-ELE/Arduino/Uno-R4-Wifi/projects/e2studio/ex1/ra/fsp/inc/instances" -I"H:/SCIENCE/1-ELE/Arduino/Uno-R4-Wifi/projects/e2studio/ex1/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"H:/SCIENCE/1-ELE/Arduino/Uno-R4-Wifi/projects/e2studio/ex1/ra_gen" -I"H:/SCIENCE/1-ELE/Arduino/Uno-R4-Wifi/projects/e2studio/ex1/ra_cfg/fsp_cfg/bsp" -I"H:/SCIENCE/1-ELE/Arduino/Uno-R4-Wifi/projects/e2studio/ex1/ra_cfg/fsp_cfg" -std=c99 -Wno-stringop-overflow -Wno-format-truncation --param=min-pagesize=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

