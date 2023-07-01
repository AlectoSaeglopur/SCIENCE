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
SOURCEFILES_QUOTED_IF_SPACED=../../source/croutine.c ../../source/event_groups.c ../../source/list.c ../../source/queue.c ../../source/tasks.c ../../source/timers.c ../../source/portable/MemMang/heap_1.c ../../source/portable/MPLAB/PIC24_dsPIC/port.c ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S ../main.c ../system.c ../gpio.c ../error.c ../led.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/870914629/croutine.o ${OBJECTDIR}/_ext/870914629/event_groups.o ${OBJECTDIR}/_ext/870914629/list.o ${OBJECTDIR}/_ext/870914629/queue.o ${OBJECTDIR}/_ext/870914629/tasks.o ${OBJECTDIR}/_ext/870914629/timers.o ${OBJECTDIR}/_ext/2075338434/heap_1.o ${OBJECTDIR}/_ext/747609821/port.o ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1472/system.o ${OBJECTDIR}/_ext/1472/gpio.o ${OBJECTDIR}/_ext/1472/error.o ${OBJECTDIR}/_ext/1472/led.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/870914629/croutine.o.d ${OBJECTDIR}/_ext/870914629/event_groups.o.d ${OBJECTDIR}/_ext/870914629/list.o.d ${OBJECTDIR}/_ext/870914629/queue.o.d ${OBJECTDIR}/_ext/870914629/tasks.o.d ${OBJECTDIR}/_ext/870914629/timers.o.d ${OBJECTDIR}/_ext/2075338434/heap_1.o.d ${OBJECTDIR}/_ext/747609821/port.o.d ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.d ${OBJECTDIR}/_ext/1472/main.o.d ${OBJECTDIR}/_ext/1472/system.o.d ${OBJECTDIR}/_ext/1472/gpio.o.d ${OBJECTDIR}/_ext/1472/error.o.d ${OBJECTDIR}/_ext/1472/led.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/870914629/croutine.o ${OBJECTDIR}/_ext/870914629/event_groups.o ${OBJECTDIR}/_ext/870914629/list.o ${OBJECTDIR}/_ext/870914629/queue.o ${OBJECTDIR}/_ext/870914629/tasks.o ${OBJECTDIR}/_ext/870914629/timers.o ${OBJECTDIR}/_ext/2075338434/heap_1.o ${OBJECTDIR}/_ext/747609821/port.o ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1472/system.o ${OBJECTDIR}/_ext/1472/gpio.o ${OBJECTDIR}/_ext/1472/error.o ${OBJECTDIR}/_ext/1472/led.o

