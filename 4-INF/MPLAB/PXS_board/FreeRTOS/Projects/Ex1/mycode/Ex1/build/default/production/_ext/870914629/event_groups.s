	.file "C:\\Users\\Filippo\\Downloads\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\..\\source\\event_groups.c"
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
	.global	_xEventGroupCreateStatic	; export
	.type	_xEventGroupCreateStatic,@function
_xEventGroupCreateStatic:
.LFB0:
	.file 1 "../../source/event_groups.c"
	.loc 1 136 0
	.set ___PA___,1
	lnk	#4
.LCFI0:
	mov	w0,[w14+2]
	.loc 1 143 0
	mov	[w14+2],w1
	mov	w1,[w14]
	.loc 1 145 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L2
	.loc 1 147 0
	mov	[w14],w0
	clr	w1
	mov	w1,[w0]
	.loc 1 148 0
	inc2	[w14],w0
	rcall	_vListInitialise
	.loc 1 155 0
	mov	[w14],w0
	mov.b	#1,w1
	mov.b	w1,[w0+14]
.L2:
	.loc 1 166 0
	mov	[w14],w0
	.loc 1 167 0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.size	_xEventGroupCreateStatic, .-_xEventGroupCreateStatic
	.align	2
	.global	_xEventGroupCreate	; export
	.type	_xEventGroupCreate,@function
_xEventGroupCreate:
.LFB1:
	.loc 1 175 0
	.set ___PA___,1
	lnk	#2
.LCFI1:
	.loc 1 179 0
	mov	#16,w0
	rcall	_pvPortMalloc
	mov	w0,[w14]
	.loc 1 181 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L4
	.loc 1 183 0
	mov	[w14],w0
	clr	w1
	mov	w1,[w0]
	.loc 1 184 0
	inc2	[w14],w0
	rcall	_vListInitialise
	.loc 1 191 0
	mov	[w14],w0
	clr.b	w1
	mov.b	w1,[w0+14]
.L4:
	.loc 1 202 0
	mov	[w14],w0
	.loc 1 203 0
	ulnk	
	return	
	.set ___PA___,0
.LFE1:
	.size	_xEventGroupCreate, .-_xEventGroupCreate
	.align	2
	.global	_xEventGroupSync	; export
	.type	_xEventGroupSync,@function
_xEventGroupSync:
.LFB2:
	.loc 1 209 0
	.set ___PA___,0
	lnk	#18
.LCFI2:
	mov	w0,[w14+10]
	mov	w1,[w14+12]
	mov	w2,[w14+14]
	mov	w3,[w14+16]
	.loc 1 211 0
	mov	[w14+10],w1
	mov	w1,[w14+2]
	.loc 1 213 0
	clr	w0
	mov	w0,[w14+4]
	.loc 1 223 0
	rcall	_vTaskSuspendAll
	.loc 1 225 0
	mov	[w14+2],w0
	mov	[w0],w1
	mov	w1,[w14+6]
	.loc 1 227 0
	mov	[w14+12],w1
	mov	[w14+10],w0
	rcall	_xEventGroupSetBits
	.loc 1 229 0
	mov	[w14+6],w1
	mov	[w14+12],w0
	ior	w0,w1,w1
	mov	[w14+14],w0
	and	w1,w0,w1
	mov	[w14+14],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L6
	.loc 1 232 0
	mov	[w14+6],w1
	mov	[w14+12],w0
	ior	w1,w0,[w14]
	.loc 1 236 0
	mov	[w14+2],w0
	mov	[w0],w1
	mov	[w14+14],w0
	com	w0,w0
	and	w1,w0,w1
	mov	[w14+2],w0
	mov	w1,[w0]
	.loc 1 238 0
	clr	w0
	mov	w0,[w14+16]
	bra	.L7
.L6:
	.loc 1 242 0
	mov	[w14+16],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L8
	.loc 1 249 0
	mov	[w14+14],w1
	mov	#1280,w0
	ior	w0,w1,w1
	mov	[w14+2],w0
	inc2	w0,w0
	mov	[w14+16],w2
	rcall	_vTaskPlaceOnUnorderedEventList
	.loc 1 255 0
	clr	w0
	mov	w0,[w14]
	bra	.L7
.L8:
	.loc 1 261 0
	mov	[w14+2],w0
	mov	[w0],[w14]
.L7:
	.loc 1 265 0
	rcall	_xTaskResumeAll
	mov	w0,[w14+8]
	.loc 1 267 0
	mov	[w14+16],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L9
	.loc 1 269 0
	mov	[w14+8],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L10
	.loc 1 271 0
; 271 "../../source/event_groups.c" 1
	CALL _vPortYield			
