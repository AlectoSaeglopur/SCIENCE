	.file "C:\\Users\\Filippo\\Downloads\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\..\\source\\portable\\MemMang\\heap_4.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
	.section	.bss,bss
	.type	_ucHeap,@object
	.size	_ucHeap, 5120
_ucHeap:
	.skip	5120
	.section	.const,psv,page
	.align	2
	.type	_xHeapStructSize,@object
	.size	_xHeapStructSize, 2
_xHeapStructSize:
	.word	4
	.section	.nbss,bss,near
	.align	2
	.type	_xStart,@object
	.size	_xStart, 4
_xStart:
	.skip	4
	.align	2
	.type	_pxEnd,@object
	.size	_pxEnd, 2
_pxEnd:
	.skip	2
	.align	2
	.type	_xFreeBytesRemaining,@object
	.size	_xFreeBytesRemaining, 2
_xFreeBytesRemaining:
	.skip	2
	.align	2
	.type	_xMinimumEverFreeBytesRemaining,@object
	.size	_xMinimumEverFreeBytesRemaining, 2
_xMinimumEverFreeBytesRemaining:
	.skip	2
	.align	2
	.type	_xBlockAllocatedBit,@object
	.size	_xBlockAllocatedBit, 2
_xBlockAllocatedBit:
	.skip	2
	.section	.text,code
	.align	2
	.global	_pvPortMalloc	; export
	.type	_pvPortMalloc,@function
_pvPortMalloc:
.LFB0:
	.file 1 "../../source/portable/MemMang/heap_4.c"
	.loc 1 156 0
	.set ___PA___,1
	lnk	#10
.LCFI0:
	mov	w0,[w14+8]
	.loc 1 158 0
	clr	w0
	mov	w0,[w14+4]
	.loc 1 160 0
	rcall	_vTaskSuspendAll
	.loc 1 164 0
	mov	_pxEnd,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L2
	.loc 1 166 0
	rcall	_prvHeapInit
