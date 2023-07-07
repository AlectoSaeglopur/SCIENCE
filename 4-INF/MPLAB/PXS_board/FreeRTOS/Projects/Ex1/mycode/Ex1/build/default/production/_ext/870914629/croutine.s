	.file "C:\\Users\\Filippo\\Downloads\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\..\\source\\croutine.c"
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
	.type	_pxReadyCoRoutineLists,@object
	.size	_pxReadyCoRoutineLists, 20
_pxReadyCoRoutineLists:
	.skip	20
	.align	2
	.type	_xDelayedCoRoutineList1,@object
	.size	_xDelayedCoRoutineList1, 10
_xDelayedCoRoutineList1:
	.skip	10
	.align	2
	.type	_xDelayedCoRoutineList2,@object
	.size	_xDelayedCoRoutineList2, 10
_xDelayedCoRoutineList2:
	.skip	10
	.section	.nbss,bss,near
	.align	2
	.type	_pxDelayedCoRoutineList,@object
	.size	_pxDelayedCoRoutineList, 2
_pxDelayedCoRoutineList:
	.skip	2
	.align	2
	.type	_pxOverflowDelayedCoRoutineList,@object
	.size	_pxOverflowDelayedCoRoutineList, 2
_pxOverflowDelayedCoRoutineList:
	.skip	2
	.section	.bss,bss
	.align	2
	.type	_xPendingReadyCoRoutineList,@object
	.size	_xPendingReadyCoRoutineList, 10
_xPendingReadyCoRoutineList:
	.skip	10
	.global	_pxCurrentCoRoutine	; export
	.section	.nbss,bss,near
	.align	2
	.type	_pxCurrentCoRoutine,@object
	.size	_pxCurrentCoRoutine, 2
_pxCurrentCoRoutine:
	.skip	2
	.align	2
	.type	_uxTopCoRoutineReadyPriority,@object
	.size	_uxTopCoRoutineReadyPriority, 2
_uxTopCoRoutineReadyPriority:
	.skip	2
	.align	2
	.type	_xCoRoutineTickCount,@object
	.size	_xCoRoutineTickCount, 2
_xCoRoutineTickCount:
	.skip	2
	.align	2
	.type	_xLastTickCount,@object
	.size	_xLastTickCount, 2
_xLastTickCount:
	.skip	2
	.align	2
	.type	_xPassedTicks,@object
	.size	_xPassedTicks, 2
_xPassedTicks:
	.skip	2
	.section	.text,code
	.align	2
	.global	_xCoRoutineCreate	; export
	.type	_xCoRoutineCreate,@function
_xCoRoutineCreate:
.LFB0:
	.file 1 "../../source/croutine.c"
	.loc 1 145 0
	.set ___PA___,1
	lnk	#10
.LCFI0:
	mov	w0,[w14+4]
	mov	w1,[w14+6]
	mov	w2,[w14+8]
	.loc 1 150 0
	mov	#28,w0
	rcall	_pvPortMalloc
	mov	w0,[w14+2]
	.loc 1 151 0
	mov	[w14+2],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L2
	.loc 1 155 0
	mov	_pxCurrentCoRoutine,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L3
	.loc 1 157 0
	mov	[w14+2],w1
	mov	w1,_pxCurrentCoRoutine
	.loc 1 158 0
	rcall	_prvInitialiseCoRoutineLists
.L3:
	.loc 1 162 0
	mov	[w14+6],w0
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	leu,.L4
	.loc 1 164 0
	mov	#1,w0
	mov	w0,[w14+6]
