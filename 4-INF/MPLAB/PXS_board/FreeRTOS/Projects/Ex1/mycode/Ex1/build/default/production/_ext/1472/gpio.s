	.file "C:\\Users\\Filippo\\Desktop\\Projects\\Ex1\\mycode\\Ex1\\..\\gpio.c"
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
	.global	_Config_GPIO	; export
	.type	_Config_GPIO,@function
_Config_GPIO:
.LFB0:
	.file 1 "../gpio.c"
	.loc 1 30 0
	.set ___PA___,1
	lnk	#204
.LCFI0:
	mov	w0,[w14+194]
	mov	w1,[w14+196]
	mov	w2,[w14+198]
	mov	w3,[w14+200]
	mov	w4,[w14+202]
	.loc 1 31 0
	mov	[w14+194],w0
	mov.b	[w0],[w14]
	.loc 1 32 0
	mov	[w14+194],w0
	inc	w0,w0
	mov.b	[w0],w1
	mov.b	w1,[w14+1]
	.loc 1 33 0
	mov.b	[w14+1],w0
	ze	w0,w0
	mov	#1,w1
	sl	w1,w0,w0
	mov	w0,[w14+2]
	.loc 1 34 0
	mov.b	[w14+1],w0
	sub.b	w0,#15,[w15]
	.set ___BP___,0
	bra	gtu,.L2
	mov.b	[w14],w0
	sub.b	w0,#4,[w15]
	.set ___BP___,0
	bra	gtu,.L2
	.loc 1 36 0
	mov.b	[w14+196],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L3
	.loc 1 37 0
	mov	#3584,w0
	mov	w0,[w14+184]
	mov	#3612,w0
	mov	w0,[w14+186]
	mov	#3640,w0
	mov	w0,[w14+188]
	mov	#3668,w0
	mov	w0,[w14+190]
	mov	#3696,w0
	mov	w0,[w14+192]
	ze	[w14],w0
	add	w0,w0,w0
	add	#184,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	ior	w0,w2,w0
	mov	w0,[w1]
	bra	.L4
.L3:
	.loc 1 38 0
	mov.b	[w14+196],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L5
	.loc 1 39 0
	mov	#3584,w0
	mov	w0,[w14+174]
	mov	#3612,w0
	mov	w0,[w14+176]
	mov	#3640,w0
	mov	w0,[w14+178]
	mov	#3668,w0
	mov	w0,[w14+180]
	mov	#3696,w0
	mov	w0,[w14+182]
	ze	[w14],w0
	add	w0,w0,w0
	add	#174,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	bra	.L4
.L5:
	.loc 1 41 0
	mov	#2,w0
	rcall	_Set_ErrFlag
.L4:
	.loc 1 44 0
	mov.b	[w14+197],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L6
	.loc 1 45 0
	mov	#3586,w0
	mov	w0,[w14+164]
	mov	#3614,w0
	mov	w0,[w14+166]
	mov	#3642,w0
	mov	w0,[w14+168]
	mov	#3670,w0
	mov	w0,[w14+170]
	mov	#3698,w0
	mov	w0,[w14+172]
	ze	[w14],w0
	add	w0,w0,w0
	add	#164,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	ior	w0,w2,w0
	mov	w0,[w1]
	bra	.L7
.L6:
	.loc 1 46 0
	mov.b	[w14+197],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L8
	.loc 1 47 0
	mov	#3586,w0
	mov	w0,[w14+154]
	mov	#3614,w0
	mov	w0,[w14+156]
	mov	#3642,w0
	mov	w0,[w14+158]
	mov	#3670,w0
	mov	w0,[w14+160]
	mov	#3698,w0
	mov	w0,[w14+162]
	ze	[w14],w0
	add	w0,w0,w0
	add	#154,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	bra	.L7
.L8:
	.loc 1 49 0
	mov	#4,w0
	rcall	_Set_ErrFlag
