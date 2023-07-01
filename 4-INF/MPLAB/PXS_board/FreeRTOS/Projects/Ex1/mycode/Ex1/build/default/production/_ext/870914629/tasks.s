	.file "C:\\Users\\Filippo\\Desktop\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\..\\source\\tasks.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
	.section	.text,code
	.align	2
	.type	_prvAddCurrentTaskToDelayedList,@function
_prvAddCurrentTaskToDelayedList:
.LFB44:
	.file 1 "../../source/tasks.c"
	.loc 1 4697 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI0:
	mov	w10,[w15++]
.LCFI1:
	mov	w0,w8
	mov	w1,w10
	.loc 1 4699 0
	mov	_xTickCount,w9
	.loc 1 4712 0
	inc2	_pxCurrentTCB,WREG
	rcall	_uxListRemove
	.loc 1 4725 0
	add	w8,#1,[w15]
	.set ___BP___,28
	bra	z,.L6
.L2:
	.loc 1 4737 0
	add	w8,w9,w8
	.loc 1 4740 0
	mov	_pxCurrentTCB,w0
	mov	w8,[w0+2]
	.loc 1 4742 0
	sub	w9,w8,[w15]
	.set ___BP___,39
	bra	gtu,.L7
	.loc 1 4752 0
	mov	_pxCurrentTCB,w1
	mov	_pxDelayedTaskList,w0
	inc2	w1,w1
	rcall	_vListInsert
	.loc 1 4757 0
	mov	_xNextTaskUnblockTime,w0
	sub	w0,w8,[w15]
	.set ___BP___,39
	bra	leu,.L1
	.loc 1 4759 0
	mov	w8,_xNextTaskUnblockTime
.L1:
	.loc 1 4805 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
.L8:
	.set ___PA___,0
.L6:
	.loc 1 4725 0
	cp0	w10
	.set ___BP___,79
	bra	z,.L2
	.loc 1 4730 0
	mov	_pxCurrentTCB,w1
	inc2	w1,w1
	mov	#_xSuspendedTaskList,w0
	rcall	_vListInsertEnd
	.loc 1 4805 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L8
.L7:
	.loc 1 4746 0
	mov	_pxCurrentTCB,w1
	mov	_pxOverflowDelayedTaskList,w0
	inc2	w1,w1
	rcall	_vListInsert
	.loc 1 4805 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L8
.LFE44:
	.size	_prvAddCurrentTaskToDelayedList, .-_prvAddCurrentTaskToDelayedList
	.align	2
	.type	_prvIdleTask,@function
_prvIdleTask:
.LFB28:
	.loc 1 3136 0
	.set ___PA___,0
.L12:
	.loc 1 3170 0
	mov	_pxReadyTasksLists,w0
	sub	w0,#1,[w15]
	.set ___BP___,27
	bra	leu,.L11
	.loc 1 3172 0
; 3172 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L11:
.LBB30:
	.loc 1 3190 0
	rcall	_vApplicationIdleHook
.LBE30:
	.loc 1 3238 0
	bra	.L12
.LFE28:
	.size	_prvIdleTask, .-_prvIdleTask
	.align	2
	.global	_xTaskCreate	; export
	.type	_xTaskCreate,@function
_xTaskCreate:
.LFB0:
	.loc 1 682 0
	.set ___PA___,0
	add	w15,#6,w15
.LCFI2:
	mov.d	w8,[w15++]
.LCFI3:
	mov.d	w10,[w15++]
.LCFI4:
	mov.d	w12,[w15++]
.LCFI5:
	mov	w14,[w15++]
.LCFI6:
	mov.d	w0,w8
	mov	w2,w10
	mov	w3,w14
	mov	w4,[w15-18]
	mov	w5,w13
	.loc 1 694 0
	mov	#42,w0
	rcall	_pvPortMalloc
	mov	w0,w11
	.loc 1 758 0
	setm	w1
	.loc 1 696 0
	cp0	w11
	.set ___BP___,30
	bra	z,.L16
	.loc 1 701 0
	add	w10,w10,w0
	mov	w1,[w15-16]
	rcall	_pvPortMalloc
	mov	w0,w12
	mov	w12,[w11+24]
	.loc 1 703 0
	cp0	w12
	.set ___BP___,6
	bra	z,.L36
.LBB37:
.LBB39:
	.loc 1 822 0
	sl	w10,w10
	dec2	w10,w10
	add	w12,w10,w10
	mov	w10,[w11+30]
	.loc 1 676 0
	add	w11,#25,w1
.LBE39:
.LBE37:
	.loc 1 827 0
	clr	w0
.L19:
	.loc 1 676 0
	mov	w9,w2
.LBB41:
.LBB38:
	.loc 1 829 0
	mov.b	[w9++],[++w1]
	.loc 1 834 0
	cp0.b	[w2]
	.set ___BP___,4
	bra	z,.L18
	.loc 1 827 0
	inc	w0,w0
	sub	w0,#4,[w15]
	.set ___BP___,73
	bra	nz,.L19
.L18:
	.loc 1 846 0
	clr.b	w0
	mov.b	w0,[w11+29]
	mov	[w15-18],w10
	sub	w10,#3,[w15]
	.set ___BP___,50
	bra	gtu,.L37
.L20:
	.loc 1 859 0
	mov	w10,[w11+22]
	.loc 1 862 0
	mov	w10,[w11+32]
	.loc 1 863 0
	clr	w1
	mov	w1,[w11+34]
	.loc 1 867 0
	inc2	w11,w9
	mov	w9,w0
	mov	w1,[w15-16]
	rcall	_vListInitialiseItem
	.loc 1 868 0
	add	w11,#12,w0
	rcall	_vListInitialiseItem
	.loc 1 872 0
	mov	w11,[w11+8]
	.loc 1 875 0
	subr	w10,#4,w10
	mov	w10,[w11+12]
	.loc 1 876 0
	mov	w11,[w11+18]
	.loc 1 918 0
	mul.uu	w2,#0,w2
	mov	w2,[w11+36]
	mov	w3,[w11+38]
	.loc 1 919 0
	mov	[w15-16],w1
	mov.b	w1,[w11+40]
	.loc 1 946 0
	mov	w14,w2
	mov	w8,w1
	mov	w12,w0
	rcall	_pxPortInitialiseStack
	mov	w0,[w11]
	.loc 1 950 0
	cp0	w13
	.set ___BP___,15
	bra	z,.L21
	.loc 1 954 0
	mov	w11,[w13]
.L21:
.LBE38:
.LBE41:
.LBB42:
.LBB43:
	.loc 1 967 0
	rcall	_vPortEnterCritical
	.loc 1 969 0
	inc	_uxCurrentNumberOfTasks
	.loc 1 970 0
	cp0	_pxCurrentTCB
	.set ___BP___,15
	bra	z,.L38
	.loc 1 993 0
	cp0	_xSchedulerRunning
	.set ___BP___,50
	bra	nz,.L34
	.loc 1 995 0
	mov	_pxCurrentTCB,w1
	mov	[w11+22],w0
	mov	[w1+22],w1
	mov	#_pxReadyTasksLists,w8
	sub	w1,w0,[w15]
	.set ___BP___,50
	bra	leu,.L39
.L24:
	.loc 1 1010 0
	inc	_uxTaskNumber
	.loc 1 1020 0
	cp	_uxTopReadyPriority
	.set ___BP___,50
	bra	geu,.L27
	mov	w0,_uxTopReadyPriority
.L27:
	mulw.su	w0,#10,w0
	add	w8,w0,w0
	mov	w9,w1
	rcall	_vListInsertEnd
	.loc 1 1024 0
	rcall	_vPortExitCritical
	.loc 1 754 0
	mov	#1,w1
	.loc 1 1026 0
	cp0	_xSchedulerRunning
	.set ___BP___,39
	bra	z,.L16
	.loc 1 1030 0
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w2
	mov	[w11+22],w0
	sub	w2,w0,[w15]
	.set ___BP___,39
	bra	geu,.L16
	.loc 1 1032 0
; 1032 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L16:
.LBE43:
.LBE42:
	.loc 1 762 0
	mov	w1,w0
	mov	[--w15],w14
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	sub	w15,#6
	return	
.L40:
	.set ___PA___,0
.L37:
.LBB47:
.LBB40:
	.loc 1 846 0
	mov	#3,w10
	bra	.L20
.L38:
.LBE40:
.LBE47:
.LBB48:
.LBB46:
	.loc 1 974 0
	mov	w11,_pxCurrentTCB
	.loc 1 976 0
	mov	_uxCurrentNumberOfTasks,w0
	sub	w0,#1,[w15]
	.set ___BP___,28
	bra	z,.L23
.L34:
	.loc 1 993 0
	mov	[w11+22],w0
	mov	#_pxReadyTasksLists,w8
	bra	.L24
.L39:
	.loc 1 997 0
	mov	w11,_pxCurrentTCB
	bra	.L24
.L23:
	.loc 1 976 0
	clr	w10
	mov	#_pxReadyTasksLists,w8
.L25:
.LBB44:
.LBB45:
	.loc 1 3343 0
	mulw.su	w10,#10,w0
	add	w8,w0,w0
	rcall	_vListInitialise
	.loc 1 3341 0
	inc	w10,w10
	sub	w10,#4,[w15]
	.set ___BP___,74
	bra	nz,.L25
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
	mov	[w11+22],w0
	bra	.L24
.L36:
.LBE45:
.LBE44:
.LBE46:
.LBE48:
	.loc 1 706 0
	mov	w11,w0
	rcall	_vPortFree
	mov	[w15-16], w0
	.loc 1 762 0
	mov	[--w15],w14
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	sub	w15,#6
	return	
	bra	.L40
.LFE0:
	.size	_xTaskCreate, .-_xTaskCreate
	.align	2
	.global	_vTaskPrioritySet	; export
	.type	_vTaskPrioritySet,@function
_vTaskPrioritySet:
.LFB5:
	.loc 1 1403 0
	.set ___PA___,0
	mov.d	w8,[w15++]
.LCFI7:
	mov.d	w10,[w15++]
.LCFI8:
	mov	w0,w9
	mov	w1,w10
	.loc 1 1406 0
	sub	w10,#3,[w15]
	.set ___BP___,50
	bra	leu,.L43
	mov	#3,w10
.L43:
	.loc 1 1420 0
	rcall	_vPortEnterCritical
	.loc 1 1424 0
	cp0	w9
	.set ___BP___,15
	bra	z,.L56
.L45:
	.loc 1 1430 0
	mov	[w9+32],w0
	.loc 1 1438 0
	sub	w0,w10,[w15]
	.set ___BP___,19
	bra	z,.L46
	.loc 1 1442 0
	.set ___BP___,50
	bra	geu,.L47
	.loc 1 1406 0
	clr	w8
	.loc 1 1444 0
	mov	_pxCurrentTCB,w1
	sub	w1,w9,[w15]
	.set ___BP___,15
	bra	z,.L48
	.loc 1 1449 0
	mov	_pxCurrentTCB,w1
	.loc 1 1451 0
	mov	#1,w8
	mov	[w1+22],w1
	sub	w1,w10,[w15]
	.set ___BP___,50
	bra	gtu,.L57
.L48:
	.loc 1 1482 0
	mov	[w9+22],w1
	.loc 1 1488 0
	sub	w0,w1,[w15]
	.set ___BP___,28
	bra	z,.L58
.L50:
	.loc 1 1498 0
	mov	w10,[w9+32]
	.loc 1 1508 0
	mov	[w9+12],w0
	cp0	w0
	.set ___BP___,27
	bra	lt,.L51
	.loc 1 1510 0
	subr	w10,#4,w10
	mov	w10,[w9+12]
.L51:
	.loc 1 1521 0
	mulw.su	w1,#10,w0
	mov	#_pxReadyTasksLists,w10
	add	w10,w0,w1
	mov	[w9+10],w0
	sub	w0,w1,[w15]
	.set ___BP___,6
	bra	z,.L59
.L52:
	.loc 1 1544 0
	cp0	w8
	.set ___BP___,39
	bra	z,.L46
	.loc 1 1546 0
; 1546 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
.L46:
	.loc 1 1558 0
	rcall	_vPortExitCritical
	.loc 1 1559 0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.L47:
	.loc 1 1451 0
	mov	_pxCurrentTCB,w1
	xor	w1,w9,w8
	btsc	w8,#15
	neg	w8,w8
	dec	w8,w8
	lsr	w8,#15,w8
	.loc 1 1482 0
	mov	[w9+22],w1
	.loc 1 1488 0
	sub	w0,w1,[w15]
	.set ___BP___,72
	bra	nz,.L50
.L58:
	.loc 1 1490 0
	mov	w10,[w9+22]
	bra	.L50
.L57:
	.loc 1 1451 0
	clr	w8
	.loc 1 1482 0
	mov	[w9+22],w1
	.loc 1 1488 0
	sub	w0,w1,[w15]
	.set ___BP___,72
	bra	nz,.L50
	bra	.L58
.L56:
	.loc 1 1424 0
	mov	_pxCurrentTCB,w9
	bra	.L45
.L59:
	.loc 1 1526 0
	inc2	w9,w11
	mov	w11,w0
	rcall	_uxListRemove
	.loc 1 1537 0
	mov	[w9+22],w0
	cp	_uxTopReadyPriority
	.set ___BP___,50
	bra	geu,.L53
	mov	w0,_uxTopReadyPriority
.L53:
	mulw.su	w0,#10,w0
	add	w10,w0,w0
	mov	w11,w1
	rcall	_vListInsertEnd
	bra	.L52
.LFE5:
	.size	_vTaskPrioritySet, .-_vTaskPrioritySet
	.align	2
	.global	_vTaskResume	; export
	.type	_vTaskResume,@function
_vTaskResume:
.LFB8:
	.loc 1 1703 0
	.set ___PA___,0
	lnk	#2
.LCFI9:
	mov	w8,[w15++]
.LCFI10:
	mov	w0,w8
	.loc 1 1711 0
	cp0	w8
	.set ___BP___,10
	bra	z,.L61
	mov	_pxCurrentTCB,w0
	sub	w0,w8,[w15]
	.set ___BP___,21
	bra	z,.L61
	.loc 1 1713 0
	rcall	_vPortEnterCritical
.LBB49:
.LBB50:
	.loc 1 1668 0
	mov	[w8+10],w1
	mov	#_xSuspendedTaskList,w0
	sub	w1,w0,[w15]
	.set ___BP___,15
	bra	z,.L68
.L63:
.LBE50:
.LBE49:
	.loc 1 1742 0
	rcall	_vPortExitCritical
.L61:
	.loc 1 1748 0
	mov	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.L68:
.LBB52:
.LBB51:
	.loc 1 1671 0
	mov	[w8+20],w0
	mov	#_xPendingReadyList,w1
	sub	w0,w1,[w15]
	.set ___BP___,15
	bra	z,.L63
	.loc 1 1675 0
	cp0	w0
	.set ___BP___,85
	bra	nz,.L63
.LBE51:
.LBE52:
	.loc 1 1721 0
	inc2	w8,w1
	mov	w1,w0
	mov	w1,[w15-4]
	rcall	_uxListRemove
	.loc 1 1722 0
	mov	[w8+22],w0
	mov	[w15-4],w1
	cp	_uxTopReadyPriority
	.set ___BP___,50
	bra	geu,.L66
	mov	w0,_uxTopReadyPriority
.L66:
	mulw.su	w0,#10,w0
	mov	#_pxReadyTasksLists,w2
	add	w0,w2,w0
	rcall	_vListInsertEnd
	.loc 1 1725 0
	mov	_pxCurrentTCB,w0
	mov	[w8+22],w1
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,50
	bra	ltu,.L63
	.loc 1 1730 0
; 1730 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
	.loc 1 1742 0
	rcall	_vPortExitCritical
	bra	.L61
.LFE8:
	.size	_vTaskResume, .-_vTaskResume
	.align	2
	.global	_xTaskResumeFromISR	; export
	.type	_xTaskResumeFromISR,@function
_xTaskResumeFromISR:
.LFB9:
	.loc 1 1757 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI11:
	mov	w10,[w15++]
.LCFI12:
	mov	w0,w9
.LBB53:
.LBB54:
	.loc 1 1668 0
	mov	[w9+10],w1
	.loc 1 1758 0
	clr	w8
	.loc 1 1668 0
	mov	#_xSuspendedTaskList,w0
	sub	w1,w0,[w15]
	.set ___BP___,15
	bra	z,.L81
.L71:
.LBE54:
.LBE53:
	.loc 1 1821 0
	mov	w8,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
.L83:
	.set ___PA___,0
.L81:
.LBB56:
.LBB55:
	.loc 1 1671 0
	mov	[w9+20],w1
	mov	#_xPendingReadyList,w0
	sub	w1,w0,[w15]
	.set ___BP___,15
	bra	z,.L71
	.loc 1 1675 0
	cp0	w1
	.set ___BP___,85
	bra	nz,.L71
.LBE55:
.LBE56:
	.loc 1 1789 0
	cp0	_uxSchedulerSuspended
	.set ___BP___,29
	bra	nz,.L82
	.loc 1 1793 0
	mov	_pxCurrentTCB,w0
	.loc 1 1758 0
	mov	#1,w8
	mov	[w9+22],w1
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,50
	bra	geu,.L73
	clr	w8
.L73:
	.loc 1 1802 0
	inc2	w9,w10
	mov	w10,w0
	rcall	_uxListRemove
	.loc 1 1803 0
	mov	[w9+22],w0
	cp	_uxTopReadyPriority
	.set ___BP___,39
	bra	geu,.L74
	mov	w0,_uxTopReadyPriority
