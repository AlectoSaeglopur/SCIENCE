	.file "C:\\Users\\Filippo\\Desktop\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\..\\source\\event_groups.c"
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
	.global	_xEventGroupCreate	; export
	.type	_xEventGroupCreate,@function
_xEventGroupCreate:
.LFB0:
	.file 1 "../../source/event_groups.c"
	.loc 1 175 0
	.set ___PA___,1
	mov	w8,[w15++]
.LCFI0:
	.loc 1 179 0
	mov	#12,w0
	rcall	_pvPortMalloc
	mov	w0,w8
	.loc 1 181 0
	cp0	w8
	.set ___BP___,21
	bra	z,.L2
	.loc 1 183 0
	mov	w8,w0
	clr	[w0++]
	.loc 1 184 0
	rcall	_vListInitialise
.L2:
	.loc 1 203 0
	mov	w8,w0
	mov	[--w15],w8
	return	
	.set ___PA___,0
.LFE0:
	.size	_xEventGroupCreate, .-_xEventGroupCreate
	.align	2
	.global	_xEventGroupWaitBits	; export
	.type	_xEventGroupWaitBits,@function
_xEventGroupWaitBits:
.LFB2:
	.loc 1 325 0
	.set ___PA___,0
	mov.d	w8,[w15++]
.LCFI1:
	mov.d	w10,[w15++]
.LCFI2:
	mov.d	w12,[w15++]
.LCFI3:
	mov	w0,w9
	mov	w1,w8
	mov.d	w2,w10
	mov	w4,w13
	.loc 1 342 0
	rcall	_vTaskSuspendAll
.LBB7:
	.loc 1 344 0
	mov	[w9],w12
.LBB9:
.LBB10:
	.loc 1 686 0
	cp0	w11
	.set ___BP___,50
	bra	nz,.L6
	.loc 1 690 0
	and	w8,w12,w0
	.set ___BP___,50
	bra	z,.L8
.L7:
.LBE10:
.LBE9:
	.loc 1 357 0
	cp0	w10
	.set ___BP___,50
	bra	z,.L9
	.loc 1 359 0
	com	w8,w8
	and	w8,w12,[w9]
.L9:
.LBE7:
	.loc 1 409 0
	rcall	_xTaskResumeAll
	.loc 1 344 0
	mov	w12,w0
	.loc 1 469 0
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
.L31:
	.set ___PA___,0
.L6:
.LBB12:
.LBB8:
.LBB11:
	.loc 1 703 0
	and	w8,w12,w0
	sub	w8,w0,[w15]
	.set ___BP___,28
	bra	z,.L7
.L8:
.LBE11:
.LBE8:
	.loc 1 366 0
	cp0	w13
	.set ___BP___,50
	bra	z,.L9
	.loc 1 380 0
	mov	#256,w1
	.loc 1 378 0
	cp0	w10
	.set ___BP___,50
	bra	z,.L26
	.loc 1 387 0
	cp0	w11
	.set ___BP___,50
	bra	z,.L12
.L29:
	.loc 1 389 0
	bset	w1,#10
.L12:
	.loc 1 399 0
	ior	w8,w1,w1
	inc2	w9,w0
	mov	w13,w2
	rcall	_vTaskPlaceOnUnorderedEventList
.LBE12:
	.loc 1 409 0
	rcall	_xTaskResumeAll
	.loc 1 413 0
	cp0	w0
	.set ___BP___,50
	bra	nz,.L14
	.loc 1 415 0
; 415 "../../source/event_groups.c" 1
	CALL _vPortYield			
NOP					  
.L14:
	.loc 1 426 0
	rcall	_uxTaskResetEventItemValue
	mov	w0,w12
	.loc 1 428 0
	btst	w12,#9
	.set ___BP___,29
	bra	z,.L27
	.loc 1 464 0
	mov	w12,w0
	and	#255,w0