.L7:
	.loc 1 51 0
	mov.b	[w14+196],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L9
	mov.b	[w14+197],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L9
	.loc 1 53 0
	mov.b	[w14+199],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L10
	.loc 1 54 0
	mov	#3596,w0
	mov	w0,[w14+144]
	mov	#3624,w0
	mov	w0,[w14+146]
	mov	#3652,w0
	mov	w0,[w14+148]
	mov	#3680,w0
	mov	w0,[w14+150]
	mov	#3708,w0
	mov	w0,[w14+152]
	ze	[w14],w0
	add	w0,w0,w0
	add	#144,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	ior	w0,w2,w0
	mov	w0,[w1]
	bra	.L11
.L10:
	.loc 1 55 0
	mov.b	[w14+199],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L12
	.loc 1 56 0
	mov	#3596,w0
	mov	w0,[w14+134]
	mov	#3624,w0
	mov	w0,[w14+136]
	mov	#3652,w0
	mov	w0,[w14+138]
	mov	#3680,w0
	mov	w0,[w14+140]
	mov	#3708,w0
	mov	w0,[w14+142]
	ze	[w14],w0
	add	w0,w0,w0
	add	#134,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	bra	.L11
.L12:
	.loc 1 58 0
	mov	#8,w0
	rcall	_Set_ErrFlag
.L11:
	.loc 1 61 0
	mov.b	[w14+198],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L13
	mov.b	[w14+199],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L13
	.loc 1 62 0
	mov	#3594,w0
	mov	w0,[w14+124]
	mov	#3622,w0
	mov	w0,[w14+126]
	mov	#3650,w0
	mov	w0,[w14+128]
	mov	#3678,w0
	mov	w0,[w14+130]
	mov	#3706,w0
	mov	w0,[w14+132]
	ze	[w14],w0
	add	w0,w0,w0
	add	#124,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	ior	w0,w2,w0
	mov	w0,[w1]
	bra	.L14
.L13:
	.loc 1 63 0
	mov.b	[w14+198],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L15
	.loc 1 64 0
	mov	#3594,w0
	mov	w0,[w14+114]
	mov	#3622,w0
	mov	w0,[w14+116]
	mov	#3650,w0
	mov	w0,[w14+118]
	mov	#3678,w0
	mov	w0,[w14+120]
	mov	#3706,w0
	mov	w0,[w14+122]
	ze	[w14],w0
	add	w0,w0,w0
	add	#114,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	bra	.L14
.L15:
	.loc 1 66 0
	mov	#16,w0
	rcall	_Set_ErrFlag
.L14:
	.loc 1 70 0
	mov.b	[w14+201],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L16
	.loc 1 71 0
	mov	#3600,w0
	mov	w0,[w14+104]
	mov	#3628,w0
	mov	w0,[w14+106]
	mov	#3656,w0
	mov	w0,[w14+108]
	mov	#3684,w0
	mov	w0,[w14+110]
	mov	#3712,w0
	mov	w0,[w14+112]
	ze	[w14],w0
	add	w0,w0,w0
	add	#104,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	ior	w0,w2,w0
	mov	w0,[w1]
	bra	.L17
.L16:
	.loc 1 72 0
	mov.b	[w14+201],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L18
	.loc 1 73 0
	mov	#3600,w0
	mov	w0,[w14+94]
	mov	#3628,w0
	mov	w0,[w14+96]
	mov	#3656,w0
	mov	w0,[w14+98]
	mov	#3684,w0
	mov	w0,[w14+100]
	mov	#3712,w0
	mov	w0,[w14+102]
	ze	[w14],w0
	add	w0,w0,w0
	add	#94,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	bra	.L17
.L18:
	.loc 1 75 0
	mov	#32,w0
	rcall	_Set_ErrFlag
.L17:
	.loc 1 78 0
	mov.b	[w14+202],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L19
	.loc 1 79 0
	mov	#3604,w0
	mov	w0,[w14+84]
	mov	#3632,w0
	mov	w0,[w14+86]
	mov	#3660,w0
	mov	w0,[w14+88]
	mov	#3688,w0
	mov	w0,[w14+90]
	mov	#3716,w0
	mov	w0,[w14+92]
	ze	[w14],w0
	add	w0,w0,w0
	add	#84,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	ior	w0,w2,w0
	mov	w0,[w1]
	.loc 1 78 0
	bra	.L22
