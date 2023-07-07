	.file "C:\\Users\\Filippo\\Downloads\\FreeRTOS\\Projects\\Ex1\\mycode\\Ex1\\..\\misc.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
	.section	.nbss,bss,near
	.align	2
	.type	_Hdl_Queue,@object
	.size	_Hdl_Queue, 2
_Hdl_Queue:
	.skip	2
	.align	2
	.type	_Hdl_Semaphore,@object
	.size	_Hdl_Semaphore, 2
_Hdl_Semaphore:
	.skip	2
	.section .const,psv,page
.LC0:
	.asciz	"LED0"
.LC1:
	.asciz	"LED1"
	.section	.text,code
	.align	2
	.global	_ConfigMod_LEDs	; export
	.type	_ConfigMod_LEDs,@function
_ConfigMod_LEDs:
.LFB0:
	.file 1 "../misc.c"
	.loc 1 54 0
	.set ___PA___,1
	lnk	#4
.LCFI0:
	mov	w0,[w14+2]
	.loc 1 56 0
	clr	w5
	mov	#2,w4
	clr	w3
	mov	#140,w2
	mov	#.LC0,w1
	mov	#handle(_Blink_LED0),w0
	rcall	_xTaskCreate
	mov	w0,[w14]
	.loc 1 58 0
	mov	[w14],w0
	add	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L2
	.loc 1 59 0
	mov	#1025,w0
	rcall	_Set_ErrFlag
.L2:
	.loc 1 61 0
	clr	w5
	mov	#3,w4
	mov	[w14+2],w3
	mov	#140,w2
	mov	#.LC1,w1
	mov	#handle(_Blink_LED1),w0
	rcall	_xTaskCreate
	mov	w0,[w14]
	.loc 1 63 0
	mov	[w14],w0
	add	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L1
	.loc 1 64 0
	mov	#1025,w0
	rcall	_Set_ErrFlag
.L1:
	.loc 1 66 0
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.size	_ConfigMod_LEDs, .-_ConfigMod_LEDs
	.align	2
	.type	_Blink_LED0,@function
_Blink_LED0:
.LFB1:
	.loc 1 72 0
	.set ___PA___,1
	lnk	#16
.LCFI1:
	mov	w0,[w14+14]
	.loc 1 73 0
	rcall	_Unlock_GPIOs
	.loc 1 75 0
	clr.b	w0
	mov.b	w0,[w14+6]
	.loc 1 76 0
	clr.b	w0
	mov.b	w0,[w14+7]
	.loc 1 77 0
	clr.b	w0
	mov.b	w0,[w14+10]
	.loc 1 78 0
	mov.b	#1,w0
	mov.b	w0,[w14+4]
	mov.b	#15,w0
	mov.b	w0,[w14+5]
	add	w14,#4,w0
	mov	[w14+6],w1
	mov	[w14+8],w2
	mov	[w14+10],w3
	mov	[w14+12],w4
	rcall	_Config_GPIO
	.loc 1 79 0
	rcall	_Lock_GPIOs
	.loc 1 80 0
	mov.b	#1,w0
	mov.b	w0,[w14+2]
	mov.b	#15,w0
	mov.b	w0,[w14+3]
	inc2	w14,w0
	mov.b	#1,w1
	rcall	_Set_GPIO
.L5:
	.loc 1 82 0
	mov	#51,w0
	rcall	_vTaskDelay
	.loc 1 83 0
	mov.b	#1,w0
	mov.b	w0,[w14]
	mov.b	#15,w0
	mov.b	w0,[w14+1]
	mov	w14,w0
	rcall	_Toggle_GPIO
	.loc 1 84 0
	bra	.L5
.LFE1:
	.size	_Blink_LED0, .-_Blink_LED0
	.align	2
	.type	_Blink_LED1,@function
_Blink_LED1:
.LFB2:
	.loc 1 91 0
	.set ___PA___,1
	lnk	#14
.LCFI2:
	mov	w0,[w14+12]
	.loc 1 92 0
	mov	[w14+12],w1
	mov	w1,[w14]
	.loc 1 93 0
	rcall	_Unlock_GPIOs
	.loc 1 95 0
	clr.b	w0
	mov.b	w0,[w14+2]
	.loc 1 96 0
	clr.b	w0
	mov.b	w0,[w14+3]
	.loc 1 97 0
	clr.b	w0
	mov.b	w0,[w14+6]
	.loc 1 98 0
	mov	[w14+2],w1
	mov	[w14+4],w2
	mov	[w14+6],w3
	mov	[w14+8],w4
	mov	[w14],w0
	rcall	_Config_GPIO
	.loc 1 99 0
	rcall	_Lock_GPIOs
	.loc 1 100 0
	mov.b	#1,w1
	mov	[w14],w0
	rcall	_Set_GPIO
	.loc 1 101 0
	rcall	_xTaskGetTickCount
	mov	w0,[w14+10]
.L7:
	.loc 1 103 0
	add	w14,#10,w0
	mov	#9,w1
	rcall	_vTaskDelayUntil
	.loc 1 104 0
	mov	[w14],w0
	rcall	_Toggle_GPIO
	.loc 1 105 0
	bra	.L7
.LFE2:
	.size	_Blink_LED1, .-_Blink_LED1
	.section .const,psv,page
.LC2:
	.asciz	"TMR2"
	.section	.text,code
	.align	2
	.global	_ConfigMod_Stats	; export
	.type	_ConfigMod_Stats,@function
_ConfigMod_Stats:
.LFB3:
	.loc 1 114 0
	.set ___PA___,1
	lnk	#2
.LCFI3:
	.loc 1 115 0
	mov	#handle(_Print_Stats),w4
	mov	#2,w3
	mov	#1,w2
	mov	#1000,w1
	mov	#.LC2,w0
	rcall	_xTimerCreate
	mov	w0,[w14]
	.loc 1 117 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L9
	.loc 1 118 0
	mov	#1028,w0
	rcall	_Set_ErrFlag
	bra	.L8
.L9:
	.loc 1 120 0
	rcall	_xTaskGetTickCount
	clr	w4
	clr	w3
	mov	w0,w2
	mov	#1,w1
	mov	[w14],w0
	rcall	_xTimerGenericCommand
.L8:
	.loc 1 122 0
	ulnk	
	return	
	.set ___PA___,0
.LFE3:
	.size	_ConfigMod_Stats, .-_ConfigMod_Stats
	.section .const,psv,page
.LC3:
	.asciz	"NAME  "
.LC4:
	.asciz	" | "
.LC5:
	.asciz	"STA"
.LC6:
	.asciz	"PRT"
.LC7:
	.asciz	"STK-F"
.LC8:
	.asciz	"CPU-U"
.LC9:
	.asciz	"--------------------------------------"
.LC10:
	.asciz	" %"
.LC11:
	.asciz	"[#"
