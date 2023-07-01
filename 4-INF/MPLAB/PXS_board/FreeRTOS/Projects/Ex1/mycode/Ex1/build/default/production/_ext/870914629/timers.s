	.file "C:\\Users\\Filippo\\Desktop\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\..\\source\\timers.c"
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
	.type	_prvCheckForValidListAndQueue,@function
_prvCheckForValidListAndQueue:
.LFB16:
	.file 1 "../../source/timers.c"
	.loc 1 931 0
	.set ___PA___,1
	.loc 1 935 0
	rcall	_vPortEnterCritical
	.loc 1 937 0
	cp0	_xTimerQueue
	.set ___BP___,10
	bra	z,.L4
	.loc 1 977 0
	bra	_vPortExitCritical
.L5:
	.loc 1 978 0
	.set ___PA___,0
.L4:
	.loc 1 939 0
	mov	#_xActiveTimerList1,w0
	rcall	_vListInitialise
	.loc 1 940 0
	mov	#_xActiveTimerList2,w0
	rcall	_vListInitialise
	.loc 1 941 0
	mov	#_xActiveTimerList1,w0
	mov	w0,_pxCurrentTimerList
	.loc 1 942 0
	mov	#_xActiveTimerList2,w0
	mov	w0,_pxOverflowTimerList
	.loc 1 955 0
	clr.b	w2
	mov	#6,w1
	mov	#20,w0
	rcall	_xQueueGenericCreate
	mov	w0,_xTimerQueue
	.loc 1 977 0
	bra	_vPortExitCritical
	bra	.L5
.LFE16:
	.size	_prvCheckForValidListAndQueue, .-_prvCheckForValidListAndQueue
	.align	2
	.type	_prvInsertTimerInActiveList,@function
_prvInsertTimerInActiveList:
.LFB13:
	.loc 1 684 0
	.set ___PA___,1
	.loc 1 687 0
	mov	w1,[w0+2]
	.loc 1 688 0
	mov	w0,[w0+8]
	.loc 1 690 0
	sub	w1,w2,[w15]
	.set ___BP___,50
	bra	gtu,.L8
	.loc 1 694 0
	sub	w2,w3,w2
	mov	[w0+12],w1
	.loc 1 698 0
	mov	#1,w4
	.loc 1 694 0
	sub	w2,w1,[w15]
	.set ___BP___,29
	bra	ltu,.L14
.L9:
	.loc 1 721 0
	mov	w4,w0
	return	
.L15:
	.set ___PA___,0
.L8:
	.loc 1 707 0
	sub	w2,w3,[w15]
	.set ___BP___,29
	bra	geu,.L10
	.loc 1 712 0
	mov	#1,w4
	.loc 1 707 0
	sub	w1,w3,[w15]
	.set ___BP___,39
	bra	geu,.L9
.L10:
	.loc 1 716 0
	inc2	w0,w1
	mov	_pxCurrentTimerList,w0
	rcall	_vListInsert
	.loc 1 721 0
	retlw	#0,w0
	bra	.L15
.L14:
	.loc 1 702 0
	inc2	w0,w1
	mov	_pxOverflowTimerList,w0
	rcall	_vListInsert
	.loc 1 721 0
	retlw	#0,w0
	bra	.L15
.LFE13:
	.size	_prvInsertTimerInActiveList, .-_prvInsertTimerInActiveList
	.section .const,psv,page
.LC0:
	.asciz	"Tmr Svc"
	.section	.text,code
	.align	2
	.global	_xTimerCreateTimerTask	; export
	.type	_xTimerCreateTimerTask,@function
_xTimerCreateTimerTask:
.LFB0:
	.loc 1 260 0
	.set ___PA___,1
	.loc 1 267 0
	rcall	_prvCheckForValidListAndQueue
	.loc 1 261 0
	clr	w0
	.loc 1 269 0
	cp0	_xTimerQueue
	.set ___BP___,21
	bra	z,.L18
	.loc 1 293 0
	mov	#_xTimerTaskHandle,w5
	mov	#4,w4
	mov	w0,w3
	mov	#64,w2
	mov	#.LC0,w1
	mov	#handle(_prvTimerTask),w0
	rcall	_xTaskCreate
.L18:
	.loc 1 309 0
	return	
.LFE0:
	.size	_xTimerCreateTimerTask, .-_xTimerCreateTimerTask
	.align	2
	.global	_xTimerCreate	; export
	.type	_xTimerCreate,@function
_xTimerCreate:
.LFB1:
	.loc 1 319 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI0:
	mov.d	w10,[w15++]
.LCFI1:
	mov.d	w12,[w15++]
.LCFI2:
	mov.d	w0,w8
	mov.d	w2,w10
	mov	w4,w13
	.loc 1 322 0
	mov	#20,w0
	rcall	_pvPortMalloc
	mov	w0,w12
	.loc 1 324 0
	cp0	w12
	.set ___BP___,10
	bra	z,.L23
.LBB10:
.LBB11:
	.loc 1 402 0
	rcall	_prvCheckForValidListAndQueue
	.loc 1 406 0
	mov	w8,[w12]
	.loc 1 407 0
	mov	w9,[w12+12]
	.loc 1 408 0
	mov	w10,[w12+14]
	.loc 1 409 0
	mov	w11,[w12+16]
	.loc 1 410 0
	mov	w13,[w12+18]
	.loc 1 411 0
	inc2	w12,w0
	rcall	_vListInitialiseItem
.L23:
.LBE11:
.LBE10:
	.loc 1 339 0
	mov	w12,w0
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.LFE1:
	.size	_xTimerCreate, .-_xTimerCreate
	.align	2
	.global	_xTimerGenericCommand	; export
	.type	_xTimerGenericCommand,@function
_xTimerGenericCommand:
.LFB3:
	.loc 1 418 0
	.set ___PA___,1
	lnk	#6
.LCFI3:
	mov	w8,[w15++]
