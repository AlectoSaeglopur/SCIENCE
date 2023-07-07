	.file "C:\\Users\\Filippo\\Downloads\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\..\\source\\timers.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
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
	.type	_xTimerQueue,@object
	.size	_xTimerQueue, 2
_xTimerQueue:
	.skip	2
	.align	2
	.type	_xTimerTaskHandle,@object
	.size	_xTimerTaskHandle, 2
_xTimerTaskHandle:
	.skip	2
	.section .const,psv,page
.LC0:
	.asciz	"Tmr Svc"
	.section	.text,code
	.align	2
	.global	_xTimerCreateTimerTask	; export
	.type	_xTimerCreateTimerTask,@function
_xTimerCreateTimerTask:
.LFB0:
	.file 1 "../../source/timers.c"
	.loc 1 260 0
	.set ___PA___,1
	lnk	#10
.LCFI0:
	.loc 1 261 0
	clr	w0
	mov	w0,[w14]
	.loc 1 267 0
	rcall	_prvCheckForValidListAndQueue
	.loc 1 269 0
	mov	_xTimerQueue,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L2
.LBB2:
	.loc 1 273 0
	clr	w0
	mov	w0,[w14+2]
	.loc 1 274 0
	clr	w0
	mov	w0,[w14+4]
	.loc 1 277 0
	add	w14,#6,w2
	add	w14,#4,w1
	inc2	w14,w0
	rcall	_vApplicationGetTimerTaskMemory
	.loc 1 278 0
	mov	[w14+2],w2
	mov	[w14+4],w3
	mov	[w14+6],w0
	mov	[w14+8],w1
	mov	w2,w7
	mov	w3,w6
	mov	#4,w5
	clr	w4
	mov.d	w0,w2
	mov	#.LC0,w1
	mov	#handle(_prvTimerTask),w0
	rcall	_xTaskCreateStatic
	mov	w0,_xTimerTaskHandle
	.loc 1 286 0
	mov	_xTimerTaskHandle,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L2
	.loc 1 288 0
	mov	#1,w0
	mov	w0,[w14]
.L2:
.LBE2:
	.loc 1 308 0
	mov	[w14],w0
	.loc 1 309 0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.size	_xTimerCreateTimerTask, .-_xTimerCreateTimerTask
	.align	2
	.global	_xTimerCreate	; export
	.type	_xTimerCreate,@function
_xTimerCreate:
.LFB1:
	.loc 1 319 0
	.set ___PA___,1
	lnk	#12
.LCFI1:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	mov	w2,[w14+6]
	mov	w3,[w14+8]
	mov	w4,[w14+10]
	.loc 1 322 0
	mov	#24,w0
	rcall	_pvPortMalloc
	mov	w0,[w14]
	.loc 1 324 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L4
	.loc 1 326 0
	mov	[w14],w5
	mov	[w14+10],w4
	mov	[w14+8],w3
	mov	[w14+6],w2
	mov	[w14+4],w1
	mov	[w14+2],w0
	rcall	_prvInitialiseNewTimer
	.loc 1 333 0
	mov	[w14],w0
	clr.b	w1
	mov.b	w1,[w0+22]
.L4:
	.loc 1 338 0
	mov	[w14],w0
	.loc 1 339 0
	ulnk	
	return	
	.set ___PA___,0
.LFE1:
	.size	_xTimerCreate, .-_xTimerCreate
	.align	2
	.global	_xTimerCreateStatic	; export
	.type	_xTimerCreateStatic,@function
_xTimerCreateStatic:
.LFB2:
	.loc 1 352 0
	.set ___PA___,1
	lnk	#14
.LCFI2:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	mov	w2,[w14+6]
	mov	w3,[w14+8]
	mov	w4,[w14+10]
	mov	w5,[w14+12]
	.loc 1 367 0
	mov	[w14+12],w1
	mov	w1,[w14]
	.loc 1 369 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L6
	.loc 1 371 0
	mov	[w14],w5
	mov	[w14+10],w4
	mov	[w14+8],w3
	mov	[w14+6],w2
	mov	[w14+4],w1
	mov	[w14+2],w0
	rcall	_prvInitialiseNewTimer
	.loc 1 377 0
	mov	[w14],w0
	mov.b	#1,w1
	mov.b	w1,[w0+22]
.L6:
	.loc 1 382 0
	mov	[w14],w0
	.loc 1 383 0
	ulnk	
	return	
	.set ___PA___,0
.LFE2:
	.size	_xTimerCreateStatic, .-_xTimerCreateStatic
	.align	2
	.type	_prvInitialiseNewTimer,@function
_prvInitialiseNewTimer:
.LFB3:
	.loc 1 394 0
	.set ___PA___,1
	lnk	#12
.LCFI3:
	mov	w0,[w14]
	mov	w1,[w14+2]
	mov	w2,[w14+4]
	mov	w3,[w14+6]
	mov	w4,[w14+8]
	mov	w5,[w14+10]
	.loc 1 398 0
	mov	[w14+10],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L7
	.loc 1 402 0
	rcall	_prvCheckForValidListAndQueue
	.loc 1 406 0
	mov	[w14+10],w0
	mov	[w14],[w0]
	.loc 1 407 0
	mov	[w14+10],w0
	mov	[w14+2],w1
	mov	w1,[w0+12]
	.loc 1 408 0
	mov	[w14+10],w0
	mov	[w14+4],w1
	mov	w1,[w0+14]
	.loc 1 409 0
	mov	[w14+10],w0
	mov	[w14+6],w1
	mov	w1,[w0+16]
	.loc 1 410 0
	mov	[w14+10],w0
	mov	[w14+8],w1
	mov	w1,[w0+18]
	.loc 1 411 0
	mov	[w14+10],w0
	inc2	w0,w0
	rcall	_vListInitialiseItem
.L7:
	.loc 1 414 0
	ulnk	
	return	
	.set ___PA___,0
.LFE3:
	.size	_prvInitialiseNewTimer, .-_prvInitialiseNewTimer
	.align	2
	.global	_xTimerGenericCommand	; export
	.type	_xTimerGenericCommand,@function
_xTimerGenericCommand:
.LFB4:
	.loc 1 418 0
	.set ___PA___,1
	lnk	#18
.LCFI4:
	mov	w0,[w14+8]
	mov	w1,[w14+10]
	mov	w2,[w14+12]
	mov	w3,[w14+14]
	mov	w4,[w14+16]
	.loc 1 419 0
	clr	w0
	mov	w0,[w14]
	.loc 1 426 0
	mov	_xTimerQueue,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L10
	.loc 1 429 0
	mov	[w14+10],w1
	mov	w1,[w14+2]
	.loc 1 430 0
	mov	[w14+12],w1
	mov	w1,[w14+4]
	.loc 1 431 0
	mov	[w14+8],w0
	mov	w0,[w14+6]
	.loc 1 433 0
	mov	[w14+10],w0
	sub	w0,#5,[w15]
	.set ___BP___,0
	bra	gt,.L11
	.loc 1 435 0
	rcall	_xTaskGetSchedulerState
	sub	w0,#2,[w15]
	.set ___BP___,0
	bra	nz,.L12
	.loc 1 437 0
	mov	_xTimerQueue,w0
	inc2	w14,w1
	clr	w3
	mov	[w14+16],w2
	rcall	_xQueueGenericSend
	mov	w0,[w14]
	bra	.L10
.L12:
	.loc 1 441 0
	mov	_xTimerQueue,w0
	inc2	w14,w1
	clr	w3
	clr	w2
	rcall	_xQueueGenericSend
	mov	w0,[w14]
	bra	.L10
.L11:
	.loc 1 446 0
	mov	_xTimerQueue,w0
	inc2	w14,w1
	clr	w3
	mov	[w14+14],w2
	rcall	_xQueueGenericSendFromISR
	mov	w0,[w14]
.L10:
	.loc 1 456 0
	mov	[w14],w0
	.loc 1 457 0
	ulnk	
	return	
	.set ___PA___,0