NOP					  
.L10:
	.loc 1 282 0
	rcall	_uxTaskResetEventItemValue
	mov	w0,[w14]
	.loc 1 284 0
	mov	#512,w0
	and	w0,[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L11
	.loc 1 287 0
	rcall	_vPortEnterCritical
	.loc 1 289 0
	mov	[w14+2],w0
	mov	[w0],[w14]
	.loc 1 295 0
	mov	[w14+14],w0
	and	w0,[w14],w1
	mov	[w14+14],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L12
	.loc 1 297 0
	mov	[w14+2],w0
	mov	[w0],w1
	mov	[w14+14],w0
	com	w0,w0
	and	w1,w0,w1
	mov	[w14+2],w0
	mov	w1,[w0]
.L12:
	.loc 1 304 0
	rcall	_vPortExitCritical
	.loc 1 306 0
	mov	#1,w0
	mov	w0,[w14+4]
.L11:
	.loc 1 315 0
	mov	#255,w0
	and	w0,[w14],[w14]
.L9:
	.loc 1 320 0
	mov	[w14],w0
	.loc 1 321 0
	ulnk	
	return	
	.set ___PA___,0
.LFE2:
	.size	_xEventGroupSync, .-_xEventGroupSync
	.align	2
	.global	_xEventGroupWaitBits	; export
	.type	_xEventGroupWaitBits,@function
_xEventGroupWaitBits:
.LFB3:
	.loc 1 325 0
	.set ___PA___,0
	lnk	#24
.LCFI3:
	mov	w0,[w14+14]
	mov	w1,[w14+16]
	mov	w2,[w14+18]
	mov	w3,[w14+20]
	mov	w4,[w14+22]
	.loc 1 326 0
	mov	[w14+14],w1
	mov	w1,[w14+4]
	.loc 1 327 0
	clr	w0
	mov	w0,[w14+2]
	.loc 1 329 0
	clr	w0
	mov	w0,[w14+6]
	.loc 1 342 0
	rcall	_vTaskSuspendAll
.LBB2:
	.loc 1 344 0
	mov	[w14+4],w0
	mov	[w0],w1
	mov	w1,[w14+8]
	.loc 1 347 0
	mov	[w14+20],w2
	mov	[w14+16],w1
	mov	[w14+8],w0
	rcall	_prvTestWaitCondition
	mov	w0,[w14+10]
	.loc 1 349 0
	mov	[w14+10],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L14
	.loc 1 353 0
	mov	[w14+8],w1
	mov	w1,[w14]
	.loc 1 354 0
	clr	w0
	mov	w0,[w14+22]
	.loc 1 357 0
	mov	[w14+18],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L15
	.loc 1 359 0
	mov	[w14+4],w0
	mov	[w0],w1
	mov	[w14+16],w0
	com	w0,w0
	and	w1,w0,w1
	mov	[w14+4],w0
	mov	w1,[w0]
	bra	.L15
.L14:
	.loc 1 366 0
	mov	[w14+22],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L16
	.loc 1 370 0
	mov	[w14+8],w1
	mov	w1,[w14]
	bra	.L15
.L16:
	.loc 1 378 0
	mov	[w14+18],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L17
	.loc 1 380 0
	mov	[w14+2],w0
	bset	w0,#8
	mov	w0,[w14+2]
.L17:
	.loc 1 387 0
	mov	[w14+20],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L18
	.loc 1 389 0
	mov	[w14+2],w0
	bset	w0,#10
	mov	w0,[w14+2]
.L18:
	.loc 1 399 0
	mov	[w14+16],w1
	mov	[w14+2],w0
	ior	w0,w1,w1
	mov	[w14+4],w0
	inc2	w0,w0
	mov	[w14+22],w2
	rcall	_vTaskPlaceOnUnorderedEventList
	.loc 1 404 0
	clr	w0
	mov	w0,[w14]
.L15:
.LBE2:
	.loc 1 409 0
	rcall	_xTaskResumeAll
	mov	w0,[w14+12]
	.loc 1 411 0
	mov	[w14+22],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L19
	.loc 1 413 0
	mov	[w14+12],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L20
	.loc 1 415 0
; 415 "../../source/event_groups.c" 1
	CALL _vPortYield			
NOP					  
.L20:
	.loc 1 426 0
	rcall	_uxTaskResetEventItemValue
	mov	w0,[w14]
	.loc 1 428 0
	mov	#512,w0
	and	w0,[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L21
	.loc 1 430 0
	rcall	_vPortEnterCritical
	.loc 1 433 0
	mov	[w14+4],w0
	mov	[w0],[w14]
	.loc 1 437 0
	mov	[w14+20],w2
	mov	[w14+16],w1
	mov	[w14],w0
	rcall	_prvTestWaitCondition
	cp0	w0
	.set ___BP___,0
	bra	z,.L22
	.loc 1 439 0
	mov	[w14+18],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L22
	.loc 1 441 0
	mov	[w14+4],w0
	mov	[w0],w1
	mov	[w14+16],w0
	com	w0,w0
	and	w1,w0,w1
	mov	[w14+4],w0
	mov	w1,[w0]
.L22:
	.loc 1 453 0
	rcall	_vPortExitCritical
	.loc 1 456 0
	clr	w0
	mov	w0,[w14+6]
.L21:
	.loc 1 464 0
	mov	#255,w0
	and	w0,[w14],[w14]
.L19:
	.loc 1 468 0
	mov	[w14],w0
	.loc 1 469 0
	ulnk	
	return	
	.set ___PA___,0
.LFE3:
	.size	_xEventGroupWaitBits, .-_xEventGroupWaitBits
	.align	2
	.global	_xEventGroupClearBits	; export
	.type	_xEventGroupClearBits,@function
_xEventGroupClearBits:
.LFB4:
	.loc 1 473 0
	.set ___PA___,1
	lnk	#8
.LCFI4:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	.loc 1 474 0
	mov	[w14+4],w1
	mov	w1,[w14]
	.loc 1 482 0
	rcall	_vPortEnterCritical
	.loc 1 488 0
	mov	[w14],w0
	mov	[w0],w1
	mov	w1,[w14+2]
	.loc 1 491 0
	mov	[w14],w0
	mov	[w0],w1
	mov	[w14+6],w0
	com	w0,w0
	and	w1,w0,w1
	mov	[w14],w0
	mov	w1,[w0]
	.loc 1 493 0
	rcall	_vPortExitCritical
	.loc 1 495 0
	mov	[w14+2],w0
	.loc 1 496 0
	ulnk	
	return	
	.set ___PA___,0
.LFE4:
	.size	_xEventGroupClearBits, .-_xEventGroupClearBits
	.align	2
	.global	_xEventGroupGetBitsFromISR	; export
	.type	_xEventGroupGetBitsFromISR,@function
_xEventGroupGetBitsFromISR:
.LFB5:
	.loc 1 515 0
	.set ___PA___,1
	lnk	#8
.LCFI5:
	mov	w0,[w14+6]
	.loc 1 517 0
	mov	[w14+6],w1
	mov	w1,[w14]
	.loc 1 520 0
	clr	w0
	mov	w0,[w14+2]
	.loc 1 522 0
	mov	[w14],w0
	mov	[w0],w1
	mov	w1,[w14+4]
	.loc 1 526 0
	mov	[w14+4],w0
	.loc 1 527 0
	ulnk	
	return	
	.set ___PA___,0
.LFE5:
	.size	_xEventGroupGetBitsFromISR, .-_xEventGroupGetBitsFromISR
	.align	2
	.global	_xEventGroupSetBits	; export
	.type	_xEventGroupSetBits,@function
_xEventGroupSetBits:
.LFB6:
	.loc 1 531 0
	.set ___PA___,1
	lnk	#22
.LCFI6:
	mov	w0,[w14+18]
	mov	w1,[w14+20]
	.loc 1 535 0
	clr	w0
	mov	w0,[w14+2]
	.loc 1 536 0
	mov	[w14+18],w1
	mov	w1,[w14+6]
	.loc 1 537 0
	clr	w0
	mov	w0,[w14+4]
	.loc 1 544 0
	mov	[w14+6],w0
	inc2	w0,w0
	mov	w0,[w14+8]
	.loc 1 545 0
	mov	[w14+8],w0
	add	w0,#4,w0
	mov	w0,[w14+10]
	.loc 1 546 0
	rcall	_vTaskSuspendAll
	.loc 1 550 0
	mov	[w14+8],w0
	mov	[w0+6],w1
	mov	w1,[w14]
	.loc 1 553 0
	mov	[w14+6],w0
	mov	[w0],w1
	mov	[w14+20],w0
	ior	w0,w1,w1
	mov	[w14+6],w0
	mov	w1,[w0]
	.loc 1 556 0
	bra	.L26
.L31:
	.loc 1 558 0
	mov	[w14],w0
	mov	[w0+2],w1
	mov	w1,[w14+12]
	.loc 1 559 0
	mov	[w14],w0
	mov	[w0],w1
	mov	w1,[w14+14]
	.loc 1 560 0
	clr	w0
	mov	w0,[w14+4]
	.loc 1 563 0
	mov	[w14+14],w1
	mov	#-256,w0
	and	w1,w0,w0
	mov	w0,[w14+16]
	.loc 1 564 0
	mov	[w14+14],w1
	mov	#255,w0
	and	w1,w0,w0
	mov	w0,[w14+14]
	.loc 1 566 0
	mov	[w14+16],w1
	mov	#1024,w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L27
	.loc 1 569 0
	mov	[w14+6],w0
	mov	[w0],w1
	mov	[w14+14],w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L28
	.loc 1 571 0
	mov	#1,w0
	mov	w0,[w14+4]
	bra	.L28
.L27:
	.loc 1 578 0
	mov	[w14+6],w0
	mov	[w0],w1
	mov	[w14+14],w0
	and	w1,w0,w1
	mov	[w14+14],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L28
	.loc 1 581 0
	mov	#1,w0
	mov	w0,[w14+4]
.L28:
	.loc 1 588 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L29
	.loc 1 591 0
	mov	[w14+16],w1
	mov	#256,w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L30
	.loc 1 593 0
	mov	[w14+2],w1
	mov	[w14+14],w0
	ior	w0,w1,w0
	mov	w0,[w14+2]
.L30:
	.loc 1 605 0
	mov	[w14+6],w0
	mov	[w0],w0
	bset	w0,#9
	mov	w0,w1
	mov	[w14],w0
	rcall	_xTaskRemoveFromUnorderedEventList
.L29:
	.loc 1 611 0
	mov	[w14+12],w1
	mov	w1,[w14]
.L26:
	.loc 1 556 0
	mov	[w14+10],w0
	mov	[w14],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L31
	.loc 1 616 0
	mov	[w14+6],w0
	mov	[w0],w1
	mov	[w14+2],w0
	com	w0,w0
	and	w1,w0,w1
	mov	[w14+6],w0
	mov	w1,[w0]
	.loc 1 618 0
	rcall	_xTaskResumeAll
	.loc 1 620 0
	mov	[w14+6],w0
	mov	[w0],w0
	.loc 1 621 0
	ulnk	
	return	
	.set ___PA___,0
.LFE6:
	.size	_xEventGroupSetBits, .-_xEventGroupSetBits
	.align	2
	.global	_vEventGroupDelete	; export
	.type	_vEventGroupDelete,@function
_vEventGroupDelete:
.LFB7:
	.loc 1 625 0
	.set ___PA___,1
	lnk	#6
.LCFI7:
	mov	w0,[w14+4]
	.loc 1 626 0
	mov	[w14+4],w1
	mov	w1,[w14]
	.loc 1 627 0
	inc2	[w14],w0
	mov	w0,[w14+2]
	.loc 1 629 0
	rcall	_vTaskSuspendAll
	.loc 1 633 0
	bra	.L33
.L34:
	.loc 1 638 0
	mov	[w14+2],w0
	mov	[w0+6],w0
	mov	#512,w1
	rcall	_xTaskRemoveFromUnorderedEventList
.L33:
	.loc 1 633 0
	mov	[w14+2],w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L34
	.loc 1 651 0
	mov	[w14],w0
	mov.b	[w0+14],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L35
	.loc 1 653 0
	mov	[w14],w0
	rcall	_vPortFree
.L35:
	.loc 1 662 0
	rcall	_xTaskResumeAll
	.loc 1 663 0
	ulnk	
	return	
	.set ___PA___,0
.LFE7:
	.size	_vEventGroupDelete, .-_vEventGroupDelete
	.align	2
	.global	_vEventGroupSetBitsCallback	; export
	.type	_vEventGroupSetBitsCallback,@function
_vEventGroupSetBitsCallback:
.LFB8:
	.loc 1 669 0
	.set ___PA___,1
	lnk	#6
.LCFI8:
	mov	w0,[w14]
	mov	w2,[w14+2]
	mov	w3,[w14+4]
	.loc 1 670 0
	mov	[w14+2],w0
	mov	w0,w1
	mov	[w14],w0
	rcall	_xEventGroupSetBits
	.loc 1 671 0
	ulnk	
	return	
	.set ___PA___,0
.LFE8:
	.size	_vEventGroupSetBitsCallback, .-_vEventGroupSetBitsCallback
	.align	2
	.global	_vEventGroupClearBitsCallback	; export
	.type	_vEventGroupClearBitsCallback,@function
_vEventGroupClearBitsCallback:
.LFB9:
	.loc 1 677 0
	.set ___PA___,1
	lnk	#6
.LCFI9:
	mov	w0,[w14]
	mov	w2,[w14+2]
	mov	w3,[w14+4]
	.loc 1 678 0
	mov	[w14+2],w0
	mov	w0,w1
	mov	[w14],w0
	rcall	_xEventGroupClearBits
	.loc 1 679 0
	ulnk	
	return	
	.set ___PA___,0
.LFE9:
	.size	_vEventGroupClearBitsCallback, .-_vEventGroupClearBitsCallback
	.align	2
	.type	_prvTestWaitCondition,@function
_prvTestWaitCondition:
.LFB10:
	.loc 1 683 0
	.set ___PA___,1
	lnk	#8
.LCFI10:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	mov	w2,[w14+6]
	.loc 1 684 0
	clr	w0
	mov	w0,[w14]
	.loc 1 686 0
	mov	[w14+6],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L39
	.loc 1 690 0
	mov	[w14+2],w1
	mov	[w14+4],w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L40
	.loc 1 692 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L40
.L39:
	.loc 1 703 0
	mov	[w14+2],w1
	mov	[w14+4],w0
	and	w1,w0,w1
	mov	[w14+4],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L40
	.loc 1 705 0
	mov	#1,w0
	mov	w0,[w14]
.L40:
	.loc 1 713 0
	mov	[w14],w0
	.loc 1 714 0
	ulnk	
	return	
	.set ___PA___,0
.LFE10:
	.size	_prvTestWaitCondition, .-_prvTestWaitCondition
	.align	2
	.global	_uxEventGroupGetNumber	; export
	.type	_uxEventGroupGetNumber,@function
_uxEventGroupGetNumber:
.LFB11:
	.loc 1 735 0
	.set ___PA___,1
	lnk	#6
.LCFI11:
	mov	w0,[w14+4]
	.loc 1 737 0
	mov	[w14+4],w1
	mov	w1,[w14+2]
	.loc 1 739 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L42
	.loc 1 741 0
	clr	w0
	mov	w0,[w14]
	bra	.L43
.L42:
	.loc 1 745 0
	mov	[w14+2],w0
	mov	[w0+12],w1
	mov	w1,[w14]
.L43:
	.loc 1 748 0
	mov	[w14],w0
	.loc 1 749 0
	ulnk	
	return	
	.set ___PA___,0
.LFE11:
	.size	_uxEventGroupGetNumber, .-_uxEventGroupGetNumber
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
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 3 "../../source/include/../../Source/portable/MPLAB/PIC24_dsPIC/portmacro.h"
	.file 4 "../../source/include/FreeRTOS.h"
	.file 5 "../../source/include/list.h"
	.file 6 "../../source/include/event_groups.h"
	.section	.debug_info,info
	.4byte	0xb57
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../../source/event_groups.c"
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
	.4byte	0x135
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x2
	.byte	0x31
	.4byte	0xf4
	.uleb128 0x4
	.asciz	"uint32_t"
	.byte	0x2
	.byte	0x37
	.4byte	0x166
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x4
	.asciz	"BaseType_t"
	.byte	0x3
	.byte	0x61
	.4byte	0x195
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"UBaseType_t"
	.byte	0x3
	.byte	0x62
	.4byte	0xde
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x3
	.byte	0x65
	.4byte	0x146
	.uleb128 0x5
	.asciz	"xSTATIC_MINI_LIST_ITEM"
	.byte	0x6
	.byte	0x4
	.2byte	0x378
	.4byte	0x20a
	.uleb128 0x6
	.asciz	"xDummy1"
	.byte	0x4
	.2byte	0x37a
	.4byte	0x1b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x4
	.2byte	0x37b
	.4byte	0x20a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x8
	.4byte	0xb1
	.4byte	0x21a
	.uleb128 0x9
	.4byte	0xf4
	.byte	0x1
	.byte	0x0
	.uleb128 0xa
	.asciz	"StaticMiniListItem_t"
	.byte	0x4
	.2byte	0x37d
	.4byte	0x1c7
	.uleb128 0x5
	.asciz	"xSTATIC_LIST"
	.byte	0xa
	.byte	0x4
	.2byte	0x380
	.4byte	0x284
	.uleb128 0x6
	.asciz	"uxDummy1"
	.byte	0x4
	.2byte	0x382
	.4byte	0x1a2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x4
	.2byte	0x383
	.4byte	0xb1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.asciz	"xDummy3"
	.byte	0x4
	.2byte	0x384
	.4byte	0x21a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xa
	.asciz	"StaticList_t"
	.byte	0x4
	.2byte	0x385
	.4byte	0x237
	.uleb128 0x5
	.asciz	"xSTATIC_EVENT_GROUP"
	.byte	0x10
	.byte	0x4
	.2byte	0x3fa
	.4byte	0x305
	.uleb128 0x6
	.asciz	"xDummy1"
	.byte	0x4
	.2byte	0x3fc
	.4byte	0x1b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"xDummy2"
	.byte	0x4
	.2byte	0x3fd
	.4byte	0x284
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.asciz	"uxDummy3"
	.byte	0x4
	.2byte	0x400
	.4byte	0x1a2
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.asciz	"ucDummy4"
	.byte	0x4
	.2byte	0x404
	.4byte	0x126
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.byte	0x0
	.uleb128 0xa
	.asciz	"StaticEventGroup_t"
	.byte	0x4
	.2byte	0x407
	.4byte	0x299
	.uleb128 0xb
	.asciz	"xLIST_ITEM"
	.byte	0xa
	.byte	0x5
	.byte	0xb5
	.4byte	0x386
	.uleb128 0xc
	.4byte	.LASF1
	.byte	0x5
	.byte	0xb8
	.4byte	0x1b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.4byte	.LASF2
	.byte	0x5
	.byte	0xb9
	.4byte	0x386
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xc
	.4byte	.LASF3
	.byte	0x5
	.byte	0xba
	.4byte	0x386
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.asciz	"pvOwner"
	.byte	0x5
	.byte	0xbb
	.4byte	0xb1
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xd
	.asciz	"pvContainer"
	.byte	0x5
	.byte	0xbc
	.4byte	0xb1
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xe
	.byte	0x2
	.4byte	0x320
	.uleb128 0x4
	.asciz	"ListItem_t"
	.byte	0x5
	.byte	0xbf
	.4byte	0x320
	.uleb128 0xb
	.asciz	"xMINI_LIST_ITEM"
	.byte	0x6
	.byte	0x5
	.byte	0xc1
	.4byte	0x3e1
	.uleb128 0xc
	.4byte	.LASF1
	.byte	0x5
	.byte	0xc4
	.4byte	0x1b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.4byte	.LASF2
	.byte	0x5
	.byte	0xc5
	.4byte	0x386
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xc
	.4byte	.LASF3
	.byte	0x5
	.byte	0xc6
	.4byte	0x386
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.asciz	"MiniListItem_t"
	.byte	0x5
	.byte	0xc8
	.4byte	0x39e
	.uleb128 0xb
	.asciz	"xLIST"
	.byte	0xa
	.byte	0x5
	.byte	0xcd
	.4byte	0x445
	.uleb128 0xd
	.asciz	"uxNumberOfItems"
	.byte	0x5
	.byte	0xd0
	.4byte	0x1a2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.asciz	"pxIndex"
	.byte	0x5
	.byte	0xd1
	.4byte	0x445
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.asciz	"xListEnd"
	.byte	0x5
	.byte	0xd2
	.4byte	0x3e1
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xe
	.byte	0x2
	.4byte	0x38c
	.uleb128 0x4
	.asciz	"List_t"
	.byte	0x5
	.byte	0xd4
	.4byte	0x3f7
	.uleb128 0x4
	.asciz	"EventGroupHandle_t"
	.byte	0x6
	.byte	0x7b
	.4byte	0xb1
	.uleb128 0x4
	.asciz	"EventBits_t"
	.byte	0x6
	.byte	0x85
	.4byte	0x1b5
	.uleb128 0xb
	.asciz	"xEventGroupDefinition"
	.byte	0x10
	.byte	0x1
	.byte	0x69
	.4byte	0x517
	.uleb128 0xd
	.asciz	"uxEventBits"
	.byte	0x1
	.byte	0x6b
	.4byte	0x473
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.asciz	"xTasksWaitingForBits"
	.byte	0x1
	.byte	0x6c
	.4byte	0x44b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.asciz	"uxEventGroupNumber"
	.byte	0x1
	.byte	0x6f
	.4byte	0x1a2
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xd
	.asciz	"ucStaticallyAllocated"
	.byte	0x1
	.byte	0x73
	.4byte	0x126
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.byte	0x0
	.uleb128 0x4
	.asciz	"EventGroup_t"
	.byte	0x1
	.byte	0x75
	.4byte	0x486
	.uleb128 0xf
	.byte	0x1
	.asciz	"xEventGroupCreateStatic"
	.byte	0x1
	.byte	0x87
	.byte	0x1
	.4byte	0x459
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0x586
	.uleb128 0x10
	.asciz	"pxEventGroupBuffer"
	.byte	0x1
	.byte	0x87
	.4byte	0x586
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x11
	.4byte	.LASF4
	.byte	0x1
	.byte	0x89
	.4byte	0x58c
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0xe
	.byte	0x2
	.4byte	0x305
	.uleb128 0xe
	.byte	0x2
	.4byte	0x517
	.uleb128 0xf
	.byte	0x1
	.asciz	"xEventGroupCreate"
	.byte	0x1
	.byte	0xae
	.byte	0x1
	.4byte	0x459
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.4byte	0x5ca
	.uleb128 0x11
	.4byte	.LASF4
	.byte	0x1
	.byte	0xb0
	.4byte	0x58c
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0xf
	.byte	0x1
	.asciz	"xEventGroupSync"
	.byte	0x1
	.byte	0xd0
	.byte	0x1
	.4byte	0x473
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.4byte	0x67f
	.uleb128 0x12
	.4byte	.LASF5
	.byte	0x1
	.byte	0xd0
	.4byte	0x459
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x12
	.4byte	.LASF6
	.byte	0x1
	.byte	0xd0
	.4byte	0x67f
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x12
	.4byte	.LASF7
	.byte	0x1
	.byte	0xd0
	.4byte	0x67f
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x12
	.4byte	.LASF8
	.byte	0x1
	.byte	0xd0
	.4byte	0x1b5
	.byte	0x2
	.byte	0x7e
	.sleb128 16
	.uleb128 0x13
	.asciz	"uxOriginalBitValue"
	.byte	0x1
	.byte	0xd2
	.4byte	0x473
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x11
	.4byte	.LASF9
	.byte	0x1
	.byte	0xd2
	.4byte	0x473
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF4
	.byte	0x1
	.byte	0xd3
	.4byte	0x58c
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x11
	.4byte	.LASF10
	.byte	0x1
	.byte	0xd4
	.4byte	0x183
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x11
	.4byte	.LASF11
	.byte	0x1
	.byte	0xd5
	.4byte	0x183
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.uleb128 0x14
	.4byte	0x473
	.uleb128 0x15
	.byte	0x1
	.asciz	"xEventGroupWaitBits"
	.byte	0x1
	.2byte	0x144
	.byte	0x1
	.4byte	0x473
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5e
	.4byte	0x778
	.uleb128 0x16
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x144
	.4byte	0x459
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x16
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x144
	.4byte	0x67f
	.byte	0x2
	.byte	0x7e
	.sleb128 16
	.uleb128 0x17
	.asciz	"xClearOnExit"
	.byte	0x1
	.2byte	0x144
	.4byte	0x778
	.byte	0x2
	.byte	0x7e
	.sleb128 18
	.uleb128 0x16
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x144
	.4byte	0x778
	.byte	0x2
	.byte	0x7e
	.sleb128 20
	.uleb128 0x16
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x144
	.4byte	0x1b5
	.byte	0x2
	.byte	0x7e
	.sleb128 22
	.uleb128 0x18
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x146
	.4byte	0x58c
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x18
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x147
	.4byte	0x473
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x147
	.4byte	0x473
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x148
	.4byte	0x183
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x18
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x148
	.4byte	0x183
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x18
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x149
	.4byte	0x183
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x19
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x18
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x158
	.4byte	0x67f
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.4byte	0x183
	.uleb128 0x15
	.byte	0x1
	.asciz	"xEventGroupClearBits"
	.byte	0x1
	.2byte	0x1d8
	.byte	0x1
	.4byte	0x473
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5e
	.4byte	0x7e7
	.uleb128 0x16
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x459
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x16
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x67f
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x18
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x1da
	.4byte	0x58c
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1db
	.4byte	0x473
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.asciz	"xEventGroupGetBitsFromISR"
	.byte	0x1
	.2byte	0x202
	.byte	0x1
	.4byte	0x473
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5e
	.4byte	0x869
	.uleb128 0x16
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x202
	.4byte	0x459
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1a
	.asciz	"uxSavedInterruptStatus"
	.byte	0x1
	.2byte	0x204
	.4byte	0x1a2
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x205
	.4byte	0x58c
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x206
	.4byte	0x473
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.asciz	"xEventGroupSetBits"
	.byte	0x1
	.2byte	0x212
	.byte	0x1
	.4byte	0x473
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5e
	.4byte	0x95e
	.uleb128 0x16
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x212
	.4byte	0x459
	.byte	0x2
	.byte	0x7e
	.sleb128 18
	.uleb128 0x16
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x212
	.4byte	0x67f
	.byte	0x2
	.byte	0x7e
	.sleb128 20
	.uleb128 0x1a
	.asciz	"pxListItem"
	.byte	0x1
	.2byte	0x214
	.4byte	0x445
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x214
	.4byte	0x445
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x1a
	.asciz	"pxListEnd"
	.byte	0x1
	.2byte	0x215
	.4byte	0x95e
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x1a
	.asciz	"pxList"
	.byte	0x1
	.2byte	0x216
	.4byte	0x969
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x18
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x217
	.4byte	0x473
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x1a
	.asciz	"uxBitsWaitedFor"
	.byte	0x1
	.2byte	0x217
	.4byte	0x473
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x18
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x217
	.4byte	0x473
	.byte	0x2
	.byte	0x7e
	.sleb128 16
	.uleb128 0x18
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x218
	.4byte	0x58c
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x1a
	.asciz	"xMatchFound"
	.byte	0x1
	.2byte	0x219
	.4byte	0x183
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.uleb128 0xe
	.byte	0x2
	.4byte	0x964
	.uleb128 0x14
	.4byte	0x38c
	.uleb128 0xe
	.byte	0x2
	.4byte	0x44b
	.uleb128 0x1b
	.byte	0x1
	.asciz	"vEventGroupDelete"
	.byte	0x1
	.2byte	0x270
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x5e
	.4byte	0x9d5
	.uleb128 0x16
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x270
	.4byte	0x459
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x18
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x272
	.4byte	0x58c
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1a
	.asciz	"pxTasksWaitingForBits"
	.byte	0x1
	.2byte	0x273
	.4byte	0x9d5
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0xe
	.byte	0x2
	.4byte	0x9db
	.uleb128 0x14
	.4byte	0x44b
	.uleb128 0x1b
	.byte	0x1
	.asciz	"vEventGroupSetBitsCallback"
	.byte	0x1
	.2byte	0x29c
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x5e
	.4byte	0xa36
	.uleb128 0x16
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x29c
	.4byte	0xb1
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x17
	.asciz	"ulBitsToSet"
	.byte	0x1
	.2byte	0x29c
	.4byte	0xa36
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x14
	.4byte	0x156
	.uleb128 0x1b
	.byte	0x1
	.asciz	"vEventGroupClearBitsCallback"
	.byte	0x1
	.2byte	0x2a4
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x5e
	.4byte	0xa95
	.uleb128 0x16
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x2a4
	.4byte	0xb1
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x17
	.asciz	"ulBitsToClear"
	.byte	0x1
	.2byte	0x2a4
	.4byte	0xa36
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x1c
	.asciz	"prvTestWaitCondition"
	.byte	0x1
	.2byte	0x2aa
	.byte	0x1
	.4byte	0x183
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x5e
	.4byte	0xafe
	.uleb128 0x16
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x2aa
	.4byte	0x67f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x16
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x2aa
	.4byte	0x67f
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x16
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x2aa
	.4byte	0x778
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x18
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x2ac
	.4byte	0x183
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"uxEventGroupGetNumber"
	.byte	0x1
	.2byte	0x2de
	.byte	0x1
	.4byte	0x1a2
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x1
	.byte	0x5e
	.uleb128 0x16
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x2de
	.4byte	0xb1
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1a
	.asciz	"xReturn"
	.byte	0x1
	.2byte	0x2e0
	.4byte	0x1a2
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x2e1
	.4byte	0x58c
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
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
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x10
	.uleb128 0x5
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
	.uleb128 0x11
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x12
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
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
	.uleb128 0x1c
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
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x12a
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xb5b
	.4byte	0x52b
	.asciz	"xEventGroupCreateStatic"
	.4byte	0x592
	.asciz	"xEventGroupCreate"
	.4byte	0x5ca
	.asciz	"xEventGroupSync"
	.4byte	0x684
	.asciz	"xEventGroupWaitBits"
	.4byte	0x77d
	.asciz	"xEventGroupClearBits"
	.4byte	0x7e7
	.asciz	"xEventGroupGetBitsFromISR"
	.4byte	0x869
	.asciz	"xEventGroupSetBits"
	.4byte	0x96f
	.asciz	"vEventGroupDelete"
	.4byte	0x9e0
	.asciz	"vEventGroupSetBitsCallback"
	.4byte	0xa3b
	.asciz	"vEventGroupClearBitsCallback"
	.4byte	0xafe
	.asciz	"uxEventGroupGetNumber"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x193
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xb5b
	.4byte	0x126
	.asciz	"uint8_t"
	.4byte	0x146
	.asciz	"uint16_t"
	.4byte	0x156
	.asciz	"uint32_t"
	.4byte	0x183
	.asciz	"BaseType_t"
	.4byte	0x1a2
	.asciz	"UBaseType_t"
	.4byte	0x1b5
	.asciz	"TickType_t"
	.4byte	0x1c7
	.asciz	"xSTATIC_MINI_LIST_ITEM"
	.4byte	0x21a
	.asciz	"StaticMiniListItem_t"
	.4byte	0x237
	.asciz	"xSTATIC_LIST"
	.4byte	0x284
	.asciz	"StaticList_t"
	.4byte	0x299
	.asciz	"xSTATIC_EVENT_GROUP"
	.4byte	0x305
	.asciz	"StaticEventGroup_t"
	.4byte	0x320
	.asciz	"xLIST_ITEM"
	.4byte	0x38c
	.asciz	"ListItem_t"
	.4byte	0x39e
	.asciz	"xMINI_LIST_ITEM"
	.4byte	0x3e1
	.asciz	"MiniListItem_t"
	.4byte	0x3f7
	.asciz	"xLIST"
	.4byte	0x44b
	.asciz	"List_t"
	.4byte	0x459
	.asciz	"EventGroupHandle_t"
	.4byte	0x473
	.asciz	"EventBits_t"
	.4byte	0x486
	.asciz	"xEventGroupDefinition"
	.4byte	0x517
	.asciz	"EventGroup_t"
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
.LASF6:
	.asciz	"uxBitsToSet"
.LASF12:
	.asciz	"xWaitForAllBits"
.LASF11:
	.asciz	"xTimeoutOccurred"
.LASF7:
	.asciz	"uxBitsToWaitFor"
.LASF17:
	.asciz	"pvEventGroup"
.LASF13:
	.asciz	"uxControlBits"
.LASF0:
	.asciz	"pvDummy2"
.LASF5:
	.asciz	"xEventGroup"
.LASF4:
	.asciz	"pxEventBits"
.LASF15:
	.asciz	"uxCurrentEventBits"
.LASF3:
	.asciz	"pxPrevious"
.LASF1:
	.asciz	"xItemValue"
.LASF16:
	.asciz	"uxBitsToClear"
.LASF8:
	.asciz	"xTicksToWait"
.LASF10:
	.asciz	"xAlreadyYielded"
.LASF14:
	.asciz	"xWaitConditionMet"
.LASF2:
	.asciz	"pxNext"
.LASF9:
	.asciz	"uxReturn"
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
