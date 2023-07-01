	.file "C:\\Users\\Filippo\\Desktop\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\gpio.c"
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
	add	#206,w15
.LCFI0:
	mov.d	w8,[w15++]
.LCFI1:
	mov.d	w10,[w15++]
.LCFI2:
	mov.d	w12,[w15++]
.LCFI3:
	mov	w14,[w15++]
.LCFI4:
	mov	w1,[w15-28]
	mov	w2,[w15-26]
	mov	w3,[w15-24]
	mov	w4,[w15-22]
	.loc 1 30 0
	mov.b	[w15-28],w11
	mov.b	[w15-27],w10
	mov.b	[w15-26],w2
	mov.b	[w15-25],w13
	mov.b	[w15-24],w12
	mov.b	[w15-23],w1
	mov.b	[w15-22],w14
	.loc 1 31 0
	mov.b	[w0],w8
	.loc 1 32 0
	mov.b	[w0+1],w3
	.loc 1 34 0
	sub.b	w3,#15,[w15]
	.set ___BP___,29
	bra	gtu,.L2
	sub.b	w8,#4,[w15]
	.set ___BP___,50
	bra	gtu,.L2
	.loc 1 33 0
	ze	w3,w3
	mov	#1,w0
	sl	w0,w3,w3
	.loc 1 36 0
	sub.b	w11,#1,[w15]
	.set ___BP___,28
	bra	z,.L27
	.loc 1 38 0
	cp0.b	w11
	.set ___BP___,29
	bra	nz,.L5
	.loc 1 39 0
	mov	#3584,w0
	mov	w0,[w15-208]
	add	w0,#28,w0
	mov	w0,[w15-206]
	add	w0,#28,w0
	mov	w0,[w15-204]
	add	w0,#28,w0
	mov	w0,[w15-202]
	add	w0,#28,w0
	mov	w0,[w15-200]
	ze	w8,w8
	add	w8,w8,w8
	mov	#-208,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	com	w3,w9
	and	w9,[w0],[w0]
.L4:
	.loc 1 44 0
	sub.b	w10,#1,[w15]
	.set ___BP___,28
	bra	z,.L28
	.loc 1 46 0
	cp0.b	w10
	.set ___BP___,29
	bra	nz,.L8
	.loc 1 47 0
	mov	#3586,w0
	mov	w0,[w15-188]
	add	w0,#28,w0
	mov	w0,[w15-186]
	add	w0,#28,w0
	mov	w0,[w15-184]
	add	w0,#28,w0
	mov	w0,[w15-182]
	add	w0,#28,w0
	mov	w0,[w15-180]
	mov	#-188,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	and	w9,[w0],[w0]
.L7:
	.loc 1 51 0
	cp0.b	w11
	.set ___BP___,50
	bra	nz,.L9
	sub.b	w10,#1,[w15]
	.set ___BP___,28
	bra	z,.L29
.L9:
	.loc 1 86 0
	mov	#3596,w0
	mov	w0,[w15-98]
	add	w0,#28,w0
	mov	w0,[w15-96]
	add	w0,#28,w0
	mov	w0,[w15-94]
	add	w0,#28,w0
	mov	w0,[w15-92]
	add	w0,#28,w0
	mov	w0,[w15-90]
	mov	#-98,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	and	w9,[w0],[w0]
	.loc 1 87 0
	mov	#3594,w0
	mov	w0,[w15-88]
	add	w0,#28,w0
	mov	w0,[w15-86]
	add	w0,#28,w0
	mov	w0,[w15-84]
	add	w0,#28,w0
	mov	w0,[w15-82]
	add	w0,#28,w0
	mov	w0,[w15-80]
	mov	#-88,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	and	w9,[w0],[w0]
	.loc 1 88 0
	mov	#3600,w0
	mov	w0,[w15-78]
	add	w0,#28,w0
	mov	w0,[w15-76]
	add	w0,#28,w0
	mov	w0,[w15-74]
	add	w0,#28,w0
	mov	w0,[w15-72]
	add	w0,#28,w0
	mov	w0,[w15-70]
	mov	#-78,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	and	w9,[w0],[w0]
	.loc 1 89 0
	mov	#3604,w0
	mov	w0,[w15-68]
	add	w0,#28,w0
	mov	w0,[w15-66]
	add	w0,#28,w0
	mov	w0,[w15-64]
	add	w0,#28,w0
	mov	w0,[w15-62]
	add	w0,#28,w0
	mov	w0,[w15-60]
	mov	#-68,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	and	w9,[w0],[w0]
	.loc 1 92 0
	cp0.b	w10
	.set ___BP___,29
	bra	nz,.L22
	.loc 1 93 0
	sub.b	w12,#1,[w15]
	.set ___BP___,19
	bra	z,.L30
	.loc 1 95 0
	cp0.b	w12
	.set ___BP___,29
	bra	nz,.L25
	.loc 1 96 0
	mov	#3592,w0
	mov	w0,[w15-48]
	add	w0,#28,w0
	mov	w0,[w15-46]
	add	w0,#28,w0
	mov	w0,[w15-44]
	add	w0,#28,w0
	mov	w0,[w15-42]
	add	w0,#28,w0
	mov	w0,[w15-40]
	sub	#48,w8
	mov	[w15+w8],w0
	and	w9,[w0],[w0]
	.loc 1 107 0
	mov	[--w15],w14
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	sub	w15,#206
	return	