.L4:
	.loc 1 168 0
	mov	[w14+2],w0
	clr	w1
	mov	w1,[w0+26]
	.loc 1 169 0
	mov	[w14+2],w0
	mov	[w14+6],w1
	mov	w1,[w0+22]
	.loc 1 170 0
	mov	[w14+2],w0
	mov	[w14+8],w1
	mov	w1,[w0+24]
	.loc 1 171 0
	mov	[w14+2],w0
	mov	[w14+4],w1
	mov	w1,[w0]
	.loc 1 174 0
	mov	[w14+2],w0
	inc2	w0,w0
	rcall	_vListInitialiseItem
	.loc 1 175 0
	mov	[w14+2],w0
	add	w0,#12,w0
	rcall	_vListInitialiseItem
	.loc 1 180 0
	mov	[w14+2],w0
	mov	[w14+2],w1
	mov	w1,[w0+8]
	.loc 1 181 0
	mov	[w14+2],w0
	mov	[w14+2],w1
	mov	w1,[w0+18]
	.loc 1 184 0
	mov	[w14+6],w0
	subr	w0,#2,w1
	mov	[w14+2],w0
	mov	w1,[w0+12]
	.loc 1 188 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_uxTopCoRoutineReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L5
	mov	[w14+2],w0
	mov	[w0+22],w0
	mov	w0,_uxTopCoRoutineReadyPriority
.L5:
	mov	[w14+2],w0
	inc2	w0,w1
	mov	[w14+2],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyCoRoutineLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	.loc 1 190 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L6
.L2:
	.loc 1 194 0
	setm	w0
	mov	w0,[w14]
.L6:
	.loc 1 197 0
	mov	[w14],w0
	.loc 1 198 0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.size	_xCoRoutineCreate, .-_xCoRoutineCreate
	.align	2
	.global	_vCoRoutineAddToDelayedList	; export
	.type	_vCoRoutineAddToDelayedList,@function
_vCoRoutineAddToDelayedList:
.LFB1:
	.loc 1 202 0
	.set ___PA___,1
	lnk	#6
.LCFI1:
	mov	w0,[w14+2]
	mov	w1,[w14+4]
	.loc 1 207 0
	mov	_xCoRoutineTickCount,w1
	mov	[w14+2],w0
	add	w1,w0,[w14]
	.loc 1 212 0
	mov	_pxCurrentCoRoutine,w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 215 0
	mov	_pxCurrentCoRoutine,w0
	mov	[w14],w1
	mov	w1,[w0+2]
	.loc 1 217 0
	mov	_xCoRoutineTickCount,w0
	mov	[w14],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	geu,.L8
	.loc 1 221 0
	mov	_pxCurrentCoRoutine,w0
	inc2	w0,w1
	mov	_pxOverflowDelayedCoRoutineList,w0
	rcall	_vListInsert
	bra	.L9
.L8:
	.loc 1 227 0
	mov	_pxCurrentCoRoutine,w0
	inc2	w0,w1
	mov	_pxDelayedCoRoutineList,w0
	rcall	_vListInsert
.L9:
	.loc 1 230 0
	mov	[w14+4],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L7
	.loc 1 234 0
	mov	_pxCurrentCoRoutine,w0
	add	w0,#12,w0
	mov	w0,w1
	mov	[w14+4],w0
	rcall	_vListInsert
.L7:
	.loc 1 236 0
	ulnk	
	return	
	.set ___PA___,0
.LFE1:
	.size	_vCoRoutineAddToDelayedList, .-_vCoRoutineAddToDelayedList
	.align	2
	.type	_prvCheckPendingReadyList,@function
_prvCheckPendingReadyList:
.LFB2:
	.loc 1 240 0
	.set ___PA___,0
	lnk	#2
.LCFI2:
	.loc 1 244 0
	bra	.L12
.L14:
.LBB2:
	.loc 1 249 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	bset	w0,#5
	mov	w0,_SRbits
	nop	
; 249 "../../source/croutine.c" 1
	NOP
	.loc 1 251 0
	mov	_xPendingReadyCoRoutineList+6,w0
	mov	[w0+6],w0
	mov	w0,[w14]
	.loc 1 252 0
	mov	[w14],w1
	add	w1,#12,w0
	rcall	_uxListRemove
	.loc 1 254 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	mov	w0,_SRbits
	nop	
	.loc 1 256 0
	inc2	[w14],w0
	rcall	_uxListRemove
	.loc 1 257 0
	mov	[w14],w0
	mov	[w0+22],w1
	mov	_uxTopCoRoutineReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L13
	mov	[w14],w0
	mov	[w0+22],w0
	mov	w0,_uxTopCoRoutineReadyPriority