.L74:
	mulw.su	w0,#10,w0
	mov	#_pxReadyTasksLists,w1
	add	w0,w1,w0
	mov	w10,w1
	rcall	_vListInsertEnd
	.loc 1 1821 0
	mov	w8,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L83
.L82:
	.loc 1 1810 0
	add	w9,#12,w1
	rcall	_vListInsertEnd
	.loc 1 1821 0
	clr	w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L83
.LFE9:
	.size	_xTaskResumeFromISR, .-_xTaskResumeFromISR
	.section .const,psv,page
.LC0:
	.asciz	"IDLE"
	.section	.text,code
	.align	2
	.global	_vTaskStartScheduler	; export
	.type	_vTaskStartScheduler,@function
_vTaskStartScheduler:
.LFB10:
	.loc 1 1827 0
	.set ___PA___,0
	.loc 1 1860 0
	mov	#_xIdleTaskHandle,w5
	clr	w4
	mov	w4,w3
	mov	#105,w2
	mov	#.LC0,w1
	mov	#handle(_prvIdleTask),w0
	rcall	_xTaskCreate
	.loc 1 1870 0
	sub	w0,#1,[w15]
	.set ___BP___,13
	bra	z,.L88
.L85:
	return	
.L88:
	.loc 1 1872 0
	rcall	_xTimerCreateTimerTask
	.loc 1 1881 0
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L85
	.loc 1 1888 0
	mov	#-225,w1
	mov	_SRbits,w2
	and	w1,w2,w1
	bset	w1,#5
	mov	w1,_SRbits
	nop	
; 1888 "../../source/tasks.c" 1
	NOP
	.loc 1 1898 0
	setm	_xNextTaskUnblockTime
	.loc 1 1899 0
	mov	w0,_xSchedulerRunning
	.loc 1 1900 0
	clr	_xTickCount
	.loc 1 1909 0
	bra	_xPortStartScheduler
.LFE10:
	.size	_vTaskStartScheduler, .-_vTaskStartScheduler
	.align	2
	.global	_vTaskEndScheduler	; export
	.type	_vTaskEndScheduler,@function
_vTaskEndScheduler:
.LFB11:
	.loc 1 1934 0
	.set ___PA___,0
	.loc 1 1938 0
	mov	#-225,w0
	and	_SRbits,WREG
	bset	w0,#5
	mov	w0,_SRbits
	nop	
; 1938 "../../source/tasks.c" 1
	NOP
	.loc 1 1939 0
	clr	_xSchedulerRunning
	.loc 1 1940 0
	bra	_vPortEndScheduler
	.loc 1 1941 0
	.set ___PA___,0
.LFE11:
	.size	_vTaskEndScheduler, .-_vTaskEndScheduler
	.align	2
	.global	_vTaskSuspendAll	; export
	.type	_vTaskSuspendAll,@function
_vTaskSuspendAll:
.LFB12:
	.loc 1 1945 0
	.set ___PA___,1
	.loc 1 1950 0
	inc	_uxSchedulerSuspended
	.loc 1 1951 0
	return	
	.set ___PA___,0
.LFE12:
	.size	_vTaskSuspendAll, .-_vTaskSuspendAll
	.align	2
	.global	_xTaskGetTickCount	; export
	.type	_xTaskGetTickCount,@function
_xTaskGetTickCount:
.LFB14:
	.loc 1 2128 0
	.set ___PA___,1
	mov	w8,[w15++]
.LCFI13:
	.loc 1 2132 0
	rcall	_vPortEnterCritical
	.loc 1 2134 0
	mov	_xTickCount,w8
	.loc 1 2136 0
	rcall	_vPortExitCritical
	.loc 1 2139 0
	mov	w8,w0
	mov	[--w15],w8
	return	
	.set ___PA___,0
.LFE14:
	.size	_xTaskGetTickCount, .-_xTaskGetTickCount
	.align	2
	.global	_xTaskGetTickCountFromISR	; export
	.type	_xTaskGetTickCountFromISR,@function
_xTaskGetTickCountFromISR:
.LFB15:
	.loc 1 2143 0
	.set ___PA___,1
	.loc 1 2165 0
	mov	_xTickCount,w0
	.loc 1 2170 0
	return	
	.set ___PA___,0
.LFE15:
	.size	_xTaskGetTickCountFromISR, .-_xTaskGetTickCountFromISR
	.align	2
	.global	_uxTaskGetNumberOfTasks	; export
	.type	_uxTaskGetNumberOfTasks,@function
_uxTaskGetNumberOfTasks:
.LFB16:
	.loc 1 2174 0
	.set ___PA___,1
	.loc 1 2177 0
	mov	_uxCurrentNumberOfTasks,w0
	.loc 1 2178 0
	return	
	.set ___PA___,0
.LFE16:
	.size	_uxTaskGetNumberOfTasks, .-_uxTaskGetNumberOfTasks
	.align	2
	.global	_pcTaskGetName	; export
	.type	_pcTaskGetName,@function
_pcTaskGetName:
.LFB17:
	.loc 1 2182 0
	.set ___PA___,1
	.loc 1 2187 0
	cp0	w0
	.set ___BP___,10
	bra	z,.L109
	.loc 1 2189 0
	add	w0,#26,w0
	.loc 1 2190 0
	return	
.L110:
	.set ___PA___,0
.L109:
	.loc 1 2187 0
	mov	_pxCurrentTCB,w0
	.loc 1 2189 0
	add	w0,#26,w0
	.loc 1 2190 0
	return	
	bra	.L110
.LFE17:
	.size	_pcTaskGetName, .-_pcTaskGetName
	.align	2
	.global	_xTaskIncrementTick	; export
	.type	_xTaskIncrementTick,@function
_xTaskIncrementTick:
.LFB18:
	.loc 1 2501 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI14:
	mov.d	w10,[w15++]
.LCFI15:
	mov	w12,[w15++]
.LCFI16:
	.loc 1 2511 0
	cp0	_uxSchedulerSuspended
	.set ___BP___,50
	bra	nz,.L113
.LBB57:
	.loc 1 2514 0
	mov	_xTickCount,w9
	inc	w9,w9
	.loc 1 2519 0
	mov	w9,_xTickCount
	.loc 1 2521 0
	.set ___BP___,50
	bra	nz,.L114
.LBB58:
	.loc 1 2523 0
	mov	_pxDelayedTaskList,w0
	push	_pxOverflowDelayedTaskList
	pop	_pxDelayedTaskList
	mov	w0,_pxOverflowDelayedTaskList
	inc	_xNumOfOverflows
.LBB59:
.LBB60:
	.loc 1 3643 0
	mov	_pxDelayedTaskList,w0
	cp0	[w0]
	.set ___BP___,50
	bra	nz,.L115
	.loc 1 3649 0
	setm	_xNextTaskUnblockTime
.L114:
.LBE60:
.LBE59:
.LBE58:
	.loc 1 2534 0
	mov	_xNextTaskUnblockTime,w0
	sub	w0,w9,[w15]
	.set ___BP___,50
	bra	gtu,.L126
.L134:
	clr	w10
	mov	#_pxReadyTasksLists,w11
.L130:
	.loc 1 2538 0
	mov	_pxDelayedTaskList,w0
	cp0	[w0]
	.set ___BP___,4
	bra	z,.L132
.L118:
	.loc 1 2554 0
	mov	_pxDelayedTaskList,w0
	mov	[w0+6],w0
	mov	[w0+6],w8
	.loc 1 2555 0
	mov	[w8+2],w0
	.loc 1 2557 0
	sub	w9,w0,[w15]
	.set ___BP___,4
	bra	ltu,.L133
	.loc 1 2573 0
	inc2	w8,w12
	mov	w12,w0
	rcall	_uxListRemove
	.loc 1 2577 0
	mov	[w8+20],w0
	cp0	w0
	.set ___BP___,30
	bra	z,.L120
	.loc 1 2579 0
	add	w8,#12,w0
	rcall	_uxListRemove
.L120:
	.loc 1 2588 0
	mov	[w8+22],w0
	cp	_uxTopReadyPriority
	.set ___BP___,50
	bra	geu,.L121
	mov	w0,_uxTopReadyPriority
.L121:
	mulw.su	w0,#10,w0
	add	w11,w0,w0
	mov	w12,w1
	rcall	_vListInsertEnd
	.loc 1 2598 0
	mov	_pxCurrentTCB,w0
	mov	[w8+22],w1
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,50
	bra	ltu,.L130
	.loc 1 2600 0
	mov	#1,w10
	.loc 1 2538 0
	mov	_pxDelayedTaskList,w0
	cp0	[w0]
	.set ___BP___,95
	bra	nz,.L118
.L132:
	.loc 1 2545 0
	setm	_xNextTaskUnblockTime
.L116:
	.loc 1 2617 0
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w0
	add	w11,w0,w11
	mov	#1,w0
	subr	w0,[w11],[w15]
	.set ___BP___,27
	bra	leu,.L124
	.loc 1 2619 0
	mov	#1,w10
.L124:
.LBE57:
	.loc 1 2658 0
	cp0	_xYieldPending
	.set ___BP___,39
	bra	z,.L125
	.loc 1 2660 0
	mov	#1,w10
.L125:
	.loc 1 2670 0
	mov	w10,w0
	mov	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.L113:
	.loc 1 2645 0
	inc	_uxPendedTicks
	.loc 1 2505 0
	clr	w10
	bra	.L124
.L126:
.LBB64:
	clr	w10
	mov	#_pxReadyTasksLists,w11
	bra	.L116
.L115:
.LBB63:
.LBB62:
.LBB61:
	.loc 1 3657 0
	mov	_pxDelayedTaskList,w0
	mov	[w0+6],w0
	.loc 1 3658 0
	mov	[w0+6],w0
	mov	[w0+2],w0
	mov	w0,_xNextTaskUnblockTime
.LBE61:
.LBE62:
.LBE63:
	.loc 1 2534 0
	mov	_xNextTaskUnblockTime,w0
	sub	w0,w9,[w15]
	.set ___BP___,50
	bra	gtu,.L126
	bra	.L134
.L133:
	.loc 1 2564 0
	mov	w0,_xNextTaskUnblockTime
	.loc 1 2565 0
	bra	.L116
.LBE64:
.LFE18:
	.size	_xTaskIncrementTick, .-_xTaskIncrementTick
	.align	2
	.global	_xTaskResumeAll	; export
	.type	_xTaskResumeAll,@function
_xTaskResumeAll:
.LFB13:
	.loc 1 2018 0
	.set ___PA___,0
	mov.d	w8,[w15++]
.LCFI17:
	mov.d	w10,[w15++]
.LCFI18:
	.loc 1 2031 0
	rcall	_vPortEnterCritical
	.loc 1 2033 0
	dec	_uxSchedulerSuspended
	.loc 1 2020 0
	clr	w8
	.loc 1 2035 0
	cp0	_uxSchedulerSuspended
	.set ___BP___,39
	bra	nz,.L137
	.loc 1 2037 0
	cp0	_uxCurrentNumberOfTasks
	.set ___BP___,39
	bra	z,.L137
	.loc 1 2046 0
	mov	#_pxReadyTasksLists,w9
	.loc 1 2052 0
	mov	#1,w10
.L154:
	.loc 1 2041 0
	mov	_xPendingReadyList,w0
	cp0	w0
	.set ___BP___,9
	bra	z,.L156
.L141:
	.loc 1 2043 0
	mov	_xPendingReadyList+6,w0
	mov	[w0+6],w8
	.loc 1 2044 0
	add	w8,#12,w0
	rcall	_uxListRemove
	.loc 1 2045 0
	inc2	w8,w11
	mov	w11,w0
	rcall	_uxListRemove
	.loc 1 2046 0
	mov	[w8+22],w0
	cp	_uxTopReadyPriority
	.set ___BP___,50
	bra	geu,.L139
	mov	w0,_uxTopReadyPriority
.L139:
	mulw.su	w0,#10,w0
	add	w0,w9,w0
	mov	w11,w1
	rcall	_vListInsertEnd
	.loc 1 2050 0
	mov	_pxCurrentTCB,w0
	mov	[w8+22],w1
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,50
	bra	ltu,.L154
	.loc 1 2052 0
	mov	w10,_xYieldPending
	.loc 1 2041 0
	mov	_xPendingReadyList,w0
	cp0	w0
	.set ___BP___,91
	bra	nz,.L141
.L156:
	.loc 1 2060 0
	cp0	w8
	.set ___BP___,15
	bra	z,.L142
.LBB65:
.LBB66:
	.loc 1 3643 0
	mov	_pxDelayedTaskList,w0
	cp0	[w0]
	.set ___BP___,50
	bra	nz,.L143
	.loc 1 3649 0
	setm	_xNextTaskUnblockTime
.L142:
.LBE66:
.LBE65:
.LBB68:
	.loc 1 2076 0
	mov	_uxPendedTicks,w8
	.loc 1 2078 0
	cp0	w8
	.set ___BP___,50
	bra	nz,.L157
.L144:
.LBE68:
	.loc 1 2020 0
	clr	w8
	.loc 1 2101 0
	cp0	_xYieldPending
	.set ___BP___,39
	bra	z,.L137
	.loc 1 2108 0
; 2108 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
	.loc 1 2105 0
	mov	#1,w8
.L137:
	.loc 1 2121 0
	rcall	_vPortExitCritical
	.loc 1 2124 0
	mov	w8,w0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.L157:
.LBB69:
	.loc 1 2084 0
	mov	#1,w9
.L151:
	.loc 1 2082 0
	rcall	_xTaskIncrementTick
	cp0	w0
	.set ___BP___,50
	bra	z,.L145
	.loc 1 2084 0
	mov	w9,_xYieldPending
.L145:
	.loc 1 2090 0
	dec	w8,w8
	.loc 1 2091 0
	.set ___BP___,86
	bra	nz,.L151
	.loc 1 2093 0
	clr	_uxPendedTicks
	bra	.L144
.L143:
.LBE69:
.LBB70:
.LBB67:
	.loc 1 3657 0
	mov	_pxDelayedTaskList,w0
	mov	[w0+6],w0
	.loc 1 3658 0
	mov	[w0+6],w0
	mov	[w0+2],w0
	mov	w0,_xNextTaskUnblockTime
.LBE67:
.LBE70:
.LBB71:
	.loc 1 2076 0
	mov	_uxPendedTicks,w8
	.loc 1 2078 0
	cp0	w8
	.set ___BP___,50
	bra	z,.L144
	bra	.L157
.LBE71:
.LFE13:
	.size	_xTaskResumeAll, .-_xTaskResumeAll
	.align	2
	.global	_vTaskDelay	; export
	.type	_vTaskDelay,@function
_vTaskDelay:
.LFB4:
	.loc 1 1225 0
	.set ___PA___,0
	.loc 1 1229 0
	cp0	w0
	.set ___BP___,29
	bra	nz,.L164
.L160:
	.loc 1 1256 0
; 1256 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
	return	
.L164:
.LBB72:
.LBB73:
	.loc 1 1950 0
	inc	_uxSchedulerSuspended
.LBE73:
.LBE72:
	.loc 1 1243 0
	clr	w1
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 1245 0
	rcall	_xTaskResumeAll
	.loc 1 1254 0
	cp0	w0
	.set ___BP___,0
	bra	z,.L160
	return	
.LFE4:
	.size	_vTaskDelay, .-_vTaskDelay
	.align	2
	.global	_vTaskDelayUntil	; export
	.type	_vTaskDelayUntil,@function
_vTaskDelayUntil:
.LFB3:
	.loc 1 1141 0
	.set ___PA___,0
.LBB74:
.LBB75:
	.loc 1 1950 0
	inc	_uxSchedulerSuspended
.LBE75:
.LBE74:
.LBB76:
	.loc 1 1153 0
	mov	_xTickCount,w3
	.loc 1 1156 0
	mov	[w0],w2
	add	w1,w2,w1
	.loc 1 1158 0
	sub	w3,w2,[w15]
	.set ___BP___,50
	bra	geu,.L167
	.loc 1 1165 0
	sub	w2,w1,[w15]
	.set ___BP___,50
	bra	leu,.L168
.L173:
	.loc 1 1179 0
	sub	w3,w1,[w15]
	.set ___BP___,50
	bra	geu,.L168
	.loc 1 1190 0
	mov	w1,[w0]
	.loc 1 1198 0
	sub	w1,w3,w0
	clr	w1
	rcall	_prvAddCurrentTaskToDelayedList
.L171:
.LBE76:
	.loc 1 1205 0
	rcall	_xTaskResumeAll
	.loc 1 1209 0
	cp0	w0
	.set ___BP___,39
	bra	nz,.L166
	.loc 1 1211 0
; 1211 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
	return	
.L166:
	return	
.L167:
.LBB77:
	.loc 1 1179 0
	sub	w2,w1,[w15]
	.set ___BP___,50
	bra	leu,.L173
	.loc 1 1190 0
	mov	w1,[w0]
	.loc 1 1198 0
	sub	w1,w3,w0
	clr	w1
	rcall	_prvAddCurrentTaskToDelayedList
	bra	.L171
.L168:
	.loc 1 1190 0
	mov	w1,[w0]
	bra	.L171
.LBE77:
.LFE3:
	.size	_vTaskDelayUntil, .-_vTaskDelayUntil
	.align	2
	.global	_vTaskSwitchContext	; export
	.type	_vTaskSwitchContext,@function
_vTaskSwitchContext:
.LFB19:
	.loc 1 2766 0
	.set ___PA___,1
	.loc 1 2767 0
	cp0	_uxSchedulerSuspended
	.set ___BP___,39
	bra	nz,.L185
	.loc 1 2775 0
	clr	_xYieldPending