.LCFI4:
	mov	w0,w5
	mov	w3,w7
	mov	w4,w8
	.loc 1 426 0
	mov	_xTimerQueue,w6
	.loc 1 419 0
	clr	w0
	.loc 1 426 0
	cp0	w6
	.set ___BP___,10
	bra	z,.L27
	.loc 1 429 0
	mov	w1,[w15-8]
	.loc 1 430 0
	mov	w2,[w15-6]
	.loc 1 431 0
	mov	w5,[w15-4]
	.loc 1 433 0
	sub	w1,#5,[w15]
	.set ___BP___,50
	bra	gt,.L28
	.loc 1 435 0
	rcall	_xTaskGetSchedulerState
	sub	w0,#2,[w15]
	.set ___BP___,28
	bra	z,.L32
	.loc 1 441 0
	clr	w3
	mov	w3,w2
	sub	w15,#8,w1
	mov	_xTimerQueue,w0
	rcall	_xQueueGenericSend
.L27:
	.loc 1 457 0
	mov	[--w15],w8
	ulnk	
	return	
.L33:
	.set ___PA___,0
.L28:
	.loc 1 446 0
	clr	w3
	mov	w7,w2
	sub	w15,#8,w1
	mov	w6,w0
	rcall	_xQueueGenericSendFromISR
	.loc 1 457 0
	mov	[--w15],w8
	ulnk	
	return	
	bra	.L33
.L32:
	.loc 1 437 0
	clr	w3
	mov	w8,w2
	sub	w15,#8,w1
	mov	_xTimerQueue,w0
	rcall	_xQueueGenericSend
	.loc 1 457 0
	mov	[--w15],w8
	ulnk	
	return	
	bra	.L33
.LFE3:
	.size	_xTimerGenericCommand, .-_xTimerGenericCommand
	.align	2
	.type	_prvSampleTimeNow,@function
_prvSampleTimeNow:
.LFB12:
	.loc 1 661 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI5:
	mov.d	w10,[w15++]
.LCFI6:
	mov	w12,[w15++]
.LCFI7:
	mov	w0,w10
	.loc 1 665 0
	rcall	_xTaskGetTickCount
	mov	w0,w9
	.loc 1 667 0
	mov	_xLastTime.20981,w0
	sub	w0,w9,[w15]
	.set ___BP___,50
	bra	gtu,.L46
	.loc 1 674 0
	clr	[w10]
	.loc 1 677 0
	mov	w9,_xLastTime.20981
	.loc 1 680 0
	mov	w9,w0
	mov	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
.L52:
	.set ___PA___,0
.L51:
.LBB12:
.LBB13:
	.loc 1 904 0
	mov	[w8+12],w0
	add	w11,w0,w0
	.loc 1 905 0
	sub	w0,w11,[w15]
	.set ___BP___,50
	bra	leu,.L39
	.loc 1 907 0
	mov	w0,[w8+2]
	.loc 1 908 0
	mov	w8,[w8+8]
	.loc 1 909 0
	mov	w12,w1
	mov	_pxCurrentTimerList,w0
	rcall	_vListInsert
.L46:
	.loc 1 882 0
	mov	_pxCurrentTimerList,w0
	cp0	[w0]
	.set ___BP___,4
	bra	z,.L50
.L41:
	.loc 1 884 0
	mov	[w0+6],w0
	mov	[w0],w11
	.loc 1 887 0
	mov	[w0+6],w8
	.loc 1 888 0
	inc2	w8,w12
	mov	w12,w0
	rcall	_uxListRemove
	.loc 1 894 0
	mov	[w8+18],w1
	mov	w8,w0
	call	w1
	.loc 1 896 0
	mov	[w8+14],w0
	sub	w0,#1,[w15]
	.set ___BP___,14
	bra	z,.L51
	.loc 1 882 0
	mov	_pxCurrentTimerList,w0
	cp0	[w0]
	.set ___BP___,95
	bra	nz,.L41
.L50:
	.loc 1 925 0
	push	_pxOverflowTimerList
	pop	_pxCurrentTimerList
	.loc 1 926 0
	mov	w0,_pxOverflowTimerList
.LBE13:
.LBE12:
	.loc 1 670 0
	mov	#1,w0
	mov	w0,[w10]
	.loc 1 677 0
	mov	w9,_xLastTime.20981
	.loc 1 680 0
	mov	w9,w0
	mov	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L52
.L39:
.LBB15:
.LBB14:
	.loc 1 913 0
	clr	w4
	mov	w4,w3
	mov	w11,w2
	mov	w4,w1
	mov	w8,w0
	rcall	_xTimerGenericCommand
	bra	.L46
.LBE14:
.LBE15:
.LFE12:
	.size	_prvSampleTimeNow, .-_prvSampleTimeNow
	.align	2
	.type	_prvTimerTask,@function
_prvTimerTask:
.LFB9:
	.loc 1 539 0
	.set ___PA___,0
	lnk	#8
.LCFI8:
	mov.d	w8,[w15++]
.LCFI9:
	mov.d	w10,[w15++]
.LCFI10:
.LBB24:
.LBB25:
	.loc 1 783 0
	mov	#1,w9
.L70:
.LBE25:
.LBE24:
.LBB27:
.LBB28:
	.loc 1 645 0
	mov	_pxCurrentTimerList,w0
	mov	[w0],w10
	btsc	w10,#15
	neg	w10,w10
	dec	w10,w10
	lsr	w10,#15,w10
	.loc 1 653 0
	clr	w8
	.loc 1 646 0
	.set ___BP___,50
	bra	nz,.L55
	.loc 1 648 0
	mov	[w0+6],w0
	mov	[w0],w8
.L55:
.LBE28:
.LBE27:
.LBB29:
.LBB30:
	.loc 1 579 0
	rcall	_vTaskSuspendAll
	.loc 1 586 0
	sub	w15,#16,w0
	rcall	_prvSampleTimeNow
	mov	w0,w11
	.loc 1 587 0
	mov	[w15-16],w0
	cp0	w0
	.set ___BP___,29
	bra	nz,.L56
	.loc 1 590 0
	cp0	w10
	.set ___BP___,50
	bra	z,.L77
	.loc 1 607 0
	mov	_pxOverflowTimerList,w0
	mov	[w0],w0
	btsc	w0,#15
	neg	w0,w0
	dec	w0,w0
	lsr	w0,#15,w10
