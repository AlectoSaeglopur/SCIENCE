	.file "C:\\Users\\Filippo\\Downloads\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\error.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
	.section	.bss,bss
	.type	_ErrRegs,@object
	.size	_ErrRegs, 20
_ErrRegs:
	.skip	20
	.section	.text,code
	.align	2
	.global	_Set_ErrFlag	; export
	.type	_Set_ErrFlag,@function
_Set_ErrFlag:
.LFB0:
	.file 1 "../error.c"
	.loc 1 36 0
	.set ___PA___,1
	lnk	#4
.LCFI0:
	mov	w0,[w14+2]
	.loc 1 37 0
	mov	[w14+2],w0
	lsr	w0,#8,w0
	mov.b	w0,[w14]
	.loc 1 38 0
	mov	[w14+2],w0
	mov.b	w0,[w14+1]
	.loc 1 39 0
	mov.b	[w14],w0
	sub.b	w0,#19,[w15]
	.set ___BP___,0
	bra	gtu,.L1
	.loc 1 40 0
	ze	[w14],w0
	ze	[w14],w1
	mov	#_ErrRegs,w2
	add	w2,w1,w1
	mov.b	[w1],w2
	mov.b	[w14+1],w1
	ior.b	w2,w1,w1
	mov	#_ErrRegs,w2
	add	w2,w0,w0
	mov.b	w1,[w0]
.L1:
	.loc 1 42 0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.size	_Set_ErrFlag, .-_Set_ErrFlag
	.align	2
	.global	_Get_ErrFlag	; export
	.type	_Get_ErrFlag,@function
_Get_ErrFlag:
.LFB1:
	.loc 1 50 0
	.set ___PA___,1
	lnk	#4
.LCFI1:
	mov	w0,[w14+2]
	.loc 1 51 0
	mov	[w14+2],w0
	lsr	w0,#8,w0
	mov.b	w0,[w14]
	.loc 1 52 0
	mov	[w14+2],w0
	mov.b	w0,[w14+1]
	.loc 1 53 0
	ze	[w14],w0
	mov	#_ErrRegs,w1
	add	w1,w0,w0
	mov.b	[w0],w1
	mov.b	[w14+1],w0
	and.b	w1,w0,w0
	ze	w0,w0
	neg	w0,w0
	lsr	w0,#15,w0
	mov.b	w0,w0
	.loc 1 54 0
	ulnk	
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
	lnk	#4
.LCFI2:
	mov	w0,[w14+2]
	.loc 1 63 0
	mov	[w14+2],w0
	lsr	w0,#8,w0
	mov.b	w0,[w14]
	.loc 1 64 0
	ze	[w14],w0
	mov	#_ErrRegs,w1
	add	w1,w0,w0
	mov.b	[w0],w0
	.loc 1 65 0
	ulnk	
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
	lnk	#4
.LCFI3:
	mov	w0,[w14+2]
	.loc 1 73 0
	mov	[w14+2],w0
	lsr	w0,#8,w0
	mov.b	w0,[w14]
	.loc 1 74 0
	mov	[w14+2],w0
	mov.b	w0,[w14+1]
	.loc 1 75 0
	mov.b	[w14],w0
	sub.b	w0,#19,[w15]
	.set ___BP___,0
	bra	gtu,.L5
	.loc 1 76 0
	ze	[w14],w0
	ze	[w14],w1
	mov	#_ErrRegs,w2
	add	w2,w1,w1
	mov.b	[w1],w1
	mov.b	w1,w2
	mov.b	[w14+1],w1
	com.b	w1,w1
	and.b	w2,w1,w1
	mov	#_ErrRegs,w2
	add	w2,w0,w0
	mov.b	w1,[w0]
.L5:
	.loc 1 78 0
	ulnk	
	return	
	.set ___PA___,0
.LFE3:
	.size	_Clear_ErrFlag, .-_Clear_ErrFlag
	.align	2
	.global	_Reset_ErrRegs	; export
	.type	_Reset_ErrRegs,@function
_Reset_ErrRegs:
.LFB4:
	.loc 1 84 0
	.set ___PA___,1
	lnk	#2