.LBB78:
	.loc 1 2810 0
	mov	_uxTopReadyPriority,w2
	mulw.su	w2,#10,w0
	mov	#_pxReadyTasksLists,w4
	add	w4,w0,w1
	cp0	[w1]
	.set ___BP___,25
	bra	nz,.L180
	dec	w2,w1
	.loc 1 2765 0
	mulw.su	w1,#10,w0
	add	w0,w4,w0
	.loc 1 2810 0
	mov	w1,w2
	mov	[w0],w3
	sub	w0,#10,w0
	cp0	w3
	.set ___BP___,25
	bra	nz,.L186
.L183:
	dec	w1,w1
	mov	w1,w2
	mov	[w0],w3
	sub	w0,#10,w0
	cp0	w3
	.set ___BP___,75
	bra	z,.L183
.L186:
	mulw.su	w1,#10,w0
.L180:
.LBB79:
	add	w4,w0,w1
	mov	[w1+2],w1
	mov	[w1+2],w1
	add	w4,w0,w3
	mov	w1,[++w3]
	add	w0,#4,w0
	add	w4,w0,w4
	sub	w1,w4,[w15]
	.set ___BP___,15
	bra	z,.L187
	mov	[w1+6],w1
	mov	w1,_pxCurrentTCB
.LBE79:
	mov	w2,_uxTopReadyPriority
	return	
.L185:
.LBE78:
	.loc 1 2771 0
	mov	#1,w0
	mov	w0,_xYieldPending
	return	
.L187:
.LBB81:
.LBB80:
	.loc 1 2810 0
	mov	[w1+2],w1
	mov	w1,[w3]
	mov	[w1+6],w1
	mov	w1,_pxCurrentTCB
.LBE80:
	mov	w2,_uxTopReadyPriority
	return	
.LBE81:
.LFE19:
	.size	_vTaskSwitchContext, .-_vTaskSwitchContext
	.align	2
	.global	_vTaskSuspend	; export
	.type	_vTaskSuspend,@function
_vTaskSuspend:
.LFB6:
	.loc 1 1567 0
	.set ___PA___,0
	mov.d	w8,[w15++]
.LCFI19:
	mov	w0,w8
	.loc 1 1570 0
	rcall	_vPortEnterCritical
	.loc 1 1574 0
	cp0	w8
	.set ___BP___,15
	bra	z,.L200
.L191:
	.loc 1 1580 0
	inc2	w8,w9
	mov	w9,w0
	rcall	_uxListRemove
	.loc 1 1590 0
	mov	[w8+20],w0
	cp0	w0
	.set ___BP___,30
	bra	z,.L192
	.loc 1 1592 0
	add	w8,#12,w0
	rcall	_uxListRemove
.L192:
	.loc 1 1599 0
	mov	w9,w1
	mov	#_xSuspendedTaskList,w0
	rcall	_vListInsertEnd
	.loc 1 1601 0
	rcall	_vPortExitCritical
	.loc 1 1603 0
	cp0	_xSchedulerRunning
	.set ___BP___,29
	bra	nz,.L201
	.loc 1 1618 0
	mov	_pxCurrentTCB,w0
	sub	w0,w8,[w15]
	.set ___BP___,21
	bra	z,.L202
.L189:
	.loc 1 1649 0
	mov.d	[--w15],w8
	return	
.L206:
	.set ___PA___,0
.L201:
	.loc 1 1607 0
	rcall	_vPortEnterCritical
.LBB82:
.LBB83:
	.loc 1 3643 0
	mov	_pxDelayedTaskList,w0
	cp0	[w0]
	.set ___BP___,50
	bra	nz,.L194
	.loc 1 3649 0
	setm	_xNextTaskUnblockTime
.LBE83:
.LBE82:
	.loc 1 1611 0
	rcall	_vPortExitCritical
.L205:
	.loc 1 1618 0
	mov	_pxCurrentTCB,w0
	sub	w0,w8,[w15]
	.set ___BP___,78
	bra	nz,.L189
.L202:
	.loc 1 1620 0
	cp0	_xSchedulerRunning
	.set ___BP___,39
	bra	nz,.L203
	.loc 1 1631 0
	mov	_xSuspendedTaskList,w0
	cp	_uxCurrentNumberOfTasks
	.set ___BP___,37
	bra	z,.L204
	.loc 1 1641 0
	rcall	_vTaskSwitchContext
	.loc 1 1649 0
	mov.d	[--w15],w8
	return	
	bra	.L206
.L200:
	.loc 1 1574 0
	mov	_pxCurrentTCB,w8
	bra	.L191
.L194:
.LBB85:
.LBB84:
	.loc 1 3657 0
	mov	_pxDelayedTaskList,w0
	mov	[w0+6],w0
	.loc 1 3658 0
	mov	[w0+6],w0
	mov	[w0+2],w0
	mov	w0,_xNextTaskUnblockTime
.LBE84:
.LBE85:
	.loc 1 1611 0
	rcall	_vPortExitCritical
	bra	.L205
.L203:
	.loc 1 1624 0
; 1624 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
	.loc 1 1649 0
	mov.d	[--w15],w8
	return	
	bra	.L206
.L204:
	.loc 1 1637 0
	clr	_pxCurrentTCB
	.loc 1 1649 0
	mov.d	[--w15],w8
	return	
	bra	.L206
.LFE6:
	.size	_vTaskSuspend, .-_vTaskSuspend
	.align	2
	.global	_vTaskPlaceOnEventList	; export
	.type	_vTaskPlaceOnEventList,@function
_vTaskPlaceOnEventList:
.LFB20:
	.loc 1 2825 0
	.set ___PA___,1
	mov	w8,[w15++]
.LCFI20:
	mov	w1,w8
	.loc 1 2835 0
	mov	_pxCurrentTCB,w1
	add	w1,#12,w1
	rcall	_vListInsert
	.loc 1 2837 0
	mov	#1,w1
	mov	w8,w0
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 2838 0
	mov	[--w15],w8
	return	
	.set ___PA___,0
.LFE20:
	.size	_vTaskPlaceOnEventList, .-_vTaskPlaceOnEventList
	.align	2
	.global	_vTaskPlaceOnUnorderedEventList	; export
	.type	_vTaskPlaceOnUnorderedEventList,@function
_vTaskPlaceOnUnorderedEventList:
.LFB21:
	.loc 1 2842 0
	.set ___PA___,1
	mov	w8,[w15++]
.LCFI21:
	mov	w2,w8
	.loc 1 2852 0
	mov	_pxCurrentTCB,w2
	bset	w1,#15
	mov	w1,[w2+12]
	.loc 1 2859 0
	mov	_pxCurrentTCB,w1
	add	w1,#12,w1
	rcall	_vListInsertEnd
	.loc 1 2861 0
	mov	#1,w1
	mov	w8,w0
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 2862 0
	mov	[--w15],w8
	return	
	.set ___PA___,0
.LFE21:
	.size	_vTaskPlaceOnUnorderedEventList, .-_vTaskPlaceOnUnorderedEventList
	.align	2
	.global	_vTaskPlaceOnEventListRestricted	; export
	.type	_vTaskPlaceOnEventListRestricted,@function
_vTaskPlaceOnEventListRestricted:
.LFB22:
	.loc 1 2868 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI22:
	mov	w1,w8
	mov	w2,w9
	.loc 1 2881 0
	mov	_pxCurrentTCB,w1
	add	w1,#12,w1
	rcall	_vListInsertEnd
	.loc 1 2886 0
	cp0	w9
	.set ___BP___,39
	bra	z,.L215
	.loc 1 2888 0
	setm	w8
.L215:
	.loc 1 2892 0
	mov.d	w8,w0
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 2893 0
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.LFE22:
	.size	_vTaskPlaceOnEventListRestricted, .-_vTaskPlaceOnEventListRestricted
	.align	2
	.global	_xTaskRemoveFromEventList	; export
	.type	_xTaskRemoveFromEventList,@function
_xTaskRemoveFromEventList:
.LFB23:
	.loc 1 2899 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI23:
	.loc 1 2916 0
	mov	[w0+6],w0
	mov	[w0+6],w8
	.loc 1 2918 0
	add	w8,#12,w9
	mov	w9,w0
	rcall	_uxListRemove
	.loc 1 2920 0
	cp0	_uxSchedulerSuspended
	.set ___BP___,50
	bra	nz,.L220
	.loc 1 2922 0
	inc2	w8,w9
	mov	w9,w0
	rcall	_uxListRemove
	.loc 1 2923 0
	mov	[w8+22],w0
	cp	_uxTopReadyPriority
	.set ___BP___,50
	bra	geu,.L221
	mov	w0,_uxTopReadyPriority
.L221:
	mulw.su	w0,#10,w0
	mov	#_pxReadyTasksLists,w1
	add	w0,w1,w0
	mov	w9,w1
	rcall	_vListInsertEnd
.L222:
	.loc 1 2932 0
	mov	_pxCurrentTCB,w0
	mov	[w8+22],w2
	mov	[w0+22],w1
	.loc 1 2945 0
	clr	w0
	.loc 1 2932 0
	sub	w2,w1,[w15]
	.set ___BP___,39
	bra	leu,.L223
	.loc 1 2941 0
	mov	#1,w0
	mov	w0,_xYieldPending
.L223:
	.loc 1 2963 0
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.L220:
	.loc 1 2929 0
	mov	w9,w1
	mov	#_xPendingReadyList,w0
	rcall	_vListInsertEnd
	bra	.L222
.LFE23:
	.size	_xTaskRemoveFromEventList, .-_xTaskRemoveFromEventList
	.align	2
	.global	_xTaskRemoveFromUnorderedEventList	; export
	.type	_xTaskRemoveFromUnorderedEventList,@function
_xTaskRemoveFromUnorderedEventList:
.LFB24:
	.loc 1 2967 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI24:
	.loc 1 2976 0
	bset	w1,#15
	mov	w1,[w0]
	.loc 1 2980 0
	mov	[w0+6],w8
	.loc 1 2982 0
	rcall	_uxListRemove
	.loc 1 2987 0
	inc2	w8,w9
	mov	w9,w0
	rcall	_uxListRemove
	.loc 1 2988 0
	mov	[w8+22],w0
	cp	_uxTopReadyPriority
	.set ___BP___,50
	bra	geu,.L228
	mov	w0,_uxTopReadyPriority
.L228:
	mulw.su	w0,#10,w0
	mov	#_pxReadyTasksLists,w1
	add	w0,w1,w0
	mov	w9,w1
	rcall	_vListInsertEnd
	.loc 1 2990 0
	mov	_pxCurrentTCB,w0
	mov	[w8+22],w2
	mov	[w0+22],w1
	.loc 1 3004 0
	clr	w0
	.loc 1 2990 0
	sub	w2,w1,[w15]
	.set ___BP___,39
	bra	leu,.L229
	.loc 1 3000 0
	mov	#1,w0
	mov	w0,_xYieldPending
.L229:
	.loc 1 3008 0
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.LFE24:
	.size	_xTaskRemoveFromUnorderedEventList, .-_xTaskRemoveFromUnorderedEventList
	.align	2
	.global	_vTaskSetTimeOutState	; export
	.type	_vTaskSetTimeOutState,@function
_vTaskSetTimeOutState:
.LFB25:
	.loc 1 3012 0
	.set ___PA___,1
	.loc 1 3014 0
	mov	_xNumOfOverflows,w1
	mov	w1,[w0]
	.loc 1 3015 0
	mov	_xTickCount,w1
	mov	w1,[w0+2]
	.loc 1 3016 0
	return	
	.set ___PA___,0
.LFE25:
	.size	_vTaskSetTimeOutState, .-_vTaskSetTimeOutState
	.align	2
	.global	_xTaskCheckForTimeOut	; export
	.type	_xTaskCheckForTimeOut,@function
_xTaskCheckForTimeOut:
.LFB26:
	.loc 1 3020 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI25:
	mov	w10,[w15++]
.LCFI26:
	mov	w0,w8
	mov	w1,w10
	.loc 1 3026 0
	rcall	_vPortEnterCritical
.LBB86:
	.loc 1 3029 0
	mov	_xTickCount,w2
	.loc 1 3043 0
	mov	[w10],w0
	.loc 1 3048 0
	clr	w9
	.loc 1 3043 0
	add	w0,#1,[w15]
	.set ___BP___,19
	bra	z,.L237
	.loc 1 3053 0
	mov	[w8],w1
	mov	_xNumOfOverflows,w3
	sub	w3,w1,[w15]
	.set ___BP___,28
	bra	z,.L244
	mov	[w8+2],w1
	.loc 1 3060 0
	mov	#1,w9
	.loc 1 3053 0
	sub	w2,w1,[w15]
	.set ___BP___,39
	bra	geu,.L237
	.loc 1 3062 0
	sub	w2,w1,w3
	.loc 1 3071 0
	mov	#1,w9
	.loc 1 3062 0
	sub	w0,w3,[w15]
	.set ___BP___,39
	bra	leu,.L237
.L245:
	.loc 1 3065 0
	sub	w0,w2,w0
	add	w0,w1,[w10]
.LBB87:
.LBB88:
	.loc 1 3014 0
	mov	_xNumOfOverflows,w0
	mov	w0,[w8]
	.loc 1 3015 0
	mov	_xTickCount,w3
	mov	w3,[w8+2]
	.loc 1 3067 0
	clr	w9
.L237:
.LBE88:
.LBE87:
.LBE86:
	.loc 1 3074 0
	rcall	_vPortExitCritical
	.loc 1 3077 0
	mov	w9,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.L244:
.LBB89:
	.loc 1 3053 0
	mov	[w8+2],w1
	.loc 1 3062 0
	sub	w2,w1,w3
	.loc 1 3071 0
	mov	#1,w9
	.loc 1 3062 0
	sub	w0,w3,[w15]
	.set ___BP___,61
	bra	gtu,.L245
	bra	.L237
.LBE89:
.LFE26:
	.size	_xTaskCheckForTimeOut, .-_xTaskCheckForTimeOut
	.align	2
	.global	_vTaskMissedYield	; export
	.type	_vTaskMissedYield,@function
_vTaskMissedYield:
.LFB27:
	.loc 1 3081 0
	.set ___PA___,1
	.loc 1 3082 0
	mov	#1,w0
	mov	w0,_xYieldPending
	.loc 1 3083 0
	return	
	.set ___PA___,0
.LFE27:
	.size	_vTaskMissedYield, .-_vTaskMissedYield
	.align	2
	.global	_xTaskGetCurrentTaskHandle	; export
	.type	_xTaskGetCurrentTaskHandle,@function
_xTaskGetCurrentTaskHandle:
.LFB32:
	.loc 1 3666 0
	.set ___PA___,1
	.loc 1 3672 0
	mov	_pxCurrentTCB,w0
	.loc 1 3675 0
	return	
	.set ___PA___,0
.LFE32:
	.size	_xTaskGetCurrentTaskHandle, .-_xTaskGetCurrentTaskHandle
	.align	2
	.global	_xTaskGetSchedulerState	; export
	.type	_xTaskGetSchedulerState,@function
_xTaskGetSchedulerState:
.LFB33:
	.loc 1 3683 0
	.set ___PA___,1
	.loc 1 3688 0
	mov	#1,w0
	.loc 1 3686 0
	cp0	_xSchedulerRunning
	.set ___BP___,33
	bra	z,.L254
	.loc 1 3698 0
	clr	w0
	.loc 1 3692 0
	cp0	_uxSchedulerSuspended
	.set ___BP___,39
	bra	z,.L258
.L254:
	.loc 1 3703 0
	return	
.L258:
	.loc 1 3694 0
	retlw	#2,w0
.LFE33:
	.size	_xTaskGetSchedulerState, .-_xTaskGetSchedulerState
	.align	2
	.global	_vTaskPriorityInherit	; export
	.type	_vTaskPriorityInherit,@function
_vTaskPriorityInherit:
.LFB34:
	.loc 1 3711 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI27:
	mov	w10,[w15++]
.LCFI28:
	mov	w0,w8
	.loc 1 3716 0
	cp0	w8
	.set ___BP___,10
	bra	z,.L260
	.loc 1 3721 0
	mov	[w8+22],w0
	mov	_pxCurrentTCB,w1
	mov	[w1+22],w1
	sub	w0,w1,[w15]
	.set ___BP___,39
	bra	geu,.L260
	.loc 1 3726 0
	mov	[w8+12],w1
	cp0	w1
	.set ___BP___,27
	bra	lt,.L262
	.loc 1 3728 0
	mov	_pxCurrentTCB,w1
	mov	[w1+22],w1
	subr	w1,#4,w1
	mov	w1,[w8+12]
.L262:
	.loc 1 3737 0
	mulw.su	w0,#10,w0
	mov	#_pxReadyTasksLists,w9
	add	w9,w0,w0
	mov	[w8+10],w1
	sub	w1,w0,[w15]
	.set ___BP___,6
	bra	z,.L266
	.loc 1 3755 0
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	mov	w0,[w8+22]
.L260:
	.loc 1 3769 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
.L267:
	.set ___PA___,0
.L266:
	.loc 1 3739 0
	inc2	w8,w10
	mov	w10,w0
	rcall	_uxListRemove
	.loc 1 3749 0
	mov	_pxCurrentTCB,w0
	mov	[w0+22],w0
	mov	w0,[w8+22]
	.loc 1 3750 0
	cp	_uxTopReadyPriority
	.set ___BP___,39
	bra	geu,.L264
	mov	w0,_uxTopReadyPriority
.L264:
	mulw.su	w0,#10,w0
	add	w9,w0,w0
	mov	w10,w1
	rcall	_vListInsertEnd
	.loc 1 3769 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L267
