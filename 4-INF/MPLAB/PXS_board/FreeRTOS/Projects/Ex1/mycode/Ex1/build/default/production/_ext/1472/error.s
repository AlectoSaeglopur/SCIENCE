	.file "C:\\Users\\Filippo\\Desktop\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\error.c"
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
	.global	_Set_ErrFlag	; export
	.type	_Set_ErrFlag,@function
_Set_ErrFlag:
.LFB0:
	.file 1 "../error.c"
	.loc 1 36 0
	.set ___PA___,1
	.loc 1 37 0
	lsr	w0,#8,w1
	.loc 1 39 0
	sub.b	w1,#19,[w15]
	.set ___BP___,39
	bra	gtu,.L1
	.loc 1 40 0
	ze	w1,w1
	mov	#_ErrRegs,w2
	add	w2,w1,w1
	ior.b	w0,[w1],[w1]
.L1:
	return	
.LFE0:
	.size	_Set_ErrFlag, .-_Set_ErrFlag
	.align	2
	.global	_Get_ErrFlag	; export
	.type	_Get_ErrFlag,@function
_Get_ErrFlag:
.LFB1:
	.loc 1 50 0
	.set ___PA___,1
	.loc 1 53 0
	lsr	w0,#8,w1
	mov	#_ErrRegs,w2
	add	w2,w1,w1
	and.b	w0,[w1],w0
	ze	w0,w0
	neg	w0,w0
	lsr	w0,#15,w0
	.loc 1 54 0
	return	
	.set ___PA___,0
.LFE1:
	.size	_Get_ErrFlag, .-_Get_ErrFlag
	.align	2
	.global	_Get_ErrPage	; export
	.type	_Get_ErrPage,@function
_Get_ErrPage:
.LFB2:
	.loc 1 62 0
	.set ___PA___,1
	.loc 1 64 0
	lsr	w0,#8,w0
	mov	#_ErrRegs,w1
	add	w1,w0,w0
	.loc 1 62 0
	mov.b	[w0],w0
	.loc 1 65 0
	return	
	.set ___PA___,0
.LFE2:
	.size	_Get_ErrPage, .-_Get_ErrPage
	.align	2
	.global	_Clear_ErrFlag	; export
	.type	_Clear_ErrFlag,@function
_Clear_ErrFlag:
.LFB3:
	.loc 1 72 0
	.set ___PA___,1
	.loc 1 73 0
	lsr	w0,#8,w1
	.loc 1 75 0
	sub.b	w1,#19,[w15]
	.set ___BP___,39
	bra	gtu,.L11
	.loc 1 76 0
	ze	w1,w1
	mov	#_ErrRegs,w2
	add	w2,w1,w1
	com.b	w0,w0
	and.b	w0,[w1],[w1]
.L11:
	return	
.LFE3:
	.size	_Clear_ErrFlag, .-_Clear_ErrFlag
	.align	2
	.global	_Reset_ErrRegs	; export
	.type	_Reset_ErrRegs,@function
_Reset_ErrRegs:
.LFB4:
	.loc 1 84 0
	.set ___PA___,1
	.loc 1 85 0
	mov	#_ErrRegs,w0
	
	repeat	#20-1
	clr.b	[w0++]
		
	.loc 1 89 0
	return	
	.set ___PA___,0
.LFE4:
	.size	_Reset_ErrRegs, .-_Reset_ErrRegs
	.section	.isr.text,code,keep
	.align	2
	.global	__OscillatorFail	; export
	.type	__OscillatorFail,@function
__OscillatorFail:
	.section	.isr.text,code,keep
.LFB5:
	.section	.isr.text,code,keep
	.loc 1 100 0
	.set ___PA___,1
	mov	w0,[w15++]
.LCFI0:
	push	_DSRPAG
.LCFI1:
	push	_DSWPAG
.LCFI2:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	.section	.isr.text,code,keep
	.loc 1 101 0
	btst.b	_INTCON1bits,#1
	.set ___BP___,50
	bra	z,.L20
	.section	.isr.text,code,keep
