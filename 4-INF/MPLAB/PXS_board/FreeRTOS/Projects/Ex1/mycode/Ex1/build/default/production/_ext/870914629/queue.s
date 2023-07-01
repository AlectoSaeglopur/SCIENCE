	.file "C:\\Users\\Filippo\\Desktop\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\..\\source\\queue.c"
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
	.type	_prvUnlockQueue,@function
_prvUnlockQueue:
.LFB18:
	.file 1 "../../source/queue.c"
	.loc 1 1795 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI0:
	mov	w10,[w15++]
.LCFI1:
	mov	w0,w9
	.loc 1 1802 0
	rcall	_vPortEnterCritical
.LBB23:
	.loc 1 1804 0
	mov.b	[w9+35],w8
	.loc 1 1807 0
	cp0.b	w8
	.set ___BP___,4
	bra	le,.L2
	.loc 1 1855 0
	mov	[w9+18],w0
	cp0	w0
	.set ___BP___,4
	bra	z,.L2
	add	w9,#18,w10
.L4:
	.loc 1 1857 0
	mov	w10,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,29
	bra	nz,.L17
.L5:
	.loc 1 1875 0
	dec.b	w8,w8
	.loc 1 1807 0
	.set ___BP___,4
	bclr.b	_SR,#2
	bra	le,.L2
	.loc 1 1855 0
	mov	[w9+18],w0
	cp0	w0
	.set ___BP___,95
	bra	nz,.L4
.L2:
	.loc 1 1878 0
	setm.b	w0
	mov.b	w0,[w9+35]
.LBE23:
	.loc 1 1880 0
	rcall	_vPortExitCritical
	.loc 1 1883 0
	rcall	_vPortEnterCritical
.LBB24:
	.loc 1 1885 0
	mov.b	[w9+34],w8
	.loc 1 1887 0
	cp0.b	w8
	.set ___BP___,4
	bra	le,.L7
	.loc 1 1889 0
	mov	[w9+8],w0
	cp0	w0
	.set ___BP___,4
	bra	z,.L7
	add	w9,#8,w10
.L9:
	.loc 1 1891 0
	mov	w10,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,29
	bra	nz,.L18
.L10:
	.loc 1 1900 0
	dec.b	w8,w8
	.loc 1 1887 0
	.set ___BP___,4
	bclr.b	_SR,#2
	bra	le,.L7
	.loc 1 1889 0
	mov	[w9+8],w0
	cp0	w0
	.set ___BP___,95
	bra	nz,.L9
.L7:
	.loc 1 1908 0
	setm.b	w0
	mov.b	w0,[w9+34]
.LBE24:
	.loc 1 1910 0
	rcall	_vPortExitCritical
	.loc 1 1911 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.L17:
.LBB25:
	.loc 1 1861 0
	rcall	_vTaskMissedYield
	bra	.L5
.L18:
.LBE25:
.LBB26:
	.loc 1 1893 0
	rcall	_vTaskMissedYield
	bra	.L10
.LBE26:
.LFE18:
	.size	_prvUnlockQueue, .-_prvUnlockQueue
	.align	2
	.type	_prvCopyDataToQueue,@function
_prvCopyDataToQueue:
.LFB16:
	.loc 1 1698 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI2:
	mov	w10,[w15++]
.LCFI3:
	mov	w0,w8
	mov	w2,w10
	.loc 1 1704 0
	mov	[w8+28],w9
	.loc 1 1706 0
	mov	[w8+32],w2
	cp0	w2
	.set ___BP___,50
	bra	nz,.L21
	.loc 1 1710 0
	mov	[w8],w10
	cp0	w10
	.set ___BP___,6
	bra	z,.L22
.L31:
	.loc 1 1729 0
	inc	w9,w9
	.loc 1 1699 0
	clr	w0
.L23:
	.loc 1 1770 0
	mov	w9,[w8+28]
	.loc 1 1773 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
.L34:
	.set ___PA___,0
.L21:
	.loc 1 1723 0
	cp0	w10
	.set ___BP___,50
	bra	nz,.L24
	.loc 1 1725 0
	mov	[w8+4],w0
	rcall	_memcpy
	.loc 1 1726 0
	mov	[w8+4],w1
	mov	[w8+32],w0
	add	w1,w0,w0
	mov	w0,[w8+4]
	.loc 1 1727 0
	mov	[w8+2],w1
	sub	w0,w1,[w15]
	.set ___BP___,50
	bra	ltu,.L31
	.loc 1 1729 0
	mov	[w8],w0
	mov	w0,[w8+4]
	inc	w9,w9
	.loc 1 1699 0
	clr	w0
	bra	.L23
.L24:
	.loc 1 1738 0
	mov	[w8+6],w0
	rcall	_memcpy
	.loc 1 1739 0
	mov	[w8+32],w1
	neg	w1,w1
	mov	[w8+6],w0
	add	w0,w1,w0
	mov	w0,[w8+6]
	.loc 1 1740 0
	sub	w0,[w8],[w15]
	.set ___BP___,50
	bra	geu,.L26
	.loc 1 1742 0
	mov	[w8+2],w0
	add	w0,w1,w1
	mov	w1,[w8+6]
.L26:
	.loc 1 1749 0
	sub	w10,#2,[w15]
	.set ___BP___,62
	bra	nz,.L31
	.loc 1 1751 0
	cp0	w9
	.set ___BP___,39
	bra	z,.L28
	.loc 1 1699 0
	clr	w0
.L33:
	.loc 1 1770 0
	mov	w9,[w8+28]
	.loc 1 1773 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L34
.L28:
	.loc 1 1751 0
	mov	#1,w9
	.loc 1 1699 0
	clr	w0
	bra	.L33
.L22:
	.loc 1 1713 0
	mov	[w8+2],w0
	rcall	_xTaskPriorityDisinherit
	.loc 1 1714 0
	mov	w10,[w8+2]
	inc	w9,w9
	.loc 1 1770 0
	mov	w9,[w8+28]
	.loc 1 1773 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L34
.LFE16:
	.size	_prvCopyDataToQueue, .-_prvCopyDataToQueue
	.align	2
	.global	_xQueueGenericReset	; export
	.type	_xQueueGenericReset,@function
_xQueueGenericReset:
.LFB0:
	.loc 1 280 0
	.set ___PA___,0
	mov.d	w8,[w15++]
.LCFI4:
	mov.d	w0,w8
	.loc 1 285 0
	rcall	_vPortEnterCritical
	.loc 1 287 0
	mov	[w8],w0
	mov	[w8+30],w3
	mov	[w8+32],w2
	mulw.ss	w2,w3,w4
	add	w0,w4,w1
	mov	w1,[w8+2]
	.loc 1 288 0
	clr	w1
	mov	w1,[w8+28]
	.loc 1 289 0
	mov	w0,[w8+4]
	.loc 1 290 0
	dec	w3,w3
	mulw.ss	w3,w2,w2
	add	w0,w2,w0
	mov	w0,[w8+6]
	.loc 1 291 0
	setm.b	w0
	mov.b	w0,[w8+34]
	.loc 1 292 0
	mov.b	w0,[w8+35]
	.loc 1 294 0
	cp0	w9
	.set ___BP___,29
	bra	nz,.L37
	.loc 1 301 0
	mov	[w8+8],w0
	cp0	w0
	.set ___BP___,38
	bra	nz,.L40
.L38:
	.loc 1 324 0
	rcall	_vPortExitCritical
	.loc 1 329 0
	mov	#1,w0
	mov.d	[--w15],w8
	return	
.L41:
	.set ___PA___,0
.L40:
	.loc 1 303 0
	add	w8,#8,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,50
	bra	z,.L38
	.loc 1 305 0
; 305 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
	.loc 1 324 0
	rcall	_vPortExitCritical
	.loc 1 329 0
	mov	#1,w0
	mov.d	[--w15],w8
	return	
	bra	.L41
.L37:
	.loc 1 320 0
	add	w8,#8,w0
	rcall	_vListInitialise
	.loc 1 321 0
	add	w8,#18,w0
	rcall	_vListInitialise
	.loc 1 324 0
	rcall	_vPortExitCritical
	.loc 1 329 0
	mov	#1,w0
	mov.d	[--w15],w8
	return	
	bra	.L41
.LFE0:
	.size	_xQueueGenericReset, .-_xQueueGenericReset
	.align	2
	.global	_xQueueGenericCreate	; export
	.type	_xQueueGenericCreate,@function
_xQueueGenericCreate:
.LFB1:
	.loc 1 387 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI5:
	mov	w10,[w15++]
.LCFI6:
	mov	w0,w9
	mov	w1,w10
	.loc 1 394 0
	mov	#36,w0
	cp0	w10
	.set ___BP___,50
	bra	z,.L44
	.loc 1 403 0
	mulw.ss	w10,w9,w0
	.loc 1 394 0
	add	#36,w0
.L44:
	.loc 1 406 0
	rcall	_pvPortMalloc
	mov	w0,w8
	.loc 1 408 0
	cp0	w8
	.set ___BP___,10
	bra	z,.L45
.LBB27:
.LBB28:
	.loc 1 438 0
	cp0	w10
	.set ___BP___,50
	bra	nz,.L46
	.loc 1 444 0
	mov	w8,[w8]
	.loc 1 454 0
	mov	w9,[w8+30]
	.loc 1 455 0
	mov	w10,[w8+32]
	.loc 1 456 0
	mov	#1,w1
	mov	w8,w0
	rcall	_xQueueGenericReset
.L45:
.LBE28:
.LBE27:
	.loc 1 427 0
	mov	w8,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.L46:
	.loc 1 412 0
	mov	#36,w0
	add	w8,w0,[w8]
.LBB30:
.LBB29:
	.loc 1 454 0
	mov	w9,[w8+30]
	.loc 1 455 0
	mov	w10,[w8+32]
	.loc 1 456 0
	mov	#1,w1
	mov	w8,w0
	rcall	_xQueueGenericReset
	bra	.L45
.LBE29:
.LBE30:
.LFE1:
	.size	_xQueueGenericCreate, .-_xQueueGenericCreate
	.align	2
	.global	_xQueueCreateCountingSemaphore	; export
	.type	_xQueueCreateCountingSemaphore,@function
_xQueueCreateCountingSemaphore:
.LFB5:
	.loc 1 698 0
	.set ___PA___,1
	mov	w8,[w15++]
.LCFI7:
	mov	w1,w8
	.loc 1 704 0
	mov.b	#2,w2
	clr	w1
	rcall	_xQueueGenericCreate
	.loc 1 706 0
	cp0	w0
	.set ___BP___,10
	bra	z,.L52
	.loc 1 708 0
	mov	w8,[w0+28]