.L58:
	.loc 1 610 0
	sub	w8,w11,w1
	mov	w10,w2
	mov	_xTimerQueue,w0
	rcall	_vQueueWaitForMessageRestricted
	.loc 1 612 0
	rcall	_xTaskResumeAll
	cp0	w0
	.set ___BP___,50
	bra	nz,.L75
	.loc 1 618 0
; 618 "../../source/timers.c" 1
	CALL _vPortYield			
NOP					  
.L75:
.LBE30:
.LBE29:
.LBB34:
.LBB26:
	.loc 1 731 0
	clr	w3
	mov	w3,w2
	sub	w15,#14,w1
	mov	_xTimerQueue,w0
	rcall	_xQueueGenericReceive
	cp0	w0
	.set ___BP___,4
	bra	z,.L70
	.loc 1 757 0
	mov	[w15-14],w0
	cp0	w0
	.set ___BP___,86
	bra	lt,.L75
	.loc 1 761 0
	mov	[w15-10],w8
	.loc 1 763 0
	mov	[w8+10],w0
	cp0	w0
	.set ___BP___,30
	bra	z,.L63
	.loc 1 766 0
	inc2	w8,w0
	rcall	_uxListRemove
.L63:
	.loc 1 781 0
	sub	w15,#16,w0
	rcall	_prvSampleTimeNow
	.loc 1 783 0
	mov	[w15-14],w1
	sub	w1,#9,[w15]
	.set ___BP___,50
	bra	gtu,.L75
	sl	w9,w1,w1
	mov	w1,w2
	and	#528,w2
	.set ___BP___,50
	bra	nz,.L66
	mov	w1,w2
	and	#199,w2
	.set ___BP___,50
	bra	nz,.L65
	btst	w1,#5
	.set ___BP___,50
	bra	z,.L75
	.loc 1 843 0
	mov	w8,w0
	rcall	_vPortFree
	bra	.L75
.L66:
	.loc 1 823 0
	mov	[w15-12],w1
	mov	w1,[w8+12]
	.loc 1 832 0
	add	w0,w1,w1
	mov	w0,w3
	mov	w3,w2
	mov	w8,w0
	rcall	_prvInsertTimerInActiveList
	bra	.L75
.L65:
	.loc 1 791 0
	mov	[w15-12],w3
	mov	[w8+12],w1
	add	w3,w1,w1
	mov	w0,w2
	mov	w8,w0
	rcall	_prvInsertTimerInActiveList
	cp0	w0
	.set ___BP___,71
	bra	z,.L75
	.loc 1 795 0
	mov	[w8+18],w1
	mov	w8,w0
	call	w1
	.loc 1 798 0
	mov	[w8+14],w0
	sub	w0,#1,[w15]
	.set ___BP___,86
	bra	nz,.L75
	.loc 1 800 0
	mov	[w8+12],w2
	mov	[w15-12],w0
	add	w2,w0,w2
	clr	w4
	mov	w4,w3
	mov	w4,w1
	mov	w8,w0
	rcall	_xTimerGenericCommand
	bra	.L75
.L77:
.LBE26:
.LBE34:
.LBB35:
.LBB33:
	.loc 1 590 0
	sub	w8,w11,[w15]
	.set ___BP___,71
	bra	gtu,.L58
	.loc 1 592 0
	rcall	_xTaskResumeAll
.LBB31:
.LBB32:
	.loc 1 501 0
	mov	_pxCurrentTimerList,w0
	mov	[w0+6],w0
	mov	[w0+6],w10
	.loc 1 505 0
	inc2	w10,w0
	rcall	_uxListRemove
	.loc 1 510 0
	mov	[w10+14],w0
	sub	w0,#1,[w15]
	.set ___BP___,19
	bra	z,.L78
.L59:
	.loc 1 534 0
	mov	[w10+18],w1
	mov	w10,w0
	call	w1
	bra	.L75
.L78:
	.loc 1 515 0
	mov	[w10+12],w1
	add	w8,w1,w1
	mov	w8,w3
	mov	w11,w2
	mov	w10,w0
	rcall	_prvInsertTimerInActiveList
	cp0	w0
	.set ___BP___,61
	bra	z,.L59
	.loc 1 519 0
	clr	w4
	mov	w4,w3
	mov	w8,w2
	mov	w4,w1
	mov	w10,w0
	rcall	_xTimerGenericCommand
	.loc 1 534 0
	mov	[w10+18],w1
	mov	w10,w0
	call	w1
	bra	.L75
.L56:
.LBE32:
.LBE31:
	.loc 1 628 0
	rcall	_xTaskResumeAll
	bra	.L75
.LBE33:
.LBE35:
.LFE9:
	.size	_prvTimerTask, .-_prvTimerTask
	.align	2
	.global	_xTimerGetTimerDaemonTaskHandle	; export
	.type	_xTimerGetTimerDaemonTaskHandle,@function
_xTimerGetTimerDaemonTaskHandle:
.LFB4:
	.loc 1 461 0
	.set ___PA___,1
	.loc 1 466 0
	mov	_xTimerTaskHandle,w0
	return	
	.set ___PA___,0
.LFE4:
	.size	_xTimerGetTimerDaemonTaskHandle, .-_xTimerGetTimerDaemonTaskHandle
	.align	2
	.global	_xTimerGetPeriod	; export
	.type	_xTimerGetPeriod,@function
_xTimerGetPeriod:
.LFB5:
	.loc 1 470 0
	.set ___PA___,1
	.loc 1 470 0
	mov	[w0+12],w0
	.loc 1 475 0
	return	
	.set ___PA___,0
.LFE5:
	.size	_xTimerGetPeriod, .-_xTimerGetPeriod
	.align	2
	.global	_xTimerGetExpiryTime	; export
	.type	_xTimerGetExpiryTime,@function