.LBB34:
	.section	.isr.text,code,keep
.LBB35:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+4,w0
	bset.b	[w0],#0
.L20:
	.section	.isr.text,code,keep
.LBE35:
	.section	.isr.text,code,keep
.LBE34:
	.section	.isr.text,code,keep
	.loc 1 104 0
	btst.b	_OSCCONbits,#3
	.set ___BP___,50
	bra	z,.L21
	.section	.isr.text,code,keep
.LBB36:
	.section	.isr.text,code,keep
.LBB37:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+4,w0
	bset.b	[w0],#1
.L21:
	.section	.isr.text,code,keep
.LBE37:
	.section	.isr.text,code,keep
.LBE36:
	.section	.isr.text,code,keep
	.loc 1 107 0
	btst.b	_OSCCONbits,#5
	.set ___BP___,39
	bra	z,.L22
	.section	.isr.text,code,keep
.LBB38:
	.section	.isr.text,code,keep
.LBB39:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+4,w0
	bset.b	[w0],#2
.L22:
	.section	.isr.text,code,keep
.LBE39:
	.section	.isr.text,code,keep
.LBE38:
	.section	.isr.text,code,keep
	.loc 1 110 0
	bclr.b	_INTCON1bits,#1
	.section	.isr.text,code,keep
	.loc 1 111 0
	pop	_DSWPAG
	pop	_DSRPAG
	mov	[--w15],w0
	retfie	
	.set ___PA___,0
.LFE5:
	.size	__OscillatorFail, .-__OscillatorFail
	.section	.isr.text,code,keep
	.align	2
	.global	__AddressError	; export
	.type	__AddressError,@function
__AddressError:
	.section	.isr.text,code,keep
.LFB6:
	.section	.isr.text,code,keep
	.loc 1 117 0
	.set ___PA___,1
	mov	w0,[w15++]
.LCFI3:
	push	_DSRPAG
.LCFI4:
	push	_DSWPAG
.LCFI5:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	.section	.isr.text,code,keep
	.loc 1 118 0
	btst.b	_INTCON1bits,#3
	.set ___BP___,39
	bra	z,.L26
	.section	.isr.text,code,keep
.LBB40:
	.section	.isr.text,code,keep
.LBB41:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+4,w0
	bset.b	[w0],#3
.L26:
	.section	.isr.text,code,keep
.LBE41:
	.section	.isr.text,code,keep
.LBE40:
	.section	.isr.text,code,keep
	.loc 1 121 0
	bclr.b	_INTCON1bits,#3
	.section	.isr.text,code,keep
	.loc 1 122 0
	pop	_DSWPAG
	pop	_DSRPAG
	mov	[--w15],w0
	retfie	
	.set ___PA___,0
.LFE6:
	.size	__AddressError, .-__AddressError
	.section	.isr.text,code,keep
	.align	2
	.global	__StackError	; export
	.type	__StackError,@function
__StackError:
	.section	.isr.text,code,keep
.LFB7:
	.section	.isr.text,code,keep
	.loc 1 128 0
	.set ___PA___,1
	mov	w0,[w15++]
.LCFI6:
	push	_DSRPAG
.LCFI7:
	push	_DSWPAG
.LCFI8:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	.section	.isr.text,code,keep
	.loc 1 129 0
	btst.b	_INTCON1bits,#2
	.set ___BP___,39
	bra	z,.L30
	.section	.isr.text,code,keep
.LBB42:
	.section	.isr.text,code,keep
.LBB43:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+4,w0
	bset.b	[w0],#4
.L30:
	.section	.isr.text,code,keep
.LBE43:
	.section	.isr.text,code,keep
.LBE42:
	.section	.isr.text,code,keep
	.loc 1 132 0
	bclr.b	_INTCON1bits,#2
	.section	.isr.text,code,keep
	.loc 1 133 0
	pop	_DSWPAG
	pop	_DSRPAG
	mov	[--w15],w0
	retfie	
	.set ___PA___,0