.L52:
	.loc 1 718 0
	mov	[--w15],w8
	return	
	.set ___PA___,0
.LFE5:
	.size	_xQueueCreateCountingSemaphore, .-_xQueueCreateCountingSemaphore
	.align	2
	.global	_xQueueGenericSend	; export
	.type	_xQueueGenericSend,@function
_xQueueGenericSend:
.LFB6:
	.loc 1 724 0
	.set ___PA___,0
	lnk	#6
.LCFI8:
	mov.d	w8,[w15++]
.LCFI9:
	mov.d	w10,[w15++]
.LCFI10:
	mov	w12,[w15++]
.LCFI11:
	mov.d	w0,w8
	mov	w2,[w15-12]
	mov	w3,w10
	.loc 1 725 0
	clr	w12
	.loc 1 882 0
	add	w8,#8,w11
	.loc 1 744 0
	rcall	_vPortEnterCritical
	.loc 1 750 0
	mov	[w8+28],w1
	mov	[w8+30],w0
	sub	w1,w0,[w15]
	.set ___BP___,2
	bra	ltu,.L57
.L75:
	sub	w10,#2,[w15]
	.set ___BP___,2
	bra	z,.L57
	.loc 1 843 0
	mov	[w15-12],w0
	cp0	w0
	.set ___BP___,2
	bra	z,.L70
	.loc 1 854 0
	cp0	w12
	.set ___BP___,29
	bra	z,.L71
	.loc 1 868 0
	rcall	_vPortExitCritical
	.loc 1 873 0
	rcall	_vTaskSuspendAll
	.loc 1 874 0
	rcall	_vPortEnterCritical
	mov.b	[w8+34],w0
	add.b	w0,#1,[w15]
	.set ___BP___,28
	bra	z,.L72
.L64:
	mov.b	[w8+35],w0
	add.b	w0,#1,[w15]
	.set ___BP___,28
	bra	z,.L73
.L65:
	rcall	_vPortExitCritical
	.loc 1 877 0
	sub	w15,#12,w1
	sub	w15,#16,w0
	rcall	_xTaskCheckForTimeOut
	cp0	w0
	.set ___BP___,2
	bra	nz,.L66
.L77:
.LBB31:
.LBB32:
	.loc 1 1957 0
	rcall	_vPortEnterCritical
	.loc 1 1959 0
	mov	[w8+28],w1
	mov	[w8+30],w0
	sub	w1,w0,[w15]
	.set ___BP___,28
	bra	z,.L74
	.loc 1 1968 0
	rcall	_vPortExitCritical
.LBE32:
.LBE31:
	.loc 1 904 0
	mov	w8,w0
	rcall	_prvUnlockQueue
	.loc 1 905 0
	rcall	_xTaskResumeAll
.L68:
	.loc 1 727 0
	mov	#1,w12
.L78:
	.loc 1 744 0
	rcall	_vPortEnterCritical
	.loc 1 750 0
	mov	[w8+28],w1
	mov	[w8+30],w0
	sub	w1,w0,[w15]
	.set ___BP___,97
	bra	geu,.L75
.L57:
	.loc 1 753 0
	mov	w10,w2
	mov.d	w8,w0
	rcall	_prvCopyDataToQueue
	.loc 1 808 0
	mov	[w8+18],w1
	cp0	w1
	.set ___BP___,29
	bra	nz,.L76
	.loc 1 823 0
	cp0	w0
	.set ___BP___,39
	bra	z,.L60
	.loc 1 829 0
; 829 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
.L60:
	.loc 1 838 0
	rcall	_vPortExitCritical
	.loc 1 839 0
	mov	#1,w0
.L61:
	.loc 1 918 0
	mov	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
.L79:
	.set ___PA___,0
.L71:
	.loc 1 858 0
	sub	w15,#16,w0
	rcall	_vTaskSetTimeOutState
	.loc 1 868 0
	rcall	_vPortExitCritical
	.loc 1 873 0
	rcall	_vTaskSuspendAll
	.loc 1 874 0
	rcall	_vPortEnterCritical
	mov.b	[w8+34],w0
	add.b	w0,#1,[w15]
	.set ___BP___,72
	bra	nz,.L64
	bra	.L72
.L73:
	clr.b	w0
	mov.b	w0,[w8+35]
	rcall	_vPortExitCritical
	.loc 1 877 0
	sub	w15,#12,w1
	sub	w15,#16,w0
	rcall	_xTaskCheckForTimeOut
	cp0	w0
	.set ___BP___,97
	bra	z,.L77
.L66:
	.loc 1 911 0
	mov	w8,w0
	rcall	_prvUnlockQueue
	.loc 1 912 0
	rcall	_xTaskResumeAll
	.loc 1 915 0
	clr	w0
	.loc 1 918 0
	mov	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
	bra	.L79
.L72:
	.loc 1 874 0
	clr.b	w0
	mov.b	w0,[w8+34]
	mov.b	[w8+35],w0
	add.b	w0,#1,[w15]
	.set ___BP___,72
	bra	nz,.L65
	bra	.L73
.L74:
.LBB34:
.LBB33:
	.loc 1 1968 0
	rcall	_vPortExitCritical
.LBE33:
.LBE34:
	.loc 1 882 0
	mov	[w15-12],w1
	mov	w11,w0
	rcall	_vTaskPlaceOnEventList
	.loc 1 889 0
	mov	w8,w0
	rcall	_prvUnlockQueue
	.loc 1 896 0
	rcall	_xTaskResumeAll
	cp0	w0
	.set ___BP___,50
	bra	nz,.L68
	.loc 1 898 0
; 898 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
	.loc 1 727 0
	mov	#1,w12
	bra	.L78
.L70:
	.loc 1 847 0
	rcall	_vPortExitCritical
	.loc 1 852 0
	clr	w0
	.loc 1 918 0
	mov	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
	bra	.L79
.L76:
	.loc 1 810 0
	add	w8,#18,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,39
	bra	z,.L60
	.loc 1 816 0
; 816 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
	.loc 1 838 0
	rcall	_vPortExitCritical
	.loc 1 839 0
	mov	#1,w0
	bra	.L61
.LFE6:
	.size	_xQueueGenericSend, .-_xQueueGenericSend
	.align	2
	.global	_xQueueCreateMutex	; export
	.type	_xQueueCreateMutex,@function
_xQueueCreateMutex:
.LFB4:
	.loc 1 507 0
	.set ___PA___,1
	mov	w8,[w15++]
.LCFI12:
	.loc 1 511 0
	mov.b	w0,w2
	clr	w1
	mov	#1,w0
	rcall	_xQueueGenericCreate
	mov	w0,w8
.LBB35:
.LBB36:
	.loc 1 478 0
	cp0	w8
	.set ___BP___,21
	bra	z,.L82
	.loc 1 484 0
	clr	w0
	mov	w0,[w8+2]
	.loc 1 485 0
	clr	[w8]
	.loc 1 488 0
	mov	w0,[w8+6]
	.loc 1 493 0
	mov	w0,w3
	mov	w3,w2
	mov	w3,w1
	mov	w8,w0
	rcall	_xQueueGenericSend
.L82:
.LBE36:
.LBE35:
	.loc 1 515 0
	mov	w8,w0
	mov	[--w15],w8
	return	
	.set ___PA___,0
.LFE4:
	.size	_xQueueCreateMutex, .-_xQueueCreateMutex
	.align	2
	.global	_xQueueGenericSendFromISR	; export
	.type	_xQueueGenericSendFromISR,@function
_xQueueGenericSendFromISR:
.LFB7:
	.loc 1 922 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI13:
	mov	w10,[w15++]
.LCFI14:
	mov	w0,w8
	mov	w2,w9
	.loc 1 954 0
	mov	[w8+28],w2
	mov	[w8+30],w0
	sub	w2,w0,[w15]
	.set ___BP___,29
	bra	ltu,.L86
	.loc 1 1063 0
	clr	w10
	.loc 1 954 0
	sub	w3,#2,[w15]
	.set ___BP___,37
	bra	z,.L86
.L87:
	.loc 1 1069 0
	mov	w10,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
.L95:
	.set ___PA___,0
.L86:
.LBB37:
	.loc 1 956 0
	mov.b	[w8+35],w10
	.loc 1 965 0
	mov	w3,w2
	mov	w8,w0
	rcall	_prvCopyDataToQueue
	.loc 1 969 0
	add.b	w10,#1,[w15]
	.set ___BP___,28
	bra	z,.L94
	.loc 1 1055 0
	inc.b	w10,w10
	mov.b	w10,[w8+35]
.LBE37:
	.loc 1 1069 0
	mov	#1,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L95
.L94:
.LBB38:
	.loc 1 1024 0
	mov	[w8+18],w0
	.loc 1 1058 0
	mov	#1,w10
	.loc 1 1024 0
	cp0	w0
	.set ___BP___,61
	bra	z,.L87
	.loc 1 1026 0
	add	w8,#18,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,39
	bra	z,.L87
	.loc 1 1030 0
	cp0	w9
	.set ___BP___,15
	bra	z,.L87
	.loc 1 1032 0
	mov	w10,[w9]
.LBE38:
	.loc 1 1069 0
	mov	w10,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L95
.LFE7:
	.size	_xQueueGenericSendFromISR, .-_xQueueGenericSendFromISR
	.align	2
	.global	_xQueueGiveFromISR	; export
	.type	_xQueueGiveFromISR,@function
_xQueueGiveFromISR:
.LFB8:
	.loc 1 1073 0
	.set ___PA___,1
	lnk	#2
.LCFI15:
	mov	w8,[w15++]
.LCFI16:
.LBB39:
	.loc 1 1113 0
	mov	[w0+28],w2
	.loc 1 1118 0
	mov	[w0+30],w3
	.loc 1 1228 0
	clr	w8
	.loc 1 1118 0
	sub	w2,w3,[w15]
	.set ___BP___,39
	bra	geu,.L98
.LBB40:
	.loc 1 1120 0
	mov.b	[w0+35],w3
	.loc 1 1130 0
	inc	w2,w2
	mov	w2,[w0+28]
	.loc 1 1134 0
	add.b	w3,#1,[w15]
	.set ___BP___,28
	bra	z,.L105
	.loc 1 1220 0
	inc.b	w3,w3
	mov.b	w3,[w0+35]
	.loc 1 1223 0
	mov	#1,w8
.L98:
.LBE40:
.LBE39:
	.loc 1 1234 0
	mov	w8,w0
	mov	[--w15],w8
	ulnk	
	return	
.L106:
	.set ___PA___,0