# Source Files
SOURCEFILES=../../source/croutine.c ../../source/event_groups.c ../../source/list.c ../../source/queue.c ../../source/tasks.c ../../source/timers.c ../../source/portable/MemMang/heap_1.c ../../source/portable/MPLAB/PIC24_dsPIC/port.c ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S ../main.c ../system.c ../gpio.c ../error.c ../led.c



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
${OBJECTDIR}/_ext/870914629/croutine.o: ../../source/croutine.c  .generated_files/ddd2669ff6d6ffde9d1caa6d4cf1dc1e0036fc5b.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/croutine.c  -o ${OBJECTDIR}/_ext/870914629/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/croutine.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/event_groups.o: ../../source/event_groups.c  .generated_files/3e7a52a4c9acd9c5d009c833fded6b4928cf142b.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/event_groups.c  -o ${OBJECTDIR}/_ext/870914629/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/event_groups.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/list.o: ../../source/list.c  .generated_files/edb36f566be5dc09b11dc298e364501c6aed0088.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/list.c  -o ${OBJECTDIR}/_ext/870914629/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/list.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/queue.o: ../../source/queue.c  .generated_files/3ef0a8858fa24e8ff8e9a0612f879d26bd2334be.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/queue.c  -o ${OBJECTDIR}/_ext/870914629/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/queue.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/tasks.o: ../../source/tasks.c  .generated_files/32ceca7af7a38a5ee9b21cb7680fa51956856c28.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/tasks.c  -o ${OBJECTDIR}/_ext/870914629/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/tasks.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/timers.o: ../../source/timers.c  .generated_files/67f7084c316f18558c7f3ad820dae7b7c1f7a3d2.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/timers.c  -o ${OBJECTDIR}/_ext/870914629/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/timers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2075338434/heap_1.o: ../../source/portable/MemMang/heap_1.c  .generated_files/84a365aa56dffa45161a962b223349ac555c8562.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2075338434" 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MemMang/heap_1.c  -o ${OBJECTDIR}/_ext/2075338434/heap_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2075338434/heap_1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/747609821/port.o: ../../source/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/f7962524382754b6853272c7033a824f35d767a2.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/747609821" 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/_ext/747609821/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/747609821/port.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/90ec657e1eefda12c48533a372410a0b8a9fe5ee.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/system.o: ../system.c  .generated_files/76622b667150877191a15fc59ae016aedd40a5c1.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../system.c  -o ${OBJECTDIR}/_ext/1472/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/gpio.o: ../gpio.c  .generated_files/f48c72bb92c6f3916f80d2c2fa52acbe38b30716.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../gpio.c  -o ${OBJECTDIR}/_ext/1472/gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/gpio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/error.o: ../error.c  .generated_files/8f846128d9d75e73f95088fdd880283fed3a20ce.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../error.c  -o ${OBJECTDIR}/_ext/1472/error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/error.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/led.o: ../led.c  .generated_files/2f60cfaa841163942da5ddbed07c42961085775.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../led.c  -o ${OBJECTDIR}/_ext/1472/led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/led.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/870914629/croutine.o: ../../source/croutine.c  .generated_files/f269dbba55610aa46b364fb41e7ddb92a50ce795.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/croutine.c  -o ${OBJECTDIR}/_ext/870914629/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/croutine.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/event_groups.o: ../../source/event_groups.c  .generated_files/79510585727162c432d2a8d3cea4c48bf33d70c4.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/event_groups.c  -o ${OBJECTDIR}/_ext/870914629/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/event_groups.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/list.o: ../../source/list.c  .generated_files/14c71589b50f856df971109fbc9e1ecb439baf04.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/list.c  -o ${OBJECTDIR}/_ext/870914629/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/list.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/queue.o: ../../source/queue.c  .generated_files/79a500c5ad9748e06790b2daea29f964c6982e4.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/queue.c  -o ${OBJECTDIR}/_ext/870914629/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/queue.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/tasks.o: ../../source/tasks.c  .generated_files/1eea011ceb9b13ce1182310a7e24a03fa319ace3.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/tasks.c  -o ${OBJECTDIR}/_ext/870914629/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/tasks.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/timers.o: ../../source/timers.c  .generated_files/5d563f2649790b75fa3f6c5437a29e9c8ee830bc.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/timers.c  -o ${OBJECTDIR}/_ext/870914629/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/timers.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2075338434/heap_1.o: ../../source/portable/MemMang/heap_1.c  .generated_files/50dd85b0b6b6260364bf69e7c85f03aa63a6dbe7.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2075338434" 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MemMang/heap_1.c  -o ${OBJECTDIR}/_ext/2075338434/heap_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2075338434/heap_1.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/747609821/port.o: ../../source/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/1384dfcff002a98242ae459a4053f5ab8c95437a.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/747609821" 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/_ext/747609821/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/747609821/port.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/f6ba6add8d8ec6cc6e5e0bef7fd264c688ed231e.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/system.o: ../system.c  .generated_files/b60cd7fbf6837847fc4e7f9f78c1e185bf0634a3.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../system.c  -o ${OBJECTDIR}/_ext/1472/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/system.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/gpio.o: ../gpio.c  .generated_files/d3a5f2146bb0a4051f7649bba57b7eb348b23bb1.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../gpio.c  -o ${OBJECTDIR}/_ext/1472/gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/gpio.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/error.o: ../error.c  .generated_files/b940527a74a90419e985aad0a8f2451cfe146b97.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../error.c  -o ${OBJECTDIR}/_ext/1472/error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/error.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/led.o: ../led.c  .generated_files/4486fed21dc08b634791cb66f338f8636783ebfe.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../led.c  -o ${OBJECTDIR}/_ext/1472/led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/led.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O2 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o: ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/7c3f99162a5a28d61b40eee031a32c288e0566b4.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/747609821" 
	@${RM} ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.d 
	@${RM} ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -o ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o: ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/d1fbd27e71abf7cf60a75a9b4523f202282b0dc2.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Ex1.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)      -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,$(MP_LINKER_FILE_OPTION),--heap=0,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--library-path=".",--no-force-link,--smart-io,--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
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