.LFE7:
	.size	__StackError, .-__StackError
	.section	.isr.text,code,keep
	.align	2
	.global	__MathError	; export
	.type	__MathError,@function
__MathError:
	.section	.isr.text,code,keep
.LFB8:
	.section	.isr.text,code,keep
	.loc 1 139 0
	.set ___PA___,1
	mov	w0,[w15++]
.LCFI9:
	push	_DSRPAG
.LCFI10:
	push	_DSWPAG
.LCFI11:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	.section	.isr.text,code,keep
	.loc 1 140 0
	btst.b	_INTCON1bits+14/8,#14%8
	.set ___BP___,50
	bra	z,.L34
	.section	.isr.text,code,keep
.LBB44:
	.section	.isr.text,code,keep
.LBB45:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+4,w0
	bset.b	[w0],#6
.L34:
	.section	.isr.text,code,keep
.LBE45:
	.section	.isr.text,code,keep
.LBE44:
	.section	.isr.text,code,keep
	.loc 1 143 0
	btst.b	_INTCON1bits+13/8,#13%8
	.set ___BP___,50
	bra	z,.L35
	.section	.isr.text,code,keep
.LBB46:
	.section	.isr.text,code,keep
.LBB47:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+4,w0
	bset.b	[w0],#7
.L35:
	.section	.isr.text,code,keep
.LBE47:
	.section	.isr.text,code,keep
.LBE46:
	.section	.isr.text,code,keep
	.loc 1 146 0
	btst.b	_INTCON1bits+12/8,#12%8
	.set ___BP___,50
	bra	z,.L36
	.section	.isr.text,code,keep
.LBB48:
	.section	.isr.text,code,keep
.LBB49:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+5,w0
	bset.b	[w0],#0
.L36:
	.section	.isr.text,code,keep
.LBE49:
	.section	.isr.text,code,keep
.LBE48:
	.section	.isr.text,code,keep
	.loc 1 149 0
	btst.b	_INTCON1bits+11/8,#11%8
	.set ___BP___,50
	bra	z,.L37
	.section	.isr.text,code,keep
.LBB50:
	.section	.isr.text,code,keep
.LBB51:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+5,w0
	bset.b	[w0],#1
.L37:
	.section	.isr.text,code,keep
.LBE51:
	.section	.isr.text,code,keep
.LBE50:
	.section	.isr.text,code,keep
	.loc 1 152 0
	btst.b	_INTCON1bits,#7
	.set ___BP___,50
	bra	z,.L38
	.section	.isr.text,code,keep
.LBB52:
	.section	.isr.text,code,keep
.LBB53:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+5,w0
	bset.b	[w0],#2
.L38:
	.section	.isr.text,code,keep
.LBE53:
	.section	.isr.text,code,keep
.LBE52:
	.section	.isr.text,code,keep
	.loc 1 155 0
	btst.b	_INTCON1bits,#6
	.set ___BP___,50
	bra	z,.L39
	.section	.isr.text,code,keep
.LBB54:
	.section	.isr.text,code,keep
.LBB55:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+5,w0
	bset.b	[w0],#3
.L39:
	.section	.isr.text,code,keep
.LBE55:
	.section	.isr.text,code,keep
.LBE54:
	.section	.isr.text,code,keep
	.loc 1 158 0
	btst.b	_INTCON1bits,#4
	.set ___BP___,39
	bra	z,.L40
	.section	.isr.text,code,keep
.LBB56:
	.section	.isr.text,code,keep
.LBB57:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+4,w0
	bset.b	[w0],#5
.L40:
	.section	.isr.text,code,keep
.LBE57:
	.section	.isr.text,code,keep