.L105:
.LBB42:
.LBB41:
	.loc 1 1189 0
	mov	[w0+18],w2
	.loc 1 1223 0
	mov	#1,w8
	.loc 1 1189 0
	cp0	w2
	.set ___BP___,61
	bra	z,.L98
	.loc 1 1191 0
	add	w0,#18,w0
	mov	w1,[w15-4]
	rcall	_xTaskRemoveFromEventList
	mov	[w15-4],w1
	cp0	w0
	.set ___BP___,39
	bra	z,.L98
	.loc 1 1195 0
	cp0	w1
	.set ___BP___,15
	bra	z,.L98
	.loc 1 1197 0
	mov	w8,[w1]
.LBE41:
.LBE42:
	.loc 1 1234 0
	mov	w8,w0
	mov	[--w15],w8
	ulnk	
	return	
	bra	.L106
.LFE8:
	.size	_xQueueGiveFromISR, .-_xQueueGiveFromISR
	.align	2
	.global	_xQueueGenericReceive	; export
	.type	_xQueueGenericReceive,@function
_xQueueGenericReceive:
.LFB9:
	.loc 1 1238 0
	.set ___PA___,0
	lnk	#6
.LCFI17:
	mov.d	w8,[w15++]
.LCFI18:
	mov.d	w10,[w15++]
.LCFI19:
	mov.d	w12,[w15++]
.LCFI20:
	mov.d	w0,w8
	mov	w2,[w15-14]
	mov	w3,w11
	.loc 1 1239 0
	clr	w13
	.loc 1 1397 0
	add	w8,#18,w12
	.loc 1 1258 0
	rcall	_vPortEnterCritical
.LBB43:
	.loc 1 1260 0
	mov	[w8+28],w10
	.loc 1 1264 0
	cp0	w10
	.set ___BP___,3
	bra	nz,.L128
.L110:
	.loc 1 1343 0
	mov	[w15-14],w0
	cp0	w0
	.set ___BP___,3
	bra	z,.L126
	.loc 1 1351 0
	cp0	w13
	.set ___BP___,29
	bra	z,.L129
.LBE43:
	.loc 1 1365 0
	rcall	_vPortExitCritical
	.loc 1 1370 0
	rcall	_vTaskSuspendAll
	.loc 1 1371 0
	rcall	_vPortEnterCritical
	mov.b	[w8+34],w0
	add.b	w0,#1,[w15]
	.set ___BP___,28
	bra	z,.L130
.L119:
	mov.b	[w8+35],w0
	add.b	w0,#1,[w15]
	.set ___BP___,28
	bra	z,.L131
.L120:
	rcall	_vPortExitCritical
	.loc 1 1374 0
	sub	w15,#14,w1
	sub	w15,#18,w0
	rcall	_xTaskCheckForTimeOut
	cp0	w0
	.set ___BP___,50
	bra	nz,.L121
.L135:
.LBB46:
.LBB47:
	.loc 1 1918 0
	rcall	_vPortEnterCritical
	.loc 1 1920 0
	mov	[w8+28],w0
	cp0	w0
	.set ___BP___,50
	bra	nz,.L122
	.loc 1 1929 0
	rcall	_vPortExitCritical
.LBE47:
.LBE46:
	.loc 1 1382 0
	cp0	[w8]
	.set ___BP___,6
	bra	z,.L132
.L123:
	.loc 1 1397 0
	mov	[w15-14],w1
	mov	w12,w0
	rcall	_vTaskPlaceOnEventList
	.loc 1 1398 0
	mov	w8,w0
	rcall	_prvUnlockQueue
	.loc 1 1399 0
	rcall	_xTaskResumeAll
	cp0	w0
	.set ___BP___,50
	bra	nz,.L124
	.loc 1 1401 0
; 1401 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
.L124:
	.loc 1 1242 0
	mov	#1,w13
.L136:
	.loc 1 1258 0
	rcall	_vPortEnterCritical
.LBB49:
	.loc 1 1260 0
	mov	[w8+28],w10
	.loc 1 1264 0
	cp0	w10
	.set ___BP___,97
	bra	z,.L110
.L128:
	.loc 1 1268 0
	mov	[w8+6],w12
