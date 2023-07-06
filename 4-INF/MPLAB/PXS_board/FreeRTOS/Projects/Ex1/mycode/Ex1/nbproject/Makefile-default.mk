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
${OBJECTDIR}/_ext/870914629/croutine.o: ../../source/croutine.c  .generated_files/e3bfbd0b52d4caa28a8acaa7d62f683a20f5b852.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/croutine.c  -o ${OBJECTDIR}/_ext/870914629/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/croutine.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/event_groups.o: ../../source/event_groups.c  .generated_files/520a5248af5b6c34c7b86793fa0b367f69df6cd5.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/event_groups.c  -o ${OBJECTDIR}/_ext/870914629/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/event_groups.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/list.o: ../../source/list.c  .generated_files/47f357070c8d4efca293573b9063d4ff45c6dd4f.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/list.c  -o ${OBJECTDIR}/_ext/870914629/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/list.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/queue.o: ../../source/queue.c  .generated_files/4cc0c69d2dce54b037538ee5aba3ca830608da1a.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/queue.c  -o ${OBJECTDIR}/_ext/870914629/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/queue.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/tasks.o: ../../source/tasks.c  .generated_files/c96423f4691f0f2c83d560821818176e5fb4e3ea.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/tasks.c  -o ${OBJECTDIR}/_ext/870914629/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/tasks.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/timers.o: ../../source/timers.c  .generated_files/44047146d68d31c413372cedd6e28c97fb075cdd.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/timers.c  -o ${OBJECTDIR}/_ext/870914629/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/timers.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/747609821/port.o: ../../source/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/5aefd47e8739204ef99427de28bffb731669c25f.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/747609821" 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/_ext/747609821/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/747609821/port.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2075338434/heap_4.o: ../../source/portable/MemMang/heap_4.c  .generated_files/693b4887c61f29e44790c5a602e3d939d1a54b5a.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2075338434" 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MemMang/heap_4.c  -o ${OBJECTDIR}/_ext/2075338434/heap_4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2075338434/heap_4.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/5cc11b403bc79b888f35ddc34d875ca7c17ec2f1.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/system.o: ../system.c  .generated_files/dba6520ebc3b95e44fdfa70b727c00c427dbd62b.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../system.c  -o ${OBJECTDIR}/_ext/1472/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/gpio.o: ../gpio.c  .generated_files/7d1df139e9638bb89c7375593394d34d3bebcf66.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../gpio.c  -o ${OBJECTDIR}/_ext/1472/gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/gpio.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/error.o: ../error.c  .generated_files/e10b326d434baa458e11b5f708457425264281c7.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../error.c  -o ${OBJECTDIR}/_ext/1472/error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/error.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/misc.o: ../misc.c  .generated_files/90771e8f9bb9b51a6dec6e7fb03896ca4a61456.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/misc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/misc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../misc.c  -o ${OBJECTDIR}/_ext/1472/misc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/misc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/870914629/croutine.o: ../../source/croutine.c  .generated_files/f77950e3eef9484bcc45fa55fa82dba8d2f1d4eb.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/croutine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/croutine.c  -o ${OBJECTDIR}/_ext/870914629/croutine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/croutine.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/event_groups.o: ../../source/event_groups.c  .generated_files/a58a3be19a729f61185fb16e47933d2caa10e75.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/event_groups.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/event_groups.c  -o ${OBJECTDIR}/_ext/870914629/event_groups.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/event_groups.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/list.o: ../../source/list.c  .generated_files/f0dfcece4933b92616fe6ecdf9130b606c19c622.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/list.c  -o ${OBJECTDIR}/_ext/870914629/list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/list.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/queue.o: ../../source/queue.c  .generated_files/4c0fef1df296fbb7fa4df84b077b24c2c4733c29.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/queue.c  -o ${OBJECTDIR}/_ext/870914629/queue.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/queue.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/tasks.o: ../../source/tasks.c  .generated_files/fd1f8e9ec3b54a95e8ed55eeeffe7040c6f71e36.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/tasks.c  -o ${OBJECTDIR}/_ext/870914629/tasks.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/tasks.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/870914629/timers.o: ../../source/timers.c  .generated_files/e610191e2de6d355b9babf7e83a9ac4ceeda3b79.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/870914629" 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/870914629/timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/timers.c  -o ${OBJECTDIR}/_ext/870914629/timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/870914629/timers.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/747609821/port.o: ../../source/portable/MPLAB/PIC24_dsPIC/port.c  .generated_files/9eb8367ba2a8ddb5a670a778aa376e3f96e5032c.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/747609821" 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/747609821/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MPLAB/PIC24_dsPIC/port.c  -o ${OBJECTDIR}/_ext/747609821/port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/747609821/port.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2075338434/heap_4.o: ../../source/portable/MemMang/heap_4.c  .generated_files/5f9a70c14ea3286c5f9632a88b0f63cff4b4c18e.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2075338434" 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/2075338434/heap_4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../source/portable/MemMang/heap_4.c  -o ${OBJECTDIR}/_ext/2075338434/heap_4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2075338434/heap_4.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/ccfab4b1e58bdba5321bf92f3ac186aacc6c0ac8.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../main.c  -o ${OBJECTDIR}/_ext/1472/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/system.o: ../system.c  .generated_files/e8cf0566bf3a10da5aa655dd36988aabcbe16dc4.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../system.c  -o ${OBJECTDIR}/_ext/1472/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/system.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/gpio.o: ../gpio.c  .generated_files/df4a39c1c7147568a876f6255ca8f6da972d4188.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../gpio.c  -o ${OBJECTDIR}/_ext/1472/gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/gpio.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/error.o: ../error.c  .generated_files/eaa4610e7b74b82b487a29572aa3507d14e414e9.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../error.c  -o ${OBJECTDIR}/_ext/1472/error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1472/error.o.d"      -mno-eds-warn  -g -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -DMPLAB_DSPIC_PORT -msmart-io=1 -Wall -msfr-warn=off   -fno-schedule-insns -fno-schedule-insns2  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1472/misc.o: ../misc.c  .generated_files/9fdd3402077ccc2673f9dc02244fec1bd963678b.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
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
${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o: ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/50be99a7e3e79c3aa546103686f86c8ba6e4dbc8.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
	@${MKDIR} "${OBJECTDIR}/_ext/747609821" 
	@${RM} ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.d 
	@${RM} ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  -o ${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.d"  -D__DEBUG   -omf=elf -save-temps=obj -DXPRJ_default=$(CND_CONF)  -legacy-libc  -I".." -I"../../source/include" -I"../../common/include" -I"../../source" -I"../FileSystem" -I"../include" -I"." -I".." -I"." -Wa,-MD,"${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax,-g$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/747609821/portasm_dsPIC.o: ../../source/portable/MPLAB/PIC24_dsPIC/portasm_dsPIC.S  .generated_files/650526f12128cfff3454d0d42744104a59e0977c.flag .generated_files/95e739771a79f52e681dbb0b33706c001c7051d2.flag
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
