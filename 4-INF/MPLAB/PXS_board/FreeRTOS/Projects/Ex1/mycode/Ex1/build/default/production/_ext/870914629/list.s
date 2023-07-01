	.file "C:\\Users\\Filippo\\Desktop\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\..\\source\\list.c"
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
	.global	_vListInitialise	; export
	.type	_vListInitialise,@function
_vListInitialise:
.LFB0:
	.file 1 "../../source/list.c"
	.loc 1 80 0
	.set ___PA___,1
	.loc 1 84 0
	add	w0,#4,w1
	mov	w1,[w0+2]
	.loc 1 88 0
	setm	w2
	mov	w2,[w0+4]
	.loc 1 92 0
	mov	w1,[w0+6]
	.loc 1 93 0
	mov	w1,[w0+8]
	.loc 1 95 0
	clr	[w0]
	.loc 1 101 0
	return	
	.set ___PA___,0
.LFE0:
	.size	_vListInitialise, .-_vListInitialise
	.align	2
	.global	_vListInitialiseItem	; export
	.type	_vListInitialiseItem,@function
_vListInitialiseItem:
.LFB1:
	.loc 1 105 0
	.set ___PA___,1
	.loc 1 107 0
	clr	w1
	mov	w1,[w0+8]
	.loc 1 113 0
	return	
	.set ___PA___,0
.LFE1:
	.size	_vListInitialiseItem, .-_vListInitialiseItem
	.align	2
	.global	_vListInsertEnd	; export
	.type	_vListInsertEnd,@function
_vListInsertEnd:
.LFB2:
	.loc 1 117 0
	.set ___PA___,1
	.loc 1 118 0
	mov	[w0+2],w2
	.loc 1 129 0
	mov	w2,[w1+2]
	.loc 1 130 0
	mov	[w2+4],w3
	mov	w3,[w1+4]
	.loc 1 135 0
	mov	[w2+4],w3
	mov	w1,[w3+2]
	.loc 1 136 0
	mov	w1,[w2+4]
	.loc 1 139 0
	mov	w0,[w1+8]
	.loc 1 141 0
	inc	[w0],[w0]
	.loc 1 142 0
	return	
	.set ___PA___,0
.LFE2:
	.size	_vListInsertEnd, .-_vListInsertEnd
	.align	2
	.global	_vListInsert	; export
	.type	_vListInsert,@function
_vListInsert:
.LFB3:
	.loc 1 146 0
	.set ___PA___,1
	.loc 1 148 0
	mov	[w1],w4
	.loc 1 164 0
	add	w4,#1,[w15]
	.set ___BP___,19
	bra	z,.L16
	.loc 1 192 0
	add	w0,#4,w3
	mov	[w3+2],w2
	sub	w4,[w2],[w15]
	.set ___BP___,9
	bra	ltu,.L12
.L14:
	mov	w2,w3
	mov	[w3+2],w2
	sub	w4,[w2],[w15]
	.set ___BP___,91
	bra	geu,.L14
.L12:
	.loc 1 199 0
	mov	w2,[w1+2]
	.loc 1 200 0
	mov	w1,[w2+4]
	.loc 1 201 0
	mov	w3,[w1+4]
	.loc 1 202 0
	mov	w1,[w3+2]
	.loc 1 206 0
	mov	w0,[w1+8]
	.loc 1 208 0
	inc	[w0],[w0]
	.loc 1 209 0
	return	
.L17:
	.set ___PA___,0
.L16:
	.loc 1 166 0
	mov	[w0+8],w3
	mov	[w3+2],w2
	.loc 1 199 0
	mov	w2,[w1+2]
	.loc 1 200 0
	mov	w1,[w2+4]
	.loc 1 201 0
	mov	w3,[w1+4]
	.loc 1 202 0
	mov	w1,[w3+2]
	.loc 1 206 0
	mov	w0,[w1+8]
	.loc 1 208 0
	inc	[w0],[w0]
	.loc 1 209 0
	return	
	bra	.L17
