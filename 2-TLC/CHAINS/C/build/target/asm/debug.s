	.file	"debug.c"
	.text
Ltext0:
	.globl	_Debug_GenerateRandomBytes
	.def	_Debug_GenerateRandomBytes;	.scl	2;	.type	32;	.endef
_Debug_GenerateRandomBytes:
LFB18:
	.file 1 "src/debug.c"
	.loc 1 42 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 44 0
	movl	$0, -16(%ebp)
	.loc 1 46 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 46 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L2
	.loc 1 48 0 is_stmt 1
	cmpl	$0, 12(%ebp)
	jne	L3
	.loc 1 50 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	jmp	L4
L3:
	.loc 1 54 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_srand
L4:
	.loc 1 57 0
	movl	$0, -12(%ebp)
	jmp	L5
L6:
	.loc 1 59 0 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	call	_rand
	movb	%al, (%ebx)
	.loc 1 57 0 discriminator 3
	addl	$1, -12(%ebp)
L5:
	.loc 1 57 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	L6
	.loc 1 46 0 is_stmt 1
	jmp	L7
L2:
	.loc 1 64 0
	movl	$1, -16(%ebp)
L7:
	.loc 1 67 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 68 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC0:
	.ascii " * TX SOURCE BYTES (%d)\12\11\0"
LC1:
	.ascii " * RX SOURCE BYTES (%d)\12\11\0"
	.align 4
LC2:
	.ascii " * TX CONVOLUTIONAL CODED BYTES (%d)\12\11\0"
	.align 4
LC3:
	.ascii " * RX CONVOLUTIONAL CODED BYTES (%d)\12\11\0"
LC4:
	.ascii "%2X \0"
LC5:
	.ascii "\12\11\0"
	.text
	.globl	_Debug_PrintByteStream
	.def	_Debug_PrintByteStream;	.scl	2;	.type	32;	.endef
_Debug_PrintByteStream:
LFB19:
	.loc 1 82 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 83 0
	movl	$0, -12(%ebp)
	.loc 1 86 0
	cmpl	$0, 8(%ebp)
	je	L10
	.loc 1 86 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L10
	.loc 1 86 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L10
	.loc 1 88 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	32(%eax), %eax
	cmpl	$1, %eax
	jne	L11
	.loc 1 88 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$1, %eax
	jne	L11
	.loc 1 88 0 discriminator 2
	cmpl	$3, 12(%ebp)
	je	L26
L11:
	.loc 1 90 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$1, %eax
	je	L14
	cmpl	$1, %eax
	jb	L15
	cmpl	$2, %eax
	je	L16
	cmpl	$3, %eax
	je	L17
	jmp	L25
L15:
	.loc 1 93 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	.loc 1 94 0
	jmp	L18
L14:
	.loc 1 97 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	.loc 1 98 0
	jmp	L18
L16:
	.loc 1 101 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	.loc 1 102 0
	jmp	L18
L17:
	.loc 1 105 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	.loc 1 106 0
	jmp	L18
L25:
	.loc 1 109 0
	movl	$2, -12(%ebp)
	.loc 1 110 0
	nop
L18:
	.loc 1 113 0
	cmpl	$0, -12(%ebp)
	jne	L19
	.loc 1 115 0
	movl	$0, -16(%ebp)
	jmp	L20
L22:
	.loc 1 117 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	.loc 1 118 0
	movl	-16(%ebp), %ecx
	movl	$-736280107, %edx
	movl	%ecx, %eax
	mull	%edx
	movl	%ecx, %eax
	subl	%edx, %eax
	shrl	%eax
	addl	%edx, %eax
	shrl	$5, %eax
	imull	$35, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	$34, %eax
	jne	L21
	.loc 1 118 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L21
	.loc 1 120 0 is_stmt 1
	movl	$LC5, (%esp)
	call	_printf
L21:
	.loc 1 115 0 discriminator 2
	addl	$1, -16(%ebp)
L20:
	.loc 1 115 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L22
	.loc 1 123 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
L19:
	.loc 1 126 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 88 0
	jmp	L26
L10:
	.loc 1 131 0
	movl	$1, -12(%ebp)
	jmp	L23
L26:
	.loc 1 88 0
	nop
L23:
	.loc 1 134 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 135 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC6:
	.ascii " * RX LLRS (%d)\12\11\0"
LC8:
	.ascii "%1.3f \0"
LC9:
	.ascii "\12\0"
	.text
	.globl	_Debug_PrintFloatStream
	.def	_Debug_PrintFloatStream;	.scl	2;	.type	32;	.endef