.LCFI4:
	.loc 1 85 0
	mov	#20,w2
	clr	w1
	mov	#_ErrRegs,w0
	rcall	_memset
	mov	w0,[w14]
	.loc 1 86 0
	mov	#_ErrRegs,w0
	mov	[w14],w1
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	z,.L7
	.loc 1 87 0
	mov	#257,w0
	rcall	_Set_ErrFlag
.L7:
	.loc 1 89 0
	ulnk	
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
	push	_RCOUNT
.LCFI5:
	mov.d	w0,[w15++]
.LCFI6:
	mov.d	w2,[w15++]
.LCFI7:
	mov.d	w4,[w15++]
.LCFI8:
	mov.d	w6,[w15++]
.LCFI9:
	push	_DSRPAG
.LCFI10:
	push	_DSWPAG
.LCFI11:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	lnk	#0
.LCFI12:
	.section	.isr.text,code,keep
	.loc 1 101 0
	mov	_INTCON1bits,w0
	and	w0,#2,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L10
	.section	.isr.text,code,keep
	.loc 1 102 0
	mov	#513,w0
	rcall	_Set_ErrFlag
.L10:
	.section	.isr.text,code,keep
	.loc 1 104 0
	mov	_OSCCONbits,w0
	and	w0,#8,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L11
	.section	.isr.text,code,keep
	.loc 1 105 0
	mov	#514,w0
	rcall	_Set_ErrFlag
.L11:
	.section	.isr.text,code,keep
	.loc 1 107 0
	mov	_OSCCONbits,w1
	mov	#32,w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L12
	.section	.isr.text,code,keep
	.loc 1 108 0
	mov	#516,w0
	rcall	_Set_ErrFlag
.L12:
	.section	.isr.text,code,keep
	.loc 1 110 0
	bclr.b	_INTCON1bits,#1
	.section	.isr.text,code,keep
	.loc 1 111 0
	ulnk	
	pop	_DSWPAG
	pop	_DSRPAG
	mov.d	[--w15],w6
	mov.d	[--w15],w4
	mov.d	[--w15],w2
	mov.d	[--w15],w0
	pop	_RCOUNT
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
	push	_RCOUNT
.LCFI13:
	mov.d	w0,[w15++]
.LCFI14:
	mov.d	w2,[w15++]
.LCFI15:
	mov.d	w4,[w15++]
.LCFI16:
	mov.d	w6,[w15++]
.LCFI17:
	push	_DSRPAG
.LCFI18:
	push	_DSWPAG
.LCFI19:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	lnk	#0
.LCFI20:
	.section	.isr.text,code,keep
	.loc 1 118 0
	mov	_INTCON1bits,w0
	and	w0,#8,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L14
	.section	.isr.text,code,keep
	.loc 1 119 0
	mov	#520,w0
	rcall	_Set_ErrFlag
.L14:
	.section	.isr.text,code,keep
	.loc 1 121 0
	bclr.b	_INTCON1bits,#3
	.section	.isr.text,code,keep
	.loc 1 122 0
	ulnk	
	pop	_DSWPAG
	pop	_DSRPAG
	mov.d	[--w15],w6
	mov.d	[--w15],w4
	mov.d	[--w15],w2
	mov.d	[--w15],w0
	pop	_RCOUNT
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
	push	_RCOUNT
.LCFI21:
	mov.d	w0,[w15++]
.LCFI22:
	mov.d	w2,[w15++]
.LCFI23:
	mov.d	w4,[w15++]
.LCFI24:
	mov.d	w6,[w15++]
.LCFI25:
	push	_DSRPAG
.LCFI26:
	push	_DSWPAG
.LCFI27:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	lnk	#0
.LCFI28:
	.section	.isr.text,code,keep
	.loc 1 129 0
	mov	_INTCON1bits,w0
	and	w0,#4,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L16
	.section	.isr.text,code,keep
	.loc 1 130 0
	mov	#528,w0
	rcall	_Set_ErrFlag
.L16:
	.section	.isr.text,code,keep
	.loc 1 132 0
	bclr.b	_INTCON1bits,#2
	.section	.isr.text,code,keep
	.loc 1 133 0
	ulnk	
	pop	_DSWPAG
	pop	_DSRPAG
	mov.d	[--w15],w6
	mov.d	[--w15],w4
	mov.d	[--w15],w2
	mov.d	[--w15],w0
	pop	_RCOUNT
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
	push	_RCOUNT
.LCFI29:
	mov.d	w0,[w15++]