.L13:
	inc2	[w14],w1
	mov	[w14],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyCoRoutineLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
.L12:
.LBE2:
	.loc 1 244 0
	mov	_xPendingReadyCoRoutineList,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L14
	.loc 1 259 0
	ulnk	
	return	
	.set ___PA___,0
.LFE2:
	.size	_prvCheckPendingReadyList, .-_prvCheckPendingReadyList
	.align	2
	.type	_prvCheckDelayedList,@function
_prvCheckDelayedList:
.LFB3:
	.loc 1 263 0
	.set ___PA___,0
	lnk	#4
.LCFI3:
	.loc 1 266 0
	rcall	_xTaskGetTickCount
	mov	_xLastTickCount,w1
	sub	w0,w1,w0
	mov	w0,_xPassedTicks
	.loc 1 267 0
	bra	.L16
.L23:
	.loc 1 269 0
	mov	_xCoRoutineTickCount,w0
	inc	w0,w0
	mov	w0,_xCoRoutineTickCount
	.loc 1 270 0
	mov	_xPassedTicks,w0
	dec	w0,w0
	mov	w0,_xPassedTicks
	.loc 1 273 0
	mov	_xCoRoutineTickCount,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L24
.LBB3:
	.loc 1 279 0
	mov	_pxDelayedCoRoutineList,w1
	mov	w1,[w14]
	.loc 1 280 0
	mov	_pxOverflowDelayedCoRoutineList,w0
	mov	w0,_pxDelayedCoRoutineList
	.loc 1 281 0
	mov	[w14],w1
	mov	w1,_pxOverflowDelayedCoRoutineList
.LBE3:
	.loc 1 285 0
	bra	.L18
.L22:
	.loc 1 287 0
	mov	_pxDelayedCoRoutineList,w0
	mov	[w0+6],w0
	mov	[w0+6],w0
	mov	w0,[w14+2]
	.loc 1 289 0
	mov	[w14+2],w0
	mov	[w0+2],w1
	mov	_xCoRoutineTickCount,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	gtu,.L25
.L19:
	.loc 1 295 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	bset	w0,#5
	mov	w0,_SRbits
	nop	
; 295 "../../source/croutine.c" 1
	NOP
	.loc 1 302 0
	mov	[w14+2],w0
	inc2	w0,w0
	rcall	_uxListRemove
	.loc 1 305 0
	mov	[w14+2],w0
	mov	[w0+20],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L20
	.loc 1 307 0
	mov	[w14+2],w0
	add	w0,#12,w0
	rcall	_uxListRemove
.L20:
	.loc 1 310 0
	mov	_SRbits,w1
	mov	#-225,w0
	and	w1,w0,w0
	mov	w0,_SRbits
	nop	
	.loc 1 312 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_uxTopCoRoutineReadyPriority,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	leu,.L21
	mov	[w14+2],w0
	mov	[w0+22],w0
	mov	w0,_uxTopCoRoutineReadyPriority
.L21:
	mov	[w14+2],w0
	inc2	w0,w1
	mov	[w14+2],w0
	mov	[w0+22],w0
	mulw.su	w0,#10,w2
	mov	#_pxReadyCoRoutineLists,w0
	add	w2,w0,w0
	rcall	_vListInsertEnd
	bra	.L18
.L24:
	.loc 1 285 0
	nop	
.L18:
	mov	_pxDelayedCoRoutineList,w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L22
	bra	.L16
.L25:
	.loc 1 292 0
	nop	
.L16:
	.loc 1 267 0
	mov	_xPassedTicks,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L23
	.loc 1 316 0
	mov	_xCoRoutineTickCount,w0
	mov	w0,_xLastTickCount
	.loc 1 317 0
	ulnk	
	return	
	.set ___PA___,0
.LFE3:
	.size	_prvCheckDelayedList, .-_prvCheckDelayedList
	.align	2
	.global	_vCoRoutineSchedule	; export
	.type	_vCoRoutineSchedule,@function
_vCoRoutineSchedule:
.LFB4:
	.loc 1 321 0
	.set ___PA___,1
	lnk	#2