.LFE4:
	.size	_xTimerGenericCommand, .-_xTimerGenericCommand
	.align	2
	.global	_xTimerGetTimerDaemonTaskHandle	; export
	.type	_xTimerGetTimerDaemonTaskHandle,@function
_xTimerGetTimerDaemonTaskHandle:
.LFB5:
	.loc 1 461 0
	.set ___PA___,1
	lnk	#0
.LCFI5:
	.loc 1 465 0
	mov	_xTimerTaskHandle,w0
	.loc 1 466 0
	ulnk	
	return	
	.set ___PA___,0
.LFE5:
	.size	_xTimerGetTimerDaemonTaskHandle, .-_xTimerGetTimerDaemonTaskHandle
	.align	2
	.global	_xTimerGetPeriod	; export
	.type	_xTimerGetPeriod,@function
_xTimerGetPeriod:
.LFB6:
	.loc 1 470 0
	.set ___PA___,1
	lnk	#4
.LCFI6:
	mov	w0,[w14+2]
	.loc 1 471 0
	mov	[w14+2],w1
	mov	w1,[w14]
	.loc 1 474 0
	mov	[w14],w0
	mov	[w0+12],w0
	.loc 1 475 0
	ulnk	
	return	
	.set ___PA___,0
.LFE6:
	.size	_xTimerGetPeriod, .-_xTimerGetPeriod
	.align	2
	.global	_xTimerGetExpiryTime	; export
	.type	_xTimerGetExpiryTime,@function
_xTimerGetExpiryTime:
.LFB7:
	.loc 1 479 0
	.set ___PA___,1
	lnk	#6
.LCFI7:
	mov	w0,[w14+4]
	.loc 1 480 0
	mov	[w14+4],w1
	mov	w1,[w14]
	.loc 1 484 0
	mov	[w14],w0
	mov	[w0+2],w1
	mov	w1,[w14+2]
	.loc 1 485 0
	mov	[w14+2],w0
	.loc 1 486 0
	ulnk	
	return	
	.set ___PA___,0
.LFE7:
	.size	_xTimerGetExpiryTime, .-_xTimerGetExpiryTime
	.align	2
	.global	_pcTimerGetName	; export
	.type	_pcTimerGetName,@function
_pcTimerGetName:
.LFB8:
	.loc 1 490 0
	.set ___PA___,1
	lnk	#4
.LCFI8:
	mov	w0,[w14+2]
	.loc 1 491 0
	mov	[w14+2],w1
	mov	w1,[w14]
	.loc 1 494 0
	mov	[w14],w0
	mov	[w0],w0
	.loc 1 495 0
	ulnk	
	return	
	.set ___PA___,0
.LFE8:
	.size	_pcTimerGetName, .-_pcTimerGetName
	.align	2
	.type	_prvProcessExpiredTimer,@function
_prvProcessExpiredTimer:
.LFB9:
	.loc 1 499 0
	.set ___PA___,1
	lnk	#8
.LCFI9:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	.loc 1 501 0
	mov	_pxCurrentTimerList,w0
	mov	[w0+6],w0
	mov	[w0+6],w0
	mov	w0,[w14]
	.loc 1 505 0
	inc2	[w14],w0
	rcall	_uxListRemove
	.loc 1 510 0
	mov	[w14],w0
	mov	[w0+14],w0
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L18
	.loc 1 515 0
	mov	[w14],w0
	mov	[w0+12],w1
	mov	[w14+4],w0
	add	w1,w0,w0
	mov	[w14+4],w3
	mov	[w14+6],w2
	mov	w0,w1
	mov	[w14],w0
	rcall	_prvInsertTimerInActiveList
	cp0	w0
	.set ___BP___,0
	bra	z,.L18
	.loc 1 519 0
	clr	w4
	clr	w3
	mov	[w14+4],w2
	clr	w1
	mov	[w14],w0
	rcall	_xTimerGenericCommand
	mov	w0,[w14+2]
.L18:
	.loc 1 534 0
	mov	[w14],w0
	mov	[w0+18],w1
	mov	[w14],w0
	call	w1
	.loc 1 535 0
	ulnk	
	return	
	.set ___PA___,0
.LFE9:
	.size	_prvProcessExpiredTimer, .-_prvProcessExpiredTimer
	.align	2
	.type	_prvTimerTask,@function
_prvTimerTask:
.LFB10:
	.loc 1 539 0
	.set ___PA___,1
	lnk	#6
.LCFI10:
	mov	w0,[w14+4]
.L20:
	.loc 1 562 0
	inc2	w14,w0
	rcall	_prvGetNextExpireTime
	mov	w0,[w14]
	.loc 1 566 0
	mov	[w14+2],w0
	mov	w0,w1
	mov	[w14],w0
	rcall	_prvProcessTimerOrBlockTask
	.loc 1 569 0
	rcall	_prvProcessReceivedCommands
	.loc 1 570 0
	bra	.L20
.LFE10:
	.size	_prvTimerTask, .-_prvTimerTask
	.align	2
	.type	_prvProcessTimerOrBlockTask,@function
_prvProcessTimerOrBlockTask:
.LFB11:
	.loc 1 575 0
	.set ___PA___,0
	lnk	#8
.LCFI11:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	.loc 1 579 0
	rcall	_vTaskSuspendAll
	.loc 1 586 0
	inc2	w14,w0
	rcall	_prvSampleTimeNow
	mov	w0,[w14]
	.loc 1 587 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L22
	.loc 1 590 0
	mov	[w14+6],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L23
	mov	[w14+4],w0
	sub	w0,[w14],[w15]
	.set ___BP___,0
	bra	gtu,.L23
	.loc 1 592 0
	rcall	_xTaskResumeAll
	.loc 1 593 0
	mov	[w14],w1
	mov	[w14+4],w0
	rcall	_prvProcessExpiredTimer
	bra	.L21
.L23:
	.loc 1 603 0
	mov	[w14+6],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L25
	.loc 1 607 0
	mov	_pxOverflowTimerList,w0
	mov	[w0],w0
	btsc	w0,#15
	neg	w0,w0
	dec	w0,w0
	lsr	w0,#15,w0
	mov	w0,[w14+6]
.L25:
	.loc 1 610 0
	mov	[w14+4],w0
	sub	w0,[w14],w1
	mov	_xTimerQueue,w0
	mov	[w14+6],w2
	rcall	_vQueueWaitForMessageRestricted
	.loc 1 612 0
	rcall	_xTaskResumeAll
	cp0	w0
	.set ___BP___,0
	bra	nz,.L27
	.loc 1 618 0
; 618 "../../source/timers.c" 1
	CALL _vPortYield			
NOP					  
	bra	.L21
.L22:
	.loc 1 628 0
	rcall	_xTaskResumeAll
	bra	.L21
.L27:
	.loc 1 618 0
	nop	
.L21:
	.loc 1 631 0
	ulnk	
	return	
	.set ___PA___,0
.LFE11:
	.size	_prvProcessTimerOrBlockTask, .-_prvProcessTimerOrBlockTask
	.align	2
	.type	_prvGetNextExpireTime,@function
_prvGetNextExpireTime:
.LFB12:
	.loc 1 635 0
	.set ___PA___,1
	lnk	#4
.LCFI12:
	mov	w0,[w14+2]
	.loc 1 645 0
	mov	_pxCurrentTimerList,w0
	mov	[w0],w0
	btsc	w0,#15
	neg	w0,w0
	dec	w0,w0
	lsr	w0,#15,w0
	mov	[w14+2],w1
	mov	w0,[w1]
	.loc 1 646 0
	mov	[w14+2],w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L29
	.loc 1 648 0
	mov	_pxCurrentTimerList,w0
	mov	[w0+6],w0
	mov	[w0],[w14]
	bra	.L30
.L29:
	.loc 1 653 0
	clr	w0
	mov	w0,[w14]
.L30:
	.loc 1 656 0
	mov	[w14],w0
	.loc 1 657 0
	ulnk	
	return	
	.set ___PA___,0