.L28:
	.loc 1 469 0
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L31
.L27:
	.loc 1 430 0
	rcall	_vPortEnterCritical
	.loc 1 433 0
	mov	[w9],w12
.LBB13:
.LBB14:
	.loc 1 686 0
	cp0	w11
	.set ___BP___,50
	bra	nz,.L17
	.loc 1 690 0
	and	w8,w12,w0
	.set ___BP___,50
	bra	z,.L19
.L18:
.LBE14:
.LBE13:
	.loc 1 439 0
	cp0	w10
	.set ___BP___,50
	bra	z,.L19
	.loc 1 441 0
	com	w8,w8
	and	w8,w12,[w9]
.L19:
	.loc 1 453 0
	rcall	_vPortExitCritical
.L30:
	.loc 1 464 0
	mov	w12,w0
	and	#255,w0
	bra	.L28
.L26:
.LBB16:
	.loc 1 327 0
	clr	w1
	.loc 1 387 0
	cp0	w11
	.set ___BP___,50
	bra	z,.L12
	bra	.L29
.L17:
.LBE16:
.LBB17:
.LBB15:
	.loc 1 703 0
	and	w8,w12,w0
	sub	w8,w0,[w15]
	.set ___BP___,28
	bra	z,.L18
.LBE15:
.LBE17:
	.loc 1 453 0
	rcall	_vPortExitCritical
	bra	.L30
.LFE2:
	.size	_xEventGroupWaitBits, .-_xEventGroupWaitBits
	.align	2
	.global	_xEventGroupClearBits	; export
	.type	_xEventGroupClearBits,@function
_xEventGroupClearBits:
.LFB3:
	.loc 1 473 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI4:
	mov	w10,[w15++]
.LCFI5:
	mov	w0,w8
	mov	w1,w10
	.loc 1 482 0
	rcall	_vPortEnterCritical
	.loc 1 488 0
	mov	[w8],w9
	.loc 1 491 0
	com	w10,w1
	and	w1,w9,[w8]
	.loc 1 493 0
	rcall	_vPortExitCritical
	.loc 1 496 0
	mov	w9,w0
	mov	[--w15],w10
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.LFE3:
	.size	_xEventGroupClearBits, .-_xEventGroupClearBits
	.align	2
	.global	_xEventGroupGetBitsFromISR	; export
	.type	_xEventGroupGetBitsFromISR,@function
_xEventGroupGetBitsFromISR:
.LFB4:
	.loc 1 515 0
	.set ___PA___,1
	.loc 1 515 0
	mov	[w0],w0
	.loc 1 527 0
	return	
	.set ___PA___,0
.LFE4:
	.size	_xEventGroupGetBitsFromISR, .-_xEventGroupGetBitsFromISR
	.align	2
	.global	_xEventGroupSetBits	; export
	.type	_xEventGroupSetBits,@function
_xEventGroupSetBits:
.LFB5:
	.loc 1 531 0
	.set ___PA___,1
	mov.d	w8,[w15++]
.LCFI6:
	mov.d	w10,[w15++]
.LCFI7:
	mov.d	w12,[w15++]
.LCFI8:
	mov	w0,w9
	mov	w1,w8
	.loc 1 545 0
	add	w9,#6,w10
	.loc 1 546 0
	rcall	_vTaskSuspendAll
	.loc 1 550 0
	mov	[w9+8],w0
	.loc 1 553 0
	ior	w8,[w9],w1
	mov	w1,[w9]
	.loc 1 556 0
	setm	w13
	sub	w10,w0,[w15]
	.set ___BP___,9
	bra	z,.L40
	clr	w13
	.loc 1 563 0
	mov	#-256,w12
	.loc 1 566 0
	mov	#1024,w11
	.loc 1 558 0
	mov	[w0+2],w8
	.loc 1 559 0
	mov	[w0],w2
	.loc 1 563 0
	and	w2,w12,w3
	.loc 1 564 0
	and	#255,w2
	.loc 1 566 0
	and	w3,w11,w4
	.set ___BP___,50
	bra	nz,.L41
