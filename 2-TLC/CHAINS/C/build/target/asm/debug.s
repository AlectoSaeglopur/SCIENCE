	.file	"debug.c"
	.text
Ltext0:
	.globl	_Debug_ListParameters
	.def	_Debug_ListParameters;	.scl	2;	.type	32;	.endef
_Debug_ListParameters:
LFB18:
	.file 1 "src/debug.c"
	.loc 1 44 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 45 0
	movl	$0, -12(%ebp)
	.loc 1 47 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 47 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L2
	.loc 1 47 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L2
	.loc 1 47 0 discriminator 3
	cmpl	$0, 20(%ebp)
	je	L2
	.loc 1 47 0 discriminator 4
	cmpl	$0, 24(%ebp)
	je	L2
	.loc 1 48 0 is_stmt 1
	cmpl	$0, 28(%ebp)
	je	L2
	.loc 1 50 0
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
	.loc 1 51 0
	movl	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 16(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 20(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 24(%eax)
	movl	12(%edx), %edx
	movl	%edx, 28(%eax)
	.loc 1 52 0
	movl	8(%ebp), %eax
	movl	20(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 32(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 36(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	12(%edx), %edx
	movl	%edx, 44(%eax)
	.loc 1 53 0
	movl	8(%ebp), %eax
	movl	24(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 52(%eax)
	movl	8(%edx), %edx
	movl	%edx, 56(%eax)
	.loc 1 54 0
	movl	8(%ebp), %eax
	movl	28(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 60(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 64(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 68(%eax)
	movl	12(%edx), %edx
	movl	%edx, 72(%eax)
	jmp	L3
L2:
	.loc 1 58 0
	movl	$1, -12(%ebp)
L3:
	.loc 1 61 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 62 0
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
	.loc 1 74 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 76 0
	movl	$0, -16(%ebp)
	.loc 1 78 0
	cmpl	$0, 8(%ebp)
	je	L6
	.loc 1 78 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L6
	.loc 1 80 0 is_stmt 1
	cmpl	$0, 12(%ebp)
	jne	L7
	.loc 1 82 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	jmp	L8
L7:
	.loc 1 86 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_srand
L8:
	.loc 1 89 0
	movl	$0, -12(%ebp)
	jmp	L9
L10:
	.loc 1 91 0 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	call	_rand
	movb	%al, (%ebx)
	.loc 1 89 0 discriminator 3
	addl	$1, -12(%ebp)
L9:
	.loc 1 89 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	L10
	.loc 1 78 0 is_stmt 1
	jmp	L11
L6:
	.loc 1 96 0
	movl	$1, -16(%ebp)
L11:
	.loc 1 99 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 100 0
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
	.ascii " * TX CRC BYTES (%d)\12\11\0"
LC3:
	.ascii " * RX CRC BYTES (%d)\12\11\0"
LC4:
	.ascii " * TX SCRAMBLED BYTES (%d)\12\11\0"
LC5:
	.ascii " * RX SCRAMBLED BYTES (%d)\12\11\0"
	.align 4
LC6:
	.ascii " * TX CONVOLUTIONAL CODED BYTES (%d)\12\11\0"
	.align 4
LC7:
	.ascii " * RX CONVOLUTIONAL CODED BYTES (%d)\12\11\0"
LC8:
	.ascii "%2X \0"
LC9:
	.ascii "\12\11\0"
	.text
	.globl	_Debug_PrintByteStream
	.def	_Debug_PrintByteStream;	.scl	2;	.type	32;	.endef
_Debug_PrintByteStream:
LFB20:
	.loc 1 113 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 114 0
	movl	$0, -12(%ebp)
	.loc 1 117 0
	cmpl	$0, 8(%ebp)
	je	L14
	.loc 1 117 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L14
	.loc 1 117 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L14
	.loc 1 119 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	64(%eax), %eax
	cmpl	$1, %eax
	jne	L15
	.loc 1 119 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movl	44(%eax), %eax
	cmpl	$1, %eax
	jne	L15
	.loc 1 119 0 discriminator 2
	cmpl	$7, 12(%ebp)
	je	L34
L15:
	.loc 1 121 0 is_stmt 1
	cmpl	$7, 12(%ebp)
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
	.long	L25
	.long	L26
	.text
L18:
	.loc 1 124 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	.loc 1 125 0
	jmp	L27
L20:
	.loc 1 128 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	.loc 1 129 0
	jmp	L27
L21:
	.loc 1 132 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	.loc 1 133 0
	jmp	L27
L22:
	.loc 1 136 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	.loc 1 137 0
	jmp	L27
L23:
	.loc 1 140 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	.loc 1 141 0
	jmp	L27
L24:
	.loc 1 144 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	.loc 1 145 0
	jmp	L27
L25:
	.loc 1 148 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	.loc 1 149 0
	jmp	L27
L26:
	.loc 1 152 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	.loc 1 153 0
	jmp	L27
L17:
	.loc 1 156 0
	movl	$3, -12(%ebp)
	.loc 1 157 0
	nop
L27:
	.loc 1 160 0
	cmpl	$0, -12(%ebp)
	jne	L28
	.loc 1 162 0
	movl	$0, -16(%ebp)
	jmp	L29
L31:
	.loc 1 164 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	.loc 1 165 0
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
	jne	L30
	.loc 1 165 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L30
	.loc 1 167 0 is_stmt 1
	movl	$LC9, (%esp)
	call	_printf
L30:
	.loc 1 162 0 discriminator 2
	addl	$1, -16(%ebp)
L29:
	.loc 1 162 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L31
	.loc 1 170 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
L28:
	.loc 1 173 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 119 0
	jmp	L34
L14:
	.loc 1 178 0
	movl	$1, -12(%ebp)
	jmp	L32
L34:
	.loc 1 119 0
	nop
L32:
	.loc 1 181 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 182 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC10:
	.ascii " * RX LLRS (%d)\12\11\0"
LC12:
	.ascii "%1.3f \0"
LC13:
	.ascii "\12\0"
	.text
	.globl	_Debug_PrintFloatStream
	.def	_Debug_PrintFloatStream;	.scl	2;	.type	32;	.endef
_Debug_PrintFloatStream:
LFB21:
	.loc 1 195 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 196 0
	movl	$0, -12(%ebp)
	.loc 1 199 0
	cmpl	$0, 8(%ebp)
	je	L36
	.loc 1 199 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L36
	.loc 1 199 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L36
	.loc 1 202 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	64(%eax), %eax
	cmpl	$1, %eax
	jne	L55
	.loc 1 202 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movl	44(%eax), %eax
	cmpl	$1, %eax
	jne	L55
	.loc 1 204 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$10, %eax
	jne	L53
	.loc 1 207 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_printf
	.loc 1 208 0
	jmp	L40
L53:
	.loc 1 211 0
	movl	$3, -12(%ebp)
	.loc 1 212 0
	nop
L40:
	.loc 1 215 0
	cmpl	$0, -12(%ebp)
	jne	L41
	.loc 1 217 0
	movl	$0, -16(%ebp)
	jmp	L42
L48:
	.loc 1 219 0
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
	jbe	L54
	.loc 1 221 0
	movl	$43, (%esp)
	call	_putchar
	jmp	L45
L54:
	.loc 1 223 0
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
	jp	L56
	fldz
	fucompp
	fnstsw	%ax
	sahf
	jne	L45
	.loc 1 225 0
	movl	$32, (%esp)
	call	_putchar
	jmp	L45
L56:
	fstp	%st(0)
L45:
	.loc 1 228 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	.loc 1 230 0
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
	jne	L47
	.loc 1 230 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L47
	.loc 1 232 0 is_stmt 1
	movl	$LC9, (%esp)
	call	_printf
L47:
	.loc 1 217 0 discriminator 2
	addl	$1, -16(%ebp)
L42:
	.loc 1 217 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L48
	.loc 1 236 0 is_stmt 1
	movl	$LC13, (%esp)
	call	_puts
L41:
	.loc 1 239 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 202 0
	jmp	L55
L36:
	.loc 1 244 0
	movl	$1, -12(%ebp)
	jmp	L49
L55:
	.loc 1 202 0
	nop
L49:
	.loc 1 247 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 248 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC15:
	.ascii " * TX MAPPED SYMBOLS (%d)\12\11\0"
LC16:
	.ascii " * RX MAPPED SYMBOLS (%d)\12\11\0"
LC17:
	.ascii "%1.2f\0"
LC18:
	.ascii "%1.2fi | \0"
	.text
	.globl	_Debug_PrintComplexStream
	.def	_Debug_PrintComplexStream;	.scl	2;	.type	32;	.endef
_Debug_PrintComplexStream:
LFB22:
	.loc 1 261 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 262 0
	movl	$0, -12(%ebp)
	.loc 1 265 0
	cmpl	$0, 8(%ebp)
	je	L58
	.loc 1 265 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L58
	.loc 1 265 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L58
	.loc 1 267 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	64(%eax), %eax
	cmpl	$1, %eax
	jne	L72
	.loc 1 269 0
	movl	12(%ebp), %eax
	cmpl	$8, %eax
	je	L61
	cmpl	$9, %eax
	je	L62
	jmp	L76
L61:
	.loc 1 272 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_printf
	.loc 1 273 0
	jmp	L63
L62:
	.loc 1 276 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_printf
	.loc 1 277 0
	jmp	L63
L76:
	.loc 1 280 0
	movl	$3, -12(%ebp)
	.loc 1 281 0
	nop
L63:
	.loc 1 284 0
	cmpl	$0, -12(%ebp)
	jne	L64
	.loc 1 286 0
	movl	$0, -16(%ebp)
	jmp	L65
L71:
	.loc 1 288 0
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
	jb	L66
	.loc 1 290 0
	movl	$43, (%esp)
	call	_putchar
L66:
	.loc 1 292 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	.loc 1 294 0
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
	jb	L68
	.loc 1 296 0
	movl	$43, (%esp)
	call	_putchar
L68:
	.loc 1 298 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	fstpl	4(%esp)
	movl	$LC18, (%esp)
	call	_printf
	.loc 1 300 0
	movl	-16(%ebp), %eax
	andl	$7, %eax
	cmpl	$7, %eax
	jne	L70
	.loc 1 300 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L70
	.loc 1 302 0 is_stmt 1
	movl	$LC9, (%esp)
	call	_printf
L70:
	.loc 1 286 0 discriminator 2
	addl	$1, -16(%ebp)
L65:
	.loc 1 286 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L71
	.loc 1 305 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
L64:
	.loc 1 308 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 267 0
	jmp	L72
L58:
	.loc 1 313 0
	movl	$1, -12(%ebp)
L72:
	.loc 1 316 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 317 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC19:
	.ascii "\12 # PARAMETERS\0"
LC20:
	.ascii "    * Scrambling :\0"
LC21:
	.ascii "Multiplicative\0"
LC22:
	.ascii "N/A\0"
LC23:
	.ascii "Additive\0"
LC24:
	.ascii "%s\0"
LC25:
	.ascii " | Ncells = %u\12\0"
LC26:
	.ascii "    * Convolutional Coding :\0"
LC27:
	.ascii " K = %d\0"
LC28:
	.ascii " | Rc = %d/%d\0"
LC29:
	.ascii "Soft\0"
LC30:
	.ascii "Hard\0"
LC31:
	.ascii " | DM = %s\12\0"
LC32:
	.ascii "    * Modulation :\0"
LC33:
	.ascii "QAM\0"
LC34:
	.ascii "PSK\0"
LC35:
	.ascii " %u-%s\12\0"
LC36:
	.ascii "    * Channel :\0"
LC37:
	.ascii " BSC | Peb = %1.1e\12\0"
LC38:
	.ascii " AWGN | EbN0 = %1.1f\12\0"
LC39:
	.ascii " N/A\0"
	.text
	.globl	_Debug_PrintParameters
	.def	_Debug_PrintParameters;	.scl	2;	.type	32;	.endef
_Debug_PrintParameters:
LFB23:
	.loc 1 329 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 330 0
	movl	$0, -12(%ebp)
	.loc 1 332 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IsOrgLenValid
	testb	%al, %al
	je	L78
	.loc 1 334 0
	movl	$LC19, (%esp)
	call	_puts
	.loc 1 335 0
	movl	$LC20, (%esp)
	call	_printf
	.loc 1 336 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L79
	.loc 1 336 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L80
	.loc 1 336 0 discriminator 3
	movl	$LC21, %eax
	jmp	L82
L80:
	.loc 1 336 0 discriminator 4
	movl	$LC22, %eax
	jmp	L82
L79:
	.loc 1 336 0 discriminator 2
	movl	$LC23, %eax
L82:
	.loc 1 336 0 discriminator 8
	movl	%eax, 4(%esp)
	movl	$LC24, (%esp)
	call	_printf
	.loc 1 337 0 is_stmt 1 discriminator 8
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC25, (%esp)
	call	_printf
	.loc 1 338 0 discriminator 8
	movl	$LC26, (%esp)
	call	_printf
	.loc 1 339 0 discriminator 8
	movl	12(%ebp), %eax
	movl	36(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC27, (%esp)
	call	_printf
	.loc 1 340 0 discriminator 8
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	leal	1(%eax), %edx
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC28, (%esp)
	call	_printf
	.loc 1 341 0 discriminator 8
	movl	12(%ebp), %eax
	movl	44(%eax), %eax
	testl	%eax, %eax
	je	L83
	.loc 1 341 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	44(%eax), %eax
	cmpl	$1, %eax
	jne	L84
	.loc 1 341 0 discriminator 3
	movl	$LC29, %eax
	jmp	L86
L84:
	.loc 1 341 0 discriminator 4
	movl	$LC22, %eax
	jmp	L86
L83:
	.loc 1 341 0 discriminator 2
	movl	$LC30, %eax
L86:
	.loc 1 341 0 discriminator 8
	movl	%eax, 4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	.loc 1 342 0 is_stmt 1 discriminator 8
	movl	$LC32, (%esp)
	call	_printf
	.loc 1 343 0 discriminator 8
	movl	12(%ebp), %eax
	movl	48(%eax), %eax
	testl	%eax, %eax
	je	L87
	.loc 1 343 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$1, %eax
	jne	L88
	.loc 1 343 0 discriminator 3
	movl	$LC33, %eax
	jmp	L90
L88:
	.loc 1 343 0 discriminator 4
	movl	$LC22, %eax
	jmp	L90
L87:
	.loc 1 343 0 discriminator 2
	movl	$LC34, %eax
L90:
	.loc 1 343 0 discriminator 8
	movl	12(%ebp), %edx
	movzbl	52(%edx), %edx
	movzbl	%dl, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC35, (%esp)
	call	_printf
	.loc 1 344 0 is_stmt 1 discriminator 8
	movl	$LC36, (%esp)
	call	_printf
	.loc 1 345 0 discriminator 8
	movl	12(%ebp), %eax
	movl	64(%eax), %eax
	testl	%eax, %eax
	jne	L91
	.loc 1 347 0
	movl	12(%ebp), %eax
	flds	72(%eax)
	fstpl	4(%esp)
	movl	$LC37, (%esp)
	call	_printf
	jmp	L92
L91:
	.loc 1 349 0
	movl	12(%ebp), %eax
	movl	64(%eax), %eax
	cmpl	$1, %eax
	jne	L93
	.loc 1 351 0
	movl	12(%ebp), %eax
	flds	72(%eax)
	fstpl	4(%esp)
	movl	$LC38, (%esp)
	call	_printf
	jmp	L92
L93:
	.loc 1 355 0
	movl	$LC39, (%esp)
	call	_puts
L92:
	.loc 1 357 0
	movl	$10, (%esp)
	call	_putchar
	jmp	L94
L78:
	.loc 1 361 0
	movl	$2, -12(%ebp)
L94:
	.loc 1 364 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 365 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
	.align 4
LC40:
	.ascii " * Errors at convolutional encoding level: %u out of %u bits (MD = %u)\12\12\0"
	.align 4
LC41:
	.ascii " * Errors at source level: %u out of %u bits (MD = %u)\12\12\0"
LC42:
	.ascii "FAILED\0"
LC43:
	.ascii "PASSED\0"
LC44:
	.ascii " * CRC check: %s\12\12\0"
	.text
	.globl	_Debug_CheckWrongBits
	.def	_Debug_CheckWrongBits;	.scl	2;	.type	32;	.endef
_Debug_CheckWrongBits:
LFB24:
	.loc 1 379 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	.loc 1 380 0
	movl	$0, -12(%ebp)
	.loc 1 381 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 382 0
	movl	$0, -16(%ebp)
	.loc 1 383 0
	movl	-32(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 384 0
	movl	$0, -24(%ebp)
	.loc 1 389 0
	cmpl	$0, 8(%ebp)
	je	L97
	.loc 1 389 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L97
	.loc 1 389 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L97
	.loc 1 389 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L97
	.loc 1 389 0 discriminator 4
	cmpl	$0, 20(%ebp)
	je	L97
	.loc 1 391 0 is_stmt 1
	movl	20(%ebp), %eax
	movl	64(%eax), %eax
	cmpl	$1, %eax
	jne	L98
	.loc 1 391 0 is_stmt 0 discriminator 1
	movl	20(%ebp), %eax
	movl	44(%eax), %eax
	cmpl	$1, %eax
	jne	L98
	.loc 1 391 0 discriminator 2
	cmpl	$7, 16(%ebp)
	je	L116
L98:
	.loc 1 393 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L100
	.loc 1 395 0
	movl	$0, -28(%ebp)
	jmp	L101
L104:
	.loc 1 397 0
	movl	-28(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 398 0
	movl	-28(%ebp), %eax
	andl	$7, %eax
	movb	%al, -37(%ebp)
	.loc 1 399 0
	addl	$1, -24(%ebp)
	.loc 1 400 0
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
	.loc 1 401 0
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
	.loc 1 400 0
	xorl	%ebx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L102
	.loc 1 403 0
	addl	$1, -16(%ebp)
	.loc 1 404 0
	cmpl	$1, -16(%ebp)
	jbe	L103
	.loc 1 404 0 is_stmt 0 discriminator 1
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jnb	L103
	.loc 1 406 0 is_stmt 1
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
L103:
	.loc 1 408 0
	movl	$0, -24(%ebp)
L102:
	.loc 1 395 0 discriminator 2
	addl	$1, -28(%ebp)
L101:
	.loc 1 395 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L104
	.loc 1 411 0 is_stmt 1
	cmpl	$1, -16(%ebp)
	ja	L105
	.loc 1 413 0
	movl	$0, -20(%ebp)
L105:
	.loc 1 416 0
	movl	16(%ebp), %eax
	cmpl	$3, %eax
	je	L107
	cmpl	$7, %eax
	je	L108
	cmpl	$1, %eax
	je	L109
	jmp	L115
L108:
	.loc 1 419 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC40, (%esp)
	call	_printf
	.loc 1 420 0
	jmp	L99
L109:
	.loc 1 423 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC41, (%esp)
	call	_printf
	.loc 1 424 0
	jmp	L99
L107:
	.loc 1 427 0
	cmpl	$0, -16(%ebp)
	je	L111
	.loc 1 427 0 is_stmt 0 discriminator 1
	movl	$LC42, %eax
	jmp	L112
L111:
	.loc 1 427 0 discriminator 2
	movl	$LC43, %eax
L112:
	.loc 1 427 0 discriminator 4
	movl	%eax, 4(%esp)
	movl	$LC44, (%esp)
	call	_printf
	.loc 1 428 0 is_stmt 1 discriminator 4
	jmp	L99
L115:
	.loc 1 431 0
	movl	$3, -12(%ebp)
	.loc 1 432 0
	nop
	jmp	L99
L100:
	.loc 1 437 0
	movl	$7, -12(%ebp)
	.loc 1 391 0
	jmp	L116
L99:
	.loc 1 391 0 is_stmt 0 discriminator 1
	jmp	L116
L97:
	.loc 1 443 0 is_stmt 1
	movl	$1, -12(%ebp)
	jmp	L113
L116:
	.loc 1 391 0
	nop
L113:
	.loc 1 446 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 447 0
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
LC45:
	.ascii "w\0"
LC46:
	.ascii "txOrgBytes.csv\0"
LC47:
	.ascii "rxOrgBytes.csv\0"
LC48:
	.ascii "txScrBytes.csv\0"
LC49:
	.ascii "rxScrBytes.csv\0"
LC50:
	.ascii "%u,\0"
LC51:
	.ascii "%u\0"
	.text
	.globl	_Debug_WriteByteStreamToCsv
	.def	_Debug_WriteByteStreamToCsv;	.scl	2;	.type	32;	.endef
_Debug_WriteByteStreamToCsv:
LFB25:
	.loc 1 459 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 460 0
	movl	$0, -12(%ebp)
	.loc 1 461 0
	movl	$0, -16(%ebp)
	.loc 1 464 0
	cmpl	$0, 8(%ebp)
	je	L118
	.loc 1 464 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L118
	.loc 1 466 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$1, %eax
	je	L120
	cmpl	$1, %eax
	jb	L121
	cmpl	$4, %eax
	je	L122
	cmpl	$5, %eax
	je	L123
	jmp	L131
L121:
	.loc 1 469 0
	movl	$LC45, 4(%esp)
	movl	$LC46, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 470 0
	jmp	L124
L120:
	.loc 1 473 0
	movl	$LC45, 4(%esp)
	movl	$LC47, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 474 0
	jmp	L124
L122:
	.loc 1 477 0
	movl	$LC45, 4(%esp)
	movl	$LC48, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 478 0
	jmp	L124
L123:
	.loc 1 481 0
	movl	$LC45, 4(%esp)
	movl	$LC49, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 482 0
	jmp	L124
L131:
	.loc 1 485 0
	movl	$3, -12(%ebp)
	.loc 1 486 0
	nop
L124:
	.loc 1 489 0
	cmpl	$0, -12(%ebp)
	jne	L132
	.loc 1 489 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L132
	.loc 1 491 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC50, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 492 0
	movl	$0, -20(%ebp)
	jmp	L126
L128:
	.loc 1 494 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$LC51, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 495 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L127
	.loc 1 497 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L127:
	.loc 1 492 0 discriminator 2
	addl	$1, -20(%ebp)
L126:
	.loc 1 492 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L128
	.loc 1 500 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	.loc 1 489 0
	jmp	L132
L118:
	.loc 1 505 0
	movl	$1, -12(%ebp)
	jmp	L129
L132:
	.loc 1 489 0
	nop
L129:
	.loc 1 508 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 509 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC52:
	.ascii "txModSymbs.csv\0"
LC53:
	.ascii "rxModSymbs.csv\0"
LC54:
	.ascii "%1.4f,%1.4f\0"
	.text
	.globl	_Debug_WriteComplexStreamToCsv
	.def	_Debug_WriteComplexStreamToCsv;	.scl	2;	.type	32;	.endef
_Debug_WriteComplexStreamToCsv:
LFB26:
	.loc 1 521 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 522 0
	movl	$0, -12(%ebp)
	.loc 1 523 0
	movl	$0, -16(%ebp)
	.loc 1 526 0
	cmpl	$0, 8(%ebp)
	je	L134
	.loc 1 526 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L134
	.loc 1 528 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$8, %eax
	je	L136
	cmpl	$9, %eax
	je	L137
	jmp	L145
L136:
	.loc 1 531 0
	movl	$LC45, 4(%esp)
	movl	$LC52, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 532 0
	jmp	L138
L137:
	.loc 1 535 0
	movl	$LC45, 4(%esp)
	movl	$LC53, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 536 0
	jmp	L138
L145:
	.loc 1 539 0
	movl	$3, -12(%ebp)
	.loc 1 540 0
	nop
L138:
	.loc 1 543 0
	cmpl	$0, -12(%ebp)
	jne	L146
	.loc 1 543 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L146
	.loc 1 545 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC50, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 546 0
	movl	$0, -20(%ebp)
	jmp	L140
L142:
	.loc 1 548 0
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
	movl	$LC54, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 549 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L141
	.loc 1 551 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L141:
	.loc 1 546 0 discriminator 2
	addl	$1, -20(%ebp)
L140:
	.loc 1 546 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L142
	.loc 1 554 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	.loc 1 543 0
	jmp	L146
L134:
	.loc 1 559 0
	movl	$1, -12(%ebp)
	jmp	L143
L146:
	.loc 1 543 0
	nop
L143:
	.loc 1 562 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 563 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_IsOrgLenValid;	.scl	3;	.type	32;	.endef
_IsOrgLenValid:
LFB27:
	.loc 1 579 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 580 0
	movb	$0, -1(%ebp)
	.loc 1 581 0
	movl	8(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -8(%ebp)
	.loc 1 582 0
	movl	12(%ebp), %eax
	movl	32(%eax), %ecx
	movl	-8(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	addl	$1, %eax
	imull	%edx, %eax
	movl	%eax, -12(%ebp)
	.loc 1 584 0
	cmpl	$0, 8(%ebp)
	je	L148
	.loc 1 584 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	32(%eax), %ecx
	movl	-8(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	L148
	.loc 1 585 0 is_stmt 1 discriminator 2
	movl	-12(%ebp), %eax
	andl	$7, %eax
	.loc 1 584 0 discriminator 2
	testl	%eax, %eax
	jne	L148
	.loc 1 586 0
	movl	12(%ebp), %eax
	movzbl	53(%eax), %eax
	movzbl	%al, %ecx
	movl	-12(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 585 0
	testl	%eax, %eax
	jne	L148
	.loc 1 588 0
	movb	$1, -1(%ebp)
L148:
	.loc 1 591 0
	movzbl	-1(%ebp), %eax
	.loc 1 592 0
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
	.file 12 "src/reed_solomon.h"
	.file 13 "src/scrambling.h"
	.file 14 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x11bd
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
	.byte	0x38
	.long	0x362
	.uleb128 0x4
	.ascii "re\0"
	.byte	0x6
	.byte	0x3a
	.long	0x362
	.byte	0
	.uleb128 0x4
	.ascii "im\0"
	.byte	0x6
	.byte	0x3b
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
	.byte	0x3c
	.long	0x338
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x7
	.byte	0x1b
	.long	0x4f2
	.uleb128 0xe
	.ascii "ERR_NONE\0"
	.byte	0
	.uleb128 0xe
	.ascii "ERR_INV_NULL_POINTER\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "ERR_INV_ORIG_LEN\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "ERR_INV_PRINTID\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "ERR_INV_CNVCOD_RATE\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "ERR_INV_CNVCOD_KLEN\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "ERR_INV_CNVCOD_DECMET\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "ERR_INV_BUFFER_SIZE\0"
	.byte	0x7
	.uleb128 0xe
	.ascii "ERR_INV_DYNAMIC_ALLOC\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "ERR_INV_STREAM_TYPE\0"
	.byte	0x9
	.uleb128 0xe
	.ascii "ERR_INV_MODULATION_TYPE\0"
	.byte	0xa
	.uleb128 0xe
	.ascii "ERR_INV_MODULATION_BPS\0"
	.byte	0xb
	.uleb128 0xe
	.ascii "ERR_INV_CHANNEL_TYPE\0"
	.byte	0xc
	.uleb128 0xe
	.ascii "ERR_INV_SCRAMBLING_TYPE\0"
	.byte	0xd
	.uleb128 0xe
	.ascii "ERR_INV_CRC_DEGREE\0"
	.byte	0xe
	.uleb128 0xe
	.ascii "ERR_INV_RS_GF_DEGREE\0"
	.byte	0xf
	.uleb128 0xe
	.ascii "ERR_NUM\0"
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x7
	.byte	0x2e
	.long	0x37c
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x8
	.byte	0x1d
	.long	0x54b
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
	.long	0x501
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x24
	.long	0x59c
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x26
	.long	0x59c
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
	.long	0x54b
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x180
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x8
	.byte	0x29
	.long	0x560
	.uleb128 0xa
	.long	0x5a2
	.uleb128 0x3
	.ascii "_float_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x2c
	.long	0x5f9
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x2e
	.long	0x5f9
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
	.long	0x54b
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x362
	.uleb128 0x6
	.ascii "float_stream_t\0"
	.byte	0x8
	.byte	0x31
	.long	0x5bc
	.uleb128 0xa
	.long	0x5ff
	.uleb128 0x3
	.ascii "_complex_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x34
	.long	0x659
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x36
	.long	0x659
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
	.long	0x54b
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x36b
	.uleb128 0x6
	.ascii "complex_stream_t\0"
	.byte	0x8
	.byte	0x39
	.long	0x61a
	.uleb128 0xa
	.long	0x65f
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x9
	.byte	0x1d
	.long	0x6a7
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
	.long	0x67c
	.uleb128 0x3
	.ascii "_mod_par_t\0"
	.byte	0xc
	.byte	0x9
	.byte	0x49
	.long	0x703
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x9
	.byte	0x4b
	.long	0x6a7
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
	.long	0x6b9
	.uleb128 0xa
	.long	0x703
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xa
	.byte	0x1e
	.long	0x748
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
	.long	0x719
	.uleb128 0xf
	.byte	0x4
	.byte	0xa
	.byte	0x2b
	.long	0x77b
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
	.long	0x7bc
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
	.long	0x748
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0xa
	.byte	0x2a
	.long	0x180
	.byte	0x8
	.uleb128 0x11
	.long	0x75b
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "chan_par_t\0"
	.byte	0xa
	.byte	0x30
	.long	0x77b
	.uleb128 0xa
	.long	0x7bc
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x3d
	.long	0x821
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
	.byte	0x3f
	.long	0x7d3
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x50
	.long	0x8a3
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
	.byte	0x59
	.long	0x832
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x5e
	.long	0x8f0
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
	.byte	0x63
	.long	0x8b4
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0xb
	.byte	0x66
	.long	0x953
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0xb
	.byte	0x68
	.long	0x821
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0xb
	.byte	0x69
	.long	0x8a3
	.byte	0x4
	.uleb128 0x4
	.ascii "memFact\0"
	.byte	0xb
	.byte	0x6a
	.long	0x1ad
	.byte	0x8
	.uleb128 0x4
	.ascii "vitDM\0"
	.byte	0xb
	.byte	0x6b
	.long	0x8f0
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0xb
	.byte	0x6c
	.long	0x907
	.uleb128 0xa
	.long	0x953
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xc
	.byte	0x1d
	.long	0x997
	.uleb128 0xe
	.ascii "RS_GF_DEGREE_4\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "RS_GF_DEGREE_8\0"
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "rs_gf_degree_t\0"
	.byte	0xc
	.byte	0x20
	.long	0x968
	.uleb128 0x3
	.ascii "_rs_par_t\0"
	.byte	0x10
	.byte	0xc
	.byte	0x32
	.long	0xa12
	.uleb128 0x4
	.ascii "m\0"
	.byte	0xc
	.byte	0x34
	.long	0x997
	.byte	0
	.uleb128 0x4
	.ascii "kSh\0"
	.byte	0xc
	.byte	0x35
	.long	0x180
	.byte	0x4
	.uleb128 0x4
	.ascii "nSh\0"
	.byte	0xc
	.byte	0x36
	.long	0x180
	.byte	0x5
	.uleb128 0x4
	.ascii "t\0"
	.byte	0xc
	.byte	0x37
	.long	0x180
	.byte	0x6
	.uleb128 0x4
	.ascii "kUn\0"
	.byte	0xc
	.byte	0x38
	.long	0x1ad
	.byte	0x8
	.uleb128 0x4
	.ascii "nUn\0"
	.byte	0xc
	.byte	0x39
	.long	0x1ad
	.byte	0xa
	.uleb128 0x4
	.ascii "dimGF\0"
	.byte	0xc
	.byte	0x3a
	.long	0x1ad
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "rs_par_t\0"
	.byte	0xc
	.byte	0x3b
	.long	0x9ad
	.uleb128 0xa
	.long	0xa12
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xd
	.byte	0x1d
	.long	0xa5b
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
	.byte	0xd
	.byte	0x22
	.long	0xa27
	.uleb128 0x3
	.ascii "_scramb_par_t\0"
	.byte	0x10
	.byte	0xd
	.byte	0x25
	.long	0xac2
	.uleb128 0x4
	.ascii "type\0"
	.byte	0xd
	.byte	0x27
	.long	0xa5b
	.byte	0
	.uleb128 0x4
	.ascii "nCells\0"
	.byte	0xd
	.byte	0x28
	.long	0x180
	.byte	0x4
	.uleb128 0x4
	.ascii "conVect\0"
	.byte	0xd
	.byte	0x29
	.long	0x1bd
	.byte	0x8
	.uleb128 0x4
	.ascii "initSt\0"
	.byte	0xd
	.byte	0x2a
	.long	0x1bd
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "scramb_par_t\0"
	.byte	0xd
	.byte	0x2b
	.long	0xa70
	.uleb128 0xa
	.long	0xac2
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xe
	.byte	0x2c
	.long	0xb87
	.uleb128 0xe
	.ascii "PID_TX_ORG\0"
	.byte	0
	.uleb128 0xe
	.ascii "PID_RX_ORG\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "PID_TX_CRC\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "PID_RX_CRC\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "PID_TX_SCR\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "PID_RX_SCR\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "PID_TX_CNVCOD\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "PID_RX_CNVCOD\0"
	.byte	0x7
	.uleb128 0xe
	.ascii "PID_TX_MAP\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "PID_RX_MAP\0"
	.byte	0x9
	.uleb128 0xe
	.ascii "PID_RX_LLR\0"
	.byte	0xa
	.uleb128 0xe
	.ascii "PID_NUM\0"
	.byte	0xb
	.byte	0
	.uleb128 0x6
	.ascii "print_label_t\0"
	.byte	0xe
	.byte	0x3a
	.long	0xadb
	.uleb128 0x3
	.ascii "_debug_par_t\0"
	.byte	0x4c
	.byte	0xe
	.byte	0x3d
	.long	0xbfc
	.uleb128 0x4
	.ascii "scrPar\0"
	.byte	0xe
	.byte	0x3f
	.long	0xac2
	.byte	0
	.uleb128 0x4
	.ascii "rsPar\0"
	.byte	0xe
	.byte	0x40
	.long	0xa12
	.byte	0x10
	.uleb128 0x4
	.ascii "ccPar\0"
	.byte	0xe
	.byte	0x41
	.long	0x953
	.byte	0x20
	.uleb128 0x4
	.ascii "modPar\0"
	.byte	0xe
	.byte	0x42
	.long	0x703
	.byte	0x30
	.uleb128 0x4
	.ascii "chanPar\0"
	.byte	0xe
	.byte	0x43
	.long	0x7bc
	.byte	0x3c
	.byte	0
	.uleb128 0x6
	.ascii "debug_par_t\0"
	.byte	0xe
	.byte	0x44
	.long	0xb9c
	.uleb128 0xa
	.long	0xbfc
	.uleb128 0x12
	.ascii "IsOrgLenValid\0"
	.byte	0x1
	.word	0x242
	.long	0xc9a
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xc9a
	.uleb128 0x13
	.ascii "orgLenBy\0"
	.byte	0x1
	.word	0x242
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.ascii "dbgParams\0"
	.byte	0x1
	.word	0x242
	.long	0xca3
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.ascii "bRet\0"
	.byte	0x1
	.word	0x244
	.long	0xc9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x14
	.ascii "orgLenBi\0"
	.byte	0x1
	.word	0x245
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.ascii "punLenBi\0"
	.byte	0x1
	.word	0x246
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
	.long	0xc0f
	.uleb128 0x15
	.ascii "Debug_WriteComplexStreamToCsv\0"
	.byte	0x1
	.word	0x208
	.long	0x4f2
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xd27
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x208
	.long	0xd27
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF1
	.byte	0x1
	.word	0x208
	.long	0xb87
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x20a
	.long	0x4f2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "fid\0"
	.byte	0x1
	.word	0x20b
	.long	0xd2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x20c
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x677
	.uleb128 0x5
	.byte	0x4
	.long	0x14e
	.uleb128 0x15
	.ascii "Debug_WriteByteStreamToCsv\0"
	.byte	0x1
	.word	0x1ca
	.long	0x4f2
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xdae
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x1ca
	.long	0xdae
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF1
	.byte	0x1
	.word	0x1ca
	.long	0xb87
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x1cc
	.long	0x4f2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "fid\0"
	.byte	0x1
	.word	0x1cd
	.long	0xd2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x1ce
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5b7
	.uleb128 0x15
	.ascii "Debug_CheckWrongBits\0"
	.byte	0x1
	.word	0x17a
	.long	0x4f2
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xebc
	.uleb128 0x13
	.ascii "inStreamA\0"
	.byte	0x1
	.word	0x17a
	.long	0xdae
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.ascii "inStreamB\0"
	.byte	0x1
	.word	0x17a
	.long	0xdae
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.secrel32	LASF1
	.byte	0x1
	.word	0x17a
	.long	0xb87
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x16
	.secrel32	LASF3
	.byte	0x1
	.word	0x17a
	.long	0xca3
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x17c
	.long	0x4f2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "bitLen\0"
	.byte	0x1
	.word	0x17d
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.ascii "bitErrCnt\0"
	.byte	0x1
	.word	0x17e
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.ascii "minErrDist\0"
	.byte	0x1
	.word	0x17f
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.ascii "curErrDist\0"
	.byte	0x1
	.word	0x180
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x181
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.ascii "byteIdx\0"
	.byte	0x1
	.word	0x182
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.ascii "bitIdx\0"
	.byte	0x1
	.word	0x183
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.byte	0
	.uleb128 0x15
	.ascii "Debug_PrintParameters\0"
	.byte	0x1
	.word	0x148
	.long	0x4f2
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xf19
	.uleb128 0x13
	.ascii "orgLen\0"
	.byte	0x1
	.word	0x148
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF3
	.byte	0x1
	.word	0x148
	.long	0xca3
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x14a
	.long	0x4f2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.ascii "Debug_PrintComplexStream\0"
	.byte	0x1
	.word	0x104
	.long	0x4f2
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xf92
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x104
	.long	0xd27
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF1
	.byte	0x1
	.word	0x104
	.long	0xb87
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.secrel32	LASF3
	.byte	0x1
	.word	0x104
	.long	0xca3
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x106
	.long	0x4f2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x107
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.ascii "Debug_PrintFloatStream\0"
	.byte	0x1
	.byte	0xc2
	.long	0x4f2
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x1003
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0xc2
	.long	0x1003
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0xc2
	.long	0xb87
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF3
	.byte	0x1
	.byte	0xc2
	.long	0xca3
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0xc4
	.long	0x4f2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0xc5
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x615
	.uleb128 0x18
	.ascii "Debug_PrintByteStream\0"
	.byte	0x1
	.byte	0x70
	.long	0x4f2
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x1079
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0x70
	.long	0xdae
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0x70
	.long	0xb87
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF3
	.byte	0x1
	.byte	0x70
	.long	0xca3
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0x72
	.long	0x4f2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0x73
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.ascii "Debug_GenerateRandomBytes\0"
	.byte	0x1
	.byte	0x49
	.long	0x4f2
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x10e6
	.uleb128 0x1c
	.ascii "ioStream\0"
	.byte	0x1
	.byte	0x49
	.long	0x10e6
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.ascii "pSeed\0"
	.byte	0x1
	.byte	0x49
	.long	0x10ec
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0x4b
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0x4c
	.long	0x4f2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5a2
	.uleb128 0x5
	.byte	0x4
	.long	0x1cd
	.uleb128 0x18
	.ascii "Debug_ListParameters\0"
	.byte	0x1
	.byte	0x2a
	.long	0x4f2
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x119c
	.uleb128 0x1c
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x2a
	.long	0x119c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.ascii "scrParam\0"
	.byte	0x1
	.byte	0x2a
	.long	0x11a2
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1c
	.ascii "rsParam\0"
	.byte	0x1
	.byte	0x2a
	.long	0x11a8
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.ascii "ccParam\0"
	.byte	0x1
	.byte	0x2b
	.long	0x11ae
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1c
	.ascii "modParam\0"
	.byte	0x1
	.byte	0x2b
	.long	0x11b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1c
	.ascii "chanParam\0"
	.byte	0x1
	.byte	0x2b
	.long	0x11ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0x2d
	.long	0x4f2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xbfc
	.uleb128 0x5
	.byte	0x4
	.long	0xad6
	.uleb128 0x5
	.byte	0x4
	.long	0xa22
	.uleb128 0x5
	.byte	0x4
	.long	0x963
	.uleb128 0x5
	.byte	0x4
	.long	0x714
	.uleb128 0x5
	.byte	0x4
	.long	0x7ce
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