.LCFI4:
	.loc 1 323 0
	rcall	_prvCheckPendingReadyList
	.loc 1 326 0
	rcall	_prvCheckDelayedList
	.loc 1 329 0
	bra	.L27
.L30:
	.loc 1 331 0
	mov	_uxTopCoRoutineReadyPriority,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L32
.L28:
	.loc 1 336 0
	mov	_uxTopCoRoutineReadyPriority,w0
	dec	w0,w0
	mov	w0,_uxTopCoRoutineReadyPriority
.L27:
	.loc 1 329 0
	mov	_uxTopCoRoutineReadyPriority,w0
	mulw.su	w0,#10,w0
	mov	w0,w1
	mov	#_pxReadyCoRoutineLists,w0
	add	w1,w0,w0
	mov	[w0],w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L30
.LBB4:
	.loc 1 341 0
	mov	_uxTopCoRoutineReadyPriority,w0
	mulw.su	w0,#10,w0
	mov	w0,w1
	mov	#_pxReadyCoRoutineLists,w0
	add	w1,w0,[w14]
	mov	[w14],w0
	mov	[w0+2],w0
	mov	[w0+2],w1
	mov	[w14],w0
	mov	w1,[w0+2]
	mov	[w14],w0
	mov	[w0+2],w1
	mov	[w14],w2
	add	w2,#4,w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	nz,.L31
	mov	[w14],w0
	mov	[w0+2],w0
	mov	[w0+2],w1
	mov	[w14],w0
	mov	w1,[w0+2]
.L31:
	mov	[w14],w0
	mov	[w0+2],w0
	mov	[w0+6],w0
	mov	w0,_pxCurrentCoRoutine
.LBE4:
	.loc 1 344 0
	mov	_pxCurrentCoRoutine,w0
	mov	[w0],w2
	mov	_pxCurrentCoRoutine,w0
	mov	[w0+24],w1
	mov	_pxCurrentCoRoutine,w0
	call	w2
	.loc 1 346 0
	nop	
	bra	.L26
.L32:
	.loc 1 334 0
	nop	
.L26:
	.loc 1 347 0
	ulnk	
	return	
	.set ___PA___,0
.LFE4:
	.size	_vCoRoutineSchedule, .-_vCoRoutineSchedule
	.align	2
	.type	_prvInitialiseCoRoutineLists,@function
_prvInitialiseCoRoutineLists:
.LFB5:
	.loc 1 351 0
	.set ___PA___,1
	lnk	#2
.LCFI5:
	.loc 1 354 0
	clr	w0
	mov	w0,[w14]
	bra	.L34
.L35:
	.loc 1 356 0
	mov	[w14],w0
	mulw.su	w0,#10,w0
	mov	w0,w1
	mov	#_pxReadyCoRoutineLists,w0
	add	w1,w0,w0
	rcall	_vListInitialise
	.loc 1 354 0
	inc	[w14],[w14]
.L34:
	mov	[w14],w0
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	leu,.L35
	.loc 1 359 0
	mov	#_xDelayedCoRoutineList1,w0
	rcall	_vListInitialise
	.loc 1 360 0
	mov	#_xDelayedCoRoutineList2,w0
	rcall	_vListInitialise
	.loc 1 361 0
	mov	#_xPendingReadyCoRoutineList,w0
	rcall	_vListInitialise
	.loc 1 365 0
	mov	#_xDelayedCoRoutineList1,w0
	mov	w0,_pxDelayedCoRoutineList
	.loc 1 366 0
	mov	#_xDelayedCoRoutineList2,w0
	mov	w0,_pxOverflowDelayedCoRoutineList
	.loc 1 367 0
	ulnk	
	return	
	.set ___PA___,0
.LFE5:
	.size	_prvInitialiseCoRoutineLists, .-_prvInitialiseCoRoutineLists
	.align	2
	.global	_xCoRoutineRemoveFromEventList	; export
	.type	_xCoRoutineRemoveFromEventList,@function
_xCoRoutineRemoveFromEventList:
.LFB6:
	.loc 1 371 0
	.set ___PA___,1
	lnk	#6