.LBE56:
	.section	.isr.text,code,keep
	.loc 1 161 0
	bclr.b	_INTCON1bits+1,#6
	.section	.isr.text,code,keep
	.loc 1 162 0
	bclr.b	_INTCON1bits+1,#5
	.section	.isr.text,code,keep
	.loc 1 163 0
	bclr.b	_INTCON1bits+1,#4
	.section	.isr.text,code,keep
	.loc 1 164 0
	bclr.b	_INTCON1bits+1,#3
	.section	.isr.text,code,keep
	.loc 1 165 0
	bclr.b	_INTCON1bits,#7
	.section	.isr.text,code,keep
	.loc 1 166 0
	bclr.b	_INTCON1bits,#6
	.section	.isr.text,code,keep
	.loc 1 167 0
	bclr.b	_INTCON1bits,#4
	.section	.isr.text,code,keep
	.loc 1 168 0
	pop	_DSWPAG
	pop	_DSRPAG
	mov	[--w15],w0
	retfie	
	.set ___PA___,0
.LFE8:
	.size	__MathError, .-__MathError
	.section	.isr.text,code,keep
	.align	2
	.global	__SoftTrapError	; export
	.type	__SoftTrapError,@function
__SoftTrapError:
	.section	.isr.text,code,keep
.LFB9:
	.section	.isr.text,code,keep
	.loc 1 174 0
	.set ___PA___,1
	mov	w0,[w15++]
.LCFI12:
	push	_DSRPAG
.LCFI13:
	push	_DSWPAG
.LCFI14:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	.section	.isr.text,code,keep
	.loc 1 175 0
	btst.b	_INTCON3bits,#5
	.set ___BP___,50
	bra	z,.L44
	.section	.isr.text,code,keep
.LBB58:
	.section	.isr.text,code,keep
.LBB59:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+5,w0
	bset.b	[w0],#5
.L44:
	.section	.isr.text,code,keep
.LBE59:
	.section	.isr.text,code,keep
.LBE58:
	.section	.isr.text,code,keep
	.loc 1 178 0
	btst.b	_INTCON3bits,#4
	.set ___BP___,39
	bra	z,.L45
	.section	.isr.text,code,keep
.LBB60:
	.section	.isr.text,code,keep
.LBB61:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+5,w0
	bset.b	[w0],#4
.L45:
	.section	.isr.text,code,keep
.LBE61:
	.section	.isr.text,code,keep
.LBE60:
	.section	.isr.text,code,keep
	.loc 1 181 0
	bclr.b	_INTCON3bits,#5
	.section	.isr.text,code,keep
	.loc 1 182 0
	bclr.b	_INTCON3bits,#4
	.section	.isr.text,code,keep
	.loc 1 183 0
	pop	_DSWPAG
	pop	_DSRPAG
	mov	[--w15],w0
	retfie	
	.set ___PA___,0
.LFE9:
	.size	__SoftTrapError, .-__SoftTrapError
	.section	.isr.text,code,keep
	.align	2
	.global	__HardTrapError	; export
	.type	__HardTrapError,@function
__HardTrapError:
	.section	.isr.text,code,keep
.LFB10:
	.section	.isr.text,code,keep
	.loc 1 189 0
	.set ___PA___,1
	mov	w0,[w15++]
.LCFI15:
	push	_DSRPAG
.LCFI16:
	push	_DSWPAG
.LCFI17:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	.section	.isr.text,code,keep
	.loc 1 190 0
	btst.b	_INTCON4bits,#0
	.set ___BP___,39
	bra	z,.L49
	.section	.isr.text,code,keep
.LBB62:
	.section	.isr.text,code,keep
.LBB63:
	.section	.isr.text,code,keep
	.loc 1 40 0
	mov	#_ErrRegs+5,w0
	bset.b	[w0],#6
.L49:
	.section	.isr.text,code,keep
.LBE63:
	.section	.isr.text,code,keep
.LBE62:
	.section	.isr.text,code,keep
	.loc 1 193 0
	bclr.b	_INTCON4bits,#0
	.section	.isr.text,code,keep
	.loc 1 194 0
	pop	_DSWPAG
	pop	_DSRPAG
	mov	[--w15],w0
	retfie	
	.set ___PA___,0
.LFE10:
	.size	__HardTrapError, .-__HardTrapError
	.section	.bss,bss
	.type	_ErrRegs,@object
	.size	_ErrRegs, 20