.LC12:
	.asciz	"] | Free Heap = "
.LC13:
	.asciz	" B\015\012"
.LC14:
	.asciz	"ERROR"
	.section	.text,code
	.align	2
	.type	_Print_Stats,@function
_Print_Stats:
.LFB4:
	.loc 1 128 0
	.set ___PA___,1
	lnk	#14
.LCFI4:
	mov.d	w8,[w15++]
.LCFI5:
	mov	w0,[w14+12]
	.loc 1 179 0
	mov	w15,w8
	.loc 1 128 0
	mov	w15,w0
	mov	w0,w9
	.loc 1 132 0
	rcall	_uxTaskGetNumberOfTasks
	mov	w0,[w14+2]
	.loc 1 133 0
	mov	[w14+2],w3
	mov	w3,w0
	dec	w0,w0
	mov	w0,[w14+4]
	mul.uu	w3,#1,w0
	mov	#160,w2
	mulw.ss	w1,w2,w2
	mulw.su	w0,#0,w4
	add	w2,w4,w2
	mov	#160,w4
	mul.uu	w0,w4,w0
	add	w2,w1,w2
	mov	w2,w1
	mul.uu	w3,#1,w0
	mov	#160,w2
	mulw.ss	w1,w2,w2
	mulw.su	w0,#0,w4
	add	w2,w4,w2
	mov	#160,w4
	mul.uu	w0,w4,w0
	add	w2,w1,w2
	mov	w2,w1
	mulw.su	w3,#20,w0
	inc	w0,w0
	inc	w0,w0
	lsr	w0,w0
	add	w0,w0,w1
	mov	w15,w0
	add	w15,w1,w15
	inc	w0,w0
	lsr	w0,w0
	add	w0,w0,w0
	mov	w0,[w14+6]
	.loc 1 134 0
	mov	[w14+6],w0
	add	w14,#8,w1
	mov	w1,w2
	mov	[w14+2],w1
	rcall	_uxTaskGetSystemState
	mov	w0,[w14+2]
	.loc 1 136 0
	mov	[w14+8],w0
	mov	[w14+10],w1
	mov	#10000,w2
	mov	#0,w3
	rcall	___udivsi3
	mov	w0,[w14+8]
	mov	w1,[w14+10]
	.loc 1 137 0
	mov	[w14+8],w0
	mov	[w14+10],w1
	sub	w0,#0,[w15]
	subb	w1,#0,[w15]
	.set ___BP___,0
	bra	z,.L12
	.loc 1 139 0
	mov	#8,w1
	mov	#.LC3,w0
	rcall	_Add_Printf_str
	.loc 1 140 0
	mov	#3,w1
	mov	#.LC4,w0
	rcall	_Add_Printf_str
	.loc 1 141 0
	mov	#3,w1
	mov	#.LC5,w0
	rcall	_Add_Printf_str
	.loc 1 142 0
	mov	#3,w1
	mov	#.LC4,w0
	rcall	_Add_Printf_str
	.loc 1 143 0
	mov	#3,w1
	mov	#.LC6,w0
	rcall	_Add_Printf_str
	.loc 1 144 0
	mov	#3,w1
	mov	#.LC4,w0
	rcall	_Add_Printf_str
	.loc 1 145 0
	mov	#5,w1
	mov	#.LC7,w0
	rcall	_Add_Printf_str
	.loc 1 146 0
	mov	#3,w1
	mov	#.LC4,w0
	rcall	_Add_Printf_str
	.loc 1 147 0
	mov	#5,w1
	mov	#.LC8,w0
	rcall	_Add_Printf_str
	.loc 1 148 0
	rcall	_Start_Printf
	.loc 1 149 0
	mov	#48928,w0
	mov	#2,w1
	rcall	___delay32
	.loc 1 150 0
	mov	#38,w1
	mov	#.LC9,w0
	rcall	_Add_Printf_str
	.loc 1 151 0
	rcall	_Start_Printf
	.loc 1 152 0
	mov	#48928,w0
	mov	#2,w1
	rcall	___delay32
	.loc 1 154 0
	clr.b	w0
	mov.b	w0,[w14]
	bra	.L13
.L14:
	.loc 1 155 0
	ze	[w14],w0
	mov	[w14+6],w1
	mulw.su	w0,#20,w0
	inc2	w0,w0
	add	w1,w0,w0
	mov	[w0],w0
	mov	#8,w1
	rcall	_Add_Printf_str
	.loc 1 156 0
	mov	#3,w1
	mov	#.LC4,w0
	rcall	_Add_Printf_str
	.loc 1 157 0
	ze	[w14],w0
	mov	[w14+6],w1
	mulw.su	w0,#20,w0
	add	w0,#6,w0
	add	w1,w0,w0
	mov	[w0],w0
	mov.b	w0,w0
	rcall	_Add_Printf_udec8
	.loc 1 158 0
	mov	#3,w1
	mov	#.LC4,w0
	rcall	_Add_Printf_str
	.loc 1 159 0
	ze	[w14],w0
	mov	[w14+6],w1
	mulw.su	w0,#20,w0
	add	w0,#8,w0
	add	w1,w0,w0
	mov	[w0],w0
	mov.b	w0,w0
	rcall	_Add_Printf_udec8
	.loc 1 160 0
	mov	#3,w1
	mov	#.LC4,w0
	rcall	_Add_Printf_str
	.loc 1 161 0
	ze	[w14],w0
	mov	[w14+6],w1
	mulw.su	w0,#20,w0
	add	w0,#18,w0
	add	w1,w0,w0
	mov	[w0],w0
	rcall	_Add_Printf_udec16
	.loc 1 162 0
	mov	#3,w1
	mov	#.LC4,w0
	rcall	_Add_Printf_str
	.loc 1 163 0
	ze	[w14],w0
	mov	[w14+6],w1
	mulw.su	w0,#20,w0
	add	w0,#12,w0
	add	w1,w0,w0
	mov.d	[w0],w4
	mov	[w14+8],w0
	mov	[w14+10],w1
	mov.d	w0,w2
	mov.d	w4,w0
	rcall	___udivsi3
	mov	w0,w0
	rcall	_Add_Printf_udec16
	.loc 1 165 0
	mov	#2,w1
	mov	#.LC10,w0
	rcall	_Add_Printf_str
	.loc 1 166 0
	rcall	_Start_Printf
	.loc 1 167 0
	mov	#48928,w0
	mov	#2,w1
	rcall	___delay32
	.loc 1 154 0
	inc.b	[w14],[w14]