.L19:
	.loc 1 80 0
	mov.b	[w14+202],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L21
	.loc 1 81 0
	mov	#3604,w0
	mov	w0,[w14+74]
	mov	#3632,w0
	mov	w0,[w14+76]
	mov	#3660,w0
	mov	w0,[w14+78]
	mov	#3688,w0
	mov	w0,[w14+80]
	mov	#3716,w0
	mov	w0,[w14+82]
	ze	[w14],w0
	add	w0,w0,w0
	add	#74,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	.loc 1 78 0
	bra	.L22
.L21:
	.loc 1 83 0
	mov	#32,w0
	rcall	_Set_ErrFlag
	.loc 1 78 0
	bra	.L22
.L9:
	.loc 1 86 0
	mov	#3596,w0
	mov	w0,[w14+64]
	mov	#3624,w0
	mov	w0,[w14+66]
	mov	#3652,w0
	mov	w0,[w14+68]
	mov	#3680,w0
	mov	w0,[w14+70]
	mov	#3708,w0
	mov	w0,[w14+72]
	ze	[w14],w0
	add	w0,w0,w0
	add	#64,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	.loc 1 87 0
	mov	#3594,w0
	mov	w0,[w14+54]
	mov	#3622,w0
	mov	w0,[w14+56]
	mov	#3650,w0
	mov	w0,[w14+58]
	mov	#3678,w0
	mov	w0,[w14+60]
	mov	#3706,w0
	mov	w0,[w14+62]
	ze	[w14],w0
	add	w0,w0,w0
	add	#54,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	.loc 1 88 0
	mov	#3600,w0
	mov	w0,[w14+44]
	mov	#3628,w0
	mov	w0,[w14+46]
	mov	#3656,w0
	mov	w0,[w14+48]
	mov	#3684,w0
	mov	w0,[w14+50]
	mov	#3712,w0
	mov	w0,[w14+52]
	ze	[w14],w0
	add	w0,w0,w0
	add	#44,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	.loc 1 89 0
	mov	#3604,w0
	mov	w0,[w14+34]
	mov	#3632,w0
	mov	w0,[w14+36]
	mov	#3660,w0
	mov	w0,[w14+38]
	mov	#3688,w0
	mov	w0,[w14+40]
	mov	#3716,w0
	mov	w0,[w14+42]
	ze	[w14],w0
	add	w0,w0,w0
	add	#34,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
.L22:
	.loc 1 92 0
	mov.b	[w14+197],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L23
	.loc 1 93 0
	mov.b	[w14+200],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L24
	.loc 1 94 0
	mov	#3592,w0
	mov	w0,[w14+24]
	mov	#3620,w0
	mov	w0,[w14+26]
	mov	#3648,w0
	mov	w0,[w14+28]
	mov	#3676,w0
	mov	w0,[w14+30]
	mov	#3704,w0
	mov	w0,[w14+32]
	ze	[w14],w0
	add	w0,w0,w0
	add	w0,#24,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	ior	w0,w2,w0
	mov	w0,[w1]
	.loc 1 92 0
	bra	.L1
.L24:
	.loc 1 95 0
	mov.b	[w14+200],w0
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L26
	.loc 1 96 0
	mov	#3592,w0
	mov	w0,[w14+14]
	mov	#3620,w0
	mov	w0,[w14+16]
	mov	#3648,w0
	mov	w0,[w14+18]
	mov	#3676,w0
	mov	w0,[w14+20]
	mov	#3704,w0
	mov	w0,[w14+22]
	ze	[w14],w0
	add	w0,w0,w0
	add	w0,#14,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	.loc 1 92 0
	bra	.L1
.L26:
	.loc 1 98 0
	mov	#64,w0
	rcall	_Set_ErrFlag
	.loc 1 92 0
	bra	.L1