.LCFI30:
	mov.d	w2,[w15++]
.LCFI31:
	mov.d	w4,[w15++]
.LCFI32:
	mov.d	w6,[w15++]
.LCFI33:
	push	_DSRPAG
.LCFI34:
	push	_DSWPAG
.LCFI35:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	lnk	#0
.LCFI36:
	.section	.isr.text,code,keep
	.loc 1 140 0
	mov	_INTCON1bits,w1
	mov	#16384,w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L18
	.section	.isr.text,code,keep
	.loc 1 141 0
	mov	#576,w0
	rcall	_Set_ErrFlag
.L18:
	.section	.isr.text,code,keep
	.loc 1 143 0
	mov	_INTCON1bits,w1
	mov	#8192,w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L19
	.section	.isr.text,code,keep
	.loc 1 144 0
	mov	#640,w0
	rcall	_Set_ErrFlag
.L19:
	.section	.isr.text,code,keep
	.loc 1 146 0
	mov	_INTCON1bits,w1
	mov	#4096,w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L20
	.section	.isr.text,code,keep
	.loc 1 147 0
	mov	#769,w0
	rcall	_Set_ErrFlag
.L20:
	.section	.isr.text,code,keep
	.loc 1 149 0
	mov	_INTCON1bits,w1
	mov	#2048,w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L21
	.section	.isr.text,code,keep
	.loc 1 150 0
	mov	#770,w0
	rcall	_Set_ErrFlag
.L21:
	.section	.isr.text,code,keep
	.loc 1 152 0
	mov	_INTCON1bits,w1
	mov	#128,w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L22
	.section	.isr.text,code,keep
	.loc 1 153 0
	mov	#772,w0
	rcall	_Set_ErrFlag
.L22:
	.section	.isr.text,code,keep
	.loc 1 155 0
	mov	_INTCON1bits,w1
	mov	#64,w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L23
	.section	.isr.text,code,keep
	.loc 1 156 0
	mov	#776,w0
	rcall	_Set_ErrFlag
.L23:
	.section	.isr.text,code,keep
	.loc 1 158 0
	mov	_INTCON1bits,w0
	and	w0,#16,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L24
	.section	.isr.text,code,keep
	.loc 1 159 0
	mov	#544,w0
	rcall	_Set_ErrFlag
.L24:
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
	ulnk	
	pop	_DSWPAG
	pop	_DSRPAG
	mov.d	[--w15],w6
	mov.d	[--w15],w4
	mov.d	[--w15],w2
	mov.d	[--w15],w0
	pop	_RCOUNT
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
	push	_RCOUNT
.LCFI37:
	mov.d	w0,[w15++]
.LCFI38:
	mov.d	w2,[w15++]
.LCFI39:
	mov.d	w4,[w15++]
.LCFI40:
	mov.d	w6,[w15++]
.LCFI41:
	push	_DSRPAG
.LCFI42:
	push	_DSWPAG
.LCFI43:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	lnk	#0
.LCFI44:
	.section	.isr.text,code,keep
	.loc 1 175 0
	mov	_INTCON3bits,w1
	mov	#32,w0
	and	w1,w0,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L26
	.section	.isr.text,code,keep
	.loc 1 176 0
	mov	#800,w0
	rcall	_Set_ErrFlag
.L26:
	.section	.isr.text,code,keep
	.loc 1 178 0
	mov	_INTCON3bits,w0
	and	w0,#16,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L27
	.section	.isr.text,code,keep
	.loc 1 179 0
	mov	#784,w0
	rcall	_Set_ErrFlag
.L27:
	.section	.isr.text,code,keep
	.loc 1 181 0
	bclr.b	_INTCON3bits,#5
	.section	.isr.text,code,keep
	.loc 1 182 0
	bclr.b	_INTCON3bits,#4
	.section	.isr.text,code,keep
	.loc 1 183 0
	ulnk	
	pop	_DSWPAG
	pop	_DSRPAG
	mov.d	[--w15],w6
	mov.d	[--w15],w4
	mov.d	[--w15],w2
	mov.d	[--w15],w0
	pop	_RCOUNT
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
	push	_RCOUNT
.LCFI45:
	mov.d	w0,[w15++]
.LCFI46:
	mov.d	w2,[w15++]
.LCFI47:
	mov.d	w4,[w15++]
.LCFI48:
	mov.d	w6,[w15++]