.L13:
	ze	[w14],w1
	mov	[w14+2],w0
	sub	w1,w0,[w15]
	.set ___BP___,0
	bra	ltu,.L14
	.loc 1 169 0
	mov	#2,w1
	mov	#.LC11,w0
	rcall	_Add_Printf_str
	.loc 1 170 0
	mov	_Cnt.21611,w0
	mov	w0,w1
	inc	w0,w0
	mov	w0,_Cnt.21611
	mov	w1,w0
	rcall	_Add_Printf_udec16
	.loc 1 171 0
	mov	#16,w1
	mov	#.LC12,w0
	rcall	_Add_Printf_str
	.loc 1 172 0
	rcall	_xPortGetFreeHeapSize
	rcall	_Add_Printf_udec16
	.loc 1 173 0
	mov	#4,w1
	mov	#.LC13,w0
	rcall	_Add_Printf_str
	.loc 1 174 0
	rcall	_Start_Printf
	bra	.L15
.L12:
	.loc 1 176 0
	mov	#5,w1
	mov	#.LC14,w0
	rcall	_Add_Printf_str
	.loc 1 177 0
	rcall	_Start_Printf
.L15:
	mov	w9,w15
	.loc 1 179 0
	mov	w8,w15
	mov.d	[--w15],w8
	ulnk	
	return	
	.set ___PA___,0
.LFE4:
	.size	_Print_Stats, .-_Print_Stats
	.section .const,psv,page
.LC15:
	.asciz	"ADC3"
.LC16:
	.asciz	"DAC3"
	.section	.text,code
	.align	2
	.global	_ConfigMod_Filter	; export
	.type	_ConfigMod_Filter,@function
_ConfigMod_Filter:
.LFB5:
	.loc 1 187 0
	.set ___PA___,1
	lnk	#2
.LCFI6:
	.loc 1 189 0
	clr.b	w2
	mov	#2,w1
	mov	#5,w0
	rcall	_xQueueGenericCreate
	mov	w0,_Hdl_Queue
	.loc 1 190 0
	mov	_Hdl_Queue,w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L17
	.loc 1 191 0
	mov	#1026,w0
	rcall	_Set_ErrFlag
	bra	.L16
.L17:
.LBB2:
	.loc 1 194 0
	mov.b	#3,w2
	clr	w1
	mov	#1,w0
	rcall	_xQueueGenericCreate
	mov	w0,_Hdl_Semaphore
	.loc 1 196 0
	rcall	_Init_INT1
	.loc 1 199 0
	clr	w5
	mov	#6,w4
	clr	w3
	mov	#160,w2
	mov	#.LC15,w1
	mov	#handle(_Trigger_ADC3),w0
	rcall	_xTaskCreate
	mov	w0,[w14]
	.loc 1 201 0
	mov	[w14],w0
	add	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L19
	.loc 1 202 0
	mov	#1025,w0
	rcall	_Set_ErrFlag
.L19:
	.loc 1 205 0
	clr	w5
	mov	#5,w4
	clr	w3
	mov	#120,w2
	mov	#.LC16,w1
	mov	#handle(_Update_DAC),w0
	rcall	_xTaskCreate
	mov	w0,[w14]
	.loc 1 207 0
	mov	[w14],w0
	add	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L16
	.loc 1 208 0
	mov	#1025,w0
	rcall	_Set_ErrFlag
.L16:
.LBE2:
	.loc 1 211 0
	ulnk	
	return	
	.set ___PA___,0
.LFE5:
	.size	_ConfigMod_Filter, .-_ConfigMod_Filter
	.align	2
	.type	_Trigger_ADC3,@function
_Trigger_ADC3:
.LFB6:
	.loc 1 217 0
	.set ___PA___,1
	lnk	#4
.LCFI7:
	mov	w0,[w14+2]
	.loc 1 218 0
	rcall	_Disable_SELF_TEST
	.loc 1 219 0
	rcall	_Init_ADC
	.loc 1 220 0
	rcall	_xTaskGetTickCount
	mov	w0,[w14]
.L21:
	.loc 1 222 0
	mov	#5,w1
	mov	w14,w0
	rcall	_vTaskDelayUntil
	.loc 1 223 0
	bset.b	_ADCON3Lbits,#6
	.loc 1 224 0
	bra	.L21
.LFE6:
	.size	_Trigger_ADC3, .-_Trigger_ADC3
	.section	.isr.text,code,keep
	.align	2
	.global	__ADCAN3Interrupt	; export
	.type	__ADCAN3Interrupt,@function
__ADCAN3Interrupt:
	.section	.isr.text,code,keep
.LFB7:
	.section	.isr.text,code,keep
	.loc 1 230 0
	.set ___PA___,1
	push	_RCOUNT
.LCFI8:
	mov.d	w0,[w15++]
.LCFI9:
	mov.d	w2,[w15++]
.LCFI10:
	mov.d	w4,[w15++]
.LCFI11:
	mov.d	w6,[w15++]
.LCFI12:
	push	_DSRPAG
.LCFI13:
	push	_DSWPAG
.LCFI14:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	lnk	#6
.LCFI15:
	.section	.isr.text,code,keep
	.loc 1 231 0
	mov	_ADCBUF3,w0
	mov	w0,[w14+2]
	.section	.isr.text,code,keep
	.loc 1 232 0
	bclr.b	_IFS5bits+1,#6
	.section	.isr.text,code,keep
	.loc 1 233 0
	clr	w0
	mov	w0,[w14+4]
	.section	.isr.text,code,keep
	.loc 1 234 0
	mov	_Hdl_Queue,w0
	add	w14,#4,w2
	inc2	w14,w1
	clr	w3
	rcall	_xQueueGenericSendFromISR
	mov	w0,[w14]
	.section	.isr.text,code,keep
	.loc 1 236 0
	mov	[w14],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L22
	.section	.isr.text,code,keep
	.loc 1 237 0
	mov	#1032,w0
	rcall	_Set_ErrFlag
.L22:
	.section	.isr.text,code,keep
	.loc 1 239 0
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
	.size	__ADCAN3Interrupt, .-__ADCAN3Interrupt
	.section	.text,code
	.align	2
	.type	_Update_DAC,@function
_Update_DAC:
.LFB8:
	.loc 1 245 0
	.set ___PA___,1
	lnk	#16
.LCFI16:
	mov	w0,[w14+14]
	.loc 1 246 0
	rcall	_Init_DAC
	.loc 1 247 0
	mov.b	#4,w0
	mov.b	w0,[w14]
	.loc 1 248 0
	ze	[w14],w0
	add	w0,w0,w0
	rcall	_pvPortMalloc
	mov	w0,[w14+2]
	.loc 1 249 0
	ze	[w14],w0
	add	w0,w0,w0
	mov	w0,w2
	clr	w1
	mov	[w14+2],w0
	rcall	_memset
	.loc 1 250 0
	clr	w0
	mov	w0,[w14+4]
	.loc 1 251 0
	clr	w0
	mov	w0,[w14+6]
	.loc 1 252 0
	rcall	_xTaskGetTickCount
	mov	w0,[w14+10]