.L23:
	.loc 1 101 0
	mov	#3592,w0
	mov	w0,[w14+4]
	mov	#3620,w0
	mov	w0,[w14+6]
	mov	#3648,w0
	mov	w0,[w14+8]
	mov	#3676,w0
	mov	w0,[w14+10]
	mov	#3704,w0
	mov	w0,[w14+12]
	ze	[w14],w0
	add	w0,w0,w0
	add	w0,#4,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	.loc 1 92 0
	bra	.L1
.L2:
	.loc 1 104 0
	mov	#1,w0
	rcall	_Set_ErrFlag
.L1:
	.loc 1 107 0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.size	_Config_GPIO, .-_Config_GPIO
	.align	2
	.global	_Get_GPIO	; export
	.type	_Get_GPIO,@function
_Get_GPIO:
.LFB1:
	.loc 1 115 0
	.set ___PA___,1
	lnk	#18
.LCFI1:
	mov	w0,[w14+16]
	.loc 1 116 0
	mov	[w14+16],w0
	mov.b	[w0],w1
	mov.b	w1,[w14+1]
	.loc 1 117 0
	mov	[w14+16],w0
	inc	w0,w0
	mov.b	[w0],w1
	mov.b	w1,[w14+2]
	.loc 1 118 0
	mov	#1,w0
	mov	w0,[w14+4]
	.loc 1 119 0
	setm.b	w0
	mov.b	w0,[w14]
	.loc 1 120 0
	mov.b	[w14+2],w0
	sub.b	w0,#15,[w15]
	.set ___BP___,0
	bra	gtu,.L29
	mov.b	[w14+1],w0
	sub.b	w0,#4,[w15]
	.set ___BP___,0
	bra	gtu,.L29
	.loc 1 121 0
	mov	#3588,w0
	mov	w0,[w14+6]
	mov	#3616,w0
	mov	w0,[w14+8]
	mov	#3644,w0
	mov	w0,[w14+10]
	mov	#3672,w0
	mov	w0,[w14+12]
	mov	#3700,w0
	mov	w0,[w14+14]
	mov.b	[w14+1],w0
	ze	w0,w0
	add	w0,w0,w0
	add	w0,#6,w0
	mov	[w14+w0],w0
	mov	[w0],w1
	mov.b	[w14+2],w0
	ze	w0,w0
	lsr	w1,w0,w0
	mov.b	w0,w1
	mov	[w14+4],w0
	mov.b	w0,w0
	and.b	w1,w0,[w14]
	bra	.L30
.L29:
	.loc 1 123 0
	mov	#1,w0
	rcall	_Set_ErrFlag
.L30:
	.loc 1 125 0
	mov.b	[w14],w0
	.loc 1 126 0
	ulnk	
	return	
	.set ___PA___,0
.LFE1:
	.size	_Get_GPIO, .-_Get_GPIO
	.align	2
	.global	_Set_GPIO	; export
	.type	_Set_GPIO,@function
_Set_GPIO:
.LFB2:
	.loc 1 134 0
	.set ___PA___,1
	lnk	#28
.LCFI2:
	mov	w0,[w14+24]
	mov.b	w1,[w14+26]
	.loc 1 135 0
	mov	[w14+24],w0
	mov.b	[w0],[w14]
	.loc 1 136 0
	mov	[w14+24],w0
	inc	w0,w0
	mov.b	[w0],w1
	mov.b	w1,[w14+1]
	.loc 1 137 0
	mov.b	[w14+1],w0
	ze	w0,w0
	mov	#1,w1
	sl	w1,w0,w0
	mov	w0,[w14+2]
	.loc 1 138 0
	mov.b	[w14+26],w0
	cp0.b	w0
	.set ___BP___,0
	bra	z,.L32
	mov.b	[w14+26],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L33