.LBB44:
.LBB45:
	.loc 1 1778 0
	mov	[w8+32],w2
	cp0	w2
	.set ___BP___,50
	bra	z,.L111
	.loc 1 1780 0
	add	w12,w2,w1
	mov	w1,[w8+6]
	.loc 1 1781 0
	mov	[w8+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,50
	bra	ltu,.L112
	.loc 1 1783 0
	mov	[w8],w1
	mov	w1,[w8+6]
.L112:
	.loc 1 1789 0
	mov	w9,w0
	rcall	_memcpy
.L111:
.LBE45:
.LBE44:
	.loc 1 1272 0
	cp0	w11
	.set ___BP___,50
	bra	nz,.L113
	.loc 1 1277 0
	dec	w10,w10
	mov	w10,[w8+28]
	.loc 1 1281 0
	cp0	[w8]
	.set ___BP___,6
	bra	z,.L133
	.loc 1 1294 0
	mov	[w8+8],w0
	cp0	w0
	.set ___BP___,38
	bra	nz,.L134
.L115:
	.loc 1 1338 0
	rcall	_vPortExitCritical
	.loc 1 1339 0
	mov	#1,w0
.L116:
.LBE49:
	.loc 1 1431 0
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
.L137:
	.set ___PA___,0
.L129:
.LBB50:
	.loc 1 1355 0
	sub	w15,#18,w0
	rcall	_vTaskSetTimeOutState
.LBE50:
	.loc 1 1365 0
	rcall	_vPortExitCritical
	.loc 1 1370 0
	rcall	_vTaskSuspendAll
	.loc 1 1371 0
	rcall	_vPortEnterCritical
	mov.b	[w8+34],w0
	add.b	w0,#1,[w15]
	.set ___BP___,72
	bra	nz,.L119
	bra	.L130
.L131:
	clr.b	w0
	mov.b	w0,[w8+35]
	rcall	_vPortExitCritical
	.loc 1 1374 0
	sub	w15,#14,w1
	sub	w15,#18,w0
	rcall	_xTaskCheckForTimeOut
	cp0	w0
	.set ___BP___,50
	bra	z,.L135
.L121:
	.loc 1 1417 0
	mov	w8,w0
	rcall	_prvUnlockQueue
	.loc 1 1418 0
	rcall	_xTaskResumeAll
.LBB51:
.LBB52:
	.loc 1 1918 0
	rcall	_vPortEnterCritical
	.loc 1 1920 0
	mov	[w8+28],w0
	cp0	w0
	.set ___BP___,50
	bra	z,.L126
	.loc 1 1929 0
	rcall	_vPortExitCritical
.LBE52:
.LBE51:
	.loc 1 1242 0
	mov	#1,w13
	bra	.L136
.L130:
	.loc 1 1371 0
	clr.b	w0
	mov.b	w0,[w8+34]
	mov.b	[w8+35],w0
	add.b	w0,#1,[w15]
	.set ___BP___,72
	bra	nz,.L120
	bra	.L131
.L126:
.LBB54:
.LBB53:
	.loc 1 1929 0
	rcall	_vPortExitCritical
	.loc 1 1423 0
	clr	w0
.LBE53:
.LBE54:
	.loc 1 1431 0
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	ulnk	
	return	
	bra	.L137
.L122:
.LBB55:
.LBB48:
	.loc 1 1929 0
	rcall	_vPortExitCritical
.LBE48:
.LBE55:
	.loc 1 1411 0
	mov	w8,w0
	rcall	_prvUnlockQueue
	.loc 1 1412 0
	rcall	_xTaskResumeAll
	.loc 1 1242 0
	mov	#1,w13
	bra	.L136
.L132:
	.loc 1 1384 0
	rcall	_vPortEnterCritical
	.loc 1 1386 0
	mov	[w8+2],w0
	rcall	_vTaskPriorityInherit
	.loc 1 1388 0
	rcall	_vPortExitCritical
	bra	.L123
.L113:
.LBB56:
	.loc 1 1316 0
	mov	w12,[w8+6]
	.loc 1 1320 0
	mov	[w8+18],w0
	cp0	w0
	.set ___BP___,61
	bra	z,.L115
	.loc 1 1322 0
	add	w8,#18,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,39
	bra	z,.L115
	.loc 1 1325 0
; 1325 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
	.loc 1 1338 0
	rcall	_vPortExitCritical
	.loc 1 1339 0
	mov	#1,w0
	bra	.L116
.L134:
	.loc 1 1296 0
	add	w8,#8,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,39
	bra	z,.L115
	.loc 1 1298 0
; 1298 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
	.loc 1 1338 0
	rcall	_vPortExitCritical
	.loc 1 1339 0
	mov	#1,w0
	bra	.L116
.L133:
	.loc 1 1285 0
	rcall	_pvTaskIncrementMutexHeldCount
	mov	w0,[w8+2]
	.loc 1 1294 0
	mov	[w8+8],w0
	cp0	w0
	.set ___BP___,61
	bra	z,.L115
	bra	.L134
.LBE56:
.LFE9:
	.size	_xQueueGenericReceive, .-_xQueueGenericReceive
	.align	2
	.global	_xQueueReceiveFromISR	; export
	.type	_xQueueReceiveFromISR,@function
_xQueueReceiveFromISR:
.LFB10:
	.loc 1 1435 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI21:
	mov.d	w10,[w15++]
.LCFI22:
	mov	w0,w8
	mov	w1,w3
	mov	w2,w11
.LBB57:
	.loc 1 1461 0
	mov	[w8+28],w9
	.loc 1 1515 0
	clr	w10
	.loc 1 1464 0
	cp0	w9
	.set ___BP___,39
	bra	z,.L140
.LBB58:
	.loc 1 1466 0
	mov.b	[w8+34],w10
.LBB59:
.LBB60:
	.loc 1 1778 0
	mov	[w8+32],w2
	cp0	w2
	.set ___BP___,50
	bra	z,.L141
	.loc 1 1780 0
	mov	[w8+6],w1
	add	w1,w2,w1
	mov	w1,[w8+6]
	.loc 1 1781 0
	mov	[w8+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,50
	bra	ltu,.L142
	.loc 1 1783 0
	mov	[w8],w1
	mov	w1,[w8+6]
.L142:
	.loc 1 1789 0
	mov	w3,w0
	rcall	_memcpy
.L141:
.LBE60:
.LBE59:
	.loc 1 1471 0
	dec	w9,w9
	mov	w9,[w8+28]
	.loc 1 1477 0
	add.b	w10,#1,[w15]
	.set ___BP___,28
	bra	z,.L149
	.loc 1 1508 0
	inc.b	w10,w10
	mov.b	w10,[w8+34]
	.loc 1 1511 0
	mov	#1,w10
.L140:
.LBE58:
.LBE57:
	.loc 1 1522 0
	mov	w10,w0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
.L150:
	.set ___PA___,0
.L149:
.LBB62:
.LBB61:
	.loc 1 1479 0
	mov	[w8+8],w0
	.loc 1 1511 0
	mov	#1,w10
	.loc 1 1479 0
	cp0	w0
	.set ___BP___,61
	bra	z,.L140
	.loc 1 1481 0
	add	w8,#8,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,39
	bra	z,.L140
	.loc 1 1485 0
	cp0	w11
	.set ___BP___,15
	bra	z,.L140
	.loc 1 1487 0
	mov	w10,[w11]
.LBE61:
.LBE62:
	.loc 1 1522 0
	mov	w10,w0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L150
.LFE10:
	.size	_xQueueReceiveFromISR, .-_xQueueReceiveFromISR
	.align	2
	.global	_xQueuePeekFromISR	; export
	.type	_xQueuePeekFromISR,@function
_xQueuePeekFromISR:
.LFB11:
	.loc 1 1526 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI23:
	mov	w0,w8
	mov	w1,w3
	.loc 1 1555 0
	mov	[w8+28],w1
	.loc 1 1569 0
	clr	w0
	.loc 1 1555 0
	cp0	w1
	.set ___BP___,39
	bra	z,.L153
	.loc 1 1561 0
	mov	[w8+6],w9
.LBB63:
.LBB64:
	.loc 1 1778 0
	mov	[w8+32],w2
	cp0	w2
	.set ___BP___,50
	bra	z,.L154
	.loc 1 1780 0
	add	w9,w2,w1
	mov	w1,[w8+6]
	.loc 1 1781 0
	mov	[w8+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,50
	bra	ltu,.L155
	.loc 1 1783 0
	mov	[w8],w1
	mov	w1,[w8+6]
.L155:
	.loc 1 1789 0
	mov	w3,w0
	rcall	_memcpy
.L154:
.LBE64:
.LBE63:
	.loc 1 1563 0
	mov	w9,[w8+6]
	.loc 1 1565 0
	mov	#1,w0
.L153:
	.loc 1 1576 0
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.LFE11:
	.size	_xQueuePeekFromISR, .-_xQueuePeekFromISR
	.align	2
	.global	_uxQueueMessagesWaiting	; export
	.type	_uxQueueMessagesWaiting,@function
_uxQueueMessagesWaiting:
.LFB12:
	.loc 1 1580 0
	.set ___PA___,1
	mov	w8,[w15++]
.LCFI24:
	mov	w0,w8
	.loc 1 1585 0
	rcall	_vPortEnterCritical
	.loc 1 1587 0
	mov	[w8+28],w8
	.loc 1 1589 0
	rcall	_vPortExitCritical
	.loc 1 1592 0
	mov	w8,w0
	mov	[--w15],w8
	return	
	.set ___PA___,0
.LFE12:
	.size	_uxQueueMessagesWaiting, .-_uxQueueMessagesWaiting
	.align	2
	.global	_uxQueueSpacesAvailable	; export
	.type	_uxQueueSpacesAvailable,@function
_uxQueueSpacesAvailable:
.LFB13:
	.loc 1 1596 0
	.set ___PA___,1
	mov	w8,[w15++]
.LCFI25:
	mov	w0,w8
	.loc 1 1603 0
	rcall	_vPortEnterCritical
	.loc 1 1605 0
	mov	[w8+28],w0
	mov	[w8+30],w8
	sub	w8,w0,w8
	.loc 1 1607 0
	rcall	_vPortExitCritical
	.loc 1 1610 0
	mov	w8,w0
	mov	[--w15],w8
	return	
	.set ___PA___,0
.LFE13:
	.size	_uxQueueSpacesAvailable, .-_uxQueueSpacesAvailable
	.align	2
	.global	_uxQueueMessagesWaitingFromISR	; export
	.type	_uxQueueMessagesWaitingFromISR,@function
_uxQueueMessagesWaitingFromISR:
.LFB14:
	.loc 1 1614 0
	.set ___PA___,1
	.loc 1 1619 0
	mov	[w0+28],w0
	.loc 1 1622 0
	return	
	.set ___PA___,0
.LFE14:
	.size	_uxQueueMessagesWaitingFromISR, .-_uxQueueMessagesWaitingFromISR
	.align	2
	.global	_vQueueDelete	; export
	.type	_vQueueDelete,@function
_vQueueDelete:
.LFB15:
	.loc 1 1626 0
	.set ___PA___,1
	.loc 1 1642 0
	bra	_vPortFree
	.loc 1 1664 0
	.set ___PA___,0
.LFE15:
	.size	_vQueueDelete, .-_vQueueDelete
	.align	2
	.global	_xQueueIsQueueEmptyFromISR	; export
	.type	_xQueueIsQueueEmptyFromISR,@function
_xQueueIsQueueEmptyFromISR:
.LFB20:
	.loc 1 1936 0
	.set ___PA___,1
	.loc 1 1940 0
	mov	[w0+28],w0
	.loc 1 1942 0
	btsc	w0,#15
	neg	w0,w0
	dec	w0,w0
	lsr	w0,#15,w0
	.loc 1 1950 0
	return	
	.set ___PA___,0
.LFE20:
	.size	_xQueueIsQueueEmptyFromISR, .-_xQueueIsQueueEmptyFromISR
	.align	2
	.global	_xQueueIsQueueFullFromISR	; export
	.type	_xQueueIsQueueFullFromISR,@function
_xQueueIsQueueFullFromISR:
.LFB22:
	.loc 1 1975 0
	.set ___PA___,1
	.loc 1 1979 0
	mov	[w0+28],w1
	.loc 1 1981 0
	mov	[w0+30],w0
	xor	w1,w0,w0
	btsc	w0,#15
	neg	w0,w0
	dec	w0,w0
	lsr	w0,#15,w0
	.loc 1 1989 0
	return	
	.set ___PA___,0
.LFE22:
	.size	_xQueueIsQueueFullFromISR, .-_xQueueIsQueueFullFromISR
	.align	2
	.global	_xQueueCRSend	; export
	.type	_xQueueCRSend,@function
_xQueueCRSend:
.LFB23:
	.loc 1 1995 0
	.set ___PA___,0
	mov.d	w8,[w15++]
.LCFI26:
	mov.d	w10,[w15++]
.LCFI27:
	mov	w0,w8
	mov	w1,w11
	mov	w2,w10
	.loc 1 2002 0
	mov	#-225,w9
	mov	_SRbits,w1
	and	w9,w1,w0
	bset	w0,#5
	mov	w0,_SRbits
	nop	
; 2002 "../../source/queue.c" 1
	NOP
.LBB65:
.LBB66:
	.loc 1 1957 0
	rcall	_vPortEnterCritical
	.loc 1 1959 0
	mov	[w8+28],w1
	mov	[w8+30],w0
	sub	w1,w0,[w15]
	.set ___BP___,28
	bra	z,.L186
	.loc 1 1968 0
	rcall	_vPortExitCritical
.LBE66:
.LBE65:
	.loc 1 2023 0
	mov	#_SRbits,w0
	and	w9,[w0],[w0]
	nop	
	.loc 1 2025 0
	mov	_SRbits,w1
	and	w9,w1,w9
	bset	w9,#5
	mov	w9,_SRbits
	nop	
; 2025 "../../source/queue.c" 1
	NOP
	.loc 1 2027 0
	mov	[w8+28],w1
	mov	[w8+30],w0
	sub	w1,w0,[w15]
	.set ___BP___,29
	bra	ltu,.L182
	.loc 1 2058 0
	clr	w0
.L181:
	.loc 1 2061 0
	mov	#-225,w1
	mov	#_SRbits,w2
	and	w1,[w2],[w2]
	nop	
.L180:
	.loc 1 2064 0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
.L188:
	.set ___PA___,0
.L186:
.LBB68:
.LBB67:
	.loc 1 1968 0
	rcall	_vPortExitCritical
.LBE67:
.LBE68:
	.loc 1 2008 0
	cp0	w10
	.set ___BP___,4
	bra	nz,.L187
	.loc 1 2018 0
	mov	#_SRbits,w0
	and	w9,[w0],[w0]
	nop	
	.loc 1 2019 0
	clr	w0
	.loc 1 2064 0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L188
.L182:
	.loc 1 2030 0
	clr	w2
	mov	w11,w1
	mov	w8,w0
	rcall	_prvCopyDataToQueue
	.loc 1 2034 0
	mov	[w8+18],w1
	.loc 1 2031 0
	mov	#1,w0
	.loc 1 2034 0
	cp0	w1
	.set ___BP___,71
	bra	z,.L181
	.loc 1 2040 0
	add	w8,#18,w0
	rcall	_xCoRoutineRemoveFromEventList
	mov	w0,w1
	.loc 1 2044 0
	mov	#-5,w0
	.loc 1 2040 0
	cp0	w1
	.set ___BP___,50
	bra	nz,.L181
	.loc 1 2031 0
	mov	#1,w0
	.loc 1 2061 0
	mov	#-225,w1
	mov	#_SRbits,w2
	and	w1,[w2],[w2]
	nop	
	bra	.L180
.L187:
	.loc 1 2012 0
	add	w8,#8,w1
	mov	w10,w0
	rcall	_vCoRoutineAddToDelayedList
	.loc 1 2013 0
	mov	#_SRbits,w2
	and	w9,[w2],[w2]
	nop	
	.loc 1 2014 0
	mov	#-4,w0
	.loc 1 2064 0
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L188
.LFE23:
	.size	_xQueueCRSend, .-_xQueueCRSend
	.align	2
	.global	_xQueueCRReceive	; export
	.type	_xQueueCRReceive,@function
_xQueueCRReceive:
.LFB24:
	.loc 1 2072 0
	.set ___PA___,0
	mov.d	w8,[w15++]
.LCFI28:
	mov	w0,w8
	mov	w1,w3
	.loc 1 2079 0
	mov	#-225,w9
	mov	_SRbits,w1
	and	w9,w1,w0
	bset	w0,#5
	mov	w0,_SRbits
	nop	
; 2079 "../../source/queue.c" 1
	NOP
	.loc 1 2081 0
	mov	[w8+28],w0
	cp0	w0
	.set ___BP___,29
	bra	nz,.L191
	.loc 1 2085 0
	cp0	w2
	.set ___BP___,4
	bra	nz,.L200
	.loc 1 2095 0
	mov	#_SRbits,w0
	and	w9,[w0],[w0]
	nop	
	.loc 1 2096 0
	clr	w0
	.loc 1 2154 0
	mov.d	[--w15],w8
	return	
.L203:
	.set ___PA___,0
.L191:
	.loc 1 2104 0
	mov	#_SRbits,w1
	and	w9,[w1],[w1]
	nop	
	.loc 1 2106 0
	mov	_SRbits,w2
	and	w9,w2,w9
	bset	w9,#5
	mov	w9,_SRbits
	nop	
; 2106 "../../source/queue.c" 1
	NOP
	.loc 1 2108 0
	mov	[w8+28],w1
	.loc 1 2148 0
	clr	w0
	.loc 1 2108 0
	cp0	w1
	.set ___BP___,50
	bra	z,.L194
	.loc 1 2111 0
	mov	[w8+32],w2
	mov	[w8+6],w1
	add	w1,w2,w1
	mov	w1,[w8+6]
	.loc 1 2112 0
	mov	[w8+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,50
	bra	ltu,.L195
	.loc 1 2114 0
	mov	[w8],w1
	mov	w1,[w8+6]
.L195:
	.loc 1 2120 0
	mov	[w8+28],w0
	dec	w0,w0
	mov	w0,[w8+28]
	.loc 1 2121 0
	mov	w3,w0
	rcall	_memcpy
	.loc 1 2126 0
	mov	[w8+8],w1
	.loc 1 2123 0
	mov	#1,w0
	.loc 1 2126 0
	cp0	w1
	.set ___BP___,29
	bra	nz,.L201
.L194:
	.loc 1 2151 0
	mov	#-225,w1
	mov	#_SRbits,w2
	and	w1,[w2],[w2]
	nop	
.L202:
	.loc 1 2154 0
	mov.d	[--w15],w8
	return	
	bra	.L203
.L201:
	.loc 1 2132 0
	add	w8,#8,w0
	rcall	_xCoRoutineRemoveFromEventList
	mov	w0,w1
	.loc 1 2134 0
	mov	#-5,w0
	.loc 1 2132 0
	cp0	w1
	.set ___BP___,50
	bra	nz,.L194
	.loc 1 2123 0
	mov	#1,w0
	.loc 1 2151 0
	mov	#-225,w1
	mov	#_SRbits,w2
	and	w1,[w2],[w2]
	nop	
	bra	.L202
.L200:
	.loc 1 2089 0
	add	w8,#18,w1
	mov	w2,w0
	rcall	_vCoRoutineAddToDelayedList
	.loc 1 2090 0
	mov	#_SRbits,w2
	and	w9,[w2],[w2]
	nop	
	.loc 1 2091 0
	mov	#-4,w0
	.loc 1 2154 0
	mov.d	[--w15],w8
	return	
	bra	.L203
.LFE24:
	.size	_xQueueCRReceive, .-_xQueueCRReceive
	.align	2
	.global	_xQueueCRSendFromISR	; export
	.type	_xQueueCRSendFromISR,@function
_xQueueCRSendFromISR:
.LFB25:
	.loc 1 2162 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI29:
	mov	w0,w8
	mov	w2,w9
	.loc 1 2167 0
	mov	[w8+28],w2
	mov	[w8+30],w0
	sub	w2,w0,[w15]
	.set ___BP___,29
	bra	ltu,.L208
.L206:
	.loc 1 2202 0
	mov	w9,w0
	mov.d	[--w15],w8
	return	
.L209:
	.set ___PA___,0
.L208:
	.loc 1 2169 0
	clr	w2
	mov	w8,w0
	rcall	_prvCopyDataToQueue
	.loc 1 2173 0
	cp0	w9
	.set ___BP___,50
	bra	nz,.L206
	.loc 1 2175 0
	mov	[w8+18],w0
	cp0	w0
	.set ___BP___,71
	bra	z,.L206
	.loc 1 2177 0
	add	w8,#18,w0
	rcall	_xCoRoutineRemoveFromEventList
	.loc 1 2161 0
	btsc	w0,#15
	neg	w0,w0
	neg	w0,w0
	lsr	w0,#15,w9
	.loc 1 2202 0
	mov	w9,w0
	mov.d	[--w15],w8
	return	
	bra	.L209
.LFE25:
	.size	_xQueueCRSendFromISR, .-_xQueueCRSendFromISR
	.align	2
	.global	_xQueueCRReceiveFromISR	; export
	.type	_xQueueCRReceiveFromISR,@function
_xQueueCRReceiveFromISR:
.LFB26:
	.loc 1 2210 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI30:
	mov	w10,[w15++]
.LCFI31:
	mov	w0,w8
	mov	w1,w0
	mov	w2,w9
	.loc 1 2216 0
	mov	[w8+28],w1
	.loc 1 2258 0
	clr	w10
	.loc 1 2216 0
	cp0	w1
	.set ___BP___,39
	bra	z,.L212
	.loc 1 2219 0
	mov	[w8+32],w2
	mov	[w8+6],w1
	add	w1,w2,w1
	mov	w1,[w8+6]
	.loc 1 2220 0
	mov	[w8+2],w3
	sub	w1,w3,[w15]
	.set ___BP___,50
	bra	ltu,.L213
	.loc 1 2222 0
	mov	[w8],w1
	mov	w1,[w8+6]
.L213:
	.loc 1 2228 0
	mov	[w8+28],w3
	dec	w3,w3
	mov	w3,[w8+28]
	.loc 1 2229 0
	rcall	_memcpy
	.loc 1 2254 0
	mov	#1,w10
	.loc 1 2231 0
	cp0	[w9]
	.set ___BP___,39
	bra	nz,.L212
	.loc 1 2233 0
	mov	[w8+8],w0
	cp0	w0
	.set ___BP___,38
	bra	nz,.L219
.L212:
	.loc 1 2262 0
	mov	w10,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
.L220:
	.set ___PA___,0
.L219:
	.loc 1 2235 0
	add	w8,#8,w0
	rcall	_xCoRoutineRemoveFromEventList
	cp0	w0
	.set ___BP___,39
	bra	z,.L212
	.loc 1 2237 0
	mov	w10,[w9]
	.loc 1 2262 0
	mov	w10,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L220
.LFE26:
	.size	_xQueueCRReceiveFromISR, .-_xQueueCRReceiveFromISR
	.align	2
	.global	_vQueueWaitForMessageRestricted	; export
	.type	_vQueueWaitForMessageRestricted,@function
_vQueueWaitForMessageRestricted:
.LFB27:
	.loc 1 2359 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI32:
	mov	w10,[w15++]
.LCFI33:
	mov.d	w0,w8
	mov	w2,w10
	.loc 1 2376 0
	rcall	_vPortEnterCritical
	mov.b	[w8+34],w0
	add.b	w0,#1,[w15]
	.set ___BP___,28
	bra	z,.L227
	mov.b	[w8+35],w0
	add.b	w0,#1,[w15]
	.set ___BP___,28
	bra	z,.L228
.L224:
	rcall	_vPortExitCritical
	.loc 1 2377 0
	mov	[w8+28],w0
	cp0	w0
	.set ___BP___,38
	bra	z,.L229
.L225:
	.loc 1 2386 0
	mov	w8,w0
	rcall	_prvUnlockQueue
	.loc 1 2387 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
.L230:
	.set ___PA___,0
.L229:
	.loc 1 2380 0
	add	w8,#18,w0
	mov	w10,w2
	mov	w9,w1
	rcall	_vTaskPlaceOnEventListRestricted
	.loc 1 2386 0
	mov	w8,w0
	rcall	_prvUnlockQueue
	.loc 1 2387 0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L230
.L228:
	.loc 1 2376 0
	clr.b	w0
	mov.b	w0,[w8+35]
	rcall	_vPortExitCritical
	.loc 1 2377 0
	mov	[w8+28],w0
	cp0	w0
	.set ___BP___,61
	bra	nz,.L225
	bra	.L229
.L227:
	.loc 1 2376 0
	clr.b	w0
	mov.b	w0,[w8+34]
	mov.b	[w8+35],w0
	add.b	w0,#1,[w15]
	.set ___BP___,72
	bra	nz,.L224
	bra	.L228
.LFE27:
	.size	_vQueueWaitForMessageRestricted, .-_vQueueWaitForMessageRestricted
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
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI0-.LFB18
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
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI2-.LFB16
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI4-.LFB0
	.byte	0x13
	.sleb128 -4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI5-.LFB1
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0x13
	.sleb128 -5
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
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI7-.LFB5
	.byte	0x13
	.sleb128 -3
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
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
	.byte	0x4
	.4byte	.LCFI11-.LCFI8
	.byte	0x8c
	.uleb128 0xa
	.byte	0x8a
	.uleb128 0x8
	.byte	0x88
	.uleb128 0x6
	.align	4
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI12-.LFB4
	.byte	0x13
	.sleb128 -3
	.byte	0x88
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
	.4byte	.LCFI13-.LFB7
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
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
	.4byte	.LCFI15-.LFB8
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0x88
	.uleb128 0x4
	.align	4
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI17-.LFB9
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI20-.LCFI17
	.byte	0x8c
	.uleb128 0xa
	.byte	0x8a
	.uleb128 0x8
	.byte	0x88
	.uleb128 0x6
	.align	4
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI21-.LFB10
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0x13
	.sleb128 -6
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
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
	.4byte	.LCFI23-.LFB11
	.byte	0x13
	.sleb128 -4
	.byte	0x88
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
	.4byte	.LCFI24-.LFB12
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
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI25-.LFB13
	.byte	0x13
	.sleb128 -3
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.align	4
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.align	4
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.align	4
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.align	4
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x4
	.4byte	.LCFI26-.LFB23
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0x13
	.sleb128 -6
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x4
	.4byte	.LCFI28-.LFB24
	.byte	0x13
	.sleb128 -4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x4
	.4byte	.LCFI29-.LFB25
	.byte	0x13
	.sleb128 -4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x4
	.4byte	.LCFI30-.LFB26
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x4
	.4byte	.LCFI32-.LFB27
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE44:
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/yvals.h"
	.file 3 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdlib.h"
	.file 4 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 5 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h"
	.file 6 "../../source/include/../../Source/portable/MPLAB/PIC24_dsPIC/portmacro.h"
	.file 7 "../../source/include/list.h"
	.file 8 "../../source/include/task.h"
	.file 9 "../../source/include/queue.h"
	.section	.debug_info,info
	.4byte	0x136d
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../../source/queue.c"
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
	.uleb128 0x5
	.byte	0x2
	.4byte	0x130
	.uleb128 0x6
	.uleb128 0x4
	.asciz	"int8_t"
	.byte	0x4
	.byte	0xd
	.4byte	0x13f
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"signed char"
	.uleb128 0x4
	.asciz	"uint8_t"
	.byte	0x4
	.byte	0x2b
	.4byte	0x15d
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x4
	.byte	0x31
	.4byte	0xeb
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x7
	.byte	0x2
	.byte	0x5
	.byte	0x87
	.4byte	0x27c
	.uleb128 0x8
	.asciz	"C"
	.byte	0x5
	.byte	0x88
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"Z"
	.byte	0x5
	.byte	0x89
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"OV"
	.byte	0x5
	.byte	0x8a
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"N"
	.byte	0x5
	.byte	0x8b
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"RA"
	.byte	0x5
	.byte	0x8c
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"IPL"
	.byte	0x5
	.byte	0x8d
	.4byte	0x16e
	.byte	0x2
	.byte	0x3
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"DC"
	.byte	0x5
	.byte	0x8e
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"DA"
	.byte	0x5
	.byte	0x8f
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"SAB"
	.byte	0x5
	.byte	0x90
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"OAB"
	.byte	0x5
	.byte	0x91
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"SB"
	.byte	0x5
	.byte	0x92
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"SA"
	.byte	0x5
	.byte	0x93
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"OB"
	.byte	0x5
	.byte	0x94
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"OA"
	.byte	0x5
	.byte	0x95
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x2
	.byte	0x5
	.byte	0x97
	.4byte	0x2bb
	.uleb128 0x8
	.asciz	"IPL0"
	.byte	0x5
	.byte	0x99
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"IPL1"
	.byte	0x5
	.byte	0x9a
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.asciz	"IPL2"
	.byte	0x5
	.byte	0x9b
	.4byte	0x16e
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x9
	.byte	0x2
	.byte	0x5
	.byte	0x86
	.4byte	0x2ce
	.uleb128 0xa
	.4byte	0x193
	.uleb128 0xa
	.4byte	0x27c
	.byte	0x0
	.uleb128 0xb
	.asciz	"tagSRBITS"
	.byte	0x2
	.byte	0x5
	.byte	0x85
	.4byte	0x2e9
	.uleb128 0xc
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x4
	.asciz	"SRBITS"
	.byte	0x5
	.byte	0x9e
	.4byte	0x2ce
	.uleb128 0x4
	.asciz	"BaseType_t"
	.byte	0x6
	.byte	0x61
	.4byte	0x309
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"UBaseType_t"
	.byte	0x6
	.byte	0x62
	.4byte	0xd5
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x6
	.byte	0x65
	.4byte	0x16e
	.uleb128 0x5
	.byte	0x2
	.4byte	0x14e
	.uleb128 0xb
	.asciz	"xLIST_ITEM"
	.byte	0xa
	.byte	0x7
	.byte	0xb5
	.4byte	0x3aa
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x7
	.byte	0xb8
	.4byte	0x329
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.asciz	"pxNext"
	.byte	0x7
	.byte	0xb9
	.4byte	0x3aa
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.4byte	.LASF1
	.byte	0x7
	.byte	0xba
	.4byte	0x3aa
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.asciz	"pvOwner"
	.byte	0x7
	.byte	0xbb
	.4byte	0xa8
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xe
	.asciz	"pvContainer"
	.byte	0x7
	.byte	0xbc
	.4byte	0xa8
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	0x341
	.uleb128 0x4
	.asciz	"ListItem_t"
	.byte	0x7
	.byte	0xbf
	.4byte	0x341
	.uleb128 0xb
	.asciz	"xMINI_LIST_ITEM"
	.byte	0x6
	.byte	0x7
	.byte	0xc1
	.4byte	0x408
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x7
	.byte	0xc4
	.4byte	0x329
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.asciz	"pxNext"
	.byte	0x7
	.byte	0xc5
	.4byte	0x3aa
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.4byte	.LASF1
	.byte	0x7
	.byte	0xc6
	.4byte	0x3aa
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.asciz	"MiniListItem_t"
	.byte	0x7
	.byte	0xc8
	.4byte	0x3c2
	.uleb128 0xb
	.asciz	"xLIST"
	.byte	0xa
	.byte	0x7
	.byte	0xcd
	.4byte	0x46c
	.uleb128 0xe
	.asciz	"uxNumberOfItems"
	.byte	0x7
	.byte	0xd0
	.4byte	0x316
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.asciz	"pxIndex"
	.byte	0x7
	.byte	0xd1
	.4byte	0x46c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.asciz	"xListEnd"
	.byte	0x7
	.byte	0xd2
	.4byte	0x408
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	0x3b0
	.uleb128 0x4
	.asciz	"List_t"
	.byte	0x7
	.byte	0xd4
	.4byte	0x41e
	.uleb128 0xb
	.asciz	"xTIME_OUT"
	.byte	0x4
	.byte	0x8
	.byte	0x87
	.4byte	0x4c6
	.uleb128 0xe
	.asciz	"xOverflowCount"
	.byte	0x8
	.byte	0x89
	.4byte	0x2f7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.asciz	"xTimeOnEntering"
	.byte	0x8
	.byte	0x8a
	.4byte	0x329
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x4
	.asciz	"TimeOut_t"
	.byte	0x8
	.byte	0x8b
	.4byte	0x480
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x4
	.asciz	"QueueHandle_t"
	.byte	0x9
	.byte	0x58
	.4byte	0xa8
	.uleb128 0x9
	.byte	0x2
	.byte	0x1
	.byte	0x88
	.4byte	0x52b
	.uleb128 0xf
	.asciz	"pcReadFrom"
	.byte	0x1
	.byte	0x8a
	.4byte	0x52b
	.uleb128 0xf
	.asciz	"uxRecursiveCallCount"
	.byte	0x1
	.byte	0x8b
	.4byte	0x316
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	0x131
	.uleb128 0xb
	.asciz	"QueueDefinition"
	.byte	0x24
	.byte	0x1
	.byte	0x82
	.4byte	0x616
	.uleb128 0xe
	.asciz	"pcHead"
	.byte	0x1
	.byte	0x84
	.4byte	0x52b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.asciz	"pcTail"
	.byte	0x1
	.byte	0x85
	.4byte	0x52b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.asciz	"pcWriteTo"
	.byte	0x1
	.byte	0x86
	.4byte	0x52b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.asciz	"u"
	.byte	0x1
	.byte	0x8c
	.4byte	0x4f4
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xe
	.asciz	"xTasksWaitingToSend"
	.byte	0x1
	.byte	0x8e
	.4byte	0x472
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.asciz	"xTasksWaitingToReceive"
	.byte	0x1
	.byte	0x8f
	.4byte	0x472
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xd
	.4byte	.LASF2
	.byte	0x1
	.byte	0x91
	.4byte	0x616
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xe
	.asciz	"uxLength"
	.byte	0x1
	.byte	0x92
	.4byte	0x316
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xd
	.4byte	.LASF3
	.byte	0x1
	.byte	0x93
	.4byte	0x316
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xd
	.4byte	.LASF4
	.byte	0x1
	.byte	0x95
	.4byte	0x61b
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xd
	.4byte	.LASF5
	.byte	0x1
	.byte	0x96
	.4byte	0x61b
	.byte	0x2
	.byte	0x23
	.uleb128 0x23
	.byte	0x0
	.uleb128 0x10
	.4byte	0x316
	.uleb128 0x10
	.4byte	0x131
	.uleb128 0x4
	.asciz	"xQUEUE"
	.byte	0x1
	.byte	0xa5
	.4byte	0x531
	.uleb128 0x4
	.asciz	"Queue_t"
	.byte	0x1
	.byte	0xa9
	.4byte	0x620
	.uleb128 0x11
	.asciz	"prvInitialiseNewQueue"
	.byte	0x1
	.2byte	0x1b0
	.byte	0x1
	.byte	0x1
	.4byte	0x69a
	.uleb128 0x12
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x69a
	.uleb128 0x12
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x69a
	.uleb128 0x12
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x33b
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x69f
	.uleb128 0x12
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x6a4
	.byte	0x0
	.uleb128 0x13
	.4byte	0x316
	.uleb128 0x13
	.4byte	0x14e
	.uleb128 0x5
	.byte	0x2
	.4byte	0x62e
	.uleb128 0x14
	.asciz	"prvIsQueueFull"
	.byte	0x1
	.2byte	0x7a1
	.byte	0x1
	.4byte	0x2f7
	.byte	0x1
	.4byte	0x6e0
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x7a1
	.4byte	0x6e0
	.uleb128 0x15
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x7a3
	.4byte	0x2f7
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	0x6e6
	.uleb128 0x13
	.4byte	0x62e
	.uleb128 0x11
	.asciz	"prvInitialiseMutex"
	.byte	0x1
	.2byte	0x1dc
	.byte	0x1
	.byte	0x1
	.4byte	0x715
	.uleb128 0x12
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1dc
	.4byte	0x6a4
	.byte	0x0
	.uleb128 0x11
	.asciz	"prvCopyDataFromQueue"
	.byte	0x1
	.2byte	0x6f0
	.byte	0x1
	.byte	0x1
	.4byte	0x74d
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x6f0
	.4byte	0x74d
	.uleb128 0x12
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x6f0
	.4byte	0x752
	.byte	0x0
	.uleb128 0x13
	.4byte	0x6a4
	.uleb128 0x13
	.4byte	0xa8
	.uleb128 0x14
	.asciz	"prvIsQueueEmpty"
	.byte	0x1
	.2byte	0x77a
	.byte	0x1
	.4byte	0x2f7
	.byte	0x1
	.4byte	0x78e
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x77a
	.4byte	0x6e0
	.uleb128 0x15
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x77c
	.4byte	0x2f7
	.byte	0x0
	.uleb128 0x16
	.asciz	"prvUnlockQueue"
	.byte	0x1
	.2byte	0x702
	.byte	0x1
	.4byte	.LFB18
	.4byte	.LFE18
	.byte	0x1
	.byte	0x5f
	.4byte	0x7f3
	.uleb128 0x17
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x702
	.4byte	0x74d
	.byte	0x1
	.byte	0x59
	.uleb128 0x18
	.4byte	.LBB23
	.4byte	.LBE23
	.4byte	0x7da
	.uleb128 0x19
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x70c
	.4byte	0x131
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x1a
	.4byte	.LBB24
	.4byte	.LBE24
	.uleb128 0x19
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x75d
	.4byte	0x131
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.asciz	"prvCopyDataToQueue"
	.byte	0x1
	.2byte	0x6a1
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x1
	.byte	0x5f
	.4byte	0x86a
	.uleb128 0x17
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x6a1
	.4byte	0x74d
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x6a1
	.4byte	0x12a
	.byte	0x1
	.byte	0x51
	.uleb128 0x1c
	.asciz	"xPosition"
	.byte	0x1
	.2byte	0x6a1
	.4byte	0x86a
	.byte	0x1
	.byte	0x5a
	.uleb128 0x19
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x6a3
	.4byte	0x2f7
	.byte	0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x6a4
	.4byte	0x316
	.byte	0x1
	.byte	0x59
	.byte	0x0
	.uleb128 0x13
	.4byte	0x2f7
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueGenericReset"
	.byte	0x1
	.2byte	0x117
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5f
	.4byte	0x8c9
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x117
	.4byte	0x4df
	.byte	0x1
	.byte	0x58
	.uleb128 0x1c
	.asciz	"xNewQueue"
	.byte	0x1
	.2byte	0x117
	.4byte	0x2f7
	.byte	0x1
	.byte	0x59
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x119
	.4byte	0x74d
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueGenericCreate"
	.byte	0x1
	.2byte	0x182
	.byte	0x1
	.4byte	0x4df
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5f
	.4byte	0x976
	.uleb128 0x17
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x182
	.4byte	0x69a
	.byte	0x1
	.byte	0x59
	.uleb128 0x17
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x182
	.4byte	0x69a
	.byte	0x1
	.byte	0x5a
	.uleb128 0x17
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x182
	.4byte	0x69f
	.byte	0x1
	.byte	0x52
	.uleb128 0x19
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x184
	.4byte	0x6a4
	.byte	0x1
	.byte	0x58
	.uleb128 0x1e
	.asciz	"xQueueSizeInBytes"
	.byte	0x1
	.2byte	0x185
	.4byte	0x11c
	.uleb128 0x15
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x186
	.4byte	0x33b
	.uleb128 0x1f
	.4byte	0x63d
	.4byte	.LBB27
	.4byte	.LBE27
	.uleb128 0x20
	.4byte	0x68d
	.uleb128 0x20
	.4byte	0x675
	.uleb128 0x20
	.4byte	0x669
	.uleb128 0x20
	.4byte	0x65d
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueCreateCountingSemaphore"
	.byte	0x1
	.2byte	0x2b9
	.byte	0x1
	.4byte	0x4df
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5f
	.4byte	0x9ed
	.uleb128 0x1c
	.asciz	"uxMaxCount"
	.byte	0x1
	.2byte	0x2b9
	.4byte	0x69a
	.byte	0x1
	.byte	0x50
	.uleb128 0x1c
	.asciz	"uxInitialCount"
	.byte	0x1
	.2byte	0x2b9
	.4byte	0x69a
	.byte	0x1
	.byte	0x58
	.uleb128 0x21
	.asciz	"xHandle"
	.byte	0x1
	.2byte	0x2bb
	.4byte	0x4df
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueGenericSend"
	.byte	0x1
	.2byte	0x2d3
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5f
	.4byte	0xab5
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x2d3
	.4byte	0x4df
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x2d3
	.4byte	0xab5
	.byte	0x1
	.byte	0x59
	.uleb128 0x17
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x2d3
	.4byte	0x329
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x2d3
	.4byte	0x86a
	.byte	0x1
	.byte	0x5a
	.uleb128 0x19
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x2d5
	.4byte	0x2f7
	.byte	0x1
	.byte	0x5c
	.uleb128 0x21
	.asciz	"xYieldRequired"
	.byte	0x1
	.2byte	0x2d5
	.4byte	0x2f7
	.byte	0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x2d6
	.4byte	0x4c6
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x2d7
	.4byte	0x74d
	.uleb128 0x1f
	.4byte	0x6aa
	.4byte	.LBB31
	.4byte	.LBE31
	.uleb128 0x20
	.4byte	0x6c7
	.uleb128 0x1a
	.4byte	.LBB32
	.4byte	.LBE32
	.uleb128 0x22
	.4byte	0x6d3
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.4byte	0x12a
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueCreateMutex"
	.byte	0x1
	.2byte	0x1fa
	.byte	0x1
	.4byte	0x4df
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5f
	.4byte	0xb3e
	.uleb128 0x17
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x1fa
	.4byte	0x69f
	.byte	0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1fc
	.4byte	0x6a4
	.byte	0x1
	.byte	0x58
	.uleb128 0x1e
	.asciz	"uxMutexLength"
	.byte	0x1
	.2byte	0x1fd
	.4byte	0x69a
	.uleb128 0x1e
	.asciz	"uxMutexSize"
	.byte	0x1
	.2byte	0x1fd
	.4byte	0x69a
	.uleb128 0x1f
	.4byte	0x6eb
	.4byte	.LBB35
	.4byte	.LBE35
	.uleb128 0x20
	.4byte	0x708
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueGenericSendFromISR"
	.byte	0x1
	.2byte	0x399
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x5f
	.4byte	0xbe6
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x399
	.4byte	0x4df
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x399
	.4byte	0xab5
	.byte	0x1
	.byte	0x51
	.uleb128 0x17
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x399
	.4byte	0xbe6
	.byte	0x1
	.byte	0x59
	.uleb128 0x17
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x399
	.4byte	0x86a
	.byte	0x1
	.byte	0x53
	.uleb128 0x19
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x39b
	.4byte	0x2f7
	.byte	0x1
	.byte	0x5a
	.uleb128 0x15
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x39c
	.4byte	0x316
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x39d
	.4byte	0x74d
	.uleb128 0x1a
	.4byte	.LBB37
	.4byte	.LBE37
	.uleb128 0x19
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x3bc
	.4byte	0xbf1
	.byte	0x1
	.byte	0x5a
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.4byte	0xbeb
	.uleb128 0x5
	.byte	0x2
	.4byte	0x2f7
	.uleb128 0x13
	.4byte	0x131
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueGiveFromISR"
	.byte	0x1
	.2byte	0x430
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x5f
	.4byte	0xc93
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x430
	.4byte	0x4df
	.byte	0x1
	.byte	0x50
	.uleb128 0x17
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x430
	.4byte	0xbe6
	.byte	0x1
	.byte	0x51
	.uleb128 0x19
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x432
	.4byte	0x2f7
	.byte	0x1
	.byte	0x58
	.uleb128 0x15
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x433
	.4byte	0x316
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x434
	.4byte	0x74d
	.uleb128 0x1a
	.4byte	.LBB39
	.4byte	.LBE39
	.uleb128 0x19
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x459
	.4byte	0x69a
	.byte	0x1
	.byte	0x52
	.uleb128 0x1a
	.4byte	.LBB40
	.4byte	.LBE40
	.uleb128 0x19
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x460
	.4byte	0xbf1
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueGenericReceive"
	.byte	0x1
	.2byte	0x4d5
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x5f
	.4byte	0xdb6
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x4d5
	.4byte	0x4df
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x4d5
	.4byte	0x752
	.byte	0x1
	.byte	0x59
	.uleb128 0x17
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x4d5
	.4byte	0x329
	.byte	0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x1c
	.asciz	"xJustPeeking"
	.byte	0x1
	.2byte	0x4d5
	.4byte	0x86a
	.byte	0x1
	.byte	0x5b
	.uleb128 0x19
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x4d7
	.4byte	0x2f7
	.byte	0x1
	.byte	0x5d
	.uleb128 0x19
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x4d8
	.4byte	0x4c6
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x19
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x4d9
	.4byte	0x52b
	.byte	0x1
	.byte	0x5c
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x4da
	.4byte	0x74d
	.uleb128 0x18
	.4byte	.LBB43
	.4byte	.LBE43
	.4byte	0xd6d
	.uleb128 0x19
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x4ec
	.4byte	0x69a
	.byte	0x1
	.byte	0x5a
	.uleb128 0x1f
	.4byte	0x715
	.4byte	.LBB44
	.4byte	.LBE44
	.uleb128 0x20
	.4byte	0x740
	.uleb128 0x20
	.4byte	0x734
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.4byte	0x757
	.4byte	.LBB46
	.4byte	.LBE46
	.4byte	0xd93
	.uleb128 0x20
	.4byte	0x775
	.uleb128 0x1a
	.4byte	.LBB47
	.4byte	.LBE47
	.uleb128 0x22
	.4byte	0x781
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.4byte	0x757
	.4byte	.LBB51
	.4byte	.LBE51
	.uleb128 0x20
	.4byte	0x775
	.uleb128 0x1a
	.4byte	.LBB52
	.4byte	.LBE52
	.uleb128 0x22
	.4byte	0x781
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueReceiveFromISR"
	.byte	0x1
	.2byte	0x59a
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x5f
	.4byte	0xe7c
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x59a
	.4byte	0x4df
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x59a
	.4byte	0x752
	.byte	0x1
	.byte	0x53
	.uleb128 0x17
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x59a
	.4byte	0xbe6
	.byte	0x1
	.byte	0x5b
	.uleb128 0x19
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x59c
	.4byte	0x2f7
	.byte	0x1
	.byte	0x5a
	.uleb128 0x15
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x59d
	.4byte	0x316
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x59e
	.4byte	0x74d
	.uleb128 0x1a
	.4byte	.LBB57
	.4byte	.LBE57
	.uleb128 0x19
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x5b5
	.4byte	0x69a
	.byte	0x1
	.byte	0x59
	.uleb128 0x1a
	.4byte	.LBB58
	.4byte	.LBE58
	.uleb128 0x19
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x5ba
	.4byte	0xbf1
	.byte	0x1
	.byte	0x5a
	.uleb128 0x1f
	.4byte	0x715
	.4byte	.LBB59
	.4byte	.LBE59
	.uleb128 0x20
	.4byte	0x740
	.uleb128 0x20
	.4byte	0x734
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueuePeekFromISR"
	.byte	0x1
	.2byte	0x5f5
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x1
	.byte	0x5f
	.4byte	0xf0f
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x5f5
	.4byte	0x4df
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x5f5
	.4byte	0x752
	.byte	0x1
	.byte	0x53
	.uleb128 0x19
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x5f7
	.4byte	0x2f7
	.byte	0x1
	.byte	0x50
	.uleb128 0x15
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x5f8
	.4byte	0x316
	.uleb128 0x19
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x5f9
	.4byte	0x52b
	.byte	0x1
	.byte	0x59
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x5fa
	.4byte	0x74d
	.uleb128 0x1f
	.4byte	0x715
	.4byte	.LBB63
	.4byte	.LBE63
	.uleb128 0x20
	.4byte	0x740
	.uleb128 0x20
	.4byte	0x734
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"uxQueueMessagesWaiting"
	.byte	0x1
	.2byte	0x62b
	.byte	0x1
	.4byte	0x316
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x1
	.byte	0x5f
	.4byte	0xf5b
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x62b
	.4byte	0xf5b
	.byte	0x1
	.byte	0x58
	.uleb128 0x19
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x62d
	.4byte	0x316
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x13
	.4byte	0x4df
	.uleb128 0x1d
	.byte	0x1
	.asciz	"uxQueueSpacesAvailable"
	.byte	0x1
	.2byte	0x63b
	.byte	0x1
	.4byte	0x316
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x1
	.byte	0x5f
	.4byte	0xfb8
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x63b
	.4byte	0xf5b
	.byte	0x1
	.byte	0x58
	.uleb128 0x19
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x63d
	.4byte	0x316
	.byte	0x1
	.byte	0x58
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x63e
	.4byte	0x6a4
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"uxQueueMessagesWaitingFromISR"
	.byte	0x1
	.2byte	0x64d
	.byte	0x1
	.4byte	0x316
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x1
	.byte	0x5f
	.4byte	0x100b
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x64d
	.4byte	0xf5b
	.byte	0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x64f
	.4byte	0x316
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x24
	.byte	0x1
	.asciz	"vQueueDelete"
	.byte	0x1
	.2byte	0x659
	.byte	0x1
	.4byte	.LFB15
	.4byte	.LFE15
	.byte	0x1
	.byte	0x5f
	.4byte	0x1047
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x659
	.4byte	0x4df
	.byte	0x1
	.byte	0x50
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x65b
	.4byte	0x74d
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueIsQueueEmptyFromISR"
	.byte	0x1
	.2byte	0x78f
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB20
	.4byte	.LFE20
	.byte	0x1
	.byte	0x5f
	.4byte	0x1094
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x78f
	.4byte	0xf5b
	.byte	0x1
	.byte	0x50
	.uleb128 0x15
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x791
	.4byte	0x2f7
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueIsQueueFullFromISR"
	.byte	0x1
	.2byte	0x7b6
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB22
	.4byte	.LFE22
	.byte	0x1
	.byte	0x5f
	.4byte	0x10e0
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x7b6
	.4byte	0xf5b
	.byte	0x1
	.byte	0x50
	.uleb128 0x15
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x7b8
	.4byte	0x2f7
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueCRSend"
	.byte	0x1
	.2byte	0x7ca
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB23
	.4byte	.LFE23
	.byte	0x1
	.byte	0x5f
	.4byte	0x116c
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x7ca
	.4byte	0x4df
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x7ca
	.4byte	0x12a
	.byte	0x1
	.byte	0x5b
	.uleb128 0x17
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x7ca
	.4byte	0x329
	.byte	0x1
	.byte	0x5a
	.uleb128 0x19
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x7cc
	.4byte	0x2f7
	.byte	0x1
	.byte	0x50
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x7cd
	.4byte	0x74d
	.uleb128 0x1f
	.4byte	0x6aa
	.4byte	.LBB65
	.4byte	.LBE65
	.uleb128 0x20
	.4byte	0x6c7
	.uleb128 0x1a
	.4byte	.LBB66
	.4byte	.LBE66
	.uleb128 0x22
	.4byte	0x6d3
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueCRReceive"
	.byte	0x1
	.2byte	0x817
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB24
	.4byte	.LFE24
	.byte	0x1
	.byte	0x5f
	.4byte	0x11d9
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x817
	.4byte	0x4df
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x817
	.4byte	0xa8
	.byte	0x1
	.byte	0x53
	.uleb128 0x17
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x817
	.4byte	0x329
	.byte	0x1
	.byte	0x52
	.uleb128 0x19
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x819
	.4byte	0x2f7
	.byte	0x1
	.byte	0x50
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x81a
	.4byte	0x74d
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueCRSendFromISR"
	.byte	0x1
	.2byte	0x871
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB25
	.4byte	.LFE25
	.byte	0x1
	.byte	0x5f
	.4byte	0x1252
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x871
	.4byte	0x4df
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x871
	.4byte	0x12a
	.byte	0x1
	.byte	0x51
	.uleb128 0x1c
	.asciz	"xCoRoutinePreviouslyWoken"
	.byte	0x1
	.2byte	0x871
	.4byte	0x2f7
	.byte	0x1
	.byte	0x59
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x873
	.4byte	0x74d
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xQueueCRReceiveFromISR"
	.byte	0x1
	.2byte	0x8a1
	.byte	0x1
	.4byte	0x2f7
	.4byte	.LFB26
	.4byte	.LFE26
	.byte	0x1
	.byte	0x5f
	.4byte	0x12d3
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x8a1
	.4byte	0x4df
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x8a1
	.4byte	0xa8
	.byte	0x1
	.byte	0x50
	.uleb128 0x1c
	.asciz	"pxCoRoutineWoken"
	.byte	0x1
	.2byte	0x8a1
	.4byte	0xbeb
	.byte	0x1
	.byte	0x59
	.uleb128 0x19
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x8a3
	.4byte	0x2f7
	.byte	0x1
	.byte	0x5a
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x8a4
	.4byte	0x74d
	.byte	0x0
	.uleb128 0x24
	.byte	0x1
	.asciz	"vQueueWaitForMessageRestricted"
	.byte	0x1
	.2byte	0x936
	.byte	0x1
	.4byte	.LFB27
	.4byte	.LFE27
	.byte	0x1
	.byte	0x5f
	.4byte	0x134b
	.uleb128 0x17
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x936
	.4byte	0x4df
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x936
	.4byte	0x329
	.byte	0x1
	.byte	0x59
	.uleb128 0x1c
	.asciz	"xWaitIndefinitely"
	.byte	0x1
	.2byte	0x936
	.4byte	0x86a
	.byte	0x1
	.byte	0x5a
	.uleb128 0x15
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x938
	.4byte	0x74d
	.byte	0x0
	.uleb128 0x25
	.asciz	"SRbits"
	.byte	0x5
	.byte	0x9f
	.4byte	0x135b
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.4byte	0x2e9
	.uleb128 0x25
	.asciz	"SRbits"
	.byte	0x5
	.byte	0x9f
	.4byte	0x135b
	.byte	0x1
	.byte	0x1
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
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x225
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1371
	.4byte	0x86f
	.asciz	"xQueueGenericReset"
	.4byte	0x8c9
	.asciz	"xQueueGenericCreate"
	.4byte	0x976
	.asciz	"xQueueCreateCountingSemaphore"
	.4byte	0x9ed
	.asciz	"xQueueGenericSend"
	.4byte	0xaba
	.asciz	"xQueueCreateMutex"
	.4byte	0xb3e
	.asciz	"xQueueGenericSendFromISR"
	.4byte	0xbf6
	.asciz	"xQueueGiveFromISR"
	.4byte	0xc93
	.asciz	"xQueueGenericReceive"
	.4byte	0xdb6
	.asciz	"xQueueReceiveFromISR"
	.4byte	0xe7c
	.asciz	"xQueuePeekFromISR"
	.4byte	0xf0f
	.asciz	"uxQueueMessagesWaiting"
	.4byte	0xf60
	.asciz	"uxQueueSpacesAvailable"
	.4byte	0xfb8
	.asciz	"uxQueueMessagesWaitingFromISR"
	.4byte	0x100b
	.asciz	"vQueueDelete"
	.4byte	0x1047
	.asciz	"xQueueIsQueueEmptyFromISR"
	.4byte	0x1094
	.asciz	"xQueueIsQueueFullFromISR"
	.4byte	0x10e0
	.asciz	"xQueueCRSend"
	.4byte	0x116c
	.asciz	"xQueueCRReceive"
	.4byte	0x11d9
	.asciz	"xQueueCRSendFromISR"
	.4byte	0x1252
	.asciz	"xQueueCRReceiveFromISR"
	.4byte	0x12d3
	.asciz	"vQueueWaitForMessageRestricted"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x142
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1371
	.4byte	0x102
	.asciz	"_Sizet"
	.4byte	0x11c
	.asciz	"size_t"
	.4byte	0x131
	.asciz	"int8_t"
	.4byte	0x14e
	.asciz	"uint8_t"
	.4byte	0x16e
	.asciz	"uint16_t"
	.4byte	0x2ce
	.asciz	"tagSRBITS"
	.4byte	0x2e9
	.asciz	"SRBITS"
	.4byte	0x2f7
	.asciz	"BaseType_t"
	.4byte	0x316
	.asciz	"UBaseType_t"
	.4byte	0x329
	.asciz	"TickType_t"
	.4byte	0x341
	.asciz	"xLIST_ITEM"
	.4byte	0x3b0
	.asciz	"ListItem_t"
	.4byte	0x3c2
	.asciz	"xMINI_LIST_ITEM"
	.4byte	0x408
	.asciz	"MiniListItem_t"
	.4byte	0x41e
	.asciz	"xLIST"
	.4byte	0x472
	.asciz	"List_t"
	.4byte	0x480
	.asciz	"xTIME_OUT"
	.4byte	0x4c6
	.asciz	"TimeOut_t"
	.4byte	0x4df
	.asciz	"QueueHandle_t"
	.4byte	0x531
	.asciz	"QueueDefinition"
	.4byte	0x620
	.asciz	"xQUEUE"
	.4byte	0x62e
	.asciz	"Queue_t"
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
.LASF19:
	.asciz	"pxHigherPriorityTaskWoken"
.LASF7:
	.asciz	"pucQueueStorage"
.LASF8:
	.asciz	"ucQueueType"
.LASF9:
	.asciz	"pxNewQueue"
.LASF12:
	.asciz	"xReturn"
.LASF4:
	.asciz	"cRxLock"
.LASF5:
	.asciz	"cTxLock"
.LASF1:
	.asciz	"pxPrevious"
.LASF11:
	.asciz	"pvBuffer"
.LASF2:
	.asciz	"uxMessagesWaiting"
.LASF17:
	.asciz	"xEntryTimeSet"
.LASF10:
	.asciz	"pxQueue"
.LASF20:
	.asciz	"uxSavedInterruptStatus"
.LASF6:
	.asciz	"uxQueueLength"
.LASF13:
	.asciz	"pvItemToQueue"
.LASF18:
	.asciz	"xTimeOut"
.LASF0:
	.asciz	"xItemValue"
.LASF15:
	.asciz	"xTicksToWait"
.LASF3:
	.asciz	"uxItemSize"
.LASF22:
	.asciz	"uxReturn"
.LASF14:
	.asciz	"xQueue"
.LASF21:
	.asciz	"pcOriginalReadPosition"
.LASF16:
	.asciz	"xCopyPosition"
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
