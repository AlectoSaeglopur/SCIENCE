	.file "C:\\Users\\Filippo\\Desktop\\Projects\\Ex1\\mycode\\Ex1\\..\\..\\source\\tasks.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
	.global	_pxCurrentTCB	; export
	.section	.nbss,bss,near
	.align	2
	.type	_pxCurrentTCB,@object
	.size	_pxCurrentTCB, 2
_pxCurrentTCB:
	.skip	2
	.section	.bss,bss
	.align	2
	.type	_pxReadyTasksLists,@object
	.size	_pxReadyTasksLists, 100
_pxReadyTasksLists:
	.skip	100
	.align	2
	.type	_xDelayedTaskList1,@object
	.size	_xDelayedTaskList1, 10
_xDelayedTaskList1:
	.skip	10
	.align	2
	.type	_xDelayedTaskList2,@object
	.size	_xDelayedTaskList2, 10
_xDelayedTaskList2:
	.skip	10
	.section	.nbss,bss,near
	.align	2
	.type	_pxDelayedTaskList,@object
	.size	_pxDelayedTaskList, 2
_pxDelayedTaskList:
	.skip	2
	.align	2
	.type	_pxOverflowDelayedTaskList,@object
	.size	_pxOverflowDelayedTaskList, 2
_pxOverflowDelayedTaskList:
	.skip	2
	.section	.bss,bss
	.align	2
	.type	_xPendingReadyList,@object
	.size	_xPendingReadyList, 10
_xPendingReadyList:
	.skip	10
	.align	2
	.type	_xSuspendedTaskList,@object
	.size	_xSuspendedTaskList, 10
_xSuspendedTaskList:
	.skip	10
	.section	.nbss,bss,near
	.align	2
	.type	_uxCurrentNumberOfTasks,@object
	.size	_uxCurrentNumberOfTasks, 2
_uxCurrentNumberOfTasks:
	.skip	2
	.align	2
	.type	_xTickCount,@object
	.size	_xTickCount, 2
_xTickCount:
	.skip	2
	.align	2
	.type	_uxTopReadyPriority,@object
	.size	_uxTopReadyPriority, 2
_uxTopReadyPriority:
	.skip	2
	.align	2
	.type	_xSchedulerRunning,@object
	.size	_xSchedulerRunning, 2
_xSchedulerRunning:
	.skip	2
	.align	2
	.type	_uxPendedTicks,@object
	.size	_uxPendedTicks, 2
_uxPendedTicks:
	.skip	2
	.align	2
	.type	_xYieldPending,@object
	.size	_xYieldPending, 2
_xYieldPending:
	.skip	2
	.align	2
	.type	_xNumOfOverflows,@object
	.size	_xNumOfOverflows, 2
_xNumOfOverflows:
	.skip	2
	.align	2
	.type	_uxTaskNumber,@object
	.size	_uxTaskNumber, 2
_uxTaskNumber:
	.skip	2
	.align	2
	.type	_xNextTaskUnblockTime,@object
	.size	_xNextTaskUnblockTime, 2
_xNextTaskUnblockTime:
	.skip	2
	.align	2
	.type	_xIdleTaskHandle,@object
	.size	_xIdleTaskHandle, 2
_xIdleTaskHandle:
	.skip	2
	.align	2
	.type	_uxSchedulerSuspended,@object
	.size	_uxSchedulerSuspended, 2
_uxSchedulerSuspended:
	.skip	2
	.align	2
	.type	_ulTaskSwitchedInTime,@object
	.size	_ulTaskSwitchedInTime, 4
_ulTaskSwitchedInTime:
	.skip	4
	.align	2
	.type	_ulTotalRunTime,@object
	.size	_ulTotalRunTime, 4
_ulTotalRunTime:
	.skip	4
	.section	.text,code
	.align	2
	.global	_xTaskCreate	; export
	.type	_xTaskCreate,@function
_xTaskCreate:
.LFB0:
	.file 1 "../../source/tasks.c"
	.loc 1 682 0
	.set ___PA___,1
	lnk	#16
.LCFI0:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	mov	w2,[w14+8]
	mov	w3,[w14+10]
	mov	w4,[w14+12]
	mov	w5,[w14+14]
	.loc 1 694 0
	mov	#54,w0
	rcall	_pvPortMalloc
	mov	w0,[w14]
	.loc 1 696 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L2
	.loc 1 701 0
	mov	[w14+8],w0
	add	w0,w0,w0
	rcall	_pvPortMalloc
	mov	w0,w1
	mov	[w14],w0
	mov	w1,[w0+24]
	.loc 1 703 0
	mov	[w14],w0
	mov	[w0+24],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L2
	.loc 1 706 0
	mov	[w14],w0
	rcall	_vPortFree
	.loc 1 707 0
	clr	w0
	mov	w0,[w14]
.L2:
	.loc 1 742 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L3
	.loc 1 752 0
	mov	[w14+8],w0
	clr	w1
	clr	w2
	mov	w2,[w15++]
	mov	[w14],w7
	mov	[w14+14],w6
	mov	[w14+12],w5
	mov	[w14+10],w4
	mov.d	w0,w2
	mov	[w14+6],w1
	mov	[w14+4],w0
.LCFI1:
	rcall	_prvInitialiseNewTask
	dec2	w15,w15
	.loc 1 753 0
	mov	[w14],w0
.LCFI2:
	rcall	_prvAddNewTaskToReadyList
	.loc 1 754 0
	mov	#1,w0
	mov	w0,[w14+2]
	bra	.L4
.L3:
	.loc 1 758 0
	setm	w0
	mov	w0,[w14+2]
.L4:
	.loc 1 761 0
	mov	[w14+2],w0
	.loc 1 762 0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.size	_xTaskCreate, .-_xTaskCreate
	.align	2
	.type	_prvInitialiseNewTask,@function
_prvInitialiseNewTask:
.LFB1:
	.loc 1 775 0
	.set ___PA___,1
	lnk	#20
.LCFI3:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	mov	w2,[w14+8]
	mov	w3,[w14+10]
	mov	w4,[w14+12]
	mov	w5,[w14+14]
	mov	w6,[w14+16]
	mov	w7,[w14+18]
	.loc 1 797 0
	mov	[w14+8],w0
	add	w0,w0,w0
	mov	w0,w1
	mov	[w14+18],w0
	mov	[w0+24],w0
	mov	w1,w2
	mov	#165,w1
	rcall	_memset
	.loc 1 815 0
	mov	[w14+18],w0
	mov	[w0+24],w1
	mov	w1,[w14+2]
	.loc 1 822 0
	mov	[w14+18],w0
	mov	[w0+24],w1
	mov	[w14+8],w2
	mov	#32767,w0
	add	w2,w0,w0
	add	w0,w0,w0
	add	w1,w0,w1
	mov	[w14+18],w0
	mov	w1,[w0+34]
	.loc 1 827 0
	clr	w0
	mov	w0,[w14]
	bra	.L6
.L9:
	.loc 1 829 0
	mov	[w14+6],w0
	add	w0,[w14],w0
	mov.b	[w0],w1
	mov	[w14+18],w0
	add	w0,[w14],w0
	add	w0,#26,w0
	mov.b	w1,[w0]
	.loc 1 834 0
	mov	[w14+6],w0
	add	w0,[w14],w0
	mov.b	[w0],w0
	cp0.b	w0
	.set ___BP___,0
	bra	z,.L12
.L7:
	.loc 1 827 0
	inc	[w14],[w14]
.L6:
	mov	[w14],w0
	sub	w0,#7,[w15]
	.set ___BP___,0
	bra	leu,.L9
	bra	.L8
.L12:
	.loc 1 836 0
	nop	
.L8:
	.loc 1 846 0
	mov	[w14+18],w0
	clr.b	w1
	mov.b	w1,[w0+33]
	.loc 1 850 0
	mov	[w14+14],w0
	sub	w0,#9,[w15]
	.set ___BP___,0
	bra	leu,.L10
	.loc 1 852 0
	mov	#9,w0
	mov	w0,[w14+14]
.L10:
	.loc 1 859 0
	mov	[w14+18],w0
	mov	[w14+14],w1
	mov	w1,[w0+22]
	.loc 1 862 0
	mov	[w14+18],w0
	mov	[w14+14],w1
	mov	w1,[w0+40]
	.loc 1 863 0
	mov	[w14+18],w0
	clr	w1
	mov	w1,[w0+42]
	.loc 1 867 0
	mov	[w14+18],w0
	inc2	w0,w0
	rcall	_vListInitialiseItem
	.loc 1 868 0
	mov	[w14+18],w0
	add	w0,#12,w0
	rcall	_vListInitialiseItem
	.loc 1 872 0
	mov	[w14+18],w0
	mov	[w14+18],w1
	mov	w1,[w0+8]
	.loc 1 875 0
	mov	[w14+14],w0
	subr	w0,#10,w1
	mov	[w14+18],w0
	mov	w1,[w0+12]
	.loc 1 876 0
	mov	[w14+18],w0
	mov	[w14+18],w1
	mov	w1,[w0+18]
	.loc 1 892 0
	mov	[w14+18],w2
	mul.uu	w0,#0,w0
	mov	w0,[w2+44]
	mov	w1,[w2+46]
	.loc 1 918 0
	mov	[w14+18],w2
	mul.uu	w0,#0,w0
	mov	w0,[w2+48]
	mov	w1,[w2+50]
	.loc 1 919 0
	mov	[w14+18],w0
	clr.b	w1
	mov.b	w1,[w0+52]
	.loc 1 946 0
	mov	[w14+12],w2
	mov	[w14+4],w1
	mov	[w14+2],w0
	rcall	_pxPortInitialiseStack
	mov	w0,w1
	mov	[w14+18],w0
	mov	w1,[w0]
	.loc 1 950 0
	mov	[w14+16],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L5
	.loc 1 954 0
	mov	[w14+16],w0
	mov	[w14+18],w1
	mov	w1,[w0]
.L5:
	.loc 1 960 0
	ulnk	
	return	
	.set ___PA___,0
.LFE1:
	.size	_prvInitialiseNewTask, .-_prvInitialiseNewTask
	.align	2
	.type	_prvAddNewTaskToReadyList,@function
_prvAddNewTaskToReadyList:
.LFB2:
	.loc 1 964 0
	.set ___PA___,0
	lnk	#2
.LCFI4:
	mov	w0,[w14]
	.loc 1 967 0
	rcall	_vPortEnterCritical
	.loc 1 969 0
	mov	_uxCurrentNumberOfTasks,w0
	inc	w0,w0
	mov	w0,_uxCurrentNumberOfTasks
	.loc 1 970 0
	mov	_pxCurrentTCB,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L14
	.loc 1 974 0
	mov	[w14],w1
	mov	w1,_pxCurrentTCB
	.loc 1 976 0
	mov	_uxCurrentNumberOfTasks,w0
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L15
	.loc 1 981 0
	rcall	_prvInitialiseTaskLists
	bra	.L15
.L14:
	.loc 1 993 0
	mov	_xSchedulerRunning,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L15
	.loc 1 995 0
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w1
	mov	[w14],w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	gtu,.L15
	.loc 1 997 0
	mov	[w14],w1
	mov	w1,_pxCurrentTCB
.L15:
	.loc 1 1010 0
	mov	_uxTaskNumber,w0
	inc	w0,w0
	mov	w0,_uxTaskNumber
	.loc 1 1015 0
	mov	_uxTaskNumber,w1
	mov	[w14],w0
	mov	w1,[w0+36]
	.loc 1 1020 0
	mov	[w14],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L16
	mov	[w14],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L16:
	inc2	[w14],w1
	mov	[w14],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	.loc 1 1024 0
	rcall	_vPortExitCritical
	.loc 1 1026 0
	mov	_xSchedulerRunning,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L13
	.loc 1 1030 0
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w1
	mov	[w14],w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L13
	.loc 1 1032 0
; 1032 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L13:
	.loc 1 1043 0
	ulnk	
	return	
	.set ___PA___,0
.LFE2:
	.size	_prvAddNewTaskToReadyList, .-_prvAddNewTaskToReadyList
	.align	2
	.global	_vTaskDelayUntil	; export
	.type	_vTaskDelayUntil,@function
_vTaskDelayUntil:
.LFB3:
	.loc 1 1141 0
	.set ___PA___,0
	lnk	#12
.LCFI5:
	mov	w0,[w14+8]
	mov	w1,[w14+10]
	.loc 1 1143 0
	clr	w0
	mov	w0,[w14]
	.loc 1 1149 0
	rcall	_vTaskSuspendAll