.L32:
	.loc 1 139 0
	mov.b	[w14+1],w0
	sub.b	w0,#15,[w15]
	.set ___BP___,0
	bra	gtu,.L34
	mov.b	[w14],w0
	sub.b	w0,#4,[w15]
	.set ___BP___,0
	bra	gtu,.L34
	.loc 1 140 0
	mov.b	[w14+26],w0
	sub.b	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L35
	.loc 1 141 0
	mov	#3590,w0
	mov	w0,[w14+14]
	mov	#3618,w0
	mov	w0,[w14+16]
	mov	#3646,w0
	mov	w0,[w14+18]
	mov	#3674,w0
	mov	w0,[w14+20]
	mov	#3702,w0
	mov	w0,[w14+22]
	ze	[w14],w0
	add	w0,w0,w0
	add	w0,#14,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	ior	w0,w2,w0
	mov	w0,[w1]
	bra	.L36
.L35:
	.loc 1 143 0
	mov	#3590,w0
	mov	w0,[w14+4]
	mov	#3618,w0
	mov	w0,[w14+6]
	mov	#3646,w0
	mov	w0,[w14+8]
	mov	#3674,w0
	mov	w0,[w14+10]
	mov	#3702,w0
	mov	w0,[w14+12]
	ze	[w14],w0
	add	w0,w0,w0
	add	w0,#4,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
.L36:
	.loc 1 140 0
	nop	
	.loc 1 139 0
	bra	.L31
.L34:
	.loc 1 146 0
	mov	#1,w0
	rcall	_Set_ErrFlag
	.loc 1 139 0
	bra	.L31
.L33:
	.loc 1 149 0
	mov	#128,w0
	rcall	_Set_ErrFlag
.L31:
	.loc 1 151 0
	ulnk	
	return	
	.set ___PA___,0
.LFE2:
	.size	_Set_GPIO, .-_Set_GPIO
	.align	2
	.global	_Toggle_GPIO	; export
	.type	_Toggle_GPIO,@function
_Toggle_GPIO:
.LFB3:
	.loc 1 158 0
	.set ___PA___,1
	lnk	#26
.LCFI3:
	mov	w0,[w14+24]
	.loc 1 159 0
	mov	[w14+24],w0
	mov.b	[w0],[w14]
	.loc 1 160 0
	mov	[w14+24],w0
	inc	w0,w0
	mov.b	[w0],w1
	mov.b	w1,[w14+1]
	.loc 1 161 0
	mov.b	[w14+1],w0
	ze	w0,w0
	mov	#1,w1
	sl	w1,w0,w0
	mov	w0,[w14+2]
	.loc 1 162 0
	mov.b	[w14+1],w0
	sub.b	w0,#15,[w15]
	.set ___BP___,0
	bra	gtu,.L40
	mov.b	[w14],w0
	sub.b	w0,#4,[w15]
	.set ___BP___,0
	bra	gtu,.L40
	.loc 1 163 0
	mov	[w14+24],w0
	rcall	_Get_GPIO
	cp0.b	w0
	.set ___BP___,0
	bra	nz,.L41
	.loc 1 164 0
	mov	#3590,w0
	mov	w0,[w14+14]
	mov	#3618,w0
	mov	w0,[w14+16]
	mov	#3646,w0
	mov	w0,[w14+18]
	mov	#3674,w0
	mov	w0,[w14+20]
	mov	#3702,w0
	mov	w0,[w14+22]
	ze	[w14],w0
	add	w0,w0,w0
	add	w0,#14,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	ior	w0,w2,w0
	mov	w0,[w1]
	.loc 1 163 0
	bra	.L39
.L41:
	.loc 1 166 0
	mov	#3590,w0
	mov	w0,[w14+4]
	mov	#3618,w0
	mov	w0,[w14+6]
	mov	#3646,w0
	mov	w0,[w14+8]
	mov	#3674,w0
	mov	w0,[w14+10]
	mov	#3702,w0
	mov	w0,[w14+12]
	ze	[w14],w0
	add	w0,w0,w0
	add	w0,#4,w0
	mov	[w14+w0],w0
	mov	w0,w1
	mov	[w0],w2
	mov	[w14+2],w0
	com	w0,w0
	and	w2,w0,w0
	mov	w0,[w1]
	.loc 1 163 0
	bra	.L39
.L40:
	.loc 1 169 0
	mov	#1,w0
	rcall	_Set_ErrFlag
.L39:
	.loc 1 172 0
	ulnk	
	return	
	.set ___PA___,0