.LCFI6:
	mov	w0,[w14+4]
	.loc 1 378 0
	mov	[w14+4],w0
	mov	[w0+6],w0
	mov	[w0+6],w0
	mov	w0,[w14+2]
	.loc 1 379 0
	mov	[w14+2],w0
	add	w0,#12,w0
	rcall	_uxListRemove
	.loc 1 380 0
	mov	[w14+2],w0
	add	w0,#12,w0
	mov	w0,w1
	mov	#_xPendingReadyCoRoutineList,w0
	rcall	_vListInsertEnd
	.loc 1 382 0
	mov	[w14+2],w0
	mov	[w0+22],w1
	mov	_pxCurrentCoRoutine,w0
	mov	[w0+22],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L37
	.loc 1 384 0
	mov	#1,w0
	mov	w0,[w14]
	bra	.L38
.L37:
	.loc 1 388 0
	clr	w0
	mov	w0,[w14]
.L38:
	.loc 1 391 0
	mov	[w14],w0
	.loc 1 392 0
	ulnk	
	return	
	.set ___PA___,0
.LFE6:
	.size	_xCoRoutineRemoveFromEventList, .-_xCoRoutineRemoveFromEventList
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
	.file 2 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h"
	.file 3 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 4 "../../source/include/../../Source/portable/MPLAB/PIC24_dsPIC/portmacro.h"
	.file 5 "../../source/include/list.h"
	.file 6 "../../source/include/croutine.h"
	.section	.debug_info,info
	.4byte	0x993
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../../source/croutine.c"
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
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x3
	.byte	0x31
	.4byte	0xf0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x5
	.byte	0x2
	.byte	0x2
	.byte	0x87
	.4byte	0x241
	.uleb128 0x6
	.asciz	"C"
	.byte	0x2
	.byte	0x88
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"Z"
	.byte	0x2
	.byte	0x89
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OV"
	.byte	0x2
	.byte	0x8a
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"N"
	.byte	0x2
	.byte	0x8b
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"RA"
	.byte	0x2
	.byte	0x8c
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"IPL"
	.byte	0x2
	.byte	0x8d
	.4byte	0x133
	.byte	0x2
	.byte	0x3
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DC"
	.byte	0x2
	.byte	0x8e
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DA"
	.byte	0x2
	.byte	0x8f
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SAB"
	.byte	0x2
	.byte	0x90
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OAB"
	.byte	0x2
	.byte	0x91
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SB"
	.byte	0x2
	.byte	0x92
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SA"
	.byte	0x2
	.byte	0x93
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OB"
	.byte	0x2
	.byte	0x94
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OA"
	.byte	0x2
	.byte	0x95
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.byte	0x2
	.byte	0x97
	.4byte	0x280
	.uleb128 0x6
	.asciz	"IPL0"
	.byte	0x2
	.byte	0x99
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"IPL1"
	.byte	0x2
	.byte	0x9a
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"IPL2"
	.byte	0x2
	.byte	0x9b
	.4byte	0x133
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x2
	.byte	0x2
	.byte	0x86
	.4byte	0x293
	.uleb128 0x8
	.4byte	0x158
	.uleb128 0x8
	.4byte	0x241
	.byte	0x0
	.uleb128 0x9
	.asciz	"tagSRBITS"
	.byte	0x2
	.byte	0x2
	.byte	0x85
	.4byte	0x2ae
	.uleb128 0xa
	.4byte	0x280
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x4
	.asciz	"SRBITS"
	.byte	0x2
	.byte	0x9e
	.4byte	0x293
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x4
	.asciz	"BaseType_t"
	.byte	0x4
	.byte	0x61
	.4byte	0x2d6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"UBaseType_t"
	.byte	0x4
	.byte	0x62
	.4byte	0xda
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x4
	.byte	0x65
	.4byte	0x133
	.uleb128 0x9
	.asciz	"xLIST_ITEM"
	.byte	0xa
	.byte	0x5
	.byte	0xb5
	.4byte	0x371
	.uleb128 0xb
	.4byte	.LASF0
	.byte	0x5
	.byte	0xb8
	.4byte	0x2f6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.asciz	"pxNext"
	.byte	0x5
	.byte	0xb9
	.4byte	0x371
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xb
	.4byte	.LASF1
	.byte	0x5
	.byte	0xba
	.4byte	0x371
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.asciz	"pvOwner"
	.byte	0x5
	.byte	0xbb
	.4byte	0xad
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xc
	.asciz	"pvContainer"
	.byte	0x5
	.byte	0xbc
	.4byte	0xad
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.4byte	0x308
	.uleb128 0x4
	.asciz	"ListItem_t"
	.byte	0x5
	.byte	0xbf
	.4byte	0x308
	.uleb128 0x9
	.asciz	"xMINI_LIST_ITEM"
	.byte	0x6
	.byte	0x5
	.byte	0xc1
	.4byte	0x3cf
	.uleb128 0xb
	.4byte	.LASF0
	.byte	0x5
	.byte	0xc4
	.4byte	0x2f6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.asciz	"pxNext"
	.byte	0x5
	.byte	0xc5
	.4byte	0x371
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xb
	.4byte	.LASF1
	.byte	0x5
	.byte	0xc6
	.4byte	0x371
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.asciz	"MiniListItem_t"
	.byte	0x5
	.byte	0xc8
	.4byte	0x389
	.uleb128 0x9
	.asciz	"xLIST"
	.byte	0xa
	.byte	0x5
	.byte	0xcd
	.4byte	0x433
	.uleb128 0xc
	.asciz	"uxNumberOfItems"
	.byte	0x5
	.byte	0xd0
	.4byte	0x2e3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.asciz	"pxIndex"
	.byte	0x5
	.byte	0xd1
	.4byte	0x433
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xc
	.asciz	"xListEnd"
	.byte	0x5
	.byte	0xd2
	.4byte	0x3cf
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.4byte	0x377
	.uleb128 0x4
	.asciz	"List_t"
	.byte	0x5
	.byte	0xd4
	.4byte	0x3e5
	.uleb128 0x4
	.asciz	"CoRoutineHandle_t"
	.byte	0x6
	.byte	0x56
	.4byte	0xad
	.uleb128 0x4
	.asciz	"crCOROUTINE_CODE"
	.byte	0x6
	.byte	0x59
	.4byte	0x478
	.uleb128 0xd
	.byte	0x2
	.4byte	0x47e
	.uleb128 0xe
	.byte	0x1
	.4byte	0x48f
	.uleb128 0xf
	.4byte	0x447
	.uleb128 0xf
	.4byte	0x2e3
	.byte	0x0
	.uleb128 0x9
	.asciz	"corCoRoutineControlBlock"
	.byte	0x1c
	.byte	0x6
	.byte	0x5b
	.4byte	0x535
	.uleb128 0xc
	.asciz	"pxCoRoutineFunction"
	.byte	0x6
	.byte	0x5d
	.4byte	0x460
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.asciz	"xGenericListItem"
	.byte	0x6
	.byte	0x5e
	.4byte	0x377
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xc
	.asciz	"xEventListItem"
	.byte	0x6
	.byte	0x5f
	.4byte	0x377
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.4byte	.LASF2
	.byte	0x6
	.byte	0x60
	.4byte	0x2e3
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xc
	.asciz	"uxIndex"
	.byte	0x6
	.byte	0x61
	.4byte	0x2e3
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xc
	.asciz	"uxState"
	.byte	0x6
	.byte	0x62
	.4byte	0x133
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.byte	0x0
	.uleb128 0x4
	.asciz	"CRCB_t"
	.byte	0x6
	.byte	0x63
	.4byte	0x48f
	.uleb128 0x10
	.byte	0x1
	.asciz	"xCoRoutineCreate"
	.byte	0x1
	.byte	0x90
	.byte	0x1
	.4byte	0x2c4
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0x5ce
	.uleb128 0x11
	.asciz	"pxCoRoutineCode"
	.byte	0x1
	.byte	0x90
	.4byte	0x460
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x12
	.4byte	.LASF2
	.byte	0x1
	.byte	0x90
	.4byte	0x2e3
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x11
	.asciz	"uxIndex"
	.byte	0x1
	.byte	0x90
	.4byte	0x2e3
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x13
	.asciz	"xReturn"
	.byte	0x1
	.byte	0x92
	.4byte	0x2c4
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x13
	.asciz	"pxCoRoutine"
	.byte	0x1
	.byte	0x93
	.4byte	0x5ce
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.4byte	0x535
	.uleb128 0x14
	.byte	0x1
	.asciz	"vCoRoutineAddToDelayedList"
	.byte	0x1
	.byte	0xc9
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.4byte	0x63f
	.uleb128 0x11
	.asciz	"xTicksToDelay"
	.byte	0x1
	.byte	0xc9
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x12
	.4byte	.LASF3
	.byte	0x1
	.byte	0xc9
	.4byte	0x63f
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x13
	.asciz	"xTimeToWake"
	.byte	0x1
	.byte	0xcb
	.4byte	0x2f6
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.4byte	0x439
	.uleb128 0x15
	.asciz	"prvCheckPendingReadyList"
	.byte	0x1
	.byte	0xef
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.4byte	0x689
	.uleb128 0x16
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x17
	.4byte	.LASF4
	.byte	0x1
	.byte	0xf6
	.4byte	0x5ce
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.asciz	"prvCheckDelayedList"
	.byte	0x1
	.2byte	0x106
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5e
	.4byte	0x6df
	.uleb128 0x19
	.asciz	"pxCRCB"
	.byte	0x1
	.2byte	0x108
	.4byte	0x5ce
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x16
	.4byte	.LBB3
	.4byte	.LBE3
	.uleb128 0x19
	.asciz	"pxTemp"
	.byte	0x1
	.2byte	0x113
	.4byte	0x63f
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.asciz	"vCoRoutineSchedule"
	.byte	0x1
	.2byte	0x140
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5e
	.4byte	0x728
	.uleb128 0x16
	.4byte	.LBB4
	.4byte	.LBE4
	.uleb128 0x19
	.asciz	"pxConstList"
	.byte	0x1
	.2byte	0x155
	.4byte	0x728
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.4byte	0x63f
	.uleb128 0x18
	.asciz	"prvInitialiseCoRoutineLists"
	.byte	0x1
	.2byte	0x15e
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5e
	.4byte	0x76c
	.uleb128 0x1c
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x160
	.4byte	0x2e3
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.asciz	"xCoRoutineRemoveFromEventList"
	.byte	0x1
	.2byte	0x172
	.byte	0x1
	.4byte	0x2c4
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5e
	.4byte	0x7d4
	.uleb128 0x1e
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x172
	.4byte	0x7d4
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x1c
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x174
	.4byte	0x5ce
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x19
	.asciz	"xReturn"
	.byte	0x1
	.2byte	0x175
	.4byte	0x2c4
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0xd
	.byte	0x2
	.4byte	0x7da
	.uleb128 0x1b
	.4byte	0x439
	.uleb128 0x1f
	.asciz	"SRbits"
	.byte	0x2
	.byte	0x9f
	.4byte	0x7ef
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.4byte	0x2ae
	.uleb128 0x21
	.4byte	0x439
	.4byte	0x804
	.uleb128 0x22
	.4byte	0xf0
	.byte	0x1
	.byte	0x0
	.uleb128 0x13
	.asciz	"pxReadyCoRoutineLists"
	.byte	0x1
	.byte	0x57
	.4byte	0x7f4
	.byte	0x5
	.byte	0x3
	.4byte	_pxReadyCoRoutineLists
	.uleb128 0x13
	.asciz	"xDelayedCoRoutineList1"
	.byte	0x1
	.byte	0x58
	.4byte	0x439
	.byte	0x5
	.byte	0x3
	.4byte	_xDelayedCoRoutineList1
	.uleb128 0x13
	.asciz	"xDelayedCoRoutineList2"
	.byte	0x1
	.byte	0x59
	.4byte	0x439
	.byte	0x5
	.byte	0x3
	.4byte	_xDelayedCoRoutineList2
	.uleb128 0x13
	.asciz	"pxDelayedCoRoutineList"
	.byte	0x1
	.byte	0x5a
	.4byte	0x63f
	.byte	0x5
	.byte	0x3
	.4byte	_pxDelayedCoRoutineList
	.uleb128 0x13
	.asciz	"pxOverflowDelayedCoRoutineList"
	.byte	0x1
	.byte	0x5b
	.4byte	0x63f
	.byte	0x5
	.byte	0x3
	.4byte	_pxOverflowDelayedCoRoutineList
	.uleb128 0x13
	.asciz	"xPendingReadyCoRoutineList"
	.byte	0x1
	.byte	0x5c
	.4byte	0x439
	.byte	0x5
	.byte	0x3
	.4byte	_xPendingReadyCoRoutineList
	.uleb128 0x23
	.4byte	.LASF5
	.byte	0x1
	.byte	0x5f
	.4byte	0x5ce
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.asciz	"uxTopCoRoutineReadyPriority"
	.byte	0x1
	.byte	0x60
	.4byte	0x2e3
	.byte	0x5
	.byte	0x3
	.4byte	_uxTopCoRoutineReadyPriority
	.uleb128 0x13
	.asciz	"xCoRoutineTickCount"
	.byte	0x1
	.byte	0x61
	.4byte	0x2f6
	.byte	0x5
	.byte	0x3
	.4byte	_xCoRoutineTickCount
	.uleb128 0x13
	.asciz	"xLastTickCount"
	.byte	0x1
	.byte	0x61
	.4byte	0x2f6
	.byte	0x5
	.byte	0x3
	.4byte	_xLastTickCount
	.uleb128 0x13
	.asciz	"xPassedTicks"
	.byte	0x1
	.byte	0x61
	.4byte	0x2f6
	.byte	0x5
	.byte	0x3
	.4byte	_xPassedTicks
	.uleb128 0x1f
	.asciz	"SRbits"
	.byte	0x2
	.byte	0x9f
	.4byte	0x7ef
	.byte	0x1
	.byte	0x1
	.uleb128 0x24
	.4byte	.LASF5
	.byte	0x1
	.byte	0x5f
	.4byte	0x5ce
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_pxCurrentCoRoutine
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x18
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
	.uleb128 0x1b
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x92
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x997
	.4byte	0x543
	.asciz	"xCoRoutineCreate"
	.4byte	0x5d4
	.asciz	"vCoRoutineAddToDelayedList"
	.4byte	0x6df
	.asciz	"vCoRoutineSchedule"
	.4byte	0x76c
	.asciz	"xCoRoutineRemoveFromEventList"
	.4byte	0x984
	.asciz	"pxCurrentCoRoutine"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x10f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x997
	.4byte	0x133
	.asciz	"uint16_t"
	.4byte	0x293
	.asciz	"tagSRBITS"
	.4byte	0x2ae
	.asciz	"SRBITS"
	.4byte	0x2c4
	.asciz	"BaseType_t"
	.4byte	0x2e3
	.asciz	"UBaseType_t"
	.4byte	0x2f6
	.asciz	"TickType_t"
	.4byte	0x308
	.asciz	"xLIST_ITEM"
	.4byte	0x377
	.asciz	"ListItem_t"
	.4byte	0x389
	.asciz	"xMINI_LIST_ITEM"
	.4byte	0x3cf
	.asciz	"MiniListItem_t"
	.4byte	0x3e5
	.asciz	"xLIST"
	.4byte	0x439
	.asciz	"List_t"
	.4byte	0x447
	.asciz	"CoRoutineHandle_t"
	.4byte	0x460
	.asciz	"crCOROUTINE_CODE"
	.4byte	0x48f
	.asciz	"corCoRoutineControlBlock"
	.4byte	0x535
	.asciz	"CRCB_t"
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
.LASF1:
	.asciz	"pxPrevious"
.LASF0:
	.asciz	"xItemValue"
.LASF5:
	.asciz	"pxCurrentCoRoutine"
.LASF3:
	.asciz	"pxEventList"
.LASF4:
	.asciz	"pxUnblockedCRCB"
.LASF2:
	.asciz	"uxPriority"
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
