	.file	"debug.c"
	.text
Ltext0:
	.globl	_Debug_ListParameters
	.def	_Debug_ListParameters;	.scl	2;	.type	32;	.endef
_Debug_ListParameters:
LFB18:
	.file 1 "src/debug.c"
	.loc 1 43 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 44 0
	movl	$0, -12(%ebp)
	.loc 1 46 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 46 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L2
	.loc 1 46 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L2
	.loc 1 46 0 discriminator 3
	cmpl	$0, 20(%ebp)
	je	L2
	.loc 1 46 0 discriminator 4
	cmpl	$0, 24(%ebp)
	je	L2
	.loc 1 48 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	24(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 24(%eax)
	movl	12(%edx), %edx
	movl	%edx, 28(%eax)
	.loc 1 49 0
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
	.loc 1 50 0
	movl	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	8(%edx), %edx
	movl	%edx, 40(%eax)
	.loc 1 51 0
	movl	8(%ebp), %eax
	movl	20(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	12(%edx), %edx
	movl	%edx, 56(%eax)
	jmp	L3
L2:
	.loc 1 55 0
	movl	$1, -12(%ebp)
L3:
	.loc 1 58 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 59 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_Debug_GenerateRandomBytes
	.def	_Debug_GenerateRandomBytes;	.scl	2;	.type	32;	.endef
_Debug_GenerateRandomBytes:
LFB19:
	.loc 1 71 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 73 0
	movl	$0, -16(%ebp)
	.loc 1 75 0
	cmpl	$0, 8(%ebp)
	je	L6
	.loc 1 75 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L6
	.loc 1 77 0 is_stmt 1
	cmpl	$0, 12(%ebp)
	jne	L7
	.loc 1 79 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	jmp	L8
L7:
	.loc 1 83 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_srand
L8:
	.loc 1 86 0
	movl	$0, -12(%ebp)
	jmp	L9
L10:
	.loc 1 88 0 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	call	_rand
	movb	%al, (%ebx)
	.loc 1 86 0 discriminator 3
	addl	$1, -12(%ebp)
L9:
	.loc 1 86 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	L10
	.loc 1 75 0 is_stmt 1
	jmp	L11
L6:
	.loc 1 93 0
	movl	$1, -16(%ebp)
L11:
	.loc 1 96 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 97 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC0:
	.ascii " * TX ORIGIN BYTES (%d)\12\11\0"
LC1:
	.ascii " * RX ORIGIN BYTES (%d)\12\11\0"
LC2:
	.ascii " * TX SCRAMBLED BYTES (%d)\12\11\0"
LC3:
	.ascii " * RX SCRAMBLED BYTES (%d)\12\11\0"
	.align 4
LC4:
	.ascii " * TX CONVOLUTIONAL CODED BYTES (%d)\12\11\0"
	.align 4
LC5:
	.ascii " * RX CONVOLUTIONAL CODED BYTES (%d)\12\11\0"
LC6:
	.ascii "%2X \0"
LC7:
	.ascii "\12\11\0"
	.text
	.globl	_Debug_PrintByteStream
	.def	_Debug_PrintByteStream;	.scl	2;	.type	32;	.endef
_Debug_PrintByteStream:
LFB20:
	.loc 1 110 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 111 0
	movl	$0, -12(%ebp)
	.loc 1 114 0
	cmpl	$0, 8(%ebp)
	je	L14
	.loc 1 114 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L14
	.loc 1 114 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L14
	.loc 1 116 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$1, %eax
	jne	L15
	.loc 1 116 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$1, %eax
	jne	L15
	.loc 1 116 0 discriminator 2
	cmpl	$5, 12(%ebp)
	je	L32
L15:
	.loc 1 118 0 is_stmt 1
	cmpl	$5, 12(%ebp)
	ja	L17
	movl	12(%ebp), %eax
	sall	$2, %eax
	addl	$L19, %eax
	movl	(%eax), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L19:
	.long	L18
	.long	L20
	.long	L21
	.long	L22
	.long	L23
	.long	L24
	.text
L18:
	.loc 1 121 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	.loc 1 122 0
	jmp	L25
L20:
	.loc 1 125 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	.loc 1 126 0
	jmp	L25
L21:
	.loc 1 129 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	.loc 1 130 0
	jmp	L25
L22:
	.loc 1 133 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	.loc 1 134 0
	jmp	L25
L23:
	.loc 1 137 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	.loc 1 138 0
	jmp	L25
L24:
	.loc 1 141 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	.loc 1 142 0
	jmp	L25
L17:
	.loc 1 145 0
	movl	$2, -12(%ebp)
	.loc 1 146 0
	nop
L25:
	.loc 1 149 0
	cmpl	$0, -12(%ebp)
	jne	L26
	.loc 1 151 0
	movl	$0, -16(%ebp)
	jmp	L27
L29:
	.loc 1 153 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	.loc 1 154 0
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
	jne	L28
	.loc 1 154 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L28
	.loc 1 156 0 is_stmt 1
	movl	$LC7, (%esp)
	call	_printf
L28:
	.loc 1 151 0 discriminator 2
	addl	$1, -16(%ebp)
L27:
	.loc 1 151 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L29
	.loc 1 159 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
L26:
	.loc 1 162 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 116 0
	jmp	L32
L14:
	.loc 1 167 0
	movl	$1, -12(%ebp)
	jmp	L30
L32:
	.loc 1 116 0
	nop
L30:
	.loc 1 170 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 171 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC8:
	.ascii " * RX LLRS (%d)\12\11\0"
LC10:
	.ascii "%1.3f \0"
LC11:
	.ascii "\12\0"
	.text
	.globl	_Debug_PrintFloatStream
	.def	_Debug_PrintFloatStream;	.scl	2;	.type	32;	.endef
_Debug_PrintFloatStream:
LFB21:
	.loc 1 184 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 185 0
	movl	$0, -12(%ebp)
	.loc 1 188 0
	cmpl	$0, 8(%ebp)
	je	L34
	.loc 1 188 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L34
	.loc 1 188 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L34
	.loc 1 191 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$1, %eax
	jne	L53
	.loc 1 191 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$1, %eax
	jne	L53
	.loc 1 193 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$8, %eax
	jne	L51
	.loc 1 196 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	.loc 1 197 0
	jmp	L38
L51:
	.loc 1 200 0
	movl	$2, -12(%ebp)
	.loc 1 201 0
	nop
L38:
	.loc 1 204 0
	cmpl	$0, -12(%ebp)
	jne	L39
	.loc 1 206 0
	movl	$0, -16(%ebp)
	jmp	L40
L46:
	.loc 1 208 0
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
	jbe	L52
	.loc 1 210 0
	movl	$43, (%esp)
	call	_putchar
	jmp	L43
L52:
	.loc 1 212 0
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
	jp	L54
	fldz
	fucompp
	fnstsw	%ax
	sahf
	jne	L43
	.loc 1 214 0
	movl	$32, (%esp)
	call	_putchar
	jmp	L43
L54:
	fstp	%st(0)
L43:
	.loc 1 217 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC10, (%esp)
	call	_printf
	.loc 1 219 0
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
	jne	L45
	.loc 1 219 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L45
	.loc 1 221 0 is_stmt 1
	movl	$LC7, (%esp)
	call	_printf
L45:
	.loc 1 206 0 discriminator 2
	addl	$1, -16(%ebp)
L40:
	.loc 1 206 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L46
	.loc 1 225 0 is_stmt 1
	movl	$LC11, (%esp)
	call	_puts
L39:
	.loc 1 228 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 191 0
	jmp	L53
L34:
	.loc 1 233 0
	movl	$1, -12(%ebp)
	jmp	L47
L53:
	.loc 1 191 0
	nop
L47:
	.loc 1 236 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 237 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC13:
	.ascii " * TX MAPPED SYMBOLS (%d)\12\11\0"
LC14:
	.ascii " * RX MAPPED SYMBOLS (%d)\12\11\0"
LC15:
	.ascii "%1.2f\0"
LC16:
	.ascii "%1.2fi | \0"
	.text
	.globl	_Debug_PrintComplexStream
	.def	_Debug_PrintComplexStream;	.scl	2;	.type	32;	.endef
_Debug_PrintComplexStream:
LFB22:
	.loc 1 250 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 251 0
	movl	$0, -12(%ebp)
	.loc 1 254 0
	cmpl	$0, 8(%ebp)
	je	L56
	.loc 1 254 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L56
	.loc 1 254 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L56
	.loc 1 256 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$1, %eax
	jne	L70
	.loc 1 258 0
	movl	12(%ebp), %eax
	cmpl	$6, %eax
	je	L59
	cmpl	$7, %eax
	je	L60
	jmp	L74
L59:
	.loc 1 261 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	.loc 1 262 0
	jmp	L61
L60:
	.loc 1 265 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	.loc 1 266 0
	jmp	L61
L74:
	.loc 1 269 0
	movl	$2, -12(%ebp)
	.loc 1 270 0
	nop
L61:
	.loc 1 273 0
	cmpl	$0, -12(%ebp)
	jne	L62
	.loc 1 275 0
	movl	$0, -16(%ebp)
	jmp	L63
L69:
	.loc 1 277 0
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
	jb	L64
	.loc 1 279 0
	movl	$43, (%esp)
	call	_putchar
L64:
	.loc 1 281 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC15, (%esp)
	call	_printf
	.loc 1 283 0
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
	jb	L66
	.loc 1 285 0
	movl	$43, (%esp)
	call	_putchar
L66:
	.loc 1 287 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	fstpl	4(%esp)
	movl	$LC16, (%esp)
	call	_printf
	.loc 1 289 0
	movl	-16(%ebp), %eax
	andl	$7, %eax
	cmpl	$7, %eax
	jne	L68
	.loc 1 289 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L68
	.loc 1 291 0 is_stmt 1
	movl	$LC7, (%esp)
	call	_printf
L68:
	.loc 1 275 0 discriminator 2
	addl	$1, -16(%ebp)
L63:
	.loc 1 275 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L69
	.loc 1 294 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
L62:
	.loc 1 297 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 256 0
	jmp	L70
L56:
	.loc 1 302 0
	movl	$1, -12(%ebp)
L70:
	.loc 1 305 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 306 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC17:
	.ascii "\12 # PARAMETERS\0"
LC18:
	.ascii "    * Scrambling :\0"
LC19:
	.ascii "Multiplicative\0"
LC20:
	.ascii "N/A\0"
LC21:
	.ascii "Additive\0"
LC22:
	.ascii "%s\0"
LC23:
	.ascii " | Ncells = %u\12\0"
LC24:
	.ascii "    * Convolutional Coding :\0"
LC25:
	.ascii " K = %d\0"
LC26:
	.ascii " | Rc = %d/%d\0"
LC27:
	.ascii "Soft\0"
LC28:
	.ascii "Hard\0"
LC29:
	.ascii " | DM = %s\12\0"
LC30:
	.ascii "    * Modulation :\0"
LC31:
	.ascii "QAM\0"
LC32:
	.ascii "PSK\0"
LC33:
	.ascii " %u-%s\12\0"
LC34:
	.ascii "    * Channel :\0"
LC35:
	.ascii " BSC | Peb = %1.1e\12\0"
LC36:
	.ascii " AWGN | EbN0 = %1.1f\12\0"
LC37:
	.ascii " N/A\0"
	.text
	.globl	_Debug_PrintParameters
	.def	_Debug_PrintParameters;	.scl	2;	.type	32;	.endef
_Debug_PrintParameters:
LFB23:
	.loc 1 318 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 319 0
	movl	$0, -12(%ebp)
	.loc 1 321 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IsOrgLenValid
	testb	%al, %al
	je	L76
	.loc 1 323 0
	movl	$LC17, (%esp)
	call	_puts
	.loc 1 324 0
	movl	$LC18, (%esp)
	call	_printf
	.loc 1 325 0
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	L77
	.loc 1 325 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	$1, %eax
	jne	L78
	.loc 1 325 0 discriminator 3
	movl	$LC19, %eax
	jmp	L80
L78:
	.loc 1 325 0 discriminator 4
	movl	$LC20, %eax
	jmp	L80
L77:
	.loc 1 325 0 discriminator 2
	movl	$LC21, %eax
L80:
	.loc 1 325 0 discriminator 8
	movl	%eax, 4(%esp)
	movl	$LC22, (%esp)
	call	_printf
	.loc 1 326 0 is_stmt 1 discriminator 8
	movl	12(%ebp), %eax
	movzbl	20(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC23, (%esp)
	call	_printf
	.loc 1 327 0 discriminator 8
	movl	$LC24, (%esp)
	call	_printf
	.loc 1 328 0 discriminator 8
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC25, (%esp)
	call	_printf
	.loc 1 329 0 discriminator 8
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	leal	1(%eax), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC26, (%esp)
	call	_printf
	.loc 1 330 0 discriminator 8
	movl	12(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	je	L81
	.loc 1 330 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$1, %eax
	jne	L82
	.loc 1 330 0 discriminator 3
	movl	$LC27, %eax
	jmp	L84
L82:
	.loc 1 330 0 discriminator 4
	movl	$LC20, %eax
	jmp	L84
L81:
	.loc 1 330 0 discriminator 2
	movl	$LC28, %eax
L84:
	.loc 1 330 0 discriminator 8
	movl	%eax, 4(%esp)
	movl	$LC29, (%esp)
	call	_printf
	.loc 1 331 0 is_stmt 1 discriminator 8
	movl	$LC30, (%esp)
	call	_printf
	.loc 1 332 0 discriminator 8
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	testl	%eax, %eax
	je	L85
	.loc 1 332 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	cmpl	$1, %eax
	jne	L86
	.loc 1 332 0 discriminator 3
	movl	$LC31, %eax
	jmp	L88
L86:
	.loc 1 332 0 discriminator 4
	movl	$LC20, %eax
	jmp	L88
L85:
	.loc 1 332 0 discriminator 2
	movl	$LC32, %eax
L88:
	.loc 1 332 0 discriminator 8
	movl	12(%ebp), %edx
	movzbl	36(%edx), %edx
	movzbl	%dl, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	.loc 1 333 0 is_stmt 1 discriminator 8
	movl	$LC34, (%esp)
	call	_printf
	.loc 1 334 0 discriminator 8
	movl	12(%ebp), %eax
	movl	48(%eax), %eax
	testl	%eax, %eax
	jne	L89
	.loc 1 336 0
	movl	12(%ebp), %eax
	flds	56(%eax)
	fstpl	4(%esp)
	movl	$LC35, (%esp)
	call	_printf
	jmp	L90
L89:
	.loc 1 338 0
	movl	12(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$1, %eax
	jne	L91
	.loc 1 340 0
	movl	12(%ebp), %eax
	flds	56(%eax)
	fstpl	4(%esp)
	movl	$LC36, (%esp)
	call	_printf
	jmp	L90
L91:
	.loc 1 344 0
	movl	$LC37, (%esp)
	call	_puts
L90:
	.loc 1 346 0
	movl	$10, (%esp)
	call	_putchar
	jmp	L92
L76:
	.loc 1 350 0
	movl	$6, -12(%ebp)
L92:
	.loc 1 353 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 354 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
	.align 4
LC38:
	.ascii " * Errors at convolutional encoding level: %u out of %u bits (MD = %u)\12\12\0"
	.align 4
LC39:
	.ascii " * Errors at source level: %u out of %u bits (MD = %u)\12\12\0"
	.text
	.globl	_Debug_CheckWrongBits
	.def	_Debug_CheckWrongBits;	.scl	2;	.type	32;	.endef
_Debug_CheckWrongBits:
LFB24:
	.loc 1 368 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	.loc 1 369 0
	movl	$0, -12(%ebp)
	.loc 1 370 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 371 0
	movl	$0, -16(%ebp)
	.loc 1 372 0
	movl	-32(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 373 0
	movl	$0, -24(%ebp)
	.loc 1 378 0
	cmpl	$0, 8(%ebp)
	je	L95
	.loc 1 378 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L95
	.loc 1 378 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L95
	.loc 1 378 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L95
	.loc 1 378 0 discriminator 4
	cmpl	$0, 20(%ebp)
	je	L95
	.loc 1 380 0 is_stmt 1
	movl	20(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$1, %eax
	jne	L96
	.loc 1 380 0 is_stmt 0 discriminator 1
	movl	20(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$1, %eax
	jne	L96
	.loc 1 380 0 discriminator 2
	cmpl	$5, 16(%ebp)
	je	L110
L96:
	.loc 1 382 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L98
	.loc 1 384 0
	movl	$0, -28(%ebp)
	jmp	L99
L102:
	.loc 1 386 0
	movl	-28(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 387 0
	movl	-28(%ebp), %eax
	andl	$7, %eax
	movb	%al, -37(%ebp)
	.loc 1 388 0
	addl	$1, -24(%ebp)
	.loc 1 389 0
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
	.loc 1 390 0
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
	.loc 1 389 0
	xorl	%ebx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L100
	.loc 1 392 0
	addl	$1, -16(%ebp)
	.loc 1 393 0
	cmpl	$1, -16(%ebp)
	jbe	L101
	.loc 1 393 0 is_stmt 0 discriminator 1
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jnb	L101
	.loc 1 395 0 is_stmt 1
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
L101:
	.loc 1 397 0
	movl	$0, -24(%ebp)
L100:
	.loc 1 384 0 discriminator 2
	addl	$1, -28(%ebp)
L99:
	.loc 1 384 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L102
	.loc 1 400 0 is_stmt 1
	cmpl	$1, -16(%ebp)
	ja	L103
	.loc 1 402 0
	movl	$0, -20(%ebp)
L103:
	.loc 1 405 0
	movl	16(%ebp), %eax
	cmpl	$1, %eax
	jbe	L105
	subl	$4, %eax
	cmpl	$1, %eax
	ja	L104
	.loc 1 409 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC38, (%esp)
	call	_printf
	.loc 1 410 0
	jmp	L97
L105:
	.loc 1 414 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC39, (%esp)
	call	_printf
	.loc 1 415 0
	jmp	L97
L104:
	.loc 1 418 0
	movl	$2, -12(%ebp)
	.loc 1 419 0
	nop
	jmp	L97
L98:
	.loc 1 424 0
	movl	$6, -12(%ebp)
	.loc 1 380 0
	jmp	L110
L97:
	.loc 1 380 0 is_stmt 0 discriminator 1
	jmp	L110
L95:
	.loc 1 430 0 is_stmt 1
	movl	$1, -12(%ebp)
	jmp	L108
L110:
	.loc 1 380 0
	nop
L108:
	.loc 1 433 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 434 0
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.section .rdata,"dr"
LC40:
	.ascii "w\0"
LC41:
	.ascii "txOrgBytes.csv\0"
LC42:
	.ascii "rxOrgBytes.csv\0"
LC43:
	.ascii "txScrBytes.csv\0"
LC44:
	.ascii "rxScrBytes.csv\0"
LC45:
	.ascii "%u,\0"
LC46:
	.ascii "%u\0"
	.text
	.globl	_Debug_WriteByteStreamToCsv
	.def	_Debug_WriteByteStreamToCsv;	.scl	2;	.type	32;	.endef
_Debug_WriteByteStreamToCsv:
LFB25:
	.loc 1 446 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 447 0
	movl	$0, -12(%ebp)
	.loc 1 448 0
	movl	$0, -16(%ebp)
	.loc 1 451 0
	cmpl	$0, 8(%ebp)
	je	L112
	.loc 1 451 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L112
	.loc 1 453 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$1, %eax
	je	L114
	cmpl	$1, %eax
	jb	L115
	cmpl	$2, %eax
	je	L116
	cmpl	$3, %eax
	je	L117
	jmp	L125
L115:
	.loc 1 456 0
	movl	$LC40, 4(%esp)
	movl	$LC41, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 457 0
	jmp	L118
L114:
	.loc 1 460 0
	movl	$LC40, 4(%esp)
	movl	$LC42, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 461 0
	jmp	L118
L116:
	.loc 1 464 0
	movl	$LC40, 4(%esp)
	movl	$LC43, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 465 0
	jmp	L118
L117:
	.loc 1 468 0
	movl	$LC40, 4(%esp)
	movl	$LC44, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 469 0
	jmp	L118
L125:
	.loc 1 472 0
	movl	$2, -12(%ebp)
	.loc 1 473 0
	nop
L118:
	.loc 1 476 0
	cmpl	$0, -12(%ebp)
	jne	L126
	.loc 1 476 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L126
	.loc 1 478 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC45, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 479 0
	movl	$0, -20(%ebp)
	jmp	L120
L122:
	.loc 1 481 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$LC46, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 482 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L121
	.loc 1 484 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L121:
	.loc 1 479 0 discriminator 2
	addl	$1, -20(%ebp)
L120:
	.loc 1 479 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L122
	.loc 1 487 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	.loc 1 476 0
	jmp	L126
L112:
	.loc 1 492 0
	movl	$1, -12(%ebp)
	jmp	L123
L126:
	.loc 1 476 0
	nop
L123:
	.loc 1 495 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 496 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC47:
	.ascii "txModSymbs.csv\0"
LC48:
	.ascii "rxModSymbs.csv\0"
LC49:
	.ascii "%1.4f,%1.4f\0"
	.text
	.globl	_Debug_WriteComplexStreamToCsv
	.def	_Debug_WriteComplexStreamToCsv;	.scl	2;	.type	32;	.endef
_Debug_WriteComplexStreamToCsv:
LFB26:
	.loc 1 508 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 509 0
	movl	$0, -12(%ebp)
	.loc 1 510 0
	movl	$0, -16(%ebp)
	.loc 1 513 0
	cmpl	$0, 8(%ebp)
	je	L128
	.loc 1 513 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L128
	.loc 1 515 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$6, %eax
	je	L130
	cmpl	$7, %eax
	je	L131
	jmp	L139
L130:
	.loc 1 518 0
	movl	$LC40, 4(%esp)
	movl	$LC47, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 519 0
	jmp	L132
L131:
	.loc 1 522 0
	movl	$LC40, 4(%esp)
	movl	$LC48, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 523 0
	jmp	L132
L139:
	.loc 1 526 0
	movl	$2, -12(%ebp)
	.loc 1 527 0
	nop
L132:
	.loc 1 530 0
	cmpl	$0, -12(%ebp)
	jne	L140
	.loc 1 530 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L140
	.loc 1 532 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC45, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 533 0
	movl	$0, -20(%ebp)
	jmp	L134
L136:
	.loc 1 535 0
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
	movl	$LC49, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 536 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L135
	.loc 1 538 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L135:
	.loc 1 533 0 discriminator 2
	addl	$1, -20(%ebp)
L134:
	.loc 1 533 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L136
	.loc 1 541 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	.loc 1 530 0
	jmp	L140
L128:
	.loc 1 546 0
	movl	$1, -12(%ebp)
	jmp	L137
L140:
	.loc 1 530 0
	nop
L137:
	.loc 1 549 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 550 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_IsOrgLenValid;	.scl	3;	.type	32;	.endef
_IsOrgLenValid:
LFB27:
	.loc 1 566 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 567 0
	movb	$0, -1(%ebp)
	.loc 1 568 0
	movl	8(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -8(%ebp)
	.loc 1 569 0
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-8(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	addl	$1, %eax
	imull	%edx, %eax
	movl	%eax, -12(%ebp)
	.loc 1 571 0
	cmpl	$0, 8(%ebp)
	je	L142
	.loc 1 571 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-8(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	L142
	.loc 1 572 0 is_stmt 1 discriminator 2
	movl	-12(%ebp), %eax
	andl	$7, %eax
	.loc 1 571 0 discriminator 2
	testl	%eax, %eax
	jne	L142
	.loc 1 573 0
	movl	12(%ebp), %eax
	movzbl	37(%eax), %eax
	movzbl	%al, %ecx
	movl	-12(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 572 0
	testl	%eax, %eax
	jne	L142
	.loc 1 575 0
	movb	$1, -1(%ebp)
L142:
	.loc 1 578 0
	movzbl	-1(%ebp), %eax
	.loc 1 579 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
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
	.file 12 "src/scrambling.h"
	.file 13 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x1079
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
	.byte	0x36
	.long	0x362
	.uleb128 0x4
	.ascii "re\0"
	.byte	0x6
	.byte	0x38
	.long	0x362
	.byte	0
	.uleb128 0x4
	.ascii "im\0"
	.byte	0x6
	.byte	0x39
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
	.byte	0x3a
	.long	0x338
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x7
	.byte	0x1b
	.long	0x4b3
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
	.ascii "ERR_INV_SCRAMBLING_TYPE\0"
	.byte	0xc
	.uleb128 0xe
	.ascii "ERR_NUM\0"
	.byte	0xd
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x7
	.byte	0x2b
	.long	0x37c
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x8
	.byte	0x1d
	.long	0x50c
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
	.long	0x4c2
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x24
	.long	0x55d
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x26
	.long	0x55d
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
	.long	0x50c
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x180
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x8
	.byte	0x29
	.long	0x521
	.uleb128 0xa
	.long	0x563
	.uleb128 0x3
	.ascii "_float_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x2c
	.long	0x5ba
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x2e
	.long	0x5ba
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
	.long	0x50c
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x362
	.uleb128 0x6
	.ascii "float_stream_t\0"
	.byte	0x8
	.byte	0x31
	.long	0x57d
	.uleb128 0xa
	.long	0x5c0
	.uleb128 0x3
	.ascii "_complex_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x34
	.long	0x61a
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x36
	.long	0x61a
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
	.long	0x50c
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x36b
	.uleb128 0x6
	.ascii "complex_stream_t\0"
	.byte	0x8
	.byte	0x39
	.long	0x5db
	.uleb128 0xa
	.long	0x620
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x9
	.byte	0x1d
	.long	0x668
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
	.ascii "mod_type_t\0"
	.byte	0x9
	.byte	0x22
	.long	0x63d
	.uleb128 0x3
	.ascii "_mod_par_t\0"
	.byte	0xc
	.byte	0x9
	.byte	0x49
	.long	0x6c4
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x9
	.byte	0x4b
	.long	0x668
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
	.long	0x67a
	.uleb128 0xa
	.long	0x6c4
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xa
	.byte	0x1e
	.long	0x709
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
	.ascii "chan_type_t\0"
	.byte	0xa
	.byte	0x23
	.long	0x6da
	.uleb128 0xf
	.byte	0x4
	.byte	0xa
	.byte	0x2b
	.long	0x73c
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
	.long	0x77d
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
	.long	0x709
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0xa
	.byte	0x2a
	.long	0x180
	.byte	0x8
	.uleb128 0x11
	.long	0x71c
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "chan_par_t\0"
	.byte	0xa
	.byte	0x30
	.long	0x73c
	.uleb128 0xa
	.long	0x77d
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x45
	.long	0x7e2
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
	.long	0x794
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x58
	.long	0x864
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
	.byte	0x61
	.long	0x7f3
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x66
	.long	0x8b1
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
	.byte	0x6b
	.long	0x875
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0xb
	.byte	0x6e
	.long	0x914
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0xb
	.byte	0x70
	.long	0x7e2
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0xb
	.byte	0x71
	.long	0x864
	.byte	0x4
	.uleb128 0x4
	.ascii "memFact\0"
	.byte	0xb
	.byte	0x72
	.long	0x1ad
	.byte	0x8
	.uleb128 0x4
	.ascii "vitDM\0"
	.byte	0xb
	.byte	0x73
	.long	0x8b1
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0xb
	.byte	0x74
	.long	0x8c8
	.uleb128 0xa
	.long	0x914
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xc
	.byte	0x1d
	.long	0x95d
	.uleb128 0xe
	.ascii "SCRAMB_ADT\0"
	.byte	0
	.uleb128 0xe
	.ascii "SCRAMB_MLT\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "SCRAMB_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "scramb_type_t\0"
	.byte	0xc
	.byte	0x22
	.long	0x929
	.uleb128 0x3
	.ascii "_scramb_par_t\0"
	.byte	0x10
	.byte	0xc
	.byte	0x25
	.long	0x9c4
	.uleb128 0x4
	.ascii "type\0"
	.byte	0xc
	.byte	0x27
	.long	0x95d
	.byte	0
	.uleb128 0x4
	.ascii "nCells\0"
	.byte	0xc
	.byte	0x28
	.long	0x180
	.byte	0x4
	.uleb128 0x4
	.ascii "conVect\0"
	.byte	0xc
	.byte	0x29
	.long	0x1bd
	.byte	0x8
	.uleb128 0x4
	.ascii "initSt\0"
	.byte	0xc
	.byte	0x2a
	.long	0x1bd
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "scramb_par_t\0"
	.byte	0xc
	.byte	0x2b
	.long	0x972
	.uleb128 0xa
	.long	0x9c4
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xd
	.byte	0x2b
	.long	0xa6f
	.uleb128 0xe
	.ascii "PID_TX_ORG\0"
	.byte	0
	.uleb128 0xe
	.ascii "PID_RX_ORG\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "PID_TX_SCR\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "PID_RX_SCR\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "PID_TX_CNVCOD\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "PID_RX_CNVCOD\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "PID_TX_MAP\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "PID_RX_MAP\0"
	.byte	0x7
	.uleb128 0xe
	.ascii "PID_RX_LLR\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "PID_NUM\0"
	.byte	0x9
	.byte	0
	.uleb128 0x6
	.ascii "print_label_t\0"
	.byte	0xd
	.byte	0x37
	.long	0x9dd
	.uleb128 0x3
	.ascii "_debug_par_t\0"
	.byte	0x3c
	.byte	0xd
	.byte	0x3a
	.long	0xad6
	.uleb128 0x4
	.ascii "ccPar\0"
	.byte	0xd
	.byte	0x3c
	.long	0x914
	.byte	0
	.uleb128 0x4
	.ascii "scrPar\0"
	.byte	0xd
	.byte	0x3d
	.long	0x9c4
	.byte	0x10
	.uleb128 0x4
	.ascii "modPar\0"
	.byte	0xd
	.byte	0x3e
	.long	0x6c4
	.byte	0x20
	.uleb128 0x4
	.ascii "chanPar\0"
	.byte	0xd
	.byte	0x3f
	.long	0x77d
	.byte	0x2c
	.byte	0
	.uleb128 0x6
	.ascii "debug_par_t\0"
	.byte	0xd
	.byte	0x40
	.long	0xa84
	.uleb128 0xa
	.long	0xad6
	.uleb128 0x12
	.ascii "IsOrgLenValid\0"
	.byte	0x1
	.word	0x235
	.long	0xb74
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xb74
	.uleb128 0x13
	.ascii "orgLenBy\0"
	.byte	0x1
	.word	0x235
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.ascii "dbgParams\0"
	.byte	0x1
	.word	0x235
	.long	0xb7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.ascii "bRet\0"
	.byte	0x1
	.word	0x237
	.long	0xb74
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x14
	.ascii "orgLenBi\0"
	.byte	0x1
	.word	0x238
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.ascii "punLenBi\0"
	.byte	0x1
	.word	0x239
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x5
	.byte	0x4
	.long	0xae9
	.uleb128 0x15
	.ascii "Debug_WriteComplexStreamToCsv\0"
	.byte	0x1
	.word	0x1fb
	.long	0x4b3
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xc01
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x1fb
	.long	0xc01
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF1
	.byte	0x1
	.word	0x1fb
	.long	0xa6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x1fd
	.long	0x4b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "fid\0"
	.byte	0x1
	.word	0x1fe
	.long	0xc07
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x1ff
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x638
	.uleb128 0x5
	.byte	0x4
	.long	0x14e
	.uleb128 0x15
	.ascii "Debug_WriteByteStreamToCsv\0"
	.byte	0x1
	.word	0x1bd
	.long	0x4b3
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xc88
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x1bd
	.long	0xc88
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF1
	.byte	0x1
	.word	0x1bd
	.long	0xa6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x1bf
	.long	0x4b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "fid\0"
	.byte	0x1
	.word	0x1c0
	.long	0xc07
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x1c1
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x578
	.uleb128 0x15
	.ascii "Debug_CheckWrongBits\0"
	.byte	0x1
	.word	0x16f
	.long	0x4b3
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xd96
	.uleb128 0x13
	.ascii "inStreamA\0"
	.byte	0x1
	.word	0x16f
	.long	0xc88
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.ascii "inStreamB\0"
	.byte	0x1
	.word	0x16f
	.long	0xc88
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.secrel32	LASF1
	.byte	0x1
	.word	0x16f
	.long	0xa6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x16
	.secrel32	LASF3
	.byte	0x1
	.word	0x16f
	.long	0xb7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x171
	.long	0x4b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "bitLen\0"
	.byte	0x1
	.word	0x172
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.ascii "bitErrCnt\0"
	.byte	0x1
	.word	0x173
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.ascii "minErrDist\0"
	.byte	0x1
	.word	0x174
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.ascii "curErrDist\0"
	.byte	0x1
	.word	0x175
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x176
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.ascii "byteIdx\0"
	.byte	0x1
	.word	0x177
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.ascii "bitIdx\0"
	.byte	0x1
	.word	0x178
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.byte	0
	.uleb128 0x15
	.ascii "Debug_PrintParameters\0"
	.byte	0x1
	.word	0x13d
	.long	0x4b3
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xdf3
	.uleb128 0x13
	.ascii "orgLen\0"
	.byte	0x1
	.word	0x13d
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF3
	.byte	0x1
	.word	0x13d
	.long	0xb7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x13f
	.long	0x4b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.ascii "Debug_PrintComplexStream\0"
	.byte	0x1
	.byte	0xf9
	.long	0x4b3
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xe66
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0xf9
	.long	0xc01
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0xf9
	.long	0xa6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF3
	.byte	0x1
	.byte	0xf9
	.long	0xb7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0xfb
	.long	0x4b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0xfc
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.ascii "Debug_PrintFloatStream\0"
	.byte	0x1
	.byte	0xb7
	.long	0x4b3
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xed7
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0xb7
	.long	0xed7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0xb7
	.long	0xa6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF3
	.byte	0x1
	.byte	0xb7
	.long	0xb7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0xb9
	.long	0x4b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0xba
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5d6
	.uleb128 0x18
	.ascii "Debug_PrintByteStream\0"
	.byte	0x1
	.byte	0x6d
	.long	0x4b3
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xf4d
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0x6d
	.long	0xc88
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0x6d
	.long	0xa6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF3
	.byte	0x1
	.byte	0x6d
	.long	0xb7d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0x6f
	.long	0x4b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0x70
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.ascii "Debug_GenerateRandomBytes\0"
	.byte	0x1
	.byte	0x46
	.long	0x4b3
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xfba
	.uleb128 0x1c
	.ascii "ioStream\0"
	.byte	0x1
	.byte	0x46
	.long	0xfba
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.ascii "pSeed\0"
	.byte	0x1
	.byte	0x46
	.long	0xfc0
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0x48
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0x49
	.long	0x4b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x563
	.uleb128 0x5
	.byte	0x4
	.long	0x1cd
	.uleb128 0x18
	.ascii "Debug_ListParameters\0"
	.byte	0x1
	.byte	0x2a
	.long	0x4b3
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x105e
	.uleb128 0x1c
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x2a
	.long	0x105e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.ascii "ccParam\0"
	.byte	0x1
	.byte	0x2a
	.long	0x1064
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1c
	.ascii "modParam\0"
	.byte	0x1
	.byte	0x2a
	.long	0x106a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "chanParam\0"
	.byte	0x1
	.byte	0x2a
	.long	0x1070
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1c
	.ascii "scrParam\0"
	.byte	0x1
	.byte	0x2a
	.long	0x1076
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0x2c
	.long	0x4b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xad6
	.uleb128 0x5
	.byte	0x4
	.long	0x924
	.uleb128 0x5
	.byte	0x4
	.long	0x6d5
	.uleb128 0x5
	.byte	0x4
	.long	0x78f
	.uleb128 0x5
	.byte	0x4
	.long	0x9d8
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
	.uleb128 0x17
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
LASF0:
	.ascii "inStream\0"
LASF3:
	.ascii "pParams\0"
LASF1:
	.ascii "label\0"
LASF2:
	.ascii "retErr\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fputc;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