.L30:
	.loc 1 256 0
	add	w14,#10,w0
	mov	#5,w1
	rcall	_vTaskDelayUntil
	.loc 1 257 0
	mov	_Hdl_Semaphore,w0
	clr	w3
	clr	w2
	clr	w1
	rcall	_xQueueGenericReceive
	sub	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L25
	.loc 1 258 0
	mov	[w14+2],w0
	rcall	_vPortFree
	.loc 1 259 0
	mov.b	[w14],w0
	sub.b	w0,#4,[w15]
	.set ___BP___,0
	bra	nz,.L26
	.loc 1 260 0
	mov.b	#10,w0
	mov.b	w0,[w14]
	bra	.L27
.L26:
	.loc 1 262 0
	mov.b	#4,w0
	mov.b	w0,[w14]
.L27:
	.loc 1 264 0
	ze	[w14],w0
	add	w0,w0,w0
	rcall	_pvPortMalloc
	mov	w0,[w14+2]
	.loc 1 265 0
	ze	[w14],w0
	add	w0,w0,w0
	mov	w0,w2
	clr	w1
	mov	[w14+2],w0
	rcall	_memset
	.loc 1 266 0
	clr	w0
	mov	w0,[w14+4]
	.loc 1 267 0
	clr	w0
	mov	w0,[w14+6]
.L25:
	.loc 1 269 0
	mov	_Hdl_Queue,w0
	add	w14,#12,w1
	clr	w3
	clr	w2
	rcall	_xQueueGenericReceive
	mov	w0,[w14+8]
	.loc 1 270 0
	mov	[w14+8],w0
	cp0	w0
	.set ___BP___,0
	bra	nz,.L28
	.loc 1 271 0
	mov	#1040,w0
	rcall	_Set_ErrFlag
	.loc 1 278 0
	bra	.L30
.L28:
	.loc 1 273 0
	mov	[w14+4],w0
	add	w0,w0,w0
	mov	[w14+2],w1
	add	w1,w0,w0
	mov	[w0],w0
	mov	[w14+6],w1
	sub	w1,w0,w1
	mov	[w14+12],w0
	add	w1,w0,w0
	mov	w0,[w14+6]
	.loc 1 274 0
	mov	[w14+4],w0
	add	w0,w0,w0
	mov	[w14+2],w1
	add	w1,w0,w0
	mov	[w14+12],w1
	mov	w1,[w0]
	.loc 1 275 0
	mov	[w14+4],w0
	inc	w0,w1
	ze	[w14],w0
	mov	w0,w2
	repeat	#__TARGET_DIVIDE_CYCLES
	div.uw	w1,w2
	exch	w0,w1
	mov	w0,[w14+4]
	.loc 1 276 0
	ze	[w14],w0
	mov	[w14+6],w1
	mov	w0,w2
	repeat	#__TARGET_DIVIDE_CYCLES
	div.uw	w1,w2
		
	mov	w0,w1
	mov	#4095,w0
	and	w1,w0,w0
	bfins	#0,#12,w0,_DAC1DATHbits
	.loc 1 278 0
	bra	.L30
.LFE8:
	.size	_Update_DAC, .-_Update_DAC
	.section	.isr.text,code,keep
	.align	2
	.global	__INT1Interrupt	; export
	.type	__INT1Interrupt,@function
__INT1Interrupt:
	.section	.isr.text,code,keep
.LFB9:
	.section	.isr.text,code,keep
	.loc 1 284 0
	.set ___PA___,1
	push	_RCOUNT
.LCFI17:
	mov.d	w0,[w15++]
.LCFI18:
	mov.d	w2,[w15++]
.LCFI19:
	mov.d	w4,[w15++]
.LCFI20:
	mov.d	w6,[w15++]
.LCFI21:
	push	_DSRPAG
.LCFI22:
	push	_DSWPAG
.LCFI23:
	mov	#1,w0
	mov	w0,_DSWPAG
	mov	#__const_psvpage,w0
	movpag	w0,DSRPAG
	lnk	#2
.LCFI24:
	.section	.isr.text,code,keep
	.loc 1 285 0
	bclr.b	_IFS0bits+1,#7
	.section	.isr.text,code,keep
	.loc 1 286 0
	clr	w0
	mov	w0,[w14]
	.section	.isr.text,code,keep
	.loc 1 287 0
	mov	_Hdl_Semaphore,w0
	mov	w14,w1
	rcall	_xQueueGiveFromISR
	.section	.isr.text,code,keep
	.loc 1 289 0
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
	.size	__INT1Interrupt, .-__INT1Interrupt
	.section .const,psv,page
.LC17:
	.asciz	"WDT"
	.section	.text,code
	.align	2
	.global	_ConfigMod_Watchdog	; export
	.type	_ConfigMod_Watchdog,@function
_ConfigMod_Watchdog:
.LFB10:
	.loc 1 297 0
	.set ___PA___,1
	lnk	#2
.LCFI25:
	.loc 1 299 0
	clr	w5
	mov	#4,w4
	clr	w3
	mov	#100,w2
	mov	#.LC17,w1
	mov	#handle(_Kick_Watchdog),w0
	rcall	_xTaskCreate
	mov	w0,[w14]
	.loc 1 301 0
	mov	[w14],w0
	add	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L32
	.loc 1 302 0
	mov	#1025,w0
	rcall	_Set_ErrFlag
.L32:
	.loc 1 304 0
	ulnk	
	return	
	.set ___PA___,0
.LFE10:
	.size	_ConfigMod_Watchdog, .-_ConfigMod_Watchdog
	.align	2
	.type	_Kick_Watchdog,@function
_Kick_Watchdog:
.LFB11:
	.loc 1 310 0
	.set ___PA___,0
	lnk	#4
.LCFI26:
	mov	w0,[w14+2]
	.loc 1 311 0
	bset.b	_WDTCONLbits+1,#7
	.loc 1 312 0
	rcall	_xTaskGetTickCount
	mov	w0,[w14]
.L35:
	.loc 1 314 0
	mov	#3500,w1
	mov	w14,w0
	rcall	_vTaskDelayUntil
	.loc 1 315 0
; 315 "../misc.c" 1
	CLRWDT
	.loc 1 316 0
	bra	.L35
.LFE11:
	.size	_Kick_Watchdog, .-_Kick_Watchdog
	.section	.nbss,bss,near
	.align	2
	.type	_Cnt.21611,@object
	.size	_Cnt.21611, 2