.L36:
	.set ___PA___,0
.L2:
	.loc 1 104 0
	mov	#1,w0
	rcall	_Set_ErrFlag
	.loc 1 107 0
	mov	[--w15],w14
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	sub	w15,#206
	return	
	bra	.L36
.L5:
	.loc 1 41 0
	mov	#2,w0
	mov	w1,[w15-18]
	mov	w2,[w15-20]
	mov	w3,[w15-16]
	rcall	_Set_ErrFlag
	ze	w8,w8
	mov	[w15-16],w3
	com	w3,w9
	add	w8,w8,w8
	mov	[w15-20],w2
	mov	[w15-18],w1
	bra	.L4
.L29:
	.loc 1 53 0
	sub.b	w13,#1,[w15]
	.set ___BP___,28
	bra	z,.L31
	.loc 1 55 0
	cp0.b	w13
	.set ___BP___,29
	bra	nz,.L12
	.loc 1 56 0
	mov	#3596,w0
	mov	w0,[w15-168]
	add	w0,#28,w0
	mov	w0,[w15-166]
	add	w0,#28,w0
	mov	w0,[w15-164]
	add	w0,#28,w0
	mov	w0,[w15-162]
	add	w0,#28,w0
	mov	w0,[w15-160]
	mov	#-168,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	and	w9,[w0],[w0]
.L11:
	.loc 1 61 0
	sub.b	w2,#1,[w15]
	.set ___BP___,28
	bra	z,.L32
	.loc 1 63 0
	cp0.b	w2
	.set ___BP___,15
	bra	nz,.L14
	.loc 1 64 0
	mov	#3594,w0
	mov	w0,[w15-148]
	add	w0,#28,w0
	mov	w0,[w15-146]
	add	w0,#28,w0
	mov	w0,[w15-144]
	add	w0,#28,w0
	mov	w0,[w15-142]
	add	w0,#28,w0
	mov	w0,[w15-140]
	mov	#-148,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	and	w9,[w0],[w0]
.L15:
	.loc 1 70 0
	sub.b	w1,#1,[w15]
	.set ___BP___,28
	bra	z,.L33
	.loc 1 72 0
	cp0.b	w1
	.set ___BP___,29
	bra	nz,.L18
	.loc 1 73 0
	mov	#3600,w0
	mov	w0,[w15-128]
	add	w0,#28,w0
	mov	w0,[w15-126]
	add	w0,#28,w0
	mov	w0,[w15-124]
	add	w0,#28,w0
	mov	w0,[w15-122]
	add	w0,#28,w0
	mov	w0,[w15-120]
	mov	#-128,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	and	w9,[w0],[w0]
.L17:
	.loc 1 78 0
	sub.b	w14,#1,[w15]
	.set ___BP___,28
	bra	z,.L34
	.loc 1 80 0
	cp0.b	w14
	.set ___BP___,29
	bra	nz,.L21
	.loc 1 81 0
	mov	#3604,w0
	mov	w0,[w15-108]
	add	w0,#28,w0
	mov	w0,[w15-106]
	add	w0,#28,w0
	mov	w0,[w15-104]
	add	w0,#28,w0
	mov	w0,[w15-102]
	add	w0,#28,w0
	mov	w0,[w15-100]
	mov	#-108,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	and	w9,[w0],[w0]