.LFE12:
	.size	_prvGetNextExpireTime, .-_prvGetNextExpireTime
	.align	2
	.type	_prvSampleTimeNow,@function
_prvSampleTimeNow:
.LFB13:
	.loc 1 661 0
	.set ___PA___,1
	lnk	#4
.LCFI13:
	mov	w0,[w14+2]
	.loc 1 665 0
	rcall	_xTaskGetTickCount
	mov	w0,[w14]
	.loc 1 667 0
	mov	_xLastTime.21648,w0
	mov	[w14],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L32
	.loc 1 669 0
	rcall	_prvSwitchTimerLists
	.loc 1 670 0
	mov	[w14+2],w0
	mov	#1,w1
	mov	w1,[w0]
	bra	.L33
.L32:
	.loc 1 674 0
	mov	[w14+2],w0
	clr	w1
	mov	w1,[w0]
.L33:
	.loc 1 677 0
	mov	[w14],w1
	mov	w1,_xLastTime.21648
	.loc 1 679 0
	mov	[w14],w0
	.loc 1 680 0
	ulnk	
	return	
	.set ___PA___,0
.LFE13:
	.size	_prvSampleTimeNow, .-_prvSampleTimeNow
	.align	2
	.type	_prvInsertTimerInActiveList,@function
_prvInsertTimerInActiveList:
.LFB14:
	.loc 1 684 0
	.set ___PA___,1
	lnk	#10
.LCFI14:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	mov	w2,[w14+6]
	mov	w3,[w14+8]
	.loc 1 685 0
	clr	w0
	mov	w0,[w14]
	.loc 1 687 0
	mov	[w14+2],w0
	mov	[w14+4],w1
	mov	w1,[w0+2]
	.loc 1 688 0
	mov	[w14+2],w0
	mov	[w14+2],w1
	mov	w1,[w0+8]
	.loc 1 690 0
	mov	[w14+4],w1
	mov	[w14+6],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	gtu,.L35
	.loc 1 694 0
	mov	[w14+6],w1
	mov	[w14+8],w0
	sub	w1,w0,w1
	mov	[w14+2],w0
	mov	[w0+12],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L36
	.loc 1 698 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L37
.L36:
	.loc 1 702 0
	mov	[w14+2],w0
	inc2	w0,w1
	mov	_pxOverflowTimerList,w0
	rcall	_vListInsert
	bra	.L37
.L35:
	.loc 1 707 0
	mov	[w14+6],w1
	mov	[w14+8],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L38
	mov	[w14+4],w1
	mov	[w14+8],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L38
	.loc 1 712 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L37
.L38:
	.loc 1 716 0
	mov	[w14+2],w0
	inc2	w0,w1
	mov	_pxCurrentTimerList,w0
	rcall	_vListInsert
.L37:
	.loc 1 720 0
	mov	[w14],w0
	.loc 1 721 0
	ulnk	
	return	
	.set ___PA___,0
.LFE14:
	.size	_prvInsertTimerInActiveList, .-_prvInsertTimerInActiveList
	.align	2
	.type	_prvProcessReceivedCommands,@function
_prvProcessReceivedCommands:
.LFB15:
	.loc 1 725 0
	.set ___PA___,1
	lnk	#14
.LCFI15:
	.loc 1 731 0
	bra	.L40
.L50:
	.loc 1 757 0
	mov	[w14+6],w0
	cp0	w0
	.set ___BP___,0
	bra	lt,.L40
	.loc 1 761 0
	mov	[w14+10],w1
	mov	w1,[w14]
	.loc 1 763 0
	mov	[w14],w0
	mov	[w0+10],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L41
	.loc 1 766 0
	inc2	[w14],w0
	rcall	_uxListRemove
.L41:
	.loc 1 781 0
	add	w14,#12,w0
	rcall	_prvSampleTimeNow
	mov	w0,[w14+2]
	.loc 1 783 0
	mov	[w14+6],w0
	sub	w0,#5,[w15]
	.set ___BP___,0
	bra	z,.L46
	sub	w0,#5,[w15]
	.set ___BP___,0
	bra	gt,.L47
	sub	w0,#3,[w15]
	.set ___BP___,0
	bra	z,.L51
	sub	w0,#3,[w15]
	.set ___BP___,0
	bra	gt,.L45
	cp0	w0
	.set ___BP___,0
	bra	lt,.L52
	bra	.L43
.L47:
	sub	w0,#8,[w15]
	.set ___BP___,0
	bra	z,.L53
	sub	w0,#8,[w15]
	.set ___BP___,0
	bra	lt,.L43
	sub	w0,#9,[w15]
	.set ___BP___,0
	bra	z,.L45
	.loc 1 864 0
	bra	.L40
.L43:
	.loc 1 791 0
	mov	[w14+8],w1
	mov	[w14+8],w2
	mov	[w14],w0
	mov	[w0+12],w0
	add	w2,w0,w0
	mov	w1,w3
	mov	[w14+2],w2
	mov	w0,w1
	mov	[w14],w0
	rcall	_prvInsertTimerInActiveList
	cp0	w0
	.set ___BP___,0
	bra	z,.L54
	.loc 1 795 0
	mov	[w14],w0
	mov	[w0+18],w1
	mov	[w14],w0
	call	w1
	.loc 1 798 0
	mov	[w14],w0
	mov	[w0+14],w0
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L55
	.loc 1 800 0
	mov	[w14+8],w1
	mov	[w14],w0
	mov	[w0+12],w0
	add	w1,w0,w0
	clr	w4
	clr	w3
	mov	w0,w2
	clr	w1
	mov	[w14],w0
	rcall	_xTimerGenericCommand
	mov	w0,[w14+4]
	.loc 1 813 0
	bra	.L40
.L45:
	.loc 1 823 0
	mov	[w14+8],w1
	mov	[w14],w0
	mov	w1,[w0+12]
	.loc 1 832 0
	mov	[w14],w0
	mov	[w0+12],w1
	mov	[w14+2],w0
	add	w1,w0,w0
	mov	[w14+2],w3
	mov	[w14+2],w2
	mov	w0,w1
	mov	[w14],w0
	rcall	_prvInsertTimerInActiveList
	.loc 1 833 0
	bra	.L40
.L46:
	.loc 1 850 0
	mov	[w14],w0
	mov.b	[w0+22],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L56
	.loc 1 852 0
	mov	[w14],w0
	rcall	_vPortFree
	.loc 1 860 0
	bra	.L40
.L51:
	.loc 1 819 0
	nop	
	bra	.L40
.L52:
	.loc 1 864 0
	nop	
	bra	.L40
.L53:
	.loc 1 819 0
	nop	
	bra	.L40
.L54:
	.loc 1 813 0
	nop	
	bra	.L40
.L55:
	nop	
	bra	.L40
.L56:
	.loc 1 860 0
	nop	
.L40:
	.loc 1 731 0
	mov	_xTimerQueue,w0
	add	w14,#6,w1
	clr	w3
	clr	w2
	rcall	_xQueueGenericReceive
	cp0	w0
	.set ___BP___,0
	bra	nz,.L50
	.loc 1 868 0
	ulnk	
	return	
	.set ___PA___,0
.LFE15:
	.size	_prvProcessReceivedCommands, .-_prvProcessReceivedCommands
	.align	2
	.type	_prvSwitchTimerLists,@function
_prvSwitchTimerLists:
.LFB16:
	.loc 1 872 0
	.set ___PA___,1
	lnk	#10
.LCFI16:
	.loc 1 882 0
	bra	.L58
