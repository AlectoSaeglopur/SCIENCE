#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Ex1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Ex1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../source/croutine.c ../../source/event_groups.c ../../source/list.c ../../source/queue.c ../../source/tasks.c ../../source/timers.c ../../source/portable/MPLAB/PIC24_dsPIC/port.c ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S ../../source/portable/MemMang/heap_4.c ../main.c ../system.c ../gpio.c ../error.c ../misc.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/870914629/croutine.o ${OBJECTDIR}/_ext/870914629/event_groups.o ${OBJECTDIR}/_ext/870914629/list.o ${OBJECTDIR}/_ext/870914629/queue.o ${OBJECTDIR}/_ext/870914629/tasks.o ${OBJECTDIR}/_ext/870914629/timers.o ${OBJECTDIR}/_ext/747609821/port.o ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o ${OBJECTDIR}/_ext/2075338434/heap_4.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1472/system.o ${OBJECTDIR}/_ext/1472/gpio.o ${OBJECTDIR}/_ext/1472/error.o ${OBJECTDIR}/_ext/1472/misc.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/870914629/croutine.o.d ${OBJECTDIR}/_ext/870914629/event_groups.o.d ${OBJECTDIR}/_ext/870914629/list.o.d ${OBJECTDIR}/_ext/870914629/queue.o.d ${OBJECTDIR}/_ext/870914629/tasks.o.d ${OBJECTDIR}/_ext/870914629/timers.o.d ${OBJECTDIR}/_ext/747609821/port.o.d ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.d ${OBJECTDIR}/_ext/2075338434/heap_4.o.d ${OBJECTDIR}/_ext/1472/main.o.d ${OBJECTDIR}/_ext/1472/system.o.d ${OBJECTDIR}/_ext/1472/gpio.o.d ${OBJECTDIR}/_ext/1472/error.o.d ${OBJECTDIR}/_ext/1472/misc.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/870914629/croutine.o ${OBJECTDIR}/_ext/870914629/event_groups.o ${OBJECTDIR}/_ext/870914629/list.o ${OBJECTDIR}/_ext/870914629/queue.o ${OBJECTDIR}/_ext/870914629/tasks.o ${OBJECTDIR}/_ext/870914629/timers.o ${OBJECTDIR}/_ext/747609821/port.o ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o ${OBJECTDIR}/_ext/2075338434/heap_4.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1472/system.o ${OBJECTDIR}/_ext/1472/gpio.o ${OBJECTDIR}/_ext/1472/error.o ${OBJECTDIR}/_ext/1472/misc.o