.L22:
	.loc 1 101 0
	mov	#3592,w0
	mov	w0,[w15-38]
	add	w0,#28,w0
	mov	w0,[w15-36]
	add	w0,#28,w0
	mov	w0,[w15-34]
	add	w0,#28,w0
	mov	w0,[w15-32]
	add	w0,#28,w0
	mov	w0,[w15-30]
	sub	#38,w8
	mov	[w15+w8],w0
	and	w9,[w0],[w0]
.L35:
	.loc 1 107 0
	mov	[--w15],w14
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	sub	w15,#206
	return	
	bra	.L36
.L27:
	.loc 1 37 0
	mov	#3584,w0
	mov	w0,[w15-218]
	add	w0,#28,w0
	mov	w0,[w15-216]
	add	w0,#28,w0
	mov	w0,[w15-214]
	add	w0,#28,w0
	mov	w0,[w15-212]
	add	w0,#28,w0
	mov	w0,[w15-210]
	ze	w8,w8
	add	w8,w8,w8
	mov	#-218,w4
	add	w4,w8,w4
	mov	[w15+w4],w0
	ior	w3,[w0],[w0]
	com	w3,w9
	bra	.L4
.L28:
	.loc 1 45 0
	mov	#3586,w0
	mov	w0,[w15-198]
	add	w0,#28,w0
	mov	w0,[w15-196]
	add	w0,#28,w0
	mov	w0,[w15-194]
	add	w0,#28,w0
	mov	w0,[w15-192]
	add	w0,#28,w0
	mov	w0,[w15-190]
	mov	#-198,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	ior	w3,[w0],[w0]
	bra	.L7
.L8:
	.loc 1 49 0
	mov	#4,w0
	mov	w1,[w15-18]
	mov	w2,[w15-20]
	mov	w3,[w15-16]
	rcall	_Set_ErrFlag
	mov	[w15-16],w3
	mov	[w15-20],w2
	mov	[w15-18],w1
	bra	.L7
.L25:
	.loc 1 98 0
	mov	#64,w0
	rcall	_Set_ErrFlag
	.loc 1 107 0
	mov	[--w15],w14
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	sub	w15,#206
	return	
	bra	.L36
.L30:
	.loc 1 94 0
	mov	#3592,w0
	mov	w0,[w15-58]
	add	w0,#28,w0
	mov	w0,[w15-56]
	add	w0,#28,w0
	mov	w0,[w15-54]
	add	w0,#28,w0
	mov	w0,[w15-52]
	add	w0,#28,w0
	mov	w0,[w15-50]
	sub	#58,w8
	mov	[w15+w8],w0
	ior	w3,[w0],[w0]
	.loc 1 107 0
	mov	[--w15],w14
	mov.d	[--w15],w12
	mov.d	[--w15],w10
	mov.d	[--w15],w8
	sub	w15,#206
	return	
	bra	.L36
.L33:
	.loc 1 71 0
	mov	#3600,w0
	mov	w0,[w15-138]
	add	w0,#28,w0
	mov	w0,[w15-136]
	add	w0,#28,w0
	mov	w0,[w15-134]
	add	w0,#28,w0
	mov	w0,[w15-132]
	add	w0,#28,w0
	mov	w0,[w15-130]
	mov	#-138,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	ior	w3,[w0],[w0]
	bra	.L17
.L31:
	.loc 1 54 0
	mov	#3596,w0
	mov	w0,[w15-178]
	add	w0,#28,w0
	mov	w0,[w15-176]
	add	w0,#28,w0
	mov	w0,[w15-174]
	add	w0,#28,w0
	mov	w0,[w15-172]
	add	w0,#28,w0
	mov	w0,[w15-170]
	mov	#-178,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	ior	w3,[w0],[w0]
	bra	.L11