_Debug_PrintFloatStream:
LFB20:
	.loc 1 149 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 150 0
	movl	$0, -12(%ebp)
	.loc 1 153 0
	cmpl	$0, 8(%ebp)
	je	L28
	.loc 1 153 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L28
	.loc 1 153 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L28
	.loc 1 156 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	32(%eax), %eax
	cmpl	$1, %eax
	jne	L47
	.loc 1 156 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$1, %eax
	jne	L47
	.loc 1 158 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$6, %eax
	jne	L45
	.loc 1 161 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	.loc 1 162 0
	jmp	L32
L45:
	.loc 1 165 0
	movl	$2, -12(%ebp)
	.loc 1 166 0
	nop
L32:
	.loc 1 169 0
	cmpl	$0, -12(%ebp)
	jne	L33
	.loc 1 171 0
	movl	$0, -16(%ebp)
	jmp	L34
L40:
	.loc 1 173 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	flds	(%eax)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L46
	.loc 1 175 0
	movl	$43, (%esp)
	call	_putchar
	jmp	L37
L46:
	.loc 1 177 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	flds	(%eax)
	fldz
	fucomp	%st(1)
	fnstsw	%ax
	sahf
	jp	L48
	fldz
	fucompp
	fnstsw	%ax
	sahf
	jne	L37
	.loc 1 179 0
	movl	$32, (%esp)
	call	_putchar
	jmp	L37
L48:
	fstp	%st(0)
L37:
	.loc 1 182 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	.loc 1 184 0
	movl	-16(%ebp), %ecx
	movl	$-2004318071, %edx
	movl	%ecx, %eax
	mull	%edx
	movl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, %edx
	sall	$4, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	cmpl	$14, %eax
	jne	L39
	.loc 1 184 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L39
	.loc 1 186 0 is_stmt 1
	movl	$LC5, (%esp)
	call	_printf
L39:
	.loc 1 171 0 discriminator 2
	addl	$1, -16(%ebp)
L34:
	.loc 1 171 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L40
	.loc 1 190 0 is_stmt 1
	movl	$LC9, (%esp)
	call	_puts
L33:
	.loc 1 193 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 156 0
	jmp	L47
L28:
	.loc 1 198 0
	movl	$1, -12(%ebp)
	jmp	L41
L47:
	.loc 1 156 0
	nop
L41:
	.loc 1 201 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 202 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC11:
	.ascii " * TX MAPPED SYMBOLS (%d)\12\11\0"
LC12:
	.ascii " * RX MAPPED SYMBOLS (%d)\12\11\0"
LC13:
	.ascii "%1.2f\0"
LC14:
	.ascii "%1.2fi | \0"
	.text
	.globl	_Debug_PrintComplexStream
	.def	_Debug_PrintComplexStream;	.scl	2;	.type	32;	.endef
_Debug_PrintComplexStream:
LFB21:
	.loc 1 216 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 217 0
	movl	$0, -12(%ebp)
	.loc 1 220 0
	cmpl	$0, 8(%ebp)
	je	L50
	.loc 1 220 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L50
	.loc 1 220 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L50
	.loc 1 222 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	32(%eax), %eax
	cmpl	$1, %eax
	jne	L64
	.loc 1 224 0
	movl	12(%ebp), %eax
	cmpl	$4, %eax
	je	L53
	cmpl	$5, %eax
	je	L54
	jmp	L68
L53:
	.loc 1 227 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	.loc 1 228 0
	jmp	L55
L54:
	.loc 1 231 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	.loc 1 232 0
	jmp	L55
L68:
	.loc 1 235 0
	movl	$2, -12(%ebp)
	.loc 1 236 0
	nop
L55:
	.loc 1 239 0
	cmpl	$0, -12(%ebp)
	jne	L56
	.loc 1 241 0
	movl	$0, -16(%ebp)
	jmp	L57
L63:
	.loc 1 243 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L58
	.loc 1 245 0
	movl	$43, (%esp)
	call	_putchar
L58:
	.loc 1 247 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	.loc 1 249 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L60
	.loc 1 251 0
	movl	$43, (%esp)
	call	_putchar
L60:
	.loc 1 253 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	fstpl	4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	.loc 1 255 0
	movl	-16(%ebp), %eax
	andl	$7, %eax
	cmpl	$7, %eax
	jne	L62
	.loc 1 255 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L62
	.loc 1 257 0 is_stmt 1
	movl	$LC5, (%esp)
	call	_printf
L62:
	.loc 1 241 0 discriminator 2
	addl	$1, -16(%ebp)
L57:
	.loc 1 241 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L63
	.loc 1 260 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
L56:
	.loc 1 263 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 222 0
	jmp	L64
L50:
	.loc 1 268 0
	movl	$1, -12(%ebp)