.LFE34:
	.size	_vTaskPriorityInherit, .-_vTaskPriorityInherit
	.align	2
	.global	_xTaskPriorityDisinherit	; export
	.type	_xTaskPriorityDisinherit,@function
_xTaskPriorityDisinherit:
.LFB35:
	.loc 1 3777 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI29:
	mov	w0,w8
	.loc 1 3779 0
	clr	w0
	.loc 1 3781 0
	cp0	w8
	.set ___BP___,10
	bra	z,.L270
	.loc 1 3790 0
	mov	[w8+34],w1
	dec	w1,w1
	mov	w1,[w8+34]
	.loc 1 3794 0
	mov	[w8+22],w3
	mov	[w8+32],w2
	sub	w3,w2,[w15]
	.set ___BP___,19
	bra	z,.L270
	.loc 1 3797 0
	cp0	w1
	.set ___BP___,38
	bra	z,.L276
.L270:
	.loc 1 3850 0
	mov.d	[--w15],w8
	return	
.L277:
	.set ___PA___,0
.L276:
	.loc 1 3804 0
	inc2	w8,w9
	mov	w9,w0
	rcall	_uxListRemove
	.loc 1 3816 0
	mov	[w8+32],w0
	mov	w0,[w8+22]
	.loc 1 3821 0
	subr	w0,#4,w1
	mov	w1,[w8+12]
	.loc 1 3822 0
	cp	_uxTopReadyPriority
	.set ___BP___,50
	bra	geu,.L271
	mov	w0,_uxTopReadyPriority
.L271:
	mulw.su	w0,#10,w0
	mov	#_pxReadyTasksLists,w1
	add	w0,w1,w0
	mov	w9,w1
	rcall	_vListInsertEnd
	.loc 1 3832 0
	mov	#1,w0
	.loc 1 3850 0
	mov.d	[--w15],w8
	return	
	bra	.L277
.LFE35:
	.size	_xTaskPriorityDisinherit, .-_xTaskPriorityDisinherit
	.align	2
	.global	_uxTaskResetEventItemValue	; export
	.type	_uxTaskResetEventItemValue,@function
_uxTaskResetEventItemValue:
.LFB36:
	.loc 1 4167 0
	.set ___PA___,1
	.loc 1 4170 0
	mov	_pxCurrentTCB,w0
	mov	[w0+12],w0
	.loc 1 4174 0
	mov	_pxCurrentTCB,w1
	mov	_pxCurrentTCB,w2
	mov	[w2+22],w2
	subr	w2,#4,w2
	mov	w2,[w1+12]
	.loc 1 4177 0
	return	
	.set ___PA___,0
.LFE36:
	.size	_uxTaskResetEventItemValue, .-_uxTaskResetEventItemValue
	.align	2
	.global	_pvTaskIncrementMutexHeldCount	; export
	.type	_pvTaskIncrementMutexHeldCount,@function
_pvTaskIncrementMutexHeldCount:
.LFB37:
	.loc 1 4183 0
	.set ___PA___,1
	.loc 1 4186 0
	cp0	_pxCurrentTCB
	.set ___BP___,10
	bra	z,.L283
	.loc 1 4188 0
	mov	_pxCurrentTCB,w0
	mov	[w0+34],w1
	inc	w1,w1
	mov	w1,[w0+34]
.L283:
	.loc 1 4191 0
	mov	_pxCurrentTCB,w0
	.loc 1 4192 0
	return	
	.set ___PA___,0
.LFE37:
	.size	_pvTaskIncrementMutexHeldCount, .-_pvTaskIncrementMutexHeldCount
	.align	2
	.global	_ulTaskNotifyTake	; export
	.type	_ulTaskNotifyTake,@function
_ulTaskNotifyTake:
.LFB38:
	.loc 1 4200 0
	.set ___PA___,0
	mov	w8,[w15++]
.LCFI30:
	mov.d	w10,[w15++]
.LCFI31:
	mov	w0,w8
	mov	w1,w10
	.loc 1 4203 0
	rcall	_vPortEnterCritical
	.loc 1 4206 0
	mov	_pxCurrentTCB,w0
	mov	[w0+38],w1
	mov	[w0+36],w0
	sub	w0,#0,[w15]
	subb	w1,#0,[w15]
	.set ___BP___,50
	bra	nz,.L287
	.loc 1 4209 0
	mov	_pxCurrentTCB,w0
	mov.b	#1,w1
	mov.b	w1,[w0+40]
	.loc 1 4211 0
	cp0	w10
	.set ___BP___,29
	bra	nz,.L291
.L287:
	.loc 1 4232 0
	rcall	_vPortExitCritical
	.loc 1 4234 0
	rcall	_vPortEnterCritical
	.loc 1 4237 0
	mov	_pxCurrentTCB,w0
	mov	[w0+36],w10
	mov	[w0+38],w11
	.loc 1 4239 0
	sub	w10,#0,[w15]
	subb	w11,#0,[w15]
	.set ___BP___,39
	bra	z,.L288
	.loc 1 4241 0
	cp0	w8
	.set ___BP___,39
	bra	nz,.L292
	.loc 1 4247 0
	mov	_pxCurrentTCB,w0
	sub	w10,#1,w2
	subb	w11,#0,w3
	mov	w2,[w0+36]
	mov	w3,[w0+38]
.L288:
	.loc 1 4255 0
	mov	_pxCurrentTCB,w0
	clr.b	w1
	mov.b	w1,[w0+40]
	.loc 1 4257 0
	rcall	_vPortExitCritical
	.loc 1 4260 0
	mov.d	w10,w0
	mov.d	[--w15],w10
	mov	[--w15],w8
	return	
.L293:
	.set ___PA___,0
.L292:
	.loc 1 4243 0
	mov	_pxCurrentTCB,w0
	mul.uu	w2,#0,w2
	mov	w2,[w0+36]
	mov	w3,[w0+38]
	.loc 1 4255 0
	mov	_pxCurrentTCB,w0
	clr.b	w1
	mov.b	w1,[w0+40]
	.loc 1 4257 0
	rcall	_vPortExitCritical
	.loc 1 4260 0
	mov.d	w10,w0
	mov.d	[--w15],w10
	mov	[--w15],w8
	return	
	bra	.L293
.L291:
	.loc 1 4213 0
	mov	#1,w1
	mov	w10,w0
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 4220 0
; 4220 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
	bra	.L287
.LFE38:
	.size	_ulTaskNotifyTake, .-_ulTaskNotifyTake
	.align	2
	.global	_xTaskNotifyWait	; export
	.type	_xTaskNotifyWait,@function
_xTaskNotifyWait:
.LFB39:
	.loc 1 4268 0
	.set ___PA___,0
	lnk	#8
.LCFI32:
	mov.d	w8,[w15++]
.LCFI33:
	mov.d	w4,w8
	.loc 1 4271 0
	mov	w0,[w15-12]
	mov	w1,[w15-10]
	mov	w2,[w15-8]
	mov	w3,[w15-6]
	rcall	_vPortEnterCritical
	.loc 1 4274 0
	mov	_pxCurrentTCB,w4
	mov.b	[w4+40],w4
	mov	[w15-12],w0
	mov	[w15-10],w1
	mov	[w15-8],w2
	mov	[w15-6],w3
	sub.b	w4,#2,[w15]
	.set ___BP___,28
	bra	z,.L296
	.loc 1 4279 0
	mov	_pxCurrentTCB,w6
	mov	[w6+36],w4
	mov	[w6+38],w5
	com	w0,w0
	com	w1,w1
	and	w4,w0,w7
	and	w5,w1,w4
	mov	w4,w5
	mov	w7,w4
	mov	w4,[w6+36]
	mov	w5,[w6+38]
	.loc 1 4282 0
	mov	_pxCurrentTCB,w0
	mov.b	#1,w1
	mov.b	w1,[w0+40]
	.loc 1 4284 0
	cp0	w9
	.set ___BP___,29
	bra	nz,.L301
.L296:
	.loc 1 4305 0
	mov	w2,[w15-8]
	mov	w3,[w15-6]
	rcall	_vPortExitCritical
	.loc 1 4307 0
	rcall	_vPortEnterCritical
	.loc 1 4311 0
	mov	[w15-8],w2
	mov	[w15-6],w3
	cp0	w8
	.set ___BP___,15
	bra	z,.L297
	.loc 1 4315 0
	mov	_pxCurrentTCB,w0
	mov	[w0+36],w4
	mov	[w0+38],w5
	mov.d	w4,[w8]
.L297:
	.loc 1 4322 0
	mov	_pxCurrentTCB,w0
	mov.b	[w0+40],w0
	.loc 1 4325 0
	clr	w8
	.loc 1 4322 0
	sub.b	w0,#1,[w15]
	.set ___BP___,19
	bra	z,.L298
	.loc 1 4331 0
	mov	_pxCurrentTCB,w4
	mov	[w4+36],w0
	mov	[w4+38],w1
	com	w2,w2
	com	w3,w3
	and	w0,w2,w5
	and	w1,w3,w2
	mov	w2,w3
	mov	w5,w2
	mov	w2,[w4+36]
	mov	w3,[w4+38]
	.loc 1 4332 0
	mov	#1,w8
.L298:
	.loc 1 4335 0
	mov	_pxCurrentTCB,w0
	clr.b	w1
	mov.b	w1,[w0+40]
	.loc 1 4337 0
	rcall	_vPortExitCritical
	.loc 1 4340 0
	mov	w8,w0
	mov.d	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.L301:
	.loc 1 4286 0
	mov	#1,w1
	mov	w9,w0
	mov	w2,[w15-8]
	mov	w3,[w15-6]
	rcall	_prvAddCurrentTaskToDelayedList
	.loc 1 4293 0
; 4293 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
	mov	[w15-6],w3
	mov	[w15-8],w2
	bra	.L296
.LFE39:
	.size	_xTaskNotifyWait, .-_xTaskNotifyWait
	.align	2
	.global	_xTaskGenericNotify	; export
	.type	_xTaskGenericNotify,@function
_xTaskGenericNotify:
.LFB40:
	.loc 1 4348 0
	.set ___PA___,0
	lnk	#4
.LCFI34:
	mov.d	w8,[w15++]
.LCFI35:
	mov	w10,[w15++]
.LCFI36:
	mov.d	w0,w8
	mov	w4,w10
	.loc 1 4356 0
	mov	w2,[w15-10]
	mov	w3,[w15-8]
	rcall	_vPortEnterCritical
	.loc 1 4358 0
	mov	[w15-10],w2
	mov	[w15-8],w3
	cp0	w10
	.set ___BP___,15
	bra	z,.L304
	.loc 1 4360 0
	mov	[w8+36],w0
	mov	[w8+38],w1
	mov.d	w0,[w10]
.L304:
	.loc 1 4363 0
	mov.b	[w8+40],w0
	.loc 1 4365 0
	mov.b	#2,w1
	mov.b	w1,[w8+40]
	.loc 1 4367 0
	sub	w9,#2,[w15]
	.set ___BP___,29
	bra	z,.L307
	.set ___BP___,50
	bra	leu,.L318
	sub	w9,#3,[w15]
	.set ___BP___,29
	bra	z,.L316
	sub	w9,#4,[w15]
	.set ___BP___,29
	bra	z,.L319
.L305:
	.loc 1 4403 0
	mov	#1,w9
	sub.b	w0,#1,[w15]
	.set ___BP___,21
	bra	z,.L320
.L311:
	.loc 1 4443 0
	rcall	_vPortExitCritical
	.loc 1 4446 0
	mov	w9,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
.L321:
	.set ___PA___,0
.L318:
	.loc 1 4367 0
	sub	w9,#1,[w15]
	.set ___BP___,71
	bra	nz,.L305
	.loc 1 4370 0
	mov	[w8+36],w4
	mov	[w8+38],w5
	ior	w2,w4,w2
	ior	w3,w5,w3
	mov	w2,[w8+36]
	mov	w3,[w8+38]
	.loc 1 4403 0
	mov	#1,w9
	sub.b	w0,#1,[w15]
	.set ___BP___,78
	bra	nz,.L311
	bra	.L320
.L319:
	.loc 1 4389 0
	clr	w9
	.loc 1 4382 0
	sub.b	w0,#2,[w15]
	.set ___BP___,28
	bra	z,.L311
.L316:
	.loc 1 4384 0
	mov	w2,[w8+36]
	mov	w3,[w8+38]
	.loc 1 4403 0
	mov	#1,w9
	sub.b	w0,#1,[w15]
	.set ___BP___,78
	bra	nz,.L311
	bra	.L320
.L307:
	.loc 1 4374 0
	mov	[w8+36],w2
	mov	[w8+38],w3
	add	w2,#1,w2
	addc	w3,#0,w3
	mov	w2,[w8+36]
	mov	w3,[w8+38]
	.loc 1 4403 0
	mov	#1,w9
	sub.b	w0,#1,[w15]
	.set ___BP___,78
	bra	nz,.L311
.L320:
	.loc 1 4405 0
	inc2	w8,w9
	mov	w9,w0
	rcall	_uxListRemove
	.loc 1 4406 0
	mov	[w8+22],w0
	cp	_uxTopReadyPriority
	.set ___BP___,50
	bra	geu,.L312
	mov	w0,_uxTopReadyPriority
.L312:
	mulw.su	w0,#10,w0
	mov	#_pxReadyTasksLists,w1
	add	w0,w1,w0
	mov	w9,w1
	rcall	_vListInsertEnd
	.loc 1 4427 0
	mov	_pxCurrentTCB,w0
	mov	[w8+22],w1
	mov	[w0+22],w0
	mov	#1,w9
	sub	w1,w0,[w15]
	.set ___BP___,39
	bra	leu,.L311
	.loc 1 4431 0
; 4431 "../../source/tasks.c" 1
	CALL _vPortYield			
NOP					  
	.loc 1 4443 0
	rcall	_vPortExitCritical
	.loc 1 4446 0
	mov	w9,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
	bra	.L321
.LFE40:
	.size	_xTaskGenericNotify, .-_xTaskGenericNotify
	.align	2
	.global	_xTaskGenericNotifyFromISR	; export
	.type	_xTaskGenericNotifyFromISR,@function
_xTaskGenericNotifyFromISR:
.LFB41:
	.loc 1 4454 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI37:
	mov	w10,[w15++]
.LCFI38:
	mov	w0,w8
	mov	w5,w9
	.loc 1 4484 0
	cp0	w4
	.set ___BP___,15
	bra	z,.L324
	.loc 1 4486 0
	mov	[w8+36],w6
	mov	[w8+38],w7
	mov.d	w6,[w4]
.L324:
	.loc 1 4489 0
	mov.b	[w8+40],w4
	.loc 1 4490 0
	mov.b	#2,w0
	mov.b	w0,[w8+40]
	.loc 1 4492 0
	sub	w1,#2,[w15]
	.set ___BP___,29
	bra	z,.L327
	.set ___BP___,50
	bra	leu,.L341
	sub	w1,#3,[w15]
	.set ___BP___,29
	bra	z,.L339
	sub	w1,#4,[w15]
	.set ___BP___,29
	bra	z,.L342
.L325:
	.loc 1 4528 0
	mov	#1,w0
	sub.b	w4,#1,[w15]
	.set ___BP___,40
	bra	z,.L343
.L331:
	.loc 1 4570 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
.L344:
	.set ___PA___,0
.L341:
	.loc 1 4492 0
	sub	w1,#1,[w15]
	.set ___BP___,71
	bra	nz,.L325
	.loc 1 4495 0
	mov	[w8+36],w0
	mov	[w8+38],w1
	ior	w2,w0,w2
	ior	w3,w1,w3
	mov	w2,[w8+36]
	mov	w3,[w8+38]
	.loc 1 4528 0
	mov	#1,w0
	sub.b	w4,#1,[w15]
	.set ___BP___,59
	bra	nz,.L331
.L343:
	.loc 1 4533 0
	cp0	_uxSchedulerSuspended
	.set ___BP___,50
	bra	nz,.L332
	.loc 1 4535 0
	inc2	w8,w10
	mov	w10,w0
	rcall	_uxListRemove
	.loc 1 4536 0
	mov	[w8+22],w0
	cp	_uxTopReadyPriority
	.set ___BP___,50
	bra	geu,.L333
	mov	w0,_uxTopReadyPriority
.L333:
	mulw.su	w0,#10,w0
	mov	#_pxReadyTasksLists,w1
	add	w0,w1,w0
	mov	w10,w1
	rcall	_vListInsertEnd
.L334:
	.loc 1 4545 0
	mov	_pxCurrentTCB,w0
	mov	[w8+22],w2
	mov	[w0+22],w1
	mov	#1,w0
	sub	w2,w1,[w15]
	.set ___BP___,39
	bra	leu,.L331
	.loc 1 4549 0
	cp0	w9
	.set ___BP___,21
	bra	z,.L335
	.loc 1 4551 0
	mov	w0,[w9]
	.loc 1 4570 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L344
.L342:
	.loc 1 4514 0
	clr	w0
	.loc 1 4507 0
	sub.b	w4,#2,[w15]
	.set ___BP___,28
	bra	z,.L331
.L339:
	.loc 1 4509 0
	mov	w2,[w8+36]
	mov	w3,[w8+38]
	.loc 1 4528 0
	mov	#1,w0
	sub.b	w4,#1,[w15]
	.set ___BP___,59
	bra	nz,.L331
	bra	.L343
.L327:
	.loc 1 4499 0
	mov	[w8+36],w0
	mov	[w8+38],w1
	add	w0,#1,w0
	addc	w1,#0,w1
	mov	w0,[w8+36]
	mov	w1,[w8+38]
	.loc 1 4528 0
	mov	#1,w0
	sub.b	w4,#1,[w15]
	.set ___BP___,59
	bra	nz,.L331
	bra	.L343