.L32:
	.loc 1 61 0
	cp0.b	w13
	.set ___BP___,50
	bra	nz,.L14
	.loc 1 62 0
	mov	#3594,w0
	mov	w0,[w15-158]
	add	w0,#28,w0
	mov	w0,[w15-156]
	add	w0,#28,w0
	mov	w0,[w15-154]
	add	w0,#28,w0
	mov	w0,[w15-152]
	add	w0,#28,w0
	mov	w0,[w15-150]
	mov	#-158,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	ior	w3,[w0],[w0]
	bra	.L15
.L34:
	.loc 1 79 0
	mov	#3604,w0
	mov	w0,[w15-118]
	add	w0,#28,w0
	mov	w0,[w15-116]
	add	w0,#28,w0
	mov	w0,[w15-114]
	add	w0,#28,w0
	mov	w0,[w15-112]
	add	w0,#28,w0
	mov	w0,[w15-110]
	mov	#-118,w0
	add	w0,w8,w0
	mov	[w15+w0],w0
	ior	w3,[w0],[w0]
	.loc 1 101 0
	mov	#3592,w0
	mov	w0,[w15-38]
	add	w0,#28,w0
	mov	w0,[w15-36]
	add	w0,#28,w0
	mov	w0,[w15-34]
	add	w0,#28,w0
	mov	w0,[w15-32]
	add	w0,#28,w0
	mov	w0,[w15-30]
	sub	#38,w8
	mov	[w15+w8],w0
	and	w9,[w0],[w0]
	bra	.L35
.L14:
	.loc 1 66 0
	mov	#16,w0
	mov	w1,[w15-18]
	mov	w3,[w15-16]
	rcall	_Set_ErrFlag
	mov	[w15-16],w3
	mov	[w15-18],w1
	bra	.L15
.L18:
	.loc 1 75 0
	mov	#32,w0
	mov	w3,[w15-16]
	rcall	_Set_ErrFlag
	mov	[w15-16],w3
	bra	.L17
.L12:
	.loc 1 58 0
	mov	#8,w0
	mov	w1,[w15-18]
	mov	w2,[w15-20]
	mov	w3,[w15-16]
	rcall	_Set_ErrFlag
	mov	[w15-16],w3
	mov	[w15-20],w2
	mov	[w15-18],w1
	bra	.L11
.L21:
	.loc 1 83 0
	mov	#32,w0
	rcall	_Set_ErrFlag
	.loc 1 101 0
	mov	#3592,w0
	mov	w0,[w15-38]
	add	w0,#28,w0
	mov	w0,[w15-36]
	add	w0,#28,w0
	mov	w0,[w15-34]
	add	w0,#28,w0
	mov	w0,[w15-32]
	add	w0,#28,w0
	mov	w0,[w15-30]
	sub	#38,w8
	mov	[w15+w8],w0
	and	w9,[w0],[w0]
	bra	.L35
.LFE0:
	.size	_Config_GPIO, .-_Config_GPIO
	.align	2
	.global	_Get_GPIO	; export
	.type	_Get_GPIO,@function
_Get_GPIO:
.LFB1:
	.loc 1 115 0
	.set ___PA___,1
	lnk	#10
.LCFI5:
	.loc 1 116 0
	mov.b	[w0],w1
	.loc 1 117 0
	mov.b	[w0+1],w0
	.loc 1 120 0
	sub.b	w0,#15,[w15]
	.set ___BP___,45
	bra	gtu,.L39
	sub.b	w1,#4,[w15]
	.set ___BP___,33
	bra	leu,.L42
.L39:
	.loc 1 123 0
	mov	#1,w0
	rcall	_Set_ErrFlag
	.loc 1 119 0
	setm.b	w0
	.loc 1 126 0
	ulnk	
	return	
.L43:
	.set ___PA___,0
.L42:
	.loc 1 121 0
	mov	#3588,w2
	mov	w2,[w15-10]
	add	w2,#28,w2
	mov	w2,[w15-8]
	add	w2,#28,w2
	mov	w2,[w15-6]
	add	w2,#28,w2
	mov	w2,[w15-4]
	add	w2,#28,w2
	mov	w2,[w15-2]
	ze	w1,w1
	add	w1,w1,w1
	sub	w1,#10,w1
	mov	[w15+w1],w1
	mov	[w1],w1
	ze	w0,w0
	lsr	w1,w0,w0
	and.b	w0,#1,w0
	.loc 1 126 0
	ulnk	
	return	
	bra	.L43