.L60:
	.loc 1 884 0
	mov	_pxCurrentTimerList,w0
	mov	[w0+6],w0
	mov	[w0],[w14]
	.loc 1 887 0
	mov	_pxCurrentTimerList,w0
	mov	[w0+6],w0
	mov	[w0+6],w0
	mov	w0,[w14+2]
	.loc 1 888 0
	mov	[w14+2],w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 894 0
	mov	[w14+2],w0
	mov	[w0+18],w1
	mov	[w14+2],w0
	call	w1
	.loc 1 896 0
	mov	[w14+2],w0
	mov	[w0+14],w0
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L58
	.loc 1 904 0
	mov	[w14+2],w0
	mov	[w0+12],w0
	add	w0,[w14],w0
	mov	w0,[w14+4]
	.loc 1 905 0
	mov	[w14+4],w0
	sub	w0,[w14],[w15]
	.set ___BP___,0
	bra	leu,.L59
	.loc 1 907 0
	mov	[w14+2],w0
	mov	[w14+4],w1
	mov	w1,[w0+2]
	.loc 1 908 0
	mov	[w14+2],w0
	mov	[w14+2],w1
	mov	w1,[w0+8]
	.loc 1 909 0
	mov	[w14+2],w0
	inc2	w0,w1
	mov	_pxCurrentTimerList,w0
	rcall	_vListInsert
	bra	.L58
.L59:
	.loc 1 913 0
	clr	w4
	clr	w3
	mov	[w14],w2
	clr	w1
	mov	[w14+2],w0
	rcall	_xTimerGenericCommand
	mov	w0,[w14+6]
.L58:
	.loc 1 882 0
	mov	_pxCurrentTimerList,w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L60
	.loc 1 924 0
	mov	_pxCurrentTimerList,w1
	mov	w1,[w14+8]
	.loc 1 925 0
	mov	_pxOverflowTimerList,w0
	mov	w0,_pxCurrentTimerList
	.loc 1 926 0
	mov	[w14+8],w1
	mov	w1,_pxOverflowTimerList
	.loc 1 927 0
	ulnk	
	return	
	.set ___PA___,0
.LFE16:
	.size	_prvSwitchTimerLists, .-_prvSwitchTimerLists
	.align	2
	.type	_prvCheckForValidListAndQueue,@function
_prvCheckForValidListAndQueue:
.LFB17:
	.loc 1 931 0
	.set ___PA___,1
	lnk	#0
.LCFI17:
	.loc 1 935 0
	rcall	_vPortEnterCritical
	.loc 1 937 0
	mov	_xTimerQueue,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L62
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
.LBB3:
	.loc 1 951 0
	clr.b	w4
	mov	#_xStaticTimerQueue.21693,w3
	mov	#_ucStaticTimerQueueStorage.21694,w2
	mov	#6,w1
	mov	#20,w0
	rcall	_xQueueGenericCreateStatic
	mov	w0,_xTimerQueue
.L62:
.LBE3:
	.loc 1 977 0
	rcall	_vPortExitCritical
	.loc 1 978 0
	ulnk	
	return	
	.set ___PA___,0
.LFE17:
	.size	_prvCheckForValidListAndQueue, .-_prvCheckForValidListAndQueue
	.align	2
	.global	_xTimerIsTimerActive	; export
	.type	_xTimerIsTimerActive,@function
_xTimerIsTimerActive:
.LFB18:
	.loc 1 982 0
	.set ___PA___,1
	lnk	#6
.LCFI18:
	mov	w0,[w14+4]
	.loc 1 984 0
	mov	[w14+4],w1
	mov	w1,[w14]
	.loc 1 989 0
	rcall	_vPortEnterCritical
	.loc 1 994 0
	mov	[w14],w0
	mov	[w0+10],w0
	btsc	w0,#15
	neg	w0,w0
	neg	w0,w0
	lsr	w0,#15,w0
	mov	w0,[w14+2]
	.loc 1 996 0
	rcall	_vPortExitCritical
	.loc 1 998 0
	mov	[w14+2],w0
	.loc 1 999 0
	ulnk	
	return	
	.set ___PA___,0
.LFE18:
	.size	_xTimerIsTimerActive, .-_xTimerIsTimerActive
	.align	2
	.global	_pvTimerGetTimerID	; export
	.type	_pvTimerGetTimerID,@function
_pvTimerGetTimerID:
.LFB19:
	.loc 1 1003 0
	.set ___PA___,1
	lnk	#6
.LCFI19:
	mov	w0,[w14+4]
	.loc 1 1004 0
	mov	[w14+4],w1
	mov	w1,[w14]
	.loc 1 1009 0
	rcall	_vPortEnterCritical
	.loc 1 1011 0
	mov	[w14],w0
	mov	[w0+16],w1
	mov	w1,[w14+2]
	.loc 1 1013 0
	rcall	_vPortExitCritical
	.loc 1 1015 0
	mov	[w14+2],w0
	.loc 1 1016 0
	ulnk	
	return	
	.set ___PA___,0
.LFE19:
	.size	_pvTimerGetTimerID, .-_pvTimerGetTimerID
	.align	2
	.global	_vTimerSetTimerID	; export
	.type	_vTimerSetTimerID,@function
_vTimerSetTimerID:
.LFB20:
	.loc 1 1020 0
	.set ___PA___,1
	lnk	#6
.LCFI20:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	.loc 1 1021 0
	mov	[w14+2],w1
	mov	w1,[w14]
	.loc 1 1025 0
	rcall	_vPortEnterCritical
	.loc 1 1027 0
	mov	[w14],w0
	mov	[w14+4],w1
	mov	w1,[w0+16]
	.loc 1 1029 0
	rcall	_vPortExitCritical
	.loc 1 1030 0
	ulnk	
	return	
	.set ___PA___,0
.LFE20:
	.size	_vTimerSetTimerID, .-_vTimerSetTimerID
	.section	.bss,bss
	.type	_ucStaticTimerQueueStorage.21694,@object
	.size	_ucStaticTimerQueueStorage.21694, 120
_ucStaticTimerQueueStorage.21694:
	.skip	120
	.align	2
	.type	_xStaticTimerQueue.21693,@object
	.size	_xStaticTimerQueue.21693, 42
_xStaticTimerQueue.21693:
	.skip	42
	.section	.nbss,bss,near
	.align	2
	.type	_xLastTime.21648,@object
	.size	_xLastTime.21648, 2