# Source Files
SOURCEFILES=../../source/croutine.c ../../source/event_groups.c ../../source/list.c ../../source/queue.c ../../source/tasks.c ../../source/timers.c ../../source/portable/MPLAB/PIC24_dsPIC/port.c ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S ../../source/portable/MemMang/heap_4.c ../main.c ../system.c ../gpio.c ../error.c ../misc.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Ex1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33CH512MP508
MP_LINKER_FILE_OPTION=,--script=p33CH512MP508.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/870914629/croutine.o: ../../source/croutine.c  .generated_files/3717fe13feb09f6b277da65f68b7c42931937a91.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/croutine.c  -o ${OBJECTDIR}/_ext/870914629/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/croutine.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/event_groups.o: ../../source/event_groups.c  .generated_files/641be38ac87f098e9afd242564beb690c2adb568.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/event_groups.c  -o ${OBJECTDIR}/_ext/870914629/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/event_groups.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/list.o: ../../source/list.c  .generated_files/d4d51075c708c684b890e9e24210c957157d4c20.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/list.c  -o ${OBJECTDIR}/_ext/870914629/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/list.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/queue.o: ../../source/queue.c  .generated_files/d2f346246421d2a88455d23faea38ab8f8b7433a.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/queue.c  -o ${OBJECTDIR}/_ext/870914629/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/queue.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/tasks.o: ../../source/tasks.c  .generated_files/a28efdba7596fdc9da46a733c997c7a80724713e.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/tasks.c  -o ${OBJECTDIR}/_ext/870914629/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/tasks.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/timers.o: ../../source/timers.c  .generated_files/154bb270b75e3e9820c7c389087ba32fd487b41f.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/timers.c  -o ${OBJECTDIR}/_ext/870914629/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/timers.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/747609821/port.o: ../../source/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/4a9b3a6ff2878b778160cbddade56b7a9584e4cf.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/747609821" 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/_ext/747609821/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/747609821/port.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2075338434/heap_4.o: ../../source/portable/MemMang/heap_4.c  .generated_files/bf3a38a74480c40904dd065e3f54686ea843f529.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2075338434" 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MemMang/heap_4.c  -o ${OBJECTDIR}/_ext/2075338434/heap_4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2075338434/heap_4.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/1cb401a11e6fd4504f296ba41d88452e3d8fe9f6.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/system.o: ../system.c  .generated_files/f785bd762d71705fcb69a6ac828b3ac799082982.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../system.c  -o ${OBJECTDIR}/_ext/1472/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/gpio.o: ../gpio.c  .generated_files/79c7555855963f81d6bbc9c82db1f2334d7c391a.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../gpio.c  -o ${OBJECTDIR}/_ext/1472/gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/gpio.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/error.o: ../error.c  .generated_files/c96760c739ec3260a545f1dbe97bece80910d297.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../error.c  -o ${OBJECTDIR}/_ext/1472/error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/error.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/misc.o: ../misc.c  .generated_files/208546d25f0afefeb1ac9d9aeb4e2f7b2257b3e5.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/misc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/misc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../misc.c  -o ${OBJECTDIR}/_ext/1472/misc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/misc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/870914629/croutine.o: ../../source/croutine.c  .generated_files/7f7b0d17743e5cfb31d2028ac9b49c7a23061799.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/croutine.c  -o ${OBJECTDIR}/_ext/870914629/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/croutine.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/event_groups.o: ../../source/event_groups.c  .generated_files/ad3f1ca7b71bce449c68672cf93a4dce9e2b7500.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/event_groups.c  -o ${OBJECTDIR}/_ext/870914629/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/event_groups.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/list.o: ../../source/list.c  .generated_files/905f5e7ae3c9fd289cc5717804ca546c35d7ddd3.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/list.c  -o ${OBJECTDIR}/_ext/870914629/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/list.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/queue.o: ../../source/queue.c  .generated_files/39167c8aed37c2a9d87dc63a2312ceb4ec18f9de.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/queue.c  -o ${OBJECTDIR}/_ext/870914629/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/queue.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/tasks.o: ../../source/tasks.c  .generated_files/e7d1dae07e5bb654549d9c13c3e659ff3c2315e5.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/tasks.c  -o ${OBJECTDIR}/_ext/870914629/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/tasks.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/timers.o: ../../source/timers.c  .generated_files/356b7e5cd3a5b40095e0c5d164220c96f7a772a6.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/timers.c  -o ${OBJECTDIR}/_ext/870914629/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/timers.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/747609821/port.o: ../../source/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/52a11b08562119b2f2f692ce5f57e870d807f203.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/747609821" 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/_ext/747609821/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/747609821/port.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2075338434/heap_4.o: ../../source/portable/MemMang/heap_4.c  .generated_files/8d2f4bda7f4ce33a2affc108f9bd68e82e5740d4.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2075338434" 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MemMang/heap_4.c  -o ${OBJECTDIR}/_ext/2075338434/heap_4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2075338434/heap_4.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/e8a28c33f48de52cf4805e050d6f25b633f74d5b.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/system.o: ../system.c  .generated_files/53c00bfd13c871fc7f3f2894fdc46cc89f47d8ee.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../system.c  -o ${OBJECTDIR}/_ext/1472/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/system.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/gpio.o: ../gpio.c  .generated_files/19bee1eb40599cebd4ac5972e92ac7dd97921ea3.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../gpio.c  -o ${OBJECTDIR}/_ext/1472/gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/gpio.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/error.o: ../error.c  .generated_files/7fbb8e783e97808b5ba073cbb89fb2f92208da36.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../error.c  -o ${OBJECTDIR}/_ext/1472/error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/error.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/misc.o: ../misc.c  .generated_files/b20b4634b2ac8fe212cf9473fc162e852fb4fa7d.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/misc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/misc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../misc.c  -o ${OBJECTDIR}/_ext/1472/misc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/misc.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o: ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/d57a6f89ffcedff2bd4d61bbbf22c99a81940e6d.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/747609821" 
	@${RM} ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.d 
	@${RM} ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -o ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.d"  -D__DEBUG   -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o: ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/6ad0ec3d48af19fd5c12b0ac15c29f9c90fbb2d1.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/747609821" 
	@${RM} ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.d 
	@${RM} ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -o ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.d"  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Ex1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Ex1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--heap=0,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Ex1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Ex1.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=0,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Ex1.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