.L50:
	.loc 1 569 0
	and	w1,w2,w4
	.set ___BP___,50
	bra	z,.L43
.L42:
	.loc 1 591 0
	btst	w3,#8
	.set ___BP___,50
	bra	z,.L44
	.loc 1 593 0
	ior	w2,w13,w13
.L44:
	.loc 1 605 0
	bset	w1,#9
	rcall	_xTaskRemoveFromUnorderedEventList
	mov	[w9],w1
.L43:
	.loc 1 556 0
	sub	w10,w8,[w15]
	.set ___BP___,9
	bra	z,.L45
.L51:
	mov	[w9],w1
	mov	w8,w0
	.loc 1 558 0
	mov	[w0+2],w8
	.loc 1 559 0
	mov	[w0],w2
	.loc 1 563 0
	and	w2,w12,w3
	.loc 1 564 0
	and	#255,w2
	.loc 1 566 0
	and	w3,w11,w4
	.set ___BP___,50
	bra	z,.L50
.L41:
	.loc 1 578 0
	and	w1,w2,w4
	sub	w4,w2,[w15]
	.set ___BP___,28
	bra	z,.L42
	.loc 1 556 0
	sub	w10,w8,[w15]
	.set ___BP___,91
	bra	nz,.L51
.L45:
	com	w13,w13
.L40:
	.loc 1 616 0
	and	w13,w1,[w9]
	.loc 1 618 0
	rcall	_xTaskResumeAll
	mov	[w9],w0
	.loc 1 621 0
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
	.set ___PA___,0
.LFE5:
	.size	_xEventGroupSetBits, .-_xEventGroupSetBits
	.align	2
	.global	_xEventGroupSync	; export
	.type	_xEventGroupSync,@function
_xEventGroupSync:
.LFB1:
	.loc 1 209 0
	.set ___PA___,0
	mov.d	w8,[w15++]
.LCFI9:
	mov.d	w10,[w15++]
.LCFI10:
	mov	w12,[w15++]
.LCFI11:
	mov	w0,w8
	mov	w1,w10
	mov	w2,w9
	mov	w3,w12
	.loc 1 223 0
	rcall	_vTaskSuspendAll
	.loc 1 225 0
	mov	[w8],w11
	.loc 1 227 0
	mov	w10,w1
	mov	w8,w0
	rcall	_xEventGroupSetBits
	.loc 1 229 0
	ior	w11,w10,w10
	and	w9,w10,w0
	sub	w0,w9,[w15]
	.set ___BP___,28
	bra	z,.L63
	.loc 1 242 0
	cp0	w12
	.set ___BP___,29
	bra	nz,.L64
	.loc 1 261 0
	mov	[w8],w10
	.loc 1 265 0
	rcall	_xTaskResumeAll
.L59:
	.loc 1 321 0
	mov	w10,w0
	mov	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
.L69:
	.set ___PA___,0
.L63:
	.loc 1 236 0
	com	w0,w0
	and	w0,[w8],[w8]
	.loc 1 265 0
	rcall	_xTaskResumeAll
	bra	.L59
.L64:
	.loc 1 249 0
	mov	#1280,w1
	ior	w1,w9,w1
	inc2	w8,w0
	mov	w12,w2
	rcall	_vTaskPlaceOnUnorderedEventList
	.loc 1 265 0
	rcall	_xTaskResumeAll
	.loc 1 269 0
	cp0	w0
	.set ___BP___,50
	bra	nz,.L58
	.loc 1 271 0
; 271 "../../source/event_groups.c" 1
	CALL _vPortYield			
NOP					  
.L58:
	.loc 1 282 0
	rcall	_uxTaskResetEventItemValue
	mov	w0,w10
	.loc 1 284 0
	btst	w10,#9
	.set ___BP___,29
	bra	z,.L65
	.loc 1 315 0
	and	#255,w10
.L67:
	.loc 1 321 0
	mov	w10,w0
	mov	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	return	
	bra	.L69