_ErrRegs:
	.skip	20
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
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.align	4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.align	4
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.align	4
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.align	4
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI0-.LFB5
	.byte	0x13
	.sleb128 -3
	.byte	0x4
	.4byte	.LCFI2-.LCFI0
	.byte	0x80
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
	.4byte	.LCFI3-.LFB6
	.byte	0x13
	.sleb128 -3
	.byte	0x4
	.4byte	.LCFI5-.LCFI3
	.byte	0x80
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
	.4byte	.LCFI6-.LFB7
	.byte	0x13
	.sleb128 -3
	.byte	0x4
	.4byte	.LCFI8-.LCFI6
	.byte	0x80
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
	.4byte	.LCFI9-.LFB8
	.byte	0x13
	.sleb128 -3
	.byte	0x4
	.4byte	.LCFI11-.LCFI9
	.byte	0x80
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
	.4byte	.LCFI12-.LFB9
	.byte	0x13
	.sleb128 -3
	.byte	0x4
	.4byte	.LCFI14-.LCFI12
	.byte	0x80
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
	.4byte	.LCFI15-.LFB10
	.byte	0x13
	.sleb128 -3
	.byte	0x4
	.4byte	.LCFI17-.LCFI15
	.byte	0x80
	.uleb128 0x2
	.align	4