.LFE1:
	.size	_Get_GPIO, .-_Get_GPIO
	.align	2
	.global	_Set_GPIO	; export
	.type	_Set_GPIO,@function
_Set_GPIO:
.LFB2:
	.loc 1 134 0
	.set ___PA___,1
	lnk	#20
.LCFI6:
	.loc 1 135 0
	mov.b	[w0],w2
	.loc 1 136 0
	mov.b	[w0+1],w0
	.loc 1 138 0
	sub.b	w1,#1,[w15]
	.set ___BP___,47
	bra	leu,.L51
	.loc 1 149 0
	mov	#128,w0
	rcall	_Set_ErrFlag
	.loc 1 151 0
	ulnk	
	return	
.L53:
	.set ___PA___,0
.L51:
	.loc 1 139 0
	sub.b	w0,#15,[w15]
	.set ___BP___,20
	bra	gtu,.L47
	sub.b	w2,#4,[w15]
	.set ___BP___,39
	bra	gtu,.L47
	.loc 1 137 0
	ze	w0,w0
	mov	#1,w3
	sl	w3,w0,w0
	.loc 1 140 0
	sub.b	w1,#1,[w15]
	.set ___BP___,28
	bra	z,.L52
	.loc 1 143 0
	mov	#3590,w1
	mov	w1,[w15-10]
	add	w1,#28,w1
	mov	w1,[w15-8]
	add	w1,#28,w1
	mov	w1,[w15-6]
	add	w1,#28,w1
	mov	w1,[w15-4]
	add	w1,#28,w1
	mov	w1,[w15-2]
	ze	w2,w2
	add	w2,w2,w2
	sub	w2,#10,w2
	mov	[w15+w2],w1
	com	w0,w0
	and	w0,[w1],[w1]
	.loc 1 151 0
	ulnk	
	return	
	bra	.L53
.L47:
	.loc 1 146 0
	mov	#1,w0
	rcall	_Set_ErrFlag
	.loc 1 151 0
	ulnk	
	return	
	bra	.L53
.L52:
	.loc 1 141 0
	mov	#3590,w1
	mov	w1,[w15-20]
	add	w1,#28,w1
	mov	w1,[w15-18]
	add	w1,#28,w1
	mov	w1,[w15-16]
	add	w1,#28,w1
	mov	w1,[w15-14]
	add	w1,#28,w1
	mov	w1,[w15-12]
	ze	w2,w2
	add	w2,w2,w2
	sub	w2,#20,w2
	mov	[w15+w2],w1
	ior	w0,[w1],[w1]
	.loc 1 151 0
	ulnk	
	return	
	bra	.L53
.LFE2:
	.size	_Set_GPIO, .-_Set_GPIO
	.align	2
	.global	_Toggle_GPIO	; export
	.type	_Toggle_GPIO,@function
_Toggle_GPIO:
.LFB3:
	.loc 1 158 0
	.set ___PA___,1
	lnk	#20
.LCFI7:
	mov.d	w8,[w15++]
.LCFI8:
	.loc 1 159 0
	mov.b	[w0],w8
	.loc 1 160 0
	mov.b	[w0+1],w9
	.loc 1 162 0
	sub.b	w9,#15,[w15]
	.set ___BP___,29
	bra	gtu,.L56
	sub.b	w8,#4,[w15]
	.set ___BP___,29
	bra	leu,.L60
.L56:
	.loc 1 169 0
	mov	#1,w0
	rcall	_Set_ErrFlag
	.loc 1 172 0
	mov.d	[--w15],w8
	ulnk	
	return	
.L61:
	.set ___PA___,0
.L60:
	.loc 1 161 0
	ze	w9,w9
	mov	#1,w1
	sl	w1,w9,w9
	.loc 1 163 0
	rcall	_Get_GPIO
	cp0.b	w0
	.set ___BP___,50
	bra	nz,.L57
	.loc 1 164 0
	mov	#3590,w0
	mov	w0,[w15-24]
	add	w0,#28,w0
	mov	w0,[w15-22]
	add	w0,#28,w0
	mov	w0,[w15-20]
	add	w0,#28,w0
	mov	w0,[w15-18]
	add	w0,#28,w0
	mov	w0,[w15-16]
	ze	w8,w8
	add	w8,w8,w8
	sub	w8,#24,w8
	mov	[w15+w8],w0
	ior	w9,[w0],[w0]
	.loc 1 172 0
	mov.d	[--w15],w8
	ulnk	
	return	
	bra	.L61