_Cnt.21611:
	.skip	2
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
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0x88
	.uleb128 0xa
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
	.4byte	.LCFI7-.LFB6
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
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
	.4byte	.LCFI9-.LFB7
	.byte	0x13
	.sleb128 -5
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0x13
	.sleb128 -7
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0x13
	.sleb128 -9
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0x13
	.sleb128 -11
	.byte	0x4
	.4byte	.LCFI14-.LCFI12
	.byte	0x86
	.uleb128 0x9
	.byte	0x84
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x5
	.byte	0x80
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
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
	.4byte	.LCFI16-.LFB8
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
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
	.4byte	.LCFI18-.LFB9
	.byte	0x13
	.sleb128 -5
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0x13
	.sleb128 -7
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0x13
	.sleb128 -9
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0x13
	.sleb128 -11
	.byte	0x4
	.4byte	.LCFI23-.LCFI21
	.byte	0x86
	.uleb128 0x9
	.byte	0x84
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x5
	.byte	0x80
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
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
	.4byte	.LCFI25-.LFB10
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI26-.LFB11
	.byte	0x12
	.uleb128 0xe
	.sleb128 -3
	.byte	0x8e
	.uleb128 0x2
	.align	4
.LEFDE22:
	.section	.text,code
.Letext0:
	.file 2 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h"
	.file 3 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h"
	.file 4 "../gpio.h"
	.file 5 "../../source/include/../../Source/portable/MPLAB/PIC24_dsPIC/portmacro.h"
	.file 6 "../../source/include/queue.h"
	.file 7 "../../source/include/task.h"
	.file 8 "../../source/include/timers.h"
	.file 9 "../../source/include/semphr.h"
	.section	.debug_info,info
	.4byte	0x1022
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.61) (B) Build date: Oct 23 2020"
	.byte	0x1
	.asciz	"../misc.c"
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
	.4byte	0x105
	.uleb128 0x4
	.asciz	"uint16_t"
	.byte	0x2
	.byte	0x31
	.4byte	0xe2
	.uleb128 0x4
	.asciz	"uint32_t"
	.byte	0x2
	.byte	0x37
	.4byte	0x15c
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x5
	.asciz	"tagIFS0BITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x3435
	.4byte	0x2c3
	.uleb128 0x6
	.asciz	"INT0IF"
	.byte	0x3
	.2byte	0x3436
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"T1IF"
	.byte	0x3
	.2byte	0x3437
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CNAIF"
	.byte	0x3
	.2byte	0x3438
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CNBIF"
	.byte	0x3
	.2byte	0x3439
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DMA0IF"
	.byte	0x3
	.2byte	0x343a
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CCP1IF"
	.byte	0x3
	.2byte	0x343c
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CCT1IF"
	.byte	0x3
	.2byte	0x343d
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DMA1IF"
	.byte	0x3
	.2byte	0x343e
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SPI1RXIF"
	.byte	0x3
	.2byte	0x343f
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SPI1TXIF"
	.byte	0x3
	.2byte	0x3440
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"U1RXIF"
	.byte	0x3
	.2byte	0x3441
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"U1TXIF"
	.byte	0x3
	.2byte	0x3442
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"ECCSBEIF"
	.byte	0x3
	.2byte	0x3443
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"NVMIF"
	.byte	0x3
	.2byte	0x3444
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"INT1IF"
	.byte	0x3
	.2byte	0x3445
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.asciz	"IFS0BITS"
	.byte	0x3
	.2byte	0x3446
	.4byte	0x171
	.uleb128 0x5
	.asciz	"tagIFS5BITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x3497
	.4byte	0x436
	.uleb128 0x6
	.asciz	"PTGWDTIF"
	.byte	0x3
	.2byte	0x3499
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"PTG0IF"
	.byte	0x3
	.2byte	0x349a
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"PTG1IF"
	.byte	0x3
	.2byte	0x349b
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"PTG2IF"
	.byte	0x3
	.2byte	0x349c
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"PTG3IF"
	.byte	0x3
	.2byte	0x349d
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SENT1IF"
	.byte	0x3
	.2byte	0x349e
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SENT1EIF"
	.byte	0x3
	.2byte	0x349f
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SENT2IF"
	.byte	0x3
	.2byte	0x34a0
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SENT2EIF"
	.byte	0x3
	.2byte	0x34a1
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"ADCIF"
	.byte	0x3
	.2byte	0x34a2
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"ADCAN0IF"
	.byte	0x3
	.2byte	0x34a3
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"ADCAN1IF"
	.byte	0x3
	.2byte	0x34a4
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"ADCAN2IF"
	.byte	0x3
	.2byte	0x34a5
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"ADCAN3IF"
	.byte	0x3
	.2byte	0x34a6
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"ADCAN4IF"
	.byte	0x3
	.2byte	0x34a7
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.asciz	"IFS5BITS"
	.byte	0x3
	.2byte	0x34a8
	.4byte	0x2d4
	.uleb128 0x8
	.byte	0x2
	.byte	0x3
	.2byte	0x4390
	.4byte	0x516
	.uleb128 0x6
	.asciz	"CNVCHSEL"
	.byte	0x3
	.2byte	0x4391
	.4byte	0x13c
	.byte	0x2
	.byte	0x6
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SWCTRG"
	.byte	0x3
	.2byte	0x4392
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SWLCTRG"
	.byte	0x3
	.2byte	0x4393
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CNVRTCH"
	.byte	0x3
	.2byte	0x4394
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SHRSAMP"
	.byte	0x3
	.2byte	0x4395
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SUSPRDY"
	.byte	0x3
	.2byte	0x4396
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SUSPCIE"
	.byte	0x3
	.2byte	0x4397
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SUSPEND"
	.byte	0x3
	.2byte	0x4398
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"REFSEL"
	.byte	0x3
	.2byte	0x4399
	.4byte	0x13c
	.byte	0x2
	.byte	0x3
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.byte	0x3
	.2byte	0x439b
	.4byte	0x5f2
	.uleb128 0x6
	.asciz	"CNVCHSEL0"
	.byte	0x3
	.2byte	0x439c
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CNVCHSEL1"
	.byte	0x3
	.2byte	0x439d
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CNVCHSEL2"
	.byte	0x3
	.2byte	0x439e
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CNVCHSEL3"
	.byte	0x3
	.2byte	0x439f
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CNVCHSEL4"
	.byte	0x3
	.2byte	0x43a0
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CNVCHSEL5"
	.byte	0x3
	.2byte	0x43a1
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"REFSEL0"
	.byte	0x3
	.2byte	0x43a3
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"REFSEL1"
	.byte	0x3
	.2byte	0x43a4
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"REFSEL2"
	.byte	0x3
	.2byte	0x43a5
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x9
	.byte	0x2
	.byte	0x3
	.2byte	0x438f
	.4byte	0x606
	.uleb128 0xa
	.4byte	0x447
	.uleb128 0xa
	.4byte	0x516
	.byte	0x0
	.uleb128 0x5
	.asciz	"tagADCON3LBITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x438e
	.4byte	0x627
	.uleb128 0xb
	.4byte	0x5f2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.asciz	"ADCON3LBITS"
	.byte	0x3
	.2byte	0x43a8
	.4byte	0x606
	.uleb128 0x8
	.byte	0x2
	.byte	0x3
	.2byte	0x486d
	.4byte	0x65a
	.uleb128 0x6
	.asciz	"DACDAT"
	.byte	0x3
	.2byte	0x486e
	.4byte	0x13c
	.byte	0x2
	.byte	0xc
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.byte	0x3
	.2byte	0x4870
	.4byte	0x67a
	.uleb128 0x6
	.asciz	"DACDATH"
	.byte	0x3
	.2byte	0x4871
	.4byte	0x13c
	.byte	0x2
	.byte	0xc
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.byte	0x3
	.2byte	0x4873
	.4byte	0x79a
	.uleb128 0x6
	.asciz	"DACDATH0"
	.byte	0x3
	.2byte	0x4874
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DACDATH1"
	.byte	0x3
	.2byte	0x4875
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DACDATH2"
	.byte	0x3
	.2byte	0x4876
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DACDATH3"
	.byte	0x3
	.2byte	0x4877
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DACDATH4"
	.byte	0x3
	.2byte	0x4878
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DACDATH5"
	.byte	0x3
	.2byte	0x4879
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DACDATH6"
	.byte	0x3
	.2byte	0x487a
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DACDATH7"
	.byte	0x3
	.2byte	0x487b
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DACDATH8"
	.byte	0x3
	.2byte	0x487c
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DACDATH9"
	.byte	0x3
	.2byte	0x487d
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DACDATH10"
	.byte	0x3
	.2byte	0x487e
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"DACDATH11"
	.byte	0x3
	.2byte	0x487f
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x9
	.byte	0x2
	.byte	0x3
	.2byte	0x486c
	.4byte	0x7b3
	.uleb128 0xa
	.4byte	0x63b
	.uleb128 0xa
	.4byte	0x65a
	.uleb128 0xa
	.4byte	0x67a
	.byte	0x0
	.uleb128 0x5
	.asciz	"tagDAC1DATHBITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x486b
	.4byte	0x7d5
	.uleb128 0xb
	.4byte	0x79a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.asciz	"DAC1DATHBITS"
	.byte	0x3
	.2byte	0x4882
	.4byte	0x7b3
	.uleb128 0x5
	.asciz	"tagWDTCONLBITS"
	.byte	0x2
	.byte	0x3
	.2byte	0x506a
	.4byte	0x86a
	.uleb128 0x6
	.asciz	"WDTWINEN"
	.byte	0x3
	.2byte	0x506b
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"SLPDIV"
	.byte	0x3
	.2byte	0x506c
	.4byte	0x13c
	.byte	0x2
	.byte	0x5
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"CLKSEL"
	.byte	0x3
	.2byte	0x506d
	.4byte	0x13c
	.byte	0x2
	.byte	0x2
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"RUNDIV"
	.byte	0x3
	.2byte	0x506e
	.4byte	0x13c
	.byte	0x2
	.byte	0x5
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.asciz	"ON"
	.byte	0x3
	.2byte	0x5070
	.4byte	0x13c
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.asciz	"WDTCONLBITS"
	.byte	0x3
	.2byte	0x5071
	.4byte	0x7ea
	.uleb128 0xc
	.byte	0x7
	.byte	0x4
	.byte	0x1c
	.4byte	0x8fb
	.uleb128 0xd
	.asciz	"AnaDig"
	.byte	0x4
	.byte	0x1d
	.4byte	0x12d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.asciz	"InOut"
	.byte	0x4
	.byte	0x1e
	.4byte	0x12d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xd
	.asciz	"PullUp"
	.byte	0x4
	.byte	0x1f
	.4byte	0x12d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.asciz	"PullDw"
	.byte	0x4
	.byte	0x20
	.4byte	0x12d
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xd
	.asciz	"OpenDr"
	.byte	0x4
	.byte	0x21
	.4byte	0x12d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.asciz	"CnEn0"
	.byte	0x4
	.byte	0x22
	.4byte	0x12d
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xd
	.asciz	"CnEn1"
	.byte	0x4
	.byte	0x23
	.4byte	0x12d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0x0
	.uleb128 0x4
	.asciz	"gpio_t"
	.byte	0x4
	.byte	0x24
	.4byte	0x87e
	.uleb128 0x4
	.asciz	"StackType_t"
	.byte	0x5
	.byte	0x60
	.4byte	0x13c
	.uleb128 0x4
	.asciz	"BaseType_t"
	.byte	0x5
	.byte	0x61
	.4byte	0x92e
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.asciz	"short int"
	.uleb128 0x4
	.asciz	"UBaseType_t"
	.byte	0x5
	.byte	0x62
	.4byte	0xcc
	.uleb128 0x4
	.asciz	"TickType_t"
	.byte	0x5
	.byte	0x65
	.4byte	0x13c
	.uleb128 0xe
	.byte	0x2
	.4byte	0x12d
	.uleb128 0x4
	.asciz	"QueueHandle_t"
	.byte	0x6
	.byte	0x58
	.4byte	0x9f
	.uleb128 0x4
	.asciz	"TaskHandle_t"
	.byte	0x7
	.byte	0x67
	.4byte	0x9f
	.uleb128 0xf
	.byte	0x2
	.byte	0x7
	.byte	0x71
	.4byte	0x9da
	.uleb128 0x10
	.asciz	"eRunning"
	.sleb128 0
	.uleb128 0x10
	.asciz	"eReady"
	.sleb128 1
	.uleb128 0x10
	.asciz	"eBlocked"
	.sleb128 2
	.uleb128 0x10
	.asciz	"eSuspended"
	.sleb128 3
	.uleb128 0x10
	.asciz	"eDeleted"
	.sleb128 4
	.uleb128 0x10
	.asciz	"eInvalid"
	.sleb128 5
	.byte	0x0
	.uleb128 0x4
	.asciz	"eTaskState"
	.byte	0x7
	.byte	0x78
	.4byte	0x98f
	.uleb128 0xe
	.byte	0x2
	.4byte	0x9f2
	.uleb128 0x11
	.4byte	0x125
	.uleb128 0xe
	.byte	0x2
	.4byte	0x909
	.uleb128 0x12
	.asciz	"xTASK_STATUS"
	.byte	0x14
	.byte	0x7
	.byte	0xa7
	.4byte	0xaed
	.uleb128 0xd
	.asciz	"xHandle"
	.byte	0x7
	.byte	0xa9
	.4byte	0x97b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.asciz	"pcTaskName"
	.byte	0x7
	.byte	0xaa
	.4byte	0x9ec
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.asciz	"xTaskNumber"
	.byte	0x7
	.byte	0xab
	.4byte	0x93b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.asciz	"eCurrentState"
	.byte	0x7
	.byte	0xac
	.4byte	0x9da
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xd
	.asciz	"uxCurrentPriority"
	.byte	0x7
	.byte	0xad
	.4byte	0x93b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xd
	.asciz	"uxBasePriority"
	.byte	0x7
	.byte	0xae
	.4byte	0x93b
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xd
	.asciz	"ulRunTimeCounter"
	.byte	0x7
	.byte	0xaf
	.4byte	0x14c
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xd
	.asciz	"pxStackBase"
	.byte	0x7
	.byte	0xb0
	.4byte	0x9f7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xd
	.asciz	"usStackHighWaterMark"
	.byte	0x7
	.byte	0xb1
	.4byte	0x13c
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.byte	0x0
	.uleb128 0x4
	.asciz	"TaskStatus_t"
	.byte	0x7
	.byte	0xb2
	.4byte	0x9fd
	.uleb128 0x4
	.asciz	"TimerHandle_t"
	.byte	0x8
	.byte	0x76
	.4byte	0x9f
	.uleb128 0x4
	.asciz	"SemaphoreHandle_t"
	.byte	0x9
	.byte	0x4f
	.4byte	0x966
	.uleb128 0x13
	.byte	0x1
	.asciz	"ConfigMod_LEDs"
	.byte	0x1
	.byte	0x36
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0xb74
	.uleb128 0x14
	.asciz	"Gpio_Led1"
	.byte	0x1
	.byte	0x36
	.4byte	0x960
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x15
	.asciz	"Ret"
	.byte	0x1
	.byte	0x37
	.4byte	0x91c
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x16
	.asciz	"Blink_LED0"
	.byte	0x1
	.byte	0x48
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.4byte	0xbae
	.uleb128 0x17
	.4byte	.LASF0
	.byte	0x1
	.byte	0x48
	.4byte	0x9f
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x15
	.asciz	"Par"
	.byte	0x1
	.byte	0x4a
	.4byte	0x8fb
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.byte	0x0
	.uleb128 0x16
	.asciz	"Blink_LED1"
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.4byte	0xc07
	.uleb128 0x17
	.4byte	.LASF0
	.byte	0x1
	.byte	0x5b
	.4byte	0x9f
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x15
	.asciz	"GpioId"
	.byte	0x1
	.byte	0x5c
	.4byte	0xc07
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x15
	.asciz	"Par"
	.byte	0x1
	.byte	0x5e
	.4byte	0x8fb
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LASF1
	.byte	0x1
	.byte	0x65
	.4byte	0x94e
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.byte	0x0
	.uleb128 0x11
	.4byte	0x960
	.uleb128 0x13
	.byte	0x1
	.asciz	"ConfigMod_Stats"
	.byte	0x1
	.byte	0x72
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x5e
	.4byte	0xc44
	.uleb128 0x15
	.asciz	"Hdl_Timer"
	.byte	0x1
	.byte	0x73
	.4byte	0xb01
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x16
	.asciz	"Print_Stats"
	.byte	0x1
	.byte	0x80
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x5e
	.4byte	0xcd6
	.uleb128 0x14
	.asciz	"xTimer"
	.byte	0x1
	.byte	0x80
	.4byte	0xb01
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.uleb128 0x15
	.asciz	"Cnt"
	.byte	0x1
	.byte	0x81
	.4byte	0x13c
	.byte	0x5
	.byte	0x3
	.4byte	_Cnt.21611
	.uleb128 0x15
	.asciz	"j"
	.byte	0x1
	.byte	0x82
	.4byte	0x12d
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x15
	.asciz	"TotalRunTime"
	.byte	0x1
	.byte	0x83
	.4byte	0x14c
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x15
	.asciz	"TasksNumber"
	.byte	0x1
	.byte	0x84
	.4byte	0x13c
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x15
	.asciz	"TasksStatus"
	.byte	0x1
	.byte	0x85
	.4byte	0xcd6
	.byte	0x4
	.byte	0x7e
	.sleb128 6
	.byte	0x94
	.byte	0x2
	.byte	0x0
	.uleb128 0x19
	.4byte	0xaed
	.4byte	0xcea
	.uleb128 0x1a
	.4byte	0xe2
	.byte	0x4
	.byte	0x7e
	.sleb128 4
	.byte	0x94
	.byte	0x2
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.asciz	"ConfigMod_Filter"
	.byte	0x1
	.byte	0xbb
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x5e
	.4byte	0xd27
	.uleb128 0x1b
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x15
	.asciz	"Ret"
	.byte	0x1
	.byte	0xc6
	.4byte	0x91c
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.asciz	"Trigger_ADC3"
	.byte	0x1
	.byte	0xd9
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x5e
	.4byte	0xd63
	.uleb128 0x17
	.4byte	.LASF0
	.byte	0x1
	.byte	0xd9
	.4byte	0x9f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x18
	.4byte	.LASF1
	.byte	0x1
	.byte	0xdc
	.4byte	0x94e
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.asciz	"_ADCAN3Interrupt"
	.byte	0x1
	.byte	0xe6
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x5e
	.4byte	0xdcb
	.uleb128 0x15
	.asciz	"AdcVal6"
	.byte	0x1
	.byte	0xe7
	.4byte	0xdcb
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x15
	.asciz	"xHigherPriorityTaskWoken"
	.byte	0x1
	.byte	0xe9
	.4byte	0x91c
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x15
	.asciz	"Ret"
	.byte	0x1
	.byte	0xea
	.4byte	0x91c
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x11
	.4byte	0x13c
	.uleb128 0x16
	.asciz	"Update_DAC"
	.byte	0x1
	.byte	0xf5
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x5e
	.4byte	0xe6f
	.uleb128 0x17
	.4byte	.LASF0
	.byte	0x1
	.byte	0xf5
	.4byte	0x9f
	.byte	0x2
	.byte	0x7e
	.sleb128 14
	.uleb128 0x15
	.asciz	"DacWinSz"
	.byte	0x1
	.byte	0xf7
	.4byte	0x12d
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x15
	.asciz	"WinBuf"
	.byte	0x1
	.byte	0xf8
	.4byte	0xe6f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x15
	.asciz	"WinIdx"
	.byte	0x1
	.byte	0xfa
	.4byte	0x13c
	.byte	0x2
	.byte	0x7e
	.sleb128 4
	.uleb128 0x15
	.asciz	"WinSum"
	.byte	0x1
	.byte	0xfb
	.4byte	0x13c
	.byte	0x2
	.byte	0x7e
	.sleb128 6
	.uleb128 0x18
	.4byte	.LASF1
	.byte	0x1
	.byte	0xfc
	.4byte	0x94e
	.byte	0x2
	.byte	0x7e
	.sleb128 10
	.uleb128 0x15
	.asciz	"Ret"
	.byte	0x1
	.byte	0xfd
	.4byte	0x91c
	.byte	0x2
	.byte	0x7e
	.sleb128 8
	.uleb128 0x15
	.asciz	"NewVal"
	.byte	0x1
	.byte	0xfe
	.4byte	0x13c
	.byte	0x2
	.byte	0x7e
	.sleb128 12
	.byte	0x0
	.uleb128 0xe
	.byte	0x2
	.4byte	0x13c
	.uleb128 0x1c
	.byte	0x1
	.asciz	"_INT1Interrupt"
	.byte	0x1
	.2byte	0x11c
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x5e
	.4byte	0xeae
	.uleb128 0x1d
	.asciz	"wake_take"
	.byte	0x1
	.2byte	0x11e
	.4byte	0x91c
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.asciz	"ConfigMod_Watchdog"
	.byte	0x1
	.2byte	0x129
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x5e
	.4byte	0xee5
	.uleb128 0x1d
	.asciz	"Ret"
	.byte	0x1
	.2byte	0x12a
	.4byte	0x91c
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x1e
	.asciz	"Kick_Watchdog"
	.byte	0x1
	.2byte	0x136
	.byte	0x1
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x1
	.byte	0x5e
	.4byte	0xf25
	.uleb128 0x1f
	.4byte	.LASF0
	.byte	0x1
	.2byte	0x136
	.4byte	0x9f
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.uleb128 0x20
	.4byte	.LASF1
	.byte	0x1
	.2byte	0x138
	.4byte	0x94e
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.byte	0x0
	.uleb128 0x21
	.4byte	.LASF2
	.byte	0x3
	.2byte	0x3447
	.4byte	0xf33
	.byte	0x1
	.byte	0x1
	.uleb128 0x22
	.4byte	0x2c3
	.uleb128 0x21
	.4byte	.LASF3
	.byte	0x3
	.2byte	0x34a9
	.4byte	0xf46
	.byte	0x1
	.byte	0x1
	.uleb128 0x22
	.4byte	0x436
	.uleb128 0x21
	.4byte	.LASF4
	.byte	0x3
	.2byte	0x43a9
	.4byte	0xf59
	.byte	0x1
	.byte	0x1
	.uleb128 0x22
	.4byte	0x627
	.uleb128 0x23
	.asciz	"ADCBUF3"
	.byte	0x3
	.2byte	0x47ad
	.4byte	0xf70
	.byte	0x1
	.byte	0x1
	.uleb128 0x22
	.4byte	0x13c
	.uleb128 0x21
	.4byte	.LASF5
	.byte	0x3
	.2byte	0x4883
	.4byte	0xf83
	.byte	0x1
	.byte	0x1
	.uleb128 0x22
	.4byte	0x7d5
	.uleb128 0x21
	.4byte	.LASF6
	.byte	0x3
	.2byte	0x5072
	.4byte	0xf96
	.byte	0x1
	.byte	0x1
	.uleb128 0x22
	.4byte	0x86a
	.uleb128 0x15
	.asciz	"Hdl_Queue"
	.byte	0x1
	.byte	0x1b
	.4byte	0x966
	.byte	0x5
	.byte	0x3
	.4byte	_Hdl_Queue
	.uleb128 0x15
	.asciz	"Hdl_Semaphore"
	.byte	0x1
	.byte	0x1c
	.4byte	0xb16
	.byte	0x5
	.byte	0x3
	.4byte	_Hdl_Semaphore
	.uleb128 0x21
	.4byte	.LASF2
	.byte	0x3
	.2byte	0x3447
	.4byte	0xf33
	.byte	0x1
	.byte	0x1
	.uleb128 0x21
	.4byte	.LASF3
	.byte	0x3
	.2byte	0x34a9
	.4byte	0xf46
	.byte	0x1
	.byte	0x1
	.uleb128 0x21
	.4byte	.LASF4
	.byte	0x3
	.2byte	0x43a9
	.4byte	0xf59
	.byte	0x1
	.byte	0x1
	.uleb128 0x23
	.asciz	"ADCBUF3"
	.byte	0x3
	.2byte	0x47ad
	.4byte	0xf70
	.byte	0x1
	.byte	0x1
	.uleb128 0x21
	.4byte	.LASF5
	.byte	0x3
	.2byte	0x4883
	.4byte	0xf83
	.byte	0x1
	.byte	0x1
	.uleb128 0x21
	.4byte	.LASF6
	.byte	0x3
	.2byte	0x5072
	.4byte	0xf96
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x4
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
	.uleb128 0x10
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
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
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x89
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1026
	.4byte	0xb2f
	.asciz	"ConfigMod_LEDs"
	.4byte	0xc0c
	.asciz	"ConfigMod_Stats"
	.4byte	0xcea
	.asciz	"ConfigMod_Filter"
	.4byte	0xd63
	.asciz	"_ADCAN3Interrupt"
	.4byte	0xe75
	.asciz	"_INT1Interrupt"
	.4byte	0xeae
	.asciz	"ConfigMod_Watchdog"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x19e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1026
	.4byte	0x12d
	.asciz	"uint8_t"
	.4byte	0x13c
	.asciz	"uint16_t"
	.4byte	0x14c
	.asciz	"uint32_t"
	.4byte	0x171
	.asciz	"tagIFS0BITS"
	.4byte	0x2c3
	.asciz	"IFS0BITS"
	.4byte	0x2d4
	.asciz	"tagIFS5BITS"
	.4byte	0x436
	.asciz	"IFS5BITS"
	.4byte	0x606
	.asciz	"tagADCON3LBITS"
	.4byte	0x627
	.asciz	"ADCON3LBITS"
	.4byte	0x7b3
	.asciz	"tagDAC1DATHBITS"
	.4byte	0x7d5
	.asciz	"DAC1DATHBITS"
	.4byte	0x7ea
	.asciz	"tagWDTCONLBITS"
	.4byte	0x86a
	.asciz	"WDTCONLBITS"
	.4byte	0x8fb
	.asciz	"gpio_t"
	.4byte	0x909
	.asciz	"StackType_t"
	.4byte	0x91c
	.asciz	"BaseType_t"
	.4byte	0x93b
	.asciz	"UBaseType_t"
	.4byte	0x94e
	.asciz	"TickType_t"
	.4byte	0x966
	.asciz	"QueueHandle_t"
	.4byte	0x97b
	.asciz	"TaskHandle_t"
	.4byte	0x9da
	.asciz	"eTaskState"
	.4byte	0x9fd
	.asciz	"xTASK_STATUS"
	.4byte	0xaed
	.asciz	"TaskStatus_t"
	.4byte	0xb01
	.asciz	"TimerHandle_t"
	.4byte	0xb16
	.asciz	"SemaphoreHandle_t"
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
.LASF3:
	.asciz	"IFS5bits"
.LASF4:
	.asciz	"ADCON3Lbits"
.LASF2:
	.asciz	"IFS0bits"
.LASF6:
	.asciz	"WDTCONLbits"
.LASF1:
	.asciz	"xLastWakeTime"
.LASF5:
	.asciz	"DAC1DATHbits"
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