.L65:
	.loc 1 287 0
	rcall	_vPortEnterCritical
	.loc 1 289 0
	mov	[w8],w10
	.loc 1 295 0
	and	w9,w10,w0
	sub	w0,w9,[w15]
	.set ___BP___,28
	bra	z,.L66
	.loc 1 304 0
	rcall	_vPortExitCritical
.L68:
	.loc 1 315 0
	and	#255,w10
	bra	.L67
.L66:
	.loc 1 297 0
	com	w9,w9
	and	w9,w10,[w8]
	.loc 1 304 0
	rcall	_vPortExitCritical
	bra	.L68
.LFE1:
	.size	_xEventGroupSync, .-_xEventGroupSync
	.align	2
	.global	_vEventGroupDelete	; export
	.type	_vEventGroupDelete,@function
_vEventGroupDelete:
.LFB6:
	.loc 1 625 0
	.set ___PA___,1
	mov	w8,[w15++]
.LCFI12:
	mov	w0,w8
	.loc 1 629 0
	rcall	_vTaskSuspendAll
	.loc 1 633 0
	mov	[w8+2],w0
	cp0	w0
	.set ___BP___,9
	bra	z,.L72
.L74:
	.loc 1 638 0
	mov	[w8+8],w0
	mov	#512,w1
	rcall	_xTaskRemoveFromUnorderedEventList
	.loc 1 633 0
	mov	[w8+2],w0
	cp0	w0
	.set ___BP___,91
	bra	nz,.L74
.L72:
	.loc 1 645 0
	mov	w8,w0
	rcall	_vPortFree
	.loc 1 662 0
	rcall	_xTaskResumeAll
	.loc 1 663 0
	mov	[--w15],w8
	return	
	.set ___PA___,0
.LFE6:
	.size	_vEventGroupDelete, .-_vEventGroupDelete
	.align	2
	.global	_vEventGroupSetBitsCallback	; export
	.type	_vEventGroupSetBitsCallback,@function
_vEventGroupSetBitsCallback:
.LFB7:
	.loc 1 669 0
	.set ___PA___,1
	mov	w2,w1
	.loc 1 670 0
	bra	_xEventGroupSetBits
	.loc 1 671 0
	.set ___PA___,0
.LFE7:
	.size	_vEventGroupSetBitsCallback, .-_vEventGroupSetBitsCallback
	.align	2
	.global	_vEventGroupClearBitsCallback	; export
	.type	_vEventGroupClearBitsCallback,@function
_vEventGroupClearBitsCallback:
.LFB8:
	.loc 1 677 0
	.set ___PA___,1
	mov	w2,w1
	.loc 1 678 0
	bra	_xEventGroupClearBits
	.loc 1 679 0
	.set ___PA___,0