.L332:
	.loc 1 4542 0
	add	w8,#12,w1
	mov	#_xPendingReadyList,w0
	rcall	_vListInsertEnd
	bra	.L334
.L335:
	.loc 1 4558 0
	mov	w0,_xYieldPending
	.loc 1 4570 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L344
.LFE41:
	.size	_xTaskGenericNotifyFromISR, .-_xTaskGenericNotifyFromISR
	.align	2
	.global	_vTaskNotifyGiveFromISR	; export
	.type	_vTaskNotifyGiveFromISR,@function
_vTaskNotifyGiveFromISR:
.LFB42:
	.loc 1 4578 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI39:
	mov	w10,[w15++]
.LCFI40:
	mov.d	w0,w8
	.loc 1 4607 0
	mov.b	[w8+40],w0
	.loc 1 4608 0
	mov.b	#2,w1
	mov.b	w1,[w8+40]
	.loc 1 4612 0
	mov	[w8+36],w2
	mov	[w8+38],w3
	add	w2,#1,w2
	addc	w3,#0,w3
	mov	w2,[w8+36]
	mov	w3,[w8+38]
	.loc 1 4618 0
	sub.b	w0,#1,[w15]
	.set ___BP___,37
	bra	z,.L353
.L346:
	.loc 1 4658 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
.L354:
	.set ___PA___,0
.L353:
	.loc 1 4623 0
	cp0	_uxSchedulerSuspended
	.set ___BP___,50
	bra	nz,.L348
	.loc 1 4625 0
	inc2	w8,w10
	mov	w10,w0
	rcall	_uxListRemove
	.loc 1 4626 0
	mov	[w8+22],w0
	cp	_uxTopReadyPriority
	.set ___BP___,50
	bra	geu,.L349
	mov	w0,_uxTopReadyPriority
.L349:
	mulw.su	w0,#10,w0
	mov	#_pxReadyTasksLists,w1
	add	w0,w1,w0
	mov	w10,w1
	rcall	_vListInsertEnd
.L350:
	.loc 1 4635 0
	mov	_pxCurrentTCB,w0
	mov	[w8+22],w1
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,39
	bra	leu,.L346
	.loc 1 4639 0
	cp0	w9
	.set ___BP___,21
	bra	z,.L351
	.loc 1 4641 0
	mov	#1,w0
	mov	w0,[w9]
	.loc 1 4658 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L354
.L348:
	.loc 1 4632 0
	add	w8,#12,w1
	mov	#_xPendingReadyList,w0
	rcall	_vListInsertEnd
	bra	.L350
.L351:
	.loc 1 4648 0
	mov	#1,w0
	mov	w0,_xYieldPending
	.loc 1 4658 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L354
.LFE42:
	.size	_vTaskNotifyGiveFromISR, .-_vTaskNotifyGiveFromISR
	.align	2
	.global	_xTaskNotifyStateClear	; export
	.type	_xTaskNotifyStateClear,@function
_xTaskNotifyStateClear:
.LFB43:
	.loc 1 4667 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI41:
	.loc 1 4673 0
	cp0	w0
	.set ___BP___,15
	bra	z,.L362
	mov	w0,w9
	.loc 1 4675 0
	rcall	_vPortEnterCritical
	.loc 1 4677 0
	mov.b	[w9+40],w0
	.loc 1 4684 0
	clr	w8
	.loc 1 4677 0
	sub.b	w0,#2,[w15]
	.set ___BP___,37
	bra	z,.L363
.L359:
	.loc 1 4687 0
	rcall	_vPortExitCritical
	.loc 1 4690 0
	mov	w8,w0
	mov.d	[--w15],w8
	return	
.L364:
	.set ___PA___,0
.L363:
	.loc 1 4679 0
	mov.b	w8,[w9+40]
	.loc 1 4680 0
	mov	#1,w8
	.loc 1 4687 0
	rcall	_vPortExitCritical
	.loc 1 4690 0
	mov	w8,w0
	mov.d	[--w15],w8
	return	
	bra	.L364
.L362:
	.loc 1 4673 0
	mov	_pxCurrentTCB,w9
	.loc 1 4675 0
	rcall	_vPortEnterCritical
	.loc 1 4677 0
	mov.b	[w9+40],w0
	.loc 1 4684 0
	clr	w8
	.loc 1 4677 0
	sub.b	w0,#2,[w15]
	.set ___BP___,62
	bra	nz,.L359
	bra	.L363
.LFE43:
	.size	_xTaskNotifyStateClear, .-_xTaskNotifyStateClear
	.align	2
	.global	_vApplicationGetTimerTaskMemory	; export
	.type	_vApplicationGetTimerTaskMemory,@function
_vApplicationGetTimerTaskMemory:
.LFB45:
	.loc 1 4826 0
	.set ___PA___,1
	.loc 1 4835 0
	mov	#_xTimerTaskTCB.21145,w3
	mov	w3,[w0]
	.loc 1 4838 0
	mov	#_uxTimerTaskStack.21146,w0
	mov	w0,[w1]
	.loc 1 4843 0
	mov	#64,w0
	mov	#0,w1
	mov.d	w0,[w2]
	.loc 1 4844 0
	return	
	.set ___PA___,0
.LFE45:
	.size	_vApplicationGetTimerTaskMemory, .-_vApplicationGetTimerTaskMemory
	.align	2
	.global	_vApplicationGetIdleTaskMemory	; export
	.type	_vApplicationGetIdleTaskMemory,@function
_vApplicationGetIdleTaskMemory:
.LFB46:
	.loc 1 4852 0
	.set ___PA___,1
	.loc 1 4861 0
	mov	#_xIdleTaskTCB.21152,w3
	mov	w3,[w0]
	.loc 1 4864 0
	mov	#_uxIdleTaskStack.21153,w0
	mov	w0,[w1]
	.loc 1 4869 0
	mov	#105,w0
	mov	#0,w1
	mov.d	w0,[w2]
	.loc 1 4870 0
	return	
	.set ___PA___,0
.LFE46:
	.size	_vApplicationGetIdleTaskMemory, .-_vApplicationGetIdleTaskMemory
	.global	_pxCurrentTCB	; export
	.section	.nbss,bss,near
	.align	2
	.type	_pxCurrentTCB,@object
	.size	_pxCurrentTCB, 2
_pxCurrentTCB:
	.skip	2
	.section	.bss,bss
	.align	2
	.type	_uxIdleTaskStack.21153,@object
	.size	_uxIdleTaskStack.21153, 210
_uxIdleTaskStack.21153:
	.skip	210
	.align	2
	.type	_xIdleTaskTCB.21152,@object
	.size	_xIdleTaskTCB.21152, 42
_xIdleTaskTCB.21152:
	.skip	42
	.align	2
	.type	_uxTimerTaskStack.21146,@object
	.size	_uxTimerTaskStack.21146, 128
_uxTimerTaskStack.21146:
	.skip	128
	.align	2
	.type	_xTimerTaskTCB.21145,@object
	.size	_xTimerTaskTCB.21145, 42
_xTimerTaskTCB.21145:
	.skip	42
	.section	.nbss,bss,near
	.align	2
	.type	_uxSchedulerSuspended,@object
	.size	_uxSchedulerSuspended, 2
_uxSchedulerSuspended:
	.skip	2
	.align	2
	.type	_uxTopReadyPriority,@object
	.size	_uxTopReadyPriority, 2
_uxTopReadyPriority:
	.skip	2
	.section	.bss,bss
	.align	2
	.type	_pxReadyTasksLists,@object
	.size	_pxReadyTasksLists, 40
_pxReadyTasksLists:
	.skip	40
	.align	2
	.type	_xPendingReadyList,@object
	.size	_xPendingReadyList, 10
_xPendingReadyList:
	.skip	10
	.section	.nbss,bss,near
	.align	2
	.type	_xYieldPending,@object
	.size	_xYieldPending, 2
_xYieldPending:
	.skip	2
	.align	2
	.type	_xTickCount,@object
	.size	_xTickCount, 2
_xTickCount:
	.skip	2
	.section	.bss,bss
	.align	2
	.type	_xSuspendedTaskList,@object
	.size	_xSuspendedTaskList, 10
_xSuspendedTaskList:
	.skip	10
	.section	.nbss,bss,near
	.align	2
	.type	_pxOverflowDelayedTaskList,@object
	.size	_pxOverflowDelayedTaskList, 2
_pxOverflowDelayedTaskList:
	.skip	2
	.align	2
	.type	_pxDelayedTaskList,@object
	.size	_pxDelayedTaskList, 2
_pxDelayedTaskList:
	.skip	2
	.align	2
	.type	_xNextTaskUnblockTime,@object
	.size	_xNextTaskUnblockTime, 2
_xNextTaskUnblockTime:
	.skip	2
	.align	2
	.type	_xSchedulerRunning,@object
	.size	_xSchedulerRunning, 2
_xSchedulerRunning:
	.skip	2
	.align	2
	.type	_xNumOfOverflows,@object
	.size	_xNumOfOverflows, 2
_xNumOfOverflows:
	.skip	2
	.align	2
	.type	_uxPendedTicks,@object
	.size	_uxPendedTicks, 2
_uxPendedTicks:
	.skip	2
	.align	2
	.type	_uxCurrentNumberOfTasks,@object
	.size	_uxCurrentNumberOfTasks, 2
_uxCurrentNumberOfTasks:
	.skip	2
	.align	2
	.type	_xIdleTaskHandle,@object
	.size	_xIdleTaskHandle, 2
_xIdleTaskHandle:
	.skip	2
	.align	2
	.type	_uxTaskNumber,@object
	.size	_uxTaskNumber, 2
_uxTaskNumber:
	.skip	2
	.section	.bss,bss
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
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI0-.LFB44
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.align	4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI2-.LFB0
	.byte	0x13
	.sleb128 -5
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0x13
	.sleb128 -7
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0x13
	.sleb128 -9
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0x13
	.sleb128 -11
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0x13
	.sleb128 -12
	.byte	0x8e
	.uleb128 0xb
	.byte	0x8c
	.uleb128 0x9
	.byte	0x8a
	.uleb128 0x7
	.byte	0x88
	.uleb128 0x5
	.align	4
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI7-.LFB5
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0x13
	.sleb128 -6
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI9-.LFB8
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0x88
	.uleb128 0x4
	.align	4
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI11-.LFB9
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.align	4
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.align	4
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.align	4
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI13-.LFB14
	.byte	0x13
	.sleb128 -3
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.align	4
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.align	4
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.align	4
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI14-.LFB18
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0x13
	.sleb128 -6
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0x13
	.sleb128 -7
	.byte	0x8c
	.uleb128 0x6
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI17-.LFB13
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0x13
	.sleb128 -6
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.align	4
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.align	4
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.align	4
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI19-.LFB6
	.byte	0x13
	.sleb128 -4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x4
	.4byte	.LCFI20-.LFB20
	.byte	0x13
	.sleb128 -3
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x4
	.4byte	.LCFI21-.LFB21
	.byte	0x13
	.sleb128 -3
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x4
	.4byte	.LCFI22-.LFB22
	.byte	0x13
	.sleb128 -4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x4
	.4byte	.LCFI23-.LFB23
	.byte	0x13
	.sleb128 -4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x4
	.4byte	.LCFI24-.LFB24
	.byte	0x13
	.sleb128 -4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.align	4
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x4
	.4byte	.LCFI25-.LFB26
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.align	4
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.align	4
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.align	4
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI27-.LFB34
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI29-.LFB35
	.byte	0x13
	.sleb128 -4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.align	4
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.align	4
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI30-.LFB38
	.byte	0x13
	.sleb128 -3
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x3
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI32-.LFB39
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0x88
	.uleb128 0x7
	.align	4
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI34-.LFB40
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI36-.LCFI34
	.byte	0x8a
	.uleb128 0x7
	.byte	0x88
	.uleb128 0x5
	.align	4
.LEFDE70:
.LSFDE72:
	.4byte	.LEFDE72-.LASFDE72
.LASFDE72:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI37-.LFB41
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE72:
.LSFDE74:
	.4byte	.LEFDE74-.LASFDE74
.LASFDE74:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI39-.LFB42
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE74:
.LSFDE76:
	.4byte	.LEFDE76-.LASFDE76
.LASFDE76:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI41-.LFB43
	.byte	0x13
	.sleb128 -4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE76:
.LSFDE78:
	.4byte	.LEFDE78-.LASFDE78
.LASFDE78:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.align	4
.LEFDE78:
.LSFDE80:
	.4byte	.LEFDE80-.LASFDE80