.LEFDE20:
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 3 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h"
	.section	.debug_info,info
	.4byte	0xa54
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../error.c"
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
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"signed char"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x4
	.asciz	"uint8_t"
	.byte	0x2
	.byte	0x2b
	.4byte	0x104
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x2
	.byte	0x31
	.4byte	0xe1
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x5
	.asciz	"tagINTCON1BITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x37fa
	.4byte	0x2ba
	.uleb128 0x6
	.asciz	"OSCFAIL"
	.byte	0x3
	.2byte	0x37fc
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"STKERR"
	.byte	0x3
	.2byte	0x37fd
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"ADDRERR"
	.byte	0x3
	.2byte	0x37fe
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"MATHERR"
	.byte	0x3
	.2byte	0x37ff
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DMACERR"
	.byte	0x3
	.2byte	0x3800
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DIV0ERR"
	.byte	0x3
	.2byte	0x3801
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SFTACERR"
	.byte	0x3
	.2byte	0x3802
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"COVTE"
	.byte	0x3
	.2byte	0x3803
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OVBTE"
	.byte	0x3
	.2byte	0x3804
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OVATE"
	.byte	0x3
	.2byte	0x3805
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"COVBERR"
	.byte	0x3
	.2byte	0x3806
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"COVAERR"
	.byte	0x3
	.2byte	0x3807
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OVBERR"
	.byte	0x3
	.2byte	0x3808
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"OVAERR"
	.byte	0x3
	.2byte	0x3809
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"NSTDIS"
	.byte	0x3
	.2byte	0x380a
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.asciz	"INTCON1BITS"
	.byte	0x3
	.2byte	0x380b
	.4byte	0x160
	.uleb128 0x5
	.asciz	"tagINTCON3BITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x3820
	.4byte	0x357
	.uleb128 0x6
	.asciz	"APLL"
	.byte	0x3
	.2byte	0x3821
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DOOVR"
	.byte	0x3
	.2byte	0x3823
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DAE"
	.byte	0x3
	.2byte	0x3824
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CAN2"
	.byte	0x3
	.2byte	0x3825
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"NAE"
	.byte	0x3
	.2byte	0x3827
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CAN"
	.byte	0x3
	.2byte	0x3828
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.asciz	"INTCON3BITS"
	.byte	0x3
	.2byte	0x3829
	.4byte	0x2ce
	.uleb128 0x5
	.asciz	"tagINTCON4BITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x382e
	.4byte	0x3ac
	.uleb128 0x6
	.asciz	"SGHT"
	.byte	0x3
	.2byte	0x382f
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"ECCDBE"
	.byte	0x3
	.2byte	0x3830
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.asciz	"INTCON4BITS"
	.byte	0x3
	.2byte	0x3831
	.4byte	0x36b
	.uleb128 0x8
	.byte	0x2
	.byte	0x3
	.2byte	0x4f20
	.4byte	0x43e
	.uleb128 0x6
	.asciz	"OSWEN"
	.byte	0x3
	.2byte	0x4f21
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CF"
	.byte	0x3
	.2byte	0x4f23
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"LOCK"
	.byte	0x3
	.2byte	0x4f25
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CLKLOCK"
	.byte	0x3
	.2byte	0x4f27
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"NOSC"
	.byte	0x3
	.2byte	0x4f28
	.4byte	0x13b
	.byte	0x2
	.byte	0x3
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"COSC"
	.byte	0x3
	.2byte	0x4f2a
	.4byte	0x13b
	.byte	0x2
	.byte	0x3
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.byte	0x3
	.2byte	0x4f2c
	.4byte	0x4c0
	.uleb128 0x6
	.asciz	"NOSC0"
	.byte	0x3
	.2byte	0x4f2e
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"NOSC1"
	.byte	0x3
	.2byte	0x4f2f
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"NOSC2"
	.byte	0x3
	.2byte	0x4f30
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"COSC0"
	.byte	0x3
	.2byte	0x4f32
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"COSC1"
	.byte	0x3
	.2byte	0x4f33
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"COSC2"
	.byte	0x3
	.2byte	0x4f34
	.4byte	0x13b
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x9
	.byte	0x2
	.byte	0x3
	.2byte	0x4f1f
	.4byte	0x4d4
	.uleb128 0xa
	.4byte	0x3c0
	.uleb128 0xa
	.4byte	0x43e
	.byte	0x0
	.uleb128 0x5
	.asciz	"tagOSCCONBITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x4f1e
	.4byte	0x4f4
	.uleb128 0xb
	.4byte	0x4c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.asciz	"OSCCONBITS"
	.byte	0x3
	.2byte	0x4f37
	.4byte	0x4d4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0xc
	.byte	0x1
	.asciz	"Set_ErrFlag"
	.byte	0x1
	.byte	0x24
	.byte	0x1
	.byte	0x1
	.4byte	0x54d
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x1
	.byte	0x24
	.4byte	0x13b
	.uleb128 0xe
	.asciz	"Idx"
	.byte	0x1
	.byte	0x25
	.4byte	0x12c
	.uleb128 0xe
	.asciz	"Mask"
	.byte	0x1
	.byte	0x26
	.4byte	0x12c
	.byte	0x0
	.uleb128 0xf
	.4byte	0x514
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5f
	.4byte	0x574
	.uleb128 0x10
	.4byte	0x52a
	.byte	0x1
	.byte	0x50
	.uleb128 0x11
	.4byte	0x535
	.byte	0x1
	.byte	0x51
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.asciz	"Get_ErrFlag"
	.byte	0x1
	.byte	0x32
	.byte	0x1
	.4byte	0x5bc
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5f
	.4byte	0x5bc
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x1
	.byte	0x32
	.4byte	0x13b
	.byte	0x1
	.byte	0x50
	.uleb128 0xe
	.asciz	"Idx"
	.byte	0x1
	.byte	0x33
	.4byte	0x12c
	.uleb128 0xe
	.asciz	"Mask"
	.byte	0x1
	.byte	0x34
	.4byte	0x12c
	.byte	0x0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.asciz	"_Bool"
	.uleb128 0x13
	.byte	0x1
	.asciz	"Get_ErrPage"
	.byte	0x1
	.byte	0x3e
	.byte	0x1
	.4byte	0x12c
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5f
	.4byte	0x601
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x1
	.byte	0x3e
	.4byte	0x13b
	.byte	0x1
	.byte	0x50
	.uleb128 0xe
	.asciz	"Idx"
	.byte	0x1
	.byte	0x3f
	.4byte	0x12c
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.asciz	"Clear_ErrFlag"
	.byte	0x1
	.byte	0x48
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5f
	.4byte	0x649
	.uleb128 0x14
	.4byte	.LASF0
	.byte	0x1
	.byte	0x48
	.4byte	0x13b
	.byte	0x1
	.byte	0x50
	.uleb128 0x16
	.asciz	"Idx"
	.byte	0x1
	.byte	0x49
	.4byte	0x12c
	.byte	0x1
	.byte	0x51
	.uleb128 0xe
	.asciz	"Mask"
	.byte	0x1
	.byte	0x4a
	.4byte	0x12c
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.asciz	"Reset_ErrRegs"
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5f
	.4byte	0x676
	.uleb128 0xe
	.asciz	"Ret"
	.byte	0x1
	.byte	0x55
	.4byte	0x9e
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.asciz	"_OscillatorFail"
	.byte	0x1
	.byte	0x64
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5f
	.4byte	0x717
	.uleb128 0x17
	.4byte	0x514
	.4byte	.LBB34
	.4byte	.LBE34
	.4byte	0x6c4
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB35
	.4byte	.LBE35
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x514
	.4byte	.LBB36
	.4byte	.LBE36
	.4byte	0x6ef
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB37
	.4byte	.LBE37
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.4byte	0x514
	.4byte	.LBB38
	.4byte	.LBE38
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB39
	.4byte	.LBE39
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.asciz	"_AddressError"
	.byte	0x1
	.byte	0x75
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5f
	.4byte	0x760
	.uleb128 0x1a
	.4byte	0x514
	.4byte	.LBB40
	.4byte	.LBE40
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB41
	.4byte	.LBE41
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.asciz	"_StackError"
	.byte	0x1
	.byte	0x80
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x5f
	.4byte	0x7a7
	.uleb128 0x1a
	.4byte	0x514
	.4byte	.LBB42
	.4byte	.LBE42
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB43
	.4byte	.LBE43
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.asciz	"_MathError"
	.byte	0x1
	.byte	0x8b
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x5f
	.4byte	0x8ef
	.uleb128 0x17
	.4byte	0x514
	.4byte	.LBB44
	.4byte	.LBE44
	.4byte	0x7f0
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB45
	.4byte	.LBE45
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x514
	.4byte	.LBB46
	.4byte	.LBE46
	.4byte	0x81b
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB47
	.4byte	.LBE47
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x514
	.4byte	.LBB48
	.4byte	.LBE48
	.4byte	0x846
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB49
	.4byte	.LBE49
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x514
	.4byte	.LBB50
	.4byte	.LBE50
	.4byte	0x871
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB51
	.4byte	.LBE51
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x514
	.4byte	.LBB52
	.4byte	.LBE52
	.4byte	0x89c
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB53
	.4byte	.LBE53
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x514
	.4byte	.LBB54
	.4byte	.LBE54
	.4byte	0x8c7
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB55
	.4byte	.LBE55
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.4byte	0x514
	.4byte	.LBB56
	.4byte	.LBE56
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB57
	.4byte	.LBE57
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.asciz	"_SoftTrapError"
	.byte	0x1
	.byte	0xae
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x5f
	.4byte	0x964
	.uleb128 0x17
	.4byte	0x514
	.4byte	.LBB58
	.4byte	.LBE58
	.4byte	0x93c
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB59
	.4byte	.LBE59
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.4byte	0x514
	.4byte	.LBB60
	.4byte	.LBE60
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB61
	.4byte	.LBE61
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.asciz	"_HardTrapError"
	.byte	0x1
	.byte	0xbd
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x5f
	.4byte	0x9ae
	.uleb128 0x1a
	.4byte	0x514
	.4byte	.LBB62
	.4byte	.LBE62
	.uleb128 0x18
	.4byte	0x52a
	.uleb128 0x19
	.4byte	.LBB63
	.4byte	.LBE63
	.uleb128 0x12
	.4byte	0x535
	.uleb128 0x12
	.4byte	0x540
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.4byte	.LASF1
	.byte	0x3
	.2byte	0x380c
	.4byte	0x9bc
	.byte	0x1
	.byte	0x1
	.uleb128 0x1c
	.4byte	0x2ba
	.uleb128 0x1b
	.4byte	.LASF2
	.byte	0x3
	.2byte	0x382a
	.4byte	0x9cf
	.byte	0x1
	.byte	0x1
	.uleb128 0x1c
	.4byte	0x357
	.uleb128 0x1b
	.4byte	.LASF3
	.byte	0x3
	.2byte	0x3832
	.4byte	0x9e2
	.byte	0x1
	.byte	0x1
	.uleb128 0x1c
	.4byte	0x3ac
	.uleb128 0x1b
	.4byte	.LASF4
	.byte	0x3
	.2byte	0x4f38
	.4byte	0x9f5
	.byte	0x1
	.byte	0x1
	.uleb128 0x1c
	.4byte	0x4f4
	.uleb128 0x1d
	.4byte	0x12c
	.4byte	0xa0a
	.uleb128 0x1e
	.4byte	0xe1
	.byte	0x13
	.byte	0x0
	.uleb128 0x16
	.asciz	"ErrRegs"
	.byte	0x1
	.byte	0x18
	.4byte	0x9fa
	.byte	0x5
	.byte	0x3
	.4byte	_ErrRegs
	.uleb128 0x1b
	.4byte	.LASF1
	.byte	0x3
	.2byte	0x380c
	.4byte	0x9bc
	.byte	0x1
	.byte	0x1
	.uleb128 0x1b
	.4byte	.LASF2
	.byte	0x3
	.2byte	0x382a
	.4byte	0x9cf
	.byte	0x1
	.byte	0x1
	.uleb128 0x1b
	.4byte	.LASF3
	.byte	0x3
	.2byte	0x3832
	.4byte	0x9e2
	.byte	0x1
	.byte	0x1
	.uleb128 0x1b
	.4byte	.LASF4
	.byte	0x3
	.2byte	0x4f38
	.4byte	0x9f5
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
	.uleb128 0x8
	.uleb128 0x13
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
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
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
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
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0xcd
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xa58
	.4byte	0x54d
	.asciz	"Set_ErrFlag"
	.4byte	0x574
	.asciz	"Get_ErrFlag"
	.4byte	0x5c5
	.asciz	"Get_ErrPage"
	.4byte	0x601
	.asciz	"Clear_ErrFlag"
	.4byte	0x649
	.asciz	"Reset_ErrRegs"
	.4byte	0x676
	.asciz	"_OscillatorFail"
	.4byte	0x717
	.asciz	"_AddressError"
	.4byte	0x760
	.asciz	"_StackError"
	.4byte	0x7a7
	.asciz	"_MathError"
	.4byte	0x8ef
	.asciz	"_SoftTrapError"
	.4byte	0x964
	.asciz	"_HardTrapError"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0xb1
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xa58
	.4byte	0x12c
	.asciz	"uint8_t"
	.4byte	0x13b
	.asciz	"uint16_t"
	.4byte	0x160
	.asciz	"tagINTCON1BITS"
	.4byte	0x2ba
	.asciz	"INTCON1BITS"
	.4byte	0x2ce
	.asciz	"tagINTCON3BITS"
	.4byte	0x357
	.asciz	"INTCON3BITS"
	.4byte	0x36b
	.asciz	"tagINTCON4BITS"
	.4byte	0x3ac
	.asciz	"INTCON4BITS"
	.4byte	0x4d4
	.asciz	"tagOSCCONBITS"
	.4byte	0x4f4
	.asciz	"OSCCONBITS"
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
.LASF2:
	.asciz	"INTCON3bits"
.LASF0:
	.asciz	"ErrId"
.LASF4:
	.asciz	"OSCCONbits"
.LASF3:
	.asciz	"INTCON4bits"
.LASF1:
	.asciz	"INTCON1bits"
	.section	.text,code



	.section __c30_info, info, bss
__large_data_scalar:

	.section __c30_signature, info, data
	.word 0x0001
	.word 0x0000
	.word 0x0000

; MCHP configuration words

	.set ___PA___,0
	.end