.L57:
	.loc 1 166 0
	mov	#3590,w0
	mov	w0,[w15-14]
	add	w0,#28,w0
	mov	w0,[w15-12]
	add	w0,#28,w0
	mov	w0,[w15-10]
	add	w0,#28,w0
	mov	w0,[w15-8]
	add	w0,#28,w0
	mov	w0,[w15-6]
	ze	w8,w8
	add	w8,w8,w8
	sub	w8,#14,w8
	mov	[w15+w8],w0
	com	w9,w9
	and	w9,[w0],[w0]
	.loc 1 172 0
	mov.d	[--w15],w8
	ulnk	
	return	
	bra	.L61
.LFE3:
	.size	_Toggle_GPIO, .-_Toggle_GPIO
	.align	2
	.global	_Unlock_GPIOs	; export
	.type	_Unlock_GPIOs,@function
_Unlock_GPIOs:
.LFB4:
	.loc 1 178 0
	.set ___PA___,1
	.loc 1 179 0
	mov	_OSCCON,w0
	bclr	w0,#6
	mov	#87,w2
	mov	#70,w1
	mov	#_OSCCON,w3
	mov.b	w1,[w3]
	mov.b	w2,[w3]
	mov.b	w0,[w3]
	.loc 1 180 0
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
	.loc 1 187 0
	mov	_OSCCON,w0
	bset	w0,#6
	mov	#87,w2
	mov	#70,w1
	mov	#_OSCCON,w3
	mov.b	w1,[w3]
	mov.b	w2,[w3]
	mov.b	w0,[w3]
	.loc 1 188 0
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
	.byte	0x13
	.sleb128 -105
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x13
	.sleb128 -107
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0x13
	.sleb128 -109
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0x13
	.sleb128 -111
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0x13
	.sleb128 -112
	.byte	0x8e
	.uleb128 0x6f
	.byte	0x8c
	.uleb128 0x6d
	.byte	0x8a
	.uleb128 0x6b
	.byte	0x88
	.uleb128 0x69
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI5-.LFB1
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
	.4byte	.LCFI6-.LFB2
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
	.4byte	.LCFI7-.LFB3
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0x88
	.uleb128 0xd
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
	.asciz	"C:\\Users\\Filippo\\Desktop\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1"
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
	.4byte	0x101
	.uleb128 0x3
	.asciz	"uint16_t"
	.byte	0x2
	.byte	0x31
	.4byte	0xde
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.byte	0x2
	.4byte	0x129
	.uleb128 0x5
	.byte	0x7
	.byte	0x3
	.byte	0x1c
	.4byte	0x1ed
	.uleb128 0x6
	.asciz	"AnaDig"
	.byte	0x3
	.byte	0x1d
	.4byte	0x129
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"InOut"
	.byte	0x3
	.byte	0x1e
	.4byte	0x129
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x6
	.asciz	"PullUp"
	.byte	0x3
	.byte	0x1f
	.4byte	0x129
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.asciz	"PullDw"
	.byte	0x3
	.byte	0x20
	.4byte	0x129
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x6
	.asciz	"OpenDr"
	.byte	0x3
	.byte	0x21
	.4byte	0x129
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.asciz	"CnEn0"
	.byte	0x3
	.byte	0x22
	.4byte	0x129
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.asciz	"CnEn1"
	.byte	0x3
	.byte	0x23
	.4byte	0x129
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0x0
	.uleb128 0x3
	.asciz	"gpio_t"
	.byte	0x3
	.byte	0x24
	.4byte	0x170
	.uleb128 0x7
	.byte	0x1
	.asciz	"Config_GPIO"
	.byte	0x1
	.byte	0x1e
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5f
	.4byte	0x262
	.uleb128 0x8
	.4byte	.LASF0
	.byte	0x1
	.byte	0x1e
	.4byte	0x16a
	.byte	0x1
	.byte	0x50
	.uleb128 0x9
	.asciz	"Param"
	.byte	0x1
	.byte	0x1e
	.4byte	0x1ed
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.asciz	"Sect"
	.byte	0x1
	.byte	0x1f
	.4byte	0x129
	.byte	0x1
	.byte	0x58
	.uleb128 0xa
	.asciz	"Numb"
	.byte	0x1
	.byte	0x20
	.4byte	0x129
	.byte	0x1
	.byte	0x53
	.uleb128 0xa
	.asciz	"Mask"
	.byte	0x1
	.byte	0x21
	.4byte	0x138
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.asciz	"Get_GPIO"
	.byte	0x1
	.byte	0x73
	.byte	0x1
	.4byte	0x129
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5f
	.4byte	0x2c5
	.uleb128 0x8
	.4byte	.LASF0
	.byte	0x1
	.byte	0x73
	.4byte	0x16a
	.byte	0x1
	.byte	0x50
	.uleb128 0xa
	.asciz	"Sect"
	.byte	0x1
	.byte	0x74
	.4byte	0x129
	.byte	0x1
	.byte	0x51
	.uleb128 0xa
	.asciz	"Numb"
	.byte	0x1
	.byte	0x75
	.4byte	0x129
	.byte	0x1
	.byte	0x50
	.uleb128 0xc
	.asciz	"Mask"
	.byte	0x1
	.byte	0x76
	.4byte	0x138
	.uleb128 0xa
	.asciz	"Val"
	.byte	0x1
	.byte	0x77
	.4byte	0x129
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x7
	.byte	0x1
	.asciz	"Set_GPIO"
	.byte	0x1
	.byte	0x86
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5f
	.4byte	0x328
	.uleb128 0x8
	.4byte	.LASF0
	.byte	0x1
	.byte	0x86
	.4byte	0x16a
	.byte	0x1
	.byte	0x50
	.uleb128 0x9
	.asciz	"State"
	.byte	0x1
	.byte	0x86
	.4byte	0x129
	.byte	0x1
	.byte	0x51
	.uleb128 0xa
	.asciz	"Sect"
	.byte	0x1
	.byte	0x87
	.4byte	0x129
	.byte	0x1
	.byte	0x52
	.uleb128 0xa
	.asciz	"Numb"
	.byte	0x1
	.byte	0x88
	.4byte	0x129
	.byte	0x1
	.byte	0x50
	.uleb128 0xa
	.asciz	"Mask"
	.byte	0x1
	.byte	0x89
	.4byte	0x138
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x7
	.byte	0x1
	.asciz	"Toggle_GPIO"
	.byte	0x1
	.byte	0x9e
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5f
	.4byte	0x37f
	.uleb128 0x8
	.4byte	.LASF0
	.byte	0x1
	.byte	0x9e
	.4byte	0x16a
	.byte	0x1
	.byte	0x50
	.uleb128 0xa
	.asciz	"Sect"
	.byte	0x1
	.byte	0x9f
	.4byte	0x129
	.byte	0x1
	.byte	0x58
	.uleb128 0xa
	.asciz	"Numb"
	.byte	0x1
	.byte	0xa0
	.4byte	0x129
	.byte	0x1
	.byte	0x59
	.uleb128 0xa
	.asciz	"Mask"
	.byte	0x1
	.byte	0xa1
	.4byte	0x138
	.byte	0x1
	.byte	0x59
	.byte	0x0
	.uleb128 0xd
	.byte	0x1
	.asciz	"Unlock_GPIOs"
	.byte	0x1
	.byte	0xb2
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5f
	.uleb128 0xd
	.byte	0x1
	.asciz	"Lock_GPIOs"
	.byte	0x1
	.byte	0xba
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5f
	.uleb128 0xe
	.asciz	"OSCCON"
	.byte	0x4
	.2byte	0x4f1d
	.4byte	0x3c6
	.byte	0x1
	.byte	0x1
	.uleb128 0xf
	.4byte	0x138
	.uleb128 0xe
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
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
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
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.4byte	0x1fb
	.asciz	"Config_GPIO"
	.4byte	0x262
	.asciz	"Get_GPIO"
	.4byte	0x2c5
	.asciz	"Set_GPIO"
	.4byte	0x328
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
	.4byte	0x129
	.asciz	"uint8_t"
	.4byte	0x138
	.asciz	"uint16_t"
	.4byte	0x1ed
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
