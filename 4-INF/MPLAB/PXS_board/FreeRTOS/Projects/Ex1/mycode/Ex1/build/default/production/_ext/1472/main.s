	.file "C:\\Users\\Filippo\\Desktop\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\main.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
	.section .const,psv,page
.LC0:
	.asciz	"LED0"
.LC1:
	.asciz	"LED1"
	.section	.text,code
	.align	2
	.global	_main	; export
	.type	_main,@function
_main:
.LFB0:
	.file 1 "../main.c"
	.loc 1 41 0
	.set ___PA___,1
	lnk	#2
.LCFI0:
	.loc 1 44 0
	rcall	_Init_Clock
	.loc 1 45 0
	rcall	_Init_GI
	.loc 1 48 0
	clr	w5
	mov	#2,w4
	mov	w5,w3
	mov	#256,w2
	mov	#.LC0,w1
	mov	#handle(_Blink_LED0),w0
	rcall	_xTaskCreate
	.loc 1 51 0
	mov.b	#1,w0
	mov.b	w0,[w15-2]
	mov.b	#14,w0
	mov.b	w0,[w15-1]
	.loc 1 50 0
	clr	w5
	mov	#3,w4
	dec2	w15,w3
	mov	#256,w2
	mov	#.LC1,w1
	mov	#handle(_Blink_LED1),w0
	rcall	_xTaskCreate
	.loc 1 54 0
	rcall	_vTaskStartScheduler
	.loc 1 57 0
	clr	w0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.size	_main, .-_main
	.align	2
	.global	_vApplicationIdleHook	; export
	.type	_vApplicationIdleHook,@function
_vApplicationIdleHook:
.LFB1:
	.loc 1 68 0
	.set ___PA___,1
	lnk	#2
.LCFI1:
	.loc 1 69 0
	rcall	_vCoRoutineSchedule
	.loc 1 70 0
	mov.b	#4,w0
	mov.b	w0,[w15-2]
	clr.b	w0
	mov.b	w0,[w15-1]
	dec2	w15,w0
	rcall	_Toggle_GPIO
	.loc 1 72 0
	ulnk	
	return	
	.set ___PA___,0
.LFE1:
	.size	_vApplicationIdleHook, .-_vApplicationIdleHook
	.global	_LogBuf	; export
	.section	.bss,bss
	.type	_LogBuf,@object
	.size	_LogBuf, 50
_LogBuf:
	.skip	50
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
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.section	.debug_info,info
	.4byte	0x1c8
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../main.c"
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
	.byte	0x1
	.asciz	"main"
	.byte	0x1
	.byte	0x29
	.byte	0x1
	.4byte	0xee
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5f
	.uleb128 0x5
	.byte	0x1
	.asciz	"vApplicationIdleHook"
	.byte	0x1
	.byte	0x44
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5f
	.uleb128 0x6
	.4byte	0x129
	.4byte	0x1b6
	.uleb128 0x7
	.4byte	0xde
	.byte	0x31
	.byte	0x0
	.uleb128 0x8
	.asciz	"LogBuf"
	.byte	0x1
	.byte	0x1f
	.4byte	0x1a6
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_LogBuf
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x3b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1cc
	.4byte	0x16a
	.asciz	"main"
	.4byte	0x182
	.asciz	"vApplicationIdleHook"
	.4byte	0x1b6
	.asciz	"LogBuf"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x27
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1cc
	.4byte	0x129
	.asciz	"uint8_t"
	.4byte	0x138
	.asciz	"uint16_t"
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
	.word 0x0000
	.word 0x0000

; MCHP configuration words

	.set ___PA___,0
	.end