_xTimerGetExpiryTime:
.LFB6:
	.loc 1 479 0
	.set ___PA___,1
	.loc 1 479 0
	mov	[w0+2],w0
	.loc 1 486 0
	return	
	.set ___PA___,0
.LFE6:
	.size	_xTimerGetExpiryTime, .-_xTimerGetExpiryTime
	.align	2
	.global	_pcTimerGetName	; export
	.type	_pcTimerGetName,@function
_pcTimerGetName:
.LFB7:
	.loc 1 490 0
	.set ___PA___,1
	.loc 1 490 0
	mov	[w0],w0
	.loc 1 495 0
	return	
	.set ___PA___,0
.LFE7:
	.size	_pcTimerGetName, .-_pcTimerGetName
	.align	2
	.global	_xTimerIsTimerActive	; export
	.type	_xTimerIsTimerActive,@function
_xTimerIsTimerActive:
.LFB17:
	.loc 1 982 0
	.set ___PA___,1
	mov	w8,[w15++]
.LCFI11:
	mov	w0,w8
	.loc 1 989 0
	rcall	_vPortEnterCritical
	.loc 1 994 0
	mov	[w8+10],w0
	btsc	w0,#15
	neg	w0,w0
	neg	w0,w0
	lsr	w0,#15,w8
	.loc 1 996 0
	rcall	_vPortExitCritical
	.loc 1 999 0
	mov	w8,w0
	mov	[--w15],w8
	return	
	.set ___PA___,0
.LFE17:
	.size	_xTimerIsTimerActive, .-_xTimerIsTimerActive
	.align	2
	.global	_pvTimerGetTimerID	; export
	.type	_pvTimerGetTimerID,@function
_pvTimerGetTimerID:
.LFB18:
	.loc 1 1003 0
	.set ___PA___,1
	mov	w8,[w15++]
.LCFI12:
	mov	w0,w8
	.loc 1 1009 0
	rcall	_vPortEnterCritical
	.loc 1 1011 0
	mov	[w8+16],w8
	.loc 1 1013 0
	rcall	_vPortExitCritical
	.loc 1 1016 0
	mov	w8,w0
	mov	[--w15],w8
	return	
	.set ___PA___,0
.LFE18:
	.size	_pvTimerGetTimerID, .-_pvTimerGetTimerID
	.align	2
	.global	_vTimerSetTimerID	; export
	.type	_vTimerSetTimerID,@function
_vTimerSetTimerID:
.LFB19:
	.loc 1 1020 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI13:
	mov.d	w0,w8
	.loc 1 1025 0
	rcall	_vPortEnterCritical
	.loc 1 1027 0
	mov	w9,[w8+16]
	.loc 1 1029 0
	rcall	_vPortExitCritical
	.loc 1 1030 0
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.LFE19:
	.size	_vTimerSetTimerID, .-_vTimerSetTimerID
	.section	.nbss,bss,near
	.align	2
	.type	_xTimerTaskHandle,@object
	.size	_xTimerTaskHandle, 2
_xTimerTaskHandle:
	.skip	2
	.align	2
	.type	_xTimerQueue,@object
	.size	_xTimerQueue, 2
_xTimerQueue:
	.skip	2
	.section	.bss,bss
	.align	2
	.type	_xActiveTimerList1,@object
	.size	_xActiveTimerList1, 10
_xActiveTimerList1:
	.skip	10
	.align	2
	.type	_xActiveTimerList2,@object
	.size	_xActiveTimerList2, 10
_xActiveTimerList2:
	.skip	10
	.section	.nbss,bss,near
	.align	2
	.type	_pxCurrentTimerList,@object
	.size	_pxCurrentTimerList, 2
_pxCurrentTimerList:
	.skip	2
	.align	2
	.type	_pxOverflowTimerList,@object
	.size	_pxOverflowTimerList, 2
_pxOverflowTimerList:
	.skip	2
	.align	2
	.type	_xLastTime.20981,@object
	.size	_xLastTime.20981, 2