_xLastTime.21648:
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
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI1-.LFB1
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
	.4byte	.LCFI2-.LFB2
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
	.4byte	.LCFI3-.LFB3
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
	.4byte	.LCFI4-.LFB4
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
	.4byte	.LCFI5-.LFB5
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
	.4byte	.LCFI6-.LFB6
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
	.4byte	.LCFI7-.LFB7
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
	.4byte	.LCFI8-.LFB8
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
	.4byte	.LCFI9-.LFB9
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
	.4byte	.LCFI10-.LFB10
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
	.4byte	.LCFI11-.LFB11
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
	.4byte	.LCFI12-.LFB12
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
	.4byte	.LCFI13-.LFB13
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
	.4byte	.LCFI14-.LFB14
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
	.4byte	.LCFI15-.LFB15
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
	.4byte	.LCFI16-.LFB16
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
	.4byte	.LCFI17-.LFB17
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
	.4byte	.LCFI18-.LFB18
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
	.4byte	.LCFI19-.LFB19
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
	.4byte	.LCFI20-.LFB20
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE40:
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 3 "../../source/include/../../Source/portable/MPLAB/PIC24_dsPIC/portmacro.h"
	.file 4 "../../source/include/FreeRTOS.h"
	.file 5 "../../source/include/list.h"
	.file 6 "../../source/include/task.h"
	.file 7 "../../source/include/queue.h"
	.file 8 "../../source/include/timers.h"
	.section	.debug_info,info
	.4byte	0x13da
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../../source/timers.c"
	.asciz	"C:\\Users\\Filippo\\Downloads\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1"
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
	.4byte	0x12f
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x2
	.byte	0x31
	.4byte	0xee
	.uleb128 0x4
	.asciz	"uint32_t"
	.byte	0x2
	.byte	0x37
	.4byte	0x160
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x4
	.asciz	"StackType_t"
	.byte	0x3
	.byte	0x60
	.4byte	0x140
	.uleb128 0x4
	.asciz	"BaseType_t"
	.byte	0x3
	.byte	0x61
	.4byte	0x1a2
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"UBaseType_t"
	.byte	0x3
	.byte	0x62
	.4byte	0xd8
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x3
	.byte	0x65
	.4byte	0x140
	.uleb128 0x5
	.asciz	"xSTATIC_LIST_ITEM"
	.byte	0xa
	.byte	0x4
	.2byte	0x370
	.4byte	0x212
	.uleb128 0x6
	.asciz	"xDummy1"
	.byte	0x4
	.2byte	0x372
	.4byte	0x1c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x4
	.2byte	0x373
	.4byte	0x212
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x8
	.4byte	0xab
	.4byte	0x222
	.uleb128 0x9
	.4byte	0xee
	.byte	0x3
	.byte	0x0
	.uleb128 0xa
	.asciz	"StaticListItem_t"
	.byte	0x4
	.2byte	0x375
	.4byte	0x1d4
	.uleb128 0x5
	.asciz	"xSTATIC_MINI_LIST_ITEM"
	.byte	0x6
	.byte	0x4
	.2byte	0x378
	.4byte	0x27e
	.uleb128 0x6
	.asciz	"xDummy1"
	.byte	0x4
	.2byte	0x37a
	.4byte	0x1c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x4
	.2byte	0x37b
	.4byte	0x27e
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x8
	.4byte	0xab
	.4byte	0x28e
	.uleb128 0x9
	.4byte	0xee
	.byte	0x1
	.byte	0x0
	.uleb128 0xa
	.asciz	"StaticMiniListItem_t"
	.byte	0x4
	.2byte	0x37d
	.4byte	0x23b
	.uleb128 0x5
	.asciz	"xSTATIC_LIST"
	.byte	0xa
	.byte	0x4
	.2byte	0x380
	.4byte	0x2f4
	.uleb128 0x6
	.asciz	"uxDummy1"
	.byte	0x4
	.2byte	0x382
	.4byte	0x1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x4
	.2byte	0x383
	.4byte	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x7
	.4byte	.LASF1
	.byte	0x4
	.2byte	0x384
	.4byte	0x28e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xa
	.asciz	"StaticList_t"
	.byte	0x4
	.2byte	0x385
	.4byte	0x2ab
	.uleb128 0x5
	.asciz	"xSTATIC_TCB"
	.byte	0x36
	.byte	0x4
	.2byte	0x394
	.4byte	0x40b
	.uleb128 0x6
	.asciz	"pxDummy1"
	.byte	0x4
	.2byte	0x396
	.4byte	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.4byte	.LASF1
	.byte	0x4
	.2byte	0x39a
	.4byte	0x40b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.asciz	"uxDummy5"
	.byte	0x4
	.2byte	0x39b
	.4byte	0x1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x6
	.asciz	"pxDummy6"
	.byte	0x4
	.2byte	0x39c
	.4byte	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.4byte	.LASF2
	.byte	0x4
	.2byte	0x39d
	.4byte	0x41b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x6
	.asciz	"pxDummy8"
	.byte	0x4
	.2byte	0x39f
	.4byte	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x6
	.asciz	"uxDummy10"
	.byte	0x4
	.2byte	0x3a5
	.4byte	0x42b
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.asciz	"uxDummy12"
	.byte	0x4
	.2byte	0x3a8
	.4byte	0x42b
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.asciz	"ulDummy16"
	.byte	0x4
	.2byte	0x3b1
	.4byte	0x150
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x6
	.asciz	"ulDummy18"
	.byte	0x4
	.2byte	0x3b7
	.4byte	0x150
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x6
	.asciz	"ucDummy19"
	.byte	0x4
	.2byte	0x3b8
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x6
	.asciz	"uxDummy20"
	.byte	0x4
	.2byte	0x3bb
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x8
	.4byte	0x222
	.4byte	0x41b
	.uleb128 0x9
	.4byte	0xee
	.byte	0x1
	.byte	0x0
	.uleb128 0x8
	.4byte	0x120
	.4byte	0x42b
	.uleb128 0x9
	.4byte	0xee
	.byte	0x7
	.byte	0x0
	.uleb128 0x8
	.4byte	0x1af
	.4byte	0x43b
	.uleb128 0x9
	.4byte	0xee
	.byte	0x1
	.byte	0x0
	.uleb128 0xa
	.asciz	"StaticTask_t"
	.byte	0x4
	.2byte	0x3be
	.4byte	0x309
	.uleb128 0xb
	.byte	0x2
	.byte	0x4
	.2byte	0x3d2
	.4byte	0x477
	.uleb128 0xc
	.4byte	.LASF0
	.byte	0x4
	.2byte	0x3d4
	.4byte	0xab
	.uleb128 0xd
	.asciz	"uxDummy2"
	.byte	0x4
	.2byte	0x3d5
	.4byte	0x1af
	.byte	0x0
	.uleb128 0x5
	.asciz	"xSTATIC_QUEUE"
	.byte	0x2a
	.byte	0x4
	.2byte	0x3ce
	.4byte	0x519
	.uleb128 0x7
	.4byte	.LASF3
	.byte	0x4
	.2byte	0x3d0
	.4byte	0x519
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"u"
	.byte	0x4
	.2byte	0x3d6
	.4byte	0x450
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x7
	.4byte	.LASF1
	.byte	0x4
	.2byte	0x3d8
	.4byte	0x529
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.4byte	.LASF4
	.byte	0x4
	.2byte	0x3d9
	.4byte	0x539
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.asciz	"ucDummy5"
	.byte	0x4
	.2byte	0x3da
	.4byte	0x549
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x6
	.asciz	"ucDummy6"
	.byte	0x4
	.2byte	0x3dd
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.asciz	"uxDummy8"
	.byte	0x4
	.2byte	0x3e5
	.4byte	0x1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0x6
	.asciz	"ucDummy9"
	.byte	0x4
	.2byte	0x3e6
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x8
	.4byte	0xab
	.4byte	0x529
	.uleb128 0x9
	.4byte	0xee
	.byte	0x2
	.byte	0x0
	.uleb128 0x8
	.4byte	0x2f4
	.4byte	0x539
	.uleb128 0x9
	.4byte	0xee
	.byte	0x1
	.byte	0x0
	.uleb128 0x8
	.4byte	0x1af
	.4byte	0x549
	.uleb128 0x9
	.4byte	0xee
	.byte	0x2
	.byte	0x0
	.uleb128 0x8
	.4byte	0x120
	.4byte	0x559
	.uleb128 0x9
	.4byte	0xee
	.byte	0x1
	.byte	0x0
	.uleb128 0xa
	.asciz	"StaticQueue_t"
	.byte	0x4
	.2byte	0x3e9
	.4byte	0x477
	.uleb128 0x5
	.asciz	"xSTATIC_TIMER"
	.byte	0x18
	.byte	0x4
	.2byte	0x417
	.4byte	0x5fe
	.uleb128 0x7
	.4byte	.LASF3
	.byte	0x4
	.2byte	0x419
	.4byte	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"xDummy2"
	.byte	0x4
	.2byte	0x41a
	.4byte	0x222
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x7
	.4byte	.LASF1
	.byte	0x4
	.2byte	0x41b
	.4byte	0x1c2
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x7
	.4byte	.LASF4
	.byte	0x4
	.2byte	0x41c
	.4byte	0x1af
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0x6
	.asciz	"pvDummy5"
	.byte	0x4
	.2byte	0x41d
	.4byte	0x27e
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.asciz	"uxDummy6"
	.byte	0x4
	.2byte	0x41f
	.4byte	0x1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x7
	.4byte	.LASF2
	.byte	0x4
	.2byte	0x423
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.byte	0x0
	.uleb128 0xa
	.asciz	"StaticTimer_t"
	.byte	0x4
	.2byte	0x426
	.4byte	0x56f
	.uleb128 0xe
	.asciz	"xLIST_ITEM"
	.byte	0xa
	.byte	0x5
	.byte	0xb5
	.4byte	0x67d
	.uleb128 0xf
	.4byte	.LASF5
	.byte	0x5
	.byte	0xb8
	.4byte	0x1c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.asciz	"pxNext"
	.byte	0x5
	.byte	0xb9
	.4byte	0x67d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xf
	.4byte	.LASF6
	.byte	0x5
	.byte	0xba
	.4byte	0x67d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x10
	.asciz	"pvOwner"
	.byte	0x5
	.byte	0xbb
	.4byte	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x10
	.asciz	"pvContainer"
	.byte	0x5
	.byte	0xbc
	.4byte	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x11
	.byte	0x2
	.4byte	0x614
	.uleb128 0x4
	.asciz	"ListItem_t"
	.byte	0x5
	.byte	0xbf
	.4byte	0x614
	.uleb128 0xe
	.asciz	"xMINI_LIST_ITEM"
	.byte	0x6
	.byte	0x5
	.byte	0xc1
	.4byte	0x6db
	.uleb128 0xf
	.4byte	.LASF5
	.byte	0x5
	.byte	0xc4
	.4byte	0x1c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.asciz	"pxNext"
	.byte	0x5
	.byte	0xc5
	.4byte	0x67d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xf
	.4byte	.LASF6
	.byte	0x5
	.byte	0xc6
	.4byte	0x67d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.asciz	"MiniListItem_t"
	.byte	0x5
	.byte	0xc8
	.4byte	0x695
	.uleb128 0xe
	.asciz	"xLIST"
	.byte	0xa
	.byte	0x5
	.byte	0xcd
	.4byte	0x73f
	.uleb128 0x10
	.asciz	"uxNumberOfItems"
	.byte	0x5
	.byte	0xd0
	.4byte	0x1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.asciz	"pxIndex"
	.byte	0x5
	.byte	0xd1
	.4byte	0x73f
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x10
	.asciz	"xListEnd"
	.byte	0x5
	.byte	0xd2
	.4byte	0x6db
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x11
	.byte	0x2
	.4byte	0x683
	.uleb128 0x4
	.asciz	"List_t"
	.byte	0x5
	.byte	0xd4
	.4byte	0x6f1
	.uleb128 0x4
	.asciz	"TaskHandle_t"
	.byte	0x6
	.byte	0x67
	.4byte	0xab
	.uleb128 0x12
	.4byte	0x76c
	.uleb128 0x11
	.byte	0x2
	.4byte	0x772
	.uleb128 0x12
	.4byte	0x175
	.uleb128 0x11
	.byte	0x2
	.4byte	0x17d
	.uleb128 0x4
	.asciz	"QueueHandle_t"
	.byte	0x7
	.byte	0x58
	.4byte	0xab
	.uleb128 0x4
	.asciz	"TimerHandle_t"
	.byte	0x8
	.byte	0x76
	.4byte	0xab
	.uleb128 0x4
	.asciz	"TimerCallbackFunction_t"
	.byte	0x8
	.byte	0x7b
	.4byte	0x7c6
	.uleb128 0x11
	.byte	0x2
	.4byte	0x7cc
	.uleb128 0x13
	.byte	0x1
	.4byte	0x7d8
	.uleb128 0x14
	.4byte	0x792
	.byte	0x0
	.uleb128 0xe
	.asciz	"tmrTimerControl"
	.byte	0x18
	.byte	0x1
	.byte	0x68
	.4byte	0x888
	.uleb128 0xf
	.4byte	.LASF7
	.byte	0x1
	.byte	0x6a
	.4byte	0x76c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.asciz	"xTimerListItem"
	.byte	0x1
	.byte	0x6b
	.4byte	0x683
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xf
	.4byte	.LASF8
	.byte	0x1
	.byte	0x6c
	.4byte	0x1c2
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xf
	.4byte	.LASF9
	.byte	0x1
	.byte	0x6d
	.4byte	0x1af
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xf
	.4byte	.LASF10
	.byte	0x1
	.byte	0x6e
	.4byte	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xf
	.4byte	.LASF11
	.byte	0x1
	.byte	0x6f
	.4byte	0x7a7
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x10
	.asciz	"uxTimerNumber"
	.byte	0x1
	.byte	0x71
	.4byte	0x1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x10
	.asciz	"ucStaticallyAllocated"
	.byte	0x1
	.byte	0x75
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x4
	.asciz	"xTIMER"
	.byte	0x1
	.byte	0x77
	.4byte	0x7d8
	.uleb128 0x4
	.asciz	"Timer_t"
	.byte	0x1
	.byte	0x7b
	.4byte	0x888
	.uleb128 0xe
	.asciz	"tmrTimerParameters"
	.byte	0x4
	.byte	0x1
	.byte	0x82
	.4byte	0x8e7
	.uleb128 0x10
	.asciz	"xMessageValue"
	.byte	0x1
	.byte	0x84
	.4byte	0x1c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xf
	.4byte	.LASF12
	.byte	0x1
	.byte	0x85
	.4byte	0x8e7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x11
	.byte	0x2
	.4byte	0x896
	.uleb128 0x4
	.asciz	"TimerParameter_t"
	.byte	0x1
	.byte	0x86
	.4byte	0x8a5
	.uleb128 0x15
	.byte	0x4
	.byte	0x1
	.byte	0x95
	.4byte	0x926
	.uleb128 0x16
	.asciz	"xTimerParameters"
	.byte	0x1
	.byte	0x97
	.4byte	0x8ed
	.byte	0x0
	.uleb128 0xe
	.asciz	"tmrTimerQueueMessage"
	.byte	0x6
	.byte	0x1
	.byte	0x92
	.4byte	0x965
	.uleb128 0x10
	.asciz	"xMessageID"
	.byte	0x1
	.byte	0x94
	.4byte	0x190
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.asciz	"u"
	.byte	0x1
	.byte	0x9e
	.4byte	0x905
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x4
	.asciz	"DaemonTaskMessage_t"
	.byte	0x1
	.byte	0x9f
	.4byte	0x926
	.uleb128 0x17
	.byte	0x1
	.asciz	"xTimerCreateTimerTask"
	.byte	0x1
	.2byte	0x103
	.byte	0x1
	.4byte	0x190
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0xa2a
	.uleb128 0x18
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x105
	.4byte	0x190
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x19
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x1a
	.asciz	"pxTimerTaskTCBBuffer"
	.byte	0x1
	.2byte	0x111
	.4byte	0xa2a
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1a
	.asciz	"pxTimerTaskStackBuffer"
	.byte	0x1
	.2byte	0x112
	.4byte	0x777
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1a
	.asciz	"ulTimerTaskStackSize"
	.byte	0x1
	.2byte	0x113
	.4byte	0x150
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.byte	0x2
	.4byte	0x43b
	.uleb128 0x17
	.byte	0x1
	.asciz	"xTimerCreate"
	.byte	0x1
	.2byte	0x13a
	.byte	0x1
	.4byte	0x792
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.4byte	0xab0
	.uleb128 0x1b
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x13a
	.4byte	0x767
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1b
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x13b
	.4byte	0xab0
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x13c
	.4byte	0xab5
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1b
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x13d
	.4byte	0xaba
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1b
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x13e
	.4byte	0x7a7
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x18
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x140
	.4byte	0x8e7
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x12
	.4byte	0x1c2
	.uleb128 0x12
	.4byte	0x1af
	.uleb128 0x12
	.4byte	0xab
	.uleb128 0x17
	.byte	0x1
	.asciz	"xTimerCreateStatic"
	.byte	0x1
	.2byte	0x15a
	.byte	0x1
	.4byte	0x792
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.4byte	0xb5e
	.uleb128 0x1b
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x15a
	.4byte	0x767
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1b
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x15b
	.4byte	0xab0
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x15c
	.4byte	0xab5
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1b
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x15d
	.4byte	0xaba
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1b
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x15e
	.4byte	0x7a7
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x1c
	.asciz	"pxTimerBuffer"
	.byte	0x1
	.2byte	0x15f
	.4byte	0xb5e
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x18
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x161
	.4byte	0x8e7
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x11
	.byte	0x2
	.4byte	0x5fe
	.uleb128 0x1d
	.asciz	"prvInitialiseNewTimer"
	.byte	0x1
	.2byte	0x184
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5e
	.4byte	0xbe8
	.uleb128 0x1b
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x184
	.4byte	0x767
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1b
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x185
	.4byte	0xab0
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1b
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x186
	.4byte	0xab5
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x187
	.4byte	0xaba
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1b
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x188
	.4byte	0x7a7
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1b
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x189
	.4byte	0x8e7
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.asciz	"xTimerGenericCommand"
	.byte	0x1
	.2byte	0x1a1
	.byte	0x1
	.4byte	0x190
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5e
	.4byte	0xcb0
	.uleb128 0x1b
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x1a1
	.4byte	0x792
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1c
	.asciz	"xCommandID"
	.byte	0x1
	.2byte	0x1a1
	.4byte	0xcb0
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x1c
	.asciz	"xOptionalValue"
	.byte	0x1
	.2byte	0x1a1
	.4byte	0xab0
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x1c
	.asciz	"pxHigherPriorityTaskWoken"
	.byte	0x1
	.2byte	0x1a1
	.4byte	0xcb5
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x1c
	.asciz	"xTicksToWait"
	.byte	0x1
	.2byte	0x1a1
	.4byte	0xab0
	.byte	0x2
	.byte	0x7e
	.sleb128 16
	.uleb128 0x18
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x1a3
	.4byte	0x190
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x1a4
	.4byte	0x965
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x12
	.4byte	0x190
	.uleb128 0x12
	.4byte	0xcba
	.uleb128 0x11
	.byte	0x2
	.4byte	0x190
	.uleb128 0x1e
	.byte	0x1
	.asciz	"xTimerGetTimerDaemonTaskHandle"
	.byte	0x1
	.2byte	0x1cc
	.byte	0x1
	.4byte	0x753
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5e
	.uleb128 0x17
	.byte	0x1
	.asciz	"xTimerGetPeriod"
	.byte	0x1
	.2byte	0x1d5
	.byte	0x1
	.4byte	0x1c2
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5e
	.4byte	0xd3a
	.uleb128 0x1b
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x1d5
	.4byte	0x792
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x1d7
	.4byte	0x8e7
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.asciz	"xTimerGetExpiryTime"
	.byte	0x1
	.2byte	0x1de
	.byte	0x1
	.4byte	0x1c2
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x5e
	.4byte	0xd94
	.uleb128 0x1b
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x1de
	.4byte	0x792
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x18
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x1e0
	.4byte	0x8e7
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x1e1
	.4byte	0x1c2
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.asciz	"pcTimerGetName"
	.byte	0x1
	.2byte	0x1e9
	.byte	0x1
	.4byte	0x76c
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x5e
	.4byte	0xdda
	.uleb128 0x1b
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x1e9
	.4byte	0x792
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x1eb
	.4byte	0x8e7
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1d
	.asciz	"prvProcessExpiredTimer"
	.byte	0x1
	.2byte	0x1f2
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x5e
	.4byte	0xe41
	.uleb128 0x1b
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x1f2
	.4byte	0xab0
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x1f2
	.4byte	0xab0
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x18
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x1f4
	.4byte	0x190
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x1f5
	.4byte	0xe41
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x12
	.4byte	0x8e7
	.uleb128 0x1d
	.asciz	"prvTimerTask"
	.byte	0x1
	.2byte	0x21a
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x5e
	.4byte	0xe9d
	.uleb128 0x1c
	.asciz	"pvParameters"
	.byte	0x1
	.2byte	0x21a
	.4byte	0xab
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x18
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x21c
	.4byte	0x1c2
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x21d
	.4byte	0x190
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x1d
	.asciz	"prvProcessTimerOrBlockTask"
	.byte	0x1
	.2byte	0x23e
	.byte	0x1
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x1
	.byte	0x5e
	.4byte	0xf08
	.uleb128 0x1b
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x23e
	.4byte	0xab0
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x23e
	.4byte	0x190
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x18
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x240
	.4byte	0x1c2
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x241
	.4byte	0x190
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x1f
	.asciz	"prvGetNextExpireTime"
	.byte	0x1
	.2byte	0x27a
	.byte	0x1
	.4byte	0x1c2
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x1
	.byte	0x5e
	.4byte	0xf5e
	.uleb128 0x1c
	.asciz	"pxListWasEmpty"
	.byte	0x1
	.2byte	0x27a
	.4byte	0xcb5
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x27c
	.4byte	0x1c2
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1f
	.asciz	"prvSampleTimeNow"
	.byte	0x1
	.2byte	0x294
	.byte	0x1
	.4byte	0x1c2
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x1
	.byte	0x5e
	.4byte	0xfd2
	.uleb128 0x1c
	.asciz	"pxTimerListsWereSwitched"
	.byte	0x1
	.2byte	0x294
	.4byte	0xcb5
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x296
	.4byte	0x1c2
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1a
	.asciz	"xLastTime"
	.byte	0x1
	.2byte	0x297
	.4byte	0x1c2
	.byte	0x5
	.byte	0x3
	.4byte	_xLastTime.21648
	.byte	0x0
	.uleb128 0x1f
	.asciz	"prvInsertTimerInActiveList"
	.byte	0x1
	.2byte	0x2ab
	.byte	0x1
	.4byte	0x190
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x1
	.byte	0x5e
	.4byte	0x1072
	.uleb128 0x1b
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x2ab
	.4byte	0xe41
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1c
	.asciz	"xNextExpiryTime"
	.byte	0x1
	.2byte	0x2ab
	.4byte	0xab0
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x2ab
	.4byte	0xab0
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1c
	.asciz	"xCommandTime"
	.byte	0x1
	.2byte	0x2ab
	.4byte	0xab0
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x1a
	.asciz	"xProcessTimerNow"
	.byte	0x1
	.2byte	0x2ad
	.4byte	0x190
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1d
	.asciz	"prvProcessReceivedCommands"
	.byte	0x1
	.2byte	0x2d4
	.byte	0x1
	.4byte	.LFB15
	.4byte	.LFE15
	.byte	0x1
	.byte	0x5e
	.4byte	0x10ec
	.uleb128 0x18
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x2d6
	.4byte	0x965
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x18
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x2d7
	.4byte	0x8e7
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x2d8
	.4byte	0x190
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x18
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x2d8
	.4byte	0x190
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x18
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x2d9
	.4byte	0x1c2
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x1d
	.asciz	"prvSwitchTimerLists"
	.byte	0x1
	.2byte	0x367
	.byte	0x1
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x1
	.byte	0x5e
	.4byte	0x116a
	.uleb128 0x18
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x369
	.4byte	0x1c2
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1a
	.asciz	"xReloadTime"
	.byte	0x1
	.2byte	0x369
	.4byte	0x1c2
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1a
	.asciz	"pxTemp"
	.byte	0x1
	.2byte	0x36a
	.4byte	0x116a
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x18
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x36b
	.4byte	0x8e7
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x36c
	.4byte	0x190
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.byte	0x0
	.uleb128 0x11
	.byte	0x2
	.4byte	0x745
	.uleb128 0x1d
	.asciz	"prvCheckForValidListAndQueue"
	.byte	0x1
	.2byte	0x3a2
	.byte	0x1
	.4byte	.LFB17
	.4byte	.LFE17
	.byte	0x1
	.byte	0x5e
	.4byte	0x11f3
	.uleb128 0x19
	.4byte	.LBB3
	.4byte	.LBE3
	.uleb128 0x1a
	.asciz	"xStaticTimerQueue"
	.byte	0x1
	.2byte	0x3b4
	.4byte	0x559
	.byte	0x5
	.byte	0x3
	.4byte	_xStaticTimerQueue.21693
	.uleb128 0x1a
	.asciz	"ucStaticTimerQueueStorage"
	.byte	0x1
	.2byte	0x3b5
	.4byte	0x11f3
	.byte	0x5
	.byte	0x3
	.4byte	_ucStaticTimerQueueStorage.21694
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.4byte	0x120
	.4byte	0x1203
	.uleb128 0x9
	.4byte	0xee
	.byte	0x77
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.asciz	"xTimerIsTimerActive"
	.byte	0x1
	.2byte	0x3d5
	.byte	0x1
	.4byte	0x190
	.4byte	.LFB18
	.4byte	.LFE18
	.byte	0x1
	.byte	0x5e
	.4byte	0x126e
	.uleb128 0x1b
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x3d5
	.4byte	0x792
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1a
	.asciz	"xTimerIsInActiveList"
	.byte	0x1
	.2byte	0x3d7
	.4byte	0x190
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x3d8
	.4byte	0x8e7
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.asciz	"pvTimerGetTimerID"
	.byte	0x1
	.2byte	0x3ea
	.byte	0x1
	.4byte	0xab
	.4byte	.LFB19
	.4byte	.LFE19
	.byte	0x1
	.byte	0x5e
	.4byte	0x12cb
	.uleb128 0x1b
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x3ea
	.4byte	0x12cb
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x18
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x3ec
	.4byte	0xe41
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1a
	.asciz	"pvReturn"
	.byte	0x1
	.2byte	0x3ed
	.4byte	0xab
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x12
	.4byte	0x792
	.uleb128 0x20
	.byte	0x1
	.asciz	"vTimerSetTimerID"
	.byte	0x1
	.2byte	0x3fb
	.byte	0x1
	.4byte	.LFB20
	.4byte	.LFE20
	.byte	0x1
	.byte	0x5e
	.4byte	0x1327
	.uleb128 0x1b
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x3fb
	.4byte	0x792
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1c
	.asciz	"pvNewID"
	.byte	0x1
	.2byte	0x3fb
	.4byte	0xab
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x18
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x3fd
	.4byte	0xe41
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x21
	.asciz	"xActiveTimerList1"
	.byte	0x1
	.byte	0xa7
	.4byte	0x745
	.byte	0x5
	.byte	0x3
	.4byte	_xActiveTimerList1
	.uleb128 0x21
	.asciz	"xActiveTimerList2"
	.byte	0x1
	.byte	0xa8
	.4byte	0x745
	.byte	0x5
	.byte	0x3
	.4byte	_xActiveTimerList2
	.uleb128 0x21
	.asciz	"pxCurrentTimerList"
	.byte	0x1
	.byte	0xa9
	.4byte	0x116a
	.byte	0x5
	.byte	0x3
	.4byte	_pxCurrentTimerList
	.uleb128 0x21
	.asciz	"pxOverflowTimerList"
	.byte	0x1
	.byte	0xaa
	.4byte	0x116a
	.byte	0x5
	.byte	0x3
	.4byte	_pxOverflowTimerList
	.uleb128 0x21
	.asciz	"xTimerQueue"
	.byte	0x1
	.byte	0xad
	.4byte	0x77d
	.byte	0x5
	.byte	0x3
	.4byte	_xTimerQueue
	.uleb128 0x21
	.asciz	"xTimerTaskHandle"
	.byte	0x1
	.byte	0xae
	.4byte	0x753
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
	.uleb128 0x5
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
	.uleb128 0x5
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
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x17
	.byte	0x1
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
	.uleb128 0xc
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
	.uleb128 0x5
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.4byte	0x10e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x13de
	.4byte	0x980
	.asciz	"xTimerCreateTimerTask"
	.4byte	0xa30
	.asciz	"xTimerCreate"
	.4byte	0xabf
	.asciz	"xTimerCreateStatic"
	.4byte	0xbe8
	.asciz	"xTimerGenericCommand"
	.4byte	0xcc0
	.asciz	"xTimerGetTimerDaemonTaskHandle"
	.4byte	0xcf3
	.asciz	"xTimerGetPeriod"
	.4byte	0xd3a
	.asciz	"xTimerGetExpiryTime"
	.4byte	0xd94
	.asciz	"pcTimerGetName"
	.4byte	0x1203
	.asciz	"xTimerIsTimerActive"
	.4byte	0x126e
	.asciz	"pvTimerGetTimerID"
	.4byte	0x12d0
	.asciz	"vTimerSetTimerID"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x28f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x13de
	.4byte	0x120
	.asciz	"uint8_t"
	.4byte	0x140
	.asciz	"uint16_t"
	.4byte	0x150
	.asciz	"uint32_t"
	.4byte	0x17d
	.asciz	"StackType_t"
	.4byte	0x190
	.asciz	"BaseType_t"
	.4byte	0x1af
	.asciz	"UBaseType_t"
	.4byte	0x1c2
	.asciz	"TickType_t"
	.4byte	0x1d4
	.asciz	"xSTATIC_LIST_ITEM"
	.4byte	0x222
	.asciz	"StaticListItem_t"
	.4byte	0x23b
	.asciz	"xSTATIC_MINI_LIST_ITEM"
	.4byte	0x28e
	.asciz	"StaticMiniListItem_t"
	.4byte	0x2ab
	.asciz	"xSTATIC_LIST"
	.4byte	0x2f4
	.asciz	"StaticList_t"
	.4byte	0x309
	.asciz	"xSTATIC_TCB"
	.4byte	0x43b
	.asciz	"StaticTask_t"
	.4byte	0x477
	.asciz	"xSTATIC_QUEUE"
	.4byte	0x559
	.asciz	"StaticQueue_t"
	.4byte	0x56f
	.asciz	"xSTATIC_TIMER"
	.4byte	0x5fe
	.asciz	"StaticTimer_t"
	.4byte	0x614
	.asciz	"xLIST_ITEM"
	.4byte	0x683
	.asciz	"ListItem_t"
	.4byte	0x695
	.asciz	"xMINI_LIST_ITEM"
	.4byte	0x6db
	.asciz	"MiniListItem_t"
	.4byte	0x6f1
	.asciz	"xLIST"
	.4byte	0x745
	.asciz	"List_t"
	.4byte	0x753
	.asciz	"TaskHandle_t"
	.4byte	0x77d
	.asciz	"QueueHandle_t"
	.4byte	0x792
	.asciz	"TimerHandle_t"
	.4byte	0x7a7
	.asciz	"TimerCallbackFunction_t"
	.4byte	0x7d8
	.asciz	"tmrTimerControl"
	.4byte	0x888
	.asciz	"xTIMER"
	.4byte	0x896
	.asciz	"Timer_t"
	.4byte	0x8a5
	.asciz	"tmrTimerParameters"
	.4byte	0x8ed
	.asciz	"TimerParameter_t"
	.4byte	0x926
	.asciz	"tmrTimerQueueMessage"
	.4byte	0x965
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
.LASF10:
	.asciz	"pvTimerID"
.LASF4:
	.asciz	"uxDummy4"
.LASF11:
	.asciz	"pxCallbackFunction"
.LASF9:
	.asciz	"uxAutoReload"
.LASF12:
	.asciz	"pxTimer"
.LASF19:
	.asciz	"xResult"
.LASF13:
	.asciz	"xReturn"
.LASF17:
	.asciz	"xNextExpireTime"
.LASF3:
	.asciz	"pvDummy1"
.LASF0:
	.asciz	"pvDummy2"
.LASF8:
	.asciz	"xTimerPeriodInTicks"
.LASF15:
	.asciz	"xTimer"
.LASF18:
	.asciz	"xTimeNow"
.LASF1:
	.asciz	"xDummy3"
.LASF20:
	.asciz	"xListWasEmpty"
.LASF6:
	.asciz	"pxPrevious"
.LASF5:
	.asciz	"xItemValue"
.LASF21:
	.asciz	"xTimerListsWereSwitched"
.LASF14:
	.asciz	"pxNewTimer"
.LASF7:
	.asciz	"pcTimerName"
.LASF16:
	.asciz	"xMessage"
.LASF2:
	.asciz	"ucDummy7"
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