.LASFDE80:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.align	4
.LEFDE80:
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
	.4byte	0x1f6f
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../../source/tasks.c"
	.asciz	"C:\\Users\\Filippo\\Desktop\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1"
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
	.4byte	0xeb
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"long int"
	.uleb128 0x4
	.asciz	"size_t"
	.byte	0x3
	.byte	0x24
	.4byte	0x102
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"signed char"
	.uleb128 0x4
	.asciz	"uint8_t"
	.byte	0x4
	.byte	0x2b
	.4byte	0x148
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x4
	.byte	0x31
	.4byte	0xeb
	.uleb128 0x4
	.asciz	"uint32_t"
	.byte	0x4
	.byte	0x37
	.4byte	0x179
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.byte	0x87
	.4byte	0x277
	.uleb128 0x6
	.asciz	"C"
	.byte	0x5
	.byte	0x88
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x2b6
	.uleb128 0x6
	.asciz	"IPL0"
	.byte	0x5
	.byte	0x99
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x159
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
	.4byte	0x2c9
	.uleb128 0x8
	.4byte	0x18e
	.uleb128 0x8
	.4byte	0x277
	.byte	0x0
	.uleb128 0x9
	.asciz	"tagSRBITS"
	.byte	0x2
	.byte	0x5
	.byte	0x85
	.4byte	0x2e4
	.uleb128 0xa
	.4byte	0x2b6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x4
	.asciz	"SRBITS"
	.byte	0x5
	.byte	0x9e
	.4byte	0x2c9
	.uleb128 0x4
	.asciz	"TaskFunction_t"
	.byte	0x6
	.byte	0x4d
	.4byte	0x308
	.uleb128 0xb
	.byte	0x2
	.4byte	0x30e
	.uleb128 0xc
	.byte	0x1
	.4byte	0x31a
	.uleb128 0xd
	.4byte	0xa8
	.byte	0x0
	.uleb128 0x4
	.asciz	"StackType_t"
	.byte	0x7
	.byte	0x60
	.4byte	0x159
	.uleb128 0x4
	.asciz	"BaseType_t"
	.byte	0x7
	.byte	0x61
	.4byte	0x33f
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"UBaseType_t"
	.byte	0x7
	.byte	0x62
	.4byte	0xd5
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x7
	.byte	0x65
	.4byte	0x159
	.uleb128 0xe
	.asciz	"xSTATIC_LIST_ITEM"
	.byte	0xa
	.byte	0x8
	.2byte	0x370
	.4byte	0x3b4
	.uleb128 0xf
	.asciz	"xDummy1"
	.byte	0x8
	.2byte	0x372
	.4byte	0x35f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xf
	.asciz	"pvDummy2"
	.byte	0x8
	.2byte	0x373
	.4byte	0x3b4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x10
	.4byte	0xa8
	.4byte	0x3c4
	.uleb128 0x11
	.4byte	0xeb
	.byte	0x3
	.byte	0x0
	.uleb128 0x12
	.asciz	"StaticListItem_t"
	.byte	0x8
	.2byte	0x375
	.4byte	0x371
	.uleb128 0xe
	.asciz	"xSTATIC_TCB"
	.byte	0x2a
	.byte	0x8
	.2byte	0x394
	.4byte	0x4a9
	.uleb128 0xf
	.asciz	"pxDummy1"
	.byte	0x8
	.2byte	0x396
	.4byte	0xa8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xf
	.asciz	"xDummy3"
	.byte	0x8
	.2byte	0x39a
	.4byte	0x4a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xf
	.asciz	"uxDummy5"
	.byte	0x8
	.2byte	0x39b
	.4byte	0x34c
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xf
	.asciz	"pxDummy6"
	.byte	0x8
	.2byte	0x39c
	.4byte	0xa8
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xf
	.asciz	"ucDummy7"
	.byte	0x8
	.2byte	0x39d
	.4byte	0x4b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xf
	.asciz	"pxDummy8"
	.byte	0x8
	.2byte	0x39f
	.4byte	0xa8
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xf
	.asciz	"uxDummy12"
	.byte	0x8
	.2byte	0x3a8
	.4byte	0x4c9
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xf
	.asciz	"ulDummy18"
	.byte	0x8
	.2byte	0x3b7
	.4byte	0x169
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xf
	.asciz	"ucDummy19"
	.byte	0x8
	.2byte	0x3b8
	.4byte	0x139
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x10
	.4byte	0x3c4
	.4byte	0x4b9
	.uleb128 0x11
	.4byte	0xeb
	.byte	0x1
	.byte	0x0
	.uleb128 0x10
	.4byte	0x139
	.4byte	0x4c9
	.uleb128 0x11
	.4byte	0xeb
	.byte	0x3
	.byte	0x0
	.uleb128 0x10
	.4byte	0x34c
	.4byte	0x4d9
	.uleb128 0x11
	.4byte	0xeb
	.byte	0x1
	.byte	0x0
	.uleb128 0x12
	.asciz	"StaticTask_t"
	.byte	0x8
	.2byte	0x3be
	.4byte	0x3dd
	.uleb128 0x9
	.asciz	"xLIST_ITEM"
	.byte	0xa
	.byte	0x9
	.byte	0xb5
	.4byte	0x557
	.uleb128 0x13
	.4byte	.LASF0
	.byte	0x9
	.byte	0xb8
	.4byte	0x35f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.asciz	"pxNext"
	.byte	0x9
	.byte	0xb9
	.4byte	0x557
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x13
	.4byte	.LASF1
	.byte	0x9
	.byte	0xba
	.4byte	0x557
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x14
	.asciz	"pvOwner"
	.byte	0x9
	.byte	0xbb
	.4byte	0xa8
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x14
	.asciz	"pvContainer"
	.byte	0x9
	.byte	0xbc
	.4byte	0xa8
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x4ee
	.uleb128 0x4
	.asciz	"ListItem_t"
	.byte	0x9
	.byte	0xbf
	.4byte	0x4ee
	.uleb128 0x9
	.asciz	"xMINI_LIST_ITEM"
	.byte	0x6
	.byte	0x9
	.byte	0xc1
	.4byte	0x5b5
	.uleb128 0x13
	.4byte	.LASF0
	.byte	0x9
	.byte	0xc4
	.4byte	0x35f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.asciz	"pxNext"
	.byte	0x9
	.byte	0xc5
	.4byte	0x557
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x13
	.4byte	.LASF1
	.byte	0x9
	.byte	0xc6
	.4byte	0x557
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.asciz	"MiniListItem_t"
	.byte	0x9
	.byte	0xc8
	.4byte	0x56f
	.uleb128 0x9
	.asciz	"xLIST"
	.byte	0xa
	.byte	0x9
	.byte	0xcd
	.4byte	0x619
	.uleb128 0x14
	.asciz	"uxNumberOfItems"
	.byte	0x9
	.byte	0xd0
	.4byte	0x34c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.asciz	"pxIndex"
	.byte	0x9
	.byte	0xd1
	.4byte	0x619
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x14
	.asciz	"xListEnd"
	.byte	0x9
	.byte	0xd2
	.4byte	0x5b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x55d
	.uleb128 0x4
	.asciz	"List_t"
	.byte	0x9
	.byte	0xd4
	.4byte	0x5cb
	.uleb128 0x4
	.asciz	"TaskHandle_t"
	.byte	0xa
	.byte	0x67
	.4byte	0xa8
	.uleb128 0x15
	.byte	0x2
	.byte	0xa
	.byte	0x7c
	.4byte	0x6a3
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
	.4byte	0x641
	.uleb128 0x9
	.asciz	"xTIME_OUT"
	.byte	0x4
	.byte	0xa
	.byte	0x87
	.4byte	0x6fe
	.uleb128 0x14
	.asciz	"xOverflowCount"
	.byte	0xa
	.byte	0x89
	.4byte	0x32d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.asciz	"xTimeOnEntering"
	.byte	0xa
	.byte	0x8a
	.4byte	0x35f
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x4
	.asciz	"TimeOut_t"
	.byte	0xa
	.byte	0x8b
	.4byte	0x6b8
	.uleb128 0x9
	.asciz	"xMEMORY_REGION"
	.byte	0xa
	.byte	0xa
	.byte	0x90
	.4byte	0x770
	.uleb128 0x14
	.asciz	"pvBaseAddress"
	.byte	0xa
	.byte	0x92
	.4byte	0xa8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.asciz	"ulLengthInBytes"
	.byte	0xa
	.byte	0x93
	.4byte	0x169
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x14
	.asciz	"ulParameters"
	.byte	0xa
	.byte	0x94
	.4byte	0x169
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0x0
	.uleb128 0x4
	.asciz	"MemoryRegion_t"
	.byte	0xa
	.byte	0x95
	.4byte	0x70f
	.uleb128 0x17
	.4byte	0x78b
	.uleb128 0xb
	.byte	0x2
	.4byte	0x791
	.uleb128 0x17
	.4byte	0x796
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0xb
	.byte	0x2
	.4byte	0x31a
	.uleb128 0xe
	.asciz	"tskTaskControlBlock"
	.byte	0x2a
	.byte	0x1
	.2byte	0x125
	.4byte	0x8bc
	.uleb128 0x18
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x127
	.4byte	0x8bc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xf
	.asciz	"xStateListItem"
	.byte	0x1
	.2byte	0x12d
	.4byte	0x55d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xf
	.asciz	"xEventListItem"
	.byte	0x1
	.2byte	0x12e
	.4byte	0x55d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x18
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x12f
	.4byte	0x34c
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xf
	.asciz	"pxStack"
	.byte	0x1
	.2byte	0x130
	.4byte	0x79e
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xf
	.asciz	"pcTaskName"
	.byte	0x1
	.2byte	0x131
	.4byte	0x8c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xf
	.asciz	"pxEndOfStack"
	.byte	0x1
	.2byte	0x134
	.4byte	0x79e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xf
	.asciz	"uxBasePriority"
	.byte	0x1
	.2byte	0x141
	.4byte	0x34c
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xf
	.asciz	"uxMutexesHeld"
	.byte	0x1
	.2byte	0x142
	.4byte	0x34c
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xf
	.asciz	"ulNotifiedValue"
	.byte	0x1
	.2byte	0x15d
	.4byte	0x8d7
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xf
	.asciz	"ucNotifyState"
	.byte	0x1
	.2byte	0x15e
	.4byte	0x8dc
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x8c2
	.uleb128 0x19
	.4byte	0x31a
	.uleb128 0x10
	.4byte	0x796
	.4byte	0x8d7
	.uleb128 0x11
	.4byte	0xeb
	.byte	0x3
	.byte	0x0
	.uleb128 0x19
	.4byte	0x169
	.uleb128 0x19
	.4byte	0x139
	.uleb128 0x12
	.asciz	"tskTCB"
	.byte	0x1
	.2byte	0x16b
	.4byte	0x7a4
	.uleb128 0x12
	.asciz	"TCB_t"
	.byte	0x1
	.2byte	0x16f
	.4byte	0x8e1
	.uleb128 0x1a
	.asciz	"prvCheckTasksWaitingTermination"
	.byte	0x1
	.2byte	0xd29
	.byte	0x1
	.byte	0x1
	.uleb128 0x1b
	.asciz	"prvInitialiseNewTask"
	.byte	0x1
	.2byte	0x2ff
	.byte	0x1
	.byte	0x1
	.4byte	0x9cb
	.uleb128 0x1c
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x2ff
	.4byte	0x2f2
	.uleb128 0x1d
	.asciz	"pcName"
	.byte	0x1
	.2byte	0x300
	.4byte	0x786
	.uleb128 0x1d
	.asciz	"ulStackDepth"
	.byte	0x1
	.2byte	0x301
	.4byte	0x9cb
	.uleb128 0x1c
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x302
	.4byte	0x9d0
	.uleb128 0x1c
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x303
	.4byte	0x34c
	.uleb128 0x1c
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x304
	.4byte	0x9d5
	.uleb128 0x1c
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x305
	.4byte	0x9e0
	.uleb128 0x1d
	.asciz	"xRegions"
	.byte	0x1
	.2byte	0x306
	.4byte	0x9e6
	.uleb128 0x1e
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x308
	.4byte	0x79e
	.uleb128 0x1f
	.asciz	"x"
	.byte	0x1
	.2byte	0x309
	.4byte	0x34c
	.byte	0x0
	.uleb128 0x17
	.4byte	0x169
	.uleb128 0x17
	.4byte	0xa8
	.uleb128 0x17
	.4byte	0x9da
	.uleb128 0xb
	.byte	0x2
	.4byte	0x62d
	.uleb128 0xb
	.byte	0x2
	.4byte	0x8f0
	.uleb128 0x17
	.4byte	0x9eb
	.uleb128 0xb
	.byte	0x2
	.4byte	0x9f1
	.uleb128 0x17
	.4byte	0x770
	.uleb128 0x1b
	.asciz	"prvInitialiseTaskLists"
	.byte	0x1
	.2byte	0xd09
	.byte	0x1
	.byte	0x1
	.4byte	0xa24
	.uleb128 0x1e
	.4byte	.LASF3
	.byte	0x1
	.2byte	0xd0b
	.4byte	0x34c
	.byte	0x0
	.uleb128 0x20
	.asciz	"prvTaskIsTaskSuspended"
	.byte	0x1
	.2byte	0x678
	.byte	0x1
	.4byte	0x32d
	.byte	0x1
	.4byte	0xa70
	.uleb128 0x1d
	.asciz	"xTask"
	.byte	0x1
	.2byte	0x678
	.4byte	0xa70
	.uleb128 0x1e
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x67a
	.4byte	0x32d
	.uleb128 0x1e
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x67b
	.4byte	0xa75
	.byte	0x0
	.uleb128 0x17
	.4byte	0x62d
	.uleb128 0x17
	.4byte	0xa7a
	.uleb128 0xb
	.byte	0x2
	.4byte	0xa80
	.uleb128 0x17
	.4byte	0x8f0
	.uleb128 0x1b
	.asciz	"prvResetNextTaskUnblockTime"
	.byte	0x1
	.2byte	0xe37
	.byte	0x1
	.byte	0x1
	.4byte	0xab8
	.uleb128 0x1e
	.4byte	.LASF9
	.byte	0x1
	.2byte	0xe39
	.4byte	0x9e0
	.byte	0x0
	.uleb128 0x21
	.byte	0x1
	.asciz	"vTaskSuspendAll"
	.byte	0x1
	.2byte	0x798
	.byte	0x1
	.byte	0x1
	.uleb128 0x22
	.byte	0x1
	.asciz	"vTaskSetTimeOutState"
	.byte	0x1
	.2byte	0xbc3
	.byte	0x1
	.byte	0x1
	.4byte	0xafc
	.uleb128 0x1c
	.4byte	.LASF10
	.byte	0x1
	.2byte	0xbc3
	.4byte	0xafc
	.byte	0x0
	.uleb128 0x17
	.4byte	0xb01
	.uleb128 0xb
	.byte	0x2
	.4byte	0x6fe
	.uleb128 0x23
	.asciz	"prvAddCurrentTaskToDelayedList"
	.byte	0x1
	.2byte	0x1258
	.byte	0x1
	.4byte	.LFB44
	.4byte	.LFE44
	.byte	0x1
	.byte	0x5f
	.4byte	0xb84
	.uleb128 0x24
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x1258
	.4byte	0x35f
	.byte	0x1
	.byte	0x58
	.uleb128 0x25
	.asciz	"xCanBlockIndefinitely"
	.byte	0x1
	.2byte	0x1258
	.4byte	0xb84
	.byte	0x1
	.byte	0x5a
	.uleb128 0x26
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x125a
	.4byte	0x35f
	.byte	0x1
	.byte	0x58
	.uleb128 0x26
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x125b
	.4byte	0xb89
	.byte	0x1
	.byte	0x59
	.byte	0x0
	.uleb128 0x17
	.4byte	0x32d
	.uleb128 0x17
	.4byte	0x35f
	.uleb128 0x23
	.asciz	"prvIdleTask"
	.byte	0x1
	.2byte	0xc3f
	.byte	0x1
	.4byte	.LFB28
	.4byte	.LFE28
	.byte	0x1
	.byte	0x5f
	.4byte	0xbe2
	.uleb128 0x24
	.4byte	.LASF5
	.byte	0x1
	.2byte	0xc3f
	.4byte	0xa8
	.byte	0x1
	.byte	0x50
	.uleb128 0x27
	.4byte	.LBB30
	.4byte	.LBE30
	.uleb128 0x28
	.byte	0x1
	.asciz	"vApplicationIdleHook"
	.byte	0x1
	.2byte	0xc6f
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.asciz	"prvAddNewTaskToReadyList"
	.byte	0x1
	.2byte	0x3c3
	.byte	0x1
	.byte	0x1
	.4byte	0xc12
	.uleb128 0x1c
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x3c3
	.4byte	0x9e0
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskCreate"
	.byte	0x1
	.2byte	0x2a4
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5f
	.4byte	0xd31
	.uleb128 0x24
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x2a4
	.4byte	0x2f2
	.byte	0x1
	.byte	0x58
	.uleb128 0x25
	.asciz	"pcName"
	.byte	0x1
	.2byte	0x2a5
	.4byte	0x786
	.byte	0x1
	.byte	0x59
	.uleb128 0x25
	.asciz	"usStackDepth"
	.byte	0x1
	.2byte	0x2a6
	.4byte	0xd31
	.byte	0x1
	.byte	0x5a
	.uleb128 0x24
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x2a7
	.4byte	0x9d0
	.byte	0x1
	.byte	0x5e
	.uleb128 0x24
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x2a8
	.4byte	0x34c
	.byte	0x2
	.byte	0x7f
	.sleb128 -18
	.uleb128 0x24
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x2a9
	.4byte	0x9d5
	.byte	0x1
	.byte	0x5d
	.uleb128 0x26
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x2ab
	.4byte	0x9e0
	.byte	0x1
	.byte	0x5b
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x2ac
	.4byte	0x32d
	.byte	0x1
	.byte	0x51
	.uleb128 0x2a
	.4byte	0x924
	.4byte	.LBB37
	.4byte	.LBE37
	.4byte	0xcfe
	.uleb128 0x2b
	.4byte	0x997
	.uleb128 0x2b
	.4byte	0x98b
	.uleb128 0x2b
	.4byte	0x97f
	.uleb128 0x2b
	.4byte	0x973
	.uleb128 0x2b
	.4byte	0x95e
	.uleb128 0x2b
	.4byte	0x94f
	.uleb128 0x2b
	.4byte	0x943
	.uleb128 0x27
	.4byte	.LBB39
	.4byte	.LBE39
	.uleb128 0x2c
	.4byte	0x9b4
	.uleb128 0x2d
	.4byte	0x9c0
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.4byte	0xbe2
	.4byte	.LBB42
	.4byte	.LBE42
	.uleb128 0x2b
	.4byte	0xc05
	.uleb128 0x2e
	.4byte	0x9f6
	.4byte	.LBB44
	.4byte	.LBE44
	.uleb128 0x27
	.4byte	.LBB45
	.4byte	.LBE45
	.uleb128 0x2d
	.4byte	0xa17
	.byte	0x1
	.byte	0x5a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x159
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskPrioritySet"
	.byte	0x1
	.2byte	0x57a
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5f
	.4byte	0xde0
	.uleb128 0x25
	.asciz	"xTask"
	.byte	0x1
	.2byte	0x57a
	.4byte	0x62d
	.byte	0x1
	.byte	0x59
	.uleb128 0x25
	.asciz	"uxNewPriority"
	.byte	0x1
	.2byte	0x57a
	.4byte	0x34c
	.byte	0x1
	.byte	0x51
	.uleb128 0x26
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x57c
	.4byte	0x9e0
	.byte	0x1
	.byte	0x59
	.uleb128 0x30
	.asciz	"uxCurrentBasePriority"
	.byte	0x1
	.2byte	0x57d
	.4byte	0x34c
	.byte	0x1
	.byte	0x50
	.uleb128 0x30
	.asciz	"uxPriorityUsedOnEntry"
	.byte	0x1
	.2byte	0x57d
	.4byte	0x34c
	.byte	0x1
	.byte	0x51
	.uleb128 0x26
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x57e
	.4byte	0x32d
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskResume"
	.byte	0x1
	.2byte	0x6a6
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x5f
	.4byte	0xe44
	.uleb128 0x24
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x6a6
	.4byte	0x62d
	.byte	0x1
	.byte	0x50
	.uleb128 0x26
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x6a8
	.4byte	0xe44
	.byte	0x1
	.byte	0x58
	.uleb128 0x2e
	.4byte	0xa24
	.4byte	.LBB49
	.4byte	.LBE49
	.uleb128 0x2b
	.4byte	0xa49
	.uleb128 0x27
	.4byte	.LBB50
	.4byte	.LBE50
	.uleb128 0x2c
	.4byte	0xa57
	.uleb128 0x2c
	.4byte	0xa63
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x9e0
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskResumeFromISR"
	.byte	0x1
	.2byte	0x6dc
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x5f
	.4byte	0xed2
	.uleb128 0x24
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x6dc
	.4byte	0x62d
	.byte	0x1
	.byte	0x50
	.uleb128 0x26
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x6de
	.4byte	0x32d
	.byte	0x1
	.byte	0x58
	.uleb128 0x26
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x6df
	.4byte	0xe44
	.byte	0x1
	.byte	0x59
	.uleb128 0x1e
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x6e0
	.4byte	0x34c
	.uleb128 0x2e
	.4byte	0xa24
	.4byte	.LBB53
	.4byte	.LBE53
	.uleb128 0x2b
	.4byte	0xa49
	.uleb128 0x27
	.4byte	.LBB54
	.4byte	.LBE54
	.uleb128 0x2c
	.4byte	0xa57
	.uleb128 0x2c
	.4byte	0xa63
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskStartScheduler"
	.byte	0x1
	.2byte	0x722
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x5f
	.4byte	0xf07
	.uleb128 0x1e
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x724
	.4byte	0x32d
	.byte	0x0
	.uleb128 0x31
	.byte	0x1
	.asciz	"vTaskEndScheduler"
	.byte	0x1
	.2byte	0x78d
	.byte	0x1
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x1
	.byte	0x5f
	.uleb128 0x32
	.4byte	0xab8
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x1
	.byte	0x5f
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskGetTickCount"
	.byte	0x1
	.2byte	0x84f
	.byte	0x1
	.4byte	0x35f
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x1
	.byte	0x5f
	.4byte	0xf74
	.uleb128 0x30
	.asciz	"xTicks"
	.byte	0x1
	.2byte	0x851
	.4byte	0x35f
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskGetTickCountFromISR"
	.byte	0x1
	.2byte	0x85e
	.byte	0x1
	.4byte	0x35f
	.4byte	.LFB15
	.4byte	.LFE15
	.byte	0x1
	.byte	0x5f
	.4byte	0xfc0
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x860
	.4byte	0x35f
	.byte	0x1
	.byte	0x50
	.uleb128 0x1e
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x861
	.4byte	0x34c
	.byte	0x0
	.uleb128 0x33
	.byte	0x1
	.asciz	"uxTaskGetNumberOfTasks"
	.byte	0x1
	.2byte	0x87d
	.byte	0x1
	.4byte	0x34c
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x1
	.byte	0x5f
	.uleb128 0x29
	.byte	0x1
	.asciz	"pcTaskGetName"
	.byte	0x1
	.2byte	0x885
	.byte	0x1
	.4byte	0x1037
	.4byte	.LFB17
	.4byte	.LFE17
	.byte	0x1
	.byte	0x5f
	.4byte	0x1037
	.uleb128 0x25
	.asciz	"xTaskToQuery"
	.byte	0x1
	.2byte	0x885
	.4byte	0x62d
	.byte	0x1
	.byte	0x50
	.uleb128 0x26
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x887
	.4byte	0x9e0
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x796
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskIncrementTick"
	.byte	0x1
	.2byte	0x9c5
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB18
	.4byte	.LFE18
	.byte	0x1
	.byte	0x5f
	.4byte	0x10ef
	.uleb128 0x26
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x9c7
	.4byte	0x9e0
	.byte	0x1
	.byte	0x58
	.uleb128 0x26
	.4byte	.LASF0
	.byte	0x1
	.2byte	0x9c8
	.4byte	0x35f
	.byte	0x1
	.byte	0x50
	.uleb128 0x30
	.asciz	"xSwitchRequired"
	.byte	0x1
	.2byte	0x9c9
	.4byte	0x32d
	.byte	0x1
	.byte	0x5a
	.uleb128 0x27
	.4byte	.LBB57
	.4byte	.LBE57
	.uleb128 0x26
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x9d2
	.4byte	0xb89
	.byte	0x1
	.byte	0x59
	.uleb128 0x27
	.4byte	.LBB58
	.4byte	.LBE58
	.uleb128 0x30
	.asciz	"pxTemp"
	.byte	0x1
	.2byte	0x9db
	.4byte	0x10ef
	.byte	0x1
	.byte	0x50
	.uleb128 0x2e
	.4byte	0xa85
	.4byte	.LBB59
	.4byte	.LBE59
	.uleb128 0x27
	.4byte	.LBB60
	.4byte	.LBE60
	.uleb128 0x2c
	.4byte	0xaab
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x61f
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskResumeAll"
	.byte	0x1
	.2byte	0x7e1
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x1
	.byte	0x5f
	.4byte	0x117d
	.uleb128 0x26
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x7e3
	.4byte	0x9e0
	.byte	0x1
	.byte	0x58
	.uleb128 0x26
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x7e4
	.4byte	0x32d
	.byte	0x1
	.byte	0x58
	.uleb128 0x2a
	.4byte	0xa85
	.4byte	.LBB65
	.4byte	.LBE65
	.4byte	0x1159
	.uleb128 0x27
	.4byte	.LBB66
	.4byte	.LBE66
	.uleb128 0x2c
	.4byte	0xaab
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.4byte	.LBB68
	.4byte	.LBE68
	.uleb128 0x30
	.asciz	"uxPendedCounts"
	.byte	0x1
	.2byte	0x81c
	.4byte	0x34c
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskDelay"
	.byte	0x1
	.2byte	0x4c8
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5f
	.4byte	0x11d0
	.uleb128 0x25
	.asciz	"xTicksToDelay"
	.byte	0x1
	.2byte	0x4c8
	.4byte	0xb89
	.byte	0x1
	.byte	0x50
	.uleb128 0x26
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x4ca
	.4byte	0x32d
	.byte	0x1
	.byte	0x50
	.uleb128 0x34
	.4byte	0xab8
	.4byte	.LBB72
	.4byte	.LBE72
	.byte	0x0
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskDelayUntil"
	.byte	0x1
	.2byte	0x474
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5f
	.4byte	0x1281
	.uleb128 0x25
	.asciz	"pxPreviousWakeTime"
	.byte	0x1
	.2byte	0x474
	.4byte	0x1281
	.byte	0x1
	.byte	0x50
	.uleb128 0x25
	.asciz	"xTimeIncrement"
	.byte	0x1
	.2byte	0x474
	.4byte	0xb89
	.byte	0x1
	.byte	0x51
	.uleb128 0x26
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x476
	.4byte	0x35f
	.byte	0x1
	.byte	0x51
	.uleb128 0x26
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x477
	.4byte	0x32d
	.byte	0x1
	.byte	0x50
	.uleb128 0x1f
	.asciz	"xShouldDelay"
	.byte	0x1
	.2byte	0x477
	.4byte	0x32d
	.uleb128 0x34
	.4byte	0xab8
	.4byte	.LBB74
	.4byte	.LBE74
	.uleb128 0x27
	.4byte	.LBB76
	.4byte	.LBE76
	.uleb128 0x26
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x481
	.4byte	0xb89
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x1286
	.uleb128 0xb
	.byte	0x2
	.4byte	0x35f
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskSwitchContext"
	.byte	0x1
	.2byte	0xacd
	.byte	0x1
	.4byte	.LFB19
	.4byte	.LFE19
	.byte	0x1
	.byte	0x5f
	.4byte	0x12f4
	.uleb128 0x27
	.4byte	.LBB78
	.4byte	.LBE78
	.uleb128 0x30
	.asciz	"uxTopPriority"
	.byte	0x1
	.2byte	0xafa
	.4byte	0x34c
	.byte	0x1
	.byte	0x52
	.uleb128 0x27
	.4byte	.LBB79
	.4byte	.LBE79
	.uleb128 0x1f
	.asciz	"pxConstList"
	.byte	0x1
	.2byte	0xafa
	.4byte	0x12f4
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x10ef
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskSuspend"
	.byte	0x1
	.2byte	0x61e
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5f
	.4byte	0x135f
	.uleb128 0x25
	.asciz	"xTaskToSuspend"
	.byte	0x1
	.2byte	0x61e
	.4byte	0x62d
	.byte	0x1
	.byte	0x58
	.uleb128 0x26
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x620
	.4byte	0x9e0
	.byte	0x1
	.byte	0x58
	.uleb128 0x2e
	.4byte	0xa85
	.4byte	.LBB82
	.4byte	.LBE82
	.uleb128 0x27
	.4byte	.LBB83
	.4byte	.LBE83
	.uleb128 0x2c
	.4byte	0xaab
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskPlaceOnEventList"
	.byte	0x1
	.2byte	0xb08
	.byte	0x1
	.4byte	.LFB20
	.4byte	.LFE20
	.byte	0x1
	.byte	0x5f
	.4byte	0x13a6
	.uleb128 0x24
	.4byte	.LASF18
	.byte	0x1
	.2byte	0xb08
	.4byte	0x12f4
	.byte	0x1
	.byte	0x50
	.uleb128 0x24
	.4byte	.LASF11
	.byte	0x1
	.2byte	0xb08
	.4byte	0xb89
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskPlaceOnUnorderedEventList"
	.byte	0x1
	.2byte	0xb19
	.byte	0x1
	.4byte	.LFB21
	.4byte	.LFE21
	.byte	0x1
	.byte	0x5f
	.4byte	0x1404
	.uleb128 0x24
	.4byte	.LASF18
	.byte	0x1
	.2byte	0xb19
	.4byte	0x10ef
	.byte	0x1
	.byte	0x50
	.uleb128 0x24
	.4byte	.LASF0
	.byte	0x1
	.2byte	0xb19
	.4byte	0xb89
	.byte	0x1
	.byte	0x51
	.uleb128 0x24
	.4byte	.LASF11
	.byte	0x1
	.2byte	0xb19
	.4byte	0xb89
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskPlaceOnEventListRestricted"
	.byte	0x1
	.2byte	0xb33
	.byte	0x1
	.4byte	.LFB22
	.4byte	.LFE22
	.byte	0x1
	.byte	0x5f
	.4byte	0x1471
	.uleb128 0x24
	.4byte	.LASF18
	.byte	0x1
	.2byte	0xb33
	.4byte	0x12f4
	.byte	0x1
	.byte	0x50
	.uleb128 0x24
	.4byte	.LASF11
	.byte	0x1
	.2byte	0xb33
	.4byte	0x35f
	.byte	0x1
	.byte	0x58
	.uleb128 0x25
	.asciz	"xWaitIndefinitely"
	.byte	0x1
	.2byte	0xb33
	.4byte	0xb84
	.byte	0x1
	.byte	0x59
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskRemoveFromEventList"
	.byte	0x1
	.2byte	0xb52
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB23
	.4byte	.LFE23
	.byte	0x1
	.byte	0x5f
	.4byte	0x14cd
	.uleb128 0x24
	.4byte	.LASF18
	.byte	0x1
	.2byte	0xb52
	.4byte	0x14cd
	.byte	0x1
	.byte	0x50
	.uleb128 0x26
	.4byte	.LASF19
	.byte	0x1
	.2byte	0xb54
	.4byte	0x9e0
	.byte	0x1
	.byte	0x58
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0xb55
	.4byte	0x32d
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x17
	.4byte	0x14d2
	.uleb128 0xb
	.byte	0x2
	.4byte	0x14d8
	.uleb128 0x17
	.4byte	0x61f
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskRemoveFromUnorderedEventList"
	.byte	0x1
	.2byte	0xb96
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB24
	.4byte	.LFE24
	.byte	0x1
	.byte	0x5f
	.4byte	0x155c
	.uleb128 0x25
	.asciz	"pxEventListItem"
	.byte	0x1
	.2byte	0xb96
	.4byte	0x619
	.byte	0x1
	.byte	0x50
	.uleb128 0x24
	.4byte	.LASF0
	.byte	0x1
	.2byte	0xb96
	.4byte	0xb89
	.byte	0x1
	.byte	0x51
	.uleb128 0x26
	.4byte	.LASF19
	.byte	0x1
	.2byte	0xb98
	.4byte	0x9e0
	.byte	0x1
	.byte	0x58
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0xb99
	.4byte	0x32d
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x35
	.4byte	0xacf
	.4byte	.LFB25
	.4byte	.LFE25
	.byte	0x1
	.byte	0x5f
	.4byte	0x1577
	.uleb128 0x36
	.4byte	0xaef
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskCheckForTimeOut"
	.byte	0x1
	.2byte	0xbcb
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB26
	.4byte	.LFE26
	.byte	0x1
	.byte	0x5f
	.4byte	0x1604
	.uleb128 0x24
	.4byte	.LASF10
	.byte	0x1
	.2byte	0xbcb
	.4byte	0xafc
	.byte	0x1
	.byte	0x58
	.uleb128 0x25
	.asciz	"pxTicksToWait"
	.byte	0x1
	.2byte	0xbcb
	.4byte	0x1281
	.byte	0x1
	.byte	0x5a
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0xbcd
	.4byte	0x32d
	.byte	0x1
	.byte	0x59
	.uleb128 0x27
	.4byte	.LBB86
	.4byte	.LBE86
	.uleb128 0x26
	.4byte	.LASF13
	.byte	0x1
	.2byte	0xbd5
	.4byte	0xb89
	.byte	0x1
	.byte	0x52
	.uleb128 0x2e
	.4byte	0xacf
	.4byte	.LBB87
	.4byte	.LBE87
	.uleb128 0x2b
	.4byte	0xaef
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.byte	0x1
	.asciz	"vTaskMissedYield"
	.byte	0x1
	.2byte	0xc08
	.byte	0x1
	.4byte	.LFB27
	.4byte	.LFE27
	.byte	0x1
	.byte	0x5f
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskGetCurrentTaskHandle"
	.byte	0x1
	.2byte	0xe51
	.byte	0x1
	.4byte	0x62d
	.4byte	.LFB32
	.4byte	.LFE32
	.byte	0x1
	.byte	0x5f
	.4byte	0x1666
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0xe53
	.4byte	0x62d
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskGetSchedulerState"
	.byte	0x1
	.2byte	0xe62
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB33
	.4byte	.LFE33
	.byte	0x1
	.byte	0x5f
	.4byte	0x16a4
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0xe64
	.4byte	0x32d
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskPriorityInherit"
	.byte	0x1
	.2byte	0xe7e
	.byte	0x1
	.4byte	.LFB34
	.4byte	.LFE34
	.byte	0x1
	.byte	0x5f
	.4byte	0x16e8
	.uleb128 0x24
	.4byte	.LASF20
	.byte	0x1
	.2byte	0xe7e
	.4byte	0xa70
	.byte	0x1
	.byte	0x58
	.uleb128 0x1e
	.4byte	.LASF9
	.byte	0x1
	.2byte	0xe80
	.4byte	0xe44
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskPriorityDisinherit"
	.byte	0x1
	.2byte	0xec0
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB35
	.4byte	.LFE35
	.byte	0x1
	.byte	0x5f
	.4byte	0x1741
	.uleb128 0x24
	.4byte	.LASF20
	.byte	0x1
	.2byte	0xec0
	.4byte	0xa70
	.byte	0x1
	.byte	0x58
	.uleb128 0x1e
	.4byte	.LASF9
	.byte	0x1
	.2byte	0xec2
	.4byte	0xe44
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0xec3
	.4byte	0x32d
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.asciz	"uxTaskResetEventItemValue"
	.byte	0x1
	.2byte	0x1046
	.byte	0x1
	.4byte	0x35f
	.4byte	.LFB36
	.4byte	.LFE36
	.byte	0x1
	.byte	0x5f
	.4byte	0x1787
	.uleb128 0x30
	.asciz	"uxReturn"
	.byte	0x1
	.2byte	0x1048
	.4byte	0x35f
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x33
	.byte	0x1
	.asciz	"pvTaskIncrementMutexHeldCount"
	.byte	0x1
	.2byte	0x1056
	.byte	0x1
	.4byte	0xa8
	.4byte	.LFB37
	.4byte	.LFE37
	.byte	0x1
	.byte	0x5f
	.uleb128 0x29
	.byte	0x1
	.asciz	"ulTaskNotifyTake"
	.byte	0x1
	.2byte	0x1067
	.byte	0x1
	.4byte	0x169
	.4byte	.LFB38
	.4byte	.LFE38
	.byte	0x1
	.byte	0x5f
	.4byte	0x1825
	.uleb128 0x25
	.asciz	"xClearCountOnExit"
	.byte	0x1
	.2byte	0x1067
	.4byte	0x32d
	.byte	0x1
	.byte	0x58
	.uleb128 0x24
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x1067
	.4byte	0x35f
	.byte	0x1
	.byte	0x5a
	.uleb128 0x30
	.asciz	"ulReturn"
	.byte	0x1
	.2byte	0x1069
	.4byte	0x169
	.byte	0x6
	.byte	0x5a
	.byte	0x93
	.uleb128 0x2
	.byte	0x5b
	.byte	0x93
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskNotifyWait"
	.byte	0x1
	.2byte	0x10ab
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB39
	.4byte	.LFE39
	.byte	0x1
	.byte	0x5f
	.4byte	0x18d0
	.uleb128 0x25
	.asciz	"ulBitsToClearOnEntry"
	.byte	0x1
	.2byte	0x10ab
	.4byte	0x169
	.byte	0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x2
	.byte	0x51
	.byte	0x93
	.uleb128 0x2
	.uleb128 0x25
	.asciz	"ulBitsToClearOnExit"
	.byte	0x1
	.2byte	0x10ab
	.4byte	0x169
	.byte	0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x2
	.byte	0x53
	.byte	0x93
	.uleb128 0x2
	.uleb128 0x25
	.asciz	"pulNotificationValue"
	.byte	0x1
	.2byte	0x10ab
	.4byte	0x18d0
	.byte	0x1
	.byte	0x58
	.uleb128 0x24
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x10ab
	.4byte	0x35f
	.byte	0x1
	.byte	0x59
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x10ad
	.4byte	0x32d
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x169
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskGenericNotify"
	.byte	0x1
	.2byte	0x10fb
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB40
	.4byte	.LFE40
	.byte	0x1
	.byte	0x5f
	.4byte	0x196f
	.uleb128 0x24
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x10fb
	.4byte	0x62d
	.byte	0x1
	.byte	0x58
	.uleb128 0x25
	.asciz	"ulValue"
	.byte	0x1
	.2byte	0x10fb
	.4byte	0x169
	.byte	0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x2
	.byte	0x53
	.byte	0x93
	.uleb128 0x2
	.uleb128 0x25
	.asciz	"eAction"
	.byte	0x1
	.2byte	0x10fb
	.4byte	0x6a3
	.byte	0x1
	.byte	0x59
	.uleb128 0x24
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x10fb
	.4byte	0x18d0
	.byte	0x1
	.byte	0x5a
	.uleb128 0x1e
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x10fd
	.4byte	0x9e0
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x10fe
	.4byte	0x32d
	.byte	0x1
	.byte	0x59
	.uleb128 0x26
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x10ff
	.4byte	0x139
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskGenericNotifyFromISR"
	.byte	0x1
	.2byte	0x1165
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB41
	.4byte	.LFE41
	.byte	0x1
	.byte	0x5f
	.4byte	0x1a29
	.uleb128 0x24
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x1165
	.4byte	0x62d
	.byte	0x1
	.byte	0x58
	.uleb128 0x25
	.asciz	"ulValue"
	.byte	0x1
	.2byte	0x1165
	.4byte	0x169
	.byte	0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x2
	.byte	0x53
	.byte	0x93
	.uleb128 0x2
	.uleb128 0x25
	.asciz	"eAction"
	.byte	0x1
	.2byte	0x1165
	.4byte	0x6a3
	.byte	0x1
	.byte	0x51
	.uleb128 0x24
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x1165
	.4byte	0x18d0
	.byte	0x1
	.byte	0x54
	.uleb128 0x24
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x1165
	.4byte	0x1a29
	.byte	0x1
	.byte	0x59
	.uleb128 0x1e
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1167
	.4byte	0x9e0
	.uleb128 0x26
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x1168
	.4byte	0x139
	.byte	0x1
	.byte	0x54
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x1169
	.4byte	0x32d
	.byte	0x1
	.byte	0x50
	.uleb128 0x1e
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x116a
	.4byte	0x34c
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x32d
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vTaskNotifyGiveFromISR"
	.byte	0x1
	.2byte	0x11e1
	.byte	0x1
	.4byte	.LFB42
	.4byte	.LFE42
	.byte	0x1
	.byte	0x5f
	.4byte	0x1a9d
	.uleb128 0x24
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x11e1
	.4byte	0x62d
	.byte	0x1
	.byte	0x58
	.uleb128 0x24
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x11e1
	.4byte	0x1a29
	.byte	0x1
	.byte	0x59
	.uleb128 0x1e
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x11e3
	.4byte	0x9e0
	.uleb128 0x26
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x11e4
	.4byte	0x139
	.byte	0x1
	.byte	0x50
	.uleb128 0x1e
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x11e5
	.4byte	0x34c
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.asciz	"xTaskNotifyStateClear"
	.byte	0x1
	.2byte	0x123a
	.byte	0x1
	.4byte	0x32d
	.4byte	.LFB43
	.4byte	.LFE43
	.byte	0x1
	.byte	0x5f
	.4byte	0x1af8
	.uleb128 0x25
	.asciz	"xTask"
	.byte	0x1
	.2byte	0x123a
	.4byte	0x62d
	.byte	0x1
	.byte	0x50
	.uleb128 0x26
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x123c
	.4byte	0x9e0
	.byte	0x1
	.byte	0x59
	.uleb128 0x26
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x123d
	.4byte	0x32d
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vApplicationGetTimerTaskMemory"
	.byte	0x1
	.2byte	0x12d7
	.byte	0x1
	.4byte	.LFB45
	.4byte	.LFE45
	.byte	0x1
	.byte	0x5f
	.4byte	0x1bc9
	.uleb128 0x25
	.asciz	"ppxTimerTaskTCBBuffer"
	.byte	0x1
	.2byte	0x12d7
	.4byte	0x1bc9
	.byte	0x1
	.byte	0x50
	.uleb128 0x25
	.asciz	"ppxTimerTaskStackBuffer"
	.byte	0x1
	.2byte	0x12d8
	.4byte	0x1bd5
	.byte	0x1
	.byte	0x51
	.uleb128 0x25
	.asciz	"pulTimerTaskStackSize"
	.byte	0x1
	.2byte	0x12d9
	.4byte	0x18d0
	.byte	0x1
	.byte	0x52
	.uleb128 0x30
	.asciz	"xTimerTaskTCB"
	.byte	0x1
	.2byte	0x12de
	.4byte	0x4d9
	.byte	0x5
	.byte	0x3
	.4byte	_xTimerTaskTCB.21145
	.uleb128 0x30
	.asciz	"uxTimerTaskStack"
	.byte	0x1
	.2byte	0x12df
	.4byte	0x1bdb
	.byte	0x5
	.byte	0x3
	.4byte	_uxTimerTaskStack.21146
	.byte	0x0
	.uleb128 0xb
	.byte	0x2
	.4byte	0x1bcf
	.uleb128 0xb
	.byte	0x2
	.4byte	0x4d9
	.uleb128 0xb
	.byte	0x2
	.4byte	0x79e
	.uleb128 0x10
	.4byte	0x31a
	.4byte	0x1beb
	.uleb128 0x11
	.4byte	0xeb
	.byte	0x3f
	.byte	0x0
	.uleb128 0x2f
	.byte	0x1
	.asciz	"vApplicationGetIdleTaskMemory"
	.byte	0x1
	.2byte	0x12f1
	.byte	0x1
	.4byte	.LFB46
	.4byte	.LFE46
	.byte	0x1
	.byte	0x5f
	.4byte	0x1cb6
	.uleb128 0x25
	.asciz	"ppxIdleTaskTCBBuffer"
	.byte	0x1
	.2byte	0x12f1
	.4byte	0x1bc9
	.byte	0x1
	.byte	0x50
	.uleb128 0x25
	.asciz	"ppxIdleTaskStackBuffer"
	.byte	0x1
	.2byte	0x12f2
	.4byte	0x1bd5
	.byte	0x1
	.byte	0x51
	.uleb128 0x25
	.asciz	"pulIdleTaskStackSize"
	.byte	0x1
	.2byte	0x12f3
	.4byte	0x18d0
	.byte	0x1
	.byte	0x52
	.uleb128 0x30
	.asciz	"xIdleTaskTCB"
	.byte	0x1
	.2byte	0x12f8
	.4byte	0x4d9
	.byte	0x5
	.byte	0x3
	.4byte	_xIdleTaskTCB.21152
	.uleb128 0x30
	.asciz	"uxIdleTaskStack"
	.byte	0x1
	.2byte	0x12f9
	.4byte	0x1cb6
	.byte	0x5
	.byte	0x3
	.4byte	_uxIdleTaskStack.21153
	.byte	0x0
	.uleb128 0x10
	.4byte	0x31a
	.4byte	0x1cc6
	.uleb128 0x11
	.4byte	0xeb
	.byte	0x68
	.byte	0x0
	.uleb128 0x37
	.asciz	"SRbits"
	.byte	0x5
	.byte	0x9f
	.4byte	0x1cd6
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.4byte	0x2e4
	.uleb128 0x38
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x174
	.4byte	0x1ce9
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.4byte	0x9e0
	.uleb128 0x10
	.4byte	0x61f
	.4byte	0x1cfe
	.uleb128 0x11
	.4byte	0xeb
	.byte	0x3
	.byte	0x0
	.uleb128 0x30
	.asciz	"pxReadyTasksLists"
	.byte	0x1
	.2byte	0x177
	.4byte	0x1cee
	.byte	0x5
	.byte	0x3
	.4byte	_pxReadyTasksLists
	.uleb128 0x30
	.asciz	"xDelayedTaskList1"
	.byte	0x1
	.2byte	0x178
	.4byte	0x61f
	.byte	0x5
	.byte	0x3
	.4byte	_xDelayedTaskList1
	.uleb128 0x30
	.asciz	"xDelayedTaskList2"
	.byte	0x1
	.2byte	0x179
	.4byte	0x61f
	.byte	0x5
	.byte	0x3
	.4byte	_xDelayedTaskList2
	.uleb128 0x30
	.asciz	"pxDelayedTaskList"
	.byte	0x1
	.2byte	0x17a
	.4byte	0x1d7e
	.byte	0x5
	.byte	0x3
	.4byte	_pxDelayedTaskList
	.uleb128 0x19
	.4byte	0x10ef
	.uleb128 0x30
	.asciz	"pxOverflowDelayedTaskList"
	.byte	0x1
	.2byte	0x17b
	.4byte	0x1d7e
	.byte	0x5
	.byte	0x3
	.4byte	_pxOverflowDelayedTaskList
	.uleb128 0x30
	.asciz	"xPendingReadyList"
	.byte	0x1
	.2byte	0x17c
	.4byte	0x61f
	.byte	0x5
	.byte	0x3
	.4byte	_xPendingReadyList
	.uleb128 0x30
	.asciz	"xSuspendedTaskList"
	.byte	0x1
	.2byte	0x187
	.4byte	0x61f
	.byte	0x5
	.byte	0x3
	.4byte	_xSuspendedTaskList
	.uleb128 0x30
	.asciz	"uxCurrentNumberOfTasks"
	.byte	0x1
	.2byte	0x18c
	.4byte	0x1e11
	.byte	0x5
	.byte	0x3
	.4byte	_uxCurrentNumberOfTasks
	.uleb128 0x19
	.4byte	0x34c
	.uleb128 0x30
	.asciz	"xTickCount"
	.byte	0x1
	.2byte	0x18d
	.4byte	0x1e2f
	.byte	0x5
	.byte	0x3
	.4byte	_xTickCount
	.uleb128 0x19
	.4byte	0x35f
	.uleb128 0x30
	.asciz	"uxTopReadyPriority"
	.byte	0x1
	.2byte	0x18e
	.4byte	0x1e11
	.byte	0x5
	.byte	0x3
	.4byte	_uxTopReadyPriority
	.uleb128 0x30
	.asciz	"xSchedulerRunning"
	.byte	0x1
	.2byte	0x18f
	.4byte	0x1e75
	.byte	0x5
	.byte	0x3
	.4byte	_xSchedulerRunning
	.uleb128 0x19
	.4byte	0x32d
	.uleb128 0x30
	.asciz	"uxPendedTicks"
	.byte	0x1
	.2byte	0x190
	.4byte	0x1e11
	.byte	0x5
	.byte	0x3
	.4byte	_uxPendedTicks
	.uleb128 0x30
	.asciz	"xYieldPending"
	.byte	0x1
	.2byte	0x191
	.4byte	0x1e75
	.byte	0x5
	.byte	0x3
	.4byte	_xYieldPending
	.uleb128 0x30
	.asciz	"xNumOfOverflows"
	.byte	0x1
	.2byte	0x192
	.4byte	0x1e75
	.byte	0x5
	.byte	0x3
	.4byte	_xNumOfOverflows
	.uleb128 0x30
	.asciz	"uxTaskNumber"
	.byte	0x1
	.2byte	0x193
	.4byte	0x34c
	.byte	0x5
	.byte	0x3
	.4byte	_uxTaskNumber
	.uleb128 0x30
	.asciz	"xNextTaskUnblockTime"
	.byte	0x1
	.2byte	0x194
	.4byte	0x1e2f
	.byte	0x5
	.byte	0x3
	.4byte	_xNextTaskUnblockTime
	.uleb128 0x30
	.asciz	"xIdleTaskHandle"
	.byte	0x1
	.2byte	0x195
	.4byte	0x62d
	.byte	0x5
	.byte	0x3
	.4byte	_xIdleTaskHandle
	.uleb128 0x30
	.asciz	"uxSchedulerSuspended"
	.byte	0x1
	.2byte	0x19f
	.4byte	0x1e11
	.byte	0x5
	.byte	0x3
	.4byte	_uxSchedulerSuspended
	.uleb128 0x37
	.asciz	"SRbits"
	.byte	0x5
	.byte	0x9f
	.4byte	0x1cd6
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x174
	.4byte	0x1ce9
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
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
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
	.uleb128 0x34
	.uleb128 0x1d
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0x36
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
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
	.uleb128 0x38
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
	.uleb128 0x39
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
	.4byte	0x3f3
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1f73
	.4byte	0xc12
	.asciz	"xTaskCreate"
	.4byte	0xd36
	.asciz	"vTaskPrioritySet"
	.4byte	0xde0
	.asciz	"vTaskResume"
	.4byte	0xe49
	.asciz	"xTaskResumeFromISR"
	.4byte	0xed2
	.asciz	"vTaskStartScheduler"
	.4byte	0xf07
	.asciz	"vTaskEndScheduler"
	.4byte	0xf29
	.asciz	"vTaskSuspendAll"
	.4byte	0xf38
	.asciz	"xTaskGetTickCount"
	.4byte	0xf74
	.asciz	"xTaskGetTickCountFromISR"
	.4byte	0xfc0
	.asciz	"uxTaskGetNumberOfTasks"
	.4byte	0xfeb
	.asciz	"pcTaskGetName"
	.4byte	0x103d
	.asciz	"xTaskIncrementTick"
	.4byte	0x10f5
	.asciz	"xTaskResumeAll"
	.4byte	0x117d
	.asciz	"vTaskDelay"
	.4byte	0x11d0
	.asciz	"vTaskDelayUntil"
	.4byte	0x128c
	.asciz	"vTaskSwitchContext"
	.4byte	0x12f9
	.asciz	"vTaskSuspend"
	.4byte	0x135f
	.asciz	"vTaskPlaceOnEventList"
	.4byte	0x13a6
	.asciz	"vTaskPlaceOnUnorderedEventList"
	.4byte	0x1404
	.asciz	"vTaskPlaceOnEventListRestricted"
	.4byte	0x1471
	.asciz	"xTaskRemoveFromEventList"
	.4byte	0x14dd
	.asciz	"xTaskRemoveFromUnorderedEventList"
	.4byte	0x155c
	.asciz	"vTaskSetTimeOutState"
	.4byte	0x1577
	.asciz	"xTaskCheckForTimeOut"
	.4byte	0x1604
	.asciz	"vTaskMissedYield"
	.4byte	0x1625
	.asciz	"xTaskGetCurrentTaskHandle"
	.4byte	0x1666
	.asciz	"xTaskGetSchedulerState"
	.4byte	0x16a4
	.asciz	"vTaskPriorityInherit"
	.4byte	0x16e8
	.asciz	"xTaskPriorityDisinherit"
	.4byte	0x1741
	.asciz	"uxTaskResetEventItemValue"
	.4byte	0x1787
	.asciz	"pvTaskIncrementMutexHeldCount"
	.4byte	0x17b9
	.asciz	"ulTaskNotifyTake"
	.4byte	0x1825
	.asciz	"xTaskNotifyWait"
	.4byte	0x18d6
	.asciz	"xTaskGenericNotify"
	.4byte	0x196f
	.asciz	"xTaskGenericNotifyFromISR"
	.4byte	0x1a2f
	.asciz	"vTaskNotifyGiveFromISR"
	.4byte	0x1a9d
	.asciz	"xTaskNotifyStateClear"
	.4byte	0x1af8
	.asciz	"vApplicationGetTimerTaskMemory"
	.4byte	0x1beb
	.asciz	"vApplicationGetIdleTaskMemory"
	.4byte	0x1f5f
	.asciz	"pxCurrentTCB"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x1ec
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1f73
	.4byte	0x102
	.asciz	"_Sizet"
	.4byte	0x11c
	.asciz	"size_t"
	.4byte	0x139
	.asciz	"uint8_t"
	.4byte	0x159
	.asciz	"uint16_t"
	.4byte	0x169
	.asciz	"uint32_t"
	.4byte	0x2c9
	.asciz	"tagSRBITS"
	.4byte	0x2e4
	.asciz	"SRBITS"
	.4byte	0x2f2
	.asciz	"TaskFunction_t"
	.4byte	0x31a
	.asciz	"StackType_t"
	.4byte	0x32d
	.asciz	"BaseType_t"
	.4byte	0x34c
	.asciz	"UBaseType_t"
	.4byte	0x35f
	.asciz	"TickType_t"
	.4byte	0x371
	.asciz	"xSTATIC_LIST_ITEM"
	.4byte	0x3c4
	.asciz	"StaticListItem_t"
	.4byte	0x3dd
	.asciz	"xSTATIC_TCB"
	.4byte	0x4d9
	.asciz	"StaticTask_t"
	.4byte	0x4ee
	.asciz	"xLIST_ITEM"
	.4byte	0x55d
	.asciz	"ListItem_t"
	.4byte	0x56f
	.asciz	"xMINI_LIST_ITEM"
	.4byte	0x5b5
	.asciz	"MiniListItem_t"
	.4byte	0x5cb
	.asciz	"xLIST"
	.4byte	0x61f
	.asciz	"List_t"
	.4byte	0x62d
	.asciz	"TaskHandle_t"
	.4byte	0x6a3
	.asciz	"eNotifyAction"
	.4byte	0x6b8
	.asciz	"xTIME_OUT"
	.4byte	0x6fe
	.asciz	"TimeOut_t"
	.4byte	0x70f
	.asciz	"xMEMORY_REGION"
	.4byte	0x770
	.asciz	"MemoryRegion_t"
	.4byte	0x7a4
	.asciz	"tskTaskControlBlock"
	.4byte	0x8e1
	.asciz	"tskTCB"
	.4byte	0x8f0
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
.LASF17:
	.asciz	"xAlreadyYielded"