L64:
	.loc 1 271 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 272 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC15:
	.ascii "\12 # PARAMETERS\0"
LC16:
	.ascii "\12    * Convolutional Coding :\0"
LC17:
	.ascii " K = %d\0"
LC18:
	.ascii " | Rc = %d/%d\0"
LC19:
	.ascii "Hard\0"
LC20:
	.ascii " | DM = %s\12\0"
LC21:
	.ascii "    * Modulation :\0"
LC22:
	.ascii "PSK\0"
LC23:
	.ascii " %u-%s\12\0"
LC24:
	.ascii "    * Channel :\0"
LC26:
	.ascii " AWGN | EbN0 = %1.1f\12\0"
	.text
	.globl	_Debug_PrintParameters
	.def	_Debug_PrintParameters;	.scl	2;	.type	32;	.endef
_Debug_PrintParameters:
LFB22:
	.loc 1 283 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 284 0
	movl	$0, -12(%ebp)
	.loc 1 286 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IsSrcLenValid
	testb	%al, %al
	je	L70
	.loc 1 288 0
	movl	$LC15, (%esp)
	call	_printf
	.loc 1 289 0
	movl	$LC16, (%esp)
	call	_printf
	.loc 1 290 0
	movl	$7, 4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	.loc 1 291 0
	movl	$2, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC18, (%esp)
	call	_printf
	.loc 1 292 0
	movl	$LC19, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	.loc 1 293 0
	movl	$LC21, (%esp)
	call	_printf
	.loc 1 294 0
	movl	$LC22, 8(%esp)
	movl	$4, 4(%esp)
	movl	$LC23, (%esp)
	call	_printf
	.loc 1 295 0
	movl	$LC24, (%esp)
	call	_printf
	.loc 1 302 0
	fldl	LC25
	fstpl	4(%esp)
	movl	$LC26, (%esp)
	call	_printf
	.loc 1 308 0
	movl	$10, (%esp)
	call	_putchar
	jmp	L71
L70:
	.loc 1 312 0
	movl	$6, -12(%ebp)
L71:
	.loc 1 315 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 316 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
	.align 4
LC27:
	.ascii " * Errors at convolutional encoding level: %u out of %u bits (MD = %u)\12\12\0"
	.align 4
LC28:
	.ascii " * Errors at source level: %u out of %u bits (MD = %u)\12\12\0"
	.text
	.globl	_Debug_CheckWrongBits
	.def	_Debug_CheckWrongBits;	.scl	2;	.type	32;	.endef
