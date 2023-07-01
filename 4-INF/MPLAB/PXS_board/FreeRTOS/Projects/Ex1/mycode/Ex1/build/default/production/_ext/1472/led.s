	.file "C:\\Users\\Filippo\\Desktop\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\led.c"
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
	.global	_Blink_LED0	; export
	.type	_Blink_LED0,@function
_Blink_LED0:
.LFB0:
	.file 1 "../led.c"
	.loc 1 29 0
	.set ___PA___,1
	lnk	#14
.LCFI0:
	mov.d	w8,[w15++]
.LCFI1:
	.loc 1 30 0
	rcall	_Unlock_GPIOs
	.loc 1 32 0
	clr.b	w0
	mov.b	w0,[w15-12]
	.loc 1 33 0
	mov.b	w0,[w15-11]
	.loc 1 34 0
	mov.b	w0,[w15-8]
	.loc 1 35 0
	mov.b	#1,w8
	mov.b	w8,[w15-18]
	mov.b	#15,w9
	mov.b	w9,[w15-17]
	mov	[w15-12],w1
	mov	[w15-10],w2
	mov	[w15-8],w3
	mov	[w15-6],w4
	sub	w15,#18,w0
	rcall	_Config_GPIO
	.loc 1 36 0
	rcall	_Lock_GPIOs
	.loc 1 37 0
	mov.b	w8,[w15-16]
	mov.b	w9,[w15-15]
	mov.b	w8,w1
	sub	w15,#16,w0
	rcall	_Set_GPIO
.L2:
	.loc 1 39 0
	mov	#5,w0
	rcall	_vTaskDelay
	.loc 1 40 0
	mov.b	w8,[w15-14]
	mov.b	w9,[w15-13]
	sub	w15,#14,w0
	rcall	_Toggle_GPIO
	.loc 1 39 0
	mov	#5,w0
	rcall	_vTaskDelay
	.loc 1 40 0
	mov.b	w8,[w15-14]
	mov.b	w9,[w15-13]
	sub	w15,#14,w0
	rcall	_Toggle_GPIO
	bra	.L2
.LFE0:
	.size	_Blink_LED0, .-_Blink_LED0
	.align	2
	.global	_Blink_LED1	; export
	.type	_Blink_LED1,@function
_Blink_LED1:
.LFB1:
	.loc 1 48 0
	.set ___PA___,1
	lnk	#10
.LCFI2:
	mov	w8,[w15++]
.LCFI3:
	mov	w0,w8
	.loc 1 50 0
	rcall	_Unlock_GPIOs
	.loc 1 52 0
	clr.b	w0
	mov.b	w0,[w15-10]
	.loc 1 53 0
	mov.b	w0,[w15-9]
	.loc 1 54 0
	mov.b	w0,[w15-6]
	.loc 1 55 0
	mov	[w15-10],w1
	mov	[w15-8],w2
	mov	[w15-6],w3
	mov	[w15-4],w4
	mov	w8,w0
	rcall	_Config_GPIO
	.loc 1 56 0
	rcall	_Lock_GPIOs
	.loc 1 57 0
	mov.b	#1,w1
	mov	w8,w0
	rcall	_Set_GPIO
	.loc 1 58 0
	rcall	_xTaskGetTickCount
	mov	w0,[w15-12]
.L6:
	.loc 1 60 0
	mov	#17,w1
	sub	w15,#12,w0
	rcall	_vTaskDelayUntil
	.loc 1 61 0
	mov	w8,w0
	rcall	_Toggle_GPIO
	.loc 1 60 0
	mov	#17,w1
	sub	w15,#12,w0
	rcall	_vTaskDelayUntil
	.loc 1 61 0
	mov	w8,w0
	rcall	_Toggle_GPIO
	bra	.L6
.LFE1:
	.size	_Blink_LED1, .-_Blink_LED1
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
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x88
	.uleb128 0xa
	.align	4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI2-.LFB1
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0x88
	.uleb128 0x8
	.align	4
.LEFDE2:
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 3 "../../source/include/../../Source/portable/MPLAB/PIC24_dsPIC/portmacro.h"
	.file 4 "../gpio.h"
	.section	.debug_info,info
	.4byte	0x2ac
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../led.c"
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
	.4byte	0x102
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x2
	.byte	0x31
	.4byte	0xdf
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x3
	.byte	0x65
	.4byte	0x139
	.uleb128 0x5
	.byte	0x2
	.4byte	0x12a
	.uleb128 0x6
	.byte	0x7
	.byte	0x4
	.byte	0x1c
	.4byte	0x200
	.uleb128 0x7
	.asciz	"AnaDig"
	.byte	0x4
	.byte	0x1d
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.asciz	"InOut"
	.byte	0x4
	.byte	0x1e
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x7
	.asciz	"PullUp"
	.byte	0x4
	.byte	0x1f
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x7
	.asciz	"PullDw"
	.byte	0x4
	.byte	0x20
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x7
	.asciz	"OpenDr"
	.byte	0x4
	.byte	0x21
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.asciz	"CnEn0"
	.byte	0x4
	.byte	0x22
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x7
	.asciz	"CnEn1"
	.byte	0x4
	.byte	0x23
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0x0
	.uleb128 0x4
	.asciz	"gpio_t"
	.byte	0x4
	.byte	0x24
	.4byte	0x183
	.uleb128 0x8
	.byte	0x1
	.asciz	"Blink_LED0"
	.byte	0x1
	.byte	0x1d
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5f
	.4byte	0x248
	.uleb128 0x9
	.4byte	.LASF0
	.byte	0x1
	.byte	0x1d
	.4byte	0x9c
	.byte	0x1
	.byte	0x50
	.uleb128 0xa
	.asciz	"Par"
	.byte	0x1
	.byte	0x1f
	.4byte	0x200
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.uleb128 0x8
	.byte	0x1
	.asciz	"Blink_LED1"
	.byte	0x1
	.byte	0x30
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5f
	.4byte	0x2aa
	.uleb128 0x9
	.4byte	.LASF0
	.byte	0x1
	.byte	0x30
	.4byte	0x9c
	.byte	0x1
	.byte	0x50
	.uleb128 0xa
	.asciz	"GpioId"
	.byte	0x1
	.byte	0x31
	.4byte	0x2aa
	.byte	0x1
	.byte	0x58
	.uleb128 0xa
	.asciz	"Par"
	.byte	0x1
	.byte	0x33
	.4byte	0x200
	.byte	0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0xa
	.asciz	"xLastWakeTime"
	.byte	0x1
	.byte	0x3a
	.4byte	0x16b
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0x0
	.uleb128 0xb
	.4byte	0x17d
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
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2b0
	.4byte	0x20e
	.asciz	"Blink_LED0"
	.4byte	0x248
	.asciz	"Blink_LED1"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x41
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2b0
	.4byte	0x12a
	.asciz	"uint8_t"
	.4byte	0x139
	.asciz	"uint16_t"
	.4byte	0x16b
	.asciz	"TickType_t"
	.4byte	0x200
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
	.asciz	"pvParameters"
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