.LASF13:
	.asciz	"xConstTickCount"
.LASF24:
	.asciz	"pxHigherPriorityTaskWoken"
.LASF0:
	.asciz	"xItemValue"
.LASF16:
	.asciz	"uxSavedInterruptStatus"
.LASF12:
	.asciz	"xTimeToWake"
.LASF23:
	.asciz	"ucOriginalNotifyState"
.LASF11:
	.asciz	"xTicksToWait"
.LASF21:
	.asciz	"xTaskToNotify"
.LASF22:
	.asciz	"pulPreviousNotificationValue"
.LASF14:
	.asciz	"xYieldRequired"
.LASF6:
	.asciz	"pxCreatedTask"
.LASF7:
	.asciz	"pxNewTCB"
.LASF10:
	.asciz	"pxTimeOut"
.LASF8:
	.asciz	"xReturn"
.LASF15:
	.asciz	"xTaskToResume"
.LASF3:
	.asciz	"uxPriority"
.LASF4:
	.asciz	"pxTaskCode"
.LASF18:
	.asciz	"pxEventList"
.LASF9:
	.asciz	"pxTCB"
.LASF5:
	.asciz	"pvParameters"
.LASF20:
	.asciz	"pxMutexHolder"
.LASF25:
	.asciz	"pxCurrentTCB"
.LASF2:
	.asciz	"pxTopOfStack"
.LASF1:
	.asciz	"pxPrevious"
.LASF19:
	.asciz	"pxUnblockedTCB"
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