.LFE3:
	.size	_Toggle_GPIO, .-_Toggle_GPIO
	.align	2
	.global	_Unlock_GPIOs	; export
	.type	_Unlock_GPIOs,@function
_Unlock_GPIOs:
.LFB4:
	.loc 1 178 0
	.set ___PA___,1
	lnk	#0
.LCFI4:
	.loc 1 179 0
	mov	_OSCCON,w0
	mov	w0,w2
	bclr	w2,#6
	mov	#70,w0
	mov	#87,w1
	mov	#_OSCCON,w3
	mov.b	w0,[w3]
	mov.b	w1,[w3]
	mov.b	w2,[w3]
	.loc 1 180 0
	ulnk	
	return	
	.set ___PA___,0
.LFE4:
	.size	_Unlock_GPIOs, .-_Unlock_GPIOs
	.align	2
	.global	_Lock_GPIOs	; export
	.type	_Lock_GPIOs,@function
_Lock_GPIOs:
.LFB5:
	.loc 1 186 0
	.set ___PA___,1
	lnk	#0
.LCFI5:
	.loc 1 187 0
	mov	_OSCCON,w0
	mov	w0,w2
	bset	w2,#6
	mov	#70,w0
	mov	#87,w1
	mov	#_OSCCON,w3
	mov.b	w0,[w3]
	mov.b	w1,[w3]
	mov.b	w2,[w3]
	.loc 1 188 0
	ulnk	
	return	
	.set ___PA___,0