_xLastTime.20981:
	.skip	2
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
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.align	4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.align	4
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x13
	.sleb128 -6
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0x13
	.sleb128 -8
	.byte	0x8c
	.uleb128 0x6
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
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI3-.LFB3
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0x88
	.uleb128 0x6
	.align	4
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI5-.LFB12
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0x13
	.sleb128 -6
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0x13
	.sleb128 -7
	.byte	0x8c
	.uleb128 0x6
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
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI8-.LFB9
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI10-.LCFI8
	.byte	0x8a
	.uleb128 0x9
	.byte	0x88
	.uleb128 0x7
	.align	4
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.align	4
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.align	4
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.align	4
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.align	4
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI11-.LFB17
	.byte	0x13
	.sleb128 -3
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI12-.LFB18
	.byte	0x13
	.sleb128 -3
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x4
	.4byte	.LCFI13-.LFB19
	.byte	0x13
	.sleb128 -4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE26:
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 3 "../../source/include/../../Source/portable/MPLAB/PIC24_dsPIC/portmacro.h"
	.file 4 "../../source/include/list.h"
	.file 5 "../../source/include/task.h"
	.file 6 "../../source/include/queue.h"
	.file 7 "../../source/include/timers.h"
	.section	.debug_info,info
	.4byte	0xe27
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../../source/timers.c"
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
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"long int"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"signed char"
	.uleb128 0x4
	.asciz	"uint8_t"
	.byte	0x2
	.byte	0x2b
	.4byte	0x12d
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x2
	.byte	0x31
	.4byte	0xec
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x4
	.asciz	"BaseType_t"
	.byte	0x3
	.byte	0x61
	.4byte	0x175
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"UBaseType_t"
	.byte	0x3
	.byte	0x62
	.4byte	0xd6
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x3
	.byte	0x65
	.4byte	0x13e
	.uleb128 0x5
	.asciz	"xLIST_ITEM"
	.byte	0xa
	.byte	0x4
	.byte	0xb5
	.4byte	0x210
	.uleb128 0x6
	.4byte	.LASF0
	.byte	0x4
	.byte	0xb8
	.4byte	0x195
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"pxNext"
	.byte	0x4
	.byte	0xb9
	.4byte	0x210
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.4byte	.LASF1
	.byte	0x4
	.byte	0xba
	.4byte	0x210
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.asciz	"pvOwner"
	.byte	0x4
	.byte	0xbb
	.4byte	0xa9
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x7
	.asciz	"pvContainer"
	.byte	0x4
	.byte	0xbc
	.4byte	0xa9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x1a7
	.uleb128 0x4
	.asciz	"ListItem_t"
	.byte	0x4
	.byte	0xbf
	.4byte	0x1a7
	.uleb128 0x5
	.asciz	"xMINI_LIST_ITEM"
	.byte	0x6
	.byte	0x4
	.byte	0xc1
	.4byte	0x26e
	.uleb128 0x6
	.4byte	.LASF0
	.byte	0x4
	.byte	0xc4
	.4byte	0x195
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"pxNext"
	.byte	0x4
	.byte	0xc5
	.4byte	0x210
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.4byte	.LASF1
	.byte	0x4
	.byte	0xc6
	.4byte	0x210
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.asciz	"MiniListItem_t"
	.byte	0x4
	.byte	0xc8
	.4byte	0x228
	.uleb128 0x5
	.asciz	"xLIST"
	.byte	0xa
	.byte	0x4
	.byte	0xcd
	.4byte	0x2d2
	.uleb128 0x7
	.asciz	"uxNumberOfItems"
	.byte	0x4
	.byte	0xd0
	.4byte	0x182
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"pxIndex"
	.byte	0x4
	.byte	0xd1
	.4byte	0x2d2
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x7
	.asciz	"xListEnd"
	.byte	0x4
	.byte	0xd2
	.4byte	0x26e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x216
	.uleb128 0x4
	.asciz	"List_t"
	.byte	0x4
	.byte	0xd4
	.4byte	0x284
	.uleb128 0x4
	.asciz	"TaskHandle_t"
	.byte	0x5
	.byte	0x67
	.4byte	0xa9
	.uleb128 0x9
	.4byte	0x2ff
	.uleb128 0x8
	.byte	0x2
	.4byte	0x305
	.uleb128 0x9
	.4byte	0x30a
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x4
	.asciz	"QueueHandle_t"
	.byte	0x6
	.byte	0x58
	.4byte	0xa9
	.uleb128 0x4
	.asciz	"TimerHandle_t"
	.byte	0x7
	.byte	0x76
	.4byte	0xa9
	.uleb128 0x4
	.asciz	"TimerCallbackFunction_t"
	.byte	0x7
	.byte	0x7b
	.4byte	0x35b
	.uleb128 0x8
	.byte	0x2
	.4byte	0x361
	.uleb128 0xa
	.byte	0x1
	.4byte	0x36d
	.uleb128 0xb
	.4byte	0x327
	.byte	0x0
	.uleb128 0x5
	.asciz	"tmrTimerControl"
	.byte	0x14
	.byte	0x1
	.byte	0x68
	.4byte	0x3e5
	.uleb128 0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x6a
	.4byte	0x2ff
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"xTimerListItem"
	.byte	0x1
	.byte	0x6b
	.4byte	0x216
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x6c
	.4byte	0x195
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x6d
	.4byte	0x182
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0x6
	.4byte	.LASF5
	.byte	0x1
	.byte	0x6e
	.4byte	0xa9
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.4byte	.LASF6
	.byte	0x1
	.byte	0x6f
	.4byte	0x33c
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0x4
	.asciz	"xTIMER"
	.byte	0x1
	.byte	0x77
	.4byte	0x36d
	.uleb128 0x4
	.asciz	"Timer_t"
	.byte	0x1
	.byte	0x7b
	.4byte	0x3e5
	.uleb128 0x5
	.asciz	"tmrTimerParameters"
	.byte	0x4
	.byte	0x1
	.byte	0x82
	.4byte	0x444
	.uleb128 0x7
	.asciz	"xMessageValue"
	.byte	0x1
	.byte	0x84
	.4byte	0x195
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0x1
	.byte	0x85
	.4byte	0x444
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x3f3
	.uleb128 0x4
	.asciz	"TimerParameter_t"
	.byte	0x1
	.byte	0x86
	.4byte	0x402
	.uleb128 0xc
	.byte	0x4
	.byte	0x1
	.byte	0x95
	.4byte	0x483
	.uleb128 0xd
	.asciz	"xTimerParameters"
	.byte	0x1
	.byte	0x97
	.4byte	0x44a
	.byte	0x0
	.uleb128 0x5
	.asciz	"tmrTimerQueueMessage"
	.byte	0x6
	.byte	0x1
	.byte	0x92
	.4byte	0x4c2
	.uleb128 0x7
	.asciz	"xMessageID"
	.byte	0x1
	.byte	0x94
	.4byte	0x163
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"u"
	.byte	0x1
	.byte	0x9e
	.4byte	0x462
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x4
	.asciz	"DaemonTaskMessage_t"
	.byte	0x1
	.byte	0x9f
	.4byte	0x483
	.uleb128 0xe
	.asciz	"prvInitialiseNewTimer"
	.byte	0x1
	.2byte	0x184
	.byte	0x1
	.byte	0x1
	.4byte	0x546
	.uleb128 0xf
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x184
	.4byte	0x2fa
	.uleb128 0xf
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x185
	.4byte	0x546
	.uleb128 0xf
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x186
	.4byte	0x54b
	.uleb128 0xf
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x187
	.4byte	0x550
	.uleb128 0xf
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x188
	.4byte	0x33c
	.uleb128 0xf
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x189
	.4byte	0x444
	.byte	0x0
	.uleb128 0x9
	.4byte	0x195
	.uleb128 0x9
	.4byte	0x182
	.uleb128 0x9
	.4byte	0xa9
	.uleb128 0xe
	.asciz	"prvSwitchTimerLists"
	.byte	0x1
	.2byte	0x367
	.byte	0x1
	.byte	0x1
	.4byte	0x5bb
	.uleb128 0x10
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x369
	.4byte	0x195
	.uleb128 0x11
	.asciz	"xReloadTime"
	.byte	0x1
	.2byte	0x369
	.4byte	0x195
	.uleb128 0x11
	.asciz	"pxTemp"
	.byte	0x1
	.2byte	0x36a
	.4byte	0x5bb
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x36b
	.4byte	0x444
	.uleb128 0x10
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x36c
	.4byte	0x163
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x2d8
	.uleb128 0xe
	.asciz	"prvProcessExpiredTimer"
	.byte	0x1
	.2byte	0x1f2
	.byte	0x1
	.byte	0x1
	.4byte	0x613
	.uleb128 0xf
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1f2
	.4byte	0x546
	.uleb128 0xf
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x1f2
	.4byte	0x546
	.uleb128 0x10
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x1f4
	.4byte	0x163
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x1f5
	.4byte	0x613
	.byte	0x0
	.uleb128 0x9
	.4byte	0x444
	.uleb128 0x12
	.asciz	"prvGetNextExpireTime"
	.byte	0x1
	.2byte	0x27a
	.byte	0x1
	.4byte	0x195
	.byte	0x1
	.4byte	0x65f
	.uleb128 0x13
	.asciz	"pxListWasEmpty"
	.byte	0x1
	.2byte	0x27a
	.4byte	0x65f
	.uleb128 0x10
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x27c
	.4byte	0x195
	.byte	0x0
	.uleb128 0x9
	.4byte	0x664
	.uleb128 0x8
	.byte	0x2
	.4byte	0x163
	.uleb128 0x14
	.asciz	"prvCheckForValidListAndQueue"
	.byte	0x1
	.2byte	0x3a2
	.byte	0x1
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x1
	.byte	0x5f
	.uleb128 0x15
	.asciz	"prvInsertTimerInActiveList"
	.byte	0x1
	.2byte	0x2ab
	.byte	0x1
	.4byte	0x163
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x1
	.byte	0x5f
	.4byte	0x731
	.uleb128 0x16
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x2ab
	.4byte	0x613
	.byte	0x1
	.byte	0x50
	.uleb128 0x17
	.asciz	"xNextExpiryTime"
	.byte	0x1
	.2byte	0x2ab
	.4byte	0x546
	.byte	0x1
	.byte	0x51
	.uleb128 0x16
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x2ab
	.4byte	0x546
	.byte	0x1
	.byte	0x52
	.uleb128 0x17
	.asciz	"xCommandTime"
	.byte	0x1
	.2byte	0x2ab
	.4byte	0x546
	.byte	0x1
	.byte	0x53
	.uleb128 0x18
	.asciz	"xProcessTimerNow"
	.byte	0x1
	.2byte	0x2ad
	.4byte	0x163
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.asciz	"xTimerCreateTimerTask"
	.byte	0x1
	.2byte	0x103
	.byte	0x1
	.4byte	0x163
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5f
	.4byte	0x76e
	.uleb128 0x1a
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x105
	.4byte	0x163
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.asciz	"xTimerCreate"
	.byte	0x1
	.2byte	0x13a
	.byte	0x1
	.4byte	0x327
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5f
	.4byte	0x814
	.uleb128 0x16
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x13a
	.4byte	0x2fa
	.byte	0x1
	.byte	0x58
	.uleb128 0x16
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x13b
	.4byte	0x546
	.byte	0x1
	.byte	0x59
	.uleb128 0x16
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x13c
	.4byte	0x54b
	.byte	0x1
	.byte	0x5a
	.uleb128 0x16
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x13d
	.4byte	0x550
	.byte	0x1
	.byte	0x5b
	.uleb128 0x16
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x13e
	.4byte	0x33c
	.byte	0x1
	.byte	0x5d
	.uleb128 0x1a
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x140
	.4byte	0x444
	.byte	0x1
	.byte	0x5c
	.uleb128 0x1b
	.4byte	0x4dd
	.4byte	.LBB10
	.4byte	.LBE10
	.uleb128 0x1c
	.4byte	0x539
	.uleb128 0x1c
	.4byte	0x52d
	.uleb128 0x1c
	.4byte	0x521
	.uleb128 0x1c
	.4byte	0x515
	.uleb128 0x1c
	.4byte	0x509
	.uleb128 0x1c
	.4byte	0x4fd
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.asciz	"xTimerGenericCommand"
	.byte	0x1
	.2byte	0x1a1
	.byte	0x1
	.4byte	0x163
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5f
	.4byte	0x8d6
	.uleb128 0x16
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x1a1
	.4byte	0x327
	.byte	0x1
	.byte	0x55
	.uleb128 0x17
	.asciz	"xCommandID"
	.byte	0x1
	.2byte	0x1a1
	.4byte	0x8d6
	.byte	0x1
	.byte	0x51
	.uleb128 0x17
	.asciz	"xOptionalValue"
	.byte	0x1
	.2byte	0x1a1
	.4byte	0x546
	.byte	0x1
	.byte	0x52
	.uleb128 0x17
	.asciz	"pxHigherPriorityTaskWoken"
	.byte	0x1
	.2byte	0x1a1
	.4byte	0x65f
	.byte	0x1
	.byte	0x57
	.uleb128 0x17
	.asciz	"xTicksToWait"
	.byte	0x1
	.2byte	0x1a1
	.4byte	0x546
	.byte	0x1
	.byte	0x58
	.uleb128 0x1a
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x1a3
	.4byte	0x163
	.byte	0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x1a4
	.4byte	0x4c2
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0x0
	.uleb128 0x9
	.4byte	0x163
	.uleb128 0x15
	.asciz	"prvSampleTimeNow"
	.byte	0x1
	.2byte	0x294
	.byte	0x1
	.4byte	0x195
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x1
	.byte	0x5f
	.4byte	0x986
	.uleb128 0x17
	.asciz	"pxTimerListsWereSwitched"
	.byte	0x1
	.2byte	0x294
	.4byte	0x65f
	.byte	0x1
	.byte	0x5a
	.uleb128 0x1a
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x296
	.4byte	0x195
	.byte	0x1
	.byte	0x59
	.uleb128 0x18
	.asciz	"xLastTime"
	.byte	0x1
	.2byte	0x297
	.4byte	0x195
	.byte	0x5
	.byte	0x3
	.4byte	_xLastTime.20981
	.uleb128 0x1b
	.4byte	0x555
	.4byte	.LBB12
	.4byte	.LBE12
	.uleb128 0x1d
	.4byte	.LBB13
	.4byte	.LBE13
	.uleb128 0x1e
	.4byte	0x573
	.byte	0x1
	.byte	0x5b
	.uleb128 0x1e
	.4byte	0x57f
	.byte	0x1
	.byte	0x50
	.uleb128 0x1e
	.4byte	0x593
	.byte	0x1
	.byte	0x50
	.uleb128 0x1e
	.4byte	0x5a2
	.byte	0x1
	.byte	0x58
	.uleb128 0x1f
	.4byte	0x5ae
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.asciz	"prvProcessTimerOrBlockTask"
	.byte	0x1
	.2byte	0x23e
	.byte	0x1
	.byte	0x1
	.4byte	0x9dc
	.uleb128 0xf
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x23e
	.4byte	0x546
	.uleb128 0xf
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x23e
	.4byte	0x163
	.uleb128 0x10
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x240
	.4byte	0x195
	.uleb128 0x10
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x241
	.4byte	0x163
	.byte	0x0
	.uleb128 0xe
	.asciz	"prvProcessReceivedCommands"
	.byte	0x1
	.2byte	0x2d4
	.byte	0x1
	.byte	0x1
	.4byte	0xa3e
	.uleb128 0x10
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x2d6
	.4byte	0x4c2
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x2d7
	.4byte	0x444
	.uleb128 0x10
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x2d8
	.4byte	0x163
	.uleb128 0x10
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x2d8
	.4byte	0x163
	.uleb128 0x10
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x2d9
	.4byte	0x195
	.byte	0x0
	.uleb128 0x20
	.asciz	"prvTimerTask"
	.byte	0x1
	.2byte	0x21a
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x5f
	.4byte	0xb56
	.uleb128 0x17
	.asciz	"pvParameters"
	.byte	0x1
	.2byte	0x21a
	.4byte	0xa9
	.byte	0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x21c
	.4byte	0x195
	.byte	0x1
	.byte	0x58
	.uleb128 0x10
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x21d
	.4byte	0x163
	.uleb128 0x21
	.4byte	0x9dc
	.4byte	.LBB24
	.4byte	.LBE24
	.4byte	0xace
	.uleb128 0x1d
	.4byte	.LBB25
	.4byte	.LBE25
	.uleb128 0x1e
	.4byte	0xa01
	.byte	0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x1e
	.4byte	0xa0d
	.byte	0x1
	.byte	0x58
	.uleb128 0x1e
	.4byte	0xa19
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1e
	.4byte	0xa31
	.byte	0x1
	.byte	0x50
	.uleb128 0x1f
	.4byte	0xa25
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.4byte	0x618
	.4byte	.LBB27
	.4byte	.LBE27
	.4byte	0xaf4
	.uleb128 0x1c
	.4byte	0x63b
	.uleb128 0x1d
	.4byte	.LBB28
	.4byte	.LBE28
	.uleb128 0x1f
	.4byte	0x652
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.4byte	0x986
	.4byte	.LBB29
	.4byte	.LBE29
	.uleb128 0x22
	.4byte	0x9b7
	.byte	0x1
	.byte	0x5a
	.uleb128 0x1c
	.4byte	0x9ab
	.uleb128 0x1d
	.4byte	.LBB30
	.4byte	.LBE30
	.uleb128 0x1e
	.4byte	0x9c3
	.byte	0x1
	.byte	0x5b
	.uleb128 0x1e
	.4byte	0x9cf
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1b
	.4byte	0x5c1
	.4byte	.LBB31
	.4byte	.LBE31
	.uleb128 0x1c
	.4byte	0x5ee
	.uleb128 0x1c
	.4byte	0x5e2
	.uleb128 0x1d
	.4byte	.LBB32
	.4byte	.LBE32
	.uleb128 0x1e
	.4byte	0x606
	.byte	0x1
	.byte	0x5a
	.uleb128 0x1f
	.4byte	0x5fa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.byte	0x1
	.asciz	"xTimerGetTimerDaemonTaskHandle"
	.byte	0x1
	.2byte	0x1cc
	.byte	0x1
	.4byte	0x2e6
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5f
	.uleb128 0x19
	.byte	0x1
	.asciz	"xTimerGetPeriod"
	.byte	0x1
	.2byte	0x1d5
	.byte	0x1
	.4byte	0x195
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5f
	.4byte	0xbcc
	.uleb128 0x16
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x1d5
	.4byte	0x327
	.byte	0x1
	.byte	0x50
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x1d7
	.4byte	0x444
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.asciz	"xTimerGetExpiryTime"
	.byte	0x1
	.2byte	0x1de
	.byte	0x1
	.4byte	0x195
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5f
	.4byte	0xc1f
	.uleb128 0x16
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x1de
	.4byte	0x327
	.byte	0x1
	.byte	0x50
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x1e0
	.4byte	0x444
	.uleb128 0x10
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x1e1
	.4byte	0x195
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.asciz	"pcTimerGetName"
	.byte	0x1
	.2byte	0x1e9
	.byte	0x1
	.4byte	0x2ff
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x5f
	.4byte	0xc61
	.uleb128 0x16
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x1e9
	.4byte	0x327
	.byte	0x1
	.byte	0x50
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x1eb
	.4byte	0x444
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.asciz	"xTimerIsTimerActive"
	.byte	0x1
	.2byte	0x3d5
	.byte	0x1
	.4byte	0x163
	.4byte	.LFB17
	.4byte	.LFE17
	.byte	0x1
	.byte	0x5f
	.4byte	0xcc5
	.uleb128 0x16
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x3d5
	.4byte	0x327
	.byte	0x1
	.byte	0x58
	.uleb128 0x11
	.asciz	"xTimerIsInActiveList"
	.byte	0x1
	.2byte	0x3d7
	.4byte	0x163
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x3d8
	.4byte	0x444
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.asciz	"pvTimerGetTimerID"
	.byte	0x1
	.2byte	0x3ea
	.byte	0x1
	.4byte	0xa9
	.4byte	.LFB18
	.4byte	.LFE18
	.byte	0x1
	.byte	0x5f
	.4byte	0xd1d
	.uleb128 0x16
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x3ea
	.4byte	0xd1d
	.byte	0x1
	.byte	0x58
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x3ec
	.4byte	0x613
	.uleb128 0x18
	.asciz	"pvReturn"
	.byte	0x1
	.2byte	0x3ed
	.4byte	0xa9
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x9
	.4byte	0x327
	.uleb128 0x24
	.byte	0x1
	.asciz	"vTimerSetTimerID"
	.byte	0x1
	.2byte	0x3fb
	.byte	0x1
	.4byte	.LFB19
	.4byte	.LFE19
	.byte	0x1
	.byte	0x5f
	.4byte	0xd74
	.uleb128 0x16
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x3fb
	.4byte	0x327
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.asciz	"pvNewID"
	.byte	0x1
	.2byte	0x3fb
	.4byte	0xa9
	.byte	0x1
	.byte	0x59
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x3fd
	.4byte	0x613
	.byte	0x0
	.uleb128 0x25
	.asciz	"xActiveTimerList1"
	.byte	0x1
	.byte	0xa7
	.4byte	0x2d8
	.byte	0x5
	.byte	0x3
	.4byte	_xActiveTimerList1
	.uleb128 0x25
	.asciz	"xActiveTimerList2"
	.byte	0x1
	.byte	0xa8
	.4byte	0x2d8
	.byte	0x5
	.byte	0x3
	.4byte	_xActiveTimerList2
	.uleb128 0x25
	.asciz	"pxCurrentTimerList"
	.byte	0x1
	.byte	0xa9
	.4byte	0x5bb
	.byte	0x5
	.byte	0x3
	.4byte	_pxCurrentTimerList
	.uleb128 0x25
	.asciz	"pxOverflowTimerList"
	.byte	0x1
	.byte	0xaa
	.4byte	0x5bb
	.byte	0x5
	.byte	0x3
	.4byte	_pxOverflowTimerList
	.uleb128 0x25
	.asciz	"xTimerQueue"
	.byte	0x1
	.byte	0xad
	.4byte	0x312
	.byte	0x5
	.byte	0x3
	.4byte	_xTimerQueue
	.uleb128 0x25
	.asciz	"xTimerTaskHandle"
	.byte	0x1
	.byte	0xae
	.4byte	0x2e6
	.byte	0x5
	.byte	0x3
	.4byte	_xTimerTaskHandle
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
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
	.uleb128 0x22
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0xf7
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xe2b
	.4byte	0x731
	.asciz	"xTimerCreateTimerTask"
	.4byte	0x76e
	.asciz	"xTimerCreate"
	.4byte	0x814
	.asciz	"xTimerGenericCommand"
	.4byte	0xb56
	.asciz	"xTimerGetTimerDaemonTaskHandle"
	.4byte	0xb89
	.asciz	"xTimerGetPeriod"
	.4byte	0xbcc
	.asciz	"xTimerGetExpiryTime"
	.4byte	0xc1f
	.asciz	"pcTimerGetName"
	.4byte	0xc61
	.asciz	"xTimerIsTimerActive"
	.4byte	0xcc5
	.asciz	"pvTimerGetTimerID"
	.4byte	0xd22
	.asciz	"vTimerSetTimerID"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x188
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xe2b
	.4byte	0x11e
	.asciz	"uint8_t"
	.4byte	0x13e
	.asciz	"uint16_t"
	.4byte	0x163
	.asciz	"BaseType_t"
	.4byte	0x182
	.asciz	"UBaseType_t"
	.4byte	0x195
	.asciz	"TickType_t"
	.4byte	0x1a7
	.asciz	"xLIST_ITEM"
	.4byte	0x216
	.asciz	"ListItem_t"
	.4byte	0x228
	.asciz	"xMINI_LIST_ITEM"
	.4byte	0x26e
	.asciz	"MiniListItem_t"
	.4byte	0x284
	.asciz	"xLIST"
	.4byte	0x2d8
	.asciz	"List_t"
	.4byte	0x2e6
	.asciz	"TaskHandle_t"
	.4byte	0x312
	.asciz	"QueueHandle_t"
	.4byte	0x327
	.asciz	"TimerHandle_t"
	.4byte	0x33c
	.asciz	"TimerCallbackFunction_t"
	.4byte	0x36d
	.asciz	"tmrTimerControl"
	.4byte	0x3e5
	.asciz	"xTIMER"
	.4byte	0x3f3
	.asciz	"Timer_t"
	.4byte	0x402
	.asciz	"tmrTimerParameters"
	.4byte	0x44a
	.asciz	"TimerParameter_t"
	.4byte	0x483
	.asciz	"tmrTimerQueueMessage"
	.4byte	0x4c2
	.asciz	"DaemonTaskMessage_t"
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
.LASF5:
	.asciz	"pvTimerID"
.LASF14:
	.asciz	"xMessage"
.LASF6:
	.asciz	"pxCallbackFunction"
.LASF4:
	.asciz	"uxAutoReload"
.LASF7:
	.asciz	"pxTimer"
.LASF10:
	.asciz	"xResult"
.LASF12:
	.asciz	"xReturn"
.LASF9:
	.asciz	"xNextExpireTime"
.LASF1:
	.asciz	"pxPrevious"
.LASF3:
	.asciz	"xTimerPeriodInTicks"
.LASF13:
	.asciz	"xTimer"
.LASF11:
	.asciz	"xTimeNow"
.LASF15:
	.asciz	"xListWasEmpty"
.LASF0:
	.asciz	"xItemValue"
.LASF16:
	.asciz	"xTimerListsWereSwitched"
.LASF8:
	.asciz	"pxNewTimer"
.LASF2:
	.asciz	"pcTimerName"
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
