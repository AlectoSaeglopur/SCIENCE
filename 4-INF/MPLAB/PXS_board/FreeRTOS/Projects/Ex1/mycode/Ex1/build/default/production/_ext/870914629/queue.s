	.file "C:\\Users\\Filippo\\Desktop\\Projects\\Ex1\\mycode\\Ex1\\..\\..\\source\\queue.c"
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
	.global	_xQueueGenericReset	; export
	.type	_xQueueGenericReset,@function
_xQueueGenericReset:
.LFB0:
	.file 1 "../../source/queue.c"
	.loc 1 280 0
	.set ___PA___,0
	lnk	#6
.LCFI0:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	.loc 1 281 0
	mov	[w14+2],w1
	mov	w1,[w14]
	.loc 1 285 0
	rcall	_vPortEnterCritical
	.loc 1 287 0
	mov	[w14],w0
	mov	[w0],w1
	mov	[w14],w0
	mov	[w0+30],w2
	mov	[w14],w0
	mov	[w0+32],w0
	mulw.ss	w2,w0,w0
	add	w1,w0,w1
	mov	[w14],w0
	mov	w1,[w0+2]
	.loc 1 288 0
	mov	[w14],w0
	clr	w1
	mov	w1,[w0+28]
	.loc 1 289 0
	mov	[w14],w0
	mov	[w0],w1
	mov	[w14],w0
	mov	w1,[w0+4]
	.loc 1 290 0
	mov	[w14],w0
	mov	[w0],w1
	mov	[w14],w0
	mov	[w0+30],w0
	dec	w0,w2
	mov	[w14],w0
	mov	[w0+32],w0
	mulw.ss	w2,w0,w0
	add	w1,w0,w1
	mov	[w14],w0
	mov	w1,[w0+6]
	.loc 1 291 0
	mov	[w14],w0
	setm.b	w1
	mov.b	w1,[w0+34]
	.loc 1 292 0
	mov	[w14],w0
	setm.b	w1
	mov.b	w1,[w0+35]
	.loc 1 294 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L2
	.loc 1 301 0
	mov	[w14],w0
	mov	[w0+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L3
	.loc 1 303 0
	mov	[w14],w1
	add	w1,#8,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L3
	.loc 1 305 0
; 305 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
	bra	.L3
.L2:
	.loc 1 320 0
	mov	[w14],w1
	add	w1,#8,w0
	rcall	_vListInitialise
	.loc 1 321 0
	mov	[w14],w1
	add	w1,#18,w0
	rcall	_vListInitialise
.L3:
	.loc 1 324 0
	rcall	_vPortExitCritical
	.loc 1 328 0
	mov	#1,w0
	.loc 1 329 0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.size	_xQueueGenericReset, .-_xQueueGenericReset
	.align	2
	.global	_xQueueGenericCreate	; export
	.type	_xQueueGenericCreate,@function
_xQueueGenericCreate:
.LFB1:
	.loc 1 387 0
	.set ___PA___,1
	lnk	#12
.LCFI1:
	mov	w0,[w14+6]
	mov	w1,[w14+8]
	mov.b	w2,[w14+10]
	.loc 1 394 0
	mov	[w14+8],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L5
	.loc 1 397 0
	clr	w0
	mov	w0,[w14]
	bra	.L6
.L5:
	.loc 1 403 0
	mov	[w14+6],w1
	mov	[w14+8],w0
	mulw.ss	w1,w0,w0
	mov	w0,[w14]
.L6:
	.loc 1 406 0
	mov	#40,w1
	add	w1,[w14],w0
	rcall	_pvPortMalloc
	mov	w0,[w14+2]
	.loc 1 408 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L7
	.loc 1 412 0
	mov	[w14+2],w0
	add	#40,w0
	mov	w0,[w14+4]
	.loc 1 423 0
	mov	[w14+2],w4
	mov.b	[w14+10],w3
	mov	[w14+4],w2
	mov	[w14+8],w1
	mov	[w14+6],w0
	rcall	_prvInitialiseNewQueue
.L7:
	.loc 1 426 0
	mov	[w14+2],w0
	.loc 1 427 0
	ulnk	
	return	
	.set ___PA___,0
.LFE1:
	.size	_xQueueGenericCreate, .-_xQueueGenericCreate
	.align	2
	.type	_prvInitialiseNewQueue,@function
_prvInitialiseNewQueue:
.LFB2:
	.loc 1 433 0
	.set ___PA___,1
	lnk	#10
.LCFI2:
	mov	w0,[w14]
	mov	w1,[w14+2]
	mov	w2,[w14+4]
	mov.b	w3,[w14+6]
	mov	w4,[w14+8]
	.loc 1 438 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L9
	.loc 1 444 0
	mov	[w14+8],w1
	mov	[w14+8],w0
	mov	w1,[w0]
	bra	.L10
.L9:
	.loc 1 449 0
	mov	[w14+4],w1
	mov	[w14+8],w0
	mov	w1,[w0]
.L10:
	.loc 1 454 0
	mov	[w14+8],w0
	mov	[w14],w1
	mov	w1,[w0+30]
	.loc 1 455 0
	mov	[w14+8],w0
	mov	[w14+2],w1
	mov	w1,[w0+32]
	.loc 1 456 0
	mov	#1,w1
	mov	[w14+8],w0
	rcall	_xQueueGenericReset
	.loc 1 460 0
	mov	[w14+8],w0
	mov.b	[w14+6],w1
	mov.b	w1,[w0+38]
	.loc 1 471 0
	ulnk	
	return	
	.set ___PA___,0
.LFE2:
	.size	_prvInitialiseNewQueue, .-_prvInitialiseNewQueue
	.align	2
	.type	_prvInitialiseMutex,@function
_prvInitialiseMutex:
.LFB3:
	.loc 1 477 0
	.set ___PA___,1
	lnk	#2
.LCFI3:
	mov	w0,[w14]
	.loc 1 478 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L11
	.loc 1 484 0
	mov	[w14],w0
	clr	w1
	mov	w1,[w0+2]
	.loc 1 485 0
	mov	[w14],w0
	clr	w1
	mov	w1,[w0]
	.loc 1 488 0
	mov	[w14],w0
	clr	w1
	mov	w1,[w0+6]
	.loc 1 493 0
	clr	w3
	clr	w2
	clr	w1
	mov	[w14],w0
	rcall	_xQueueGenericSend
.L11:
	.loc 1 499 0
	ulnk	
	return	
	.set ___PA___,0
.LFE3:
	.size	_prvInitialiseMutex, .-_prvInitialiseMutex
	.align	2
	.global	_xQueueCreateMutex	; export
	.type	_xQueueCreateMutex,@function
_xQueueCreateMutex:
.LFB4:
	.loc 1 507 0
	.set ___PA___,1
	lnk	#8
.LCFI4:
	mov.b	w0,[w14+6]
	.loc 1 509 0
	mov	#1,w0
	mov	w0,[w14]
	clr	w0
	mov	w0,[w14+2]
	.loc 1 511 0
	mov.b	[w14+6],w2
	mov	[w14+2],w1
	mov	[w14],w0
	rcall	_xQueueGenericCreate
	mov	w0,[w14+4]
	.loc 1 512 0
	mov	[w14+4],w0
	rcall	_prvInitialiseMutex
	.loc 1 514 0
	mov	[w14+4],w0
	.loc 1 515 0
	ulnk	
	return	
	.set ___PA___,0
.LFE4:
	.size	_xQueueCreateMutex, .-_xQueueCreateMutex
	.align	2
	.global	_xQueueCreateCountingSemaphore	; export
	.type	_xQueueCreateCountingSemaphore,@function
_xQueueCreateCountingSemaphore:
.LFB5:
	.loc 1 698 0
	.set ___PA___,1
	lnk	#6
.LCFI5:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	.loc 1 704 0
	mov.b	#2,w2
	clr	w1
	mov	[w14+2],w0
	rcall	_xQueueGenericCreate
	mov	w0,[w14]
	.loc 1 706 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L15
	.loc 1 708 0
	mov	[w14],w0
	mov	[w14+4],w1
	mov	w1,[w0+28]
.L15:
	.loc 1 717 0
	mov	[w14],w0
	.loc 1 718 0
	ulnk	
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
	lnk	#18
.LCFI6:
	mov	w0,[w14+10]
	mov	w1,[w14+12]
	mov	w2,[w14+14]
	mov	w3,[w14+16]
	.loc 1 725 0
	clr	w0
	mov	w0,[w14]
	.loc 1 727 0
	mov	[w14+10],w1
	mov	w1,[w14+2]
	bra	.L29
.L30:
	.loc 1 917 0
	nop	
.L29:
	.loc 1 744 0
	rcall	_vPortEnterCritical
	.loc 1 750 0
	mov	[w14+2],w0
	mov	[w0+28],w1
	mov	[w14+2],w0
	mov	[w0+30],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L17
	mov	[w14+16],w0
	sub	w0,#2,[w15]
	.set ___BP___,0
	bra	nz,.L18
.L17:
	.loc 1 753 0
	mov	[w14+16],w2
	mov	[w14+12],w1
	mov	[w14+2],w0
	rcall	_prvCopyDataToQueue
	mov	w0,[w14+4]
	.loc 1 808 0
	mov	[w14+2],w0
	mov	[w0+18],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L19
	.loc 1 810 0
	mov	[w14+2],w0
	add	w0,#18,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L20
	.loc 1 816 0
; 816 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
	bra	.L20
.L19:
	.loc 1 823 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L20
	.loc 1 829 0
; 829 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
.L20:
	.loc 1 838 0
	rcall	_vPortExitCritical
	.loc 1 839 0
	mov	#1,w0
	bra	.L21
.L18:
	.loc 1 843 0
	mov	[w14+14],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L22
	.loc 1 847 0
	rcall	_vPortExitCritical
	.loc 1 852 0
	clr	w0
	bra	.L21
.L22:
	.loc 1 854 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L23
	.loc 1 858 0
	add	w14,#6,w0
	rcall	_vTaskSetTimeOutState
	.loc 1 859 0
	mov	#1,w0
	mov	w0,[w14]
.L23:
	.loc 1 868 0
	rcall	_vPortExitCritical
	.loc 1 873 0
	rcall	_vTaskSuspendAll
	.loc 1 874 0
	rcall	_vPortEnterCritical
	mov	[w14+2],w0
	mov.b	[w0+34],w0
	add.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L24
	mov	[w14+2],w0
	clr.b	w1
	mov.b	w1,[w0+34]
.L24:
	mov	[w14+2],w0
	mov.b	[w0+35],w0
	add.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L25
	mov	[w14+2],w0
	clr.b	w1
	mov.b	w1,[w0+35]
.L25:
	rcall	_vPortExitCritical
	.loc 1 877 0
	add	w14,#14,w1
	add	w14,#6,w0
	rcall	_xTaskCheckForTimeOut
	cp0	w0
	.set ___BP___,0
	bra	nz,.L26
	.loc 1 879 0
	mov	[w14+2],w0
	rcall	_prvIsQueueFull
	cp0	w0
	.set ___BP___,0
	bra	z,.L27
	.loc 1 882 0
	mov	[w14+14],w1
	mov	[w14+2],w0
	add	w0,#8,w0
	rcall	_vTaskPlaceOnEventList
	.loc 1 889 0
	mov	[w14+2],w0
	rcall	_prvUnlockQueue
	.loc 1 896 0
	rcall	_xTaskResumeAll
	cp0	w0
	.set ___BP___,0
	bra	nz,.L30
	.loc 1 898 0
; 898 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
	.loc 1 917 0
	bra	.L29
.L27:
	.loc 1 904 0
	mov	[w14+2],w0
	rcall	_prvUnlockQueue
	.loc 1 905 0
	rcall	_xTaskResumeAll
	.loc 1 917 0
	bra	.L29
.L26:
	.loc 1 911 0
	mov	[w14+2],w0
	rcall	_prvUnlockQueue
	.loc 1 912 0
	rcall	_xTaskResumeAll
	.loc 1 915 0
	clr	w0
.L21:
	.loc 1 918 0
	ulnk	
	return	
	.set ___PA___,0
.LFE6:
	.size	_xQueueGenericSend, .-_xQueueGenericSend
	.align	2
	.global	_xQueueGenericSendFromISR	; export
	.type	_xQueueGenericSendFromISR,@function
_xQueueGenericSendFromISR:
.LFB7:
	.loc 1 922 0
	.set ___PA___,1
	lnk	#16
.LCFI7:
	mov	w0,[w14+8]
	mov	w1,[w14+10]
	mov	w2,[w14+12]
	mov	w3,[w14+14]
	.loc 1 925 0
	mov	[w14+8],w1
	mov	w1,[w14+2]
	.loc 1 952 0
	clr	w0
	mov	w0,[w14+4]
	.loc 1 954 0
	mov	[w14+2],w0
	mov	[w0+28],w1
	mov	[w14+2],w0
	mov	[w0+30],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L32
	mov	[w14+14],w0
	sub	w0,#2,[w15]
	.set ___BP___,0
	bra	nz,.L33
.L32:
.LBB2:
	.loc 1 956 0
	mov	[w14+2],w0
	mov.b	[w0+35],w1
	mov.b	w1,[w14+6]
	.loc 1 965 0
	mov	[w14+14],w2
	mov	[w14+10],w1
	mov	[w14+2],w0
	rcall	_prvCopyDataToQueue
	.loc 1 969 0
	mov.b	[w14+6],w0
	add.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L34
	.loc 1 1024 0
	mov	[w14+2],w0
	mov	[w0+18],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L35
	.loc 1 1026 0
	mov	[w14+2],w0
	add	w0,#18,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L35
	.loc 1 1030 0
	mov	[w14+12],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L35
	.loc 1 1032 0
	mov	[w14+12],w0
	mov	#1,w1
	mov	w1,[w0]
	bra	.L35
.L34:
	.loc 1 1055 0
	mov.b	[w14+6],w0
	inc.b	w0,w0
	mov.b	w0,w1
	mov	[w14+2],w0
	mov.b	w1,[w0+35]
.L35:
	.loc 1 1058 0
	mov	#1,w0
	mov	w0,[w14]
.LBE2:
	.loc 1 955 0
	bra	.L36
.L33:
	.loc 1 1063 0
	clr	w0
	mov	w0,[w14]
.L36:
	.loc 1 1068 0
	mov	[w14],w0
	.loc 1 1069 0
	ulnk	
	return	
	.set ___PA___,0
.LFE7:
	.size	_xQueueGenericSendFromISR, .-_xQueueGenericSendFromISR
	.align	2
	.global	_xQueueGiveFromISR	; export
	.type	_xQueueGiveFromISR,@function
_xQueueGiveFromISR:
.LFB8:
	.loc 1 1073 0
	.set ___PA___,1
	lnk	#14
.LCFI8:
	mov	w0,[w14+10]
	mov	w1,[w14+12]
	.loc 1 1076 0
	mov	[w14+10],w1
	mov	w1,[w14+2]
	.loc 1 1111 0
	clr	w0
	mov	w0,[w14+4]
.LBB3:
	.loc 1 1113 0
	mov	[w14+2],w0
	mov	[w0+28],w1
	mov	w1,[w14+6]
	.loc 1 1118 0
	mov	[w14+2],w0
	mov	[w0+30],w1
	mov	[w14+6],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L38
.LBB4:
	.loc 1 1120 0
	mov	[w14+2],w0
	mov.b	[w0+35],w1
	mov.b	w1,[w14+8]
	.loc 1 1130 0
	mov	[w14+6],w0
	inc	w0,w1
	mov	[w14+2],w0
	mov	w1,[w0+28]
	.loc 1 1134 0
	mov.b	[w14+8],w0
	add.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L39
	.loc 1 1189 0
	mov	[w14+2],w0
	mov	[w0+18],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L40
	.loc 1 1191 0
	mov	[w14+2],w0
	add	w0,#18,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L40
	.loc 1 1195 0
	mov	[w14+12],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L40
	.loc 1 1197 0
	mov	[w14+12],w0
	mov	#1,w1
	mov	w1,[w0]
	bra	.L40
.L39:
	.loc 1 1220 0
	mov.b	[w14+8],w0
	inc.b	w0,w0
	mov.b	w0,w1
	mov	[w14+2],w0
	mov.b	w1,[w0+35]
.L40:
	.loc 1 1223 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L41
.L38:
.LBE4:
	.loc 1 1228 0
	clr	w0
	mov	w0,[w14]
.L41:
.LBE3:
	.loc 1 1233 0
	mov	[w14],w0
	.loc 1 1234 0
	ulnk	
	return	
	.set ___PA___,0
.LFE8:
	.size	_xQueueGiveFromISR, .-_xQueueGiveFromISR
	.align	2
	.global	_xQueueGenericReceive	; export
	.type	_xQueueGenericReceive,@function
_xQueueGenericReceive:
.LFB9:
	.loc 1 1238 0
	.set ___PA___,0
	lnk	#20
.LCFI9:
	mov	w0,[w14+12]
	mov	w1,[w14+14]
	mov	w2,[w14+16]
	mov	w3,[w14+18]
	.loc 1 1239 0
	clr	w0
	mov	w0,[w14]
	.loc 1 1242 0
	mov	[w14+12],w1
	mov	w1,[w14+2]
	bra	.L56
.L57:
	.loc 1 1430 0
	nop	
	bra	.L56
.L58:
	nop	
.L56:
	.loc 1 1258 0
	rcall	_vPortEnterCritical
.LBB5:
	.loc 1 1260 0
	mov	[w14+2],w0
	mov	[w0+28],w1
	mov	w1,[w14+4]
	.loc 1 1264 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L43
	.loc 1 1268 0
	mov	[w14+2],w0
	mov	[w0+6],w1
	mov	w1,[w14+6]
	.loc 1 1270 0
	mov	[w14+14],w1
	mov	[w14+2],w0
	rcall	_prvCopyDataFromQueue
	.loc 1 1272 0
	mov	[w14+18],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L44
	.loc 1 1277 0
	mov	[w14+4],w0
	dec	w0,w1
	mov	[w14+2],w0
	mov	w1,[w0+28]
	.loc 1 1281 0
	mov	[w14+2],w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L45
	.loc 1 1285 0
	rcall	_pvTaskIncrementMutexHeldCount
	mov	w0,w1
	mov	[w14+2],w0
	mov	w1,[w0+2]
.L45:
	.loc 1 1294 0
	mov	[w14+2],w0
	mov	[w0+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L46
	.loc 1 1296 0
	mov	[w14+2],w0
	add	w0,#8,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L46
	.loc 1 1298 0
; 1298 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
	bra	.L46
.L44:
	.loc 1 1316 0
	mov	[w14+2],w0
	mov	[w14+6],w1
	mov	w1,[w0+6]
	.loc 1 1320 0
	mov	[w14+2],w0
	mov	[w0+18],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L46
	.loc 1 1322 0
	mov	[w14+2],w0
	add	w0,#18,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L46
	.loc 1 1325 0
; 1325 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
.L46:
	.loc 1 1338 0
	rcall	_vPortExitCritical
	.loc 1 1339 0
	mov	#1,w0
	bra	.L47
.L43:
	.loc 1 1343 0
	mov	[w14+16],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L48
	.loc 1 1347 0
	rcall	_vPortExitCritical
	.loc 1 1349 0
	clr	w0
	bra	.L47
.L48:
	.loc 1 1351 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L49
	.loc 1 1355 0
	add	w14,#8,w0
	rcall	_vTaskSetTimeOutState
	.loc 1 1356 0
	mov	#1,w0
	mov	w0,[w14]
.L49:
.LBE5:
	.loc 1 1365 0
	rcall	_vPortExitCritical
	.loc 1 1370 0
	rcall	_vTaskSuspendAll
	.loc 1 1371 0
	rcall	_vPortEnterCritical
	mov	[w14+2],w0
	mov.b	[w0+34],w0
	add.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L50
	mov	[w14+2],w0
	clr.b	w1
	mov.b	w1,[w0+34]
.L50:
	mov	[w14+2],w0
	mov.b	[w0+35],w0
	add.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L51
	mov	[w14+2],w0
	clr.b	w1
	mov.b	w1,[w0+35]
.L51:
	rcall	_vPortExitCritical
	.loc 1 1374 0
	add	w14,#16,w1
	add	w14,#8,w0
	rcall	_xTaskCheckForTimeOut
	cp0	w0
	.set ___BP___,0
	bra	nz,.L52
	.loc 1 1376 0
	mov	[w14+2],w0
	rcall	_prvIsQueueEmpty
	cp0	w0
	.set ___BP___,0
	bra	z,.L53
	.loc 1 1382 0
	mov	[w14+2],w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L54
	.loc 1 1384 0
	rcall	_vPortEnterCritical
	.loc 1 1386 0
	mov	[w14+2],w0
	mov	[w0+2],w0
	rcall	_vTaskPriorityInherit
	.loc 1 1388 0
	rcall	_vPortExitCritical
.L54:
	.loc 1 1397 0
	mov	[w14+16],w1
	mov	[w14+2],w0
	add	w0,#18,w0
	rcall	_vTaskPlaceOnEventList
	.loc 1 1398 0
	mov	[w14+2],w0
	rcall	_prvUnlockQueue
	.loc 1 1399 0
	rcall	_xTaskResumeAll
	cp0	w0
	.set ___BP___,0
	bra	nz,.L57
	.loc 1 1401 0
; 1401 "../../source/queue.c" 1
	CALL _vPortYield			
NOP					  
	.loc 1 1430 0
	bra	.L56
.L53:
	.loc 1 1411 0
	mov	[w14+2],w0
	rcall	_prvUnlockQueue
	.loc 1 1412 0
	rcall	_xTaskResumeAll
	.loc 1 1430 0
	bra	.L56
.L52:
	.loc 1 1417 0
	mov	[w14+2],w0
	rcall	_prvUnlockQueue
	.loc 1 1418 0
	rcall	_xTaskResumeAll
	.loc 1 1420 0
	mov	[w14+2],w0
	rcall	_prvIsQueueEmpty
	cp0	w0
	.set ___BP___,0
	bra	z,.L58
	.loc 1 1423 0
	clr	w0
.L47:
	.loc 1 1431 0
	ulnk	
	return	
	.set ___PA___,0
.LFE9:
	.size	_xQueueGenericReceive, .-_xQueueGenericReceive
	.align	2
	.global	_xQueueReceiveFromISR	; export
	.type	_xQueueReceiveFromISR,@function
_xQueueReceiveFromISR:
.LFB10:
	.loc 1 1435 0
	.set ___PA___,1
	lnk	#16
.LCFI10:
	mov	w0,[w14+10]
	mov	w1,[w14+12]
	mov	w2,[w14+14]
	.loc 1 1438 0
	mov	[w14+10],w1
	mov	w1,[w14+2]
	.loc 1 1459 0
	clr	w0
	mov	w0,[w14+4]
.LBB6:
	.loc 1 1461 0
	mov	[w14+2],w0
	mov	[w0+28],w1
	mov	w1,[w14+6]
	.loc 1 1464 0
	mov	[w14+6],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L60
.LBB7:
	.loc 1 1466 0
	mov	[w14+2],w0
	mov.b	[w0+34],w1
	mov.b	w1,[w14+8]
	.loc 1 1470 0
	mov	[w14+12],w1
	mov	[w14+2],w0
	rcall	_prvCopyDataFromQueue
	.loc 1 1471 0
	mov	[w14+6],w0
	dec	w0,w1
	mov	[w14+2],w0
	mov	w1,[w0+28]
	.loc 1 1477 0
	mov.b	[w14+8],w0
	add.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L61
	.loc 1 1479 0
	mov	[w14+2],w0
	mov	[w0+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L62
	.loc 1 1481 0
	mov	[w14+2],w0
	add	w0,#8,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L62
	.loc 1 1485 0
	mov	[w14+14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L62
	.loc 1 1487 0
	mov	[w14+14],w0
	mov	#1,w1
	mov	w1,[w0]
	bra	.L62
.L61:
	.loc 1 1508 0
	mov.b	[w14+8],w0
	inc.b	w0,w0
	mov.b	w0,w1
	mov	[w14+2],w0
	mov.b	w1,[w0+34]
.L62:
	.loc 1 1511 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L63
.L60:
.LBE7:
	.loc 1 1515 0
	clr	w0
	mov	w0,[w14]
.L63:
.LBE6:
	.loc 1 1521 0
	mov	[w14],w0
	.loc 1 1522 0
	ulnk	
	return	
	.set ___PA___,0
.LFE10:
	.size	_xQueueReceiveFromISR, .-_xQueueReceiveFromISR
	.align	2
	.global	_xQueuePeekFromISR	; export
	.type	_xQueuePeekFromISR,@function
_xQueuePeekFromISR:
.LFB11:
	.loc 1 1526 0
	.set ___PA___,1
	lnk	#12
.LCFI11:
	mov	w0,[w14+8]
	mov	w1,[w14+10]
	.loc 1 1530 0
	mov	[w14+8],w1
	mov	w1,[w14+2]
	.loc 1 1552 0
	clr	w0
	mov	w0,[w14+4]
	.loc 1 1555 0
	mov	[w14+2],w0
	mov	[w0+28],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L65
	.loc 1 1561 0
	mov	[w14+2],w0
	mov	[w0+6],w1
	mov	w1,[w14+6]
	.loc 1 1562 0
	mov	[w14+10],w1
	mov	[w14+2],w0
	rcall	_prvCopyDataFromQueue
	.loc 1 1563 0
	mov	[w14+2],w0
	mov	[w14+6],w1
	mov	w1,[w0+6]
	.loc 1 1565 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L66
.L65:
	.loc 1 1569 0
	clr	w0
	mov	w0,[w14]
.L66:
	.loc 1 1575 0
	mov	[w14],w0
	.loc 1 1576 0
	ulnk	
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
	lnk	#4
.LCFI12:
	mov	w0,[w14+2]
	.loc 1 1585 0
	rcall	_vPortEnterCritical
	.loc 1 1587 0
	mov	[w14+2],w0
	mov	[w0+28],w1
	mov	w1,[w14]
	.loc 1 1589 0
	rcall	_vPortExitCritical
	.loc 1 1591 0
	mov	[w14],w0
	.loc 1 1592 0
	ulnk	
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
	lnk	#6
.LCFI13:
	mov	w0,[w14+4]
	.loc 1 1600 0
	mov	[w14+4],w1
	mov	w1,[w14]
	.loc 1 1603 0
	rcall	_vPortEnterCritical
	.loc 1 1605 0
	mov	[w14],w0
	mov	[w0+30],w1
	mov	[w14],w0
	mov	[w0+28],w0
	sub	w1,w0,w0
	mov	w0,[w14+2]
	.loc 1 1607 0
	rcall	_vPortExitCritical
	.loc 1 1609 0
	mov	[w14+2],w0
	.loc 1 1610 0
	ulnk	
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
	lnk	#4
.LCFI14:
	mov	w0,[w14+2]
	.loc 1 1619 0
	mov	[w14+2],w0
	mov	[w0+28],w1
	mov	w1,[w14]
	.loc 1 1621 0
	mov	[w14],w0
	.loc 1 1622 0
	ulnk	
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
	lnk	#4
.LCFI15:
	mov	w0,[w14+2]
	.loc 1 1627 0
	mov	[w14+2],w1
	mov	w1,[w14]
	.loc 1 1642 0
	mov	[w14],w0
	rcall	_vPortFree
	.loc 1 1664 0
	ulnk	
	return	
	.set ___PA___,0
.LFE15:
	.size	_vQueueDelete, .-_vQueueDelete
	.align	2
	.global	_uxQueueGetQueueNumber	; export
	.type	_uxQueueGetQueueNumber,@function
_uxQueueGetQueueNumber:
.LFB16:
	.loc 1 1670 0
	.set ___PA___,1
	lnk	#2
.LCFI16:
	mov	w0,[w14]
	.loc 1 1671 0
	mov	[w14],w0
	mov	[w0+36],w0
	.loc 1 1672 0
	ulnk	
	return	
	.set ___PA___,0
.LFE16:
	.size	_uxQueueGetQueueNumber, .-_uxQueueGetQueueNumber
	.align	2
	.global	_vQueueSetQueueNumber	; export
	.type	_vQueueSetQueueNumber,@function
_vQueueSetQueueNumber:
.LFB17:
	.loc 1 1680 0
	.set ___PA___,1
	lnk	#4
.LCFI17:
	mov	w0,[w14]
	mov	w1,[w14+2]
	.loc 1 1681 0
	mov	[w14],w0
	mov	[w14+2],w1
	mov	w1,[w0+36]
	.loc 1 1682 0
	ulnk	
	return	
	.set ___PA___,0
.LFE17:
	.size	_vQueueSetQueueNumber, .-_vQueueSetQueueNumber
	.align	2
	.global	_ucQueueGetQueueType	; export
	.type	_ucQueueGetQueueType,@function
_ucQueueGetQueueType:
.LFB18:
	.loc 1 1690 0
	.set ___PA___,1
	lnk	#2
.LCFI18:
	mov	w0,[w14]
	.loc 1 1691 0
	mov	[w14],w0
	mov.b	[w0+38],w0
	.loc 1 1692 0
	ulnk	
	return	
	.set ___PA___,0
.LFE18:
	.size	_ucQueueGetQueueType, .-_ucQueueGetQueueType
	.align	2
	.type	_prvCopyDataToQueue,@function
_prvCopyDataToQueue:
.LFB19:
	.loc 1 1698 0
	.set ___PA___,1
	lnk	#10
.LCFI19:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	mov	w2,[w14+8]
	.loc 1 1699 0
	clr	w0
	mov	w0,[w14]
	.loc 1 1704 0
	mov	[w14+4],w0
	mov	[w0+28],w1
	mov	w1,[w14+2]
	.loc 1 1706 0
	mov	[w14+4],w0
	mov	[w0+32],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L75
	.loc 1 1710 0
	mov	[w14+4],w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L76
	.loc 1 1713 0
	mov	[w14+4],w0
	mov	[w0+2],w0
	rcall	_xTaskPriorityDisinherit
	mov	w0,[w14]
	.loc 1 1714 0
	mov	[w14+4],w0
	clr	w1
	mov	w1,[w0+2]
	bra	.L76
.L75:
	.loc 1 1723 0
	mov	[w14+8],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L77
	.loc 1 1725 0
	mov	[w14+4],w0
	mov	[w0+32],w1
	mov	[w14+4],w0
	mov	[w0+4],w0
	mov	w1,w2
	mov	[w14+6],w1
	rcall	_memcpy
	.loc 1 1726 0
	mov	[w14+4],w0
	mov	[w0+4],w1
	mov	[w14+4],w0
	mov	[w0+32],w0
	add	w1,w0,w1
	mov	[w14+4],w0
	mov	w1,[w0+4]
	.loc 1 1727 0
	mov	[w14+4],w0
	mov	[w0+4],w1
	mov	[w14+4],w0
	mov	[w0+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L76
	.loc 1 1729 0
	mov	[w14+4],w0
	mov	[w0],w1
	mov	[w14+4],w0
	mov	w1,[w0+4]
	bra	.L76
.L77:
	.loc 1 1738 0
	mov	[w14+4],w0
	mov	[w0+32],w1
	mov	[w14+4],w0
	mov	[w0+6],w0
	mov	w1,w2
	mov	[w14+6],w1
	rcall	_memcpy
	.loc 1 1739 0
	mov	[w14+4],w0
	mov	[w0+6],w1
	mov	[w14+4],w0
	mov	[w0+32],w0
	neg	w0,w0
	add	w1,w0,w1
	mov	[w14+4],w0
	mov	w1,[w0+6]
	.loc 1 1740 0
	mov	[w14+4],w0
	mov	[w0+6],w1
	mov	[w14+4],w0
	mov	[w0],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L78
	.loc 1 1742 0
	mov	[w14+4],w0
	mov	[w0+2],w1
	mov	[w14+4],w0
	mov	[w0+32],w0
	neg	w0,w0
	add	w1,w0,w1
	mov	[w14+4],w0
	mov	w1,[w0+6]
.L78:
	.loc 1 1749 0
	mov	[w14+8],w0
	sub	w0,#2,[w15]
	.set ___BP___,0
	bra	nz,.L76
	.loc 1 1751 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L76
	.loc 1 1757 0
	mov	[w14+2],w0
	dec	w0,w0
	mov	w0,[w14+2]
.L76:
	.loc 1 1770 0
	mov	[w14+2],w0
	inc	w0,w1
	mov	[w14+4],w0
	mov	w1,[w0+28]
	.loc 1 1772 0
	mov	[w14],w0
	.loc 1 1773 0
	ulnk	
	return	
	.set ___PA___,0
.LFE19:
	.size	_prvCopyDataToQueue, .-_prvCopyDataToQueue
	.align	2
	.type	_prvCopyDataFromQueue,@function
_prvCopyDataFromQueue:
.LFB20:
	.loc 1 1777 0
	.set ___PA___,1
	lnk	#4
.LCFI20:
	mov	w0,[w14]
	mov	w1,[w14+2]
	.loc 1 1778 0
	mov	[w14],w0
	mov	[w0+32],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L79
	.loc 1 1780 0
	mov	[w14],w0
	mov	[w0+6],w1
	mov	[w14],w0
	mov	[w0+32],w0
	add	w1,w0,w1
	mov	[w14],w0
	mov	w1,[w0+6]
	.loc 1 1781 0
	mov	[w14],w0
	mov	[w0+6],w1
	mov	[w14],w0
	mov	[w0+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L81
	.loc 1 1783 0
	mov	[w14],w0
	mov	[w0],w1
	mov	[w14],w0
	mov	w1,[w0+6]
.L81:
	.loc 1 1789 0
	mov	[w14],w0
	mov	[w0+32],w1
	mov	[w14],w0
	mov	[w0+6],w0
	mov	w1,w2
	mov	w0,w1
	mov	[w14+2],w0
	rcall	_memcpy
.L79:
	.loc 1 1791 0
	ulnk	
	return	
	.set ___PA___,0
.LFE20:
	.size	_prvCopyDataFromQueue, .-_prvCopyDataFromQueue
	.align	2
	.type	_prvUnlockQueue,@function
_prvUnlockQueue:
.LFB21:
	.loc 1 1795 0
	.set ___PA___,1
	lnk	#4
.LCFI21:
	mov	w0,[w14+2]
	.loc 1 1802 0
	rcall	_vPortEnterCritical
.LBB8:
	.loc 1 1804 0
	mov	[w14+2],w0
	mov.b	[w0+35],w1
	mov.b	w1,[w14]
	.loc 1 1807 0
	bra	.L83
.L87:
	.loc 1 1855 0
	mov	[w14+2],w0
	mov	[w0+18],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L93
	.loc 1 1857 0
	mov	[w14+2],w0
	add	w0,#18,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L85
	.loc 1 1861 0
	rcall	_vTaskMissedYield
.L85:
	.loc 1 1875 0
	dec.b	[w14],[w14]
.L83:
	.loc 1 1807 0
	mov.b	[w14],w0
	cp0.b	w0
	.set ___BP___,0
	bra	gt,.L87
	bra	.L86
.L93:
	.loc 1 1870 0
	nop	
.L86:
	.loc 1 1878 0
	mov	[w14+2],w0
	setm.b	w1
	mov.b	w1,[w0+35]
.LBE8:
	.loc 1 1880 0
	rcall	_vPortExitCritical
	.loc 1 1883 0
	rcall	_vPortEnterCritical
.LBB9:
	.loc 1 1885 0
	mov	[w14+2],w0
	mov.b	[w0+34],w1
	mov.b	w1,[w14+1]
	.loc 1 1887 0
	bra	.L88
.L92:
	.loc 1 1889 0
	mov	[w14+2],w0
	mov	[w0+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L94
	.loc 1 1891 0
	mov	[w14+2],w0
	add	w0,#8,w0
	rcall	_xTaskRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L90
	.loc 1 1893 0
	rcall	_vTaskMissedYield
.L90:
	.loc 1 1900 0
	mov.b	[w14+1],w0
	dec.b	w0,w0
	mov.b	w0,[w14+1]
.L88:
	.loc 1 1887 0
	mov.b	[w14+1],w0
	cp0.b	w0
	.set ___BP___,0
	bra	gt,.L92
	bra	.L91
.L94:
	.loc 1 1904 0
	nop	
.L91:
	.loc 1 1908 0
	mov	[w14+2],w0
	setm.b	w1
	mov.b	w1,[w0+34]
.LBE9:
	.loc 1 1910 0
	rcall	_vPortExitCritical
	.loc 1 1911 0
	ulnk	
	return	
	.set ___PA___,0
.LFE21:
	.size	_prvUnlockQueue, .-_prvUnlockQueue
	.align	2
	.type	_prvIsQueueEmpty,@function
_prvIsQueueEmpty:
.LFB22:
	.loc 1 1915 0
	.set ___PA___,1
	lnk	#4
.LCFI22:
	mov	w0,[w14+2]
	.loc 1 1918 0
	rcall	_vPortEnterCritical
	.loc 1 1920 0
	mov	[w14+2],w0
	mov	[w0+28],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L96
	.loc 1 1922 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L97
.L96:
	.loc 1 1926 0
	clr	w0
	mov	w0,[w14]
.L97:
	.loc 1 1929 0
	rcall	_vPortExitCritical
	.loc 1 1931 0
	mov	[w14],w0
	.loc 1 1932 0
	ulnk	
	return	
	.set ___PA___,0
.LFE22:
	.size	_prvIsQueueEmpty, .-_prvIsQueueEmpty
	.align	2
	.global	_xQueueIsQueueEmptyFromISR	; export
	.type	_xQueueIsQueueEmptyFromISR,@function
_xQueueIsQueueEmptyFromISR:
.LFB23:
	.loc 1 1936 0
	.set ___PA___,1
	lnk	#4
.LCFI23:
	mov	w0,[w14+2]
	.loc 1 1940 0
	mov	[w14+2],w0
	mov	[w0+28],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L99
	.loc 1 1942 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L100
.L99:
	.loc 1 1946 0
	clr	w0
	mov	w0,[w14]
.L100:
	.loc 1 1949 0
	mov	[w14],w0
	.loc 1 1950 0
	ulnk	
	return	
	.set ___PA___,0
.LFE23:
	.size	_xQueueIsQueueEmptyFromISR, .-_xQueueIsQueueEmptyFromISR
	.align	2
	.type	_prvIsQueueFull,@function
_prvIsQueueFull:
.LFB24:
	.loc 1 1954 0
	.set ___PA___,1
	lnk	#4
.LCFI24:
	mov	w0,[w14+2]
	.loc 1 1957 0
	rcall	_vPortEnterCritical
	.loc 1 1959 0
	mov	[w14+2],w0
	mov	[w0+28],w1
	mov	[w14+2],w0
	mov	[w0+30],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L102
	.loc 1 1961 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L103
.L102:
	.loc 1 1965 0
	clr	w0
	mov	w0,[w14]
.L103:
	.loc 1 1968 0
	rcall	_vPortExitCritical
	.loc 1 1970 0
	mov	[w14],w0
	.loc 1 1971 0
	ulnk	
	return	
	.set ___PA___,0
.LFE24:
	.size	_prvIsQueueFull, .-_prvIsQueueFull
	.align	2
	.global	_xQueueIsQueueFullFromISR	; export
	.type	_xQueueIsQueueFullFromISR,@function
_xQueueIsQueueFullFromISR:
.LFB25:
	.loc 1 1975 0
	.set ___PA___,1
	lnk	#4
.LCFI25:
	mov	w0,[w14+2]
	.loc 1 1979 0
	mov	[w14+2],w0
	mov	[w0+28],w1
	mov	[w14+2],w0
	mov	[w0+30],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L105
	.loc 1 1981 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L106
.L105:
	.loc 1 1985 0
	clr	w0
	mov	w0,[w14]
.L106:
	.loc 1 1988 0
	mov	[w14],w0
	.loc 1 1989 0
	ulnk	
	return	
	.set ___PA___,0
.LFE25:
	.size	_xQueueIsQueueFullFromISR, .-_xQueueIsQueueFullFromISR
	.align	2
	.global	_xQueueCRSend	; export
	.type	_xQueueCRSend,@function
_xQueueCRSend:
.LFB26:
	.loc 1 1995 0
	.set ___PA___,0
	lnk	#10
.LCFI26:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	mov	w2,[w14+8]
	.loc 1 1997 0
	mov	[w14+4],w1
	mov	w1,[w14+2]
	.loc 1 2002 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	bset	w0,#5
	mov	w0,_SRbits
	nop	
; 2002 "../../source/queue.c" 1
	NOP
	.loc 1 2004 0
	mov	[w14+2],w0
	rcall	_prvIsQueueFull
	cp0	w0
	.set ___BP___,0
	bra	z,.L108
	.loc 1 2008 0
	mov	[w14+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L109
	.loc 1 2012 0
	mov	[w14+2],w0
	add	w0,#8,w0
	mov	w0,w1
	mov	[w14+8],w0
	rcall	_vCoRoutineAddToDelayedList
	.loc 1 2013 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	mov	w0,_SRbits
	nop	
	.loc 1 2014 0
	mov	#-4,w0
	bra	.L110
.L109:
	.loc 1 2018 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	mov	w0,_SRbits
	nop	
	.loc 1 2019 0
	clr	w0
	bra	.L110
.L108:
	.loc 1 2023 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	mov	w0,_SRbits
	nop	
	.loc 1 2025 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	bset	w0,#5
	mov	w0,_SRbits
	nop	
; 2025 "../../source/queue.c" 1
	NOP
	.loc 1 2027 0
	mov	[w14+2],w0
	mov	[w0+28],w1
	mov	[w14+2],w0
	mov	[w0+30],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L111
	.loc 1 2030 0
	clr	w2
	mov	[w14+6],w1
	mov	[w14+2],w0
	rcall	_prvCopyDataToQueue
	.loc 1 2031 0
	mov	#1,w0
	mov	w0,[w14]
	.loc 1 2034 0
	mov	[w14+2],w0
	mov	[w0+18],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L112
	.loc 1 2040 0
	mov	[w14+2],w0
	add	w0,#18,w0
	rcall	_xCoRoutineRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L112
	.loc 1 2044 0
	mov	#-5,w0
	mov	w0,[w14]
	bra	.L112
.L111:
	.loc 1 2058 0
	clr	w0
	mov	w0,[w14]
.L112:
	.loc 1 2061 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	mov	w0,_SRbits
	nop	
	.loc 1 2063 0
	mov	[w14],w0
.L110:
	.loc 1 2064 0
	ulnk	
	return	
	.set ___PA___,0
.LFE26:
	.size	_xQueueCRSend, .-_xQueueCRSend
	.align	2
	.global	_xQueueCRReceive	; export
	.type	_xQueueCRReceive,@function
_xQueueCRReceive:
.LFB27:
	.loc 1 2072 0
	.set ___PA___,0
	lnk	#10
.LCFI27:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	mov	w2,[w14+8]
	.loc 1 2074 0
	mov	[w14+4],w1
	mov	w1,[w14+2]
	.loc 1 2079 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	bset	w0,#5
	mov	w0,_SRbits
	nop	
; 2079 "../../source/queue.c" 1
	NOP
	.loc 1 2081 0
	mov	[w14+2],w0
	mov	[w0+28],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L114
	.loc 1 2085 0
	mov	[w14+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L115
	.loc 1 2089 0
	mov	[w14+2],w0
	add	w0,#18,w0
	mov	w0,w1
	mov	[w14+8],w0
	rcall	_vCoRoutineAddToDelayedList
	.loc 1 2090 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	mov	w0,_SRbits
	nop	
	.loc 1 2091 0
	mov	#-4,w0
	bra	.L116
.L115:
	.loc 1 2095 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	mov	w0,_SRbits
	nop	
	.loc 1 2096 0
	clr	w0
	bra	.L116
.L114:
	.loc 1 2104 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	mov	w0,_SRbits
	nop	
	.loc 1 2106 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	bset	w0,#5
	mov	w0,_SRbits
	nop	
; 2106 "../../source/queue.c" 1
	NOP
	.loc 1 2108 0
	mov	[w14+2],w0
	mov	[w0+28],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L117
	.loc 1 2111 0
	mov	[w14+2],w0
	mov	[w0+6],w1
	mov	[w14+2],w0
	mov	[w0+32],w0
	add	w1,w0,w1
	mov	[w14+2],w0
	mov	w1,[w0+6]
	.loc 1 2112 0
	mov	[w14+2],w0
	mov	[w0+6],w1
	mov	[w14+2],w0
	mov	[w0+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L118
	.loc 1 2114 0
	mov	[w14+2],w0
	mov	[w0],w1
	mov	[w14+2],w0
	mov	w1,[w0+6]
.L118:
	.loc 1 2120 0
	mov	[w14+2],w0
	mov	[w0+28],w0
	dec	w0,w1
	mov	[w14+2],w0
	mov	w1,[w0+28]
	.loc 1 2121 0
	mov	[w14+2],w0
	mov	[w0+32],w1
	mov	[w14+2],w0
	mov	[w0+6],w0
	mov	w1,w2
	mov	w0,w1
	mov	[w14+6],w0
	rcall	_memcpy
	.loc 1 2123 0
	mov	#1,w0
	mov	w0,[w14]
	.loc 1 2126 0
	mov	[w14+2],w0
	mov	[w0+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L119
	.loc 1 2132 0
	mov	[w14+2],w0
	add	w0,#8,w0
	rcall	_xCoRoutineRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L119
	.loc 1 2134 0
	mov	#-5,w0
	mov	w0,[w14]
	bra	.L119
.L117:
	.loc 1 2148 0
	clr	w0
	mov	w0,[w14]
.L119:
	.loc 1 2151 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	mov	w0,_SRbits
	nop	
	.loc 1 2153 0
	mov	[w14],w0
.L116:
	.loc 1 2154 0
	ulnk	
	return	
	.set ___PA___,0
.LFE27:
	.size	_xQueueCRReceive, .-_xQueueCRReceive
	.align	2
	.global	_xQueueCRSendFromISR	; export
	.type	_xQueueCRSendFromISR,@function
_xQueueCRSendFromISR:
.LFB28:
	.loc 1 2162 0
	.set ___PA___,1
	lnk	#8
.LCFI28:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	mov	w2,[w14+6]
	.loc 1 2163 0
	mov	[w14+2],w1
	mov	w1,[w14]
	.loc 1 2167 0
	mov	[w14],w0
	mov	[w0+28],w1
	mov	[w14],w0
	mov	[w0+30],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L121
	.loc 1 2169 0
	clr	w2
	mov	[w14+4],w1
	mov	[w14],w0
	rcall	_prvCopyDataToQueue
	.loc 1 2173 0
	mov	[w14+6],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L121
	.loc 1 2175 0
	mov	[w14],w0
	mov	[w0+18],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L121
	.loc 1 2177 0
	mov	[w14],w1
	add	w1,#18,w0
	rcall	_xCoRoutineRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L121
	.loc 1 2179 0
	mov	#1,w0
	bra	.L122
.L121:
	.loc 1 2201 0
	mov	[w14+6],w0
.L122:
	.loc 1 2202 0
	ulnk	
	return	
	.set ___PA___,0
.LFE28:
	.size	_xQueueCRSendFromISR, .-_xQueueCRSendFromISR
	.align	2
	.global	_xQueueCRReceiveFromISR	; export
	.type	_xQueueCRReceiveFromISR,@function
_xQueueCRReceiveFromISR:
.LFB29:
	.loc 1 2210 0
	.set ___PA___,1
	lnk	#10
.LCFI29:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	mov	w2,[w14+8]
	.loc 1 2212 0
	mov	[w14+4],w1
	mov	w1,[w14+2]
	.loc 1 2216 0
	mov	[w14+2],w0
	mov	[w0+28],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L124
	.loc 1 2219 0
	mov	[w14+2],w0
	mov	[w0+6],w1
	mov	[w14+2],w0
	mov	[w0+32],w0
	add	w1,w0,w1
	mov	[w14+2],w0
	mov	w1,[w0+6]
	.loc 1 2220 0
	mov	[w14+2],w0
	mov	[w0+6],w1
	mov	[w14+2],w0
	mov	[w0+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L125
	.loc 1 2222 0
	mov	[w14+2],w0
	mov	[w0],w1
	mov	[w14+2],w0
	mov	w1,[w0+6]
.L125:
	.loc 1 2228 0
	mov	[w14+2],w0
	mov	[w0+28],w0
	dec	w0,w1
	mov	[w14+2],w0
	mov	w1,[w0+28]
	.loc 1 2229 0
	mov	[w14+2],w0
	mov	[w0+32],w1
	mov	[w14+2],w0
	mov	[w0+6],w0
	mov	w1,w2
	mov	w0,w1
	mov	[w14+6],w0
	rcall	_memcpy
	.loc 1 2231 0
	mov	[w14+8],w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L126
	.loc 1 2233 0
	mov	[w14+2],w0
	mov	[w0+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L126
	.loc 1 2235 0
	mov	[w14+2],w0
	add	w0,#8,w0
	rcall	_xCoRoutineRemoveFromEventList
	cp0	w0
	.set ___BP___,0
	bra	z,.L126
	.loc 1 2237 0
	mov	[w14+8],w0
	mov	#1,w1
	mov	w1,[w0]
.L126:
	.loc 1 2254 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L127
.L124:
	.loc 1 2258 0
	clr	w0
	mov	w0,[w14]
.L127:
	.loc 1 2261 0
	mov	[w14],w0
	.loc 1 2262 0
	ulnk	
	return	
	.set ___PA___,0
.LFE29:
	.size	_xQueueCRReceiveFromISR, .-_xQueueCRReceiveFromISR
	.align	2
	.global	_vQueueWaitForMessageRestricted	; export
	.type	_vQueueWaitForMessageRestricted,@function
_vQueueWaitForMessageRestricted:
.LFB30:
	.loc 1 2359 0
	.set ___PA___,1
	lnk	#8
.LCFI30:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	mov	w2,[w14+6]
	.loc 1 2360 0
	mov	[w14+2],w1
	mov	w1,[w14]
	.loc 1 2376 0
	rcall	_vPortEnterCritical
	mov	[w14],w0
	mov.b	[w0+34],w0
	add.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L129
	mov	[w14],w0
	clr.b	w1
	mov.b	w1,[w0+34]
.L129:
	mov	[w14],w0
	mov.b	[w0+35],w0
	add.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L130
	mov	[w14],w0
	clr.b	w1
	mov.b	w1,[w0+35]
.L130:
	rcall	_vPortExitCritical
	.loc 1 2377 0
	mov	[w14],w0
	mov	[w0+28],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L131
	.loc 1 2380 0
	mov	[w14],w1
	add	w1,#18,w0
	mov	[w14+6],w2
	mov	[w14+4],w1
	rcall	_vTaskPlaceOnEventListRestricted
.L131:
	.loc 1 2386 0
	mov	[w14],w0
	rcall	_prvUnlockQueue
	.loc 1 2387 0
	ulnk	
	return	
	.set ___PA___,0
.LFE30:
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
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x4
	.4byte	.LCFI21-.LFB21
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
	.4byte	.LCFI22-.LFB22
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
	.4byte	.LCFI23-.LFB23
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
	.4byte	.LCFI24-.LFB24
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
	.4byte	.LCFI25-.LFB25
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
	.4byte	.LCFI26-.LFB26
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
	.4byte	.LCFI27-.LFB27
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
	.4byte	.LCFI28-.LFB28
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
	.4byte	.LCFI29-.LFB29
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
	.4byte	.LCFI30-.LFB30
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE60:
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
	.4byte	0x141c
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../../source/queue.c"
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
	.uleb128 0x5
	.byte	0x2
	.4byte	0x127
	.uleb128 0x6
	.uleb128 0x4
	.asciz	"int8_t"
	.byte	0x4
	.byte	0xd
	.4byte	0x136
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"signed char"
	.uleb128 0x4
	.asciz	"uint8_t"
	.byte	0x4
	.byte	0x2b
	.4byte	0x154
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x4
	.byte	0x31
	.4byte	0xe2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x7
	.byte	0x2
	.byte	0x5
	.byte	0x87
	.4byte	0x273
	.uleb128 0x8
	.asciz	"C"
	.byte	0x5
	.byte	0x88
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x2b2
	.uleb128 0x8
	.asciz	"IPL0"
	.byte	0x5
	.byte	0x99
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x165
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
	.4byte	0x2c5
	.uleb128 0xa
	.4byte	0x18a
	.uleb128 0xa
	.4byte	0x273
	.byte	0x0
	.uleb128 0xb
	.asciz	"tagSRBITS"
	.byte	0x2
	.byte	0x5
	.byte	0x85
	.4byte	0x2e0
	.uleb128 0xc
	.4byte	0x2b2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x4
	.asciz	"SRBITS"
	.byte	0x5
	.byte	0x9e
	.4byte	0x2c5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x4
	.asciz	"BaseType_t"
	.byte	0x6
	.byte	0x61
	.4byte	0x308
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"UBaseType_t"
	.byte	0x6
	.byte	0x62
	.4byte	0xcc
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x6
	.byte	0x65
	.4byte	0x165
	.uleb128 0x5
	.byte	0x2
	.4byte	0x145
	.uleb128 0xb
	.asciz	"xLIST_ITEM"
	.byte	0xa
	.byte	0x7
	.byte	0xb5
	.4byte	0x3a9
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x7
	.byte	0xb8
	.4byte	0x328
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.asciz	"pxNext"
	.byte	0x7
	.byte	0xb9
	.4byte	0x3a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.4byte	.LASF1
	.byte	0x7
	.byte	0xba
	.4byte	0x3a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.asciz	"pvOwner"
	.byte	0x7
	.byte	0xbb
	.4byte	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xe
	.asciz	"pvContainer"
	.byte	0x7
	.byte	0xbc
	.4byte	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	0x340
	.uleb128 0x4
	.asciz	"ListItem_t"
	.byte	0x7
	.byte	0xbf
	.4byte	0x340
	.uleb128 0xb
	.asciz	"xMINI_LIST_ITEM"
	.byte	0x6
	.byte	0x7
	.byte	0xc1
	.4byte	0x407
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x7
	.byte	0xc4
	.4byte	0x328
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.asciz	"pxNext"
	.byte	0x7
	.byte	0xc5
	.4byte	0x3a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.4byte	.LASF1
	.byte	0x7
	.byte	0xc6
	.4byte	0x3a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.asciz	"MiniListItem_t"
	.byte	0x7
	.byte	0xc8
	.4byte	0x3c1
	.uleb128 0xb
	.asciz	"xLIST"
	.byte	0xa
	.byte	0x7
	.byte	0xcd
	.4byte	0x46b
	.uleb128 0xe
	.asciz	"uxNumberOfItems"
	.byte	0x7
	.byte	0xd0
	.4byte	0x315
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.asciz	"pxIndex"
	.byte	0x7
	.byte	0xd1
	.4byte	0x46b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.asciz	"xListEnd"
	.byte	0x7
	.byte	0xd2
	.4byte	0x407
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	0x3af
	.uleb128 0x4
	.asciz	"List_t"
	.byte	0x7
	.byte	0xd4
	.4byte	0x41d
	.uleb128 0xb
	.asciz	"xTIME_OUT"
	.byte	0x4
	.byte	0x8
	.byte	0x87
	.4byte	0x4c5
	.uleb128 0xe
	.asciz	"xOverflowCount"
	.byte	0x8
	.byte	0x89
	.4byte	0x2f6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.asciz	"xTimeOnEntering"
	.byte	0x8
	.byte	0x8a
	.4byte	0x328
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x4
	.asciz	"TimeOut_t"
	.byte	0x8
	.byte	0x8b
	.4byte	0x47f
	.uleb128 0x4
	.asciz	"QueueHandle_t"
	.byte	0x9
	.byte	0x58
	.4byte	0x9f
	.uleb128 0x9
	.byte	0x2
	.byte	0x1
	.byte	0x88
	.4byte	0x522
	.uleb128 0xf
	.asciz	"pcReadFrom"
	.byte	0x1
	.byte	0x8a
	.4byte	0x522
	.uleb128 0xf
	.asciz	"uxRecursiveCallCount"
	.byte	0x1
	.byte	0x8b
	.4byte	0x315
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	0x128
	.uleb128 0xb
	.asciz	"QueueDefinition"
	.byte	0x28
	.byte	0x1
	.byte	0x82
	.4byte	0x629
	.uleb128 0xe
	.asciz	"pcHead"
	.byte	0x1
	.byte	0x84
	.4byte	0x522
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xe
	.asciz	"pcTail"
	.byte	0x1
	.byte	0x85
	.4byte	0x522
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xe
	.asciz	"pcWriteTo"
	.byte	0x1
	.byte	0x86
	.4byte	0x522
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xe
	.asciz	"u"
	.byte	0x1
	.byte	0x8c
	.4byte	0x4eb
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xe
	.asciz	"xTasksWaitingToSend"
	.byte	0x1
	.byte	0x8e
	.4byte	0x471
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xe
	.asciz	"xTasksWaitingToReceive"
	.byte	0x1
	.byte	0x8f
	.4byte	0x471
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xd
	.4byte	.LASF2
	.byte	0x1
	.byte	0x91
	.4byte	0x629
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xe
	.asciz	"uxLength"
	.byte	0x1
	.byte	0x92
	.4byte	0x315
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xd
	.4byte	.LASF3
	.byte	0x1
	.byte	0x93
	.4byte	0x315
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xd
	.4byte	.LASF4
	.byte	0x1
	.byte	0x95
	.4byte	0x62e
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xd
	.4byte	.LASF5
	.byte	0x1
	.byte	0x96
	.4byte	0x62e
	.byte	0x2
	.byte	0x23
	.uleb128 0x23
	.uleb128 0xd
	.4byte	.LASF6
	.byte	0x1
	.byte	0xa1
	.4byte	0x315
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xd
	.4byte	.LASF7
	.byte	0x1
	.byte	0xa2
	.4byte	0x145
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x10
	.4byte	0x315
	.uleb128 0x10
	.4byte	0x128
	.uleb128 0x4
	.asciz	"xQUEUE"
	.byte	0x1
	.byte	0xa5
	.4byte	0x528
	.uleb128 0x4
	.asciz	"Queue_t"
	.byte	0x1
	.byte	0xa9
	.4byte	0x633
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueGenericReset"
	.byte	0x1
	.2byte	0x117
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0x6af
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x117
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x13
	.asciz	"xNewQueue"
	.byte	0x1
	.2byte	0x117
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x119
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x15
	.4byte	0x6b4
	.uleb128 0x5
	.byte	0x2
	.4byte	0x641
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueGenericCreate"
	.byte	0x1
	.2byte	0x182
	.byte	0x1
	.4byte	0x4d6
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.4byte	0x74f
	.uleb128 0x12
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x182
	.4byte	0x74f
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x12
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x182
	.4byte	0x74f
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x12
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x182
	.4byte	0x754
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x14
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x184
	.4byte	0x6b4
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x16
	.asciz	"xQueueSizeInBytes"
	.byte	0x1
	.2byte	0x185
	.4byte	0x113
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x186
	.4byte	0x33a
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.uleb128 0x15
	.4byte	0x315
	.uleb128 0x15
	.4byte	0x145
	.uleb128 0x17
	.asciz	"prvInitialiseNewQueue"
	.byte	0x1
	.2byte	0x1b0
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.4byte	0x7ce
	.uleb128 0x12
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x74f
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x12
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x74f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x12
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x33a
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x12
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x754
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x12
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x6b4
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.byte	0x0
	.uleb128 0x17
	.asciz	"prvInitialiseMutex"
	.byte	0x1
	.2byte	0x1dc
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5e
	.4byte	0x804
	.uleb128 0x12
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x1dc
	.4byte	0x6b4
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueCreateMutex"
	.byte	0x1
	.2byte	0x1fa
	.byte	0x1
	.4byte	0x4d6
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5e
	.4byte	0x87d
	.uleb128 0x12
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x1fa
	.4byte	0x754
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x14
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x1fc
	.4byte	0x6b4
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x16
	.asciz	"uxMutexLength"
	.byte	0x1
	.2byte	0x1fd
	.4byte	0x74f
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x16
	.asciz	"uxMutexSize"
	.byte	0x1
	.2byte	0x1fd
	.4byte	0x74f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueCreateCountingSemaphore"
	.byte	0x1
	.2byte	0x2b9
	.byte	0x1
	.4byte	0x4d6
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5e
	.4byte	0x8f7
	.uleb128 0x13
	.asciz	"uxMaxCount"
	.byte	0x1
	.2byte	0x2b9
	.4byte	0x74f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x13
	.asciz	"uxInitialCount"
	.byte	0x1
	.2byte	0x2b9
	.4byte	0x74f
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x16
	.asciz	"xHandle"
	.byte	0x1
	.2byte	0x2bb
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueGenericSend"
	.byte	0x1
	.2byte	0x2d3
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5e
	.4byte	0x9a5
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x2d3
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x12
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x2d3
	.4byte	0x9a5
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x12
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x2d3
	.4byte	0x328
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x2d3
	.4byte	0x9aa
	.byte	0x2
	.byte	0x7e
	.sleb128 16
	.uleb128 0x14
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x2d5
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x16
	.asciz	"xYieldRequired"
	.byte	0x1
	.2byte	0x2d5
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x14
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x2d6
	.4byte	0x4c5
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x2d7
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x15
	.4byte	0x121
	.uleb128 0x15
	.4byte	0x2f6
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueGenericSendFromISR"
	.byte	0x1
	.2byte	0x399
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x5e
	.4byte	0xa63
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x399
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x12
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x399
	.4byte	0x9a5
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x12
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x399
	.4byte	0xa63
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x399
	.4byte	0x9aa
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x39b
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x39c
	.4byte	0x315
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x39d
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x14
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x3bc
	.4byte	0xa6e
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.4byte	0xa68
	.uleb128 0x5
	.byte	0x2
	.4byte	0x2f6
	.uleb128 0x15
	.4byte	0x128
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueGiveFromISR"
	.byte	0x1
	.2byte	0x430
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x5e
	.4byte	0xb1b
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x430
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x12
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x430
	.4byte	0xa63
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x432
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x433
	.4byte	0x315
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x434
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LBB3
	.4byte	.LBE3
	.uleb128 0x14
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x459
	.4byte	0x74f
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x18
	.4byte	.LBB4
	.4byte	.LBE4
	.uleb128 0x14
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x460
	.4byte	0xa6e
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueGenericReceive"
	.byte	0x1
	.2byte	0x4d5
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x5e
	.4byte	0xbe3
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x4d5
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x12
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x4d5
	.4byte	0xbe3
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x12
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x4d5
	.4byte	0x328
	.byte	0x2
	.byte	0x7e
	.sleb128 16
	.uleb128 0x13
	.asciz	"xJustPeeking"
	.byte	0x1
	.2byte	0x4d5
	.4byte	0x9aa
	.byte	0x2
	.byte	0x7e
	.sleb128 18
	.uleb128 0x14
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x4d7
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x4d8
	.4byte	0x4c5
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x14
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x4d9
	.4byte	0x522
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x4da
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LBB5
	.4byte	.LBE5
	.uleb128 0x14
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x4ec
	.4byte	0x74f
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.4byte	0x9f
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueReceiveFromISR"
	.byte	0x1
	.2byte	0x59a
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x5e
	.4byte	0xca2
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x59a
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x12
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x59a
	.4byte	0xbe3
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x12
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x59a
	.4byte	0xa63
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x59c
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x59d
	.4byte	0x315
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x59e
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LBB6
	.4byte	.LBE6
	.uleb128 0x14
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x5b5
	.4byte	0x74f
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x18
	.4byte	.LBB7
	.4byte	.LBE7
	.uleb128 0x14
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x5ba
	.4byte	0xa6e
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueuePeekFromISR"
	.byte	0x1
	.2byte	0x5f5
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x1
	.byte	0x5e
	.4byte	0xd27
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x5f5
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x12
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x5f5
	.4byte	0xbe3
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x5f7
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x5f8
	.4byte	0x315
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x14
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x5f9
	.4byte	0x522
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x5fa
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"uxQueueMessagesWaiting"
	.byte	0x1
	.2byte	0x62b
	.byte	0x1
	.4byte	0x315
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x1
	.byte	0x5e
	.4byte	0xd75
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x62b
	.4byte	0xd75
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x62d
	.4byte	0x315
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x15
	.4byte	0x4d6
	.uleb128 0x11
	.byte	0x1
	.asciz	"uxQueueSpacesAvailable"
	.byte	0x1
	.2byte	0x63b
	.byte	0x1
	.4byte	0x315
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x1
	.byte	0x5e
	.4byte	0xdd7
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x63b
	.4byte	0xd75
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x14
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x63d
	.4byte	0x315
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x63e
	.4byte	0x6b4
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"uxQueueMessagesWaitingFromISR"
	.byte	0x1
	.2byte	0x64d
	.byte	0x1
	.4byte	0x315
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x1
	.byte	0x5e
	.4byte	0xe2c
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x64d
	.4byte	0xd75
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x64f
	.4byte	0x315
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.asciz	"vQueueDelete"
	.byte	0x1
	.2byte	0x659
	.byte	0x1
	.4byte	.LFB15
	.4byte	.LFE15
	.byte	0x1
	.byte	0x5e
	.4byte	0xe6c
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x659
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x65b
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"uxQueueGetQueueNumber"
	.byte	0x1
	.2byte	0x685
	.byte	0x1
	.4byte	0x315
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x1
	.byte	0x5e
	.4byte	0xeaa
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x685
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.asciz	"vQueueSetQueueNumber"
	.byte	0x1
	.2byte	0x68f
	.byte	0x1
	.4byte	.LFB17
	.4byte	.LFE17
	.byte	0x1
	.byte	0x5e
	.4byte	0xef2
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x68f
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x12
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x68f
	.4byte	0x315
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"ucQueueGetQueueType"
	.byte	0x1
	.2byte	0x699
	.byte	0x1
	.4byte	0x145
	.4byte	.LFB18
	.4byte	.LFE18
	.byte	0x1
	.byte	0x5e
	.4byte	0xf2e
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x699
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1a
	.asciz	"prvCopyDataToQueue"
	.byte	0x1
	.2byte	0x6a1
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB19
	.4byte	.LFE19
	.byte	0x1
	.byte	0x5e
	.4byte	0xfaa
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x6a1
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x12
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x6a1
	.4byte	0x121
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x13
	.asciz	"xPosition"
	.byte	0x1
	.2byte	0x6a1
	.4byte	0x9aa
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x6a3
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x6a4
	.4byte	0x315
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x17
	.asciz	"prvCopyDataFromQueue"
	.byte	0x1
	.2byte	0x6f0
	.byte	0x1
	.4byte	.LFB20
	.4byte	.LFE20
	.byte	0x1
	.byte	0x5e
	.4byte	0xff1
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x6f0
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x12
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x6f0
	.4byte	0xbe3
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x17
	.asciz	"prvUnlockQueue"
	.byte	0x1
	.2byte	0x702
	.byte	0x1
	.4byte	.LFB21
	.4byte	.LFE21
	.byte	0x1
	.byte	0x5e
	.4byte	0x1059
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x702
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1b
	.4byte	.LBB8
	.4byte	.LBE8
	.4byte	0x103f
	.uleb128 0x14
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x70c
	.4byte	0x128
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x18
	.4byte	.LBB9
	.4byte	.LBE9
	.uleb128 0x14
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x75d
	.4byte	0x128
	.byte	0x2
	.byte	0x7e
	.sleb128 1
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.asciz	"prvIsQueueEmpty"
	.byte	0x1
	.2byte	0x77a
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB22
	.4byte	.LFE22
	.byte	0x1
	.byte	0x5e
	.4byte	0x109f
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x77a
	.4byte	0x109f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x77c
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	0x10a5
	.uleb128 0x15
	.4byte	0x641
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueIsQueueEmptyFromISR"
	.byte	0x1
	.2byte	0x78f
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB23
	.4byte	.LFE23
	.byte	0x1
	.byte	0x5e
	.4byte	0x10fb
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x78f
	.4byte	0xd75
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x791
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1a
	.asciz	"prvIsQueueFull"
	.byte	0x1
	.2byte	0x7a1
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB24
	.4byte	.LFE24
	.byte	0x1
	.byte	0x5e
	.4byte	0x1140
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x7a1
	.4byte	0x109f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x7a3
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueIsQueueFullFromISR"
	.byte	0x1
	.2byte	0x7b6
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB25
	.4byte	.LFE25
	.byte	0x1
	.byte	0x5e
	.4byte	0x1190
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x7b6
	.4byte	0xd75
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x7b8
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueCRSend"
	.byte	0x1
	.2byte	0x7ca
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB26
	.4byte	.LFE26
	.byte	0x1
	.byte	0x5e
	.4byte	0x1201
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x7ca
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x12
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x7ca
	.4byte	0x121
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x12
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x7ca
	.4byte	0x328
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x7cc
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x7cd
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueCRReceive"
	.byte	0x1
	.2byte	0x817
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB27
	.4byte	.LFE27
	.byte	0x1
	.byte	0x5e
	.4byte	0x1275
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x817
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x12
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x817
	.4byte	0x9f
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x12
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x817
	.4byte	0x328
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x819
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x81a
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueCRSendFromISR"
	.byte	0x1
	.2byte	0x871
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB28
	.4byte	.LFE28
	.byte	0x1
	.byte	0x5e
	.4byte	0x12f4
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x871
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x12
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x871
	.4byte	0x121
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x13
	.asciz	"xCoRoutinePreviouslyWoken"
	.byte	0x1
	.2byte	0x871
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x873
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.asciz	"xQueueCRReceiveFromISR"
	.byte	0x1
	.2byte	0x8a1
	.byte	0x1
	.4byte	0x2f6
	.4byte	.LFB29
	.4byte	.LFE29
	.byte	0x1
	.byte	0x5e
	.4byte	0x137c
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x8a1
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x12
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x8a1
	.4byte	0x9f
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x13
	.asciz	"pxCoRoutineWoken"
	.byte	0x1
	.2byte	0x8a1
	.4byte	0xa68
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x8a3
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x8a4
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.asciz	"vQueueWaitForMessageRestricted"
	.byte	0x1
	.2byte	0x936
	.byte	0x1
	.4byte	.LFB30
	.4byte	.LFE30
	.byte	0x1
	.byte	0x5e
	.4byte	0x13fa
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x936
	.4byte	0x4d6
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x12
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x936
	.4byte	0x328
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x13
	.asciz	"xWaitIndefinitely"
	.byte	0x1
	.2byte	0x936
	.4byte	0x9aa
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x14
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x938
	.4byte	0x6af
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1c
	.asciz	"SRbits"
	.byte	0x5
	.byte	0x9f
	.4byte	0x140a
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.4byte	0x2e0
	.uleb128 0x1c
	.asciz	"SRbits"
	.byte	0x5
	.byte	0x9f
	.4byte	0x140a
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
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.4byte	0x270
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1420
	.4byte	0x650
	.asciz	"xQueueGenericReset"
	.4byte	0x6ba
	.asciz	"xQueueGenericCreate"
	.4byte	0x804
	.asciz	"xQueueCreateMutex"
	.4byte	0x87d
	.asciz	"xQueueCreateCountingSemaphore"
	.4byte	0x8f7
	.asciz	"xQueueGenericSend"
	.4byte	0x9af
	.asciz	"xQueueGenericSendFromISR"
	.4byte	0xa73
	.asciz	"xQueueGiveFromISR"
	.4byte	0xb1b
	.asciz	"xQueueGenericReceive"
	.4byte	0xbe8
	.asciz	"xQueueReceiveFromISR"
	.4byte	0xca2
	.asciz	"xQueuePeekFromISR"
	.4byte	0xd27
	.asciz	"uxQueueMessagesWaiting"
	.4byte	0xd7a
	.asciz	"uxQueueSpacesAvailable"
	.4byte	0xdd7
	.asciz	"uxQueueMessagesWaitingFromISR"
	.4byte	0xe2c
	.asciz	"vQueueDelete"
	.4byte	0xe6c
	.asciz	"uxQueueGetQueueNumber"
	.4byte	0xeaa
	.asciz	"vQueueSetQueueNumber"
	.4byte	0xef2
	.asciz	"ucQueueGetQueueType"
	.4byte	0x10aa
	.asciz	"xQueueIsQueueEmptyFromISR"
	.4byte	0x1140
	.asciz	"xQueueIsQueueFullFromISR"
	.4byte	0x1190
	.asciz	"xQueueCRSend"
	.4byte	0x1201
	.asciz	"xQueueCRReceive"
	.4byte	0x1275
	.asciz	"xQueueCRSendFromISR"
	.4byte	0x12f4
	.asciz	"xQueueCRReceiveFromISR"
	.4byte	0x137c
	.asciz	"vQueueWaitForMessageRestricted"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x142
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1420
	.4byte	0xf9
	.asciz	"_Sizet"
	.4byte	0x113
	.asciz	"size_t"
	.4byte	0x128
	.asciz	"int8_t"
	.4byte	0x145
	.asciz	"uint8_t"
	.4byte	0x165
	.asciz	"uint16_t"
	.4byte	0x2c5
	.asciz	"tagSRBITS"
	.4byte	0x2e0
	.asciz	"SRBITS"
	.4byte	0x2f6
	.asciz	"BaseType_t"
	.4byte	0x315
	.asciz	"UBaseType_t"
	.4byte	0x328
	.asciz	"TickType_t"
	.4byte	0x340
	.asciz	"xLIST_ITEM"
	.4byte	0x3af
	.asciz	"ListItem_t"
	.4byte	0x3c1
	.asciz	"xMINI_LIST_ITEM"
	.4byte	0x407
	.asciz	"MiniListItem_t"
	.4byte	0x41d
	.asciz	"xLIST"
	.4byte	0x471
	.asciz	"List_t"
	.4byte	0x47f
	.asciz	"xTIME_OUT"
	.4byte	0x4c5
	.asciz	"TimeOut_t"
	.4byte	0x4d6
	.asciz	"QueueHandle_t"
	.4byte	0x528
	.asciz	"QueueDefinition"
	.4byte	0x633
	.asciz	"xQUEUE"
	.4byte	0x641
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
.LASF18:
	.asciz	"pxHigherPriorityTaskWoken"
.LASF3:
	.asciz	"uxItemSize"
.LASF12:
	.asciz	"pucQueueStorage"
.LASF7:
	.asciz	"ucQueueType"
.LASF11:
	.asciz	"pxNewQueue"
.LASF19:
	.asciz	"xReturn"
.LASF4:
	.asciz	"cRxLock"
.LASF5:
	.asciz	"cTxLock"
.LASF1:
	.asciz	"pxPrevious"
.LASF21:
	.asciz	"pvBuffer"
.LASF2:
	.asciz	"uxMessagesWaiting"
.LASF16:
	.asciz	"xEntryTimeSet"
.LASF10:
	.asciz	"pxQueue"
.LASF20:
	.asciz	"uxSavedInterruptStatus"
.LASF9:
	.asciz	"uxQueueLength"
.LASF13:
	.asciz	"pvItemToQueue"
.LASF17:
	.asciz	"xTimeOut"
.LASF0:
	.asciz	"xItemValue"
.LASF14:
	.asciz	"xTicksToWait"
.LASF6:
	.asciz	"uxQueueNumber"
.LASF23:
	.asciz	"uxReturn"
.LASF8:
	.asciz	"xQueue"
.LASF22:
	.asciz	"pcOriginalReadPosition"
.LASF15:
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