.LBB2:
	.loc 1 1153 0
	mov	_xTickCount,w1
	mov	w1,[w14+2]
	.loc 1 1156 0
	mov	[w14+8],w0
	mov	[w0],w1
	mov	[w14+10],w0
	add	w1,w0,w0
	mov	w0,[w14+4]
	.loc 1 1158 0
	mov	[w14+8],w0
	mov	[w0],w1
	mov	[w14+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L19
	.loc 1 1165 0
	mov	[w14+8],w0
	mov	[w0],w1
	mov	[w14+4],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L20
	mov	[w14+4],w1
	mov	[w14+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L20
	.loc 1 1167 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L20
.L19:
	.loc 1 1179 0
	mov	[w14+8],w0
	mov	[w0],w1
	mov	[w14+4],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	gtu,.L21
	mov	[w14+4],w1
	mov	[w14+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L20
.L21:
	.loc 1 1181 0
	mov	#1,w0
	mov	w0,[w14]
.L20:
	.loc 1 1190 0
	mov	[w14+8],w0
	mov	[w14+4],w1
	mov	w1,[w0]
	.loc 1 1192 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L22
	.loc 1 1198 0
	mov	[w14+4],w1
	mov	[w14+2],w0
	sub	w1,w0,w0
	clr	w1
	rcall	_prvAddCurrentTaskToDelayedList
.L22:
.LBE2:
	.loc 1 1205 0
	rcall	_xTaskResumeAll
	mov	w0,[w14+6]
	.loc 1 1209 0
	mov	[w14+6],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L18
	.loc 1 1211 0
; 1211 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L18:
	.loc 1 1217 0
	ulnk	
	return	
	.set ___PA___,0
.LFE3:
	.size	_vTaskDelayUntil, .-_vTaskDelayUntil
	.align	2
	.global	_vTaskDelay	; export
	.type	_vTaskDelay,@function
_vTaskDelay:
.LFB4:
	.loc 1 1225 0
	.set ___PA___,0
	lnk	#4
.LCFI6:
	mov	w0,[w14+2]
	.loc 1 1226 0
	clr	w0
	mov	w0,[w14]
	.loc 1 1229 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L25
	.loc 1 1232 0
	rcall	_vTaskSuspendAll
	.loc 1 1243 0
	clr	w1
	mov	[w14+2],w0
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 1245 0
	rcall	_xTaskResumeAll
	mov	w0,[w14]
.L25:
	.loc 1 1254 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L24
	.loc 1 1256 0
; 1256 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L24:
	.loc 1 1262 0
	ulnk	
	return	
	.set ___PA___,0
.LFE4:
	.size	_vTaskDelay, .-_vTaskDelay
	.align	2
	.global	_eTaskGetState	; export
	.type	_eTaskGetState,@function
_eTaskGetState:
.LFB5:
	.loc 1 1270 0
	.set ___PA___,1
	lnk	#8
.LCFI7:
	mov	w0,[w14+6]
	.loc 1 1273 0
	mov	[w14+6],w1
	mov	w1,[w14+2]
	.loc 1 1277 0
	mov	_pxCurrentTCB,w0
	mov	[w14+2],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L28
	.loc 1 1280 0
	clr	w0
	mov	w0,[w14]
	bra	.L29
.L28:
	.loc 1 1284 0
	rcall	_vPortEnterCritical
	.loc 1 1286 0
	mov	[w14+2],w0
	mov	[w0+10],w0
	mov	w0,[w14+4]
	.loc 1 1288 0
	rcall	_vPortExitCritical
	.loc 1 1290 0
	mov	_pxDelayedTaskList,w0
	mov	[w14+4],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L30
	mov	_pxOverflowDelayedTaskList,w0
	mov	[w14+4],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L31
.L30:
	.loc 1 1294 0
	mov	#2,w0
	mov	w0,[w14]
	bra	.L29
.L31:
	.loc 1 1298 0
	mov	[w14+4],w1
	mov	#_xSuspendedTaskList,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L32
	.loc 1 1303 0
	mov	[w14+2],w0
	mov	[w0+20],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L33
	.loc 1 1305 0
	mov	#3,w0
	mov	w0,[w14]
	bra	.L29
.L33:
	.loc 1 1309 0
	mov	#2,w0
	mov	w0,[w14]
	bra	.L29
.L32:
	.loc 1 1328 0
	mov	#1,w0
	mov	w0,[w14]
.L29:
	.loc 1 1332 0
	mov	[w14],w0
	.loc 1 1333 0
	ulnk	
	return	
	.set ___PA___,0
.LFE5:
	.size	_eTaskGetState, .-_eTaskGetState
	.align	2
	.global	_vTaskPrioritySet	; export
	.type	_vTaskPrioritySet,@function
_vTaskPrioritySet:
.LFB6:
	.loc 1 1403 0
	.set ___PA___,0
	lnk	#12
.LCFI8:
	mov	w0,[w14+8]
	mov	w1,[w14+10]
	.loc 1 1406 0
	clr	w0
	mov	w0,[w14]
	.loc 1 1411 0
	mov	[w14+10],w0
	sub	w0,#9,[w15]
	.set ___BP___,0
	bra	leu,.L35
	.loc 1 1413 0
	mov	#9,w0
	mov	w0,[w14+10]
.L35:
	.loc 1 1420 0
	rcall	_vPortEnterCritical
	.loc 1 1424 0
	mov	[w14+8],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L36
	mov	_pxCurrentTCB,w0
	bra	.L37
.L36:
	mov	[w14+8],w0
.L37:
	mov	w0,[w14+2]
	.loc 1 1430 0
	mov	[w14+2],w0
	mov	[w0+40],w1
	mov	w1,[w14+4]
	.loc 1 1438 0
	mov	[w14+4],w1
	mov	[w14+10],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L38
	.loc 1 1442 0
	mov	[w14+10],w1
	mov	[w14+4],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L39
	.loc 1 1444 0
	mov	_pxCurrentTCB,w0
	mov	[w14+2],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L40
	.loc 1 1449 0
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w1
	mov	[w14+10],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	gtu,.L40
	.loc 1 1451 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L40
.L39:
	.loc 1 1465 0
	mov	_pxCurrentTCB,w0
	mov	[w14+2],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L40
	.loc 1 1470 0
	mov	#1,w0
	mov	w0,[w14]
.L40:
	.loc 1 1482 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	w1,[w14+6]
	.loc 1 1488 0
	mov	[w14+2],w0
	mov	[w0+40],w1
	mov	[w14+2],w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L41
	.loc 1 1490 0
	mov	[w14+2],w0
	mov	[w14+10],w1
	mov	w1,[w0+22]
.L41:
	.loc 1 1498 0
	mov	[w14+2],w0
	mov	[w14+10],w1
	mov	w1,[w0+40]
	.loc 1 1508 0
	mov	[w14+2],w0
	mov	[w0+12],w0
	cp0	w0
	.set ___BP___,0
	bra	lt,.L42
	.loc 1 1510 0
	mov	[w14+10],w0
	subr	w0,#10,w1
	mov	[w14+2],w0
	mov	w1,[w0+12]
.L42:
	.loc 1 1521 0
	mov	[w14+2],w0
	mov	[w0+10],w1
	mov	[w14+6],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L43
	.loc 1 1526 0
	mov	[w14+2],w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 1537 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L44
	mov	[w14+2],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L44:
	mov	[w14+2],w0
	inc2	w0,w1
	mov	[w14+2],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
.L43:
	.loc 1 1544 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L38
	.loc 1 1546 0
; 1546 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L38:
	.loc 1 1558 0
	rcall	_vPortExitCritical
	.loc 1 1559 0
	ulnk	
	return	
	.set ___PA___,0
.LFE6:
	.size	_vTaskPrioritySet, .-_vTaskPrioritySet
	.align	2
	.global	_vTaskSuspend	; export
	.type	_vTaskSuspend,@function
_vTaskSuspend:
.LFB7:
	.loc 1 1567 0
	.set ___PA___,0
	lnk	#4
.LCFI9:
	mov	w0,[w14+2]
	.loc 1 1570 0
	rcall	_vPortEnterCritical
	.loc 1 1574 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L46
	mov	_pxCurrentTCB,w0
	bra	.L47
.L46:
	mov	[w14+2],w0
.L47:
	mov	w0,[w14]
	.loc 1 1580 0
	inc2	[w14],w0
	rcall	_uxListRemove
	.loc 1 1590 0
	mov	[w14],w0
	mov	[w0+20],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L48
	.loc 1 1592 0
	mov	[w14],w1
	add	w1,#12,w0
	rcall	_uxListRemove
.L48:
	.loc 1 1599 0
	inc2	[w14],w0
	mov	w0,w1
	mov	#_xSuspendedTaskList,w0
	rcall	_vListInsertEnd
	.loc 1 1601 0
	rcall	_vPortExitCritical
	.loc 1 1603 0
	mov	_xSchedulerRunning,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L49
	.loc 1 1607 0
	rcall	_vPortEnterCritical
	.loc 1 1609 0
	rcall	_prvResetNextTaskUnblockTime
	.loc 1 1611 0
	rcall	_vPortExitCritical
.L49:
	.loc 1 1618 0
	mov	_pxCurrentTCB,w0
	mov	[w14],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L45
	.loc 1 1620 0
	mov	_xSchedulerRunning,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L51
	.loc 1 1624 0
; 1624 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
	bra	.L45
.L51:
	.loc 1 1631 0
	mov	_xSuspendedTaskList,w1
	mov	_uxCurrentNumberOfTasks,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L52
	.loc 1 1637 0
	clr	_pxCurrentTCB
	bra	.L45
.L52:
	.loc 1 1641 0
	rcall	_vTaskSwitchContext
.L45:
	.loc 1 1649 0
	ulnk	
	return	
	.set ___PA___,0
.LFE7:
	.size	_vTaskSuspend, .-_vTaskSuspend
	.align	2
	.type	_prvTaskIsTaskSuspended,@function
_prvTaskIsTaskSuspended:
.LFB8:
	.loc 1 1657 0
	.set ___PA___,1
	lnk	#6
.LCFI10:
	mov	w0,[w14+4]
	.loc 1 1658 0
	clr	w0
	mov	w0,[w14]
	.loc 1 1659 0
	mov	[w14+4],w1
	mov	w1,[w14+2]
	.loc 1 1668 0
	mov	[w14+2],w0
	mov	[w0+10],w1
	mov	#_xSuspendedTaskList,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L54
	.loc 1 1671 0
	mov	[w14+2],w0
	mov	[w0+20],w1
	mov	#_xPendingReadyList,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L54
	.loc 1 1675 0
	mov	[w14+2],w0
	mov	[w0+20],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L54
	.loc 1 1677 0
	mov	#1,w0
	mov	w0,[w14]
.L54:
	.loc 1 1694 0
	mov	[w14],w0
	.loc 1 1695 0
	ulnk	
	return	
	.set ___PA___,0
.LFE8:
	.size	_prvTaskIsTaskSuspended, .-_prvTaskIsTaskSuspended
	.align	2
	.global	_vTaskResume	; export
	.type	_vTaskResume,@function
_vTaskResume:
.LFB9:
	.loc 1 1703 0
	.set ___PA___,0
	lnk	#4
.LCFI11:
	mov	w0,[w14+2]
	.loc 1 1704 0
	mov	[w14+2],w1
	mov	w1,[w14]
	.loc 1 1711 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L55
	mov	_pxCurrentTCB,w0
	mov	[w14],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L55
	.loc 1 1713 0
	rcall	_vPortEnterCritical
	.loc 1 1715 0
	mov	[w14],w0
	rcall	_prvTaskIsTaskSuspended
	cp0	w0
	.set ___BP___,0
	bra	z,.L57
	.loc 1 1721 0
	inc2	[w14],w0
	rcall	_uxListRemove
	.loc 1 1722 0
	mov	[w14],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L58
	mov	[w14],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L58:
	inc2	[w14],w1
	mov	[w14],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	.loc 1 1725 0
	mov	[w14],w0
	mov	[w0+22],w1
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L57
	.loc 1 1730 0
; 1730 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L57:
	.loc 1 1742 0
	rcall	_vPortExitCritical
.L55:
	.loc 1 1748 0
	ulnk	
	return	
	.set ___PA___,0
.LFE9:
	.size	_vTaskResume, .-_vTaskResume
	.align	2
	.global	_xTaskResumeFromISR	; export
	.type	_xTaskResumeFromISR,@function
_xTaskResumeFromISR:
.LFB10:
	.loc 1 1757 0
	.set ___PA___,1
	lnk	#8
.LCFI12:
	mov	w0,[w14+6]
	.loc 1 1758 0
	clr	w0
	mov	w0,[w14]
	.loc 1 1759 0
	mov	[w14+6],w1
	mov	w1,[w14+2]
	.loc 1 1782 0
	clr	w0
	mov	w0,[w14+4]
	.loc 1 1784 0
	mov	[w14+2],w0
	rcall	_prvTaskIsTaskSuspended
	cp0	w0
	.set ___BP___,0
	bra	z,.L60
	.loc 1 1789 0
	mov	_uxSchedulerSuspended,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L61
	.loc 1 1793 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L62
	.loc 1 1795 0
	mov	#1,w0
	mov	w0,[w14]
.L62:
	.loc 1 1802 0
	mov	[w14+2],w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 1803 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L63
	mov	[w14+2],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L63:
	mov	[w14+2],w0
	inc2	w0,w1
	mov	[w14+2],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	bra	.L60
.L61:
	.loc 1 1810 0
	mov	[w14+2],w0
	add	w0,#12,w0
	mov	w0,w1
	mov	#_xPendingReadyList,w0
	rcall	_vListInsertEnd
.L60:
	.loc 1 1820 0
	mov	[w14],w0
	.loc 1 1821 0
	ulnk	
	return	
	.set ___PA___,0
.LFE10:
	.size	_xTaskResumeFromISR, .-_xTaskResumeFromISR
	.section .const,psv,page
.LC0:
	.asciz	"IDLE"
	.section	.text,code
	.align	2
	.global	_vTaskStartScheduler	; export
	.type	_vTaskStartScheduler,@function
_vTaskStartScheduler:
.LFB11:
	.loc 1 1827 0
	.set ___PA___,0
	lnk	#2
.LCFI13:
	.loc 1 1860 0
	mov	#_xIdleTaskHandle,w5
	clr	w4
	clr	w3
	mov	#120,w2
	mov	#.LC0,w1
	mov	#handle(_prvIdleTask),w0
	rcall	_xTaskCreate
	mov	w0,[w14]
	.loc 1 1870 0
	mov	[w14],w0
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L65
	.loc 1 1872 0
	rcall	_xTimerCreateTimerTask
	mov	w0,[w14]
.L65:
	.loc 1 1881 0
	mov	[w14],w0
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L64
	.loc 1 1888 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	bset	w0,#5
	mov	w0,_SRbits
	nop	
; 1888 "../../source/tasks.c" 1
	NOP
	.loc 1 1898 0
	setm	w0
	mov	w0,_xNextTaskUnblockTime
	.loc 1 1899 0
	mov	#1,w0
	mov	w0,_xSchedulerRunning
	.loc 1 1900 0
	clr	_xTickCount
	.loc 1 1905 0
	rcall	_Config_CCT8
	.loc 1 1909 0
	rcall	_xPortStartScheduler
.L64:
	.loc 1 1930 0
	ulnk	
	return	
	.set ___PA___,0
.LFE11:
	.size	_vTaskStartScheduler, .-_vTaskStartScheduler
	.align	2
	.global	_vTaskEndScheduler	; export
	.type	_vTaskEndScheduler,@function
_vTaskEndScheduler:
.LFB12:
	.loc 1 1934 0
	.set ___PA___,0
	lnk	#0
.LCFI14:
	.loc 1 1938 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	bset	w0,#5
	mov	w0,_SRbits
	nop	
; 1938 "../../source/tasks.c" 1
	NOP
	.loc 1 1939 0
	clr	_xSchedulerRunning
	.loc 1 1940 0
	rcall	_vPortEndScheduler
	.loc 1 1941 0
	ulnk	
	return	
	.set ___PA___,0
.LFE12:
	.size	_vTaskEndScheduler, .-_vTaskEndScheduler
	.align	2
	.global	_vTaskSuspendAll	; export
	.type	_vTaskSuspendAll,@function
_vTaskSuspendAll:
.LFB13:
	.loc 1 1945 0
	.set ___PA___,1
	lnk	#0
.LCFI15:
	.loc 1 1950 0
	mov	_uxSchedulerSuspended,w0
	inc	w0,w0
	mov	w0,_uxSchedulerSuspended
	.loc 1 1951 0
	ulnk	
	return	
	.set ___PA___,0
.LFE13:
	.size	_vTaskSuspendAll, .-_vTaskSuspendAll
	.align	2
	.global	_xTaskResumeAll	; export
	.type	_xTaskResumeAll,@function
_xTaskResumeAll:
.LFB14:
	.loc 1 2018 0
	.set ___PA___,0
	lnk	#6
.LCFI16:
	.loc 1 2019 0
	clr	w0
	mov	w0,[w14]
	.loc 1 2020 0
	clr	w0
	mov	w0,[w14+2]
	.loc 1 2031 0
	rcall	_vPortEnterCritical
	.loc 1 2033 0
	mov	_uxSchedulerSuspended,w0
	dec	w0,w0
	mov	w0,_uxSchedulerSuspended
	.loc 1 2035 0
	mov	_uxSchedulerSuspended,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L70
	.loc 1 2037 0
	mov	_uxCurrentNumberOfTasks,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L70
	.loc 1 2041 0
	bra	.L71
.L73:
	.loc 1 2043 0
	mov	_xPendingReadyList+6,w0
	mov	[w0+6],w0
	mov	w0,[w14]
	.loc 1 2044 0
	mov	[w14],w1
	add	w1,#12,w0
	rcall	_uxListRemove
	.loc 1 2045 0
	inc2	[w14],w0
	rcall	_uxListRemove
	.loc 1 2046 0
	mov	[w14],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L72
	mov	[w14],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L72:
	inc2	[w14],w1
	mov	[w14],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	.loc 1 2050 0
	mov	[w14],w0
	mov	[w0+22],w1
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L71
	.loc 1 2052 0
	mov	#1,w0
	mov	w0,_xYieldPending
.L71:
	.loc 1 2041 0
	mov	_xPendingReadyList,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L73
	.loc 1 2060 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L74
	.loc 1 2068 0
	rcall	_prvResetNextTaskUnblockTime
.L74:
.LBB3:
	.loc 1 2076 0
	mov	_uxPendedTicks,w1
	mov	w1,[w14+4]
	.loc 1 2078 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L75
.L77:
	.loc 1 2082 0
	rcall	_xTaskIncrementTick
	cp0	w0
	.set ___BP___,0
	bra	z,.L76
	.loc 1 2084 0
	mov	#1,w0
	mov	w0,_xYieldPending
.L76:
	.loc 1 2090 0
	mov	[w14+4],w0
	dec	w0,w0
	mov	w0,[w14+4]
	.loc 1 2091 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L77
	.loc 1 2093 0
	clr	_uxPendedTicks
.L75:
.LBE3:
	.loc 1 2101 0
	mov	_xYieldPending,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L70
	.loc 1 2105 0
	mov	#1,w0
	mov	w0,[w14+2]
	.loc 1 2108 0
; 2108 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L70:
	.loc 1 2121 0
	rcall	_vPortExitCritical
	.loc 1 2123 0
	mov	[w14+2],w0
	.loc 1 2124 0
	ulnk	
	return	
	.set ___PA___,0
.LFE14:
	.size	_xTaskResumeAll, .-_xTaskResumeAll
	.align	2
	.global	_xTaskGetTickCount	; export
	.type	_xTaskGetTickCount,@function
_xTaskGetTickCount:
.LFB15:
	.loc 1 2128 0
	.set ___PA___,1
	lnk	#2
.LCFI17:
	.loc 1 2132 0
	rcall	_vPortEnterCritical
	.loc 1 2134 0
	mov	_xTickCount,w1
	mov	w1,[w14]
	.loc 1 2136 0
	rcall	_vPortExitCritical
	.loc 1 2138 0
	mov	[w14],w0
	.loc 1 2139 0
	ulnk	
	return	
	.set ___PA___,0
.LFE15:
	.size	_xTaskGetTickCount, .-_xTaskGetTickCount
	.align	2
	.global	_xTaskGetTickCountFromISR	; export
	.type	_xTaskGetTickCountFromISR,@function
_xTaskGetTickCountFromISR:
.LFB16:
	.loc 1 2143 0
	.set ___PA___,1
	lnk	#4
.LCFI18:
	.loc 1 2163 0
	clr	w0
	mov	w0,[w14]
	.loc 1 2165 0
	mov	_xTickCount,w1
	mov	w1,[w14+2]
	.loc 1 2169 0
	mov	[w14+2],w0
	.loc 1 2170 0
	ulnk	
	return	
	.set ___PA___,0
.LFE16:
	.size	_xTaskGetTickCountFromISR, .-_xTaskGetTickCountFromISR
	.align	2
	.global	_uxTaskGetNumberOfTasks	; export
	.type	_uxTaskGetNumberOfTasks,@function
_uxTaskGetNumberOfTasks:
.LFB17:
	.loc 1 2174 0
	.set ___PA___,1
	lnk	#0
.LCFI19:
	.loc 1 2177 0
	mov	_uxCurrentNumberOfTasks,w0
	.loc 1 2178 0
	ulnk	
	return	
	.set ___PA___,0
.LFE17:
	.size	_uxTaskGetNumberOfTasks, .-_uxTaskGetNumberOfTasks
	.align	2
	.global	_pcTaskGetName	; export
	.type	_pcTaskGetName,@function
_pcTaskGetName:
.LFB18:
	.loc 1 2182 0
	.set ___PA___,1
	lnk	#4
.LCFI20:
	mov	w0,[w14+2]
	.loc 1 2187 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L82
	mov	_pxCurrentTCB,w0
	bra	.L83
.L82:
	mov	[w14+2],w0
.L83:
	mov	w0,[w14]
	.loc 1 2189 0
	mov	[w14],w1
	add	w1,#26,w0
	.loc 1 2190 0
	ulnk	
	return	
	.set ___PA___,0
.LFE18:
	.size	_pcTaskGetName, .-_pcTaskGetName
	.align	2
	.global	_uxTaskGetSystemState	; export
	.type	_uxTaskGetSystemState,@function
_uxTaskGetSystemState:
.LFB19:
	.loc 1 2322 0
	.set ___PA___,1
	lnk	#10
.LCFI21:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	mov	w2,[w14+8]
	.loc 1 2323 0
	clr	w0
	mov	w0,[w14]
	mov	#10,w0
	mov	w0,[w14+2]
	.loc 1 2325 0
	rcall	_vTaskSuspendAll
	.loc 1 2328 0
	mov	_uxCurrentNumberOfTasks,w0
	mov	[w14+6],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L85
.L86:
	.loc 1 2334 0
	mov	[w14+2],w0
	dec	w0,w0
	mov	w0,[w14+2]
	.loc 1 2335 0
	mov	[w14+2],w0
	mulw.su	w0,#10,w0
	mov	w0,w1
	mov	#_pxReadyTasksLists,w0
	add	w1,w0,w1
	mov	[w14],w0
	mulw.su	w0,#20,w0
	mov	[w14+4],w2
	add	w2,w0,w0
	mov	#1,w2
	rcall	_prvListTasksWithinSingleList
	add	w0,[w14],[w14]
	.loc 1 2337 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L86
	.loc 1 2341 0
	mov	_pxDelayedTaskList,w1
	mov	[w14],w0
	mulw.su	w0,#20,w0
	mov	[w14+4],w2
	add	w2,w0,w0
	mov	#2,w2
	rcall	_prvListTasksWithinSingleList
	add	w0,[w14],[w14]
	.loc 1 2342 0
	mov	_pxOverflowDelayedTaskList,w1
	mov	[w14],w0
	mulw.su	w0,#20,w0
	mov	[w14+4],w2
	add	w2,w0,w0
	mov	#2,w2
	rcall	_prvListTasksWithinSingleList
	add	w0,[w14],[w14]
	.loc 1 2356 0
	mov	[w14],w0
	mulw.su	w0,#20,w0
	mov	[w14+4],w1
	add	w1,w0,w0
	mov	#3,w2
	mov	#_xSuspendedTaskList,w1
	rcall	_prvListTasksWithinSingleList
	add	w0,[w14],[w14]
	.loc 1 2362 0
	mov	[w14+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L85
	.loc 1 2367 0
	rcall	_Get_CCT8
	mov	[w14+8],w2
	mov.d	w0,[w2]
.L85:
	.loc 1 2385 0
	rcall	_xTaskResumeAll
	.loc 1 2387 0
	mov	[w14],w0
	.loc 1 2388 0
	ulnk	
	return	
	.set ___PA___,0
.LFE19:
	.size	_uxTaskGetSystemState, .-_uxTaskGetSystemState
	.align	2
	.global	_xTaskIncrementTick	; export
	.type	_xTaskIncrementTick,@function
_xTaskIncrementTick:
.LFB20:
	.loc 1 2501 0
	.set ___PA___,1
	lnk	#10
.LCFI22:
	.loc 1 2505 0
	clr	w0
	mov	w0,[w14]
	.loc 1 2511 0
	mov	_uxSchedulerSuspended,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L88
.LBB4:
	.loc 1 2514 0
	mov	_xTickCount,w0
	inc	w0,w0
	mov	w0,[w14+2]
	.loc 1 2519 0
	mov	[w14+2],w1
	mov	w1,_xTickCount
	.loc 1 2521 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L89
.LBB5:
	.loc 1 2523 0
	mov	_pxDelayedTaskList,w1
	mov	w1,[w14+4]
	mov	_pxOverflowDelayedTaskList,w0
	mov	w0,_pxDelayedTaskList
	mov	[w14+4],w1
	mov	w1,_pxOverflowDelayedTaskList
	mov	_xNumOfOverflows,w0
	inc	w0,w0
	mov	w0,_xNumOfOverflows
	rcall	_prvResetNextTaskUnblockTime
.L89:
.LBE5:
	.loc 1 2534 0
	mov	_xNextTaskUnblockTime,w0
	mov	[w14+2],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L90
	bra	.L96
.L99:
	.loc 1 2609 0
	nop	
.L96:
	.loc 1 2538 0
	mov	_pxDelayedTaskList,w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L91
	.loc 1 2545 0
	setm	w0
	mov	w0,_xNextTaskUnblockTime
	.loc 1 2546 0
	bra	.L90
.L91:
	.loc 1 2554 0
	mov	_pxDelayedTaskList,w0
	mov	[w0+6],w0
	mov	[w0+6],w0
	mov	w0,[w14+6]
	.loc 1 2555 0
	mov	[w14+6],w0
	mov	[w0+2],w1
	mov	w1,[w14+8]
	.loc 1 2557 0
	mov	[w14+2],w1
	mov	[w14+8],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L92
	.loc 1 2564 0
	mov	[w14+8],w1
	mov	w1,_xNextTaskUnblockTime
	.loc 1 2565 0
	bra	.L90
.L92:
	.loc 1 2573 0
	mov	[w14+6],w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 2577 0
	mov	[w14+6],w0
	mov	[w0+20],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L93
	.loc 1 2579 0
	mov	[w14+6],w0
	add	w0,#12,w0
	rcall	_uxListRemove
.L93:
	.loc 1 2588 0
	mov	[w14+6],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L94
	mov	[w14+6],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L94:
	mov	[w14+6],w0
	inc2	w0,w1
	mov	[w14+6],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	.loc 1 2598 0
	mov	[w14+6],w0
	mov	[w0+22],w1
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L99
	.loc 1 2600 0
	mov	#1,w0
	mov	w0,[w14]
	.loc 1 2609 0
	bra	.L96
.L90:
	.loc 1 2617 0
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w0
	mov	w0,w1
	mov	#_pxReadyTasksLists,w0
	add	w1,w0,w0
	mov	[w0],w0
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	leu,.L97
	.loc 1 2619 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L97
.L88:
.LBE4:
	.loc 1 2645 0
	mov	_uxPendedTicks,w0
	inc	w0,w0
	mov	w0,_uxPendedTicks
.L97:
	.loc 1 2658 0
	mov	_xYieldPending,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L98
	.loc 1 2660 0
	mov	#1,w0
	mov	w0,[w14]
.L98:
	.loc 1 2669 0
	mov	[w14],w0
	.loc 1 2670 0
	ulnk	
	return	
	.set ___PA___,0
.LFE20:
	.size	_xTaskIncrementTick, .-_xTaskIncrementTick
	.align	2
	.global	_vTaskSwitchContext	; export
	.type	_vTaskSwitchContext,@function
_vTaskSwitchContext:
.LFB21:
	.loc 1 2766 0
	.set ___PA___,1
	lnk	#4
.LCFI23:
	.loc 1 2767 0
	mov	_uxSchedulerSuspended,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L101
	.loc 1 2771 0
	mov	#1,w0
	mov	w0,_xYieldPending
	bra	.L100
.L101:
	.loc 1 2775 0
	clr	_xYieldPending
	.loc 1 2783 0
	rcall	_Get_CCT8
	mov	w0,_ulTotalRunTime
	mov	w1,_ulTotalRunTime+2
	.loc 1 2793 0
	mov	_ulTotalRunTime,w2
	mov	_ulTotalRunTime+2,w3
	mov	_ulTaskSwitchedInTime,w0
	mov	_ulTaskSwitchedInTime+2,w1
	sub	w2,w0,[w15]
	subb	w3,w1,[w15]
	.set ___BP___,0
	bra	leu,.L103
	.loc 1 2795 0
	mov	_pxCurrentTCB,w6
	mov	[w6+44],w2
	mov	[w6+46],w3
	mov	_ulTotalRunTime,w4
	mov	_ulTotalRunTime+2,w5
	mov	_ulTaskSwitchedInTime,w0
	mov	_ulTaskSwitchedInTime+2,w1
	sub	w4,w0,w0
	subb	w5,w1,w1
	add	w0,w2,w0
	addc	w1,w3,w1
	mov	w0,[w6+44]
	mov	w1,[w6+46]
.L103:
	.loc 1 2801 0
	mov	_ulTotalRunTime,w0
	mov	_ulTotalRunTime+2,w1
	mov	w0,_ulTaskSwitchedInTime
	mov	w1,_ulTaskSwitchedInTime+2
.LBB6:
	.loc 1 2810 0
	mov	_uxTopReadyPriority,w1
	mov	w1,[w14]
	bra	.L104
.L105:
	dec	[w14],[w14]
.L104:
	mov	[w14],w0
	mulw.su	w0,#10,w0
	mov	w0,w1
	mov	#_pxReadyTasksLists,w0
	add	w1,w0,w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L105
.LBB7:
	mov	[w14],w0
	mulw.su	w0,#10,w0
	mov	w0,w1
	mov	#_pxReadyTasksLists,w0
	add	w1,w0,w0
	mov	w0,[w14+2]
	mov	[w14+2],w0
	mov	[w0+2],w0
	mov	[w0+2],w1
	mov	[w14+2],w0
	mov	w1,[w0+2]
	mov	[w14+2],w0
	mov	[w0+2],w1
	mov	[w14+2],w0
	add	w0,#4,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L106
	mov	[w14+2],w0
	mov	[w0+2],w0
	mov	[w0+2],w1
	mov	[w14+2],w0
	mov	w1,[w0+2]
.L106:
	mov	[w14+2],w0
	mov	[w0+2],w0
	mov	[w0+6],w0
	mov	w0,_pxCurrentTCB
.LBE7:
	mov	[w14],w1
	mov	w1,_uxTopReadyPriority
.L100:
.LBE6:
	.loc 1 2821 0
	ulnk	
	return	
	.set ___PA___,0
.LFE21:
	.size	_vTaskSwitchContext, .-_vTaskSwitchContext
	.align	2
	.global	_vTaskPlaceOnEventList	; export
	.type	_vTaskPlaceOnEventList,@function
_vTaskPlaceOnEventList:
.LFB22:
	.loc 1 2825 0
	.set ___PA___,1
	lnk	#4
.LCFI24:
	mov	w0,[w14]
	mov	w1,[w14+2]
	.loc 1 2835 0
	mov	_pxCurrentTCB,w0
	add	w0,#12,w0
	mov	w0,w1
	mov	[w14],w0
	rcall	_vListInsert
	.loc 1 2837 0
	mov	#1,w1
	mov	[w14+2],w0
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 2838 0
	ulnk	
	return	
	.set ___PA___,0
.LFE22:
	.size	_vTaskPlaceOnEventList, .-_vTaskPlaceOnEventList
	.align	2
	.global	_vTaskPlaceOnUnorderedEventList	; export
	.type	_vTaskPlaceOnUnorderedEventList,@function
_vTaskPlaceOnUnorderedEventList:
.LFB23:
	.loc 1 2842 0
	.set ___PA___,1
	lnk	#6
.LCFI25:
	mov	w0,[w14]
	mov	w1,[w14+2]
	mov	w2,[w14+4]
	.loc 1 2852 0
	mov	_pxCurrentTCB,w0
	mov	[w14+2],w1
	bset	w1,#15
	mov	w1,[w0+12]
	.loc 1 2859 0
	mov	_pxCurrentTCB,w0
	add	w0,#12,w0
	mov	w0,w1
	mov	[w14],w0
	rcall	_vListInsertEnd
	.loc 1 2861 0
	mov	#1,w1
	mov	[w14+4],w0
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 2862 0
	ulnk	
	return	
	.set ___PA___,0
.LFE23:
	.size	_vTaskPlaceOnUnorderedEventList, .-_vTaskPlaceOnUnorderedEventList
	.align	2
	.global	_vTaskPlaceOnEventListRestricted	; export
	.type	_vTaskPlaceOnEventListRestricted,@function
_vTaskPlaceOnEventListRestricted:
.LFB24:
	.loc 1 2868 0
	.set ___PA___,1
	lnk	#6
.LCFI26:
	mov	w0,[w14]
	mov	w1,[w14+2]
	mov	w2,[w14+4]
	.loc 1 2881 0
	mov	_pxCurrentTCB,w0
	add	w0,#12,w0
	mov	w0,w1
	mov	[w14],w0
	rcall	_vListInsertEnd
	.loc 1 2886 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L110
	.loc 1 2888 0
	setm	w0
	mov	w0,[w14+2]
.L110:
	.loc 1 2892 0
	mov	[w14+4],w1
	mov	[w14+2],w0
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 2893 0
	ulnk	
	return	
	.set ___PA___,0
.LFE24:
	.size	_vTaskPlaceOnEventListRestricted, .-_vTaskPlaceOnEventListRestricted
	.align	2
	.global	_xTaskRemoveFromEventList	; export
	.type	_xTaskRemoveFromEventList,@function
_xTaskRemoveFromEventList:
.LFB25:
	.loc 1 2899 0
	.set ___PA___,1
	lnk	#6
.LCFI27:
	mov	w0,[w14+4]
	.loc 1 2916 0
	mov	[w14+4],w0
	mov	[w0+6],w0
	mov	[w0+6],w0
	mov	w0,[w14+2]
	.loc 1 2918 0
	mov	[w14+2],w0
	add	w0,#12,w0
	rcall	_uxListRemove
	.loc 1 2920 0
	mov	_uxSchedulerSuspended,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L112
	.loc 1 2922 0
	mov	[w14+2],w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 2923 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L113
	mov	[w14+2],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L113:
	mov	[w14+2],w0
	inc2	w0,w1
	mov	[w14+2],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	bra	.L114
.L112:
	.loc 1 2929 0
	mov	[w14+2],w0
	add	w0,#12,w0
	mov	w0,w1
	mov	#_xPendingReadyList,w0
	rcall	_vListInsertEnd
.L114:
	.loc 1 2932 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L115
	.loc 1 2937 0
	mov	#1,w0
	mov	w0,[w14]
	.loc 1 2941 0
	mov	#1,w0
	mov	w0,_xYieldPending
	bra	.L116
.L115:
	.loc 1 2945 0
	clr	w0
	mov	w0,[w14]
.L116:
	.loc 1 2962 0
	mov	[w14],w0
	.loc 1 2963 0
	ulnk	
	return	
	.set ___PA___,0
.LFE25:
	.size	_xTaskRemoveFromEventList, .-_xTaskRemoveFromEventList
	.align	2
	.global	_xTaskRemoveFromUnorderedEventList	; export
	.type	_xTaskRemoveFromUnorderedEventList,@function
_xTaskRemoveFromUnorderedEventList:
.LFB26:
	.loc 1 2967 0
	.set ___PA___,1
	lnk	#8
.LCFI28:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	.loc 1 2976 0
	mov	[w14+6],w0
	mov	w0,w1
	bset	w1,#15
	mov	[w14+4],w0
	mov	w1,[w0]
	.loc 1 2980 0
	mov	[w14+4],w0
	mov	[w0+6],w0
	mov	w0,[w14+2]
	.loc 1 2982 0
	mov	[w14+4],w0
	rcall	_uxListRemove
	.loc 1 2987 0
	mov	[w14+2],w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 2988 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L118
	mov	[w14+2],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L118:
	mov	[w14+2],w0
	inc2	w0,w1
	mov	[w14+2],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	.loc 1 2990 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L119
	.loc 1 2996 0
	mov	#1,w0
	mov	w0,[w14]
	.loc 1 3000 0
	mov	#1,w0
	mov	w0,_xYieldPending
	bra	.L120
.L119:
	.loc 1 3004 0
	clr	w0
	mov	w0,[w14]
.L120:
	.loc 1 3007 0
	mov	[w14],w0
	.loc 1 3008 0
	ulnk	
	return	
	.set ___PA___,0
.LFE26:
	.size	_xTaskRemoveFromUnorderedEventList, .-_xTaskRemoveFromUnorderedEventList
	.align	2
	.global	_vTaskSetTimeOutState	; export
	.type	_vTaskSetTimeOutState,@function
_vTaskSetTimeOutState:
.LFB27:
	.loc 1 3012 0
	.set ___PA___,1
	lnk	#2
.LCFI29:
	mov	w0,[w14]
	.loc 1 3014 0
	mov	_xNumOfOverflows,w1
	mov	[w14],w0
	mov	w1,[w0]
	.loc 1 3015 0
	mov	_xTickCount,w1
	mov	[w14],w0
	mov	w1,[w0+2]
	.loc 1 3016 0
	ulnk	
	return	
	.set ___PA___,0
.LFE27:
	.size	_vTaskSetTimeOutState, .-_vTaskSetTimeOutState
	.align	2
	.global	_xTaskCheckForTimeOut	; export
	.type	_xTaskCheckForTimeOut,@function
_xTaskCheckForTimeOut:
.LFB28:
	.loc 1 3020 0
	.set ___PA___,1
	lnk	#8
.LCFI30:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	.loc 1 3026 0
	rcall	_vPortEnterCritical
.LBB8:
	.loc 1 3029 0
	mov	_xTickCount,w1
	mov	w1,[w14+2]
	.loc 1 3043 0
	mov	[w14+6],w0
	mov	[w0],w0
	add	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L123
	.loc 1 3048 0
	clr	w0
	mov	w0,[w14]
	bra	.L124
.L123:
	.loc 1 3053 0
	mov	[w14+4],w0
	mov	[w0],w1
	mov	_xNumOfOverflows,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L125
	mov	[w14+4],w0
	mov	[w0+2],w1
	mov	[w14+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	gtu,.L125
	.loc 1 3060 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L124
.L125:
	.loc 1 3062 0
	mov	[w14+4],w0
	mov	[w0+2],w0
	mov	[w14+2],w1
	sub	w1,w0,w1
	mov	[w14+6],w0
	mov	[w0],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L126
	.loc 1 3065 0
	mov	[w14+6],w0
	mov	[w0],w1
	mov	[w14+4],w0
	mov	[w0+2],w2
	mov	[w14+2],w0
	sub	w2,w0,w0
	add	w1,w0,w1
	mov	[w14+6],w0
	mov	w1,[w0]
	.loc 1 3066 0
	mov	[w14+4],w0
	rcall	_vTaskSetTimeOutState
	.loc 1 3067 0
	clr	w0
	mov	w0,[w14]
	bra	.L124
.L126:
	.loc 1 3071 0
	mov	#1,w0
	mov	w0,[w14]
.L124:
.LBE8:
	.loc 1 3074 0
	rcall	_vPortExitCritical
	.loc 1 3076 0
	mov	[w14],w0
	.loc 1 3077 0
	ulnk	
	return	
	.set ___PA___,0
.LFE28:
	.size	_xTaskCheckForTimeOut, .-_xTaskCheckForTimeOut
	.align	2
	.global	_vTaskMissedYield	; export
	.type	_vTaskMissedYield,@function
_vTaskMissedYield:
.LFB29:
	.loc 1 3081 0
	.set ___PA___,1
	lnk	#0
.LCFI31:
	.loc 1 3082 0
	mov	#1,w0
	mov	w0,_xYieldPending
	.loc 1 3083 0
	ulnk	
	return	
	.set ___PA___,0
.LFE29:
	.size	_vTaskMissedYield, .-_vTaskMissedYield
	.align	2
	.global	_uxTaskGetTaskNumber	; export
	.type	_uxTaskGetTaskNumber,@function
_uxTaskGetTaskNumber:
.LFB30:
	.loc 1 3089 0
	.set ___PA___,1
	lnk	#6
.LCFI32:
	mov	w0,[w14+4]
	.loc 1 3093 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L129
	.loc 1 3095 0
	mov	[w14+4],w1
	mov	w1,[w14+2]
	.loc 1 3096 0
	mov	[w14+2],w0
	mov	[w0+38],w1
	mov	w1,[w14]
	bra	.L130
.L129:
	.loc 1 3100 0
	clr	w0
	mov	w0,[w14]
.L130:
	.loc 1 3103 0
	mov	[w14],w0
	.loc 1 3104 0
	ulnk	
	return	
	.set ___PA___,0
.LFE30:
	.size	_uxTaskGetTaskNumber, .-_uxTaskGetTaskNumber
	.align	2
	.global	_vTaskSetTaskNumber	; export
	.type	_vTaskSetTaskNumber,@function
_vTaskSetTaskNumber:
.LFB31:
	.loc 1 3112 0
	.set ___PA___,1
	lnk	#6
.LCFI33:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	.loc 1 3115 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L131
	.loc 1 3117 0
	mov	[w14+2],w1
	mov	w1,[w14]
	.loc 1 3118 0
	mov	[w14],w0
	mov	[w14+4],w1
	mov	w1,[w0+38]
.L131:
	.loc 1 3120 0
	ulnk	
	return	
	.set ___PA___,0
.LFE31:
	.size	_vTaskSetTaskNumber, .-_vTaskSetTaskNumber
	.align	2
	.type	_prvIdleTask,@function
_prvIdleTask:
.LFB32:
	.loc 1 3136 0
	.set ___PA___,0
	lnk	#2
.LCFI34:
	mov	w0,[w14]
.L135:
	.loc 1 3147 0
	rcall	_prvCheckTasksWaitingTermination
	.loc 1 3170 0
	mov	_pxReadyTasksLists,w0
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	leu,.L134
	.loc 1 3172 0
; 3172 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L134:
.LBB9:
	.loc 1 3190 0
	rcall	_vApplicationIdleHook
.LBE9:
	.loc 1 3238 0
	bra	.L135
.LFE32:
	.size	_prvIdleTask, .-_prvIdleTask
	.align	2
	.type	_prvInitialiseTaskLists,@function
_prvInitialiseTaskLists:
.LFB33:
	.loc 1 3338 0
	.set ___PA___,1
	lnk	#2
.LCFI35:
	.loc 1 3341 0
	clr	w0
	mov	w0,[w14]
	bra	.L137
.L138:
	.loc 1 3343 0
	mov	[w14],w0
	mulw.su	w0,#10,w0
	mov	w0,w1
	mov	#_pxReadyTasksLists,w0
	add	w1,w0,w0
	rcall	_vListInitialise
	.loc 1 3341 0
	inc	[w14],[w14]
.L137:
	mov	[w14],w0
	sub	w0,#9,[w15]
	.set ___BP___,0
	bra	leu,.L138
	.loc 1 3346 0
	mov	#_xDelayedTaskList1,w0
	rcall	_vListInitialise
	.loc 1 3347 0
	mov	#_xDelayedTaskList2,w0
	rcall	_vListInitialise
	.loc 1 3348 0
	mov	#_xPendingReadyList,w0
	rcall	_vListInitialise
	.loc 1 3358 0
	mov	#_xSuspendedTaskList,w0
	rcall	_vListInitialise
	.loc 1 3364 0
	mov	#_xDelayedTaskList1,w0
	mov	w0,_pxDelayedTaskList
	.loc 1 3365 0
	mov	#_xDelayedTaskList2,w0
	mov	w0,_pxOverflowDelayedTaskList
	.loc 1 3366 0
	ulnk	
	return	
	.set ___PA___,0
.LFE33:
	.size	_prvInitialiseTaskLists, .-_prvInitialiseTaskLists
	.align	2
	.type	_prvCheckTasksWaitingTermination,@function
_prvCheckTasksWaitingTermination:
.LFB34:
	.loc 1 3370 0
	.set ___PA___,1
	lnk	#0
.LCFI36:
	.loc 1 3410 0
	ulnk	
	return	
	.set ___PA___,0
.LFE34:
	.size	_prvCheckTasksWaitingTermination, .-_prvCheckTasksWaitingTermination
	.align	2
	.global	_vTaskGetInfo	; export
	.type	_vTaskGetInfo,@function
_vTaskGetInfo:
.LFB35:
	.loc 1 3416 0
	.set ___PA___,1
	lnk	#10
.LCFI37:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	mov	w2,[w14+6]
	mov	w3,[w14+8]
	.loc 1 3420 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L141
	mov	_pxCurrentTCB,w0
	bra	.L142
.L141:
	mov	[w14+2],w0
.L142:
	mov	w0,[w14]
	.loc 1 3422 0
	mov	[w14+4],w0
	mov	[w14],[w0]
	.loc 1 3423 0
	mov	[w14],w2
	add	w2,#26,w1
	mov	[w14+4],w0
	mov	w1,[w0+2]
	.loc 1 3424 0
	mov	[w14],w0
	mov	[w0+22],w1
	mov	[w14+4],w0
	mov	w1,[w0+8]
	.loc 1 3425 0
	mov	[w14],w0
	mov	[w0+24],w1
	mov	[w14+4],w0
	mov	w1,[w0+16]
	.loc 1 3426 0
	mov	[w14],w0
	mov	[w0+36],w1
	mov	[w14+4],w0
	mov	w1,[w0+4]
	.loc 1 3433 0
	mov	[w14+4],w0
	mov	[w0+6],w0
	sub	w0,#3,[w15]
	.set ___BP___,0
	bra	nz,.L143
	.loc 1 3435 0
	rcall	_vTaskSuspendAll
	.loc 1 3437 0
	mov	[w14],w0
	mov	[w0+20],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L144
	.loc 1 3439 0
	mov	[w14+4],w0
	mov	#2,w1
	mov	w1,[w0+6]
.L144:
	.loc 1 3442 0
	rcall	_xTaskResumeAll
.L143:
	.loc 1 3449 0
	mov	[w14],w0
	mov	[w0+40],w1
	mov	[w14+4],w0
	mov	w1,[w0+10]
	.loc 1 3459 0
	mov	[w14],w0
	mov	[w0+46],w1
	mov	[w0+44],w0
	mov	[w14+4],w2
	mov	w0,[w2+12]
	mov	w1,[w2+14]
	.loc 1 3470 0
	mov	[w14+8],w0
	sub	w0,#5,[w15]
	.set ___BP___,0
	bra	z,.L145
	.loc 1 3472 0
	mov	[w14+4],w0
	mov	[w14+8],w1
	mov	w1,[w0+6]
	bra	.L146
.L145:
	.loc 1 3476 0
	mov	[w14+2],w0
	rcall	_eTaskGetState
	mov	[w14+4],w1
	mov	w0,[w1+6]
.L146:
	.loc 1 3481 0
	mov	[w14+6],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L147
	.loc 1 3485 0
	mov	[w14],w0
	mov	[w0+34],w0
	rcall	_prvTaskCheckFreeStackSpace
	mov	[w14+4],w1
	mov	w0,[w1+18]
	bra	.L140
.L147:
	.loc 1 3495 0
	mov	[w14+4],w0
	clr	w1
	mov	w1,[w0+18]
.L140:
	.loc 1 3497 0
	ulnk	
	return	
	.set ___PA___,0
.LFE35:
	.size	_vTaskGetInfo, .-_vTaskGetInfo
	.align	2
	.type	_prvListTasksWithinSingleList,@function
_prvListTasksWithinSingleList:
.LFB36:
	.loc 1 3505 0
	.set ___PA___,1
	lnk	#16
.LCFI38:
	mov	w0,[w14+10]
	mov	w1,[w14+12]
	mov	w2,[w14+14]
	.loc 1 3507 0
	clr	w0
	mov	w0,[w14]
	.loc 1 3509 0
	mov	[w14+12],w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L150
.LBB10:
	.loc 1 3511 0
	mov	[w14+12],w1
	mov	w1,[w14+2]
	mov	[w14+2],w0
	mov	[w0+2],w0
	mov	[w0+2],w1
	mov	[w14+2],w0
	mov	w1,[w0+2]
	mov	[w14+2],w0
	mov	[w0+2],w1
	mov	[w14+2],w0
	add	w0,#4,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L151
	mov	[w14+2],w0
	mov	[w0+2],w0
	mov	[w0+2],w1
	mov	[w14+2],w0
	mov	w1,[w0+2]
.L151:
	mov	[w14+2],w0
	mov	[w0+2],w0
	mov	[w0+6],w0
	mov	w0,[w14+4]
.L153:
.LBE10:
.LBB11:
	.loc 1 3519 0
	mov	[w14+12],w1
	mov	w1,[w14+6]
	mov	[w14+6],w0
	mov	[w0+2],w0
	mov	[w0+2],w1
	mov	[w14+6],w0
	mov	w1,[w0+2]
	mov	[w14+6],w0
	mov	[w0+2],w1
	mov	[w14+6],w0
	add	w0,#4,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L152
	mov	[w14+6],w0
	mov	[w0+2],w0
	mov	[w0+2],w1
	mov	[w14+6],w0
	mov	w1,[w0+2]
.L152:
	mov	[w14+6],w0
	mov	[w0+2],w0
	mov	[w0+6],w0
	mov	w0,[w14+8]
.LBE11:
	.loc 1 3520 0
	mov	[w14],w0
	mulw.su	w0,#20,w0
	mov	[w14+10],w1
	add	w1,w0,w0
	mov	[w14+14],w3
	mov	#1,w2
	mov	w0,w1
	mov	[w14+8],w0
	rcall	_vTaskGetInfo
	.loc 1 3521 0
	inc	[w14],[w14]
	.loc 1 3522 0
	mov	[w14+8],w1
	mov	[w14+4],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L153
.L150:
	.loc 1 3529 0
	mov	[w14],w0
	.loc 1 3530 0
	ulnk	
	return	
	.set ___PA___,0
.LFE36:
	.size	_prvListTasksWithinSingleList, .-_prvListTasksWithinSingleList
	.align	2
	.type	_prvTaskCheckFreeStackSpace,@function
_prvTaskCheckFreeStackSpace:
.LFB37:
	.loc 1 3538 0
	.set ___PA___,1
	lnk	#6
.LCFI39:
	mov	w0,[w14+4]
	.loc 1 3539 0
	mul.uu	w0,#0,w0
	mov.d	w0,[w14]
	.loc 1 3541 0
	bra	.L155
.L156:
	.loc 1 3543 0
	mov	[w14+4],w0
	dec	w0,w0
	mov	w0,[w14+4]
	.loc 1 3544 0
	mov	#1,w2
	mov	#0,w3
	add	w2,[w14],[w14]
	addc	w3,[++w14],[w14--]
.L155:
	.loc 1 3541 0
	mov	[w14+4],w0
	mov.b	[w0],w1
	mov.b	#-91,w0
	sub.b	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L156
	.loc 1 3547 0
	mov.d	[w14],w0
	
	lsr w1,w1
	rrc	w0,w0
	mov.d	w0,[w14]
	.loc 1 3549 0
	mov	[w14],w0
	.loc 1 3550 0
	ulnk	
	return	
	.set ___PA___,0
.LFE37:
	.size	_prvTaskCheckFreeStackSpace, .-_prvTaskCheckFreeStackSpace
	.align	2
	.type	_prvResetNextTaskUnblockTime,@function
_prvResetNextTaskUnblockTime:
.LFB38:
	.loc 1 3640 0
	.set ___PA___,1
	lnk	#2
.LCFI40:
	.loc 1 3643 0
	mov	_pxDelayedTaskList,w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L158
	.loc 1 3649 0
	setm	w0
	mov	w0,_xNextTaskUnblockTime
	bra	.L157
.L158:
	.loc 1 3657 0
	mov	_pxDelayedTaskList,w0
	mov	[w0+6],w0
	mov	[w0+6],w0
	mov	w0,[w14]
	.loc 1 3658 0
	mov	[w14],w0
	mov	[w0+2],w0
	mov	w0,_xNextTaskUnblockTime
.L157:
	.loc 1 3660 0
	ulnk	
	return	
	.set ___PA___,0
.LFE38:
	.size	_prvResetNextTaskUnblockTime, .-_prvResetNextTaskUnblockTime
	.align	2
	.global	_xTaskGetCurrentTaskHandle	; export
	.type	_xTaskGetCurrentTaskHandle,@function
_xTaskGetCurrentTaskHandle:
.LFB39:
	.loc 1 3666 0
	.set ___PA___,1
	lnk	#2
.LCFI41:
	.loc 1 3672 0
	mov	_pxCurrentTCB,w1
	mov	w1,[w14]
	.loc 1 3674 0
	mov	[w14],w0
	.loc 1 3675 0
	ulnk	
	return	
	.set ___PA___,0
.LFE39:
	.size	_xTaskGetCurrentTaskHandle, .-_xTaskGetCurrentTaskHandle
	.align	2
	.global	_xTaskGetSchedulerState	; export
	.type	_xTaskGetSchedulerState,@function
_xTaskGetSchedulerState:
.LFB40:
	.loc 1 3683 0
	.set ___PA___,1
	lnk	#2
.LCFI42:
	.loc 1 3686 0
	mov	_xSchedulerRunning,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L162
	.loc 1 3688 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L163
.L162:
	.loc 1 3692 0
	mov	_uxSchedulerSuspended,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L164
	.loc 1 3694 0
	mov	#2,w0
	mov	w0,[w14]
	bra	.L163
.L164:
	.loc 1 3698 0
	clr	w0
	mov	w0,[w14]
.L163:
	.loc 1 3702 0
	mov	[w14],w0
	.loc 1 3703 0
	ulnk	
	return	
	.set ___PA___,0
.LFE40:
	.size	_xTaskGetSchedulerState, .-_xTaskGetSchedulerState
	.align	2
	.global	_vTaskPriorityInherit	; export
	.type	_vTaskPriorityInherit,@function
_vTaskPriorityInherit:
.LFB41:
	.loc 1 3711 0
	.set ___PA___,1
	lnk	#4
.LCFI43:
	mov	w0,[w14+2]
	.loc 1 3712 0
	mov	[w14+2],w1
	mov	w1,[w14]
	.loc 1 3716 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L165
	.loc 1 3721 0
	mov	[w14],w0
	mov	[w0+22],w1
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L165
	.loc 1 3726 0
	mov	[w14],w0
	mov	[w0+12],w0
	cp0	w0
	.set ___BP___,0
	bra	lt,.L167
	.loc 1 3728 0
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	subr	w0,#10,w1
	mov	[w14],w0
	mov	w1,[w0+12]
.L167:
	.loc 1 3737 0
	mov	[w14],w0
	mov	[w0+10],w1
	mov	[w14],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L168
	.loc 1 3739 0
	inc2	[w14],w0
	rcall	_uxListRemove
	.loc 1 3749 0
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w1
	mov	[w14],w0
	mov	w1,[w0+22]
	.loc 1 3750 0
	mov	[w14],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L169
	mov	[w14],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L169:
	inc2	[w14],w1
	mov	[w14],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	bra	.L165
.L168:
	.loc 1 3755 0
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w1
	mov	[w14],w0
	mov	w1,[w0+22]
.L165:
	.loc 1 3769 0
	ulnk	
	return	
	.set ___PA___,0
.LFE41:
	.size	_vTaskPriorityInherit, .-_vTaskPriorityInherit
	.align	2
	.global	_xTaskPriorityDisinherit	; export
	.type	_xTaskPriorityDisinherit,@function
_xTaskPriorityDisinherit:
.LFB42:
	.loc 1 3777 0
	.set ___PA___,1
	lnk	#6
.LCFI44:
	mov	w0,[w14+4]
	.loc 1 3778 0
	mov	[w14+4],w1
	mov	w1,[w14+2]
	.loc 1 3779 0
	clr	w0
	mov	w0,[w14]
	.loc 1 3781 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L171
	.loc 1 3790 0
	mov	[w14+2],w0
	mov	[w0+42],w0
	dec	w0,w1
	mov	[w14+2],w0
	mov	w1,[w0+42]
	.loc 1 3794 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	[w14+2],w0
	mov	[w0+40],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L171
	.loc 1 3797 0
	mov	[w14+2],w0
	mov	[w0+42],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L171
	.loc 1 3804 0
	mov	[w14+2],w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 3816 0
	mov	[w14+2],w0
	mov	[w0+40],w1
	mov	[w14+2],w0
	mov	w1,[w0+22]
	.loc 1 3821 0
	mov	[w14+2],w0
	mov	[w0+22],w0
	subr	w0,#10,w1
	mov	[w14+2],w0
	mov	w1,[w0+12]
	.loc 1 3822 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L172
	mov	[w14+2],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L172:
	mov	[w14+2],w0
	inc2	w0,w1
	mov	[w14+2],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	.loc 1 3832 0
	mov	#1,w0
	mov	w0,[w14]
.L171:
	.loc 1 3849 0
	mov	[w14],w0
	.loc 1 3850 0
	ulnk	
	return	
	.set ___PA___,0
.LFE42:
	.size	_xTaskPriorityDisinherit, .-_xTaskPriorityDisinherit
	.align	2
	.type	_prvWriteNameToBuffer,@function
_prvWriteNameToBuffer:
.LFB43:
	.loc 1 3921 0
	.set ___PA___,1
	lnk	#6
.LCFI45:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	.loc 1 3925 0
	mov	[w14+4],w1
	mov	[w14+2],w0
	rcall	_strcpy
	.loc 1 3929 0
	mov	[w14+2],w0
	rcall	_strlen
	mov	w0,[w14]
	bra	.L174
.L175:
	.loc 1 3931 0
	mov	[w14+2],w0
	add	w0,[w14],w0
	mov.b	#32,w1
	mov.b	w1,[w0]
	.loc 1 3929 0
	inc	[w14],[w14]
.L174:
	mov	[w14],w0
	sub	w0,#6,[w15]
	.set ___BP___,0
	bra	leu,.L175
	.loc 1 3935 0
	mov	[w14+2],w0
	add	w0,[w14],w0
	clr.b	w1
	mov.b	w1,[w0]
	.loc 1 3938 0
	mov	[w14+2],w0
	add	w0,[w14],w0
	.loc 1 3939 0
	ulnk	
	return	
	.set ___PA___,0
.LFE43:
	.size	_prvWriteNameToBuffer, .-_prvWriteNameToBuffer
	.section .const,psv,page
.LC1:
	.asciz	"\011%c\011%u\011%u\011%u\015\012"
	.section	.text,code
	.align	2
	.global	_vTaskList	; export
	.type	_vTaskList,@function
_vTaskList:
.LFB44:
	.loc 1 3947 0
	.set ___PA___,1
	lnk	#10
.LCFI46:
	mov	w0,[w14+8]
	.loc 1 3978 0
	mov	[w14+8],w0
	clr.b	w1
	mov.b	w1,[w0]
	.loc 1 3982 0
	mov	_uxCurrentNumberOfTasks,w0
	mov	w0,[w14+4]
	.loc 1 3987 0
	mov	_uxCurrentNumberOfTasks,w0
	mulw.su	w0,#20,w0
	rcall	_pvPortMalloc
	mov	w0,[w14+2]
	.loc 1 3989 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L176
	.loc 1 3992 0
	mov	[w14+4],w0
	clr	w2
	mov	w0,w1
	mov	[w14+2],w0
	rcall	_uxTaskGetSystemState
	mov	w0,[w14+4]
	.loc 1 3995 0
	clr	w0
	mov	w0,[w14+6]
	bra	.L178
.L186:
	.loc 1 3997 0
	mov	[w14+6],w0
	mulw.su	w0,#20,w0
	mov	[w14+2],w1
	add	w1,w0,w0
	mov	[w0+6],w0
	sub	w0,#2,[w15]
	.set ___BP___,0
	bra	z,.L181
	sub	w0,#2,[w15]
	.set ___BP___,0
	bra	gtu,.L184
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	z,.L180
	bra	.L179
.L184:
	sub	w0,#3,[w15]
	.set ___BP___,0
	bra	z,.L182
	sub	w0,#4,[w15]
	.set ___BP___,0
	bra	z,.L183
	bra	.L179
.L180:
	.loc 1 3999 0
	mov.b	#82,w0
	mov.b	w0,[w14]
	.loc 1 4000 0
	bra	.L185
.L181:
	.loc 1 4002 0
	mov.b	#66,w0
	mov.b	w0,[w14]
	.loc 1 4003 0
	bra	.L185
.L182:
	.loc 1 4005 0
	mov.b	#83,w0
	mov.b	w0,[w14]
	.loc 1 4006 0
	bra	.L185
.L183:
	.loc 1 4008 0
	mov.b	#68,w0
	mov.b	w0,[w14]
	.loc 1 4009 0
	bra	.L185
.L179:
	.loc 1 4013 0
	clr.b	w0
	mov.b	w0,[w14]
	.loc 1 4014 0
	nop	
.L185:
	.loc 1 4019 0
	mov	[w14+6],w0
	mulw.su	w0,#20,w0
	mov	[w14+2],w1
	add	w1,w0,w0
	mov	[w0+2],w0
	mov	w0,w1
	mov	[w14+8],w0
	rcall	_prvWriteNameToBuffer
	mov	w0,[w14+8]
	.loc 1 4022 0
	mov	[w14+6],w0
	mulw.su	w0,#20,w0
	mov	[w14+2],w1
	add	w1,w0,w0
	mov	[w0+4],w3
	mov	[w14+6],w0
	mulw.su	w0,#20,w0
	mov	[w14+2],w1
	add	w1,w0,w0
	mov	[w0+18],w2
	mov	[w14+6],w0
	mulw.su	w0,#20,w0
	mov	[w14+2],w1
	add	w1,w0,w0
	mov	[w0+8],w1
	se	[w14],w0
	mov	w3,[w15++]
	mov	w2,[w15++]
	mov	w1,[w15++]
	mov	w0,[w15++]
	mov	#.LC1,w0
	mov	w0,[w15++]
	mov	[w14+8],w0
.LCFI47:
	rcall	__sprintf_cdnopuxX
	sub	w15,#10,w15
	.loc 1 4023 0
	mov	[w14+8],w0
.LCFI48:
	rcall	_strlen
	mov	[w14+8],w1
	add	w1,w0,w0
	mov	w0,[w14+8]
	.loc 1 3995 0
	mov	[w14+6],w0
	inc	w0,w0
	mov	w0,[w14+6]
.L178:
	mov	[w14+6],w1
	mov	[w14+4],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L186
	.loc 1 4028 0
	mov	[w14+2],w0
	rcall	_vPortFree
.L176:
	.loc 1 4034 0
	ulnk	
	return	
	.set ___PA___,0
.LFE44:
	.size	_vTaskList, .-_vTaskList
	.section .const,psv,page
.LC2:
	.asciz	"\011%u\011\011%u%%\015\012"
.LC3:
	.asciz	"\011%u\011\011<1%%\015\012"
	.section	.text,code
	.align	2
	.global	_vTaskGetRunTimeStats	; export
	.type	_vTaskGetRunTimeStats,@function
_vTaskGetRunTimeStats:
.LFB45:
	.loc 1 4042 0
	.set ___PA___,1
	lnk	#16
.LCFI49:
	mov	w0,[w14+14]
	.loc 1 4079 0
	mov	[w14+14],w0
	clr.b	w1
	mov.b	w1,[w0]
	.loc 1 4083 0
	mov	_uxCurrentNumberOfTasks,w0
	mov	w0,[w14+6]
	.loc 1 4088 0
	mov	_uxCurrentNumberOfTasks,w0
	mulw.su	w0,#20,w0
	rcall	_pvPortMalloc
	mov	w0,[w14]
	.loc 1 4090 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L187
	.loc 1 4093 0
	mov	[w14+6],w0
	add	w14,#10,w1
	mov	w1,w2
	mov	w0,w1
	mov	[w14],w0
	rcall	_uxTaskGetSystemState
	mov	w0,[w14+6]
	.loc 1 4096 0
	mov	[w14+10],w0
	mov	[w14+12],w1
	mov	#100,w2
	mov	#0,w3
	rcall	___udivsi3
	mov	w0,[w14+10]
	mov	w1,[w14+12]
	.loc 1 4099 0
	mov	[w14+10],w0
	mov	[w14+12],w1
	sub	w0,#0,[w15]
	subb	w1,#0,[w15]
	.set ___BP___,0
	bra	z,.L189
	.loc 1 4102 0
	clr	w0
	mov	w0,[w14+8]
	bra	.L190
.L193:
	.loc 1 4107 0
	mov	[w14+8],w0
	mulw.su	w0,#20,w0
	add	w0,[w14],w0
	mov	[w0+12],w4
	mov	[w0+14],w5
	mov	[w14+10],w0
	mov	[w14+12],w1
	mov.d	w0,w2
	mov.d	w4,w0
	rcall	___udivsi3
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	.loc 1 4112 0
	mov	[w14+8],w0
	mulw.su	w0,#20,w0
	add	w0,[w14],w0
	mov	[w0+2],w0
	mov	w0,w1
	mov	[w14+14],w0
	rcall	_prvWriteNameToBuffer
	mov	w0,[w14+14]
	.loc 1 4114 0
	mov	[w14+2],w0
	mov	[w14+4],w1
	sub	w0,#0,[w15]
	subb	w1,#0,[w15]
	.set ___BP___,0
	bra	z,.L191
	.loc 1 4124 0
	mov	[w14+2],w2
	mov	[w14+8],w0
	mulw.su	w0,#20,w0
	add	w0,[w14],w0
	mov	[w0+14],w1
	mov	[w0+12],w0
	mov	w0,w0
	mov	w2,[w15++]
	mov	w0,[w15++]
	mov	#.LC2,w0
	mov	w0,[w15++]
	mov	[w14+14],w0
.LCFI50:
	rcall	__sprintf_cdnopuxX
	sub	w15,#6,w15
	bra	.L192
.L191:
	.loc 1 4140 0
	mov	[w14+8],w0
	mulw.su	w0,#20,w0
	add	w0,[w14],w0
	mov	[w0+14],w1
	mov	[w0+12],w0
	mov	w0,w0
	mov	w0,[w15++]
	mov	#.LC3,w0
	mov	w0,[w15++]
	mov	[w14+14],w0
.LCFI51:
	rcall	__sprintf_cdnopuxX
	sub	w15,#4,w15
.L192:
	.loc 1 4145 0
	mov	[w14+14],w0
.LCFI52:
	rcall	_strlen
	mov	[w14+14],w1
	add	w1,w0,w0
	mov	w0,[w14+14]
	.loc 1 4102 0
	mov	[w14+8],w0
	inc	w0,w0
	mov	w0,[w14+8]
.L190:
	mov	[w14+8],w1
	mov	[w14+6],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L193
.L189:
	.loc 1 4155 0
	mov	[w14],w0
	rcall	_vPortFree
.L187:
	.loc 1 4161 0
	ulnk	
	return	
	.set ___PA___,0
.LFE45:
	.size	_vTaskGetRunTimeStats, .-_vTaskGetRunTimeStats
	.align	2
	.global	_uxTaskResetEventItemValue	; export
	.type	_uxTaskResetEventItemValue,@function
_uxTaskResetEventItemValue:
.LFB46:
	.loc 1 4167 0
	.set ___PA___,1
	lnk	#2
.LCFI53:
	.loc 1 4170 0
	mov	_pxCurrentTCB,w0
	mov	[w0+12],w1
	mov	w1,[w14]
	.loc 1 4174 0
	mov	_pxCurrentTCB,w0
	mov	_pxCurrentTCB,w1
	mov	[w1+22],w1
	subr	w1,#10,w1
	mov	w1,[w0+12]
	.loc 1 4176 0
	mov	[w14],w0
	.loc 1 4177 0
	ulnk	
	return	
	.set ___PA___,0
.LFE46:
	.size	_uxTaskResetEventItemValue, .-_uxTaskResetEventItemValue
	.align	2
	.global	_pvTaskIncrementMutexHeldCount	; export
	.type	_pvTaskIncrementMutexHeldCount,@function
_pvTaskIncrementMutexHeldCount:
.LFB47:
	.loc 1 4183 0
	.set ___PA___,1
	lnk	#0
.LCFI54:
	.loc 1 4186 0
	mov	_pxCurrentTCB,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L196
	.loc 1 4188 0
	mov	_pxCurrentTCB,w0
	mov	[w0+42],w1
	inc	w1,w1
	mov	w1,[w0+42]
.L196:
	.loc 1 4191 0
	mov	_pxCurrentTCB,w0
	.loc 1 4192 0
	ulnk	
	return	
	.set ___PA___,0
.LFE47:
	.size	_pvTaskIncrementMutexHeldCount, .-_pvTaskIncrementMutexHeldCount
	.align	2
	.global	_ulTaskNotifyTake	; export
	.type	_ulTaskNotifyTake,@function
_ulTaskNotifyTake:
.LFB48:
	.loc 1 4200 0
	.set ___PA___,0
	lnk	#8
.LCFI55:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	.loc 1 4203 0
	rcall	_vPortEnterCritical
	.loc 1 4206 0
	mov	_pxCurrentTCB,w0
	mov	[w0+50],w1
	mov	[w0+48],w0
	sub	w0,#0,[w15]
	subb	w1,#0,[w15]
	.set ___BP___,0
	bra	nz,.L198
	.loc 1 4209 0
	mov	_pxCurrentTCB,w0
	mov.b	#1,w1
	mov.b	w1,[w0+52]
	.loc 1 4211 0
	mov	[w14+6],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L198
	.loc 1 4213 0
	mov	#1,w1
	mov	[w14+6],w0
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 4220 0
; 4220 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L198:
	.loc 1 4232 0
	rcall	_vPortExitCritical
	.loc 1 4234 0
	rcall	_vPortEnterCritical
	.loc 1 4237 0
	mov	_pxCurrentTCB,w0
	mov	[w0+48],w2
	mov	[w0+50],w3
	mov.d	w2,[w14]
	.loc 1 4239 0
	mov.d	[w14],w0
	sub	w0,#0,[w15]
	subb	w1,#0,[w15]
	.set ___BP___,0
	bra	z,.L199
	.loc 1 4241 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L200
	.loc 1 4243 0
	mov	_pxCurrentTCB,w2
	mul.uu	w0,#0,w0
	mov	w0,[w2+48]
	mov	w1,[w2+50]
	bra	.L199
.L200:
	.loc 1 4247 0
	mov	_pxCurrentTCB,w2
	setm	w4
	setm	w5
	add	w4,[w14++],w0
	addc	w5,[w14--],w1
	mov	w0,[w2+48]
	mov	w1,[w2+50]
.L199:
	.loc 1 4255 0
	mov	_pxCurrentTCB,w0
	clr.b	w1
	mov.b	w1,[w0+52]
	.loc 1 4257 0
	rcall	_vPortExitCritical
	.loc 1 4259 0
	mov.d	[w14],w0
	.loc 1 4260 0
	ulnk	
	return	
	.set ___PA___,0
.LFE48:
	.size	_ulTaskNotifyTake, .-_ulTaskNotifyTake
	.align	2
	.global	_xTaskNotifyWait	; export
	.type	_xTaskNotifyWait,@function
_xTaskNotifyWait:
.LFB49:
	.loc 1 4268 0
	.set ___PA___,0
	lnk	#14
.LCFI56:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	mov	w2,[w14+6]
	mov	w3,[w14+8]
	mov	w4,[w14+10]
	mov	w5,[w14+12]
	.loc 1 4271 0
	rcall	_vPortEnterCritical
	.loc 1 4274 0
	mov	_pxCurrentTCB,w0
	mov.b	[w0+52],w0
	sub.b	w0,#2,[w15]
	.set ___BP___,0
	bra	z,.L202
	.loc 1 4279 0
	mov	_pxCurrentTCB,w4
	mov	[w4+48],w2
	mov	[w4+50],w3
	mov	[w14+2],w0
	mov	[w14+4],w1
	com	w0,w0
	com	w1,w1
	mov	w2,w5
	mov	w3,w2
	mov	w0,w3
	mov	w1,w0
	and	w5,w3,w5
	and	w2,w0,w0
	clr	w1
	sl	w0,#0,w1
	mov	#0,w0
	mov.d	w0,w2
	mul.uu	w5,#1,w0
	ior	w2,w0,w2
	ior	w3,w1,w3
	mov	w2,[w4+48]
	mov	w3,[w4+50]
	.loc 1 4282 0
	mov	_pxCurrentTCB,w0
	mov.b	#1,w1
	mov.b	w1,[w0+52]
	.loc 1 4284 0
	mov	[w14+12],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L202
	.loc 1 4286 0
	mov	#1,w1
	mov	[w14+12],w0
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 4293 0
; 4293 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L202:
	.loc 1 4305 0
	rcall	_vPortExitCritical
	.loc 1 4307 0
	rcall	_vPortEnterCritical
	.loc 1 4311 0
	mov	[w14+10],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L203
	.loc 1 4315 0
	mov	_pxCurrentTCB,w0
	mov	[w0+50],w1
	mov	[w0+48],w0
	mov	[w14+10],w2
	mov.d	w0,[w2]
.L203:
	.loc 1 4322 0
	mov	_pxCurrentTCB,w0
	mov.b	[w0+52],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L204
	.loc 1 4325 0
	clr	w0
	mov	w0,[w14]
	bra	.L205
.L204:
	.loc 1 4331 0
	mov	_pxCurrentTCB,w4
	mov	[w4+48],w2
	mov	[w4+50],w3
	mov	[w14+6],w0
	mov	[w14+8],w1
	com	w0,w0
	com	w1,w1
	mov	w2,w5
	mov	w3,w2
	mov	w0,w3
	mov	w1,w0
	and	w5,w3,w5
	and	w2,w0,w0
	clr	w1
	sl	w0,#0,w1
	mov	#0,w0
	mov.d	w0,w2
	mul.uu	w5,#1,w0
	ior	w2,w0,w2
	ior	w3,w1,w3
	mov	w2,[w4+48]
	mov	w3,[w4+50]
	.loc 1 4332 0
	mov	#1,w0
	mov	w0,[w14]
.L205:
	.loc 1 4335 0
	mov	_pxCurrentTCB,w0
	clr.b	w1
	mov.b	w1,[w0+52]
	.loc 1 4337 0
	rcall	_vPortExitCritical
	.loc 1 4339 0
	mov	[w14],w0
	.loc 1 4340 0
	ulnk	
	return	
	.set ___PA___,0
.LFE49:
	.size	_xTaskNotifyWait, .-_xTaskNotifyWait
	.align	2
	.global	_xTaskGenericNotify	; export
	.type	_xTaskGenericNotify,@function
_xTaskGenericNotify:
.LFB50:
	.loc 1 4348 0
	.set ___PA___,0
	lnk	#16
.LCFI57:
	mov	w0,[w14+6]
	mov	w2,[w14+8]
	mov	w3,[w14+10]
	mov	w1,[w14+12]
	mov	w4,[w14+14]
	.loc 1 4350 0
	mov	#1,w0
	mov	w0,[w14]
	.loc 1 4354 0
	mov	[w14+6],w1
	mov	w1,[w14+2]
	.loc 1 4356 0
	rcall	_vPortEnterCritical
	.loc 1 4358 0
	mov	[w14+14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L207
	.loc 1 4360 0
	mov	[w14+2],w0
	mov	[w0+50],w1
	mov	[w0+48],w0
	mov	[w14+14],w2
	mov.d	w0,[w2]
.L207:
	.loc 1 4363 0
	mov	[w14+2],w0
	mov.b	[w0+52],w2
	mov.b	w2,[w14+4]
	.loc 1 4365 0
	mov	[w14+2],w0
	mov.b	#2,w1
	mov.b	w1,[w0+52]
	.loc 1 4367 0
	mov	[w14+12],w0
	sub	w0,#2,[w15]
	.set ___BP___,0
	bra	z,.L211
	sub	w0,#2,[w15]
	.set ___BP___,0
	bra	gtu,.L214
	cp0	w0
	.set ___BP___,0
	bra	z,.L219
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	z,.L210
	bra	.L208
.L214:
	sub	w0,#3,[w15]
	.set ___BP___,0
	bra	z,.L212
	sub	w0,#4,[w15]
	.set ___BP___,0
	bra	z,.L213
	bra	.L208
.L210:
	.loc 1 4370 0
	mov	[w14+2],w0
	mov	[w0+48],w2
	mov	[w0+50],w3
	mov	[w14+8],w0
	mov	[w14+10],w1
	ior	w2,w0,w0
	ior	w3,w1,w1
	mov	[w14+2],w2
	mov	w0,[w2+48]
	mov	w1,[w2+50]
	.loc 1 4371 0
	bra	.L208
.L211:
	.loc 1 4374 0
	mov	[w14+2],w0
	mov	[w0+50],w1
	mov	[w0+48],w0
	add	w0,#1,w0
	addc	w1,#0,w1
	mov	[w14+2],w2
	mov	w0,[w2+48]
	mov	w1,[w2+50]
	.loc 1 4375 0
	bra	.L208
.L212:
	.loc 1 4378 0
	mov	[w14+2],w0
	mov	[w14+8],w2
	mov	[w14+10],w3
	mov	w2,[w0+48]
	mov	w3,[w0+50]
	.loc 1 4379 0
	bra	.L208
.L213:
	.loc 1 4382 0
	mov.b	[w14+4],w0
	sub.b	w0,#2,[w15]
	.set ___BP___,0
	bra	z,.L215
	.loc 1 4384 0
	mov	[w14+2],w0
	mov	[w14+8],w2
	mov	[w14+10],w3
	mov	w2,[w0+48]
	mov	w3,[w0+50]
	.loc 1 4391 0
	bra	.L208
.L215:
	.loc 1 4389 0
	clr	w0
	mov	w0,[w14]
	.loc 1 4391 0
	bra	.L208
.L219:
	.loc 1 4396 0
	nop	
.L208:
	.loc 1 4403 0
	mov.b	[w14+4],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L217
	.loc 1 4405 0
	mov	[w14+2],w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 4406 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L218
	mov	[w14+2],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L218:
	mov	[w14+2],w0
	inc2	w0,w1
	mov	[w14+2],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	.loc 1 4427 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L217
	.loc 1 4431 0
; 4431 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L217:
	.loc 1 4443 0
	rcall	_vPortExitCritical
	.loc 1 4445 0
	mov	[w14],w0
	.loc 1 4446 0
	ulnk	
	return	
	.set ___PA___,0
.LFE50:
	.size	_xTaskGenericNotify, .-_xTaskGenericNotify
	.align	2
	.global	_xTaskGenericNotifyFromISR	; export
	.type	_xTaskGenericNotifyFromISR,@function
_xTaskGenericNotifyFromISR:
.LFB51:
	.loc 1 4454 0
	.set ___PA___,1
	lnk	#20
.LCFI58:
	mov	w0,[w14+8]
	mov	w2,[w14+10]
	mov	w3,[w14+12]
	mov	w1,[w14+14]
	mov	w4,[w14+16]
	mov	w5,[w14+18]
	.loc 1 4457 0
	mov	#1,w0
	mov	w0,[w14]
	.loc 1 4480 0
	mov	[w14+8],w1
	mov	w1,[w14+2]
	.loc 1 4482 0
	clr	w0
	mov	w0,[w14+4]
	.loc 1 4484 0
	mov	[w14+16],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L221
	.loc 1 4486 0
	mov	[w14+2],w0
	mov	[w0+50],w1
	mov	[w0+48],w0
	mov	[w14+16],w2
	mov.d	w0,[w2]
.L221:
	.loc 1 4489 0
	mov	[w14+2],w0
	mov.b	[w0+52],w2
	mov.b	w2,[w14+6]
	.loc 1 4490 0
	mov	[w14+2],w0
	mov.b	#2,w1
	mov.b	w1,[w0+52]
	.loc 1 4492 0
	mov	[w14+14],w0
	sub	w0,#2,[w15]
	.set ___BP___,0
	bra	z,.L225
	sub	w0,#2,[w15]
	.set ___BP___,0
	bra	gtu,.L228
	cp0	w0
	.set ___BP___,0
	bra	z,.L236
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	z,.L224
	bra	.L222
.L228:
	sub	w0,#3,[w15]
	.set ___BP___,0
	bra	z,.L226
	sub	w0,#4,[w15]
	.set ___BP___,0
	bra	z,.L227
	bra	.L222
.L224:
	.loc 1 4495 0
	mov	[w14+2],w0
	mov	[w0+48],w2
	mov	[w0+50],w3
	mov	[w14+10],w0
	mov	[w14+12],w1
	ior	w2,w0,w0
	ior	w3,w1,w1
	mov	[w14+2],w2
	mov	w0,[w2+48]
	mov	w1,[w2+50]
	.loc 1 4496 0
	bra	.L222
.L225:
	.loc 1 4499 0
	mov	[w14+2],w0
	mov	[w0+50],w1
	mov	[w0+48],w0
	add	w0,#1,w0
	addc	w1,#0,w1
	mov	[w14+2],w2
	mov	w0,[w2+48]
	mov	w1,[w2+50]
	.loc 1 4500 0
	bra	.L222
.L226:
	.loc 1 4503 0
	mov	[w14+2],w0
	mov	[w14+10],w2
	mov	[w14+12],w3
	mov	w2,[w0+48]
	mov	w3,[w0+50]
	.loc 1 4504 0
	bra	.L222
.L227:
	.loc 1 4507 0
	mov.b	[w14+6],w0
	sub.b	w0,#2,[w15]
	.set ___BP___,0
	bra	z,.L229
	.loc 1 4509 0
	mov	[w14+2],w0
	mov	[w14+10],w2
	mov	[w14+12],w3
	mov	w2,[w0+48]
	mov	w3,[w0+50]
	.loc 1 4516 0
	bra	.L222
.L229:
	.loc 1 4514 0
	clr	w0
	mov	w0,[w14]
	.loc 1 4516 0
	bra	.L222
.L236:
	.loc 1 4521 0
	nop	
.L222:
	.loc 1 4528 0
	mov.b	[w14+6],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L231
	.loc 1 4533 0
	mov	_uxSchedulerSuspended,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L232
	.loc 1 4535 0
	mov	[w14+2],w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 4536 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L233
	mov	[w14+2],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L233:
	mov	[w14+2],w0
	inc2	w0,w1
	mov	[w14+2],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	bra	.L234
.L232:
	.loc 1 4542 0
	mov	[w14+2],w0
	add	w0,#12,w0
	mov	w0,w1
	mov	#_xPendingReadyList,w0
	rcall	_vListInsertEnd
.L234:
	.loc 1 4545 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L231
	.loc 1 4549 0
	mov	[w14+18],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L235
	.loc 1 4551 0
	mov	[w14+18],w0
	mov	#1,w1
	mov	w1,[w0]
	bra	.L231
.L235:
	.loc 1 4558 0
	mov	#1,w0
	mov	w0,_xYieldPending
.L231:
	.loc 1 4569 0
	mov	[w14],w0
	.loc 1 4570 0
	ulnk	
	return	
	.set ___PA___,0
.LFE51:
	.size	_xTaskGenericNotifyFromISR, .-_xTaskGenericNotifyFromISR
	.align	2
	.global	_vTaskNotifyGiveFromISR	; export
	.type	_vTaskNotifyGiveFromISR,@function
_vTaskNotifyGiveFromISR:
.LFB52:
	.loc 1 4578 0
	.set ___PA___,1
	lnk	#10
.LCFI59:
	mov	w0,[w14+6]
	mov	w1,[w14+8]
	.loc 1 4603 0
	mov	[w14+6],w1
	mov	w1,[w14]
	.loc 1 4605 0
	clr	w0
	mov	w0,[w14+2]
	.loc 1 4607 0
	mov	[w14],w0
	mov.b	[w0+52],w1
	mov.b	w1,[w14+4]
	.loc 1 4608 0
	mov	[w14],w0
	mov.b	#2,w1
	mov.b	w1,[w0+52]
	.loc 1 4612 0
	mov	[w14],w0
	mov	[w0+50],w1
	mov	[w0+48],w0
	add	w0,#1,w0
	addc	w1,#0,w1
	mov	[w14],w2
	mov	w0,[w2+48]
	mov	w1,[w2+50]
	.loc 1 4618 0
	mov.b	[w14+4],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L237
	.loc 1 4623 0
	mov	_uxSchedulerSuspended,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L239
	.loc 1 4625 0
	inc2	[w14],w0
	rcall	_uxListRemove
	.loc 1 4626 0
	mov	[w14],w0
	mov	[w0+22],w1
	mov	_uxTopReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L240
	mov	[w14],w0
	mov	[w0+22],w0
	mov	w0,_uxTopReadyPriority
.L240:
	inc2	[w14],w1
	mov	[w14],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyTasksLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	bra	.L241
.L239:
	.loc 1 4632 0
	mov	[w14],w1
	add	w1,#12,w0
	mov	w0,w1
	mov	#_xPendingReadyList,w0
	rcall	_vListInsertEnd
.L241:
	.loc 1 4635 0
	mov	[w14],w0
	mov	[w0+22],w1
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L237
	.loc 1 4639 0
	mov	[w14+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L242
	.loc 1 4641 0
	mov	[w14+8],w0
	mov	#1,w1
	mov	w1,[w0]
	bra	.L237
.L242:
	.loc 1 4648 0
	mov	#1,w0
	mov	w0,_xYieldPending
.L237:
	.loc 1 4658 0
	ulnk	
	return	
	.set ___PA___,0
.LFE52:
	.size	_vTaskNotifyGiveFromISR, .-_vTaskNotifyGiveFromISR
	.align	2
	.global	_xTaskNotifyStateClear	; export
	.type	_xTaskNotifyStateClear,@function
_xTaskNotifyStateClear:
.LFB53:
	.loc 1 4667 0
	.set ___PA___,1
	lnk	#6
.LCFI60:
	mov	w0,[w14+4]
	.loc 1 4673 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L244
	mov	_pxCurrentTCB,w0
	bra	.L245
.L244:
	mov	[w14+4],w0
.L245:
	mov	w0,[w14+2]
	.loc 1 4675 0
	rcall	_vPortEnterCritical
	.loc 1 4677 0
	mov	[w14+2],w0
	mov.b	[w0+52],w0
	sub.b	w0,#2,[w15]
	.set ___BP___,0
	bra	nz,.L246
	.loc 1 4679 0
	mov	[w14+2],w0
	clr.b	w1
	mov.b	w1,[w0+52]
	.loc 1 4680 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L247
.L246:
	.loc 1 4684 0
	clr	w0
	mov	w0,[w14]
.L247:
	.loc 1 4687 0
	rcall	_vPortExitCritical
	.loc 1 4689 0
	mov	[w14],w0
	.loc 1 4690 0
	ulnk	
	return	
	.set ___PA___,0
.LFE53:
	.size	_xTaskNotifyStateClear, .-_xTaskNotifyStateClear
	.align	2
	.type	_prvAddCurrentTaskToDelayedList,@function
_prvAddCurrentTaskToDelayedList:
.LFB54:
	.loc 1 4697 0
	.set ___PA___,1
	lnk	#8
.LCFI61:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	.loc 1 4699 0
	mov	_xTickCount,w1
	mov	w1,[w14]
	.loc 1 4712 0
	mov	_pxCurrentTCB,w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 4725 0
	mov	[w14+4],w0
	add	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L249
	mov	[w14+6],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L249
	.loc 1 4730 0
	mov	_pxCurrentTCB,w0
	inc2	w0,w0
	mov	w0,w1
	mov	#_xSuspendedTaskList,w0
	rcall	_vListInsertEnd
	bra	.L248
.L249:
	.loc 1 4737 0
	mov	[w14+4],w0
	add	w0,[w14],w0
	mov	w0,[w14+2]
	.loc 1 4740 0
	mov	_pxCurrentTCB,w0
	mov	[w14+2],w1
	mov	w1,[w0+2]
	.loc 1 4742 0
	mov	[w14+2],w0
	sub	w0,[w14],[w15]
	.set ___BP___,0
	bra	geu,.L251
	.loc 1 4746 0
	mov	_pxCurrentTCB,w0
	inc2	w0,w1
	mov	_pxOverflowDelayedTaskList,w0
	rcall	_vListInsert
	bra	.L248
.L251:
	.loc 1 4752 0
	mov	_pxCurrentTCB,w0
	inc2	w0,w1
	mov	_pxDelayedTaskList,w0
	rcall	_vListInsert
	.loc 1 4757 0
	mov	_xNextTaskUnblockTime,w0
	mov	[w14+2],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L248
	.loc 1 4759 0
	mov	[w14+2],w1
	mov	w1,_xNextTaskUnblockTime
.L248:
	.loc 1 4805 0
	ulnk	
	return	
	.set ___PA___,0
.LFE54:
	.size	_prvAddCurrentTaskToDelayedList, .-_prvAddCurrentTaskToDelayedList
	.align	2
	.global	_vApplicationGetTimerTaskMemory	; export
	.type	_vApplicationGetTimerTaskMemory,@function
_vApplicationGetTimerTaskMemory:
.LFB55:
	.loc 1 4826 0
	.set ___PA___,1
	lnk	#6
.LCFI62:
	mov	w0,[w14]
	mov	w1,[w14+2]
	mov	w2,[w14+4]
	.loc 1 4835 0
	mov	[w14],w0
	mov	#_xTimerTaskTCB.21794,w1
	mov	w1,[w0]
	.loc 1 4838 0
	mov	[w14+2],w0
	mov	#_uxTimerTaskStack.21795,w1
	mov	w1,[w0]
	.loc 1 4843 0
	mov	[w14+4],w2
	mov	#180,w0
	mov	#0,w1
	mov.d	w0,[w2]
	.loc 1 4844 0
	ulnk	
	return	
	.set ___PA___,0
.LFE55:
	.size	_vApplicationGetTimerTaskMemory, .-_vApplicationGetTimerTaskMemory
	.align	2
	.global	_vApplicationGetIdleTaskMemory	; export
	.type	_vApplicationGetIdleTaskMemory,@function
_vApplicationGetIdleTaskMemory:
.LFB56:
	.loc 1 4852 0
	.set ___PA___,1
	lnk	#6
.LCFI63:
	mov	w0,[w14]
	mov	w1,[w14+2]
	mov	w2,[w14+4]
	.loc 1 4861 0
	mov	[w14],w0
	mov	#_xIdleTaskTCB.21801,w1
	mov	w1,[w0]
	.loc 1 4864 0
	mov	[w14+2],w0
	mov	#_uxIdleTaskStack.21802,w1
	mov	w1,[w0]
	.loc 1 4869 0
	mov	[w14+4],w2
	mov	#120,w0
	mov	#0,w1
	mov.d	w0,[w2]
	.loc 1 4870 0
	ulnk	
	return	
	.set ___PA___,0
.LFE56:
	.size	_vApplicationGetIdleTaskMemory, .-_vApplicationGetIdleTaskMemory
	.section	.bss,bss
	.align	2
	.type	_xIdleTaskTCB.21801,@object
	.size	_xIdleTaskTCB.21801, 54
_xIdleTaskTCB.21801:
	.skip	54
	.align	2
	.type	_uxIdleTaskStack.21802,@object
	.size	_uxIdleTaskStack.21802, 240
_uxIdleTaskStack.21802:
	.skip	240
	.align	2
	.type	_xTimerTaskTCB.21794,@object
	.size	_xTimerTaskTCB.21794, 54
_xTimerTaskTCB.21794:
	.skip	54
	.align	2
	.type	_uxTimerTaskStack.21795,@object
	.size	_uxTimerTaskStack.21795, 360
_uxTimerTaskStack.21795:
	.skip	360
	.section	.debug_frame,info
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.byte	0
	.uleb128 0x1
	.sleb128 2
	.byte	0x25
	.byte	0x12
	.uleb128 0xf
	.sleb128 -2
	.byte	0x9
	.uleb128 0x25
	.uleb128 0xf
	.align	4
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x2e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0x2e
	.uleb128 0x0
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI3-.LFB1
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI4-.LFB2
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI5-.LFB3
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI6-.LFB4
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI7-.LFB5
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI8-.LFB6
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI9-.LFB7
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI10-.LFB8
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI11-.LFB9
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI12-.LFB10
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI13-.LFB11
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI14-.LFB12
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI15-.LFB13
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI16-.LFB14
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI17-.LFB15
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI18-.LFB16
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI19-.LFB17
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI20-.LFB18
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x4
	.4byte	.LCFI21-.LFB19
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x4
	.4byte	.LCFI22-.LFB20
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x4
	.4byte	.LCFI23-.LFB21
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x4
	.4byte	.LCFI24-.LFB22
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x4
	.4byte	.LCFI25-.LFB23
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x4
	.4byte	.LCFI26-.LFB24
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x4
	.4byte	.LCFI27-.LFB25
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x4
	.4byte	.LCFI28-.LFB26
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x4
	.4byte	.LCFI29-.LFB27
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x4
	.4byte	.LCFI30-.LFB28
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x4
	.4byte	.LCFI31-.LFB29
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x4
	.4byte	.LCFI32-.LFB30
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x4
	.4byte	.LCFI33-.LFB31
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI34-.LFB32
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI35-.LFB33
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI36-.LFB34
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI37-.LFB35
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE70:
.LSFDE72:
	.4byte	.LEFDE72-.LASFDE72
.LASFDE72:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI38-.LFB36
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE72:
.LSFDE74:
	.4byte	.LEFDE74-.LASFDE74
.LASFDE74:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI39-.LFB37
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE74:
.LSFDE76:
	.4byte	.LEFDE76-.LASFDE76
.LASFDE76:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI40-.LFB38
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE76:
.LSFDE78:
	.4byte	.LEFDE78-.LASFDE78
.LASFDE78:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI41-.LFB39
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE78:
.LSFDE80:
	.4byte	.LEFDE80-.LASFDE80
.LASFDE80:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI42-.LFB40
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE80:
.LSFDE82:
	.4byte	.LEFDE82-.LASFDE82
.LASFDE82:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI43-.LFB41
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE82:
.LSFDE84:
	.4byte	.LEFDE84-.LASFDE84
.LASFDE84:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI44-.LFB42
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE84:
.LSFDE86:
	.4byte	.LEFDE86-.LASFDE86
.LASFDE86:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI45-.LFB43
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE86:
.LSFDE88:
	.4byte	.LEFDE88-.LASFDE88
.LASFDE88:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI46-.LFB44
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
	.byte	0x2e
	.uleb128 0xa
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
	.byte	0x2e
	.uleb128 0x0
	.align	4
.LEFDE88:
.LSFDE90:
	.4byte	.LEFDE90-.LASFDE90
.LASFDE90:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI49-.LFB45
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
	.byte	0x2e
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI51-.LCFI50
	.byte	0x2e
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0x2e
	.uleb128 0x0
	.align	4
.LEFDE90:
.LSFDE92:
	.4byte	.LEFDE92-.LASFDE92
.LASFDE92:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI53-.LFB46
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE92:
.LSFDE94:
	.4byte	.LEFDE94-.LASFDE94
.LASFDE94:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI54-.LFB47
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE94:
.LSFDE96:
	.4byte	.LEFDE96-.LASFDE96
.LASFDE96:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI55-.LFB48
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE96:
.LSFDE98:
	.4byte	.LEFDE98-.LASFDE98
.LASFDE98:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI56-.LFB49
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE98:
.LSFDE100:
	.4byte	.LEFDE100-.LASFDE100
.LASFDE100:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI57-.LFB50
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE100:
.LSFDE102:
	.4byte	.LEFDE102-.LASFDE102
.LASFDE102:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI58-.LFB51
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE102:
.LSFDE104:
	.4byte	.LEFDE104-.LASFDE104
.LASFDE104:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x4
	.4byte	.LCFI59-.LFB52
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE104:
.LSFDE106:
	.4byte	.LEFDE106-.LASFDE106
.LASFDE106:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x4
	.4byte	.LCFI60-.LFB53
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE106:
.LSFDE108:
	.4byte	.LEFDE108-.LASFDE108
.LASFDE108:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.byte	0x4
	.4byte	.LCFI61-.LFB54
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE108:
.LSFDE110:
	.4byte	.LEFDE110-.LASFDE110
.LASFDE110:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI62-.LFB55
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE110:
.LSFDE112:
	.4byte	.LEFDE112-.LASFDE112
.LASFDE112:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.byte	0x4
	.4byte	.LCFI63-.LFB56
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE112:
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/yvals.h"
	.file 3 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdlib.h"
	.file 4 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 5 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h"
	.file 6 "../../source/include/projdefs.h"
	.file 7 "../../source/include/../../Source/portable/MPLAB/PIC24_dsPIC/portmacro.h"
	.file 8 "../../source/include/FreeRTOS.h"
	.file 9 "../../source/include/list.h"
	.file 10 "../../source/include/task.h"
	.section	.debug_info,info
	.4byte	0x2587
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../../source/tasks.c"
	.asciz	"C:\\Users\\Filippo\\Desktop\\Projects\\Ex1\\mycode\\Ex1"
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.asciz	"long long int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.asciz	"long long unsigned int"
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.asciz	"short unsigned int"
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.asciz	"unsigned int"
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"int"
	.uleb128 0x4
	.asciz	"_Sizet"
	.byte	0x2
	.byte	0xa2
	.4byte	0xe2
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"long int"
	.uleb128 0x4
	.asciz	"size_t"
	.byte	0x3
	.byte	0x24
	.4byte	0xf9
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"signed char"
	.uleb128 0x4
	.asciz	"uint8_t"
	.byte	0x4
	.byte	0x2b
	.4byte	0x13f
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x4
	.byte	0x31
	.4byte	0xe2
	.uleb128 0x4
	.asciz	"uint32_t"
	.byte	0x4
	.byte	0x37
	.4byte	0x170
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.byte	0x87
	.4byte	0x26e
	.uleb128 0x6
	.asciz	"C"
	.byte	0x5
	.byte	0x88
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"Z"
	.byte	0x5
	.byte	0x89
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OV"
	.byte	0x5
	.byte	0x8a
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"N"
	.byte	0x5
	.byte	0x8b
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"RA"
	.byte	0x5
	.byte	0x8c
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"IPL"
	.byte	0x5
	.byte	0x8d
	.4byte	0x150
	.byte	0x2
	.byte	0x3
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DC"
	.byte	0x5
	.byte	0x8e
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DA"
	.byte	0x5
	.byte	0x8f
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SAB"
	.byte	0x5
	.byte	0x90
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OAB"
	.byte	0x5
	.byte	0x91
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SB"
	.byte	0x5
	.byte	0x92
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SA"
	.byte	0x5
	.byte	0x93
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OB"
	.byte	0x5
	.byte	0x94
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OA"
	.byte	0x5
	.byte	0x95
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.byte	0x97
	.4byte	0x2ad
	.uleb128 0x6
	.asciz	"IPL0"
	.byte	0x5
	.byte	0x99
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"IPL1"
	.byte	0x5
	.byte	0x9a
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"IPL2"
	.byte	0x5
	.byte	0x9b
	.4byte	0x150
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x2
	.byte	0x5
	.byte	0x86
	.4byte	0x2c0
	.uleb128 0x8
	.4byte	0x185
	.uleb128 0x8
	.4byte	0x26e
	.byte	0x0
	.uleb128 0x9
	.asciz	"tagSRBITS"
	.byte	0x2
	.byte	0x5
	.byte	0x85
	.4byte	0x2db
	.uleb128 0xa
	.4byte	0x2ad
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x4
	.asciz	"SRBITS"
	.byte	0x5
	.byte	0x9e
	.4byte	0x2c0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x2ef
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x4
	.asciz	"TaskFunction_t"
	.byte	0x6
	.byte	0x4d
	.4byte	0x30d
	.uleb128 0xb
	.byte	0x2
	.4byte	0x313
	.uleb128 0xc
	.byte	0x1
	.4byte	0x31f
	.uleb128 0xd
	.4byte	0x9f
	.byte	0x0
	.uleb128 0x4
	.asciz	"StackType_t"
	.byte	0x7
	.byte	0x60
	.4byte	0x150
	.uleb128 0x4
	.asciz	"BaseType_t"
	.byte	0x7
	.byte	0x61
	.4byte	0x344
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"UBaseType_t"
	.byte	0x7
	.byte	0x62
	.4byte	0xcc
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x7
	.byte	0x65
	.4byte	0x150
	.uleb128 0xe
	.asciz	"xSTATIC_LIST_ITEM"
	.byte	0xa
	.byte	0x8
	.2byte	0x370
	.4byte	0x3b9
	.uleb128 0xf
	.asciz	"xDummy1"
	.byte	0x8
	.2byte	0x372
	.4byte	0x364
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xf
	.asciz	"pvDummy2"
	.byte	0x8
	.2byte	0x373
	.4byte	0x3b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x10
	.4byte	0x9f
	.4byte	0x3c9
	.uleb128 0x11
	.4byte	0xe2
	.byte	0x3
	.byte	0x0
	.uleb128 0x12
	.asciz	"StaticListItem_t"
	.byte	0x8
	.2byte	0x375
	.4byte	0x376
	.uleb128 0xe
	.asciz	"xSTATIC_TCB"
	.byte	0x36
	.byte	0x8
	.2byte	0x394
	.4byte	0x4d8
	.uleb128 0xf
	.asciz	"pxDummy1"
	.byte	0x8
	.2byte	0x396
	.4byte	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xf
	.asciz	"xDummy3"
	.byte	0x8
	.2byte	0x39a
	.4byte	0x4d8
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xf
	.asciz	"uxDummy5"
	.byte	0x8
	.2byte	0x39b
	.4byte	0x351
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xf
	.asciz	"pxDummy6"
	.byte	0x8
	.2byte	0x39c
	.4byte	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xf
	.asciz	"ucDummy7"
	.byte	0x8
	.2byte	0x39d
	.4byte	0x4e8
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xf
	.asciz	"pxDummy8"
	.byte	0x8
	.2byte	0x39f
	.4byte	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xf
	.asciz	"uxDummy10"
	.byte	0x8
	.2byte	0x3a5
	.4byte	0x4f8
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xf
	.asciz	"uxDummy12"
	.byte	0x8
	.2byte	0x3a8
	.4byte	0x4f8
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xf
	.asciz	"ulDummy16"
	.byte	0x8
	.2byte	0x3b1
	.4byte	0x160
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xf
	.asciz	"ulDummy18"
	.byte	0x8
	.2byte	0x3b7
	.4byte	0x160
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xf
	.asciz	"ucDummy19"
	.byte	0x8
	.2byte	0x3b8
	.4byte	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x10
	.4byte	0x3c9
	.4byte	0x4e8
	.uleb128 0x11
	.4byte	0xe2
	.byte	0x1
	.byte	0x0
	.uleb128 0x10
	.4byte	0x130
	.4byte	0x4f8
	.uleb128 0x11
	.4byte	0xe2
	.byte	0x7
	.byte	0x0
	.uleb128 0x10
	.4byte	0x351
	.4byte	0x508
	.uleb128 0x11
	.4byte	0xe2
	.byte	0x1
	.byte	0x0
	.uleb128 0x12
	.asciz	"StaticTask_t"
	.byte	0x8
	.2byte	0x3be
	.4byte	0x3e2
	.uleb128 0x9
	.asciz	"xLIST_ITEM"
	.byte	0xa
	.byte	0x9
	.byte	0xb5
	.4byte	0x586
	.uleb128 0x13
	.4byte	.LASF0
	.byte	0x9
	.byte	0xb8
	.4byte	0x364
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.asciz	"pxNext"
	.byte	0x9
	.byte	0xb9
	.4byte	0x586
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x13
	.4byte	.LASF1
	.byte	0x9
	.byte	0xba
	.4byte	0x586
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.asciz	"pvOwner"
	.byte	0x9
	.byte	0xbb
	.4byte	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x14
	.asciz	"pvContainer"
	.byte	0x9
	.byte	0xbc
	.4byte	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x51d
	.uleb128 0x4
	.asciz	"ListItem_t"
	.byte	0x9
	.byte	0xbf
	.4byte	0x51d
	.uleb128 0x9
	.asciz	"xMINI_LIST_ITEM"
	.byte	0x6
	.byte	0x9
	.byte	0xc1
	.4byte	0x5e4
	.uleb128 0x13
	.4byte	.LASF0
	.byte	0x9
	.byte	0xc4
	.4byte	0x364
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.asciz	"pxNext"
	.byte	0x9
	.byte	0xc5
	.4byte	0x586
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x13
	.4byte	.LASF1
	.byte	0x9
	.byte	0xc6
	.4byte	0x586
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.asciz	"MiniListItem_t"
	.byte	0x9
	.byte	0xc8
	.4byte	0x59e
	.uleb128 0x9
	.asciz	"xLIST"
	.byte	0xa
	.byte	0x9
	.byte	0xcd
	.4byte	0x648
	.uleb128 0x14
	.asciz	"uxNumberOfItems"
	.byte	0x9
	.byte	0xd0
	.4byte	0x351
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.asciz	"pxIndex"
	.byte	0x9
	.byte	0xd1
	.4byte	0x648
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x14
	.asciz	"xListEnd"
	.byte	0x9
	.byte	0xd2
	.4byte	0x5e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x58c
	.uleb128 0x4
	.asciz	"List_t"
	.byte	0x9
	.byte	0xd4
	.4byte	0x5fa
	.uleb128 0x4
	.asciz	"TaskHandle_t"
	.byte	0xa
	.byte	0x67
	.4byte	0x9f
	.uleb128 0x15
	.byte	0x2
	.byte	0xa
	.byte	0x71
	.4byte	0x6bb
	.uleb128 0x16
	.asciz	"eRunning"
	.sleb128 0
	.uleb128 0x16
	.asciz	"eReady"
	.sleb128 1
	.uleb128 0x16
	.asciz	"eBlocked"
	.sleb128 2
	.uleb128 0x16
	.asciz	"eSuspended"
	.sleb128 3
	.uleb128 0x16
	.asciz	"eDeleted"
	.sleb128 4
	.uleb128 0x16
	.asciz	"eInvalid"
	.sleb128 5
	.byte	0x0
	.uleb128 0x4
	.asciz	"eTaskState"
	.byte	0xa
	.byte	0x78
	.4byte	0x670
	.uleb128 0x15
	.byte	0x2
	.byte	0xa
	.byte	0x7c
	.4byte	0x72f
	.uleb128 0x16
	.asciz	"eNoAction"
	.sleb128 0
	.uleb128 0x16
	.asciz	"eSetBits"
	.sleb128 1
	.uleb128 0x16
	.asciz	"eIncrement"
	.sleb128 2
	.uleb128 0x16
	.asciz	"eSetValueWithOverwrite"
	.sleb128 3
	.uleb128 0x16
	.asciz	"eSetValueWithoutOverwrite"
	.sleb128 4
	.byte	0x0
	.uleb128 0x4
	.asciz	"eNotifyAction"
	.byte	0xa
	.byte	0x82
	.4byte	0x6cd
	.uleb128 0x9
	.asciz	"xTIME_OUT"
	.byte	0x4
	.byte	0xa
	.byte	0x87
	.4byte	0x78a
	.uleb128 0x14
	.asciz	"xOverflowCount"
	.byte	0xa
	.byte	0x89
	.4byte	0x332
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.asciz	"xTimeOnEntering"
	.byte	0xa
	.byte	0x8a
	.4byte	0x364
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x4
	.asciz	"TimeOut_t"
	.byte	0xa
	.byte	0x8b
	.4byte	0x744
	.uleb128 0x9
	.asciz	"xMEMORY_REGION"
	.byte	0xa
	.byte	0xa
	.byte	0x90
	.4byte	0x7fc
	.uleb128 0x14
	.asciz	"pvBaseAddress"
	.byte	0xa
	.byte	0x92
	.4byte	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.asciz	"ulLengthInBytes"
	.byte	0xa
	.byte	0x93
	.4byte	0x160
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x14
	.asciz	"ulParameters"
	.byte	0xa
	.byte	0x94
	.4byte	0x160
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0x0
	.uleb128 0x4
	.asciz	"MemoryRegion_t"
	.byte	0xa
	.byte	0x95
	.4byte	0x79b
	.uleb128 0x17
	.4byte	0x817
	.uleb128 0xb
	.byte	0x2
	.4byte	0x81d
	.uleb128 0x17
	.4byte	0x2ef
	.uleb128 0xb
	.byte	0x2
	.4byte	0x31f
	.uleb128 0x9
	.asciz	"xTASK_STATUS"
	.byte	0x14
	.byte	0xa
	.byte	0xa7
	.4byte	0x8f9
	.uleb128 0x14
	.asciz	"xHandle"
	.byte	0xa
	.byte	0xa9
	.4byte	0x65c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x13
	.4byte	.LASF2
	.byte	0xa
	.byte	0xaa
	.4byte	0x817
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x14
	.asciz	"xTaskNumber"
	.byte	0xa
	.byte	0xab
	.4byte	0x351
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.asciz	"eCurrentState"
	.byte	0xa
	.byte	0xac
	.4byte	0x6bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x14
	.asciz	"uxCurrentPriority"
	.byte	0xa
	.byte	0xad
	.4byte	0x351
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x13
	.4byte	.LASF3
	.byte	0xa
	.byte	0xae
	.4byte	0x351
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x13
	.4byte	.LASF4
	.byte	0xa
	.byte	0xaf
	.4byte	0x160
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x14
	.asciz	"pxStackBase"
	.byte	0xa
	.byte	0xb0
	.4byte	0x822
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x14
	.asciz	"usStackHighWaterMark"
	.byte	0xa
	.byte	0xb1
	.4byte	0x150
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0x4
	.asciz	"TaskStatus_t"
	.byte	0xa
	.byte	0xb2
	.4byte	0x828
	.uleb128 0xe
	.asciz	"tskTaskControlBlock"
	.byte	0x36
	.byte	0x1
	.2byte	0x125
	.4byte	0xa48
	.uleb128 0x18
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x127
	.4byte	0xa48
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xf
	.asciz	"xStateListItem"
	.byte	0x1
	.2byte	0x12d
	.4byte	0x58c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xf
	.asciz	"xEventListItem"
	.byte	0x1
	.2byte	0x12e
	.4byte	0x58c
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x18
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x12f
	.4byte	0x351
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xf
	.asciz	"pxStack"
	.byte	0x1
	.2byte	0x130
	.4byte	0x822
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x18
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x131
	.4byte	0xa53
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xf
	.asciz	"pxEndOfStack"
	.byte	0x1
	.2byte	0x134
	.4byte	0x822
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xf
	.asciz	"uxTCBNumber"
	.byte	0x1
	.2byte	0x13c
	.4byte	0x351
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x18
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x13d
	.4byte	0x351
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0x18
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x141
	.4byte	0x351
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xf
	.asciz	"uxMutexesHeld"
	.byte	0x1
	.2byte	0x142
	.4byte	0x351
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x18
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x14e
	.4byte	0x160
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xf
	.asciz	"ulNotifiedValue"
	.byte	0x1
	.2byte	0x15d
	.4byte	0xa63
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xf
	.asciz	"ucNotifyState"
	.byte	0x1
	.2byte	0x15e
	.4byte	0xa68
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0xa4e
	.uleb128 0x19
	.4byte	0x31f
	.uleb128 0x10
	.4byte	0x2ef
	.4byte	0xa63
	.uleb128 0x11
	.4byte	0xe2
	.byte	0x7
	.byte	0x0
	.uleb128 0x19
	.4byte	0x160
	.uleb128 0x19
	.4byte	0x130
	.uleb128 0x12
	.asciz	"tskTCB"
	.byte	0x1
	.2byte	0x16b
	.4byte	0x90d
	.uleb128 0x12
	.asciz	"TCB_t"
	.byte	0x1
	.2byte	0x16f
	.4byte	0xa6d
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskCreate"
	.byte	0x1
	.2byte	0x2a4
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0xb33
	.uleb128 0x1b
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x2a4
	.4byte	0x2f7
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1c
	.asciz	"pcName"
	.byte	0x1
	.2byte	0x2a5
	.4byte	0x812
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1c
	.asciz	"usStackDepth"
	.byte	0x1
	.2byte	0x2a6
	.4byte	0xb33
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1b
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x2a7
	.4byte	0xb38
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x1b
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x2a8
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x1b
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x2a9
	.4byte	0xb3d
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x1d
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x2ab
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x2ac
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x17
	.4byte	0x150
	.uleb128 0x17
	.4byte	0x9f
	.uleb128 0x17
	.4byte	0xb42
	.uleb128 0xb
	.byte	0x2
	.4byte	0x65c
	.uleb128 0xb
	.byte	0x2
	.4byte	0xa7c
	.uleb128 0x1e
	.asciz	"prvInitialiseNewTask"
	.byte	0x1
	.2byte	0x2ff
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.4byte	0xc1c
	.uleb128 0x1b
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x2ff
	.4byte	0x2f7
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1c
	.asciz	"pcName"
	.byte	0x1
	.2byte	0x300
	.4byte	0x812
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1c
	.asciz	"ulStackDepth"
	.byte	0x1
	.2byte	0x301
	.4byte	0xc1c
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1b
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x302
	.4byte	0xb38
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x1b
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x303
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x1b
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x304
	.4byte	0xb3d
	.byte	0x2
	.byte	0x7e
	.sleb128 16
	.uleb128 0x1b
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x305
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 18
	.uleb128 0x1c
	.asciz	"xRegions"
	.byte	0x1
	.2byte	0x306
	.4byte	0xc21
	.byte	0x2
	.byte	0x7e
	.sleb128 -8
	.uleb128 0x1d
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x308
	.4byte	0x822
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1f
	.asciz	"x"
	.byte	0x1
	.2byte	0x309
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x160
	.uleb128 0x17
	.4byte	0xc26
	.uleb128 0xb
	.byte	0x2
	.4byte	0xc2c
	.uleb128 0x17
	.4byte	0x7fc
	.uleb128 0x1e
	.asciz	"prvAddNewTaskToReadyList"
	.byte	0x1
	.2byte	0x3c3
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.4byte	0xc6d
	.uleb128 0x1b
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x3c3
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskDelayUntil"
	.byte	0x1
	.2byte	0x474
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5e
	.4byte	0xd19
	.uleb128 0x1c
	.asciz	"pxPreviousWakeTime"
	.byte	0x1
	.2byte	0x474
	.4byte	0xd19
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1c
	.asciz	"xTimeIncrement"
	.byte	0x1
	.2byte	0x474
	.4byte	0xd24
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x1d
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x476
	.4byte	0x364
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1d
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x477
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1f
	.asciz	"xShouldDelay"
	.byte	0x1
	.2byte	0x477
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x21
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x1d
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x481
	.4byte	0xd24
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0xd1e
	.uleb128 0xb
	.byte	0x2
	.4byte	0x364
	.uleb128 0x17
	.4byte	0x364
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskDelay"
	.byte	0x1
	.2byte	0x4c8
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5e
	.4byte	0xd71
	.uleb128 0x1c
	.asciz	"xTicksToDelay"
	.byte	0x1
	.2byte	0x4c8
	.4byte	0xd24
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x4ca
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"eTaskGetState"
	.byte	0x1
	.2byte	0x4f5
	.byte	0x1
	.4byte	0x6bb
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5e
	.4byte	0xde0
	.uleb128 0x1b
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x4f5
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1f
	.asciz	"eReturn"
	.byte	0x1
	.2byte	0x4f7
	.4byte	0x6bb
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1f
	.asciz	"pxStateList"
	.byte	0x1
	.2byte	0x4f8
	.4byte	0xde0
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x4f9
	.4byte	0xde6
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x64e
	.uleb128 0x17
	.4byte	0xdeb
	.uleb128 0xb
	.byte	0x2
	.4byte	0xdf1
	.uleb128 0x17
	.4byte	0xa7c
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskPrioritySet"
	.byte	0x1
	.2byte	0x57a
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5e
	.4byte	0xea4
	.uleb128 0x1b
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x57a
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1c
	.asciz	"uxNewPriority"
	.byte	0x1
	.2byte	0x57a
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x57c
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1f
	.asciz	"uxCurrentBasePriority"
	.byte	0x1
	.2byte	0x57d
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1f
	.asciz	"uxPriorityUsedOnEntry"
	.byte	0x1
	.2byte	0x57d
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1d
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x57e
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskSuspend"
	.byte	0x1
	.2byte	0x61e
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x5e
	.4byte	0xeef
	.uleb128 0x1c
	.asciz	"xTaskToSuspend"
	.byte	0x1
	.2byte	0x61e
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x620
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x22
	.asciz	"prvTaskIsTaskSuspended"
	.byte	0x1
	.2byte	0x678
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x5e
	.4byte	0xf4b
	.uleb128 0x1b
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x678
	.4byte	0xf4b
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x67a
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x67b
	.4byte	0xde6
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x17
	.4byte	0x65c
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskResume"
	.byte	0x1
	.2byte	0x6a6
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x5e
	.4byte	0xf8f
	.uleb128 0x1b
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x6a6
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x6a8
	.4byte	0xf8f
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x17
	.4byte	0xb48
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskResumeFromISR"
	.byte	0x1
	.2byte	0x6dc
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x5e
	.4byte	0xffc
	.uleb128 0x1b
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x6dc
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1d
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x6de
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x6df
	.4byte	0xf8f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x6e0
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskStartScheduler"
	.byte	0x1
	.2byte	0x722
	.byte	0x1
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x1
	.byte	0x5e
	.4byte	0x1034
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x724
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x23
	.byte	0x1
	.asciz	"vTaskEndScheduler"
	.byte	0x1
	.2byte	0x78d
	.byte	0x1
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x1
	.byte	0x5e
	.uleb128 0x23
	.byte	0x1
	.asciz	"vTaskSuspendAll"
	.byte	0x1
	.2byte	0x798
	.byte	0x1
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x1
	.byte	0x5e
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskResumeAll"
	.byte	0x1
	.2byte	0x7e1
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x1
	.byte	0x5e
	.4byte	0x10e0
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x7e3
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x7e4
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x21
	.4byte	.LBB3
	.4byte	.LBE3
	.uleb128 0x1f
	.asciz	"uxPendedCounts"
	.byte	0x1
	.2byte	0x81c
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskGetTickCount"
	.byte	0x1
	.2byte	0x84f
	.byte	0x1
	.4byte	0x364
	.4byte	.LFB15
	.4byte	.LFE15
	.byte	0x1
	.byte	0x5e
	.4byte	0x111d
	.uleb128 0x1f
	.asciz	"xTicks"
	.byte	0x1
	.2byte	0x851
	.4byte	0x364
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskGetTickCountFromISR"
	.byte	0x1
	.2byte	0x85e
	.byte	0x1
	.4byte	0x364
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x1
	.byte	0x5e
	.4byte	0x116d
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x860
	.4byte	0x364
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x861
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x24
	.byte	0x1
	.asciz	"uxTaskGetNumberOfTasks"
	.byte	0x1
	.2byte	0x87d
	.byte	0x1
	.4byte	0x351
	.4byte	.LFB17
	.4byte	.LFE17
	.byte	0x1
	.byte	0x5e
	.uleb128 0x1a
	.byte	0x1
	.asciz	"pcTaskGetName"
	.byte	0x1
	.2byte	0x885
	.byte	0x1
	.4byte	0x2e9
	.4byte	.LFB18
	.4byte	.LFE18
	.byte	0x1
	.byte	0x5e
	.4byte	0x11e6
	.uleb128 0x1c
	.asciz	"xTaskToQuery"
	.byte	0x1
	.2byte	0x885
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x887
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"uxTaskGetSystemState"
	.byte	0x1
	.2byte	0x911
	.byte	0x1
	.4byte	0x351
	.4byte	.LFB19
	.4byte	.LFE19
	.byte	0x1
	.byte	0x5e
	.4byte	0x1272
	.uleb128 0x1b
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x911
	.4byte	0x1272
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x911
	.4byte	0x127d
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1c
	.asciz	"pulTotalRunTime"
	.byte	0x1
	.2byte	0x911
	.4byte	0x1282
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1f
	.asciz	"uxTask"
	.byte	0x1
	.2byte	0x913
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1f
	.asciz	"uxQueue"
	.byte	0x1
	.2byte	0x913
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x17
	.4byte	0x1277
	.uleb128 0xb
	.byte	0x2
	.4byte	0x8f9
	.uleb128 0x17
	.4byte	0x351
	.uleb128 0x17
	.4byte	0x1287
	.uleb128 0xb
	.byte	0x2
	.4byte	0x160
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskIncrementTick"
	.byte	0x1
	.2byte	0x9c5
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB20
	.4byte	.LFE20
	.byte	0x1
	.byte	0x5e
	.4byte	0x1327
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x9c7
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1d
	.4byte	.LASF0
	.byte	0x1
	.2byte	0x9c8
	.4byte	0x364
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1f
	.asciz	"xSwitchRequired"
	.byte	0x1
	.2byte	0x9c9
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x21
	.4byte	.LBB4
	.4byte	.LBE4
	.uleb128 0x1d
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x9d2
	.4byte	0xd24
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x21
	.4byte	.LBB5
	.4byte	.LBE5
	.uleb128 0x1f
	.asciz	"pxTemp"
	.byte	0x1
	.2byte	0x9db
	.4byte	0xde0
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskSwitchContext"
	.byte	0x1
	.2byte	0xacd
	.byte	0x1
	.4byte	.LFB21
	.4byte	.LFE21
	.byte	0x1
	.byte	0x5e
	.4byte	0x138b
	.uleb128 0x21
	.4byte	.LBB6
	.4byte	.LBE6
	.uleb128 0x1f
	.asciz	"uxTopPriority"
	.byte	0x1
	.2byte	0xafa
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x21
	.4byte	.LBB7
	.4byte	.LBE7
	.uleb128 0x1d
	.4byte	.LASF23
	.byte	0x1
	.2byte	0xafa
	.4byte	0x138b
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0xde0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskPlaceOnEventList"
	.byte	0x1
	.2byte	0xb08
	.byte	0x1
	.4byte	.LFB22
	.4byte	.LFE22
	.byte	0x1
	.byte	0x5e
	.4byte	0x13d9
	.uleb128 0x1b
	.4byte	.LASF24
	.byte	0x1
	.2byte	0xb08
	.4byte	0x138b
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1b
	.4byte	.LASF25
	.byte	0x1
	.2byte	0xb08
	.4byte	0xd24
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskPlaceOnUnorderedEventList"
	.byte	0x1
	.2byte	0xb19
	.byte	0x1
	.4byte	.LFB23
	.4byte	.LFE23
	.byte	0x1
	.byte	0x5e
	.4byte	0x143a
	.uleb128 0x1b
	.4byte	.LASF24
	.byte	0x1
	.2byte	0xb19
	.4byte	0xde0
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1b
	.4byte	.LASF0
	.byte	0x1
	.2byte	0xb19
	.4byte	0xd24
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1b
	.4byte	.LASF25
	.byte	0x1
	.2byte	0xb19
	.4byte	0xd24
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskPlaceOnEventListRestricted"
	.byte	0x1
	.2byte	0xb33
	.byte	0x1
	.4byte	.LFB24
	.4byte	.LFE24
	.byte	0x1
	.byte	0x5e
	.4byte	0x14aa
	.uleb128 0x1b
	.4byte	.LASF24
	.byte	0x1
	.2byte	0xb33
	.4byte	0x138b
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1b
	.4byte	.LASF25
	.byte	0x1
	.2byte	0xb33
	.4byte	0x364
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1c
	.asciz	"xWaitIndefinitely"
	.byte	0x1
	.2byte	0xb33
	.4byte	0x14aa
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.uleb128 0x17
	.4byte	0x332
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskRemoveFromEventList"
	.byte	0x1
	.2byte	0xb52
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB25
	.4byte	.LFE25
	.byte	0x1
	.byte	0x5e
	.4byte	0x150e
	.uleb128 0x1b
	.4byte	.LASF24
	.byte	0x1
	.2byte	0xb52
	.4byte	0x150e
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1d
	.4byte	.LASF26
	.byte	0x1
	.2byte	0xb54
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0xb55
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x1513
	.uleb128 0xb
	.byte	0x2
	.4byte	0x1519
	.uleb128 0x17
	.4byte	0x64e
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskRemoveFromUnorderedEventList"
	.byte	0x1
	.2byte	0xb96
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB26
	.4byte	.LFE26
	.byte	0x1
	.byte	0x5e
	.4byte	0x15a1
	.uleb128 0x1c
	.asciz	"pxEventListItem"
	.byte	0x1
	.2byte	0xb96
	.4byte	0x648
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF0
	.byte	0x1
	.2byte	0xb96
	.4byte	0xd24
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1d
	.4byte	.LASF26
	.byte	0x1
	.2byte	0xb98
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0xb99
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskSetTimeOutState"
	.byte	0x1
	.2byte	0xbc3
	.byte	0x1
	.4byte	.LFB27
	.4byte	.LFE27
	.byte	0x1
	.byte	0x5e
	.4byte	0x15da
	.uleb128 0x1b
	.4byte	.LASF27
	.byte	0x1
	.2byte	0xbc3
	.4byte	0x15da
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x15df
	.uleb128 0xb
	.byte	0x2
	.4byte	0x78a
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskCheckForTimeOut"
	.byte	0x1
	.2byte	0xbcb
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB28
	.4byte	.LFE28
	.byte	0x1
	.byte	0x5e
	.4byte	0x1663
	.uleb128 0x1b
	.4byte	.LASF27
	.byte	0x1
	.2byte	0xbcb
	.4byte	0x15da
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1c
	.asciz	"pxTicksToWait"
	.byte	0x1
	.2byte	0xbcb
	.4byte	0xd19
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0xbcd
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x21
	.4byte	.LBB8
	.4byte	.LBE8
	.uleb128 0x1d
	.4byte	.LASF15
	.byte	0x1
	.2byte	0xbd5
	.4byte	0xd24
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.byte	0x1
	.asciz	"vTaskMissedYield"
	.byte	0x1
	.2byte	0xc08
	.byte	0x1
	.4byte	.LFB29
	.4byte	.LFE29
	.byte	0x1
	.byte	0x5e
	.uleb128 0x1a
	.byte	0x1
	.asciz	"uxTaskGetTaskNumber"
	.byte	0x1
	.2byte	0xc10
	.byte	0x1
	.4byte	0x351
	.4byte	.LFB30
	.4byte	.LFE30
	.byte	0x1
	.byte	0x5e
	.4byte	0x16de
	.uleb128 0x1b
	.4byte	.LASF16
	.byte	0x1
	.2byte	0xc10
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1d
	.4byte	.LASF28
	.byte	0x1
	.2byte	0xc12
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0xc13
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskSetTaskNumber"
	.byte	0x1
	.2byte	0xc27
	.byte	0x1
	.4byte	.LFB31
	.4byte	.LFE31
	.byte	0x1
	.byte	0x5e
	.4byte	0x1738
	.uleb128 0x1b
	.4byte	.LASF16
	.byte	0x1
	.2byte	0xc27
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1c
	.asciz	"uxHandle"
	.byte	0x1
	.2byte	0xc27
	.4byte	0x127d
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0xc29
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1e
	.asciz	"prvIdleTask"
	.byte	0x1
	.2byte	0xc3f
	.byte	0x1
	.4byte	.LFB32
	.4byte	.LFE32
	.byte	0x1
	.byte	0x5e
	.4byte	0x178d
	.uleb128 0x1b
	.4byte	.LASF9
	.byte	0x1
	.2byte	0xc3f
	.4byte	0x9f
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x21
	.4byte	.LBB9
	.4byte	.LBE9
	.uleb128 0x25
	.byte	0x1
	.asciz	"vApplicationIdleHook"
	.byte	0x1
	.2byte	0xc6f
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.asciz	"prvInitialiseTaskLists"
	.byte	0x1
	.2byte	0xd09
	.byte	0x1
	.4byte	.LFB33
	.4byte	.LFE33
	.byte	0x1
	.byte	0x5e
	.4byte	0x17c7
	.uleb128 0x1d
	.4byte	.LASF6
	.byte	0x1
	.2byte	0xd0b
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x26
	.asciz	"prvCheckTasksWaitingTermination"
	.byte	0x1
	.2byte	0xd29
	.byte	0x1
	.4byte	.LFB34
	.4byte	.LFE34
	.byte	0x1
	.byte	0x5e
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskGetInfo"
	.byte	0x1
	.2byte	0xd57
	.byte	0x1
	.4byte	.LFB35
	.4byte	.LFE35
	.byte	0x1
	.byte	0x5e
	.4byte	0x187e
	.uleb128 0x1b
	.4byte	.LASF16
	.byte	0x1
	.2byte	0xd57
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1c
	.asciz	"pxTaskStatus"
	.byte	0x1
	.2byte	0xd57
	.4byte	0x1277
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1c
	.asciz	"xGetFreeStackSpace"
	.byte	0x1
	.2byte	0xd57
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1c
	.asciz	"eState"
	.byte	0x1
	.2byte	0xd57
	.4byte	0x6bb
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0xd59
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x22
	.asciz	"prvListTasksWithinSingleList"
	.byte	0x1
	.2byte	0xdb0
	.byte	0x1
	.4byte	0x351
	.4byte	.LFB36
	.4byte	.LFE36
	.byte	0x1
	.byte	0x5e
	.4byte	0x1959
	.uleb128 0x1b
	.4byte	.LASF21
	.byte	0x1
	.2byte	0xdb0
	.4byte	0x1277
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x1c
	.asciz	"pxList"
	.byte	0x1
	.2byte	0xdb0
	.4byte	0xde0
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x1c
	.asciz	"eState"
	.byte	0x1
	.2byte	0xdb0
	.4byte	0x6bb
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x1f
	.asciz	"pxNextTCB"
	.byte	0x1
	.2byte	0xdb2
	.4byte	0x1959
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1f
	.asciz	"pxFirstTCB"
	.byte	0x1
	.2byte	0xdb2
	.4byte	0x1959
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1f
	.asciz	"uxTask"
	.byte	0x1
	.2byte	0xdb3
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x27
	.4byte	.LBB10
	.4byte	.LBE10
	.4byte	0x193f
	.uleb128 0x1d
	.4byte	.LASF23
	.byte	0x1
	.2byte	0xdb7
	.4byte	0x138b
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x21
	.4byte	.LBB11
	.4byte	.LBE11
	.uleb128 0x1d
	.4byte	.LASF23
	.byte	0x1
	.2byte	0xdbf
	.4byte	0x138b
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x195f
	.uleb128 0x19
	.4byte	0xa7c
	.uleb128 0x22
	.asciz	"prvTaskCheckFreeStackSpace"
	.byte	0x1
	.2byte	0xdd1
	.byte	0x1
	.4byte	0x150
	.4byte	.LFB37
	.4byte	.LFE37
	.byte	0x1
	.byte	0x5e
	.4byte	0x19c2
	.uleb128 0x1c
	.asciz	"pucStackByte"
	.byte	0x1
	.2byte	0xdd1
	.4byte	0x19c2
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1f
	.asciz	"ulCount"
	.byte	0x1
	.2byte	0xdd3
	.4byte	0x160
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x19c8
	.uleb128 0x17
	.4byte	0x130
	.uleb128 0x1e
	.asciz	"prvResetNextTaskUnblockTime"
	.byte	0x1
	.2byte	0xe37
	.byte	0x1
	.4byte	.LFB38
	.4byte	.LFE38
	.byte	0x1
	.byte	0x5e
	.4byte	0x1a0c
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0xe39
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskGetCurrentTaskHandle"
	.byte	0x1
	.2byte	0xe51
	.byte	0x1
	.4byte	0x65c
	.4byte	.LFB39
	.4byte	.LFE39
	.byte	0x1
	.byte	0x5e
	.4byte	0x1a4e
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0xe53
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskGetSchedulerState"
	.byte	0x1
	.2byte	0xe62
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB40
	.4byte	.LFE40
	.byte	0x1
	.byte	0x5e
	.4byte	0x1a8d
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0xe64
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskPriorityInherit"
	.byte	0x1
	.2byte	0xe7e
	.byte	0x1
	.4byte	.LFB41
	.4byte	.LFE41
	.byte	0x1
	.byte	0x5e
	.4byte	0x1ad5
	.uleb128 0x1b
	.4byte	.LASF29
	.byte	0x1
	.2byte	0xe7e
	.4byte	0xf4b
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0xe80
	.4byte	0xf8f
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskPriorityDisinherit"
	.byte	0x1
	.2byte	0xec0
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB42
	.4byte	.LFE42
	.byte	0x1
	.byte	0x5e
	.4byte	0x1b33
	.uleb128 0x1b
	.4byte	.LASF29
	.byte	0x1
	.2byte	0xec0
	.4byte	0xf4b
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0xec2
	.4byte	0xf8f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0xec3
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x22
	.asciz	"prvWriteNameToBuffer"
	.byte	0x1
	.2byte	0xf50
	.byte	0x1
	.4byte	0x2e9
	.4byte	.LFB43
	.4byte	.LFE43
	.byte	0x1
	.byte	0x5e
	.4byte	0x1b90
	.uleb128 0x1c
	.asciz	"pcBuffer"
	.byte	0x1
	.2byte	0xf50
	.4byte	0x2e9
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1b
	.4byte	.LASF2
	.byte	0x1
	.2byte	0xf50
	.4byte	0x817
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1f
	.asciz	"x"
	.byte	0x1
	.2byte	0xf52
	.4byte	0x113
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskList"
	.byte	0x1
	.2byte	0xf6a
	.byte	0x1
	.4byte	.LFB44
	.4byte	.LFE44
	.byte	0x1
	.byte	0x5e
	.4byte	0x1bfc
	.uleb128 0x1b
	.4byte	.LASF30
	.byte	0x1
	.2byte	0xf6a
	.4byte	0x2e9
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1d
	.4byte	.LASF21
	.byte	0x1
	.2byte	0xf6c
	.4byte	0x1277
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF22
	.byte	0x1
	.2byte	0xf6d
	.4byte	0x1bfc
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1f
	.asciz	"x"
	.byte	0x1
	.2byte	0xf6d
	.4byte	0x1bfc
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1f
	.asciz	"cStatus"
	.byte	0x1
	.2byte	0xf6e
	.4byte	0x2ef
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x19
	.4byte	0x351
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskGetRunTimeStats"
	.byte	0x1
	.2byte	0xfc9
	.byte	0x1
	.4byte	.LFB45
	.4byte	.LFE45
	.byte	0x1
	.byte	0x5e
	.4byte	0x1c9b
	.uleb128 0x1b
	.4byte	.LASF30
	.byte	0x1
	.2byte	0xfc9
	.4byte	0x2e9
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x1d
	.4byte	.LASF21
	.byte	0x1
	.2byte	0xfcb
	.4byte	0x1277
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF22
	.byte	0x1
	.2byte	0xfcc
	.4byte	0x1bfc
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1f
	.asciz	"x"
	.byte	0x1
	.2byte	0xfcc
	.4byte	0x1bfc
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1f
	.asciz	"ulTotalTime"
	.byte	0x1
	.2byte	0xfcd
	.4byte	0x160
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x1f
	.asciz	"ulStatsAsPercentage"
	.byte	0x1
	.2byte	0xfcd
	.4byte	0x160
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"uxTaskResetEventItemValue"
	.byte	0x1
	.2byte	0x1046
	.byte	0x1
	.4byte	0x364
	.4byte	.LFB46
	.4byte	.LFE46
	.byte	0x1
	.byte	0x5e
	.4byte	0x1cdd
	.uleb128 0x1d
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x1048
	.4byte	0x364
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x24
	.byte	0x1
	.asciz	"pvTaskIncrementMutexHeldCount"
	.byte	0x1
	.2byte	0x1056
	.byte	0x1
	.4byte	0x9f
	.4byte	.LFB47
	.4byte	.LFE47
	.byte	0x1
	.byte	0x5e
	.uleb128 0x1a
	.byte	0x1
	.asciz	"ulTaskNotifyTake"
	.byte	0x1
	.2byte	0x1067
	.byte	0x1
	.4byte	0x160
	.4byte	.LFB48
	.4byte	.LFE48
	.byte	0x1
	.byte	0x5e
	.4byte	0x1d79
	.uleb128 0x1c
	.asciz	"xClearCountOnExit"
	.byte	0x1
	.2byte	0x1067
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x1067
	.4byte	0x364
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1f
	.asciz	"ulReturn"
	.byte	0x1
	.2byte	0x1069
	.4byte	0x160
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskNotifyWait"
	.byte	0x1
	.2byte	0x10ab
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB49
	.4byte	.LFE49
	.byte	0x1
	.byte	0x5e
	.4byte	0x1e1f
	.uleb128 0x1c
	.asciz	"ulBitsToClearOnEntry"
	.byte	0x1
	.2byte	0x10ab
	.4byte	0x160
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1c
	.asciz	"ulBitsToClearOnExit"
	.byte	0x1
	.2byte	0x10ab
	.4byte	0x160
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1c
	.asciz	"pulNotificationValue"
	.byte	0x1
	.2byte	0x10ab
	.4byte	0x1287
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x1b
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x10ab
	.4byte	0x364
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x10ad
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskGenericNotify"
	.byte	0x1
	.2byte	0x10fb
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB50
	.4byte	.LFE50
	.byte	0x1
	.byte	0x5e
	.4byte	0x1ebc
	.uleb128 0x1b
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x10fb
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1c
	.asciz	"ulValue"
	.byte	0x1
	.2byte	0x10fb
	.4byte	0x160
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1c
	.asciz	"eAction"
	.byte	0x1
	.2byte	0x10fb
	.4byte	0x72f
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x1b
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x10fb
	.4byte	0x1287
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x10fd
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x10fe
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x10ff
	.4byte	0x130
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskGenericNotifyFromISR"
	.byte	0x1
	.2byte	0x1165
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB51
	.4byte	.LFE51
	.byte	0x1
	.byte	0x5e
	.4byte	0x1f7e
	.uleb128 0x1b
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x1165
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1c
	.asciz	"ulValue"
	.byte	0x1
	.2byte	0x1165
	.4byte	0x160
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x1c
	.asciz	"eAction"
	.byte	0x1
	.2byte	0x1165
	.4byte	0x72f
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x1b
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x1165
	.4byte	0x1287
	.byte	0x2
	.byte	0x7e
	.sleb128 16
	.uleb128 0x1b
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x1165
	.4byte	0x1f7e
	.byte	0x2
	.byte	0x7e
	.sleb128 18
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x1167
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x1168
	.4byte	0x130
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x1169
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x116a
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x332
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTaskNotifyGiveFromISR"
	.byte	0x1
	.2byte	0x11e1
	.byte	0x1
	.4byte	.LFB52
	.4byte	.LFE52
	.byte	0x1
	.byte	0x5e
	.4byte	0x1ffb
	.uleb128 0x1b
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x11e1
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1b
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x11e1
	.4byte	0x1f7e
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x11e3
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x11e4
	.4byte	0x130
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1d
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x11e5
	.4byte	0x351
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"xTaskNotifyStateClear"
	.byte	0x1
	.2byte	0x123a
	.byte	0x1
	.4byte	0x332
	.4byte	.LFB53
	.4byte	.LFE53
	.byte	0x1
	.byte	0x5e
	.4byte	0x2057
	.uleb128 0x1b
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x123a
	.4byte	0x65c
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1d
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x123c
	.4byte	0xb48
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x123d
	.4byte	0x332
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1e
	.asciz	"prvAddCurrentTaskToDelayedList"
	.byte	0x1
	.2byte	0x1258
	.byte	0x1
	.4byte	.LFB54
	.4byte	.LFE54
	.byte	0x1
	.byte	0x5e
	.4byte	0x20d8
	.uleb128 0x1b
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x1258
	.4byte	0x364
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1c
	.asciz	"xCanBlockIndefinitely"
	.byte	0x1
	.2byte	0x1258
	.4byte	0x14aa
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1d
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x125a
	.4byte	0x364
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1d
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x125b
	.4byte	0xd24
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vApplicationGetTimerTaskMemory"
	.byte	0x1
	.2byte	0x12d7
	.byte	0x1
	.4byte	.LFB55
	.4byte	.LFE55
	.byte	0x1
	.byte	0x5e
	.4byte	0x21ac
	.uleb128 0x1c
	.asciz	"ppxTimerTaskTCBBuffer"
	.byte	0x1
	.2byte	0x12d7
	.4byte	0x21ac
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1c
	.asciz	"ppxTimerTaskStackBuffer"
	.byte	0x1
	.2byte	0x12d8
	.4byte	0x21b8
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1c
	.asciz	"pulTimerTaskStackSize"
	.byte	0x1
	.2byte	0x12d9
	.4byte	0x1287
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1f
	.asciz	"xTimerTaskTCB"
	.byte	0x1
	.2byte	0x12de
	.4byte	0x508
	.byte	0x5
	.byte	0x3
	.4byte	_xTimerTaskTCB.21794
	.uleb128 0x1f
	.asciz	"uxTimerTaskStack"
	.byte	0x1
	.2byte	0x12df
	.4byte	0x21be
	.byte	0x5
	.byte	0x3
	.4byte	_uxTimerTaskStack.21795
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x21b2
	.uleb128 0xb
	.byte	0x2
	.4byte	0x508
	.uleb128 0xb
	.byte	0x2
	.4byte	0x822
	.uleb128 0x10
	.4byte	0x31f
	.4byte	0x21ce
	.uleb128 0x11
	.4byte	0xe2
	.byte	0xb3
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.asciz	"vApplicationGetIdleTaskMemory"
	.byte	0x1
	.2byte	0x12f1
	.byte	0x1
	.4byte	.LFB56
	.4byte	.LFE56
	.byte	0x1
	.byte	0x5e
	.4byte	0x229c
	.uleb128 0x1c
	.asciz	"ppxIdleTaskTCBBuffer"
	.byte	0x1
	.2byte	0x12f1
	.4byte	0x21ac
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1c
	.asciz	"ppxIdleTaskStackBuffer"
	.byte	0x1
	.2byte	0x12f2
	.4byte	0x21b8
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1c
	.asciz	"pulIdleTaskStackSize"
	.byte	0x1
	.2byte	0x12f3
	.4byte	0x1287
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1f
	.asciz	"xIdleTaskTCB"
	.byte	0x1
	.2byte	0x12f8
	.4byte	0x508
	.byte	0x5
	.byte	0x3
	.4byte	_xIdleTaskTCB.21801
	.uleb128 0x1f
	.asciz	"uxIdleTaskStack"
	.byte	0x1
	.2byte	0x12f9
	.4byte	0x229c
	.byte	0x5
	.byte	0x3
	.4byte	_uxIdleTaskStack.21802
	.byte	0x0
	.uleb128 0x10
	.4byte	0x31f
	.4byte	0x22ac
	.uleb128 0x11
	.4byte	0xe2
	.byte	0x77
	.byte	0x0
	.uleb128 0x28
	.asciz	"SRbits"
	.byte	0x5
	.byte	0x9f
	.4byte	0x22bc
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.4byte	0x2db
	.uleb128 0x29
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x174
	.4byte	0x22cf
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.4byte	0xb48
	.uleb128 0x10
	.4byte	0x64e
	.4byte	0x22e4
	.uleb128 0x11
	.4byte	0xe2
	.byte	0x9
	.byte	0x0
	.uleb128 0x1f
	.asciz	"pxReadyTasksLists"
	.byte	0x1
	.2byte	0x177
	.4byte	0x22d4
	.byte	0x5
	.byte	0x3
	.4byte	_pxReadyTasksLists
	.uleb128 0x1f
	.asciz	"xDelayedTaskList1"
	.byte	0x1
	.2byte	0x178
	.4byte	0x64e
	.byte	0x5
	.byte	0x3
	.4byte	_xDelayedTaskList1
	.uleb128 0x1f
	.asciz	"xDelayedTaskList2"
	.byte	0x1
	.2byte	0x179
	.4byte	0x64e
	.byte	0x5
	.byte	0x3
	.4byte	_xDelayedTaskList2
	.uleb128 0x1f
	.asciz	"pxDelayedTaskList"
	.byte	0x1
	.2byte	0x17a
	.4byte	0x2364
	.byte	0x5
	.byte	0x3
	.4byte	_pxDelayedTaskList
	.uleb128 0x19
	.4byte	0xde0
	.uleb128 0x1f
	.asciz	"pxOverflowDelayedTaskList"
	.byte	0x1
	.2byte	0x17b
	.4byte	0x2364
	.byte	0x5
	.byte	0x3
	.4byte	_pxOverflowDelayedTaskList
	.uleb128 0x1f
	.asciz	"xPendingReadyList"
	.byte	0x1
	.2byte	0x17c
	.4byte	0x64e
	.byte	0x5
	.byte	0x3
	.4byte	_xPendingReadyList
	.uleb128 0x1f
	.asciz	"xSuspendedTaskList"
	.byte	0x1
	.2byte	0x187
	.4byte	0x64e
	.byte	0x5
	.byte	0x3
	.4byte	_xSuspendedTaskList
	.uleb128 0x1f
	.asciz	"uxCurrentNumberOfTasks"
	.byte	0x1
	.2byte	0x18c
	.4byte	0x1bfc
	.byte	0x5
	.byte	0x3
	.4byte	_uxCurrentNumberOfTasks
	.uleb128 0x1f
	.asciz	"xTickCount"
	.byte	0x1
	.2byte	0x18d
	.4byte	0x2410
	.byte	0x5
	.byte	0x3
	.4byte	_xTickCount
	.uleb128 0x19
	.4byte	0x364
	.uleb128 0x1f
	.asciz	"uxTopReadyPriority"
	.byte	0x1
	.2byte	0x18e
	.4byte	0x1bfc
	.byte	0x5
	.byte	0x3
	.4byte	_uxTopReadyPriority
	.uleb128 0x1f
	.asciz	"xSchedulerRunning"
	.byte	0x1
	.2byte	0x18f
	.4byte	0x2456
	.byte	0x5
	.byte	0x3
	.4byte	_xSchedulerRunning
	.uleb128 0x19
	.4byte	0x332
	.uleb128 0x1f
	.asciz	"uxPendedTicks"
	.byte	0x1
	.2byte	0x190
	.4byte	0x1bfc
	.byte	0x5
	.byte	0x3
	.4byte	_uxPendedTicks
	.uleb128 0x1f
	.asciz	"xYieldPending"
	.byte	0x1
	.2byte	0x191
	.4byte	0x2456
	.byte	0x5
	.byte	0x3
	.4byte	_xYieldPending
	.uleb128 0x1f
	.asciz	"xNumOfOverflows"
	.byte	0x1
	.2byte	0x192
	.4byte	0x2456
	.byte	0x5
	.byte	0x3
	.4byte	_xNumOfOverflows
	.uleb128 0x1d
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x193
	.4byte	0x351
	.byte	0x5
	.byte	0x3
	.4byte	_uxTaskNumber
	.uleb128 0x1f
	.asciz	"xNextTaskUnblockTime"
	.byte	0x1
	.2byte	0x194
	.4byte	0x2410
	.byte	0x5
	.byte	0x3
	.4byte	_xNextTaskUnblockTime
	.uleb128 0x1f
	.asciz	"xIdleTaskHandle"
	.byte	0x1
	.2byte	0x195
	.4byte	0x65c
	.byte	0x5
	.byte	0x3
	.4byte	_xIdleTaskHandle
	.uleb128 0x1f
	.asciz	"uxSchedulerSuspended"
	.byte	0x1
	.2byte	0x19f
	.4byte	0x1bfc
	.byte	0x5
	.byte	0x3
	.4byte	_uxSchedulerSuspended
	.uleb128 0x1f
	.asciz	"ulTaskSwitchedInTime"
	.byte	0x1
	.2byte	0x1a3
	.4byte	0x160
	.byte	0x5
	.byte	0x3
	.4byte	_ulTaskSwitchedInTime
	.uleb128 0x1f
	.asciz	"ulTotalRunTime"
	.byte	0x1
	.2byte	0x1a4
	.4byte	0x160
	.byte	0x5
	.byte	0x3
	.4byte	_ulTotalRunTime
	.uleb128 0x28
	.asciz	"SRbits"
	.byte	0x5
	.byte	0x9f
	.4byte	0x22bc
	.byte	0x1
	.byte	0x1
	.uleb128 0x2a
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x174
	.4byte	0x22cf
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_pxCurrentTCB
	.byte	0x0
	.section	.debug_abbrev,info
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x485
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x258b
	.4byte	0xa8a
	.asciz	"xTaskCreate"
	.4byte	0xc6d
	.asciz	"vTaskDelayUntil"
	.4byte	0xd29
	.asciz	"vTaskDelay"
	.4byte	0xd71
	.asciz	"eTaskGetState"
	.4byte	0xdf6
	.asciz	"vTaskPrioritySet"
	.4byte	0xea4
	.asciz	"vTaskSuspend"
	.4byte	0xf50
	.asciz	"vTaskResume"
	.4byte	0xf94
	.asciz	"xTaskResumeFromISR"
	.4byte	0xffc
	.asciz	"vTaskStartScheduler"
	.4byte	0x1034
	.asciz	"vTaskEndScheduler"
	.4byte	0x1056
	.asciz	"vTaskSuspendAll"
	.4byte	0x1076
	.asciz	"xTaskResumeAll"
	.4byte	0x10e0
	.asciz	"xTaskGetTickCount"
	.4byte	0x111d
	.asciz	"xTaskGetTickCountFromISR"
	.4byte	0x116d
	.asciz	"uxTaskGetNumberOfTasks"
	.4byte	0x1198
	.asciz	"pcTaskGetName"
	.4byte	0x11e6
	.asciz	"uxTaskGetSystemState"
	.4byte	0x128d
	.asciz	"xTaskIncrementTick"
	.4byte	0x1327
	.asciz	"vTaskSwitchContext"
	.4byte	0x1390
	.asciz	"vTaskPlaceOnEventList"
	.4byte	0x13d9
	.asciz	"vTaskPlaceOnUnorderedEventList"
	.4byte	0x143a
	.asciz	"vTaskPlaceOnEventListRestricted"
	.4byte	0x14af
	.asciz	"xTaskRemoveFromEventList"
	.4byte	0x151e
	.asciz	"xTaskRemoveFromUnorderedEventList"
	.4byte	0x15a1
	.asciz	"vTaskSetTimeOutState"
	.4byte	0x15e5
	.asciz	"xTaskCheckForTimeOut"
	.4byte	0x1663
	.asciz	"vTaskMissedYield"
	.4byte	0x1684
	.asciz	"uxTaskGetTaskNumber"
	.4byte	0x16de
	.asciz	"vTaskSetTaskNumber"
	.4byte	0x17f6
	.asciz	"vTaskGetInfo"
	.4byte	0x1a0c
	.asciz	"xTaskGetCurrentTaskHandle"
	.4byte	0x1a4e
	.asciz	"xTaskGetSchedulerState"
	.4byte	0x1a8d
	.asciz	"vTaskPriorityInherit"
	.4byte	0x1ad5
	.asciz	"xTaskPriorityDisinherit"
	.4byte	0x1b90
	.asciz	"vTaskList"
	.4byte	0x1c01
	.asciz	"vTaskGetRunTimeStats"
	.4byte	0x1c9b
	.asciz	"uxTaskResetEventItemValue"
	.4byte	0x1cdd
	.asciz	"pvTaskIncrementMutexHeldCount"
	.4byte	0x1d0f
	.asciz	"ulTaskNotifyTake"
	.4byte	0x1d79
	.asciz	"xTaskNotifyWait"
	.4byte	0x1e1f
	.asciz	"xTaskGenericNotify"
	.4byte	0x1ebc
	.asciz	"xTaskGenericNotifyFromISR"
	.4byte	0x1f84
	.asciz	"vTaskNotifyGiveFromISR"
	.4byte	0x1ffb
	.asciz	"xTaskNotifyStateClear"
	.4byte	0x20d8
	.asciz	"vApplicationGetTimerTaskMemory"
	.4byte	0x21ce
	.asciz	"vApplicationGetIdleTaskMemory"
	.4byte	0x2577
	.asciz	"pxCurrentTCB"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x21d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x258b
	.4byte	0xf9
	.asciz	"_Sizet"
	.4byte	0x113
	.asciz	"size_t"
	.4byte	0x130
	.asciz	"uint8_t"
	.4byte	0x150
	.asciz	"uint16_t"
	.4byte	0x160
	.asciz	"uint32_t"
	.4byte	0x2c0
	.asciz	"tagSRBITS"
	.4byte	0x2db
	.asciz	"SRBITS"
	.4byte	0x2f7
	.asciz	"TaskFunction_t"
	.4byte	0x31f
	.asciz	"StackType_t"
	.4byte	0x332
	.asciz	"BaseType_t"
	.4byte	0x351
	.asciz	"UBaseType_t"
	.4byte	0x364
	.asciz	"TickType_t"
	.4byte	0x376
	.asciz	"xSTATIC_LIST_ITEM"
	.4byte	0x3c9
	.asciz	"StaticListItem_t"
	.4byte	0x3e2
	.asciz	"xSTATIC_TCB"
	.4byte	0x508
	.asciz	"StaticTask_t"
	.4byte	0x51d
	.asciz	"xLIST_ITEM"
	.4byte	0x58c
	.asciz	"ListItem_t"
	.4byte	0x59e
	.asciz	"xMINI_LIST_ITEM"
	.4byte	0x5e4
	.asciz	"MiniListItem_t"
	.4byte	0x5fa
	.asciz	"xLIST"
	.4byte	0x64e
	.asciz	"List_t"
	.4byte	0x65c
	.asciz	"TaskHandle_t"
	.4byte	0x6bb
	.asciz	"eTaskState"
	.4byte	0x72f
	.asciz	"eNotifyAction"
	.4byte	0x744
	.asciz	"xTIME_OUT"
	.4byte	0x78a
	.asciz	"TimeOut_t"
	.4byte	0x79b
	.asciz	"xMEMORY_REGION"
	.4byte	0x7fc
	.asciz	"MemoryRegion_t"
	.4byte	0x828
	.asciz	"xTASK_STATUS"
	.4byte	0x8f9
	.asciz	"TaskStatus_t"
	.4byte	0x90d
	.asciz	"tskTaskControlBlock"
	.4byte	0xa6d
	.asciz	"tskTCB"
	.4byte	0xa7c
	.asciz	"TCB_t"
	.4byte	0x0
	.section	.debug_aranges,info
	.4byte	0x14
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,info
.LASF30:
	.asciz	"pcWriteBuffer"
.LASF16:
	.asciz	"xTask"
.LASF14:
	.asciz	"xAlreadyYielded"
.LASF15:
	.asciz	"xConstTickCount"
.LASF34:
	.asciz	"pxHigherPriorityTaskWoken"
.LASF0:
	.asciz	"xItemValue"
.LASF20:
	.asciz	"uxSavedInterruptStatus"
.LASF13:
	.asciz	"xTimeToWake"
.LASF33:
	.asciz	"ucOriginalNotifyState"
.LASF25:
	.asciz	"xTicksToWait"
.LASF31:
	.asciz	"xTaskToNotify"
.LASF7:
	.asciz	"uxTaskNumber"
.LASF32:
	.asciz	"pulPreviousNotificationValue"
.LASF3:
	.asciz	"uxBasePriority"
.LASF18:
	.asciz	"xYieldRequired"
.LASF10:
	.asciz	"pxCreatedTask"
.LASF11:
	.asciz	"pxNewTCB"
.LASF27:
	.asciz	"pxTimeOut"
.LASF21:
	.asciz	"pxTaskStatusArray"
.LASF23:
	.asciz	"pxConstList"
.LASF19:
	.asciz	"xTaskToResume"
.LASF6:
	.asciz	"uxPriority"
.LASF8:
	.asciz	"pxTaskCode"
.LASF24:
	.asciz	"pxEventList"
.LASF17:
	.asciz	"pxTCB"
.LASF28:
	.asciz	"uxReturn"
.LASF9:
	.asciz	"pvParameters"
.LASF29:
	.asciz	"pxMutexHolder"
.LASF35:
	.asciz	"pxCurrentTCB"
.LASF5:
	.asciz	"pxTopOfStack"
.LASF2:
	.asciz	"pcTaskName"
.LASF22:
	.asciz	"uxArraySize"
.LASF1:
	.asciz	"pxPrevious"
.LASF26:
	.asciz	"pxUnblockedTCB"
.LASF12:
	.asciz	"xReturn"
.LASF4:
	.asciz	"ulRunTimeCounter"
	.section	.text,code



	.section __c30_info, info, bss
__large_data_scalar:

	.section __c30_signature, info, data
	.word 0x0001
	.word 0x0001
	.word 0x0000

; MCHP configuration words

	.set ___PA___,0
	.end