.LCFI49:
	push	_DSRPAG
.LCFI50:
	push	_DSWPAG
.LCFI51:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	lnk	#0
.LCFI52:
	.section	.isr.text,code,keep
	.loc 1 190 0
	mov	_INTCON4bits,w0
	and	w0,#1,w0
	cp0	w0
	.set ___BP___,0
	bra	z,.L29
	.section	.isr.text,code,keep
	.loc 1 191 0
	mov	#832,w0
	rcall	_Set_ErrFlag
.L29:
	.section	.isr.text,code,keep
	.loc 1 193 0
	bclr.b	_INTCON4bits,#0
	.section	.isr.text,code,keep
	.loc 1 194 0
	ulnk	
	pop	_DSWPAG
	pop	_DSRPAG
	mov.d	[--w15],w6
	mov.d	[--w15],w4
	mov.d	[--w15],w2
	mov.d	[--w15],w0
	pop	_RCOUNT
	retfie	
	.set ___PA___,0
.LFE10:
	.size	__HardTrapError, .-__HardTrapError
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
	.4byte	.LCFI6-.LFB5
	.byte	0x13
	.sleb128 -5
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0x13
	.sleb128 -7
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0x13
	.sleb128 -9
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0x13
	.sleb128 -11
	.byte	0x4
	.4byte	.LCFI11-.LCFI9
	.byte	0x86
	.uleb128 0x9
	.byte	0x84
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x5
	.byte	0x80
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0x13
	.sleb128 -13
	.byte	0x12
	.uleb128 0xe
	.sleb128 -14
	.byte	0x8e
	.uleb128 0xd
	.align	4
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI14-.LFB6
	.byte	0x13
	.sleb128 -5
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0x13
	.sleb128 -7
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0x13
	.sleb128 -9
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0x13
	.sleb128 -11
	.byte	0x4
	.4byte	.LCFI19-.LCFI17
	.byte	0x86
	.uleb128 0x9
	.byte	0x84
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x5
	.byte	0x80
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0x13
	.sleb128 -13
	.byte	0x12
	.uleb128 0xe
	.sleb128 -14
	.byte	0x8e
	.uleb128 0xd
	.align	4
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI22-.LFB7
	.byte	0x13
	.sleb128 -5
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0x13
	.sleb128 -7
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
	.byte	0x13
	.sleb128 -9
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0x13
	.sleb128 -11
	.byte	0x4
	.4byte	.LCFI27-.LCFI25
	.byte	0x86
	.uleb128 0x9
	.byte	0x84
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x5
	.byte	0x80
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0x13
	.sleb128 -13
	.byte	0x12
	.uleb128 0xe
	.sleb128 -14
	.byte	0x8e
	.uleb128 0xd
	.align	4
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI30-.LFB8
	.byte	0x13
	.sleb128 -5
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0x13
	.sleb128 -7
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
	.byte	0x13
	.sleb128 -9
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0x13
	.sleb128 -11
	.byte	0x4
	.4byte	.LCFI35-.LCFI33
	.byte	0x86
	.uleb128 0x9
	.byte	0x84
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x5
	.byte	0x80
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0x13
	.sleb128 -13
	.byte	0x12
	.uleb128 0xe
	.sleb128 -14
	.byte	0x8e
	.uleb128 0xd
	.align	4
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI38-.LFB9
	.byte	0x13
	.sleb128 -5
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
	.byte	0x13
	.sleb128 -7
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0x13
	.sleb128 -9
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
	.byte	0x13
	.sleb128 -11
	.byte	0x4
	.4byte	.LCFI43-.LCFI41
	.byte	0x86
	.uleb128 0x9
	.byte	0x84
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x5
	.byte	0x80
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI44-.LCFI43
	.byte	0x13
	.sleb128 -13
	.byte	0x12
	.uleb128 0xe
	.sleb128 -14
	.byte	0x8e
	.uleb128 0xd
	.align	4
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI46-.LFB10
	.byte	0x13
	.sleb128 -5
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
	.byte	0x13
	.sleb128 -7
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
	.byte	0x13
	.sleb128 -9
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0x13
	.sleb128 -11
	.byte	0x4
	.4byte	.LCFI51-.LCFI49
	.byte	0x86
	.uleb128 0x9
	.byte	0x84
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x5
	.byte	0x80
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0x13
	.sleb128 -13
	.byte	0x12
	.uleb128 0xe
	.sleb128 -14
	.byte	0x8e
	.uleb128 0xd
	.align	4
