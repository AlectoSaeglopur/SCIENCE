	.file	"debug.c"
	.text
Ltext0:
.lcomm _gWatermarks,8,4
	.globl	_Debug_ListParameters
	.def	_Debug_ListParameters;	.scl	2;	.type	32;	.endef
_Debug_ListParameters:
LFB18:
	.file 1 "src/debug.c"
	.loc 1 55 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 56 0
	movl	$0, 4(%esp)
	movl	$_Debug_ListParameters, (%esp)
	call	_Debug_SetWatermark
	.loc 1 58 0
	movl	$0, -12(%ebp)
	.loc 1 60 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 60 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L2
	.loc 1 60 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L2
	.loc 1 60 0 discriminator 3
	cmpl	$0, 24(%ebp)
	je	L2
	.loc 1 60 0 discriminator 4
	cmpl	$0, 28(%ebp)
	je	L2
	.loc 1 61 0 is_stmt 1
	cmpl	$0, 32(%ebp)
	je	L2
	.loc 1 63 0
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
	.loc 1 64 0
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
	.loc 1 65 0
	movl	8(%ebp), %ecx
	movl	20(%ebp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%eax, 32(%ecx)
	movl	%edx, 36(%ecx)
	.loc 1 66 0
	movl	8(%ebp), %eax
	movl	24(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 40(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 44(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 48(%eax)
	movl	12(%edx), %edx
	movl	%edx, 52(%eax)
	.loc 1 67 0
	movl	8(%ebp), %eax
	movl	28(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 56(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 60(%eax)
	movl	8(%edx), %edx
	movl	%edx, 64(%eax)
	.loc 1 68 0
	movl	8(%ebp), %eax
	movl	32(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 68(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 72(%eax)
	movl	8(%edx), %ecx
	movl	%ecx, 76(%eax)
	movl	12(%edx), %edx
	movl	%edx, 80(%eax)
	jmp	L3
L2:
	.loc 1 72 0
	movl	$1, -12(%ebp)
L3:
	.loc 1 75 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 76 0
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
	.loc 1 88 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 89 0
	movl	$0, 4(%esp)
	movl	$_Debug_GenerateRandomBytes, (%esp)
	call	_Debug_SetWatermark
	.loc 1 92 0
	movl	$0, -16(%ebp)
	.loc 1 94 0
	cmpl	$0, 8(%ebp)
	je	L6
	.loc 1 94 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L6
	.loc 1 96 0 is_stmt 1
	cmpl	$0, 12(%ebp)
	jne	L7
	.loc 1 98 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	jmp	L8
L7:
	.loc 1 102 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_srand
L8:
	.loc 1 105 0
	movl	$0, -12(%ebp)
	jmp	L9
L10:
	.loc 1 107 0 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	call	_rand
	movb	%al, (%ebx)
	.loc 1 105 0 discriminator 3
	addl	$1, -12(%ebp)
L9:
	.loc 1 105 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	L10
	.loc 1 94 0 is_stmt 1
	jmp	L11
L6:
	.loc 1 112 0
	movl	$1, -16(%ebp)
L11:
	.loc 1 115 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 116 0
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
	.ascii " * TX REED-SOLOMON CODED BYTES (%d)\12\11\0"
	.align 4
LC7:
	.ascii " * RX REED-SOLOMON CODED BYTES (%d)\12\11\0"
	.align 4
LC8:
	.ascii " * TX INTERLEAVED BYTES (%d)\12\11\0"
	.align 4
LC9:
	.ascii " * RX INTERLEAVED BYTES (%d)\12\11\0"
	.align 4
LC10:
	.ascii " * TX CONVOLUTIONAL CODED BYTES (%d)\12\11\0"
	.align 4
LC11:
	.ascii " * RX CONVOLUTIONAL CODED BYTES (%d)\12\11\0"
LC12:
	.ascii "%2X \0"
LC13:
	.ascii "\12\11\0"
	.text
	.globl	_Debug_PrintByteStream
	.def	_Debug_PrintByteStream;	.scl	2;	.type	32;	.endef
_Debug_PrintByteStream:
LFB20:
	.loc 1 129 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 130 0
	movl	$0, 4(%esp)
	movl	$_Debug_PrintByteStream, (%esp)
	call	_Debug_SetWatermark
	.loc 1 132 0
	movl	$0, -12(%ebp)
	.loc 1 135 0
	cmpl	$0, 8(%ebp)
	je	L14
	.loc 1 135 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L14
	.loc 1 135 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L14
	.loc 1 137 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L15
	.loc 1 137 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$1, %eax
	jne	L15
	.loc 1 137 0 discriminator 2
	cmpl	$11, 12(%ebp)
	je	L38
L15:
	.loc 1 139 0 is_stmt 1
	cmpl	$11, 12(%ebp)
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
	.long	L27
	.long	L28
	.long	L29
	.long	L30
	.text
L18:
	.loc 1 142 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	.loc 1 143 0
	jmp	L31
L20:
	.loc 1 146 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	.loc 1 147 0
	jmp	L31
L21:
	.loc 1 150 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	.loc 1 151 0
	jmp	L31
L22:
	.loc 1 154 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	.loc 1 155 0
	jmp	L31
L23:
	.loc 1 158 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	.loc 1 159 0
	jmp	L31
L24:
	.loc 1 162 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	.loc 1 163 0
	jmp	L31
L25:
	.loc 1 166 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	.loc 1 167 0
	jmp	L31
L26:
	.loc 1 170 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	.loc 1 171 0
	jmp	L31
L27:
	.loc 1 174 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	.loc 1 175 0
	jmp	L31
L28:
	.loc 1 178 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	.loc 1 179 0
	jmp	L31
L29:
	.loc 1 182 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_printf
	.loc 1 183 0
	jmp	L31
L30:
	.loc 1 186 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	.loc 1 187 0
	jmp	L31
L17:
	.loc 1 190 0
	movl	$3, -12(%ebp)
	.loc 1 191 0
	nop
L31:
	.loc 1 194 0
	cmpl	$0, -12(%ebp)
	jne	L32
	.loc 1 196 0
	movl	$0, -16(%ebp)
	jmp	L33
L35:
	.loc 1 198 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	.loc 1 199 0
	movl	-16(%ebp), %ecx
	movl	$-2004318071, %edx
	movl	%ecx, %eax
	mull	%edx
	movl	%edx, %eax
	shrl	$4, %eax
	imull	$30, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	$29, %eax
	jne	L34
	.loc 1 199 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L34
	.loc 1 201 0 is_stmt 1
	movl	$LC13, (%esp)
	call	_printf
L34:
	.loc 1 196 0 discriminator 2
	addl	$1, -16(%ebp)
L33:
	.loc 1 196 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L35
	.loc 1 204 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
L32:
	.loc 1 207 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 137 0
	jmp	L38
L14:
	.loc 1 212 0
	movl	$1, -12(%ebp)
	jmp	L36
L38:
	.loc 1 137 0
	nop
L36:
	.loc 1 215 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 216 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
LC14:
	.ascii " * RX LLRS (%d)\12\11\0"
LC16:
	.ascii "%1.3f \0"
LC17:
	.ascii "\12\0"
	.text
	.globl	_Debug_PrintFloatStream
	.def	_Debug_PrintFloatStream;	.scl	2;	.type	32;	.endef
_Debug_PrintFloatStream:
LFB21:
	.loc 1 229 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 230 0
	movl	$0, 4(%esp)
	movl	$_Debug_PrintFloatStream, (%esp)
	call	_Debug_SetWatermark
	.loc 1 232 0
	movl	$0, -12(%ebp)
	.loc 1 235 0
	cmpl	$0, 8(%ebp)
	je	L40
	.loc 1 235 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L40
	.loc 1 235 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L40
	.loc 1 238 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L59
	.loc 1 238 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$1, %eax
	jne	L59
	.loc 1 240 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$14, %eax
	jne	L57
	.loc 1 243 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	.loc 1 244 0
	jmp	L44
L57:
	.loc 1 247 0
	movl	$3, -12(%ebp)
	.loc 1 248 0
	nop
L44:
	.loc 1 251 0
	cmpl	$0, -12(%ebp)
	jne	L45
	.loc 1 253 0
	movl	$0, -16(%ebp)
	jmp	L46
L52:
	.loc 1 255 0
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
	jbe	L58
	.loc 1 257 0
	movl	$43, (%esp)
	call	_putchar
	jmp	L49
L58:
	.loc 1 259 0
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
	jp	L60
	fldz
	fucompp
	fnstsw	%ax
	sahf
	jne	L49
	.loc 1 261 0
	movl	$32, (%esp)
	call	_putchar
	jmp	L49
L60:
	fstp	%st(0)
L49:
	.loc 1 264 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC16, (%esp)
	call	_printf
	.loc 1 266 0
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
	jne	L51
	.loc 1 266 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L51
	.loc 1 268 0 is_stmt 1
	movl	$LC13, (%esp)
	call	_printf
L51:
	.loc 1 253 0 discriminator 2
	addl	$1, -16(%ebp)
L46:
	.loc 1 253 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L52
	.loc 1 272 0 is_stmt 1
	movl	$LC17, (%esp)
	call	_puts
L45:
	.loc 1 275 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 238 0
	jmp	L59
L40:
	.loc 1 280 0
	movl	$1, -12(%ebp)
	jmp	L53
L59:
	.loc 1 238 0
	nop
L53:
	.loc 1 283 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 284 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC19:
	.ascii " * TX MAPPED SYMBOLS (%d)\12\11\0"
LC20:
	.ascii " * RX MAPPED SYMBOLS (%d)\12\11\0"
LC21:
	.ascii "%1.2f\0"
LC22:
	.ascii "%1.2fi | \0"
	.text
	.globl	_Debug_PrintComplexStream
	.def	_Debug_PrintComplexStream;	.scl	2;	.type	32;	.endef
_Debug_PrintComplexStream:
LFB22:
	.loc 1 297 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 298 0
	movl	$0, 4(%esp)
	movl	$_Debug_PrintComplexStream, (%esp)
	call	_Debug_SetWatermark
	.loc 1 300 0
	movl	$0, -12(%ebp)
	.loc 1 303 0
	cmpl	$0, 8(%ebp)
	je	L62
	.loc 1 303 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L62
	.loc 1 303 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L62
	.loc 1 305 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L76
	.loc 1 307 0
	movl	12(%ebp), %eax
	cmpl	$12, %eax
	je	L65
	cmpl	$13, %eax
	je	L66
	jmp	L80
L65:
	.loc 1 310 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC19, (%esp)
	call	_printf
	.loc 1 311 0
	jmp	L67
L66:
	.loc 1 314 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	.loc 1 315 0
	jmp	L67
L80:
	.loc 1 318 0
	movl	$3, -12(%ebp)
	.loc 1 319 0
	nop
L67:
	.loc 1 322 0
	cmpl	$0, -12(%ebp)
	jne	L68
	.loc 1 324 0
	movl	$0, -16(%ebp)
	jmp	L69
L75:
	.loc 1 326 0
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
	jb	L70
	.loc 1 328 0
	movl	$43, (%esp)
	call	_putchar
L70:
	.loc 1 330 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC21, (%esp)
	call	_printf
	.loc 1 332 0
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
	jb	L72
	.loc 1 334 0
	movl	$43, (%esp)
	call	_putchar
L72:
	.loc 1 336 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	fstpl	4(%esp)
	movl	$LC22, (%esp)
	call	_printf
	.loc 1 338 0
	movl	-16(%ebp), %eax
	andl	$7, %eax
	cmpl	$7, %eax
	jne	L74
	.loc 1 338 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L74
	.loc 1 340 0 is_stmt 1
	movl	$LC13, (%esp)
	call	_printf
L74:
	.loc 1 324 0 discriminator 2
	addl	$1, -16(%ebp)
L69:
	.loc 1 324 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L75
	.loc 1 343 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
L68:
	.loc 1 346 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 305 0
	jmp	L76
L62:
	.loc 1 351 0
	movl	$1, -12(%ebp)
L76:
	.loc 1 354 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 355 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.section .rdata,"dr"
LC23:
	.ascii "\12 # PARAMETERS\0"
LC24:
	.ascii "    * Scrambling : \0"
LC25:
	.ascii "Multiplicative\0"
LC26:
	.ascii "N/A\0"
LC27:
	.ascii "Additive\0"
LC28:
	.ascii "%s\0"
LC29:
	.ascii " | Ncells = %u\12\0"
LC30:
	.ascii "    * Reed-Solomon coding : \0"
LC31:
	.ascii "m = %u\0"
LC32:
	.ascii " | n = %u\0"
LC33:
	.ascii " | k = %u\12\0"
LC34:
	.ascii "    * Interleaving : \0"
LC35:
	.ascii "Convolutional\0"
LC36:
	.ascii "Block\0"
LC37:
	.ascii " | Nrows = %u\0"
LC38:
	.ascii " | Ncols = %u\12\0"
LC39:
	.ascii " | Ndelays = %u\12\0"
LC40:
	.ascii " | Nells = %u\12\0"
LC41:
	.ascii "    * Convolutional coding : \0"
LC42:
	.ascii " K = %d\0"
LC43:
	.ascii " | Rc = %d/%d\0"
LC44:
	.ascii "Soft\0"
LC45:
	.ascii "Hard\0"
LC46:
	.ascii " | DM = %s\12\0"
LC47:
	.ascii "    * Modulation : \0"
LC48:
	.ascii "QAM\0"
LC49:
	.ascii "PSK\0"
LC50:
	.ascii "%u-%s\12\0"
LC51:
	.ascii "    * Channel : \0"
LC52:
	.ascii "BSC | Peb = %1.1e\12\0"
LC53:
	.ascii "AWGN | EbN0 = %1.1f\12\0"
	.text
	.globl	_Debug_PrintParameters
	.def	_Debug_PrintParameters;	.scl	2;	.type	32;	.endef
_Debug_PrintParameters:
LFB23:
	.loc 1 367 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 368 0
	movl	$0, 4(%esp)
	movl	$_Debug_PrintParameters, (%esp)
	call	_Debug_SetWatermark
	.loc 1 370 0
	movl	$0, -12(%ebp)
	.loc 1 372 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IsOrgLenValid
	testb	%al, %al
	je	L82
	.loc 1 374 0
	movl	$LC23, (%esp)
	call	_puts
	.loc 1 375 0
	movl	$LC24, (%esp)
	call	_printf
	.loc 1 376 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L83
	.loc 1 376 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L84
	.loc 1 376 0 discriminator 3
	movl	$LC25, %eax
	jmp	L86
L84:
	.loc 1 376 0 discriminator 4
	movl	$LC26, %eax
	jmp	L86
L83:
	.loc 1 376 0 discriminator 2
	movl	$LC27, %eax
L86:
	.loc 1 376 0 discriminator 8
	movl	%eax, 4(%esp)
	movl	$LC28, (%esp)
	call	_printf
	.loc 1 377 0 is_stmt 1 discriminator 8
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC29, (%esp)
	call	_printf
	.loc 1 379 0 discriminator 8
	movl	$LC30, (%esp)
	call	_printf
	.loc 1 380 0 discriminator 8
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	.loc 1 381 0 discriminator 8
	movl	12(%ebp), %eax
	movzbl	21(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC32, (%esp)
	call	_printf
	.loc 1 382 0 discriminator 8
	movl	12(%ebp), %eax
	movzbl	20(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	.loc 1 384 0 discriminator 8
	movl	$LC34, (%esp)
	call	_printf
	.loc 1 385 0 discriminator 8
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	testl	%eax, %eax
	je	L87
	.loc 1 385 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	cmpl	$1, %eax
	jne	L88
	.loc 1 385 0 discriminator 3
	movl	$LC35, %eax
	jmp	L90
L88:
	.loc 1 385 0 discriminator 4
	movl	$LC26, %eax
	jmp	L90
L87:
	.loc 1 385 0 discriminator 2
	movl	$LC36, %eax
L90:
	.loc 1 385 0 discriminator 8
	movl	%eax, 4(%esp)
	movl	$LC28, (%esp)
	call	_printf
	.loc 1 386 0 is_stmt 1 discriminator 8
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	testl	%eax, %eax
	jne	L91
	.loc 1 388 0
	movl	12(%ebp), %eax
	movzbl	36(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC37, (%esp)
	call	_printf
	.loc 1 389 0
	movl	12(%ebp), %eax
	movzbl	37(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC38, (%esp)
	call	_printf
	jmp	L92
L91:
	.loc 1 391 0
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	cmpl	$1, %eax
	jne	L92
	.loc 1 393 0
	movl	12(%ebp), %eax
	movzbl	36(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC39, (%esp)
	call	_printf
	.loc 1 394 0
	movl	12(%ebp), %eax
	movzbl	37(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC40, (%esp)
	call	_printf
L92:
	.loc 1 397 0
	movl	$LC41, (%esp)
	call	_printf
	.loc 1 398 0
	movl	12(%ebp), %eax
	movl	44(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC42, (%esp)
	call	_printf
	.loc 1 399 0
	movl	12(%ebp), %eax
	movl	40(%eax), %eax
	leal	1(%eax), %edx
	movl	12(%ebp), %eax
	movl	40(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC43, (%esp)
	call	_printf
	.loc 1 400 0
	movl	12(%ebp), %eax
	movl	52(%eax), %eax
	testl	%eax, %eax
	je	L93
	.loc 1 400 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$1, %eax
	jne	L94
	.loc 1 400 0 discriminator 3
	movl	$LC44, %eax
	jmp	L96
L94:
	.loc 1 400 0 discriminator 4
	movl	$LC26, %eax
	jmp	L96
L93:
	.loc 1 400 0 discriminator 2
	movl	$LC45, %eax
L96:
	.loc 1 400 0 discriminator 8
	movl	%eax, 4(%esp)
	movl	$LC46, (%esp)
	call	_printf
	.loc 1 402 0 is_stmt 1 discriminator 8
	movl	$LC47, (%esp)
	call	_printf
	.loc 1 403 0 discriminator 8
	movl	12(%ebp), %eax
	movl	56(%eax), %eax
	testl	%eax, %eax
	je	L97
	.loc 1 403 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$1, %eax
	jne	L98
	.loc 1 403 0 discriminator 3
	movl	$LC48, %eax
	jmp	L100
L98:
	.loc 1 403 0 discriminator 4
	movl	$LC26, %eax
	jmp	L100
L97:
	.loc 1 403 0 discriminator 2
	movl	$LC49, %eax
L100:
	.loc 1 403 0 discriminator 8
	movl	12(%ebp), %edx
	movzbl	60(%edx), %edx
	movzbl	%dl, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC50, (%esp)
	call	_printf
	.loc 1 405 0 is_stmt 1 discriminator 8
	movl	$LC51, (%esp)
	call	_printf
	.loc 1 406 0 discriminator 8
	movl	12(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	L101
	.loc 1 408 0
	movl	12(%ebp), %eax
	flds	80(%eax)
	fstpl	4(%esp)
	movl	$LC52, (%esp)
	call	_printf
	jmp	L102
L101:
	.loc 1 410 0
	movl	12(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L102
	.loc 1 412 0
	movl	12(%ebp), %eax
	flds	80(%eax)
	fstpl	4(%esp)
	movl	$LC53, (%esp)
	call	_printf
L102:
	.loc 1 415 0
	movl	$10, (%esp)
	call	_putchar
	jmp	L103
L82:
	.loc 1 419 0
	movl	$2, -12(%ebp)
L103:
	.loc 1 422 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 423 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
	.align 4
LC54:
	.ascii " * Errors at convolutional encoding level: %u out of %u bits (MD = %u)\12\12\0"
	.align 4
LC55:
	.ascii " * Errors at reed-solomon encoding level: %u out of %u bits (MD = %u)\12\12\0"
	.align 4
LC56:
	.ascii " * Errors at source level: %u out of %u bits (MD = %u)\12\12\0"
LC57:
	.ascii "FAILED\0"
LC58:
	.ascii "PASSED\0"
LC59:
	.ascii " * CRC check: %s\12\12\0"
	.text
	.globl	_Debug_CheckWrongBits
	.def	_Debug_CheckWrongBits;	.scl	2;	.type	32;	.endef
_Debug_CheckWrongBits:
LFB24:
	.loc 1 437 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	.loc 1 438 0
	movl	$0, 4(%esp)
	movl	$_Debug_CheckWrongBits, (%esp)
	call	_Debug_SetWatermark
	.loc 1 440 0
	movl	$0, -12(%ebp)
	.loc 1 441 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 442 0
	movl	$0, -16(%ebp)
	.loc 1 443 0
	movl	-32(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 444 0
	movl	$0, -24(%ebp)
	.loc 1 449 0
	cmpl	$0, 8(%ebp)
	je	L106
	.loc 1 449 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L106
	.loc 1 449 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L106
	.loc 1 449 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L106
	.loc 1 449 0 discriminator 4
	cmpl	$0, 20(%ebp)
	je	L106
	.loc 1 451 0 is_stmt 1
	movl	20(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L107
	.loc 1 451 0 is_stmt 0 discriminator 1
	movl	20(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$1, %eax
	jne	L107
	.loc 1 451 0 discriminator 2
	cmpl	$11, 16(%ebp)
	je	L126
L107:
	.loc 1 453 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L109
	.loc 1 455 0
	movl	$0, -28(%ebp)
	jmp	L110
L113:
	.loc 1 457 0
	movl	-28(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 458 0
	movl	-28(%ebp), %eax
	andl	$7, %eax
	movb	%al, -37(%ebp)
	.loc 1 459 0
	addl	$1, -24(%ebp)
	.loc 1 460 0
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
	.loc 1 461 0
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
	.loc 1 460 0
	xorl	%ebx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L111
	.loc 1 463 0
	addl	$1, -16(%ebp)
	.loc 1 464 0
	cmpl	$1, -16(%ebp)
	jbe	L112
	.loc 1 464 0 is_stmt 0 discriminator 1
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jnb	L112
	.loc 1 466 0 is_stmt 1
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
L112:
	.loc 1 468 0
	movl	$0, -24(%ebp)
L111:
	.loc 1 455 0 discriminator 2
	addl	$1, -28(%ebp)
L110:
	.loc 1 455 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L113
	.loc 1 471 0 is_stmt 1
	cmpl	$1, -16(%ebp)
	ja	L114
	.loc 1 473 0
	movl	$0, -20(%ebp)
L114:
	.loc 1 476 0
	movl	16(%ebp), %eax
	cmpl	$3, %eax
	je	L116
	cmpl	$3, %eax
	ja	L117
	cmpl	$1, %eax
	je	L118
	jmp	L115
L117:
	cmpl	$7, %eax
	je	L119
	cmpl	$11, %eax
	jne	L115
	.loc 1 479 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC54, (%esp)
	call	_printf
	.loc 1 480 0
	jmp	L108
L119:
	.loc 1 483 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC55, (%esp)
	call	_printf
	.loc 1 484 0
	jmp	L108
L118:
	.loc 1 487 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC56, (%esp)
	call	_printf
	.loc 1 488 0
	jmp	L108
L116:
	.loc 1 491 0
	cmpl	$0, -16(%ebp)
	je	L122
	.loc 1 491 0 is_stmt 0 discriminator 1
	movl	$LC57, %eax
	jmp	L123
L122:
	.loc 1 491 0 discriminator 2
	movl	$LC58, %eax
L123:
	.loc 1 491 0 discriminator 4
	movl	%eax, 4(%esp)
	movl	$LC59, (%esp)
	call	_printf
	.loc 1 492 0 is_stmt 1 discriminator 4
	jmp	L108
L115:
	.loc 1 495 0
	movl	$3, -12(%ebp)
	.loc 1 496 0
	nop
	jmp	L108
L109:
	.loc 1 501 0
	movl	$7, -12(%ebp)
	.loc 1 451 0
	jmp	L126
L108:
	.loc 1 451 0 is_stmt 0 discriminator 1
	jmp	L126
L106:
	.loc 1 507 0 is_stmt 1
	movl	$1, -12(%ebp)
	jmp	L124
L126:
	.loc 1 451 0
	nop
L124:
	.loc 1 510 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 511 0
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
LC60:
	.ascii "w\0"
LC61:
	.ascii "txOrgBytes.csv\0"
LC62:
	.ascii "rxOrgBytes.csv\0"
LC63:
	.ascii "txScrBytes.csv\0"
LC64:
	.ascii "rxScrBytes.csv\0"
LC65:
	.ascii "%u,\0"
LC66:
	.ascii "%u\0"
	.text
	.globl	_Debug_WriteByteStreamToCsv
	.def	_Debug_WriteByteStreamToCsv;	.scl	2;	.type	32;	.endef
_Debug_WriteByteStreamToCsv:
LFB25:
	.loc 1 523 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 524 0
	movl	$0, 4(%esp)
	movl	$_Debug_WriteByteStreamToCsv, (%esp)
	call	_Debug_SetWatermark
	.loc 1 526 0
	movl	$0, -12(%ebp)
	.loc 1 527 0
	movl	$0, -16(%ebp)
	.loc 1 530 0
	cmpl	$0, 8(%ebp)
	je	L128
	.loc 1 530 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L128
	.loc 1 532 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$1, %eax
	je	L130
	cmpl	$1, %eax
	jb	L131
	cmpl	$4, %eax
	je	L132
	cmpl	$5, %eax
	je	L133
	jmp	L141
L131:
	.loc 1 535 0
	movl	$LC60, 4(%esp)
	movl	$LC61, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 536 0
	jmp	L134
L130:
	.loc 1 539 0
	movl	$LC60, 4(%esp)
	movl	$LC62, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 540 0
	jmp	L134
L132:
	.loc 1 543 0
	movl	$LC60, 4(%esp)
	movl	$LC63, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 544 0
	jmp	L134
L133:
	.loc 1 547 0
	movl	$LC60, 4(%esp)
	movl	$LC64, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 548 0
	jmp	L134
L141:
	.loc 1 551 0
	movl	$3, -12(%ebp)
	.loc 1 552 0
	nop
L134:
	.loc 1 555 0
	cmpl	$0, -12(%ebp)
	jne	L142
	.loc 1 555 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L142
	.loc 1 557 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC65, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 558 0
	movl	$0, -20(%ebp)
	jmp	L136
L138:
	.loc 1 560 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$LC66, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 561 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L137
	.loc 1 563 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L137:
	.loc 1 558 0 discriminator 2
	addl	$1, -20(%ebp)
L136:
	.loc 1 558 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L138
	.loc 1 566 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	.loc 1 555 0
	jmp	L142
L128:
	.loc 1 571 0
	movl	$1, -12(%ebp)
	jmp	L139
L142:
	.loc 1 555 0
	nop
L139:
	.loc 1 574 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 575 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC67:
	.ascii "txModSymbs.csv\0"
LC68:
	.ascii "rxModSymbs.csv\0"
LC69:
	.ascii "%1.4f,%1.4f\0"
	.text
	.globl	_Debug_WriteComplexStreamToCsv
	.def	_Debug_WriteComplexStreamToCsv;	.scl	2;	.type	32;	.endef
_Debug_WriteComplexStreamToCsv:
LFB26:
	.loc 1 587 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 588 0
	movl	$0, 4(%esp)
	movl	$_Debug_WriteComplexStreamToCsv, (%esp)
	call	_Debug_SetWatermark
	.loc 1 590 0
	movl	$0, -12(%ebp)
	.loc 1 591 0
	movl	$0, -16(%ebp)
	.loc 1 594 0
	cmpl	$0, 8(%ebp)
	je	L144
	.loc 1 594 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L144
	.loc 1 596 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$12, %eax
	je	L146
	cmpl	$13, %eax
	je	L147
	jmp	L155
L146:
	.loc 1 599 0
	movl	$LC60, 4(%esp)
	movl	$LC67, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 600 0
	jmp	L148
L147:
	.loc 1 603 0
	movl	$LC60, 4(%esp)
	movl	$LC68, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 604 0
	jmp	L148
L155:
	.loc 1 607 0
	movl	$3, -12(%ebp)
	.loc 1 608 0
	nop
L148:
	.loc 1 611 0
	cmpl	$0, -12(%ebp)
	jne	L156
	.loc 1 611 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L156
	.loc 1 613 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC65, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 614 0
	movl	$0, -20(%ebp)
	jmp	L150
L152:
	.loc 1 616 0
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
	movl	$LC69, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 617 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L151
	.loc 1 619 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L151:
	.loc 1 614 0 discriminator 2
	addl	$1, -20(%ebp)
L150:
	.loc 1 614 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L152
	.loc 1 622 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	.loc 1 611 0
	jmp	L156
L144:
	.loc 1 627 0
	movl	$1, -12(%ebp)
	jmp	L153
L156:
	.loc 1 611 0
	nop
L153:
	.loc 1 630 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 631 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_Debug_SetWatermark
	.def	_Debug_SetWatermark;	.scl	2;	.type	32;	.endef
_Debug_SetWatermark:
LFB27:
	.loc 1 643 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 644 0
	movl	$0, -12(%ebp)
	.loc 1 646 0
	cmpl	$1, 12(%ebp)
	ja	L158
	.loc 1 648 0
	movl	8(%ebp), %eax
	movzwl	%ax, %edx
	movl	12(%ebp), %eax
	movl	%edx, _gWatermarks(,%eax,4)
	jmp	L159
L158:
	.loc 1 652 0
	movl	$17, -12(%ebp)
L159:
	.loc 1 655 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 656 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
LC70:
	.ascii "    - Watermark Lv.%u = %x\12\0"
	.text
	.globl	_Debug_PrintWatermarks
	.def	_Debug_PrintWatermarks;	.scl	2;	.type	32;	.endef
_Debug_PrintWatermarks:
LFB28:
	.loc 1 665 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 668 0
	movb	$0, -9(%ebp)
	jmp	L162
L163:
	.loc 1 670 0 discriminator 3
	movzbl	-9(%ebp), %eax
	movl	_gWatermarks(,%eax,4), %eax
	movzbl	-9(%ebp), %edx
	addl	$1, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC70, (%esp)
	call	_printf
	.loc 1 668 0 discriminator 3
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L162:
	.loc 1 668 0 is_stmt 0 discriminator 1
	cmpb	$1, -9(%ebp)
	jbe	L163
	.loc 1 672 0 is_stmt 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.def	_IsOrgLenValid;	.scl	3;	.type	32;	.endef
_IsOrgLenValid:
LFB29:
	.loc 1 688 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 689 0
	movl	$1, 4(%esp)
	movl	$_IsOrgLenValid, (%esp)
	call	_Debug_SetWatermark
	.loc 1 691 0
	movb	$0, -9(%ebp)
	.loc 1 692 0
	movl	8(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -16(%ebp)
	.loc 1 693 0
	movl	12(%ebp), %eax
	movzbl	21(%eax), %eax
	movzbl	%al, %eax
	imull	-16(%ebp), %eax
	movl	12(%ebp), %edx
	movzbl	20(%edx), %edx
	movzbl	%dl, %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%eax, -20(%ebp)
	.loc 1 694 0
	movl	12(%ebp), %eax
	movl	40(%eax), %ecx
	movl	-20(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	40(%eax), %eax
	addl	$1, %eax
	imull	%edx, %eax
	movl	%eax, -24(%ebp)
	.loc 1 696 0
	cmpl	$0, 8(%ebp)
	je	L165
	.loc 1 697 0 discriminator 1
	movl	12(%ebp), %eax
	movl	16(%eax), %edx
	movl	12(%ebp), %eax
	movzbl	20(%eax), %eax
	movzbl	%al, %eax
	movl	%edx, %ecx
	imull	%eax, %ecx
	movl	-16(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 696 0 discriminator 1
	testl	%eax, %eax
	jne	L165
	.loc 1 698 0
	movl	12(%ebp), %eax
	movl	40(%eax), %ecx
	movl	-20(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 697 0
	testl	%eax, %eax
	jne	L165
	.loc 1 699 0
	movl	-24(%ebp), %eax
	andl	$7, %eax
	.loc 1 698 0
	testl	%eax, %eax
	jne	L165
	.loc 1 700 0
	movl	12(%ebp), %eax
	movzbl	61(%eax), %eax
	movzbl	%al, %ecx
	movl	-24(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 699 0
	testl	%eax, %eax
	jne	L165
	.loc 1 702 0
	movb	$1, -9(%ebp)
L165:
	.loc 1 705 0
	movzbl	-9(%ebp), %eax
	.loc 1 706 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
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
	.file 12 "src/interleaving.h"
	.file 13 "src/reed_solomon.h"
	.file 14 "src/scrambling.h"
	.file 15 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x1473
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
	.byte	0x3a
	.long	0x362
	.uleb128 0x4
	.ascii "re\0"
	.byte	0x6
	.byte	0x3c
	.long	0x362
	.byte	0
	.uleb128 0x4
	.ascii "im\0"
	.byte	0x6
	.byte	0x3d
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
	.byte	0x3e
	.long	0x338
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x7
	.byte	0x1b
	.long	0x54f
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
	.ascii "ERR_INV_RS_MSG_CW_LEN\0"
	.byte	0x10
	.uleb128 0xe
	.ascii "ERR_INV_WATERMARK_LEV\0"
	.byte	0x11
	.uleb128 0xe
	.ascii "ERR_INV_INTERLEAVING_TYPE\0"
	.byte	0x12
	.uleb128 0xe
	.ascii "ERR_INV_STREAM\0"
	.byte	0x13
	.uleb128 0xe
	.ascii "ERR_NUM\0"
	.byte	0x14
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x7
	.byte	0x32
	.long	0x37c
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x8
	.byte	0x1d
	.long	0x5a8
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
	.long	0x55e
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x24
	.long	0x5f9
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x26
	.long	0x5f9
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
	.long	0x5a8
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x180
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x8
	.byte	0x29
	.long	0x5bd
	.uleb128 0xa
	.long	0x5ff
	.uleb128 0x3
	.ascii "_float_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x2c
	.long	0x656
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x2e
	.long	0x656
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
	.long	0x5a8
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x362
	.uleb128 0x6
	.ascii "float_stream_t\0"
	.byte	0x8
	.byte	0x31
	.long	0x619
	.uleb128 0xa
	.long	0x65c
	.uleb128 0x3
	.ascii "_complex_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x34
	.long	0x6b6
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x36
	.long	0x6b6
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
	.long	0x5a8
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x36b
	.uleb128 0x6
	.ascii "complex_stream_t\0"
	.byte	0x8
	.byte	0x39
	.long	0x677
	.uleb128 0xa
	.long	0x6bc
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x9
	.byte	0x1d
	.long	0x704
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
	.long	0x6d9
	.uleb128 0x3
	.ascii "_mod_par_t\0"
	.byte	0xc
	.byte	0x9
	.byte	0x49
	.long	0x760
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x9
	.byte	0x4b
	.long	0x704
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
	.long	0x716
	.uleb128 0xa
	.long	0x760
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xa
	.byte	0x1e
	.long	0x7a5
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
	.long	0x776
	.uleb128 0xf
	.byte	0x4
	.byte	0xa
	.byte	0x2b
	.long	0x7d8
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
	.long	0x819
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
	.long	0x7a5
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0xa
	.byte	0x2a
	.long	0x180
	.byte	0x8
	.uleb128 0x11
	.long	0x7b8
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "chan_par_t\0"
	.byte	0xa
	.byte	0x30
	.long	0x7d8
	.uleb128 0xa
	.long	0x819
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x3d
	.long	0x87e
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
	.long	0x830
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x50
	.long	0x900
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
	.long	0x88f
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x5e
	.long	0x94d
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
	.long	0x911
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0xb
	.byte	0x66
	.long	0x9b0
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0xb
	.byte	0x68
	.long	0x87e
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0xb
	.byte	0x69
	.long	0x900
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
	.long	0x94d
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0xb
	.byte	0x6c
	.long	0x964
	.uleb128 0xa
	.long	0x9b0
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xc
	.byte	0x1d
	.long	0x9fc
	.uleb128 0xe
	.ascii "INTRLV_BLOCK\0"
	.byte	0
	.uleb128 0xe
	.ascii "INTRLV_CONV\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "INTRLV_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "itlv_type_t\0"
	.byte	0xc
	.byte	0x22
	.long	0x9c5
	.uleb128 0xf
	.byte	0x1
	.byte	0xc
	.byte	0x28
	.long	0xa30
	.uleb128 0x10
	.ascii "rows\0"
	.byte	0xc
	.byte	0x2a
	.long	0x180
	.uleb128 0x10
	.ascii "dlys\0"
	.byte	0xc
	.byte	0x2b
	.long	0x180
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.byte	0xc
	.byte	0x2d
	.long	0xa52
	.uleb128 0x10
	.ascii "cols\0"
	.byte	0xc
	.byte	0x2f
	.long	0x180
	.uleb128 0x10
	.ascii "cells\0"
	.byte	0xc
	.byte	0x30
	.long	0x180
	.byte	0
	.uleb128 0x3
	.ascii "_itlv_par_t\0"
	.byte	0x8
	.byte	0xc
	.byte	0x25
	.long	0xa80
	.uleb128 0x4
	.ascii "type\0"
	.byte	0xc
	.byte	0x27
	.long	0x9fc
	.byte	0
	.uleb128 0x11
	.long	0xa0f
	.byte	0x4
	.uleb128 0x11
	.long	0xa30
	.byte	0x5
	.byte	0
	.uleb128 0x6
	.ascii "itlv_par_t\0"
	.byte	0xc
	.byte	0x32
	.long	0xa52
	.uleb128 0xa
	.long	0xa80
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xd
	.byte	0x1d
	.long	0xac6
	.uleb128 0xe
	.ascii "RS_GF_DEGREE_4\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "RS_GF_DEGREE_8\0"
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "rs_gf_degree_t\0"
	.byte	0xd
	.byte	0x20
	.long	0xa97
	.uleb128 0x3
	.ascii "_rs_par_t\0"
	.byte	0x10
	.byte	0xd
	.byte	0x32
	.long	0xb41
	.uleb128 0x4
	.ascii "m\0"
	.byte	0xd
	.byte	0x34
	.long	0xac6
	.byte	0
	.uleb128 0x4
	.ascii "kSh\0"
	.byte	0xd
	.byte	0x35
	.long	0x180
	.byte	0x4
	.uleb128 0x4
	.ascii "nSh\0"
	.byte	0xd
	.byte	0x36
	.long	0x180
	.byte	0x5
	.uleb128 0x4
	.ascii "t\0"
	.byte	0xd
	.byte	0x37
	.long	0x180
	.byte	0x6
	.uleb128 0x4
	.ascii "kUn\0"
	.byte	0xd
	.byte	0x38
	.long	0x1ad
	.byte	0x8
	.uleb128 0x4
	.ascii "nUn\0"
	.byte	0xd
	.byte	0x39
	.long	0x1ad
	.byte	0xa
	.uleb128 0x4
	.ascii "dimGF\0"
	.byte	0xd
	.byte	0x3a
	.long	0x1ad
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "rs_par_t\0"
	.byte	0xd
	.byte	0x3b
	.long	0xadc
	.uleb128 0xa
	.long	0xb41
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xe
	.byte	0x1d
	.long	0xb8a
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
	.byte	0xe
	.byte	0x22
	.long	0xb56
	.uleb128 0x3
	.ascii "_scr_par_t\0"
	.byte	0x10
	.byte	0xe
	.byte	0x25
	.long	0xbee
	.uleb128 0x4
	.ascii "type\0"
	.byte	0xe
	.byte	0x27
	.long	0xb8a
	.byte	0
	.uleb128 0x4
	.ascii "nCells\0"
	.byte	0xe
	.byte	0x28
	.long	0x180
	.byte	0x4
	.uleb128 0x4
	.ascii "conVect\0"
	.byte	0xe
	.byte	0x29
	.long	0x1bd
	.byte	0x8
	.uleb128 0x4
	.ascii "initSt\0"
	.byte	0xe
	.byte	0x2a
	.long	0x1bd
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "scr_par_t\0"
	.byte	0xe
	.byte	0x2b
	.long	0xb9f
	.uleb128 0xa
	.long	0xbee
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xf
	.byte	0x2d
	.long	0xcec
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
	.ascii "PID_TX_RSCOD\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "PID_RX_RSCOD\0"
	.byte	0x7
	.uleb128 0xe
	.ascii "PID_TX_INTLV\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "PID_RX_INTLV\0"
	.byte	0x9
	.uleb128 0xe
	.ascii "PID_TX_CNVCOD\0"
	.byte	0xa
	.uleb128 0xe
	.ascii "PID_RX_CNVCOD\0"
	.byte	0xb
	.uleb128 0xe
	.ascii "PID_TX_MAP\0"
	.byte	0xc
	.uleb128 0xe
	.ascii "PID_RX_MAP\0"
	.byte	0xd
	.uleb128 0xe
	.ascii "PID_RX_LLR\0"
	.byte	0xe
	.uleb128 0xe
	.ascii "PID_NUM\0"
	.byte	0xf
	.byte	0
	.uleb128 0x6
	.ascii "print_label_t\0"
	.byte	0xf
	.byte	0x3f
	.long	0xc04
	.uleb128 0x3
	.ascii "_debug_par_t\0"
	.byte	0x54
	.byte	0xf
	.byte	0x42
	.long	0xd71
	.uleb128 0x4
	.ascii "scrPar\0"
	.byte	0xf
	.byte	0x44
	.long	0xbee
	.byte	0
	.uleb128 0x4
	.ascii "rsPar\0"
	.byte	0xf
	.byte	0x45
	.long	0xb41
	.byte	0x10
	.uleb128 0x4
	.ascii "itlvPar\0"
	.byte	0xf
	.byte	0x46
	.long	0xa80
	.byte	0x20
	.uleb128 0x4
	.ascii "ccPar\0"
	.byte	0xf
	.byte	0x47
	.long	0x9b0
	.byte	0x28
	.uleb128 0x4
	.ascii "modPar\0"
	.byte	0xf
	.byte	0x48
	.long	0x760
	.byte	0x38
	.uleb128 0x4
	.ascii "chanPar\0"
	.byte	0xf
	.byte	0x49
	.long	0x819
	.byte	0x44
	.byte	0
	.uleb128 0x6
	.ascii "debug_par_t\0"
	.byte	0xf
	.byte	0x4a
	.long	0xd01
	.uleb128 0xa
	.long	0xd71
	.uleb128 0x12
	.ascii "_wm_level_t\0"
	.byte	0x4
	.long	0x6f
	.byte	0xf
	.byte	0x4d
	.long	0xdcb
	.uleb128 0xe
	.ascii "WM_LEVEL_1\0"
	.byte	0
	.uleb128 0xe
	.ascii "WM_LEVEL_2\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "WM_LEVEL_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "wm_level_t\0"
	.byte	0xf
	.byte	0x53
	.long	0xd89
	.uleb128 0x7
	.long	0x1bd
	.long	0xded
	.uleb128 0xc
	.long	0x2d2
	.byte	0x1
	.byte	0
	.uleb128 0x13
	.ascii "gWatermarks\0"
	.byte	0x1
	.byte	0x18
	.long	0xddd
	.uleb128 0x5
	.byte	0x3
	.long	_gWatermarks
	.uleb128 0x14
	.ascii "IsOrgLenValid\0"
	.byte	0x1
	.word	0x2af
	.long	0xe9e
	.long	LFB29
	.long	LFE29-LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0xe9e
	.uleb128 0x15
	.ascii "orgLenBy\0"
	.byte	0x1
	.word	0x2af
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "dbgParams\0"
	.byte	0x1
	.word	0x2af
	.long	0xea7
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.ascii "bRet\0"
	.byte	0x1
	.word	0x2b3
	.long	0xe9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x16
	.ascii "orgLenBi\0"
	.byte	0x1
	.word	0x2b4
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "rsLenBi\0"
	.byte	0x1
	.word	0x2b5
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "ccLenBi\0"
	.byte	0x1
	.word	0x2b6
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x5
	.byte	0x4
	.long	0xd84
	.uleb128 0x17
	.ascii "Debug_PrintWatermarks\0"
	.byte	0x1
	.word	0x298
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0xee5
	.uleb128 0x16
	.ascii "lev\0"
	.byte	0x1
	.word	0x29a
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x18
	.ascii "Debug_SetWatermark\0"
	.byte	0x1
	.word	0x282
	.long	0x54f
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xf43
	.uleb128 0x15
	.ascii "funcAddr\0"
	.byte	0x1
	.word	0x282
	.long	0xf43
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "level\0"
	.byte	0x1
	.word	0x282
	.long	0xdcb
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.word	0x284
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1a
	.byte	0x4
	.uleb128 0x18
	.ascii "Debug_WriteComplexStreamToCsv\0"
	.byte	0x1
	.word	0x24a
	.long	0x54f
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xfc3
	.uleb128 0x1b
	.secrel32	LASF1
	.byte	0x1
	.word	0x24a
	.long	0xfc3
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.secrel32	LASF2
	.byte	0x1
	.word	0x24a
	.long	0xcec
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.word	0x24e
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "fid\0"
	.byte	0x1
	.word	0x24f
	.long	0xfc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x250
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x6d4
	.uleb128 0x5
	.byte	0x4
	.long	0x14e
	.uleb128 0x18
	.ascii "Debug_WriteByteStreamToCsv\0"
	.byte	0x1
	.word	0x20a
	.long	0x54f
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x104a
	.uleb128 0x1b
	.secrel32	LASF1
	.byte	0x1
	.word	0x20a
	.long	0x104a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.secrel32	LASF2
	.byte	0x1
	.word	0x20a
	.long	0xcec
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.word	0x20e
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "fid\0"
	.byte	0x1
	.word	0x20f
	.long	0xfc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x210
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x614
	.uleb128 0x18
	.ascii "Debug_CheckWrongBits\0"
	.byte	0x1
	.word	0x1b4
	.long	0x54f
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x1158
	.uleb128 0x15
	.ascii "inStreamA\0"
	.byte	0x1
	.word	0x1b4
	.long	0x104a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "inStreamB\0"
	.byte	0x1
	.word	0x1b4
	.long	0x104a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.secrel32	LASF2
	.byte	0x1
	.word	0x1b4
	.long	0xcec
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1b
	.secrel32	LASF3
	.byte	0x1
	.word	0x1b4
	.long	0xea7
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.word	0x1b8
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "bitLen\0"
	.byte	0x1
	.word	0x1b9
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.ascii "bitErrCnt\0"
	.byte	0x1
	.word	0x1ba
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "minErrDist\0"
	.byte	0x1
	.word	0x1bb
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "curErrDist\0"
	.byte	0x1
	.word	0x1bc
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x1bd
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.ascii "byteIdx\0"
	.byte	0x1
	.word	0x1be
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.ascii "bitIdx\0"
	.byte	0x1
	.word	0x1bf
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.byte	0
	.uleb128 0x18
	.ascii "Debug_PrintParameters\0"
	.byte	0x1
	.word	0x16e
	.long	0x54f
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x11b5
	.uleb128 0x15
	.ascii "orgLen\0"
	.byte	0x1
	.word	0x16e
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.secrel32	LASF3
	.byte	0x1
	.word	0x16e
	.long	0xea7
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.word	0x172
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.ascii "Debug_PrintComplexStream\0"
	.byte	0x1
	.word	0x128
	.long	0x54f
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x122e
	.uleb128 0x1b
	.secrel32	LASF1
	.byte	0x1
	.word	0x128
	.long	0xfc3
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.secrel32	LASF2
	.byte	0x1
	.word	0x128
	.long	0xcec
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.secrel32	LASF3
	.byte	0x1
	.word	0x128
	.long	0xea7
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.word	0x12c
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x12d
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.ascii "Debug_PrintFloatStream\0"
	.byte	0x1
	.byte	0xe4
	.long	0x54f
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x129f
	.uleb128 0x1d
	.secrel32	LASF1
	.byte	0x1
	.byte	0xe4
	.long	0x129f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.secrel32	LASF2
	.byte	0x1
	.byte	0xe4
	.long	0xcec
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1d
	.secrel32	LASF3
	.byte	0x1
	.byte	0xe4
	.long	0xea7
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1e
	.secrel32	LASF0
	.byte	0x1
	.byte	0xe8
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.byte	0xe9
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x672
	.uleb128 0x1c
	.ascii "Debug_PrintByteStream\0"
	.byte	0x1
	.byte	0x80
	.long	0x54f
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x1315
	.uleb128 0x1d
	.secrel32	LASF1
	.byte	0x1
	.byte	0x80
	.long	0x104a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.secrel32	LASF2
	.byte	0x1
	.byte	0x80
	.long	0xcec
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1d
	.secrel32	LASF3
	.byte	0x1
	.byte	0x80
	.long	0xea7
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1e
	.secrel32	LASF0
	.byte	0x1
	.byte	0x84
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.byte	0x85
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.ascii "Debug_GenerateRandomBytes\0"
	.byte	0x1
	.byte	0x57
	.long	0x54f
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x1382
	.uleb128 0x1f
	.ascii "ioStream\0"
	.byte	0x1
	.byte	0x57
	.long	0x1382
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1f
	.ascii "pSeed\0"
	.byte	0x1
	.byte	0x57
	.long	0x1388
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.byte	0x5b
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.secrel32	LASF0
	.byte	0x1
	.byte	0x5c
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5ff
	.uleb128 0x5
	.byte	0x4
	.long	0x1cd
	.uleb128 0x1c
	.ascii "Debug_ListParameters\0"
	.byte	0x1
	.byte	0x35
	.long	0x54f
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x144c
	.uleb128 0x1f
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x35
	.long	0x144c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1f
	.ascii "scrParam\0"
	.byte	0x1
	.byte	0x35
	.long	0x1452
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1f
	.ascii "rsParam\0"
	.byte	0x1
	.byte	0x35
	.long	0x1458
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1f
	.ascii "itlvParam\0"
	.byte	0x1
	.byte	0x35
	.long	0x145e
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1f
	.ascii "ccParam\0"
	.byte	0x1
	.byte	0x36
	.long	0x1464
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1f
	.ascii "modParam\0"
	.byte	0x1
	.byte	0x36
	.long	0x146a
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1f
	.ascii "chanParam\0"
	.byte	0x1
	.byte	0x36
	.long	0x1470
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x1e
	.secrel32	LASF0
	.byte	0x1
	.byte	0x3a
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xd71
	.uleb128 0x5
	.byte	0x4
	.long	0xbff
	.uleb128 0x5
	.byte	0x4
	.long	0xb51
	.uleb128 0x5
	.byte	0x4
	.long	0xa92
	.uleb128 0x5
	.byte	0x4
	.long	0x9c0
	.uleb128 0x5
	.byte	0x4
	.long	0x771
	.uleb128 0x5
	.byte	0x4
	.long	0x82b
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
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.ascii "pParams\0"
LASF2:
	.ascii "label\0"
LASF0:
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