.L2:
	.loc 1 177 0
	mov	_xBlockAllocatedBit,w1
	mov	[w14+8],w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L3
	.loc 1 181 0
	mov	[w14+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L4
	.loc 1 183 0
	mov	_xHeapStructSize,w0
	mov	[w14+8],w1
	add	w1,w0,w0
	mov	w0,[w14+8]
	.loc 1 187 0
	mov	[w14+8],w0
	and	w0,#1,w0
	mov.b	w0,w0
	cp0.b	w0
	.set ___BP___,0
	bra	z,.L4
	.loc 1 190 0
	mov	[w14+8],w0
	bclr	w0,#0
	inc2	w0,w0
	mov	w0,[w14+8]
.L4:
	.loc 1 203 0
	mov	[w14+8],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L3
	mov	_xFreeBytesRemaining,w0
	mov	[w14+8],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	gtu,.L3
	.loc 1 207 0
	mov	#_xStart,w0
	mov	w0,[w14+2]
	.loc 1 208 0
	mov	_xStart,w1
	mov	w1,[w14]
	.loc 1 209 0
	bra	.L5
.L7:
	.loc 1 211 0
	mov	[w14],w1
	mov	w1,[w14+2]
	.loc 1 212 0
	mov	[w14],w0
	mov	[w0],[w14]
.L5:
	.loc 1 209 0
	mov	[w14],w0
	mov	[w0+2],w1
	mov	[w14+8],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L6
	mov	[w14],w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L7
.L6:
	.loc 1 217 0
	mov	_pxEnd,w0
	mov	[w14],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L3
	.loc 1 221 0
	mov	[w14+2],w0
	mov	[w0],w1
	mov	_xHeapStructSize,w0
	add	w1,w0,w0
	mov	w0,[w14+4]
	.loc 1 225 0
	mov	[w14],w0
	mov	[w0],w1
	mov	[w14+2],w0
	mov	w1,[w0]
	.loc 1 229 0
	mov	[w14],w0
	mov	[w0+2],w1
	mov	[w14+8],w0
	sub	w1,w0,w1
	mov	_xHeapStructSize,w0
	add	w0,w0,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L8
	.loc 1 235 0
	mov	[w14+8],w0
	add	w0,[w14],w0
	mov	w0,[w14+6]
	.loc 1 240 0
	mov	[w14],w0
	mov	[w0+2],w1
	mov	[w14+8],w0
	sub	w1,w0,w1
	mov	[w14+6],w0
	mov	w1,[w0+2]
	.loc 1 241 0
	mov	[w14],w0
	mov	[w14+8],w1
	mov	w1,[w0+2]
	.loc 1 244 0
	mov	[w14+6],w0
	rcall	_prvInsertBlockIntoFreeList
.L8:
	.loc 1 251 0
	mov	_xFreeBytesRemaining,w1
	mov	[w14],w0
	mov	[w0+2],w0
	sub	w1,w0,w0
	mov	w0,_xFreeBytesRemaining
	.loc 1 253 0
	mov	_xFreeBytesRemaining,w1
	mov	_xMinimumEverFreeBytesRemaining,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L9
	.loc 1 255 0
	mov	_xFreeBytesRemaining,w0
	mov	w0,_xMinimumEverFreeBytesRemaining
.L9:
	.loc 1 264 0
	mov	[w14],w0
	mov	[w0+2],w1
	mov	_xBlockAllocatedBit,w0
	ior	w0,w1,w1
	mov	[w14],w0
	mov	w1,[w0+2]
	.loc 1 265 0
	mov	[w14],w0
	clr	w1
	mov	w1,[w0]
.L3:
	.loc 1 284 0
	rcall	_xTaskResumeAll
	.loc 1 301 0
	mov	[w14+4],w0
	.loc 1 302 0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.size	_pvPortMalloc, .-_pvPortMalloc
	.align	2
	.global	_vPortFree	; export
	.type	_vPortFree,@function
_vPortFree:
.LFB1:
	.loc 1 306 0
	.set ___PA___,1
	lnk	#6
.LCFI1:
	mov	w0,[w14+4]
	.loc 1 307 0
	mov	[w14+4],w1
	mov	w1,[w14]
	.loc 1 310 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L10
	.loc 1 314 0
	mov	_xHeapStructSize,w0
	neg	w0,w0
	add	w0,[w14],[w14]
	.loc 1 317 0
	mov	[w14],w1
	mov	w1,[w14+2]
	.loc 1 323 0
	mov	[w14+2],w0
	mov	[w0+2],w1
	mov	_xBlockAllocatedBit,w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L10
	.loc 1 325 0
	mov	[w14+2],w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L10
	.loc 1 329 0
	mov	[w14+2],w0
	mov	[w0+2],w1
	mov	_xBlockAllocatedBit,w0
	com	w0,w0
	and	w1,w0,w1
	mov	[w14+2],w0
	mov	w1,[w0+2]
	.loc 1 331 0
	rcall	_vTaskSuspendAll
	.loc 1 334 0
	mov	[w14+2],w0
	mov	[w0+2],w1
	mov	_xFreeBytesRemaining,w0
	add	w1,w0,w0
	mov	w0,_xFreeBytesRemaining
	.loc 1 336 0
	mov	[w14+2],w0
	rcall	_prvInsertBlockIntoFreeList
	.loc 1 338 0
	rcall	_xTaskResumeAll
.L10:
	.loc 1 350 0
	ulnk	
	return	
	.set ___PA___,0
.LFE1:
	.size	_vPortFree, .-_vPortFree
	.align	2
	.global	_xPortGetFreeHeapSize	; export
	.type	_xPortGetFreeHeapSize,@function
_xPortGetFreeHeapSize:
.LFB2:
	.loc 1 354 0
	.set ___PA___,1
	lnk	#0
.LCFI2:
	.loc 1 355 0
	mov	_xFreeBytesRemaining,w0
	.loc 1 356 0
	ulnk	
	return	
	.set ___PA___,0
.LFE2:
	.size	_xPortGetFreeHeapSize, .-_xPortGetFreeHeapSize
	.align	2
	.global	_xPortGetMinimumEverFreeHeapSize	; export
	.type	_xPortGetMinimumEverFreeHeapSize,@function
_xPortGetMinimumEverFreeHeapSize:
.LFB3:
	.loc 1 360 0
	.set ___PA___,1
	lnk	#0
.LCFI3:
	.loc 1 361 0
	mov	_xMinimumEverFreeBytesRemaining,w0
	.loc 1 362 0
	ulnk	
	return	
	.set ___PA___,0
.LFE3:
	.size	_xPortGetMinimumEverFreeHeapSize, .-_xPortGetMinimumEverFreeHeapSize
	.align	2
	.global	_vPortInitialiseBlocks	; export
	.type	_vPortInitialiseBlocks,@function
_vPortInitialiseBlocks:
.LFB4:
	.loc 1 366 0
	.set ___PA___,1
	lnk	#0
.LCFI4:
	.loc 1 368 0
	ulnk	
	return	
	.set ___PA___,0
.LFE4:
	.size	_vPortInitialiseBlocks, .-_vPortInitialiseBlocks
	.align	2
	.type	_prvHeapInit,@function
_prvHeapInit:
.LFB5:
	.loc 1 372 0
	.set ___PA___,1
	lnk	#8
.LCFI5:
	.loc 1 376 0
	mov	#5120,w0
	mov	w0,[w14+2]
	.loc 1 379 0
	mov	#_ucHeap,w0
	mov	w0,[w14]
	.loc 1 381 0
	mov	[w14],w0
	and	w0,#1,w0
	mov.b	w0,w0
	cp0.b	w0
	.set ___BP___,0
	bra	z,.L16
	.loc 1 383 0
	inc	[w14],[w14]
	.loc 1 384 0
	bclr	[w14],#0
	.loc 1 385 0
	mov	[w14+2],w0
	sub	w0,[w14],w1
	mov	#_ucHeap,w0
	add	w1,w0,w0
	mov	w0,[w14+2]
.L16:
	.loc 1 388 0
	mov	[w14],w1
	mov	w1,[w14+4]
	.loc 1 392 0
	mov	[w14+4],w0
	mov	w0,_xStart
	.loc 1 393 0
	clr	_xStart+2
	.loc 1 397 0
	mov	[w14+4],w1
	mov	[w14+2],w0
	add	w1,w0,[w14]
	.loc 1 398 0
	mov	_xHeapStructSize,w0
	subr	w0,[w14],[w14]
	.loc 1 399 0
	bclr	[w14],#0
	.loc 1 400 0
	mov	[w14],w0
	mov	w0,_pxEnd
	.loc 1 401 0
	mov	_pxEnd,w0
	clr	w1
	mov	w1,[w0+2]
	.loc 1 402 0
	mov	_pxEnd,w0
	clr	w1
	mov	w1,[w0]
	.loc 1 406 0
	mov	[w14+4],w1
	mov	w1,[w14+6]
	.loc 1 407 0
	mov	[w14+6],w0
	subr	w0,[w14],w1
	mov	[w14+6],w0
	mov	w1,[w0+2]
	.loc 1 408 0
	mov	_pxEnd,w1
	mov	[w14+6],w0
	mov	w1,[w0]
	.loc 1 411 0
	mov	[w14+6],w0
	mov	[w0+2],w0
	mov	w0,_xMinimumEverFreeBytesRemaining
	.loc 1 412 0
	mov	[w14+6],w0
	mov	[w0+2],w0
	mov	w0,_xFreeBytesRemaining
	.loc 1 415 0
	mov	#-32768,w0
	mov	w0,_xBlockAllocatedBit
	.loc 1 416 0
	ulnk	
	return	
	.set ___PA___,0
.LFE5:
	.size	_prvHeapInit, .-_prvHeapInit
	.align	2
	.type	_prvInsertBlockIntoFreeList,@function
_prvInsertBlockIntoFreeList:
.LFB6:
	.loc 1 420 0
	.set ___PA___,1
	lnk	#6
.LCFI6:
	mov	w0,[w14+4]
	.loc 1 426 0
	mov	#_xStart,w0
	mov	w0,[w14]
	bra	.L18
.L19:
	mov	[w14],w0
	mov	[w0],[w14]
.L18:
	mov	[w14],w0
	mov	[w0],w1
	mov	[w14+4],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L19
	.loc 1 433 0
	mov	[w14],w1
	mov	w1,[w14+2]
	.loc 1 434 0
	mov	[w14],w0
	mov	[w0+2],w0
	mov	[w14+2],w1
	add	w1,w0,w1
	mov	[w14+4],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L20
	.loc 1 436 0
	mov	[w14],w0
	mov	[w0+2],w1
	mov	[w14+4],w0
	mov	[w0+2],w0
	add	w1,w0,w1
	mov	[w14],w0
	mov	w1,[w0+2]
	.loc 1 437 0
	mov	[w14],w1
	mov	w1,[w14+4]
.L20:
	.loc 1 446 0
	mov	[w14+4],w1
	mov	w1,[w14+2]
	.loc 1 447 0
	mov	[w14+4],w0
	mov	[w0+2],w0
	mov	[w14+2],w1
	add	w1,w0,w1
	mov	[w14],w0
	mov	[w0],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L21
	.loc 1 449 0
	mov	[w14],w0
	mov	[w0],w1
	mov	_pxEnd,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L22
	.loc 1 452 0
	mov	[w14+4],w0
	mov	[w0+2],w1
	mov	[w14],w0
	mov	[w0],w0
	mov	[w0+2],w0
	add	w1,w0,w1
	mov	[w14+4],w0
	mov	w1,[w0+2]
	.loc 1 453 0
	mov	[w14],w0
	mov	[w0],w0
	mov	[w0],w1
	mov	[w14+4],w0
	mov	w1,[w0]
	bra	.L23
.L22:
	.loc 1 457 0
	mov	_pxEnd,w1
	mov	[w14+4],w0
	mov	w1,[w0]
	bra	.L23
.L21:
	.loc 1 462 0
	mov	[w14],w0
	mov	[w0],w1
	mov	[w14+4],w0
	mov	w1,[w0]
.L23:
	.loc 1 469 0
	mov	[w14+4],w0
	mov	[w14],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L17
	.loc 1 471 0
	mov	[w14],w0
	mov	[w14+4],w1
	mov	w1,[w0]
.L17:
	.loc 1 477 0
	ulnk	
	return	
	.set ___PA___,0
.LFE6:
	.size	_prvInsertBlockIntoFreeList, .-_prvInsertBlockIntoFreeList
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
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/yvals.h"
	.file 3 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdlib.h"
	.file 4 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.section	.debug_info,info
	.4byte	0x531
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../../source/portable/MemMang/heap_4.c"
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
	.uleb128 0x4
	.asciz	"_Sizet"
	.byte	0x2
	.byte	0xa2
	.4byte	0xff
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"long int"
	.uleb128 0x4
	.asciz	"size_t"
	.byte	0x3
	.byte	0x24
	.4byte	0x116
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"signed char"
	.uleb128 0x4
	.asciz	"uint8_t"
	.byte	0x4
	.byte	0x2b
	.4byte	0x15c
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x5
	.byte	0x2
	.4byte	0x14d
	.uleb128 0x6
	.asciz	"A_BLOCK_LINK"
	.byte	0x4
	.byte	0x1
	.byte	0x6f
	.4byte	0x1e2
	.uleb128 0x7
	.asciz	"pxNextFreeBlock"
	.byte	0x1
	.byte	0x71
	.4byte	0x1e2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"xBlockSize"
	.byte	0x1
	.byte	0x72
	.4byte	0x130
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	0x19d
	.uleb128 0x4
	.asciz	"BlockLink_t"
	.byte	0x1
	.byte	0x73
	.4byte	0x19d
	.uleb128 0x8
	.byte	0x1
	.asciz	"pvPortMalloc"
	.byte	0x1
	.byte	0x9b
	.byte	0x1
	.4byte	0xbc
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0x28e
	.uleb128 0x9
	.asciz	"xWantedSize"
	.byte	0x1
	.byte	0x9b
	.4byte	0x130
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0xa
	.asciz	"pxBlock"
	.byte	0x1
	.byte	0x9d
	.4byte	0x28e
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0xa
	.asciz	"pxPreviousBlock"
	.byte	0x1
	.byte	0x9d
	.4byte	0x28e
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0xa
	.asciz	"pxNewBlockLink"
	.byte	0x1
	.byte	0x9d
	.4byte	0x28e
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0xa
	.asciz	"pvReturn"
	.byte	0x1
	.byte	0x9e
	.4byte	0xbc
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	0x1e8
	.uleb128 0xb
	.byte	0x1
	.asciz	"vPortFree"
	.byte	0x1
	.2byte	0x131
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.4byte	0x2e2
	.uleb128 0xc
	.asciz	"pv"
	.byte	0x1
	.2byte	0x131
	.4byte	0xbc
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0xd
	.asciz	"puc"
	.byte	0x1
	.2byte	0x133
	.4byte	0x197
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0xd
	.asciz	"pxLink"
	.byte	0x1
	.2byte	0x134
	.4byte	0x28e
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0xe
	.byte	0x1
	.asciz	"xPortGetFreeHeapSize"
	.byte	0x1
	.2byte	0x161
	.byte	0x1
	.4byte	0x130
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.uleb128 0xe
	.byte	0x1
	.asciz	"xPortGetMinimumEverFreeHeapSize"
	.byte	0x1
	.2byte	0x167
	.byte	0x1
	.4byte	0x130
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5e
	.uleb128 0xf
	.byte	0x1
	.asciz	"vPortInitialiseBlocks"
	.byte	0x1
	.2byte	0x16d
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5e
	.uleb128 0x10
	.asciz	"prvHeapInit"
	.byte	0x1
	.2byte	0x173
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5e
	.4byte	0x3ea
	.uleb128 0xd
	.asciz	"pxFirstFreeBlock"
	.byte	0x1
	.2byte	0x175
	.4byte	0x28e
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0xd
	.asciz	"pucAlignedHeap"
	.byte	0x1
	.2byte	0x176
	.4byte	0x197
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0xd
	.asciz	"uxAddress"
	.byte	0x1
	.2byte	0x177
	.4byte	0x130
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0xd
	.asciz	"xTotalHeapSize"
	.byte	0x1
	.2byte	0x178
	.4byte	0x130
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x10
	.asciz	"prvInsertBlockIntoFreeList"
	.byte	0x1
	.2byte	0x1a3
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5e
	.4byte	0x459
	.uleb128 0xc
	.asciz	"pxBlockToInsert"
	.byte	0x1
	.2byte	0x1a3
	.4byte	0x28e
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0xd
	.asciz	"pxIterator"
	.byte	0x1
	.2byte	0x1a5
	.4byte	0x28e
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0xd
	.asciz	"puc"
	.byte	0x1
	.2byte	0x1a6
	.4byte	0x197
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x11
	.4byte	0x14d
	.4byte	0x46a
	.uleb128 0x12
	.4byte	0xff
	.2byte	0x13ff
	.byte	0x0
	.uleb128 0xa
	.asciz	"ucHeap"
	.byte	0x1
	.byte	0x6a
	.4byte	0x459
	.byte	0x5
	.byte	0x3
	.4byte	_ucHeap
	.uleb128 0xa
	.asciz	"xHeapStructSize"
	.byte	0x1
	.byte	0x89
	.4byte	0x49b
	.byte	0x5
	.byte	0x3
	.4byte	_xHeapStructSize
	.uleb128 0x13
	.4byte	0x130
	.uleb128 0xa
	.asciz	"xStart"
	.byte	0x1
	.byte	0x8c
	.4byte	0x1e8
	.byte	0x5
	.byte	0x3
	.4byte	_xStart
	.uleb128 0xa
	.asciz	"pxEnd"
	.byte	0x1
	.byte	0x8c
	.4byte	0x28e
	.byte	0x5
	.byte	0x3
	.4byte	_pxEnd
	.uleb128 0xa
	.asciz	"xFreeBytesRemaining"
	.byte	0x1
	.byte	0x90
	.4byte	0x130
	.byte	0x5
	.byte	0x3
	.4byte	_xFreeBytesRemaining
	.uleb128 0xa
	.asciz	"xMinimumEverFreeBytesRemaining"
	.byte	0x1
	.byte	0x91
	.4byte	0x130
	.byte	0x5
	.byte	0x3
	.4byte	_xMinimumEverFreeBytesRemaining
	.uleb128 0xa
	.asciz	"xBlockAllocatedBit"
	.byte	0x1
	.byte	0x97
	.4byte	0x130
	.byte	0x5
	.byte	0x3
	.4byte	_xBlockAllocatedBit
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x84
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x535
	.4byte	0x1fb
	.asciz	"pvPortMalloc"
	.4byte	0x294
	.asciz	"vPortFree"
	.4byte	0x2e2
	.asciz	"xPortGetFreeHeapSize"
	.4byte	0x30b
	.asciz	"xPortGetMinimumEverFreeHeapSize"
	.4byte	0x33f
	.asciz	"vPortInitialiseBlocks"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x51
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x535
	.4byte	0x116
	.asciz	"_Sizet"
	.4byte	0x130
	.asciz	"size_t"
	.4byte	0x14d
	.asciz	"uint8_t"
	.4byte	0x19d
	.asciz	"A_BLOCK_LINK"
	.4byte	0x1e8
	.asciz	"BlockLink_t"
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