.LFE8:
	.size	_vEventGroupClearBitsCallback, .-_vEventGroupClearBitsCallback
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
	.byte	0x13
	.sleb128 -3
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI1-.LFB2
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0x13
	.sleb128 -6
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0x13
	.sleb128 -8
	.byte	0x8c
	.uleb128 0x6
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
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI4-.LFB3
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0x13
	.sleb128 -5
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.align	4
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI6-.LFB5
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0x13
	.sleb128 -6
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0x13
	.sleb128 -8
	.byte	0x8c
	.uleb128 0x6
	.byte	0x8a
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x2
	.align	4
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI9-.LFB1
	.byte	0x13
	.sleb128 -4
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0x13
	.sleb128 -6
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
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
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI12-.LFB6
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
	.align	4
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.align	4
.LEFDE16:
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 3 "../../source/include/../../Source/portable/MPLAB/PIC24_dsPIC/portmacro.h"
	.file 4 "../../source/include/list.h"
	.file 5 "../../source/include/event_groups.h"
	.section	.debug_info,info
	.4byte	0x8e2
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../../source/event_groups.c"
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
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x2
	.byte	0x31
	.4byte	0xf2
	.uleb128 0x4
	.asciz	"uint32_t"
	.byte	0x2
	.byte	0x37
	.4byte	0x155
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x4
	.asciz	"BaseType_t"
	.byte	0x3
	.byte	0x61
	.4byte	0x17c
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"UBaseType_t"
	.byte	0x3
	.byte	0x62
	.4byte	0xdc
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x3
	.byte	0x65
	.4byte	0x135
	.uleb128 0x5
	.asciz	"xLIST_ITEM"
	.byte	0xa
	.byte	0x4
	.byte	0xb5
	.4byte	0x214
	.uleb128 0x6
	.4byte	.LASF0
	.byte	0x4
	.byte	0xb8
	.4byte	0x19c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF1
	.byte	0x4
	.byte	0xb9
	.4byte	0x214
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.4byte	.LASF2
	.byte	0x4
	.byte	0xba
	.4byte	0x214
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.asciz	"pvOwner"
	.byte	0x4
	.byte	0xbb
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x7
	.asciz	"pvContainer"
	.byte	0x4
	.byte	0xbc
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x1ae
	.uleb128 0x4
	.asciz	"ListItem_t"
	.byte	0x4
	.byte	0xbf
	.4byte	0x1ae
	.uleb128 0x5
	.asciz	"xMINI_LIST_ITEM"
	.byte	0x6
	.byte	0x4
	.byte	0xc1
	.4byte	0x26f
	.uleb128 0x6
	.4byte	.LASF0
	.byte	0x4
	.byte	0xc4
	.4byte	0x19c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF1
	.byte	0x4
	.byte	0xc5
	.4byte	0x214
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.4byte	.LASF2
	.byte	0x4
	.byte	0xc6
	.4byte	0x214
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.asciz	"MiniListItem_t"
	.byte	0x4
	.byte	0xc8
	.4byte	0x22c
	.uleb128 0x5
	.asciz	"xLIST"
	.byte	0xa
	.byte	0x4
	.byte	0xcd
	.4byte	0x2d3
	.uleb128 0x7
	.asciz	"uxNumberOfItems"
	.byte	0x4
	.byte	0xd0
	.4byte	0x189
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"pxIndex"
	.byte	0x4
	.byte	0xd1
	.4byte	0x2d3
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x7
	.asciz	"xListEnd"
	.byte	0x4
	.byte	0xd2
	.4byte	0x26f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x21a
	.uleb128 0x4
	.asciz	"List_t"
	.byte	0x4
	.byte	0xd4
	.4byte	0x285
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x4
	.asciz	"EventGroupHandle_t"
	.byte	0x5
	.byte	0x7b
	.4byte	0xaf
	.uleb128 0x4
	.asciz	"EventBits_t"
	.byte	0x5
	.byte	0x85
	.4byte	0x19c
	.uleb128 0x5
	.asciz	"xEventGroupDefinition"
	.byte	0xc
	.byte	0x1
	.byte	0x69
	.4byte	0x370
	.uleb128 0x7
	.asciz	"uxEventBits"
	.byte	0x1
	.byte	0x6b
	.4byte	0x309
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"xTasksWaitingForBits"
	.byte	0x1
	.byte	0x6c
	.4byte	0x2d9
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x4
	.asciz	"EventGroup_t"
	.byte	0x1
	.byte	0x75
	.4byte	0x31c
	.uleb128 0x9
	.asciz	"prvTestWaitCondition"
	.byte	0x1
	.2byte	0x2aa
	.byte	0x1
	.4byte	0x16a
	.byte	0x1
	.4byte	0x3d8
	.uleb128 0xa
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x2aa
	.4byte	0x3d8
	.uleb128 0xa
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x2aa
	.4byte	0x3d8
	.uleb128 0xa
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x2aa
	.4byte	0x3dd
	.uleb128 0xb
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x2ac
	.4byte	0x16a
	.byte	0x0
	.uleb128 0xc
	.4byte	0x309
	.uleb128 0xc
	.4byte	0x16a
	.uleb128 0xd
	.byte	0x1
	.asciz	"xEventGroupCreate"
	.byte	0x1
	.byte	0xae
	.byte	0x1
	.4byte	0x2ef
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5f
	.4byte	0x419
	.uleb128 0xe
	.4byte	.LASF9
	.byte	0x1
	.byte	0xb0
	.4byte	0x419
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x370
	.uleb128 0xf
	.byte	0x1
	.asciz	"xEventGroupWaitBits"
	.byte	0x1
	.2byte	0x144
	.byte	0x1
	.4byte	0x309
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5f
	.4byte	0x55b
	.uleb128 0x10
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x144
	.4byte	0x2ef
	.byte	0x1
	.byte	0x59
	.uleb128 0x10
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x144
	.4byte	0x3d8
	.byte	0x1
	.byte	0x58
	.uleb128 0x11
	.asciz	"xClearOnExit"
	.byte	0x1
	.2byte	0x144
	.4byte	0x3dd
	.byte	0x1
	.byte	0x5a
	.uleb128 0x10
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x144
	.4byte	0x3dd
	.byte	0x1
	.byte	0x5b
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x144
	.4byte	0x19c
	.byte	0x1
	.byte	0x5d
	.uleb128 0xb
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x146
	.4byte	0x419
	.uleb128 0xb
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x147
	.4byte	0x309
	.uleb128 0x12
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x147
	.4byte	0x309
	.byte	0x1
	.byte	0x51
	.uleb128 0xb
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x148
	.4byte	0x16a
	.uleb128 0x12
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x148
	.4byte	0x16a
	.byte	0x1
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x149
	.4byte	0x16a
	.uleb128 0x13
	.4byte	.LBB7
	.4byte	.LBE7
	.4byte	0x52e
	.uleb128 0x12
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x158
	.4byte	0x3d8
	.byte	0x1
	.byte	0x5c
	.uleb128 0x14
	.4byte	0x384
	.4byte	.LBB9
	.4byte	.LBE9
	.uleb128 0x15
	.4byte	0x3bf
	.uleb128 0x15
	.4byte	0x3b3
	.uleb128 0x15
	.4byte	0x3a7
	.uleb128 0x16
	.4byte	.LBB10
	.4byte	.LBE10
	.uleb128 0x17
	.4byte	0x3cb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.4byte	0x384
	.4byte	.LBB13
	.4byte	.LBE13
	.uleb128 0x15
	.4byte	0x3bf
	.uleb128 0x15
	.4byte	0x3b3
	.uleb128 0x15
	.4byte	0x3a7
	.uleb128 0x16
	.4byte	.LBB14
	.4byte	.LBE14
	.uleb128 0x17
	.4byte	0x3cb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.byte	0x1
	.asciz	"xEventGroupClearBits"
	.byte	0x1
	.2byte	0x1d8
	.byte	0x1
	.4byte	0x309
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5f
	.4byte	0x5bf
	.uleb128 0x10
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x2ef
	.byte	0x1
	.byte	0x58
	.uleb128 0x10
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x3d8
	.byte	0x1
	.byte	0x5a
	.uleb128 0xb
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1da
	.4byte	0x419
	.uleb128 0x12
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x1db
	.4byte	0x309
	.byte	0x1
	.byte	0x59
	.byte	0x0
	.uleb128 0xf
	.byte	0x1
	.asciz	"xEventGroupGetBitsFromISR"
	.byte	0x1
	.2byte	0x202
	.byte	0x1
	.4byte	0x309
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5f
	.4byte	0x637
	.uleb128 0x10
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x202
	.4byte	0x2ef
	.byte	0x1
	.byte	0x50
	.uleb128 0x18
	.asciz	"uxSavedInterruptStatus"
	.byte	0x1
	.2byte	0x204
	.4byte	0x189
	.uleb128 0xb
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x205
	.4byte	0x419
	.uleb128 0xb
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x206
	.4byte	0x309
	.byte	0x0
	.uleb128 0xf
	.byte	0x1
	.asciz	"xEventGroupSetBits"
	.byte	0x1
	.2byte	0x212
	.byte	0x1
	.4byte	0x309
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5f
	.4byte	0x719
	.uleb128 0x10
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x212
	.4byte	0x2ef
	.byte	0x1
	.byte	0x59
	.uleb128 0x10
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x212
	.4byte	0x3d8
	.byte	0x1
	.byte	0x58
	.uleb128 0x19
	.asciz	"pxListItem"
	.byte	0x1
	.2byte	0x214
	.4byte	0x2d3
	.byte	0x1
	.byte	0x50
	.uleb128 0x12
	.4byte	.LASF1
	.byte	0x1
	.2byte	0x214
	.4byte	0x2d3
	.byte	0x1
	.byte	0x58
	.uleb128 0x19
	.asciz	"pxListEnd"
	.byte	0x1
	.2byte	0x215
	.4byte	0x719
	.byte	0x1
	.byte	0x5a
	.uleb128 0x18
	.asciz	"pxList"
	.byte	0x1
	.2byte	0x216
	.4byte	0x724
	.uleb128 0x12
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x217
	.4byte	0x309
	.byte	0x1
	.byte	0x5d
	.uleb128 0x18
	.asciz	"uxBitsWaitedFor"
	.byte	0x1
	.2byte	0x217
	.4byte	0x309
	.uleb128 0x12
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x217
	.4byte	0x309
	.byte	0x1
	.byte	0x53
	.uleb128 0xb
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x218
	.4byte	0x419
	.uleb128 0x18
	.asciz	"xMatchFound"
	.byte	0x1
	.2byte	0x219
	.4byte	0x16a
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x71f
	.uleb128 0xc
	.4byte	0x21a
	.uleb128 0x8
	.byte	0x2
	.4byte	0x2d9
	.uleb128 0xd
	.byte	0x1
	.asciz	"xEventGroupSync"
	.byte	0x1
	.byte	0xd0
	.byte	0x1
	.4byte	0x309
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5f
	.4byte	0x7d0
	.uleb128 0x1a
	.4byte	.LASF6
	.byte	0x1
	.byte	0xd0
	.4byte	0x2ef
	.byte	0x1
	.byte	0x58
	.uleb128 0x1a
	.4byte	.LASF15
	.byte	0x1
	.byte	0xd0
	.4byte	0x3d8
	.byte	0x1
	.byte	0x5a
	.uleb128 0x1a
	.4byte	.LASF4
	.byte	0x1
	.byte	0xd0
	.4byte	0x3d8
	.byte	0x1
	.byte	0x59
	.uleb128 0x1a
	.4byte	.LASF7
	.byte	0x1
	.byte	0xd0
	.4byte	0x19c
	.byte	0x1
	.byte	0x5c
	.uleb128 0x1b
	.asciz	"uxOriginalBitValue"
	.byte	0x1
	.byte	0xd2
	.4byte	0x309
	.byte	0x1
	.byte	0x5b
	.uleb128 0x1c
	.4byte	.LASF10
	.byte	0x1
	.byte	0xd2
	.4byte	0x309
	.uleb128 0x1c
	.4byte	.LASF9
	.byte	0x1
	.byte	0xd3
	.4byte	0x419
	.uleb128 0xe
	.4byte	.LASF12
	.byte	0x1
	.byte	0xd4
	.4byte	0x16a
	.byte	0x1
	.byte	0x50
	.uleb128 0x1c
	.4byte	.LASF13
	.byte	0x1
	.byte	0xd5
	.4byte	0x16a
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"vEventGroupDelete"
	.byte	0x1
	.2byte	0x270
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5f
	.4byte	0x831
	.uleb128 0x10
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x270
	.4byte	0x2ef
	.byte	0x1
	.byte	0x50
	.uleb128 0x12
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x272
	.4byte	0x419
	.byte	0x1
	.byte	0x58
	.uleb128 0x18
	.asciz	"pxTasksWaitingForBits"
	.byte	0x1
	.2byte	0x273
	.4byte	0x831
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x837
	.uleb128 0xc
	.4byte	0x2d9
	.uleb128 0x1d
	.byte	0x1
	.asciz	"vEventGroupSetBitsCallback"
	.byte	0x1
	.2byte	0x29c
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x5f
	.4byte	0x88e
	.uleb128 0x10
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x29c
	.4byte	0xaf
	.byte	0x1
	.byte	0x50
	.uleb128 0x1e
	.asciz	"ulBitsToSet"
	.byte	0x1
	.2byte	0x29c
	.4byte	0x88e
	.byte	0x0
	.uleb128 0xc
	.4byte	0x145
	.uleb128 0x1f
	.byte	0x1
	.asciz	"vEventGroupClearBitsCallback"
	.byte	0x1
	.2byte	0x2a4
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x5f
	.uleb128 0x10
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x2a4
	.4byte	0xaf
	.byte	0x1
	.byte	0x50
	.uleb128 0x1e
	.asciz	"ulBitsToClear"
	.byte	0x1
	.2byte	0x2a4
	.4byte	0x88e
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1f
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
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0xf4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x8e6
	.4byte	0x3e2
	.asciz	"xEventGroupCreate"
	.4byte	0x41f
	.asciz	"xEventGroupWaitBits"
	.4byte	0x55b
	.asciz	"xEventGroupClearBits"
	.4byte	0x5bf
	.asciz	"xEventGroupGetBitsFromISR"
	.4byte	0x637
	.asciz	"xEventGroupSetBits"
	.4byte	0x72a
	.asciz	"xEventGroupSync"
	.4byte	0x7d0
	.asciz	"vEventGroupDelete"
	.4byte	0x83c
	.asciz	"vEventGroupSetBitsCallback"
	.4byte	0x893
	.asciz	"vEventGroupClearBitsCallback"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x102
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x8e6
	.4byte	0x135
	.asciz	"uint16_t"
	.4byte	0x145
	.asciz	"uint32_t"
	.4byte	0x16a
	.asciz	"BaseType_t"
	.4byte	0x189
	.asciz	"UBaseType_t"
	.4byte	0x19c
	.asciz	"TickType_t"
	.4byte	0x1ae
	.asciz	"xLIST_ITEM"
	.4byte	0x21a
	.asciz	"ListItem_t"
	.4byte	0x22c
	.asciz	"xMINI_LIST_ITEM"
	.4byte	0x26f
	.asciz	"MiniListItem_t"
	.4byte	0x285
	.asciz	"xLIST"
	.4byte	0x2d9
	.asciz	"List_t"
	.4byte	0x2ef
	.asciz	"EventGroupHandle_t"
	.4byte	0x309
	.asciz	"EventBits_t"
	.4byte	0x31c
	.asciz	"xEventGroupDefinition"
	.4byte	0x370
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
.LASF15:
	.asciz	"uxBitsToSet"
.LASF5:
	.asciz	"xWaitForAllBits"
.LASF13:
	.asciz	"xTimeoutOccurred"
.LASF4:
	.asciz	"uxBitsToWaitFor"
.LASF16:
	.asciz	"pvEventGroup"
.LASF11:
	.asciz	"uxControlBits"
.LASF2:
	.asciz	"pxPrevious"
.LASF6:
	.asciz	"xEventGroup"
.LASF9:
	.asciz	"pxEventBits"
.LASF3:
	.asciz	"uxCurrentEventBits"
.LASF0:
	.asciz	"xItemValue"
.LASF14:
	.asciz	"uxBitsToClear"
.LASF7:
	.asciz	"xTicksToWait"
.LASF12:
	.asciz	"xAlreadyYielded"
.LASF8:
	.asciz	"xWaitConditionMet"
.LASF1:
	.asciz	"pxNext"
.LASF10:
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