.LFE5:
	.size	_Lock_GPIOs, .-_Lock_GPIOs
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
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 3 "../gpio.h"
	.file 4 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h"
	.section	.debug_info,info
	.4byte	0x3d9
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../gpio.c"
	.asciz	"C:\\Users\\Filippo\\Desktop\\Projects\\Ex1\\mycode\\Ex1"
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.asciz	"long long int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.asciz	"long long unsigned int"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.asciz	"short unsigned int"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.asciz	"unsigned int"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.asciz	"long int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.asciz	"signed char"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.asciz	"char"
	.uleb128 0x3
	.asciz	"uint8_t"
	.byte	0x2
	.byte	0x2b
	.4byte	0xf8
	.uleb128 0x3
	.asciz	"uint16_t"
	.byte	0x2
	.byte	0x31
	.4byte	0xd5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x4
	.byte	0x7
	.byte	0x3
	.byte	0x1c
	.4byte	0x1d1
	.uleb128 0x5
	.asciz	"AnaDig"
	.byte	0x3
	.byte	0x1d
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x5
	.asciz	"InOut"
	.byte	0x3
	.byte	0x1e
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x5
	.asciz	"PullUp"
	.byte	0x3
	.byte	0x1f
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x5
	.asciz	"PullDw"
	.byte	0x3
	.byte	0x20
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x5
	.asciz	"OpenDr"
	.byte	0x3
	.byte	0x21
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.asciz	"CnEn0"
	.byte	0x3
	.byte	0x22
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x5
	.asciz	"CnEn1"
	.byte	0x3
	.byte	0x23
	.4byte	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0x0
	.uleb128 0x3
	.asciz	"gpio_t"
	.byte	0x3
	.byte	0x24
	.4byte	0x154
	.uleb128 0x6
	.byte	0x1
	.asciz	"Config_GPIO"
	.byte	0x1
	.byte	0x1e
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0x24c
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x1
	.byte	0x1e
	.4byte	0x24c
	.byte	0x3
	.byte	0x7e
	.sleb128 194
	.uleb128 0x8
	.asciz	"Param"
	.byte	0x1
	.byte	0x1e
	.4byte	0x1d1
	.byte	0x3
	.byte	0x7e
	.sleb128 196
	.uleb128 0x9
	.asciz	"Sect"
	.byte	0x1
	.byte	0x1f
	.4byte	0x120
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x9
	.asciz	"Numb"
	.byte	0x1
	.byte	0x20
	.4byte	0x120
	.byte	0x2
	.byte	0x7e
	.sleb128 1
	.uleb128 0x9
	.asciz	"Mask"
	.byte	0x1
	.byte	0x21
	.4byte	0x12f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0xa
	.byte	0x2
	.4byte	0x120
	.uleb128 0xb
	.byte	0x1
	.asciz	"Get_GPIO"
	.byte	0x1
	.byte	0x73
	.byte	0x1
	.4byte	0x120
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.4byte	0x2bc
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x1
	.byte	0x73
	.4byte	0x24c
	.byte	0x2
	.byte	0x7e
	.sleb128 16
	.uleb128 0x9
	.asciz	"Sect"
	.byte	0x1
	.byte	0x74
	.4byte	0x120
	.byte	0x2
	.byte	0x7e
	.sleb128 1
	.uleb128 0x9
	.asciz	"Numb"
	.byte	0x1
	.byte	0x75
	.4byte	0x120
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x9
	.asciz	"Mask"
	.byte	0x1
	.byte	0x76
	.4byte	0x12f
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x9
	.asciz	"Val"
	.byte	0x1
	.byte	0x77
	.4byte	0x120
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x6
	.byte	0x1
	.asciz	"Set_GPIO"
	.byte	0x1
	.byte	0x86
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.4byte	0x324
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x1
	.byte	0x86
	.4byte	0x24c
	.byte	0x2
	.byte	0x7e
	.sleb128 24
	.uleb128 0x8
	.asciz	"State"
	.byte	0x1
	.byte	0x86
	.4byte	0x120
	.byte	0x2
	.byte	0x7e
	.sleb128 26
	.uleb128 0x9
	.asciz	"Sect"
	.byte	0x1
	.byte	0x87
	.4byte	0x120
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x9
	.asciz	"Numb"
	.byte	0x1
	.byte	0x88
	.4byte	0x120
	.byte	0x2
	.byte	0x7e
	.sleb128 1
	.uleb128 0x9
	.asciz	"Mask"
	.byte	0x1
	.byte	0x89
	.4byte	0x12f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x6
	.byte	0x1
	.asciz	"Toggle_GPIO"
	.byte	0x1
	.byte	0x9e
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5e
	.4byte	0x37f
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x1
	.byte	0x9e
	.4byte	0x24c
	.byte	0x2
	.byte	0x7e
	.sleb128 24
	.uleb128 0x9
	.asciz	"Sect"
	.byte	0x1
	.byte	0x9f
	.4byte	0x120
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x9
	.asciz	"Numb"
	.byte	0x1
	.byte	0xa0
	.4byte	0x120
	.byte	0x2
	.byte	0x7e
	.sleb128 1
	.uleb128 0x9
	.asciz	"Mask"
	.byte	0x1
	.byte	0xa1
	.4byte	0x12f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0xc
	.byte	0x1
	.asciz	"Unlock_GPIOs"
	.byte	0x1
	.byte	0xb2
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5e
	.uleb128 0xc
	.byte	0x1
	.asciz	"Lock_GPIOs"
	.byte	0x1
	.byte	0xba
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5e
	.uleb128 0xd
	.asciz	"OSCCON"
	.byte	0x4
	.2byte	0x4f1d
	.4byte	0x3c6
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.4byte	0x12f
	.uleb128 0xd
	.asciz	"OSCCON"
	.byte	0x4
	.2byte	0x4f1d
	.4byte	0x3c6
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xc
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x68
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x3dd
	.4byte	0x1df
	.asciz	"Config_GPIO"
	.4byte	0x252
	.asciz	"Get_GPIO"
	.4byte	0x2bc
	.asciz	"Set_GPIO"
	.4byte	0x324
	.asciz	"Toggle_GPIO"
	.4byte	0x37f
	.asciz	"Unlock_GPIOs"
	.4byte	0x39b
	.asciz	"Lock_GPIOs"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x32
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x3dd
	.4byte	0x120
	.asciz	"uint8_t"
	.4byte	0x12f
	.asciz	"uint16_t"
	.4byte	0x1d1
	.asciz	"gpio_t"
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
.LASF0:
	.asciz	"PinId"
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