.LFE3:
	.size	_vListInsert, .-_vListInsert
	.align	2
	.global	_uxListRemove	; export
	.type	_uxListRemove,@function
_uxListRemove:
.LFB4:
	.loc 1 213 0
	.set ___PA___,1
	.loc 1 216 0
	mov	[w0+8],w1
	.loc 1 218 0
	mov	[w0+2],w2
	mov	[w0+4],w3
	mov	w3,[w2+4]
	.loc 1 219 0
	mov	[w0+4],w3
	mov	w2,[w3+2]
	.loc 1 225 0
	mov	[w1+2],w2
	sub	w2,w0,[w15]
	.set ___BP___,21
	bra	z,.L22
	.loc 1 234 0
	clr	w2
	mov	w2,[w0+8]
	.loc 1 235 0
	dec	[w1],w0
	mov	w0,[w1]
	.loc 1 238 0
	return	
.L23:
	.set ___PA___,0
.L22:
	.loc 1 227 0
	mov	w3,[w1+2]
	.loc 1 234 0
	clr	w2
	mov	w2,[w0+8]
	.loc 1 235 0
	dec	[w1],w0
	mov	w0,[w1]
	.loc 1 238 0
	return	
	bra	.L23
.LFE4:
	.size	_uxListRemove, .-_uxListRemove
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
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 3 "../../source/include/../../Source/portable/MPLAB/PIC24_dsPIC/portmacro.h"
	.file 4 "../../source/include/list.h"
	.section	.debug_info,info
	.4byte	0x439
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../../source/list.c"
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
	.4byte	0xea
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"UBaseType_t"
	.byte	0x3
	.byte	0x62
	.4byte	0xd4
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x3
	.byte	0x65
	.4byte	0x12d
	.uleb128 0x5
	.asciz	"xLIST_ITEM"
	.byte	0xa
	.byte	0x4
	.byte	0xb5
	.4byte	0x1ed
	.uleb128 0x6
	.4byte	.LASF0
	.byte	0x4
	.byte	0xb8
	.4byte	0x172
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"pxNext"
	.byte	0x4
	.byte	0xb9
	.4byte	0x1ed
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.4byte	.LASF1
	.byte	0x4
	.byte	0xba
	.4byte	0x1ed
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.asciz	"pvOwner"
	.byte	0x4
	.byte	0xbb
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x7
	.asciz	"pvContainer"
	.byte	0x4
	.byte	0xbc
	.4byte	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x184
	.uleb128 0x4
	.asciz	"ListItem_t"
	.byte	0x4
	.byte	0xbf
	.4byte	0x184
	.uleb128 0x5
	.asciz	"xMINI_LIST_ITEM"
	.byte	0x6
	.byte	0x4
	.byte	0xc1
	.4byte	0x24b
	.uleb128 0x6
	.4byte	.LASF0
	.byte	0x4
	.byte	0xc4
	.4byte	0x172
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"pxNext"
	.byte	0x4
	.byte	0xc5
	.4byte	0x1ed
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.4byte	.LASF1
	.byte	0x4
	.byte	0xc6
	.4byte	0x1ed
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.asciz	"MiniListItem_t"
	.byte	0x4
	.byte	0xc8
	.4byte	0x205
	.uleb128 0x5
	.asciz	"xLIST"
	.byte	0xa
	.byte	0x4
	.byte	0xcd
	.4byte	0x2af
	.uleb128 0x7
	.asciz	"uxNumberOfItems"
	.byte	0x4
	.byte	0xd0
	.4byte	0x15f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"pxIndex"
	.byte	0x4
	.byte	0xd1
	.4byte	0x2af
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x7
	.asciz	"xListEnd"
	.byte	0x4
	.byte	0xd2
	.4byte	0x24b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x1f3
	.uleb128 0x4
	.asciz	"List_t"
	.byte	0x4
	.byte	0xd4
	.4byte	0x261
	.uleb128 0x9
	.byte	0x1
	.asciz	"vListInitialise"
	.byte	0x1
	.byte	0x4f
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5f
	.4byte	0x2f4
	.uleb128 0xa
	.4byte	.LASF2
	.byte	0x1
	.byte	0x4f
	.4byte	0x2f4
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0xb
	.4byte	0x2f9
	.uleb128 0x8
	.byte	0x2
	.4byte	0x2b5
	.uleb128 0x9
	.byte	0x1
	.asciz	"vListInitialiseItem"
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5f
	.4byte	0x337
	.uleb128 0xc
	.asciz	"pxItem"
	.byte	0x1
	.byte	0x68
	.4byte	0x337
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0xb
	.4byte	0x2af
	.uleb128 0x9
	.byte	0x1
	.asciz	"vListInsertEnd"
	.byte	0x1
	.byte	0x74
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5f
	.4byte	0x38a
	.uleb128 0xa
	.4byte	.LASF2
	.byte	0x1
	.byte	0x74
	.4byte	0x2f4
	.byte	0x1
	.byte	0x50
	.uleb128 0xa
	.4byte	.LASF3
	.byte	0x1
	.byte	0x74
	.4byte	0x337
	.byte	0x1
	.byte	0x51
	.uleb128 0xd
	.asciz	"pxIndex"
	.byte	0x1
	.byte	0x76
	.4byte	0x337
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.uleb128 0x9
	.byte	0x1
	.asciz	"vListInsert"
	.byte	0x1
	.byte	0x91
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5f
	.4byte	0x3f1
	.uleb128 0xa
	.4byte	.LASF2
	.byte	0x1
	.byte	0x91
	.4byte	0x2f4
	.byte	0x1
	.byte	0x50
	.uleb128 0xa
	.4byte	.LASF3
	.byte	0x1
	.byte	0x91
	.4byte	0x337
	.byte	0x1
	.byte	0x51
	.uleb128 0xe
	.asciz	"pxIterator"
	.byte	0x1
	.byte	0x93
	.4byte	0x2af
	.uleb128 0xd
	.asciz	"xValueOfInsertion"
	.byte	0x1
	.byte	0x94
	.4byte	0x3f1
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0xb
	.4byte	0x172
	.uleb128 0xf
	.byte	0x1
	.asciz	"uxListRemove"
	.byte	0x1
	.byte	0xd4
	.byte	0x1
	.4byte	0x15f
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5f
	.uleb128 0xc
	.asciz	"pxItemToRemove"
	.byte	0x1
	.byte	0xd4
	.4byte	0x337
	.byte	0x1
	.byte	0x50
	.uleb128 0x10
	.4byte	.LASF2
	.byte	0x1
	.byte	0xd8
	.4byte	0x2f4
	.byte	0x1
	.byte	0x51
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
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
	.uleb128 0xb
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
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
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x6e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x43d
	.4byte	0x2c3
	.asciz	"vListInitialise"
	.4byte	0x2ff
	.asciz	"vListInitialiseItem"
	.4byte	0x33c
	.asciz	"vListInsertEnd"
	.4byte	0x38a
	.asciz	"vListInsert"
	.4byte	0x3f6
	.asciz	"uxListRemove"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x94
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x43d
	.4byte	0x12d
	.asciz	"uint16_t"
	.4byte	0x15f
	.asciz	"UBaseType_t"
	.4byte	0x172
	.asciz	"TickType_t"
	.4byte	0x184
	.asciz	"xLIST_ITEM"
	.4byte	0x1f3
	.asciz	"ListItem_t"
	.4byte	0x205
	.asciz	"xMINI_LIST_ITEM"
	.4byte	0x24b
	.asciz	"MiniListItem_t"
	.4byte	0x261
	.asciz	"xLIST"
	.4byte	0x2b5
	.asciz	"List_t"
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
.LASF3:
	.asciz	"pxNewListItem"
.LASF2:
	.asciz	"pxList"
.LASF1:
	.asciz	"pxPrevious"
.LASF0:
	.asciz	"xItemValue"
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
