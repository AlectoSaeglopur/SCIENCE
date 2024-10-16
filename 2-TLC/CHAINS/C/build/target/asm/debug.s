	.file	"debug.c"
	.text
Ltext0:
.lcomm _gWatermarks,12,4
	.section .rdata,"dr"
_bShAppChgEnabled:
	.space 1
	.text
	.globl	_Debug_ListParameters
	.def	_Debug_ListParameters;	.scl	2;	.type	32;	.endef
_Debug_ListParameters:
LFB18:
	.file 1 "src/debug.c"
	.loc 1 57 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 58 0
	movl	$0, 4(%esp)
	movl	$_Debug_ListParameters, (%esp)
	call	_Debug_SetWatermark
	.loc 1 60 0
	movl	$0, -12(%ebp)
	.loc 1 62 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 62 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L2
	.loc 1 62 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L2
	.loc 1 62 0 discriminator 3
	cmpl	$0, 24(%ebp)
	je	L2
	.loc 1 62 0 discriminator 4
	cmpl	$0, 28(%ebp)
	je	L2
	.loc 1 63 0 is_stmt 1
	cmpl	$0, 32(%ebp)
	je	L2
	.loc 1 65 0
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
	.loc 1 66 0
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
	.loc 1 67 0
	movl	8(%ebp), %ecx
	movl	20(%ebp), %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%eax, 32(%ecx)
	movl	%edx, 36(%ecx)
	.loc 1 68 0
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
	.loc 1 69 0
	movl	8(%ebp), %eax
	movl	28(%ebp), %edx
	movl	(%edx), %ecx
	movl	%ecx, 56(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 60(%eax)
	movl	8(%edx), %edx
	movl	%edx, 64(%eax)
	.loc 1 70 0
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
	.loc 1 74 0
	movl	$1, -12(%ebp)
L3:
	.loc 1 77 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 78 0
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
	.loc 1 90 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 91 0
	movl	$0, 4(%esp)
	movl	$_Debug_GenerateRandomBytes, (%esp)
	call	_Debug_SetWatermark
	.loc 1 94 0
	movl	$0, -16(%ebp)
	.loc 1 96 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L6
	.loc 1 98 0
	cmpl	$0, 12(%ebp)
	jne	L7
	.loc 1 100 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	jmp	L8
L7:
	.loc 1 104 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_srand
L8:
	.loc 1 107 0
	movl	$0, -12(%ebp)
	jmp	L9
L10:
	.loc 1 109 0 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	call	_rand
	movb	%al, (%ebx)
	.loc 1 107 0 discriminator 3
	addl	$1, -12(%ebp)
L9:
	.loc 1 107 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	L10
	jmp	L11
L6:
	.loc 1 114 0 is_stmt 1
	movl	$1, -16(%ebp)
L11:
	.loc 1 117 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 118 0
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
	.loc 1 131 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 132 0
	movl	$0, 4(%esp)
	movl	$_Debug_PrintByteStream, (%esp)
	call	_Debug_SetWatermark
	.loc 1 134 0
	movl	$0, -12(%ebp)
	.loc 1 137 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L14
	.loc 1 137 0 is_stmt 0 discriminator 1
	cmpl	$0, 16(%ebp)
	je	L14
	.loc 1 140 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L15
	.loc 1 140 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$1, %eax
	jne	L15
	.loc 1 140 0 discriminator 2
	cmpl	$11, 12(%ebp)
	je	L38
L15:
	.loc 1 142 0 is_stmt 1
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
	.loc 1 145 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	.loc 1 146 0
	jmp	L31
L20:
	.loc 1 149 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	.loc 1 150 0
	jmp	L31
L21:
	.loc 1 153 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	.loc 1 154 0
	jmp	L31
L22:
	.loc 1 157 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	.loc 1 158 0
	jmp	L31
L23:
	.loc 1 161 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	.loc 1 162 0
	jmp	L31
L24:
	.loc 1 165 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	.loc 1 166 0
	jmp	L31
L25:
	.loc 1 169 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	.loc 1 170 0
	jmp	L31
L26:
	.loc 1 173 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	.loc 1 174 0
	jmp	L31
L27:
	.loc 1 177 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	.loc 1 178 0
	jmp	L31
L28:
	.loc 1 181 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	.loc 1 182 0
	jmp	L31
L29:
	.loc 1 185 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	_printf
	.loc 1 186 0
	jmp	L31
L30:
	.loc 1 189 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	.loc 1 190 0
	jmp	L31
L17:
	.loc 1 193 0
	movl	$3, -12(%ebp)
	.loc 1 194 0
	nop
L31:
	.loc 1 197 0
	cmpl	$0, -12(%ebp)
	jne	L32
	.loc 1 199 0
	movl	$0, -16(%ebp)
	jmp	L33
L35:
	.loc 1 201 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	.loc 1 202 0
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
	.loc 1 202 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L34
	.loc 1 204 0 is_stmt 1
	movl	$LC13, (%esp)
	call	_printf
L34:
	.loc 1 199 0 discriminator 2
	addl	$1, -16(%ebp)
L33:
	.loc 1 199 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L35
	.loc 1 207 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
L32:
	.loc 1 210 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 140 0
	jmp	L38
L14:
	.loc 1 215 0
	movl	$1, -12(%ebp)
	jmp	L36
L38:
	.loc 1 140 0
	nop
L36:
	.loc 1 218 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 219 0
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
	.loc 1 232 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 233 0
	movl	$0, 4(%esp)
	movl	$_Debug_PrintFloatStream, (%esp)
	call	_Debug_SetWatermark
	.loc 1 235 0
	movl	$0, -12(%ebp)
	.loc 1 238 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L40
	.loc 1 238 0 is_stmt 0 discriminator 1
	cmpl	$0, 16(%ebp)
	je	L40
	.loc 1 242 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L59
	.loc 1 242 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$1, %eax
	jne	L59
	.loc 1 244 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$14, %eax
	jne	L57
	.loc 1 247 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	.loc 1 248 0
	jmp	L44
L57:
	.loc 1 251 0
	movl	$3, -12(%ebp)
	.loc 1 252 0
	nop
L44:
	.loc 1 255 0
	cmpl	$0, -12(%ebp)
	jne	L45
	.loc 1 257 0
	movl	$0, -16(%ebp)
	jmp	L46
L52:
	.loc 1 259 0
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
	.loc 1 261 0
	movl	$43, (%esp)
	call	_putchar
	jmp	L49
L58:
	.loc 1 263 0
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
	.loc 1 265 0
	movl	$32, (%esp)
	call	_putchar
	jmp	L49
L60:
	fstp	%st(0)
L49:
	.loc 1 268 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC16, (%esp)
	call	_printf
	.loc 1 270 0
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
	.loc 1 270 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L51
	.loc 1 272 0 is_stmt 1
	movl	$LC13, (%esp)
	call	_printf
L51:
	.loc 1 257 0 discriminator 2
	addl	$1, -16(%ebp)
L46:
	.loc 1 257 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L52
	.loc 1 276 0 is_stmt 1
	movl	$LC17, (%esp)
	call	_puts
L45:
	.loc 1 279 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 242 0
	jmp	L59
L40:
	.loc 1 284 0
	movl	$1, -12(%ebp)
	jmp	L53
L59:
	.loc 1 242 0
	nop
L53:
	.loc 1 287 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 288 0
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
	.loc 1 301 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 302 0
	movl	$0, 4(%esp)
	movl	$_Debug_PrintComplexStream, (%esp)
	call	_Debug_SetWatermark
	.loc 1 304 0
	movl	$0, -12(%ebp)
	.loc 1 307 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L62
	.loc 1 307 0 is_stmt 0 discriminator 1
	cmpl	$0, 16(%ebp)
	je	L62
	.loc 1 310 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L76
	.loc 1 312 0
	movl	12(%ebp), %eax
	cmpl	$12, %eax
	je	L65
	cmpl	$13, %eax
	je	L66
	jmp	L80
L65:
	.loc 1 315 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC19, (%esp)
	call	_printf
	.loc 1 316 0
	jmp	L67
L66:
	.loc 1 319 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_printf
	.loc 1 320 0
	jmp	L67
L80:
	.loc 1 323 0
	movl	$3, -12(%ebp)
	.loc 1 324 0
	nop
L67:
	.loc 1 327 0
	cmpl	$0, -12(%ebp)
	jne	L68
	.loc 1 329 0
	movl	$0, -16(%ebp)
	jmp	L69
L75:
	.loc 1 331 0
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
	.loc 1 333 0
	movl	$43, (%esp)
	call	_putchar
L70:
	.loc 1 335 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC21, (%esp)
	call	_printf
	.loc 1 337 0
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
	.loc 1 339 0
	movl	$43, (%esp)
	call	_putchar
L72:
	.loc 1 341 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	fstpl	4(%esp)
	movl	$LC22, (%esp)
	call	_printf
	.loc 1 343 0
	movl	-16(%ebp), %eax
	andl	$7, %eax
	cmpl	$7, %eax
	jne	L74
	.loc 1 343 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L74
	.loc 1 345 0 is_stmt 1
	movl	$LC13, (%esp)
	call	_printf
L74:
	.loc 1 329 0 discriminator 2
	addl	$1, -16(%ebp)
L69:
	.loc 1 329 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L75
	.loc 1 348 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
L68:
	.loc 1 351 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 310 0
	jmp	L76
L62:
	.loc 1 356 0
	movl	$1, -12(%ebp)
L76:
	.loc 1 359 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 360 0
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
	.ascii " | Ndelays = %u\0"
LC40:
	.ascii "    * Convolutional coding : \0"
LC41:
	.ascii "K = %u\0"
LC42:
	.ascii " | Rc = %u/%u\0"
LC43:
	.ascii "Soft\0"
LC44:
	.ascii "Hard\0"
LC45:
	.ascii " | DM = %s\12\0"
LC46:
	.ascii "    * Modulation : \0"
LC47:
	.ascii "QAM\0"
LC48:
	.ascii "PSK\0"
LC49:
	.ascii "%u-%s\12\0"
LC50:
	.ascii "    * Channel : \0"
LC51:
	.ascii "BSC | Peb = %1.1e\12\0"
LC52:
	.ascii "AWGN | EbN0 = %1.1f\12\0"
	.text
	.globl	_Debug_PrintParameters
	.def	_Debug_PrintParameters;	.scl	2;	.type	32;	.endef
_Debug_PrintParameters:
LFB23:
	.loc 1 372 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 373 0
	movl	$0, 4(%esp)
	movl	$_Debug_PrintParameters, (%esp)
	call	_Debug_SetWatermark
	.loc 1 375 0
	movl	$0, -12(%ebp)
	.loc 1 377 0
	cmpl	$0, 12(%ebp)
	je	L82
	.loc 1 379 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IsOrgLenValid
	testb	%al, %al
	je	L83
	.loc 1 381 0
	movl	$LC23, (%esp)
	call	_puts
	.loc 1 382 0
	movl	$LC24, (%esp)
	call	_printf
	.loc 1 383 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L84
	.loc 1 383 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L85
	.loc 1 383 0 discriminator 3
	movl	$LC25, %eax
	jmp	L87
L85:
	.loc 1 383 0 discriminator 4
	movl	$LC26, %eax
	jmp	L87
L84:
	.loc 1 383 0 discriminator 2
	movl	$LC27, %eax
L87:
	.loc 1 383 0 discriminator 8
	movl	%eax, 4(%esp)
	movl	$LC28, (%esp)
	call	_printf
	.loc 1 384 0 is_stmt 1 discriminator 8
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC29, (%esp)
	call	_printf
	.loc 1 386 0 discriminator 8
	movl	$LC30, (%esp)
	call	_printf
	.loc 1 387 0 discriminator 8
	movl	12(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	.loc 1 388 0 discriminator 8
	movl	12(%ebp), %eax
	movzbl	21(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC32, (%esp)
	call	_printf
	.loc 1 389 0 discriminator 8
	movl	12(%ebp), %eax
	movzbl	20(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC33, (%esp)
	call	_printf
	.loc 1 391 0 discriminator 8
	movl	$LC34, (%esp)
	call	_printf
	.loc 1 392 0 discriminator 8
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	testl	%eax, %eax
	je	L88
	.loc 1 392 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	cmpl	$1, %eax
	jne	L89
	.loc 1 392 0 discriminator 3
	movl	$LC35, %eax
	jmp	L91
L89:
	.loc 1 392 0 discriminator 4
	movl	$LC26, %eax
	jmp	L91
L88:
	.loc 1 392 0 discriminator 2
	movl	$LC36, %eax
L91:
	.loc 1 392 0 discriminator 8
	movl	%eax, 4(%esp)
	movl	$LC28, (%esp)
	call	_printf
	.loc 1 393 0 is_stmt 1 discriminator 8
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	testl	%eax, %eax
	jne	L92
	.loc 1 395 0
	movl	12(%ebp), %eax
	movzbl	36(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC37, (%esp)
	call	_printf
	.loc 1 396 0
	movl	12(%ebp), %eax
	movzbl	37(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC38, (%esp)
	call	_printf
	jmp	L93
L92:
	.loc 1 398 0
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	cmpl	$1, %eax
	jne	L93
	.loc 1 400 0
	movl	12(%ebp), %eax
	movzbl	36(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC39, (%esp)
	call	_printf
	.loc 1 401 0
	movl	12(%ebp), %eax
	movzbl	37(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC29, (%esp)
	call	_printf
L93:
	.loc 1 404 0
	movl	$LC40, (%esp)
	call	_printf
	.loc 1 405 0
	movl	12(%ebp), %eax
	movl	44(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC41, (%esp)
	call	_printf
	.loc 1 406 0
	movl	12(%ebp), %eax
	movl	40(%eax), %eax
	leal	1(%eax), %edx
	movl	12(%ebp), %eax
	movl	40(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC42, (%esp)
	call	_printf
	.loc 1 407 0
	movl	12(%ebp), %eax
	movl	52(%eax), %eax
	testl	%eax, %eax
	je	L94
	.loc 1 407 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$1, %eax
	jne	L95
	.loc 1 407 0 discriminator 3
	movl	$LC43, %eax
	jmp	L97
L95:
	.loc 1 407 0 discriminator 4
	movl	$LC26, %eax
	jmp	L97
L94:
	.loc 1 407 0 discriminator 2
	movl	$LC44, %eax
L97:
	.loc 1 407 0 discriminator 8
	movl	%eax, 4(%esp)
	movl	$LC45, (%esp)
	call	_printf
	.loc 1 409 0 is_stmt 1 discriminator 8
	movl	$LC46, (%esp)
	call	_printf
	.loc 1 410 0 discriminator 8
	movl	12(%ebp), %eax
	movl	56(%eax), %eax
	testl	%eax, %eax
	je	L98
	.loc 1 410 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$1, %eax
	jne	L99
	.loc 1 410 0 discriminator 3
	movl	$LC47, %eax
	jmp	L101
L99:
	.loc 1 410 0 discriminator 4
	movl	$LC26, %eax
	jmp	L101
L98:
	.loc 1 410 0 discriminator 2
	movl	$LC48, %eax
L101:
	.loc 1 410 0 discriminator 8
	movl	12(%ebp), %edx
	movzbl	60(%edx), %edx
	movzbl	%dl, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC49, (%esp)
	call	_printf
	.loc 1 412 0 is_stmt 1 discriminator 8
	movl	$LC50, (%esp)
	call	_printf
	.loc 1 413 0 discriminator 8
	movl	12(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	L102
	.loc 1 415 0
	movl	12(%ebp), %eax
	flds	80(%eax)
	fstpl	4(%esp)
	movl	$LC51, (%esp)
	call	_printf
	jmp	L103
L102:
	.loc 1 417 0
	movl	12(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L103
	.loc 1 419 0
	movl	12(%ebp), %eax
	flds	80(%eax)
	fstpl	4(%esp)
	movl	$LC52, (%esp)
	call	_printf
L103:
	.loc 1 422 0
	movl	$10, (%esp)
	call	_putchar
	jmp	L105
L83:
	.loc 1 426 0
	movl	$2, -12(%ebp)
	jmp	L105
L82:
	.loc 1 431 0
	movl	$1, -12(%ebp)
L105:
	.loc 1 434 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 435 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
	.align 4
LC53:
	.ascii " * Errors at convolutional encoding level: %u out of %u bits (MD = %u)\12\12\0"
	.align 4
LC54:
	.ascii " * Errors at reed-solomon encoding level: %u out of %u bits (MD = %u)\12\12\0"
	.align 4
LC55:
	.ascii " * Errors at source level: %u out of %u bits (MD = %u)\12\12\0"
LC56:
	.ascii " * CRC check: \0"
LC57:
	.ascii "PASSED\0"
LC58:
	.ascii "FAILED\0"
	.text
	.globl	_Debug_CheckWrongBits
	.def	_Debug_CheckWrongBits;	.scl	2;	.type	32;	.endef
_Debug_CheckWrongBits:
LFB24:
	.loc 1 449 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	.loc 1 450 0
	movl	$0, 4(%esp)
	movl	$_Debug_CheckWrongBits, (%esp)
	call	_Debug_SetWatermark
	.loc 1 452 0
	movl	$0, -12(%ebp)
	.loc 1 453 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 454 0
	movl	$0, -16(%ebp)
	.loc 1 455 0
	movl	-32(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 456 0
	movl	$0, -24(%ebp)
	.loc 1 461 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L108
	.loc 1 462 0 discriminator 1
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	.loc 1 461 0 discriminator 1
	testb	%al, %al
	je	L108
	.loc 1 462 0
	cmpl	$0, 20(%ebp)
	je	L108
	.loc 1 465 0
	movl	20(%ebp), %eax
	movl	72(%eax), %eax
	cmpl	$1, %eax
	jne	L109
	.loc 1 465 0 is_stmt 0 discriminator 1
	movl	20(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$1, %eax
	jne	L109
	.loc 1 465 0 discriminator 2
	cmpl	$11, 16(%ebp)
	je	L128
L109:
	.loc 1 467 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L111
	.loc 1 469 0
	movl	$0, -28(%ebp)
	jmp	L112
L115:
	.loc 1 471 0
	movl	-28(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 472 0
	movl	-28(%ebp), %eax
	andl	$7, %eax
	movb	%al, -37(%ebp)
	.loc 1 473 0
	addl	$1, -24(%ebp)
	.loc 1 474 0
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
	.loc 1 475 0
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
	.loc 1 474 0
	xorl	%ebx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L113
	.loc 1 477 0
	addl	$1, -16(%ebp)
	.loc 1 478 0
	cmpl	$1, -16(%ebp)
	jbe	L114
	.loc 1 478 0 is_stmt 0 discriminator 1
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jnb	L114
	.loc 1 480 0 is_stmt 1
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
L114:
	.loc 1 482 0
	movl	$0, -24(%ebp)
L113:
	.loc 1 469 0 discriminator 2
	addl	$1, -28(%ebp)
L112:
	.loc 1 469 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L115
	.loc 1 485 0 is_stmt 1
	cmpl	$1, -16(%ebp)
	ja	L116
	.loc 1 487 0
	movl	$0, -20(%ebp)
L116:
	.loc 1 490 0
	movl	16(%ebp), %eax
	cmpl	$3, %eax
	je	L118
	cmpl	$3, %eax
	ja	L119
	cmpl	$1, %eax
	je	L120
	jmp	L117
L119:
	cmpl	$7, %eax
	je	L121
	cmpl	$11, %eax
	jne	L117
	.loc 1 493 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC53, (%esp)
	call	_printf
	.loc 1 494 0
	jmp	L110
L121:
	.loc 1 497 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC54, (%esp)
	call	_printf
	.loc 1 498 0
	jmp	L110
L120:
	.loc 1 501 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC55, (%esp)
	call	_printf
	.loc 1 502 0
	jmp	L110
L118:
	.loc 1 505 0
	movl	$LC56, (%esp)
	call	_printf
	.loc 1 506 0
	cmpl	$0, -16(%ebp)
	jne	L124
	.loc 1 508 0
	movl	$1, 4(%esp)
	movl	$92, (%esp)
	call	_Debug_SetTerminalAppearance
	.loc 1 509 0
	movl	$LC57, (%esp)
	call	_puts
	jmp	L125
L124:
	.loc 1 513 0
	movl	$1, 4(%esp)
	movl	$91, (%esp)
	call	_Debug_SetTerminalAppearance
	.loc 1 514 0
	movl	$LC58, (%esp)
	call	_puts
L125:
	.loc 1 516 0
	call	_Debug_ResetTerminalAppearance
	.loc 1 517 0
	movl	$3, 4(%esp)
	movl	$97, (%esp)
	call	_Debug_SetTerminalAppearance
	.loc 1 518 0
	jmp	L110
L117:
	.loc 1 521 0
	movl	$3, -12(%ebp)
	.loc 1 522 0
	nop
	jmp	L110
L111:
	.loc 1 527 0
	movl	$7, -12(%ebp)
	.loc 1 465 0
	jmp	L128
L110:
	.loc 1 465 0 is_stmt 0 discriminator 1
	jmp	L128
L108:
	.loc 1 533 0 is_stmt 1
	movl	$1, -12(%ebp)
	jmp	L126
L128:
	.loc 1 465 0
	nop
L126:
	.loc 1 536 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 537 0
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
LC59:
	.ascii "w\0"
LC60:
	.ascii "txOrgBytes.csv\0"
LC61:
	.ascii "rxOrgBytes.csv\0"
LC62:
	.ascii "txScrBytes.csv\0"
LC63:
	.ascii "rxScrBytes.csv\0"
LC64:
	.ascii "%u,\0"
LC65:
	.ascii "%u\0"
	.text
	.globl	_Debug_WriteByteStreamToCsv
	.def	_Debug_WriteByteStreamToCsv;	.scl	2;	.type	32;	.endef
_Debug_WriteByteStreamToCsv:
LFB25:
	.loc 1 549 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 550 0
	movl	$0, 4(%esp)
	movl	$_Debug_WriteByteStreamToCsv, (%esp)
	call	_Debug_SetWatermark
	.loc 1 552 0
	movl	$0, -12(%ebp)
	.loc 1 553 0
	movl	$0, -16(%ebp)
	.loc 1 556 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L130
	.loc 1 558 0
	movl	12(%ebp), %eax
	cmpl	$1, %eax
	je	L132
	cmpl	$1, %eax
	jb	L133
	cmpl	$4, %eax
	je	L134
	cmpl	$5, %eax
	je	L135
	jmp	L143
L133:
	.loc 1 561 0
	movl	$LC59, 4(%esp)
	movl	$LC60, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 562 0
	jmp	L136
L132:
	.loc 1 565 0
	movl	$LC59, 4(%esp)
	movl	$LC61, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 566 0
	jmp	L136
L134:
	.loc 1 569 0
	movl	$LC59, 4(%esp)
	movl	$LC62, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 570 0
	jmp	L136
L135:
	.loc 1 573 0
	movl	$LC59, 4(%esp)
	movl	$LC63, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 574 0
	jmp	L136
L143:
	.loc 1 577 0
	movl	$3, -12(%ebp)
	.loc 1 578 0
	nop
L136:
	.loc 1 581 0
	cmpl	$0, -12(%ebp)
	jne	L141
	.loc 1 581 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L141
	.loc 1 583 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC64, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 584 0
	movl	$0, -20(%ebp)
	jmp	L138
L140:
	.loc 1 586 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$LC65, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 587 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L139
	.loc 1 589 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L139:
	.loc 1 584 0 discriminator 2
	addl	$1, -20(%ebp)
L138:
	.loc 1 584 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L140
	.loc 1 592 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	jmp	L141
L130:
	.loc 1 597 0
	movl	$1, -12(%ebp)
L141:
	.loc 1 600 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 601 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
LC66:
	.ascii "txModSymbs.csv\0"
LC67:
	.ascii "rxModSymbs.csv\0"
LC68:
	.ascii "%1.4f,%1.4f\0"
	.text
	.globl	_Debug_WriteComplexStreamToCsv
	.def	_Debug_WriteComplexStreamToCsv;	.scl	2;	.type	32;	.endef
_Debug_WriteComplexStreamToCsv:
LFB26:
	.loc 1 613 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 614 0
	movl	$0, 4(%esp)
	movl	$_Debug_WriteComplexStreamToCsv, (%esp)
	call	_Debug_SetWatermark
	.loc 1 616 0
	movl	$0, -12(%ebp)
	.loc 1 617 0
	movl	$0, -16(%ebp)
	.loc 1 620 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L145
	.loc 1 622 0
	movl	12(%ebp), %eax
	cmpl	$12, %eax
	je	L147
	cmpl	$13, %eax
	je	L148
	jmp	L156
L147:
	.loc 1 625 0
	movl	$LC59, 4(%esp)
	movl	$LC66, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 626 0
	jmp	L149
L148:
	.loc 1 629 0
	movl	$LC59, 4(%esp)
	movl	$LC67, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 630 0
	jmp	L149
L156:
	.loc 1 633 0
	movl	$3, -12(%ebp)
	.loc 1 634 0
	nop
L149:
	.loc 1 637 0
	cmpl	$0, -12(%ebp)
	jne	L154
	.loc 1 637 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L154
	.loc 1 639 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$LC64, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 640 0
	movl	$0, -20(%ebp)
	jmp	L151
L153:
	.loc 1 642 0
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
	movl	$LC68, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 643 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L152
	.loc 1 645 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L152:
	.loc 1 640 0 discriminator 2
	addl	$1, -20(%ebp)
L151:
	.loc 1 640 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L153
	.loc 1 648 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	jmp	L154
L145:
	.loc 1 653 0
	movl	$1, -12(%ebp)
L154:
	.loc 1 656 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 657 0
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
	.loc 1 669 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 670 0
	movl	$0, -12(%ebp)
	.loc 1 673 0
	cmpl	$2, 12(%ebp)
	ja	L158
	.loc 1 675 0
	movl	8(%ebp), %eax
	movzwl	%ax, %edx
	movl	12(%ebp), %eax
	movl	%edx, _gWatermarks(,%eax,4)
	.loc 1 677 0
	movl	12(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
	jmp	L159
L160:
	.loc 1 679 0 discriminator 3
	movzbl	-13(%ebp), %eax
	movl	$0, _gWatermarks(,%eax,4)
	.loc 1 677 0 discriminator 3
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L159:
	.loc 1 677 0 is_stmt 0 discriminator 1
	cmpb	$2, -13(%ebp)
	jbe	L160
	jmp	L161
L158:
	.loc 1 684 0 is_stmt 1
	movl	$17, -12(%ebp)
L161:
	.loc 1 687 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 688 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
LC69:
	.ascii "    - Watermark Lv.%u = %X\12\0"
	.text
	.globl	_Debug_PrintWatermarks
	.def	_Debug_PrintWatermarks;	.scl	2;	.type	32;	.endef
_Debug_PrintWatermarks:
LFB28:
	.loc 1 697 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 700 0
	movb	$0, -9(%ebp)
	jmp	L164
L165:
	.loc 1 702 0 discriminator 3
	movzbl	-9(%ebp), %eax
	movl	_gWatermarks(,%eax,4), %eax
	movzbl	-9(%ebp), %edx
	addl	$1, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$LC69, (%esp)
	call	_printf
	.loc 1 700 0 discriminator 3
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L164:
	.loc 1 700 0 is_stmt 0 discriminator 1
	cmpb	$2, -9(%ebp)
	jbe	L165
	.loc 1 704 0 is_stmt 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.section .rdata,"dr"
LC70:
	.ascii "\33[%u;%um\0"
	.text
	.globl	_Debug_SetTerminalAppearance
	.def	_Debug_SetTerminalAppearance;	.scl	2;	.type	32;	.endef
_Debug_SetTerminalAppearance:
LFB29:
	.loc 1 716 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 717 0
	movl	$0, %eax
	testb	%al, %al
	je	L168
	.loc 1 719 0
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC70, (%esp)
	call	_printf
L168:
	.loc 1 721 0
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.section .rdata,"dr"
LC71:
	.ascii "\33[%um\0"
	.text
	.globl	_Debug_ResetTerminalAppearance
	.def	_Debug_ResetTerminalAppearance;	.scl	2;	.type	32;	.endef
_Debug_ResetTerminalAppearance:
LFB30:
	.loc 1 730 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 731 0
	movl	$0, %eax
	testb	%al, %al
	je	L171
	.loc 1 733 0
	movl	$0, 4(%esp)
	movl	$LC71, (%esp)
	call	_printf
L171:
	.loc 1 735 0
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.def	_IsOrgLenValid;	.scl	3;	.type	32;	.endef
_IsOrgLenValid:
LFB31:
	.loc 1 751 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 752 0
	movl	$1, 4(%esp)
	movl	$_IsOrgLenValid, (%esp)
	call	_Debug_SetWatermark
	.loc 1 754 0
	movb	$0, -9(%ebp)
	.loc 1 755 0
	movl	8(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -16(%ebp)
	.loc 1 756 0
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
	.loc 1 757 0
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
	.loc 1 759 0
	cmpl	$0, 8(%ebp)
	je	L173
	.loc 1 760 0 discriminator 1
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
	.loc 1 759 0 discriminator 1
	testl	%eax, %eax
	jne	L173
	.loc 1 761 0
	movl	12(%ebp), %eax
	movl	40(%eax), %ecx
	movl	-20(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 760 0
	testl	%eax, %eax
	jne	L173
	.loc 1 762 0
	movl	-24(%ebp), %eax
	andl	$7, %eax
	.loc 1 761 0
	testl	%eax, %eax
	jne	L173
	.loc 1 763 0
	movl	12(%ebp), %eax
	movzbl	61(%eax), %eax
	movzbl	%al, %ecx
	movl	-24(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	.loc 1 762 0
	testl	%eax, %eax
	jne	L173
	.loc 1 765 0
	movb	$1, -9(%ebp)
L173:
	.loc 1 768 0
	movzbl	-9(%ebp), %eax
	.loc 1 769 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/system.h"
	.file 7 "src/error.h"
	.file 8 "src/memory.h"
	.file 9 "src/channel.h"
	.file 10 "src/convolutional.h"
	.file 11 "src/interleaving.h"
	.file 12 "src/modulation.h"
	.file 13 "src/reed_solomon.h"
	.file 14 "src/scrambling.h"
	.file 15 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x172f
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
	.byte	0x3b
	.long	0x362
	.uleb128 0x4
	.ascii "re\0"
	.byte	0x6
	.byte	0x3d
	.long	0x362
	.byte	0
	.uleb128 0x4
	.ascii "im\0"
	.byte	0x6
	.byte	0x3e
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
	.byte	0x3f
	.long	0x338
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x7
	.byte	0x1c
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
	.byte	0x33
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
	.byte	0x1f
	.long	0x708
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
	.byte	0x9
	.byte	0x24
	.long	0x6d9
	.uleb128 0xf
	.byte	0x4
	.byte	0x9
	.byte	0x2c
	.long	0x73b
	.uleb128 0x10
	.ascii "Peb\0"
	.byte	0x9
	.byte	0x2e
	.long	0x362
	.uleb128 0x10
	.ascii "EbN0\0"
	.byte	0x9
	.byte	0x2f
	.long	0x362
	.byte	0
	.uleb128 0x3
	.ascii "_chan_par_t\0"
	.byte	0x10
	.byte	0x9
	.byte	0x27
	.long	0x77c
	.uleb128 0x4
	.ascii "seed\0"
	.byte	0x9
	.byte	0x29
	.long	0x1bd
	.byte	0
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x9
	.byte	0x2a
	.long	0x708
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0x9
	.byte	0x2b
	.long	0x180
	.byte	0x8
	.uleb128 0x11
	.long	0x71b
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "chan_par_t\0"
	.byte	0x9
	.byte	0x31
	.long	0x73b
	.uleb128 0xa
	.long	0x77c
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xa
	.byte	0x3f
	.long	0x7e1
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
	.byte	0xa
	.byte	0x41
	.long	0x793
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xa
	.byte	0x52
	.long	0x863
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
	.byte	0xa
	.byte	0x5b
	.long	0x7f2
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xa
	.byte	0x60
	.long	0x8b0
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
	.byte	0xa
	.byte	0x65
	.long	0x874
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0xa
	.byte	0x68
	.long	0x913
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0xa
	.byte	0x6a
	.long	0x7e1
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0xa
	.byte	0x6b
	.long	0x863
	.byte	0x4
	.uleb128 0x4
	.ascii "memFact\0"
	.byte	0xa
	.byte	0x6c
	.long	0x1ad
	.byte	0x8
	.uleb128 0x4
	.ascii "vitDM\0"
	.byte	0xa
	.byte	0x6d
	.long	0x8b0
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0xa
	.byte	0x6e
	.long	0x8c7
	.uleb128 0xa
	.long	0x913
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xb
	.byte	0x1f
	.long	0x95f
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
	.byte	0xb
	.byte	0x24
	.long	0x928
	.uleb128 0xf
	.byte	0x1
	.byte	0xb
	.byte	0x2a
	.long	0x993
	.uleb128 0x10
	.ascii "rows\0"
	.byte	0xb
	.byte	0x2c
	.long	0x180
	.uleb128 0x10
	.ascii "dlys\0"
	.byte	0xb
	.byte	0x2d
	.long	0x180
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.byte	0xb
	.byte	0x2f
	.long	0x9b5
	.uleb128 0x10
	.ascii "cols\0"
	.byte	0xb
	.byte	0x31
	.long	0x180
	.uleb128 0x10
	.ascii "cells\0"
	.byte	0xb
	.byte	0x32
	.long	0x180
	.byte	0
	.uleb128 0x3
	.ascii "_itlv_par_t\0"
	.byte	0x8
	.byte	0xb
	.byte	0x27
	.long	0x9e3
	.uleb128 0x4
	.ascii "type\0"
	.byte	0xb
	.byte	0x29
	.long	0x95f
	.byte	0
	.uleb128 0x11
	.long	0x972
	.byte	0x4
	.uleb128 0x11
	.long	0x993
	.byte	0x5
	.byte	0
	.uleb128 0x6
	.ascii "itlv_par_t\0"
	.byte	0xb
	.byte	0x34
	.long	0x9b5
	.uleb128 0xa
	.long	0x9e3
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xc
	.byte	0x1f
	.long	0xa25
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
	.byte	0xc
	.byte	0x24
	.long	0x9fa
	.uleb128 0x3
	.ascii "_mod_par_t\0"
	.byte	0xc
	.byte	0xc
	.byte	0x4b
	.long	0xa81
	.uleb128 0x4
	.ascii "type\0"
	.byte	0xc
	.byte	0x4d
	.long	0xa25
	.byte	0
	.uleb128 0x4
	.ascii "order\0"
	.byte	0xc
	.byte	0x4e
	.long	0x180
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0xc
	.byte	0x4f
	.long	0x180
	.byte	0x5
	.uleb128 0x4
	.ascii "phOfst\0"
	.byte	0xc
	.byte	0x50
	.long	0x362
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "mod_par_t\0"
	.byte	0xc
	.byte	0x51
	.long	0xa37
	.uleb128 0xa
	.long	0xa81
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xd
	.byte	0x1f
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
	.byte	0x22
	.long	0xa97
	.uleb128 0x3
	.ascii "_rs_par_t\0"
	.byte	0x10
	.byte	0xd
	.byte	0x34
	.long	0xb41
	.uleb128 0x4
	.ascii "m\0"
	.byte	0xd
	.byte	0x36
	.long	0xac6
	.byte	0
	.uleb128 0x4
	.ascii "kSh\0"
	.byte	0xd
	.byte	0x37
	.long	0x180
	.byte	0x4
	.uleb128 0x4
	.ascii "nSh\0"
	.byte	0xd
	.byte	0x38
	.long	0x180
	.byte	0x5
	.uleb128 0x4
	.ascii "t\0"
	.byte	0xd
	.byte	0x39
	.long	0x180
	.byte	0x6
	.uleb128 0x4
	.ascii "kUn\0"
	.byte	0xd
	.byte	0x3a
	.long	0x1ad
	.byte	0x8
	.uleb128 0x4
	.ascii "nUn\0"
	.byte	0xd
	.byte	0x3b
	.long	0x1ad
	.byte	0xa
	.uleb128 0x4
	.ascii "dimGF\0"
	.byte	0xd
	.byte	0x3c
	.long	0x1ad
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "rs_par_t\0"
	.byte	0xd
	.byte	0x3d
	.long	0xadc
	.uleb128 0xa
	.long	0xb41
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xe
	.byte	0x1f
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
	.byte	0x24
	.long	0xb56
	.uleb128 0x3
	.ascii "_scr_par_t\0"
	.byte	0x10
	.byte	0xe
	.byte	0x27
	.long	0xbee
	.uleb128 0x4
	.ascii "type\0"
	.byte	0xe
	.byte	0x29
	.long	0xb8a
	.byte	0
	.uleb128 0x4
	.ascii "nCells\0"
	.byte	0xe
	.byte	0x2a
	.long	0x180
	.byte	0x4
	.uleb128 0x4
	.ascii "conVect\0"
	.byte	0xe
	.byte	0x2b
	.long	0x1bd
	.byte	0x8
	.uleb128 0x4
	.ascii "initSt\0"
	.byte	0xe
	.byte	0x2c
	.long	0x1bd
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "scr_par_t\0"
	.byte	0xe
	.byte	0x2d
	.long	0xb9f
	.uleb128 0xa
	.long	0xbee
	.uleb128 0x3
	.ascii "_debug_par_t\0"
	.byte	0x54
	.byte	0xf
	.byte	0x34
	.long	0xc74
	.uleb128 0x4
	.ascii "scrPar\0"
	.byte	0xf
	.byte	0x36
	.long	0xbee
	.byte	0
	.uleb128 0x4
	.ascii "rsPar\0"
	.byte	0xf
	.byte	0x37
	.long	0xb41
	.byte	0x10
	.uleb128 0x4
	.ascii "itlvPar\0"
	.byte	0xf
	.byte	0x38
	.long	0x9e3
	.byte	0x20
	.uleb128 0x4
	.ascii "ccPar\0"
	.byte	0xf
	.byte	0x39
	.long	0x913
	.byte	0x28
	.uleb128 0x4
	.ascii "modPar\0"
	.byte	0xf
	.byte	0x3a
	.long	0xa81
	.byte	0x38
	.uleb128 0x4
	.ascii "chanPar\0"
	.byte	0xf
	.byte	0x3b
	.long	0x77c
	.byte	0x44
	.byte	0
	.uleb128 0x6
	.ascii "debug_par_t\0"
	.byte	0xf
	.byte	0x3c
	.long	0xc04
	.uleb128 0xa
	.long	0xc74
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0xf
	.byte	0x40
	.long	0xd74
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
	.byte	0x52
	.long	0xc8c
	.uleb128 0x12
	.ascii "_wm_level_t\0"
	.byte	0x4
	.long	0x6f
	.byte	0xf
	.byte	0x55
	.long	0xdd8
	.uleb128 0xe
	.ascii "WM_LEVEL_1\0"
	.byte	0
	.uleb128 0xe
	.ascii "WM_LEVEL_2\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "WM_LEVEL_3\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "WM_LEVEL_NUM\0"
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.ascii "wm_level_t\0"
	.byte	0xf
	.byte	0x5c
	.long	0xd89
	.uleb128 0xa
	.long	0xdd8
	.uleb128 0x12
	.ascii "_ansi_text_color\0"
	.byte	0x4
	.long	0x6f
	.byte	0xf
	.byte	0x5f
	.long	0xf19
	.uleb128 0xe
	.ascii "COLOR_BLACK\0"
	.byte	0x1e
	.uleb128 0xe
	.ascii "COLOR_RED\0"
	.byte	0x1f
	.uleb128 0xe
	.ascii "COLOR_GREEN\0"
	.byte	0x20
	.uleb128 0xe
	.ascii "COLOR_YELLOW\0"
	.byte	0x21
	.uleb128 0xe
	.ascii "COLOR_BLUE\0"
	.byte	0x22
	.uleb128 0xe
	.ascii "COLOR_PURPLE\0"
	.byte	0x23
	.uleb128 0xe
	.ascii "COLOR_CYAN\0"
	.byte	0x24
	.uleb128 0xe
	.ascii "COLOR_WHITE\0"
	.byte	0x25
	.uleb128 0xe
	.ascii "COLOR_GREY\0"
	.byte	0x5a
	.uleb128 0xe
	.ascii "COLOR_BRIGHT_RED\0"
	.byte	0x5b
	.uleb128 0xe
	.ascii "COLOR_BRIGHT_GREEN\0"
	.byte	0x5c
	.uleb128 0xe
	.ascii "COLOR_BRIGHT_YELLOW\0"
	.byte	0x5d
	.uleb128 0xe
	.ascii "COLOR_BRIGHT_BLUE\0"
	.byte	0x5e
	.uleb128 0xe
	.ascii "COLOR_BRIGHT_PURPLE\0"
	.byte	0x5f
	.uleb128 0xe
	.ascii "COLOR_BRIGHT_CYAN\0"
	.byte	0x60
	.uleb128 0xe
	.ascii "COLOR_BRIGHT_WHITE\0"
	.byte	0x61
	.byte	0
	.uleb128 0x6
	.ascii "ansi_text_color\0"
	.byte	0xf
	.byte	0x71
	.long	0xdef
	.uleb128 0x12
	.ascii "_ansi_text_style\0"
	.byte	0x4
	.long	0x6f
	.byte	0xf
	.byte	0x74
	.long	0xfd0
	.uleb128 0xe
	.ascii "STYLE_RESET\0"
	.byte	0
	.uleb128 0xe
	.ascii "STYLE_BOLD\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "STYLE_ITALIC\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "STYLE_SINGLE_UNDERLINE\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "STYLE_SLOW_BLINK\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "STYLE_FAST_BLINK\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "STYLE_DOUBLE_UNDERLINE\0"
	.byte	0x15
	.byte	0
	.uleb128 0x6
	.ascii "ansi_text_style\0"
	.byte	0xf
	.byte	0x7d
	.long	0xf30
	.uleb128 0x7
	.long	0x1bd
	.long	0xff7
	.uleb128 0xc
	.long	0x2d2
	.byte	0x2
	.byte	0
	.uleb128 0x13
	.ascii "gWatermarks\0"
	.byte	0x1
	.byte	0x19
	.long	0xfe7
	.uleb128 0x5
	.byte	0x3
	.long	_gWatermarks
	.uleb128 0x13
	.ascii "bShAppChgEnabled\0"
	.byte	0x1
	.byte	0x1a
	.long	0x1037
	.uleb128 0x5
	.byte	0x3
	.long	_bShAppChgEnabled
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0xa
	.long	0x102e
	.uleb128 0x14
	.ascii "IsOrgLenValid\0"
	.byte	0x1
	.word	0x2ee
	.long	0x102e
	.long	LFB31
	.long	LFE31-LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x10d4
	.uleb128 0x15
	.ascii "orgLenBy\0"
	.byte	0x1
	.word	0x2ee
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "dbgParams\0"
	.byte	0x1
	.word	0x2ee
	.long	0x10d4
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.ascii "bRet\0"
	.byte	0x1
	.word	0x2f2
	.long	0x102e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x16
	.ascii "orgLenBi\0"
	.byte	0x1
	.word	0x2f3
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "rsLenBi\0"
	.byte	0x1
	.word	0x2f4
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "ccLenBi\0"
	.byte	0x1
	.word	0x2f5
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xc87
	.uleb128 0x17
	.ascii "Debug_ResetTerminalAppearance\0"
	.byte	0x1
	.word	0x2d9
	.long	LFB30
	.long	LFE30-LFB30
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.ascii "Debug_SetTerminalAppearance\0"
	.byte	0x1
	.word	0x2cb
	.long	LFB29
	.long	LFE29-LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x1157
	.uleb128 0x15
	.ascii "color\0"
	.byte	0x1
	.word	0x2cb
	.long	0xf19
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "style\0"
	.byte	0x1
	.word	0x2cb
	.long	0xfd0
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x18
	.ascii "Debug_PrintWatermarks\0"
	.byte	0x1
	.word	0x2b8
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x118f
	.uleb128 0x16
	.ascii "lev\0"
	.byte	0x1
	.word	0x2ba
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x19
	.ascii "Debug_SetWatermark\0"
	.byte	0x1
	.word	0x29c
	.long	0x54f
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x11fa
	.uleb128 0x15
	.ascii "funcAddr\0"
	.byte	0x1
	.word	0x29c
	.long	0x11fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "level\0"
	.byte	0x1
	.word	0x29c
	.long	0xdea
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.word	0x29e
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x29f
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x1200
	.uleb128 0x1b
	.uleb128 0x19
	.ascii "Debug_WriteComplexStreamToCsv\0"
	.byte	0x1
	.word	0x264
	.long	0x54f
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x127f
	.uleb128 0x1c
	.secrel32	LASF1
	.byte	0x1
	.word	0x264
	.long	0x127f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.secrel32	LASF2
	.byte	0x1
	.word	0x264
	.long	0xd74
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.word	0x268
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "fid\0"
	.byte	0x1
	.word	0x269
	.long	0x1285
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x26a
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
	.uleb128 0x19
	.ascii "Debug_WriteByteStreamToCsv\0"
	.byte	0x1
	.word	0x224
	.long	0x54f
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x1306
	.uleb128 0x1c
	.secrel32	LASF1
	.byte	0x1
	.word	0x224
	.long	0x1306
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.secrel32	LASF2
	.byte	0x1
	.word	0x224
	.long	0xd74
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.word	0x228
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "fid\0"
	.byte	0x1
	.word	0x229
	.long	0x1285
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x22a
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x614
	.uleb128 0x19
	.ascii "Debug_CheckWrongBits\0"
	.byte	0x1
	.word	0x1c0
	.long	0x54f
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x1414
	.uleb128 0x15
	.ascii "inStreamA\0"
	.byte	0x1
	.word	0x1c0
	.long	0x1306
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "inStreamB\0"
	.byte	0x1
	.word	0x1c0
	.long	0x1306
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1c
	.secrel32	LASF2
	.byte	0x1
	.word	0x1c0
	.long	0xd74
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.secrel32	LASF3
	.byte	0x1
	.word	0x1c0
	.long	0x10d4
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.word	0x1c4
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "bitLen\0"
	.byte	0x1
	.word	0x1c5
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.ascii "bitErrCnt\0"
	.byte	0x1
	.word	0x1c6
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "minErrDist\0"
	.byte	0x1
	.word	0x1c7
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "curErrDist\0"
	.byte	0x1
	.word	0x1c8
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x1c9
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.ascii "byteIdx\0"
	.byte	0x1
	.word	0x1ca
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.ascii "bitIdx\0"
	.byte	0x1
	.word	0x1cb
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.byte	0
	.uleb128 0x19
	.ascii "Debug_PrintParameters\0"
	.byte	0x1
	.word	0x173
	.long	0x54f
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x1471
	.uleb128 0x15
	.ascii "orgLen\0"
	.byte	0x1
	.word	0x173
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.secrel32	LASF3
	.byte	0x1
	.word	0x173
	.long	0x10d4
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.word	0x177
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.ascii "Debug_PrintComplexStream\0"
	.byte	0x1
	.word	0x12c
	.long	0x54f
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x14ea
	.uleb128 0x1c
	.secrel32	LASF1
	.byte	0x1
	.word	0x12c
	.long	0x127f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.secrel32	LASF2
	.byte	0x1
	.word	0x12c
	.long	0xd74
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1c
	.secrel32	LASF3
	.byte	0x1
	.word	0x12c
	.long	0x10d4
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.word	0x130
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x131
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.ascii "Debug_PrintFloatStream\0"
	.byte	0x1
	.byte	0xe7
	.long	0x54f
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x155b
	.uleb128 0x1e
	.secrel32	LASF1
	.byte	0x1
	.byte	0xe7
	.long	0x155b
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1e
	.secrel32	LASF2
	.byte	0x1
	.byte	0xe7
	.long	0xd74
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1e
	.secrel32	LASF3
	.byte	0x1
	.byte	0xe7
	.long	0x10d4
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1f
	.secrel32	LASF0
	.byte	0x1
	.byte	0xeb
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.byte	0xec
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x672
	.uleb128 0x1d
	.ascii "Debug_PrintByteStream\0"
	.byte	0x1
	.byte	0x82
	.long	0x54f
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x15d1
	.uleb128 0x1e
	.secrel32	LASF1
	.byte	0x1
	.byte	0x82
	.long	0x1306
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1e
	.secrel32	LASF2
	.byte	0x1
	.byte	0x82
	.long	0xd74
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1e
	.secrel32	LASF3
	.byte	0x1
	.byte	0x82
	.long	0x10d4
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1f
	.secrel32	LASF0
	.byte	0x1
	.byte	0x86
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.byte	0x87
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.ascii "Debug_GenerateRandomBytes\0"
	.byte	0x1
	.byte	0x59
	.long	0x54f
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x163e
	.uleb128 0x20
	.ascii "ioStream\0"
	.byte	0x1
	.byte	0x59
	.long	0x163e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.ascii "pSeed\0"
	.byte	0x1
	.byte	0x59
	.long	0x1644
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.byte	0x5d
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1f
	.secrel32	LASF0
	.byte	0x1
	.byte	0x5e
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
	.uleb128 0x1d
	.ascii "Debug_ListParameters\0"
	.byte	0x1
	.byte	0x37
	.long	0x54f
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x1708
	.uleb128 0x20
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x37
	.long	0x1708
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.ascii "scrParam\0"
	.byte	0x1
	.byte	0x37
	.long	0x170e
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x20
	.ascii "rsParam\0"
	.byte	0x1
	.byte	0x37
	.long	0x1714
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x20
	.ascii "itlvParam\0"
	.byte	0x1
	.byte	0x37
	.long	0x171a
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x20
	.ascii "ccParam\0"
	.byte	0x1
	.byte	0x38
	.long	0x1720
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x20
	.ascii "modParam\0"
	.byte	0x1
	.byte	0x38
	.long	0x1726
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x20
	.ascii "chanParam\0"
	.byte	0x1
	.byte	0x38
	.long	0x172c
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x1f
	.secrel32	LASF0
	.byte	0x1
	.byte	0x3c
	.long	0x54f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xc74
	.uleb128 0x5
	.byte	0x4
	.long	0xbff
	.uleb128 0x5
	.byte	0x4
	.long	0xb51
	.uleb128 0x5
	.byte	0x4
	.long	0x9f5
	.uleb128 0x5
	.byte	0x4
	.long	0x923
	.uleb128 0x5
	.byte	0x4
	.long	0xa92
	.uleb128 0x5
	.byte	0x4
	.long	0x78e
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
	.byte	0
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
LASF3:
	.ascii "pParams\0"
LASF1:
	.ascii "inStream\0"
LASF0:
	.ascii "retErr\0"
LASF2:
	.ascii "label\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_Memory_IsStreamValid;	.scl	2;	.type	32;	.endef
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