_Debug_CheckWrongBits:
LFB23:
	.loc 1 329 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	.loc 1 330 0
	movl	$0, -12(%ebp)
	.loc 1 331 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 332 0
	movl	$0, -16(%ebp)
	.loc 1 333 0
	movl	-32(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 334 0
	movl	$0, -24(%ebp)
	.loc 1 339 0
	cmpl	$0, 8(%ebp)
	je	L74
	.loc 1 339 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L74
	.loc 1 339 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L74
	.loc 1 339 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L74
	.loc 1 339 0 discriminator 4
	cmpl	$0, 20(%ebp)
	je	L74
	.loc 1 341 0 is_stmt 1
	movl	20(%ebp), %eax
	movl	32(%eax), %eax
	cmpl	$1, %eax
	jne	L75
	.loc 1 341 0 is_stmt 0 discriminator 1
	movl	20(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$1, %eax
	jne	L75
	.loc 1 341 0 discriminator 2
	cmpl	$3, 16(%ebp)
	je	L89
L75:
	.loc 1 343 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L77
	.loc 1 345 0
	movl	$0, -28(%ebp)
	jmp	L78
L81:
	.loc 1 347 0
	movl	-28(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 348 0
	movl	-28(%ebp), %eax
	andl	$7, %eax
	movb	%al, -37(%ebp)
	.loc 1 349 0
	addl	$1, -24(%ebp)
	.loc 1 350 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-37(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sarl	%cl, %ebx
	.loc 1 351 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-37(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	.loc 1 350 0
	xorl	%ebx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L79
	.loc 1 353 0
	addl	$1, -16(%ebp)
	.loc 1 354 0
	cmpl	$1, -16(%ebp)
	jbe	L80
	.loc 1 354 0 is_stmt 0 discriminator 1
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jnb	L80
	.loc 1 356 0 is_stmt 1
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
L80:
	.loc 1 358 0
	movl	$0, -24(%ebp)
L79:
	.loc 1 345 0 discriminator 2
	addl	$1, -28(%ebp)
L78:
	.loc 1 345 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L81
	.loc 1 361 0 is_stmt 1
	cmpl	$1, -16(%ebp)
	ja	L82
	.loc 1 363 0
	movl	$0, -20(%ebp)
L82:
	.loc 1 366 0
	movl	16(%ebp), %eax
	cmpl	$1, %eax
	jbe	L84
	cmpl	$3, %eax
	ja	L83
	.loc 1 370 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC27, (%esp)
	call	_printf
	.loc 1 371 0
	jmp	L76
L84:
	.loc 1 375 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC28, (%esp)
	call	_printf
	.loc 1 376 0
	jmp	L76
L83:
	.loc 1 379 0
	movl	$2, -12(%ebp)
	.loc 1 380 0
	nop
	jmp	L76
L77:
	.loc 1 385 0
	movl	$6, -12(%ebp)
	.loc 1 341 0
	jmp	L89
L76:
	.loc 1 341 0 is_stmt 0 discriminator 1
	jmp	L89
L74:
	.loc 1 391 0 is_stmt 1
	movl	$1, -12(%ebp)
	jmp	L87
L89:
	.loc 1 341 0
	nop
L87:
	.loc 1 394 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 395 0
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
LC29:
	.ascii "w\0"
LC30:
	.ascii "txSrcBytes.csv\0"
LC31:
	.ascii "rxSrcBytes.csv\0"
LC32:
	.ascii "%u,\0"
LC33:
	.ascii "%u\0"
	.text
	.globl	_Debug_WriteByteStreamToCsv
	.def	_Debug_WriteByteStreamToCsv;	.scl	2;	.type	32;	.endef
_Debug_WriteByteStreamToCsv:
LFB24:
	.loc 1 407 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 408 0
	movl	$0, -12(%ebp)
	.loc 1 409 0
	movl	$0, -16(%ebp)
	.loc 1 412 0
	cmpl	$0, 8(%ebp)
	je	L91
	.loc 1 412 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L91
	.loc 1 414 0 is_stmt 1
	movl	12(%ebp), %eax
	testl	%eax, %eax
	je	L93
	cmpl	$1, %eax
	je	L94
	jmp	L102
L93:
	.loc 1 417 0
	movl	$LC29, 4(%esp)
	movl	$LC30, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 418 0
	jmp	L95
L94:
	.loc 1 421 0
	movl	$LC29, 4(%esp)
	movl	$LC31, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 422 0
	jmp	L95
L102:
	.loc 1 425 0
	movl	$2, -12(%ebp)
	.loc 1 426 0
	nop
L95:
	.loc 1 429 0
	cmpl	$0, -12(%ebp)
	jne	L103
	.loc 1 429 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L103
	.loc 1 431 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC32, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 432 0
	movl	$0, -20(%ebp)
	jmp	L97
L99:
	.loc 1 434 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$LC33, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 435 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L98
	.loc 1 437 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L98:
	.loc 1 432 0 discriminator 2
	addl	$1, -20(%ebp)
L97:
	.loc 1 432 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L99
	.loc 1 440 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	.loc 1 429 0
	jmp	L103
L91:
	.loc 1 445 0
	movl	$1, -12(%ebp)
	jmp	L100
L103:
	.loc 1 429 0
	nop
L100:
	.loc 1 448 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 449 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.section .rdata,"dr"
LC34:
	.ascii "txModSymbs.csv\0"
LC35:
	.ascii "rxModSymbs.csv\0"
LC36:
	.ascii "%1.4f,%1.4f\0"
	.text
	.globl	_Debug_WriteComplexStreamToCsv
	.def	_Debug_WriteComplexStreamToCsv;	.scl	2;	.type	32;	.endef
_Debug_WriteComplexStreamToCsv:
LFB25:
	.loc 1 461 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 462 0
	movl	$0, -12(%ebp)
	.loc 1 463 0
	movl	$0, -16(%ebp)
	.loc 1 466 0
	cmpl	$0, 8(%ebp)
	je	L105
	.loc 1 466 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L105
	.loc 1 468 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$4, %eax
	je	L107
	cmpl	$5, %eax
	je	L108
	jmp	L116
L107:
	.loc 1 471 0
	movl	$LC29, 4(%esp)
	movl	$LC34, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 472 0
	jmp	L109
L108:
	.loc 1 475 0
	movl	$LC29, 4(%esp)
	movl	$LC35, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 476 0
	jmp	L109
L116:
	.loc 1 479 0
	movl	$2, -12(%ebp)
	.loc 1 480 0
	nop
L109:
	.loc 1 483 0
	cmpl	$0, -12(%ebp)
	jne	L117
	.loc 1 483 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L117
	.loc 1 485 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC32, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 486 0
	movl	$0, -20(%ebp)
	jmp	L111
L113:
	.loc 1 488 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	fxch	%st(1)
	fstpl	16(%esp)
	fstpl	8(%esp)
	movl	$LC36, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 489 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L112
	.loc 1 491 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L112:
	.loc 1 486 0 discriminator 2
	addl	$1, -20(%ebp)
L111:
	.loc 1 486 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L113
	.loc 1 494 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	.loc 1 483 0
	jmp	L117
L105:
	.loc 1 499 0
	movl	$1, -12(%ebp)
	jmp	L114
L117:
	.loc 1 483 0
	nop
L114:
	.loc 1 502 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 503 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_Debug_ListParameters
	.def	_Debug_ListParameters;	.scl	2;	.type	32;	.endef
_Debug_ListParameters:
LFB26:
	.loc 1 517 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 518 0
	movl	$0, -12(%ebp)
	.loc 1 520 0
	cmpl	$0, 8(%ebp)
	je	L119
	.loc 1 520 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L119
	.loc 1 520 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L119
	.loc 1 520 0 discriminator 3
	cmpl	$0, 20(%ebp)
	je	L119
	.loc 1 522 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, (%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 4(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 8(%eax)
	movl	12(%edx), %edx
	movl	%edx, 12(%eax)
	.loc 1 523 0
	movl	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	8(%edx), %edx
	movl	%edx, 24(%eax)
	.loc 1 524 0
	movl	8(%ebp), %eax
	movl	20(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 28(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	12(%edx), %edx
	movl	%edx, 40(%eax)
	jmp	L120
L119:
	.loc 1 528 0
	movl	$1, -12(%ebp)
L120:
	.loc 1 531 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 532 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_IsSrcLenValid;	.scl	3;	.type	32;	.endef
_IsSrcLenValid:
LFB27:
	.loc 1 548 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 549 0
	movb	$0, -1(%ebp)
	.loc 1 550 0
	movl	8(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -8(%ebp)
	.loc 1 553 0
	movl	-8(%ebp), %eax
	addl	%eax, %eax
	andl	$6, %eax
	.loc 1 552 0
	testl	%eax, %eax
	jne	L123
	.loc 1 555 0
	movb	$1, -1(%ebp)
L123:
	.loc 1 558 0
	movzbl	-1(%ebp), %eax
	.loc 1 559 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
	.align 8
LC25:
	.long	1073741824
	.long	1074213683
	.text
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/system.h"
	.file 7 "src/error.h"
	.file 8 "src/memory.h"
	.file 9 "src/modulation.h"
	.file 10 "src/channel.h"
	.file 11 "src/convolutional.h"
	.file 12 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xf2e
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\debug.c\0"
	.ascii "H:\\SCIENCE\\2-TLC\\CHAINS\\C\0"
	.long	Ltext0
	.long	Letext0-Ltext0
	.secrel32	Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x3
	.ascii "_iobuf\0"
	.byte	0x20
	.byte	0x2
	.byte	0xd2
	.long	0x148
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x148
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xb2
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x148
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xb2
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xb2
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xb2
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xb2
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x148
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xb9
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xc1
	.uleb128 0x7
	.long	0x14e
	.long	0x165
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x15a
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x18f
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x6
	.ascii "uint16_t\0"
	.byte	0x3
	.byte	0x3d
	.long	0x7f
	.uleb128 0x6
	.ascii "uint32_t\0"
	.byte	0x3
	.byte	0x3f
	.long	0x6f
	.uleb128 0xa
	.long	0x1bd
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xb2
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x206
	.uleb128 0x5
	.byte	0x4
	.long	0x148
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xb2
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xb2
	.uleb128 0x7
	.long	0x148
	.long	0x23c
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x231
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x4
	.byte	0xfa
	.long	0x6f
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x6f
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x6f
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x6f
	.uleb128 0xb
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb2
	.uleb128 0xb
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb2
	.uleb128 0xb
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x95
	.uleb128 0x7
	.long	0x148
	.long	0x2d2
	.uleb128 0xc
	.long	0x2d2
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "sizetype\0"
	.uleb128 0xb
	.ascii "_tzname\0"
	.byte	0x5
	.word	0x15e
	.long	0x2c2
	.uleb128 0xb
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xb2
	.uleb128 0xb
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x95
	.uleb128 0xb
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2c2
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x2
	.byte	0xc
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x3
	.ascii "_complex_t\0"
	.byte	0x8
	.byte	0x6
	.byte	0x33
	.long	0x362
	.uleb128 0x4
	.ascii "re\0"
	.byte	0x6
	.byte	0x35
	.long	0x362
	.byte	0
	.uleb128 0x4
	.ascii "im\0"
	.byte	0x6
	.byte	0x36
	.long	0x362
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x6
	.ascii "complex_t\0"
	.byte	0x6
	.byte	0x37
	.long	0x338
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x7
	.byte	0x1b
	.long	0x499
	.uleb128 0xe
	.ascii "ERR_NONE\0"
	.byte	0
	.uleb128 0xe
	.ascii "ERR_INV_NULL_POINTER\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "ERR_INV_PRINTID\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "ERR_INV_CNVCOD_RATE\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "ERR_INV_CNVCOD_KLEN\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "ERR_INV_CNVCOD_DECMET\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "ERR_INV_BUFFER_SIZE\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "ERR_INV_DYNAMIC_ALLOC\0"
	.byte	0x7
	.uleb128 0xe
	.ascii "ERR_INV_STREAM_TYPE\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "ERR_INV_MODULATION_TYPE\0"
	.byte	0x9
	.uleb128 0xe
	.ascii "ERR_INV_MODULATION_BPS\0"
	.byte	0xa
	.uleb128 0xe
	.ascii "ERR_INV_CHANNEL_TYPE\0"
	.byte	0xb
	.uleb128 0xe
	.ascii "ERR_NUM\0"
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x7
	.byte	0x2a
	.long	0x37c
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x8
	.byte	0x1d
	.long	0x4f2
	.uleb128 0xe
	.ascii "memory_type_byte\0"
	.byte	0
	.uleb128 0xe
	.ascii "memory_type_float\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "memory_type_complex\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "memory_type_t\0"
	.byte	0x8
	.byte	0x21
	.long	0x4a8
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x24
	.long	0x543
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x26
	.long	0x543
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x27
	.long	0x1bd
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x28
	.long	0x4f2
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x180
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x8
	.byte	0x29
	.long	0x507
	.uleb128 0xa
	.long	0x549
	.uleb128 0x3
	.ascii "_float_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x2c
	.long	0x5a0
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x2e
	.long	0x5a0
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x2f
	.long	0x1bd
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x30
	.long	0x4f2
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x362
	.uleb128 0x6
	.ascii "float_stream_t\0"
	.byte	0x8
	.byte	0x31
	.long	0x563
	.uleb128 0xa
	.long	0x5a6
	.uleb128 0x3
	.ascii "_complex_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x34
	.long	0x600
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x36
	.long	0x600
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x37
	.long	0x1bd
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x38
	.long	0x4f2
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x36b
	.uleb128 0x6
	.ascii "complex_stream_t\0"
	.byte	0x8
	.byte	0x39
	.long	0x5c1
	.uleb128 0xa
	.long	0x606
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x9
	.byte	0x1d
	.long	0x64e
	.uleb128 0xe
	.ascii "MOD_PSK\0"
	.byte	0
	.uleb128 0xe
	.ascii "MOD_QAM\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "MOD_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "modulation_t\0"
	.byte	0x9
	.byte	0x22
	.long	0x623
	.uleb128 0x3
	.ascii "_mod_par_t\0"
	.byte	0xc
	.byte	0x9
	.byte	0x49
	.long	0x6ac
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x9
	.byte	0x4b
	.long	0x64e
	.byte	0
	.uleb128 0x4
	.ascii "order\0"
	.byte	0x9
	.byte	0x4c
	.long	0x180
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0x9
	.byte	0x4d
	.long	0x180
	.byte	0x5
	.uleb128 0x4
	.ascii "phOfst\0"
	.byte	0x9
	.byte	0x4e
	.long	0x362
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "mod_par_t\0"
	.byte	0x9
	.byte	0x4f
	.long	0x662
	.uleb128 0xa
	.long	0x6ac
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xa
	.byte	0x1e
	.long	0x6f1
	.uleb128 0xe
	.ascii "CHAN_BSC\0"
	.byte	0
	.uleb128 0xe
	.ascii "CHAN_AWGN\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "CHAN_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "channel_t\0"
	.byte	0xa
	.byte	0x23
	.long	0x6c2
	.uleb128 0xf
	.byte	0x4
	.byte	0xa
	.byte	0x2b
	.long	0x722
	.uleb128 0x10
	.ascii "Peb\0"
	.byte	0xa
	.byte	0x2d
	.long	0x362
	.uleb128 0x10
	.ascii "EbN0\0"
	.byte	0xa
	.byte	0x2e
	.long	0x362
	.byte	0
	.uleb128 0x3
	.ascii "_chan_par_t\0"
	.byte	0x10
	.byte	0xa
	.byte	0x26
	.long	0x763
	.uleb128 0x4
	.ascii "seed\0"
	.byte	0xa
	.byte	0x28
	.long	0x1bd
	.byte	0
	.uleb128 0x4
	.ascii "type\0"
	.byte	0xa
	.byte	0x29
	.long	0x6f1
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0xa
	.byte	0x2a
	.long	0x180
	.byte	0x8
	.uleb128 0x11
	.long	0x702
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "chan_par_t\0"
	.byte	0xa
	.byte	0x30
	.long	0x722
	.uleb128 0xa
	.long	0x763
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x45
	.long	0x7c8
	.uleb128 0xe
	.ascii "CC_RATE_12\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "CC_RATE_23\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "CC_RATE_34\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "CC_RATE_56\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "CC_RATE_78\0"
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.ascii "cc_rate_t\0"
	.byte	0xb
	.byte	0x47
	.long	0x77a
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x55
	.long	0x84a
	.uleb128 0xe
	.ascii "CC_KLEN_3\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "CC_KLEN_4\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "CC_KLEN_5\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "CC_KLEN_6\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "CC_KLEN_7\0"
	.byte	0x7
	.uleb128 0xe
	.ascii "CC_KLEN_8\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "CC_KLEN_MIN\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "CC_KLEN_MAX\0"
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "cc_klen_t\0"
	.byte	0xb
	.byte	0x5e
	.long	0x7d9
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x63
	.long	0x897
	.uleb128 0xe
	.ascii "CC_VITDM_HARD\0"
	.byte	0
	.uleb128 0xe
	.ascii "CC_VITDM_SOFT\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "CC_VITDM_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "cc_dec_method_t\0"
	.byte	0xb
	.byte	0x68
	.long	0x85b
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0xb
	.byte	0x6b
	.long	0x8fa
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0xb
	.byte	0x6d
	.long	0x7c8
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0xb
	.byte	0x6e
	.long	0x84a
	.byte	0x4
	.uleb128 0x4
	.ascii "memFact\0"
	.byte	0xb
	.byte	0x6f
	.long	0x1ad
	.byte	0x8
	.uleb128 0x4
	.ascii "vitDM\0"
	.byte	0xb
	.byte	0x70
	.long	0x897
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0xb
	.byte	0x71
	.long	0x8ae
	.uleb128 0xa
	.long	0x8fa
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xc
	.byte	0x2b
	.long	0x987
	.uleb128 0xe
	.ascii "PID_TX_SRC\0"
	.byte	0
	.uleb128 0xe
	.ascii "PID_RX_SRC\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "PID_TX_CNVCOD\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "PID_RX_CNVCOD\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "PID_TX_MAP\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "PID_RX_MAP\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "PID_RX_LLR\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "PID_NUM\0"
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.ascii "print_label_t\0"
	.byte	0xc
	.byte	0x35
	.long	0x90f
	.uleb128 0x3
	.ascii "_debug_par_t\0"
	.byte	0x2c
	.byte	0xc
	.byte	0x38
	.long	0x9df
	.uleb128 0x4
	.ascii "ccPar\0"
	.byte	0xc
	.byte	0x3a
	.long	0x8fa
	.byte	0
	.uleb128 0x4
	.ascii "modPar\0"
	.byte	0xc
	.byte	0x3b
	.long	0x6ac
	.byte	0x10
	.uleb128 0x4
	.ascii "chanPar\0"
	.byte	0xc
	.byte	0x3c
	.long	0x763
	.byte	0x1c
	.byte	0
	.uleb128 0x6
	.ascii "debug_par_t\0"
	.byte	0xc
	.byte	0x3d
	.long	0x99c
	.uleb128 0xa
	.long	0x9df
	.uleb128 0x12
	.ascii "IsSrcLenValid\0"
	.byte	0x1
	.word	0x223
	.long	0xa4e
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xa4e
	.uleb128 0x13
	.ascii "lenBy\0"
	.byte	0x1
	.word	0x223
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.ascii "bRet\0"
	.byte	0x1
	.word	0x225
	.long	0xa4e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x14
	.ascii "lenBi\0"
	.byte	0x1
	.word	0x226
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x15
	.ascii "Debug_ListParameters\0"
	.byte	0x1
	.word	0x204
	.long	0x499
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xae2
	.uleb128 0x13
	.ascii "ioParams\0"
	.byte	0x1
	.word	0x204
	.long	0xae2
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.ascii "ccParam\0"
	.byte	0x1
	.word	0x204
	.long	0xae8
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.ascii "modParam\0"
	.byte	0x1
	.word	0x204
	.long	0xaee
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "chanParam\0"
	.byte	0x1
	.word	0x204
	.long	0xaf4
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x206
	.long	0x499
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x9df
	.uleb128 0x5
	.byte	0x4
	.long	0x90a
	.uleb128 0x5
	.byte	0x4
	.long	0x6bd
	.uleb128 0x5
	.byte	0x4
	.long	0x775
	.uleb128 0x15
	.ascii "Debug_WriteComplexStreamToCsv\0"
	.byte	0x1
	.word	0x1cc
	.long	0x499
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xb78
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.word	0x1cc
	.long	0xb78
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x1cc
	.long	0x987
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x1ce
	.long	0x499
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "fid\0"
	.byte	0x1
	.word	0x1cf
	.long	0xb7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x1d0
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x61e
	.uleb128 0x5
	.byte	0x4
	.long	0x14e
	.uleb128 0x15
	.ascii "Debug_WriteByteStreamToCsv\0"
	.byte	0x1
	.word	0x196
	.long	0x499
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xbff
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.word	0x196
	.long	0xbff
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x196
	.long	0x987
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x198
	.long	0x499
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "fid\0"
	.byte	0x1
	.word	0x199
	.long	0xb7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x19a
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x55e
	.uleb128 0x15
	.ascii "Debug_CheckWrongBits\0"
	.byte	0x1
	.word	0x148
	.long	0x499
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xd0d
	.uleb128 0x13
	.ascii "inStreamA\0"
	.byte	0x1
	.word	0x148
	.long	0xbff
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.ascii "inStreamB\0"
	.byte	0x1
	.word	0x148
	.long	0xbff
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x148
	.long	0x987
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF3
	.byte	0x1
	.word	0x148
	.long	0xd0d
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x14a
	.long	0x499
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "bitLen\0"
	.byte	0x1
	.word	0x14b
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.ascii "bitErrCnt\0"
	.byte	0x1
	.word	0x14c
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.ascii "minErrDist\0"
	.byte	0x1
	.word	0x14d
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.ascii "curErrDist\0"
	.byte	0x1
	.word	0x14e
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x14f
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.ascii "byteIdx\0"
	.byte	0x1
	.word	0x150
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.ascii "bitIdx\0"
	.byte	0x1
	.word	0x151
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x9f2
	.uleb128 0x15
	.ascii "Debug_PrintParameters\0"
	.byte	0x1
	.word	0x11a
	.long	0x499
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xd5e
	.uleb128 0x13
	.ascii "len\0"
	.byte	0x1
	.word	0x11a
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x11c
	.long	0x499
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.ascii "Debug_PrintComplexStream\0"
	.byte	0x1
	.byte	0xd7
	.long	0x499
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xdd1
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0xd7
	.long	0xb78
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF2
	.byte	0x1
	.byte	0xd7
	.long	0x987
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF3
	.byte	0x1
	.byte	0xd7
	.long	0xd0d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.byte	0xd9
	.long	0x499
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0xda
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.ascii "Debug_PrintFloatStream\0"
	.byte	0x1
	.byte	0x94
	.long	0x499
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xe42
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0x94
	.long	0xe42
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF2
	.byte	0x1
	.byte	0x94
	.long	0x987
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF3
	.byte	0x1
	.byte	0x94
	.long	0xd0d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.byte	0x96
	.long	0x499
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0x97
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5bc
	.uleb128 0x18
	.ascii "Debug_PrintByteStream\0"
	.byte	0x1
	.byte	0x51
	.long	0x499
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xeb8
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0x51
	.long	0xbff
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF2
	.byte	0x1
	.byte	0x51
	.long	0x987
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF3
	.byte	0x1
	.byte	0x51
	.long	0xd0d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.byte	0x53
	.long	0x499
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0x54
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.ascii "Debug_GenerateRandomBytes\0"
	.byte	0x1
	.byte	0x29
	.long	0x499
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xf25
	.uleb128 0x1c
	.ascii "ioStream\0"
	.byte	0x1
	.byte	0x29
	.long	0xf25
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.ascii "pSeed\0"
	.byte	0x1
	.byte	0x29
	.long	0xf2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0x2b
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.byte	0x2c
	.long	0x499
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x549
	.uleb128 0x5
	.byte	0x4
	.long	0x1cd
	.byte	0
	.section	.debug_abbrev,"dr"
Ldebug_abbrev0:
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
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"dr"
	.long	0x1c
	.word	0x2
	.secrel32	Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	Ltext0
	.long	Letext0-Ltext0
	.long	0
	.long	0
	.section	.debug_line,"dr"
Ldebug_line0:
	.section	.debug_str,"dr"
LASF1:
	.ascii "inStream\0"
LASF3:
	.ascii "dbgParams\0"
LASF2:
	.ascii "label\0"
LASF0:
	.ascii "retErr\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fputc;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