.LEFDE20:
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 3 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h"
	.section	.debug_info,info
	.4byte	0x7bc
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../error.c"
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
	.4byte	0x106
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x2
	.byte	0x31
	.4byte	0xe3
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x5
	.asciz	"tagINTCON1BITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x37fa
	.4byte	0x2bc
	.uleb128 0x6
	.asciz	"OSCFAIL"
	.byte	0x3
	.2byte	0x37fc
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x162
	.uleb128 0x5
	.asciz	"tagINTCON3BITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x3820
	.4byte	0x359
	.uleb128 0x6
	.asciz	"APLL"
	.byte	0x3
	.2byte	0x3821
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x2d0
	.uleb128 0x5
	.asciz	"tagINTCON4BITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x382e
	.4byte	0x3ae
	.uleb128 0x6
	.asciz	"SGHT"
	.byte	0x3
	.2byte	0x382f
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x36d
	.uleb128 0x8
	.byte	0x2
	.byte	0x3
	.2byte	0x4f20
	.4byte	0x440
	.uleb128 0x6
	.asciz	"OSWEN"
	.byte	0x3
	.2byte	0x4f21
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x4c2
	.uleb128 0x6
	.asciz	"NOSC0"
	.byte	0x3
	.2byte	0x4f2e
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x13d
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
	.4byte	0x4d6
	.uleb128 0xa
	.4byte	0x3c2
	.uleb128 0xa
	.4byte	0x440
	.byte	0x0
	.uleb128 0x5
	.asciz	"tagOSCCONBITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x4f1e
	.4byte	0x4f6
	.uleb128 0xb
	.4byte	0x4c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.asciz	"OSCCONBITS"
	.byte	0x3
	.2byte	0x4f37
	.4byte	0x4d6
	.uleb128 0xc
	.byte	0x1
	.asciz	"Set_ErrFlag"
	.byte	0x1
	.byte	0x24
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0x554
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x1
	.byte	0x24
	.4byte	0x13d
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0xe
	.asciz	"Idx"
	.byte	0x1
	.byte	0x25
	.4byte	0x12e
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0xe
	.asciz	"Mask"
	.byte	0x1
	.byte	0x26
	.4byte	0x12e
	.byte	0x2
	.byte	0x7e
	.sleb128 1
	.byte	0x0
	.uleb128 0xf
	.byte	0x1
	.asciz	"Get_ErrFlag"
	.byte	0x1
	.byte	0x32
	.byte	0x1
	.4byte	0x5a3
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.4byte	0x5a3
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x1
	.byte	0x32
	.4byte	0x13d
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0xe
	.asciz	"Idx"
	.byte	0x1
	.byte	0x33
	.4byte	0x12e
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0xe
	.asciz	"Mask"
	.byte	0x1
	.byte	0x34
	.4byte	0x12e
	.byte	0x2
	.byte	0x7e
	.sleb128 1
	.byte	0x0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.asciz	"_Bool"
	.uleb128 0xf
	.byte	0x1
	.asciz	"Get_ErrPage"
	.byte	0x1
	.byte	0x3e
	.byte	0x1
	.4byte	0x12e
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.4byte	0x5ec
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x1
	.byte	0x3e
	.4byte	0x13d
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0xe
	.asciz	"Idx"
	.byte	0x1
	.byte	0x3f
	.4byte	0x12e
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0xc
	.byte	0x1
	.asciz	"Clear_ErrFlag"
	.byte	0x1
	.byte	0x48
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5e
	.4byte	0x639
	.uleb128 0xd
	.4byte	.LASF0
	.byte	0x1
	.byte	0x48
	.4byte	0x13d
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0xe
	.asciz	"Idx"
	.byte	0x1
	.byte	0x49
	.4byte	0x12e
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0xe
	.asciz	"Mask"
	.byte	0x1
	.byte	0x4a
	.4byte	0x12e
	.byte	0x2
	.byte	0x7e
	.sleb128 1
	.byte	0x0
	.uleb128 0xc
	.byte	0x1
	.asciz	"Reset_ErrRegs"
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5e
	.4byte	0x669
	.uleb128 0xe
	.asciz	"Ret"
	.byte	0x1
	.byte	0x55
	.4byte	0xa0
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x10
	.byte	0x1
	.asciz	"_OscillatorFail"
	.byte	0x1
	.byte	0x64
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5e
	.uleb128 0x10
	.byte	0x1
	.asciz	"_AddressError"
	.byte	0x1
	.byte	0x75
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5e
	.uleb128 0x10
	.byte	0x1
	.asciz	"_StackError"
	.byte	0x1
	.byte	0x80
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x5e
	.uleb128 0x10
	.byte	0x1
	.asciz	"_MathError"
	.byte	0x1
	.byte	0x8b
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x5e
	.uleb128 0x10
	.byte	0x1
	.asciz	"_SoftTrapError"
	.byte	0x1
	.byte	0xae
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x5e
	.uleb128 0x10
	.byte	0x1
	.asciz	"_HardTrapError"
	.byte	0x1
	.byte	0xbd
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x5e
	.uleb128 0x11
	.4byte	.LASF1
	.byte	0x3
	.2byte	0x380c
	.4byte	0x724
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.4byte	0x2bc
	.uleb128 0x11
	.4byte	.LASF2
	.byte	0x3
	.2byte	0x382a
	.4byte	0x737
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.4byte	0x359
	.uleb128 0x11
	.4byte	.LASF3
	.byte	0x3
	.2byte	0x3832
	.4byte	0x74a
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.4byte	0x3ae
	.uleb128 0x11
	.4byte	.LASF4
	.byte	0x3
	.2byte	0x4f38
	.4byte	0x75d
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.4byte	0x4f6
	.uleb128 0x13
	.4byte	0x12e
	.4byte	0x772
	.uleb128 0x14
	.4byte	0xe3
	.byte	0x13
	.byte	0x0
	.uleb128 0xe
	.asciz	"ErrRegs"
	.byte	0x1
	.byte	0x18
	.4byte	0x762
	.byte	0x5
	.byte	0x3
	.4byte	_ErrRegs
	.uleb128 0x11
	.4byte	.LASF1
	.byte	0x3
	.2byte	0x380c
	.4byte	0x724
	.byte	0x1
	.byte	0x1
	.uleb128 0x11
	.4byte	.LASF2
	.byte	0x3
	.2byte	0x382a
	.4byte	0x737
	.byte	0x1
	.byte	0x1
	.uleb128 0x11
	.4byte	.LASF3
	.byte	0x3
	.2byte	0x3832
	.4byte	0x74a
	.byte	0x1
	.byte	0x1
	.uleb128 0x11
	.4byte	.LASF4
	.byte	0x3
	.2byte	0x4f38
	.4byte	0x75d
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
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
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
	.4byte	0x7c0
	.4byte	0x509
	.asciz	"Set_ErrFlag"
	.4byte	0x554
	.asciz	"Get_ErrFlag"
	.4byte	0x5ac
	.asciz	"Get_ErrPage"
	.4byte	0x5ec
	.asciz	"Clear_ErrFlag"
	.4byte	0x639
	.asciz	"Reset_ErrRegs"
	.4byte	0x669
	.asciz	"_OscillatorFail"
	.4byte	0x688
	.asciz	"_AddressError"
	.4byte	0x6a5
	.asciz	"_StackError"
	.4byte	0x6c0
	.asciz	"_MathError"
	.4byte	0x6da
	.asciz	"_SoftTrapError"
	.4byte	0x6f8
	.asciz	"_HardTrapError"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0xb1
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x7c0
	.4byte	0x12e
	.asciz	"uint8_t"
	.4byte	0x13d
	.asciz	"uint16_t"
	.4byte	0x162
	.asciz	"tagINTCON1BITS"
	.4byte	0x2bc
	.asciz	"INTCON1BITS"
	.4byte	0x2d0
	.asciz	"tagINTCON3BITS"
	.4byte	0x359
	.asciz	"INTCON3BITS"
	.4byte	0x36d
	.asciz	"tagINTCON4BITS"
	.4byte	0x3ae
	.asciz	"INTCON4BITS"
	.4byte	0x4d6
	.asciz	"tagOSCCONBITS"
	.4byte	0x4f6
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
	.word 0x0001
	.word 0x0000

; MCHP configuration words

	.set ___PA___,0
	.end
