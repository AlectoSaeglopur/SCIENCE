	.file	"convolutional.c"
	.text
Ltext0:
	.globl	_CC_RATE_ARRAY
	.section .rdata,"dr"
	.align 4
_CC_RATE_ARRAY:
	.long	1
	.long	2
	.long	3
	.long	5
	.long	7
	.text
	.globl	_CnvCod_ListParameters
	.def	_CnvCod_ListParameters;	.scl	2;	.type	32;	.endef
_CnvCod_ListParameters:
LFB18:
	.file 1 "src/convolutional.c"
	.loc 1 56 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 57 0
	movl	$0, -12(%ebp)
	.loc 1 59 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 61 0
	movl	8(%ebp), %eax
	movl	$2, (%eax)
	.loc 1 62 0
	movl	8(%ebp), %eax
	movl	$7, 4(%eax)
	.loc 1 63 0
	movl	8(%ebp), %eax
	movw	$10, 8(%eax)
	.loc 1 64 0
	movl	8(%ebp), %eax
	movl	$0, 12(%eax)
	jmp	L3
L2:
	.loc 1 68 0
	movl	$1, -12(%ebp)
L3:
	.loc 1 71 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 72 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC0:
	.ascii "CHECK %d\12\0"
	.text
	.globl	_CnvCod_GetConnectorPuncturationVectors
	.def	_CnvCod_GetConnectorPuncturationVectors;	.scl	2;	.type	32;	.endef
_CnvCod_GetConnectorPuncturationVectors:
LFB19:
	.loc 1 84 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	.loc 1 85 0
	movl	$0, -12(%ebp)
	.loc 1 87 0
	cmpl	$0, 8(%ebp)
	je	L6
	.loc 1 87 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L6
	.loc 1 89 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_IsKlenValid
	testb	%al, %al
	je	L7
	.loc 1 92 0
	movb	$7, -58(%ebp)
	movb	$5, -57(%ebp)
	movb	$15, -56(%ebp)
	movb	$11, -55(%ebp)
	movb	$23, -54(%ebp)
	movb	$25, -53(%ebp)
	movb	$47, -52(%ebp)
	movb	$53, -51(%ebp)
	movb	$79, -50(%ebp)
	movb	$109, -49(%ebp)
	movb	$-97, -48(%ebp)
	movb	$-27, -47(%ebp)
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	leal	-3(%eax), %edx
	leal	-58(%ebp), %eax
	addl	%edx, %edx
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movzwl	(%edx), %edx
	movw	%dx, (%eax)
	jmp	L8
L7:
	.loc 1 96 0
	movl	$4, -12(%ebp)
L8:
	.loc 1 99 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_IsRateValid
	testb	%al, %al
	je	L9
	.loc 1 101 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	L11
	cmpl	$3, %eax
	ja	L12
	cmpl	$2, %eax
	je	L13
	.loc 1 121 0
	jmp	L17
L12:
	.loc 1 101 0
	cmpl	$5, %eax
	je	L14
	cmpl	$7, %eax
	je	L15
	.loc 1 121 0
	jmp	L17
L13:
	.loc 1 104 0
	movb	$1, -46(%ebp)
	movb	$1, -45(%ebp)
	movb	$0, -44(%ebp)
	movb	$1, -43(%ebp)
	movl	8(%ebp), %eax
	leal	2(%eax), %edx
	movl	-46(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 105 0
	jmp	L17
L11:
	.loc 1 108 0
	movb	$1, -42(%ebp)
	movb	$1, -41(%ebp)
	movb	$0, -40(%ebp)
	movb	$1, -39(%ebp)
	movb	$1, -38(%ebp)
	movb	$0, -37(%ebp)
	movl	8(%ebp), %eax
	leal	2(%eax), %edx
	movl	-42(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 109 0
	jmp	L17
L14:
	.loc 1 112 0
	movb	$1, -36(%ebp)
	movb	$1, -35(%ebp)
	movb	$0, -34(%ebp)
	movb	$1, -33(%ebp)
	movb	$1, -32(%ebp)
	movb	$0, -31(%ebp)
	movb	$0, -30(%ebp)
	movb	$1, -29(%ebp)
	movb	$1, -28(%ebp)
	movb	$0, -27(%ebp)
	movl	8(%ebp), %eax
	leal	2(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 113 0
	jmp	L17
L15:
	.loc 1 116 0
	movb	$1, -26(%ebp)
	movb	$1, -25(%ebp)
	movb	$0, -24(%ebp)
	movb	$1, -23(%ebp)
	movb	$0, -22(%ebp)
	movb	$1, -21(%ebp)
	movb	$0, -20(%ebp)
	movb	$1, -19(%ebp)
	movb	$1, -18(%ebp)
	movb	$0, -17(%ebp)
	movb	$0, -16(%ebp)
	movb	$1, -15(%ebp)
	movb	$1, -14(%ebp)
	movb	$0, -13(%ebp)
	movl	8(%ebp), %eax
	leal	2(%eax), %edx
	movl	-26(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 117 0
	jmp	L17
L9:
	.loc 1 126 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	.loc 1 127 0
	movl	$3, -12(%ebp)
	.loc 1 99 0
	jmp	L18
L17:
	.loc 1 99 0 is_stmt 0 discriminator 2
	jmp	L18
L6:
	.loc 1 132 0 is_stmt 1
	movl	$1, -12(%ebp)
L18:
	.loc 1 135 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 136 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_CnvCod_Encoder
	.def	_CnvCod_Encoder;	.scl	2;	.type	32;	.endef
_CnvCod_Encoder:
LFB20:
	.loc 1 153 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$64, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 154 0
	movl	$0, -12(%ebp)
	.loc 1 155 0
	movl	12(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, -28(%ebp)
	.loc 1 156 0
	movl	-28(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 157 0
	movl	12(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 158 0
	movl	$0, -16(%ebp)
	.loc 1 161 0
	movb	$0, -21(%ebp)
	.loc 1 165 0
	cmpl	$0, 8(%ebp)
	jne	L21
	.loc 1 165 0 is_stmt 0 discriminator 1
	cmpl	$0, 16(%ebp)
	jne	L21
	.loc 1 165 0 discriminator 2
	cmpl	$0, 24(%ebp)
	jne	L21
	.loc 1 165 0 discriminator 3
	cmpl	$0, 28(%ebp)
	je	L22
L21:
	.loc 1 167 0 is_stmt 1
	movl	20(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jne	L23
	.loc 1 169 0
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 171 0
	movl	$0, -20(%ebp)
	jmp	L24
L25:
	.loc 1 173 0 discriminator 3
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -40(%ebp)
	.loc 1 174 0 discriminator 3
	movl	-20(%ebp), %eax
	andl	$7, %eax
	movb	%al, -41(%ebp)
	.loc 1 175 0 discriminator 3
	shrb	-21(%ebp)
	.loc 1 176 0 discriminator 3
	movl	8(%ebp), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-41(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movl	%eax, %edx
	.loc 1 177 0 discriminator 3
	movl	24(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	.loc 1 176 0 discriminator 3
	movl	%eax, %edx
	movzbl	-21(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -21(%ebp)
	.loc 1 178 0 discriminator 3
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	shrl	$3, %eax
	movl	%eax, -40(%ebp)
	.loc 1 179 0 discriminator 3
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	andl	$6, %eax
	movb	%al, -41(%ebp)
	.loc 1 180 0 discriminator 3
	movl	24(%ebp), %eax
	movl	4(%eax), %ecx
	movl	28(%ebp), %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-21(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movzbl	%al, %edx
	.loc 1 181 0 discriminator 3
	movzbl	-41(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	.loc 1 180 0 discriminator 3
	movl	16(%ebp), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	movl	16(%ebp), %ecx
	movl	-40(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %ecx
	movl	%ebx, %edx
	orl	%ecx, %edx
	movb	%dl, (%eax)
	.loc 1 182 0 discriminator 3
	movl	24(%ebp), %eax
	movl	4(%eax), %ecx
	movl	28(%ebp), %eax
	movzbl	1(%eax), %eax
	movzbl	%al, %edx
	movzbl	-21(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movzbl	%al, %edx
	.loc 1 183 0 discriminator 3
	movzbl	-41(%ebp), %eax
	movl	$6, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	.loc 1 182 0 discriminator 3
	movl	16(%ebp), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	movl	16(%ebp), %ecx
	movl	-40(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %ecx
	movl	%ebx, %edx
	orl	%ecx, %edx
	movb	%dl, (%eax)
	.loc 1 171 0 discriminator 3
	addl	$1, -20(%ebp)
L24:
	.loc 1 171 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L25
	.loc 1 185 0 is_stmt 1
	movl	32(%ebp), %eax
	movl	20(%ebp), %edx
	movl	%edx, (%eax)
	.loc 1 186 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L34
	.loc 1 188 0
	movl	$0, -20(%ebp)
	jmp	L27
L30:
	.loc 1 190 0
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -40(%ebp)
	.loc 1 191 0
	movl	-20(%ebp), %eax
	andl	$7, %eax
	movb	%al, -41(%ebp)
	.loc 1 192 0
	movl	16(%ebp), %edx
	movl	-40(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-41(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movb	%al, -42(%ebp)
	.loc 1 193 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	-20(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	28(%ebp), %eax
	movzbl	2(%eax,%edx), %eax
	testb	%al, %al
	je	L28
	.loc 1 195 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -40(%ebp)
	.loc 1 196 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -41(%ebp)
	.loc 1 197 0
	addl	$1, -16(%ebp)
	.loc 1 198 0
	cmpb	$0, -42(%ebp)
	jne	L29
	.loc 1 200 0
	movl	16(%ebp), %edx
	movl	-40(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %ecx
	movl	-40(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-41(%ebp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	notl	%eax
	andl	%ebx, %eax
	movb	%al, (%edx)
	jmp	L28
L29:
	.loc 1 204 0
	movl	16(%ebp), %edx
	movl	-40(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %ecx
	movl	-40(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-41(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
L28:
	.loc 1 188 0 discriminator 2
	addl	$1, -20(%ebp)
L27:
	.loc 1 188 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L30
	.loc 1 208 0 is_stmt 1
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, %edx
	movl	32(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 167 0
	jmp	L34
L23:
	.loc 1 213 0
	movl	$5, -12(%ebp)
	.loc 1 167 0
	jmp	L34
L22:
	.loc 1 218 0
	movl	$1, -12(%ebp)
	jmp	L32
L34:
	.loc 1 167 0
	nop
L32:
	.loc 1 221 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 222 0
	addl	$64, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_CnvCod_HardDecoder
	.def	_CnvCod_HardDecoder;	.scl	2;	.type	32;	.endef
_CnvCod_HardDecoder:
LFB21:
	.loc 1 234 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	movl	$83280, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 235 0
	movl	$0, -12(%ebp)
	.loc 1 236 0
	leal	-41528(%ebp), %eax
	movl	$41472, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 239 0
	movl	20(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 240 0
	movl	12(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 251 0
	cmpl	$0, 8(%ebp)
	je	L36
	.loc 1 251 0 is_stmt 0 discriminator 1
	cmpl	$0, 16(%ebp)
	je	L36
	.loc 1 253 0 is_stmt 1
	movl	28(%ebp), %eax
	movl	24(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	leal	-83256(%ebp), %eax
	movl	%eax, (%esp)
	call	_ComputeTrellisDiagram
	.loc 1 254 0
	movl	$1, -41528(%ebp)
	.loc 1 256 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L37
	.loc 1 258 0
	movb	$3, -27(%ebp)
	jmp	L38
L37:
	.loc 1 262 0
	movl	28(%ebp), %eax
	leal	2(%eax), %ecx
	movl	-32(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_HardDepuncturer
L38:
	.loc 1 265 0
	movl	$2, -24(%ebp)
	jmp	L39
L72:
	.loc 1 267 0
	movl	-24(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -40(%ebp)
	.loc 1 268 0
	movl	-40(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -44(%ebp)
	.loc 1 269 0
	movl	-40(%ebp), %eax
	andl	$7, %eax
	movb	%al, -45(%ebp)
	.loc 1 270 0
	movl	8(%ebp), %edx
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-45(%ebp), %eax
	movl	$6, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$3, %eax
	movb	%al, -46(%ebp)
	.loc 1 271 0
	leal	-83000(%ebp), %eax
	leal	-41528(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 272 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L40
	.loc 1 274 0
	movb	$0, -27(%ebp)
	.loc 1 275 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	-40(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	28(%ebp), %eax
	movzbl	2(%eax,%edx), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movzbl	-27(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -27(%ebp)
	.loc 1 276 0
	movl	-40(%ebp), %eax
	leal	1(%eax), %edx
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	movl	28(%ebp), %eax
	movzbl	2(%eax,%edx), %eax
	orb	%al, -27(%ebp)
L40:
	.loc 1 278 0
	movb	$0, -28(%ebp)
	jmp	L41
L55:
	.loc 1 280 0
	movzbl	-28(%ebp), %eax
	movl	-83000(%ebp,%eax,4), %eax
	movl	-24(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L42
	.loc 1 282 0
	movb	$0, -26(%ebp)
	jmp	L43
L54:
	.loc 1 284 0
	movzbl	-28(%ebp), %edx
	movzbl	-26(%ebp), %eax
	sall	$2, %edx
	leal	-8(%ebp), %esi
	addl	%esi, %edx
	addl	%edx, %eax
	subl	$83248, %eax
	movzbl	(%eax), %eax
	xorb	-46(%ebp), %al
	andb	-27(%ebp), %al
	movzbl	%al, %eax
	movl	%eax, (%esp)
	call	_CountByteOnes
	movb	%al, -47(%ebp)
	.loc 1 285 0
	movzbl	-28(%ebp), %edx
	movzbl	-26(%ebp), %eax
	sall	$2, %edx
	leal	-8(%ebp), %ebx
	addl	%ebx, %edx
	addl	%edx, %eax
	subl	$83246, %eax
	movzbl	(%eax), %eax
	movb	%al, -48(%ebp)
	.loc 1 286 0
	movzbl	-48(%ebp), %eax
	movl	-41528(%ebp,%eax,4), %eax
	cmpl	-24(%ebp), %eax
	jnb	L44
	.loc 1 288 0
	movzbl	-48(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, -41528(%ebp,%eax,4)
	.loc 1 289 0
	movzbl	-48(%ebp), %eax
	movzbl	-28(%ebp), %edx
	addl	$64, %edx
	movl	-83000(%ebp,%edx,4), %ecx
	movzbl	-47(%ebp), %edx
	addl	%ecx, %edx
	addl	$64, %eax
	movl	%edx, -41528(%ebp,%eax,4)
	.loc 1 290 0
	movl	-24(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L45
	.loc 1 292 0
	movl	-24(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -20(%ebp)
	jmp	L46
L45:
	.loc 1 296 0
	movl	$639, -20(%ebp)
L46:
	.loc 1 298 0
	movl	$0, -16(%ebp)
	jmp	L47
L48:
	.loc 1 300 0 discriminator 3
	movzbl	-48(%ebp), %edx
	movzbl	-28(%ebp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %ecx
	movl	-16(%ebp), %eax
	addl	%ecx, %eax
	subl	$82480, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	subl	$41008, %eax
	movb	%cl, (%eax)
	.loc 1 298 0 discriminator 3
	addl	$1, -16(%ebp)
L47:
	.loc 1 298 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L48
	.loc 1 302 0 is_stmt 1
	movzbl	-48(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	leal	-41008(%eax), %edx
	movzbl	-28(%ebp), %eax
	movb	%al, (%edx)
	jmp	L49
L44:
	.loc 1 306 0
	movzbl	-28(%ebp), %eax
	addl	$64, %eax
	movl	-83000(%ebp,%eax,4), %edx
	movzbl	-47(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -52(%ebp)
	.loc 1 307 0
	movzbl	-48(%ebp), %eax
	addl	$64, %eax
	movl	-41528(%ebp,%eax,4), %eax
	cmpl	-52(%ebp), %eax
	jbe	L49
	.loc 1 309 0
	movzbl	-48(%ebp), %eax
	leal	64(%eax), %edx
	movl	-52(%ebp), %eax
	movl	%eax, -41528(%ebp,%edx,4)
	.loc 1 310 0
	movl	-24(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L50
	.loc 1 312 0
	movl	-24(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -20(%ebp)
	jmp	L51
L50:
	.loc 1 316 0
	movl	$639, -20(%ebp)
L51:
	.loc 1 318 0
	movl	$0, -16(%ebp)
	jmp	L52
L53:
	.loc 1 320 0 discriminator 3
	movzbl	-48(%ebp), %edx
	movzbl	-28(%ebp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %ebx
	leal	(%ebx,%eax), %ecx
	movl	-16(%ebp), %eax
	addl	%ecx, %eax
	subl	$82480, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	subl	$41008, %eax
	movb	%cl, (%eax)
	.loc 1 318 0 discriminator 3
	addl	$1, -16(%ebp)
L52:
	.loc 1 318 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L53
	.loc 1 322 0 is_stmt 1
	movzbl	-48(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	leal	-41008(%eax), %edx
	movzbl	-28(%ebp), %eax
	movb	%al, (%edx)
L49:
	.loc 1 282 0 discriminator 2
	movzbl	-26(%ebp), %eax
	addl	$1, %eax
	movb	%al, -26(%ebp)
L43:
	.loc 1 282 0 is_stmt 0 discriminator 1
	cmpb	$1, -26(%ebp)
	jbe	L54
L42:
	.loc 1 278 0 is_stmt 1 discriminator 2
	movzbl	-28(%ebp), %eax
	addl	$1, %eax
	movb	%al, -28(%ebp)
L41:
	.loc 1 278 0 is_stmt 0 discriminator 1
	cmpb	$63, -28(%ebp)
	jbe	L55
	.loc 1 329 0 is_stmt 1
	movl	-24(%ebp), %eax
	subl	$1, %eax
	cmpl	-32(%ebp), %eax
	jne	L56
	.loc 1 331 0
	leal	-41528(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathHard
	movb	%al, -53(%ebp)
	.loc 1 332 0
	movl	-24(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L57
	.loc 1 334 0
	movl	$640, -20(%ebp)
	jmp	L58
L57:
	.loc 1 338 0
	movl	-24(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -20(%ebp)
L58:
	.loc 1 340 0
	movl	$0, -16(%ebp)
	jmp	L59
L64:
	.loc 1 342 0
	movzbl	-53(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	subl	$41008, %eax
	movzbl	(%eax), %eax
	movb	%al, -54(%ebp)
	.loc 1 343 0
	movl	-20(%ebp), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jne	L60
	.loc 1 345 0
	movzbl	-53(%ebp), %eax
	movb	%al, -25(%ebp)
	jmp	L61
L60:
	.loc 1 349 0
	movzbl	-53(%ebp), %edx
	movl	-16(%ebp), %eax
	leal	1(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %ebx
	addl	%ebx, %eax
	addl	%ecx, %eax
	subl	$41008, %eax
	movzbl	(%eax), %eax
	movb	%al, -25(%ebp)
L61:
	.loc 1 351 0
	movl	-32(%ebp), %eax
	subl	-20(%ebp), %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, -44(%ebp)
	.loc 1 352 0
	movl	-32(%ebp), %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	subl	%eax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	andl	$7, %eax
	movb	%al, -45(%ebp)
	.loc 1 353 0
	movzbl	-54(%ebp), %eax
	movzbl	-83254(%ebp,%eax,4), %eax
	cmpb	-25(%ebp), %al
	jne	L62
	.loc 1 355 0
	movl	16(%ebp), %edx
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	movl	16(%ebp), %ecx
	movl	-44(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %ebx
	movzbl	-45(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	$1, %esi
	movl	%edx, %ecx
	sall	%cl, %esi
	movl	%esi, %edx
	notl	%edx
	andl	%ebx, %edx
	movb	%dl, (%eax)
	jmp	L63
L62:
	.loc 1 359 0
	movl	16(%ebp), %edx
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	movl	16(%ebp), %ecx
	movl	-44(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %esi
	movzbl	-45(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	$1, %ebx
	movl	%edx, %ecx
	sall	%cl, %ebx
	movl	%ebx, %edx
	orl	%esi, %edx
	movb	%dl, (%eax)
L63:
	.loc 1 340 0 discriminator 2
	addl	$1, -16(%ebp)
L59:
	.loc 1 340 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L64
	jmp	L65
L56:
	.loc 1 363 0 is_stmt 1
	movl	-24(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L65
	.loc 1 365 0
	leal	-41528(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathHard
	movb	%al, -53(%ebp)
	.loc 1 366 0
	movzbl	-53(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	addl	%esi, %eax
	subl	$41008, %eax
	movzbl	(%eax), %eax
	movb	%al, -54(%ebp)
	.loc 1 367 0
	movzbl	-53(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %ebx
	addl	%ebx, %eax
	subl	$41007, %eax
	movzbl	(%eax), %eax
	movb	%al, -25(%ebp)
	.loc 1 368 0
	movl	-24(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -44(%ebp)
	.loc 1 369 0
	movl	-24(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -45(%ebp)
	.loc 1 370 0
	movzbl	-54(%ebp), %eax
	movzbl	-83254(%ebp,%eax,4), %eax
	cmpb	-25(%ebp), %al
	jne	L66
	.loc 1 372 0
	movl	16(%ebp), %edx
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	movl	16(%ebp), %ecx
	movl	-44(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %ebx
	movzbl	-45(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	$1, %esi
	movl	%edx, %ecx
	sall	%cl, %esi
	movl	%esi, %edx
	notl	%edx
	andl	%ebx, %edx
	movb	%dl, (%eax)
	jmp	L67
L66:
	.loc 1 376 0
	movl	16(%ebp), %edx
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	movl	16(%ebp), %ecx
	movl	-44(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %esi
	movzbl	-45(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	$1, %ebx
	movl	%edx, %ecx
	sall	%cl, %ebx
	movl	%ebx, %edx
	orl	%esi, %edx
	movb	%dl, (%eax)
L67:
	.loc 1 378 0
	movb	$0, -28(%ebp)
	jmp	L68
L71:
	.loc 1 380 0
	movl	$0, -16(%ebp)
	jmp	L69
L70:
	.loc 1 382 0 discriminator 3
	movzbl	-28(%ebp), %edx
	movzbl	-28(%ebp), %ecx
	movl	-16(%ebp), %eax
	leal	1(%eax), %ebx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	addl	%esi, %eax
	addl	%ebx, %eax
	subl	$41008, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	subl	$41008, %eax
	movb	%cl, (%eax)
	.loc 1 380 0 discriminator 3
	addl	$1, -16(%ebp)
L69:
	.loc 1 380 0 is_stmt 0 discriminator 1
	cmpl	$638, -16(%ebp)
	jbe	L70
	.loc 1 378 0 is_stmt 1 discriminator 2
	movzbl	-28(%ebp), %eax
	addl	$1, %eax
	movb	%al, -28(%ebp)
L68:
	.loc 1 378 0 is_stmt 0 discriminator 1
	cmpb	$63, -28(%ebp)
	jbe	L71
L65:
	.loc 1 265 0 is_stmt 1 discriminator 2
	addl	$1, -24(%ebp)
L39:
	.loc 1 265 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	addl	$2, %eax
	cmpl	-24(%ebp), %eax
	ja	L72
	.loc 1 251 0 is_stmt 1
	jmp	L73
L36:
	.loc 1 390 0
	movl	$1, -12(%ebp)
L73:
	.loc 1 393 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 394 0
	addl	$83280, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.def	_IsRateValid;	.scl	3;	.type	32;	.endef
_IsRateValid:
LFB22:
	.loc 1 410 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 411 0
	movb	$0, -1(%ebp)
	.loc 1 414 0
	movb	$0, -2(%ebp)
	jmp	L76
L79:
	.loc 1 416 0
	movzbl	-2(%ebp), %eax
	movl	_CC_RATE_ARRAY(,%eax,4), %eax
	cmpl	8(%ebp), %eax
	jne	L77
	.loc 1 418 0
	movb	$1, -1(%ebp)
	.loc 1 419 0
	jmp	L78
L77:
	.loc 1 414 0 discriminator 2
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L76:
	.loc 1 414 0 is_stmt 0 discriminator 1
	cmpb	$4, -2(%ebp)
	jbe	L79
L78:
	.loc 1 423 0 is_stmt 1
	movzbl	-1(%ebp), %eax
	.loc 1 424 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_IsKlenValid;	.scl	3;	.type	32;	.endef
_IsKlenValid:
LFB23:
	.loc 1 435 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 438 0
	cmpl	$2, 8(%ebp)
	jbe	L82
	.loc 1 438 0 is_stmt 0 discriminator 1
	cmpl	$8, 8(%ebp)
	ja	L82
	.loc 1 438 0 discriminator 3
	movl	$1, %eax
	jmp	L83
L82:
	.loc 1 438 0 discriminator 4
	movl	$0, %eax
L83:
	.loc 1 438 0 discriminator 6
	movb	%al, -1(%ebp)
	andb	$1, -1(%ebp)
	.loc 1 440 0 is_stmt 1 discriminator 6
	movzbl	-1(%ebp), %eax
	.loc 1 441 0 discriminator 6
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	_ComputeEncBit;	.scl	3;	.type	32;	.endef
_ComputeEncBit:
LFB24:
	.loc 1 454 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$24, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movb	%dl, -24(%ebp)
	movb	%al, -28(%ebp)
	.loc 1 455 0
	movb	$0, -5(%ebp)
	.loc 1 458 0
	movb	$0, -6(%ebp)
	jmp	L86
L87:
	.loc 1 460 0 discriminator 3
	movzbl	-24(%ebp), %edx
	movzbl	-6(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %ebx
	movzbl	-28(%ebp), %edx
	movzbl	-6(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	%ebx, %eax
	andl	$1, %eax
	movl	%eax, %edx
	movzbl	-5(%ebp), %eax
	xorl	%edx, %eax
	movb	%al, -5(%ebp)
	.loc 1 458 0 discriminator 3
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L86:
	.loc 1 458 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %eax
	cmpl	16(%ebp), %eax
	jb	L87
	.loc 1 463 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 464 0
	addl	$24, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.def	_ComputeTrellisDiagram;	.scl	3;	.type	32;	.endef
_ComputeTrellisDiagram:
LFB25:
	.loc 1 477 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$104, %esp
	.loc 1 478 0
	movl	$0, -12(%ebp)
	.loc 1 484 0
	cmpl	$0, 8(%ebp)
	je	L90
	.loc 1 486 0
	movb	$0, -14(%ebp)
	jmp	L91
L92:
	.loc 1 488 0 discriminator 3
	movzbl	-14(%ebp), %eax
	movzbl	-14(%ebp), %edx
	movb	%dl, -81(%ebp,%eax)
	.loc 1 486 0 discriminator 3
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L91:
	.loc 1 486 0 is_stmt 0 discriminator 1
	cmpb	$63, -14(%ebp)
	jbe	L92
	.loc 1 490 0 is_stmt 1
	movb	$0, -14(%ebp)
	jmp	L93
L102:
	.loc 1 492 0
	movzbl	-14(%ebp), %eax
	movzbl	-81(%ebp,%eax), %eax
	movb	%al, -15(%ebp)
	.loc 1 493 0
	movb	$0, -13(%ebp)
	jmp	L94
L97:
	.loc 1 495 0
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	movzbl	-13(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-15(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movb	%al, -16(%ebp)
	.loc 1 496 0
	cmpb	$0, -13(%ebp)
	jne	L95
	.loc 1 498 0
	movzbl	-14(%ebp), %edx
	movzbl	-16(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	8(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
	jmp	L96
L95:
	.loc 1 502 0
	movzbl	-14(%ebp), %edx
	movzbl	-14(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	(%eax,%ecx,4), %ecx
	movzbl	-16(%ebp), %eax
	addl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
L96:
	.loc 1 493 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L94:
	.loc 1 493 0 is_stmt 0 discriminator 1
	cmpb	$1, -13(%ebp)
	jbe	L97
	.loc 1 505 0 is_stmt 1
	movzbl	-14(%ebp), %edx
	movzbl	-15(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 2(%eax,%edx,4)
	.loc 1 506 0
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movzbl	-15(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -17(%ebp)
	.loc 1 507 0
	movb	$0, -13(%ebp)
	jmp	L98
L101:
	.loc 1 509 0
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	movzbl	-13(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-17(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movb	%al, -16(%ebp)
	.loc 1 510 0
	cmpb	$0, -13(%ebp)
	jne	L99
	.loc 1 512 0
	movzbl	-14(%ebp), %edx
	movzbl	-16(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	8(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
	jmp	L100
L99:
	.loc 1 516 0
	movzbl	-14(%ebp), %edx
	movzbl	-14(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	1(%eax,%ecx,4), %ecx
	movzbl	-16(%ebp), %eax
	addl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
L100:
	.loc 1 507 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L98:
	.loc 1 507 0 is_stmt 0 discriminator 1
	cmpb	$1, -13(%ebp)
	jbe	L101
	.loc 1 519 0 is_stmt 1 discriminator 2
	movzbl	-14(%ebp), %edx
	movzbl	-17(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 3(%eax,%edx,4)
	.loc 1 490 0 discriminator 2
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L93:
	.loc 1 490 0 is_stmt 0 discriminator 1
	cmpb	$63, -14(%ebp)
	jbe	L102
	jmp	L103
L90:
	.loc 1 524 0 is_stmt 1
	movl	$1, -12(%ebp)
L103:
	.loc 1 527 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 528 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.def	_HardDepuncturer;	.scl	3;	.type	32;	.endef
_HardDepuncturer:
LFB26:
	.loc 1 542 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$48, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 543 0
	movl	$0, -12(%ebp)
	.loc 1 544 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	.loc 1 547 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	.loc 1 551 0
	cmpl	$0, 8(%ebp)
	je	L106
	.loc 1 553 0
	movl	16(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	L107
L114:
	.loc 1 555 0
	movzbl	-21(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L108
	.loc 1 557 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 558 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 559 0
	movl	8(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %edx
	movzbl	-29(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	andl	%edx, %eax
	movb	%al, -22(%ebp)
	.loc 1 560 0
	subl	$1, -16(%ebp)
	jmp	L109
L108:
	.loc 1 564 0
	movb	$0, -22(%ebp)
L109:
	.loc 1 566 0
	cmpb	$0, -21(%ebp)
	je	L110
	.loc 1 568 0
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	jmp	L111
L110:
	.loc 1 572 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
L111:
	.loc 1 574 0
	movl	-20(%ebp), %eax
	subl	$1, %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 575 0
	movl	-20(%ebp), %eax
	negl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 576 0
	cmpb	$0, -22(%ebp)
	jne	L112
	.loc 1 578 0
	movl	8(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-29(%ebp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	notl	%eax
	andl	%ebx, %eax
	movb	%al, (%edx)
	jmp	L113
L112:
	.loc 1 582 0
	movl	8(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-29(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
L113:
	.loc 1 553 0 discriminator 2
	subl	$1, -20(%ebp)
L107:
	.loc 1 553 0 is_stmt 0 discriminator 1
	cmpl	$0, -20(%ebp)
	jne	L114
	jmp	L115
L106:
	.loc 1 588 0 is_stmt 1
	movl	$1, -12(%ebp)
L115:
	.loc 1 591 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 592 0
	addl	$48, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_CountByteOnes;	.scl	3;	.type	32;	.endef
_CountByteOnes:
LFB27:
	.loc 1 603 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	.loc 1 605 0
	movb	$0, -2(%ebp)
	.loc 1 607 0
	movb	$0, -1(%ebp)
	jmp	L118
L120:
	.loc 1 609 0
	movzbl	-20(%ebp), %edx
	movzbl	-1(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L119
	.loc 1 611 0
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L119:
	.loc 1 607 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L118:
	.loc 1 607 0 is_stmt 0 discriminator 1
	cmpb	$7, -1(%ebp)
	jbe	L120
	.loc 1 615 0 is_stmt 1
	movzbl	-2(%ebp), %eax
	.loc 1 616 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.def	_FindMinSurvPathHard;	.scl	3;	.type	32;	.endef
_FindMinSurvPathHard:
LFB28:
	.loc 1 627 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 632 0
	cmpl	$0, 8(%ebp)
	je	L123
	.loc 1 634 0
	movl	8(%ebp), %eax
	movl	256(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 635 0
	movb	$0, -5(%ebp)
	.loc 1 636 0
	movb	$1, -6(%ebp)
	jmp	L124
L126:
	.loc 1 638 0
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L125
	.loc 1 638 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	cmpl	-4(%ebp), %eax
	jnb	L125
	.loc 1 640 0 is_stmt 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, -4(%ebp)
	.loc 1 641 0
	movzbl	-6(%ebp), %eax
	movb	%al, -5(%ebp)
L125:
	.loc 1 636 0 discriminator 2
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L124:
	.loc 1 636 0 is_stmt 0 discriminator 1
	cmpb	$63, -6(%ebp)
	jbe	L126
L123:
	.loc 1 646 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 647 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/error.h"
	.file 7 "src/convolutional.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xf6f
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\convolutional.c\0"
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
	.long	0x150
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x150
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xba
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x150
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xba
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xba
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xba
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xba
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x150
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xc1
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xc9
	.uleb128 0x7
	.long	0x156
	.long	0x16d
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x162
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x19c
	.uleb128 0xa
	.long	0x188
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
	.long	0x87
	.uleb128 0x6
	.ascii "uint32_t\0"
	.byte	0x3
	.byte	0x3f
	.long	0x77
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xba
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x20e
	.uleb128 0x5
	.byte	0x4
	.long	0x150
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xba
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xba
	.uleb128 0x7
	.long	0x150
	.long	0x244
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x239
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x4
	.byte	0xfa
	.long	0x77
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x77
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x77
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x77
	.uleb128 0xb
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xba
	.uleb128 0xb
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xba
	.uleb128 0xb
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x9d
	.uleb128 0x7
	.long	0x150
	.long	0x2da
	.uleb128 0xc
	.long	0x2da
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
	.long	0x2ca
	.uleb128 0xb
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xba
	.uleb128 0xb
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x9d
	.uleb128 0xb
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2ca
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x2
	.byte	0xc
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x6
	.byte	0x1b
	.long	0x3cd
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
	.ascii "ERR_INV_BUFFER_SIZE\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "ERR_NUM\0"
	.byte	0x6
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x6
	.byte	0x24
	.long	0x340
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x7
	.byte	0x25
	.long	0x42a
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
	.byte	0x7
	.byte	0x27
	.long	0x3dc
	.uleb128 0xa
	.long	0x42a
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x7
	.byte	0x2b
	.long	0x4b0
	.uleb128 0xe
	.ascii "CC_RATE_IDX_12\0"
	.byte	0
	.uleb128 0xe
	.ascii "CC_RATE_IDX_23\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "CC_RATE_IDX_34\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "CC_RATE_IDX_56\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "CC_RATE_IDX_78\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "CC_RATE_NUM\0"
	.byte	0x5
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x7
	.byte	0x35
	.long	0x521
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
	.byte	0x7
	.byte	0x3e
	.long	0x4b0
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x7
	.byte	0x43
	.long	0x56e
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
	.byte	0x7
	.byte	0x48
	.long	0x532
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0x7
	.byte	0x6f
	.long	0x5d1
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0x7
	.byte	0x71
	.long	0x42a
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0x7
	.byte	0x72
	.long	0x521
	.byte	0x4
	.uleb128 0x4
	.ascii "memFact\0"
	.byte	0x7
	.byte	0x73
	.long	0x1ba
	.byte	0x8
	.uleb128 0x4
	.ascii "vitDM\0"
	.byte	0x7
	.byte	0x74
	.long	0x56e
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0x7
	.byte	0x75
	.long	0x585
	.uleb128 0xa
	.long	0x5d1
	.uleb128 0x3
	.ascii "_cc_encoder_info_t\0"
	.byte	0x6
	.byte	0x7
	.byte	0x78
	.long	0x624
	.uleb128 0x4
	.ascii "connVect\0"
	.byte	0x7
	.byte	0x7a
	.long	0x624
	.byte	0
	.uleb128 0x4
	.ascii "puncVect\0"
	.byte	0x7
	.byte	0x7b
	.long	0x634
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x634
	.uleb128 0xc
	.long	0x2da
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x644
	.uleb128 0xc
	.long	0x2da
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.ascii "cc_encoder_info_t\0"
	.byte	0x7
	.byte	0x7c
	.long	0x5e6
	.uleb128 0xa
	.long	0x644
	.uleb128 0x3
	.ascii "_cc_trcore_t\0"
	.byte	0x4
	.byte	0x7
	.byte	0x7f
	.long	0x697
	.uleb128 0x4
	.ascii "outBits\0"
	.byte	0x7
	.byte	0x81
	.long	0x624
	.byte	0
	.uleb128 0x4
	.ascii "nextSt\0"
	.byte	0x7
	.byte	0x82
	.long	0x624
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "cc_trcore_t\0"
	.byte	0x7
	.byte	0x83
	.long	0x662
	.uleb128 0xf
	.ascii "_cc_trellis_t\0"
	.word	0x100
	.byte	0x7
	.byte	0x86
	.long	0x6cf
	.uleb128 0x4
	.ascii "trSt\0"
	.byte	0x7
	.byte	0x88
	.long	0x6cf
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x697
	.long	0x6df
	.uleb128 0xc
	.long	0x2da
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.ascii "cc_trellis_t\0"
	.byte	0x7
	.byte	0x89
	.long	0x6aa
	.uleb128 0xf
	.ascii "_cc_hard_dec_info_t\0"
	.word	0xa200
	.byte	0x7
	.byte	0x8c
	.long	0x73a
	.uleb128 0x4
	.ascii "iter\0"
	.byte	0x7
	.byte	0x8e
	.long	0x73a
	.byte	0
	.uleb128 0x10
	.ascii "dist\0"
	.byte	0x7
	.byte	0x8f
	.long	0x73a
	.word	0x100
	.uleb128 0x10
	.ascii "path\0"
	.byte	0x7
	.byte	0x90
	.long	0x74a
	.word	0x200
	.byte	0
	.uleb128 0x7
	.long	0x1ca
	.long	0x74a
	.uleb128 0xc
	.long	0x2da
	.byte	0x3f
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x761
	.uleb128 0xc
	.long	0x2da
	.byte	0x3f
	.uleb128 0x11
	.long	0x2da
	.word	0x27f
	.byte	0
	.uleb128 0x6
	.ascii "cc_hard_dec_info_t\0"
	.byte	0x7
	.byte	0x91
	.long	0x6f3
	.uleb128 0xa
	.long	0x761
	.uleb128 0x7
	.long	0x43b
	.long	0x790
	.uleb128 0xc
	.long	0x2da
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.long	0x780
	.uleb128 0x12
	.ascii "CC_RATE_ARRAY\0"
	.byte	0x1
	.byte	0x17
	.long	0x790
	.uleb128 0x5
	.byte	0x3
	.long	_CC_RATE_ARRAY
	.uleb128 0x13
	.ascii "FindMinSurvPathHard\0"
	.byte	0x1
	.word	0x272
	.long	0x188
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x825
	.uleb128 0x14
	.ascii "inPaths\0"
	.byte	0x1
	.word	0x272
	.long	0x825
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "minDist\0"
	.byte	0x1
	.word	0x274
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.ascii "minStateIdx\0"
	.byte	0x1
	.word	0x275
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x276
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x77b
	.uleb128 0x13
	.ascii "CountByteOnes\0"
	.byte	0x1
	.word	0x25a
	.long	0x188
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x87e
	.uleb128 0x14
	.ascii "inByte\0"
	.byte	0x1
	.word	0x25a
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x25c
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x15
	.ascii "cnt\0"
	.byte	0x1
	.word	0x25d
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x16
	.ascii "HardDepuncturer\0"
	.byte	0x1
	.word	0x21d
	.long	0x3cd
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x96c
	.uleb128 0x14
	.ascii "IoBuffer\0"
	.byte	0x1
	.word	0x21d
	.long	0x96c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF0
	.byte	0x1
	.word	0x21d
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.word	0x21d
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.ascii "punctVect\0"
	.byte	0x1
	.word	0x21d
	.long	0x972
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x21d
	.long	0x978
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x18
	.secrel32	LASF3
	.byte	0x1
	.word	0x21f
	.long	0x3cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.ascii "rdIdx\0"
	.byte	0x1
	.word	0x220
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.secrel32	LASF4
	.byte	0x1
	.word	0x221
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x222
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.ascii "rdIdxPunc\0"
	.byte	0x1
	.word	0x223
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x18
	.secrel32	LASF5
	.byte	0x1
	.word	0x224
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x15
	.ascii "rdBit\0"
	.byte	0x1
	.word	0x225
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x188
	.uleb128 0x5
	.byte	0x4
	.long	0x197
	.uleb128 0x5
	.byte	0x4
	.long	0x5e1
	.uleb128 0x16
	.ascii "ComputeTrellisDiagram\0"
	.byte	0x1
	.word	0x1dc
	.long	0x3cd
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xa58
	.uleb128 0x14
	.ascii "ioTrellisDiagr\0"
	.byte	0x1
	.word	0x1dc
	.long	0xa58
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.ascii "conVect\0"
	.byte	0x1
	.word	0x1dc
	.long	0x972
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x1dc
	.long	0x978
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x18
	.secrel32	LASF3
	.byte	0x1
	.word	0x1de
	.long	0x3cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.ascii "StBin\0"
	.byte	0x1
	.word	0x1df
	.long	0xa5e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x15
	.ascii "i\0"
	.byte	0x1
	.word	0x1e0
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x1e0
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x15
	.ascii "outBit\0"
	.byte	0x1
	.word	0x1e1
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.ascii "state0\0"
	.byte	0x1
	.word	0x1e2
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x15
	.ascii "state1\0"
	.byte	0x1
	.word	0x1e2
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x6df
	.uleb128 0x7
	.long	0x188
	.long	0xa6e
	.uleb128 0xc
	.long	0x2da
	.byte	0x3f
	.byte	0
	.uleb128 0x13
	.ascii "ComputeEncBit\0"
	.byte	0x1
	.word	0x1c5
	.long	0x188
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xae5
	.uleb128 0x14
	.ascii "cState\0"
	.byte	0x1
	.word	0x1c5
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.ascii "cvVal\0"
	.byte	0x1
	.word	0x1c5
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.ascii "kLen\0"
	.byte	0x1
	.word	0x1c5
	.long	0x521
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.ascii "outBit\0"
	.byte	0x1
	.word	0x1c7
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x1c8
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x13
	.ascii "IsKlenValid\0"
	.byte	0x1
	.word	0x1b2
	.long	0xb27
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xb27
	.uleb128 0x14
	.ascii "val\0"
	.byte	0x1
	.word	0x1b2
	.long	0x521
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "bRet\0"
	.byte	0x1
	.word	0x1b4
	.long	0xb27
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x13
	.ascii "IsRateValid\0"
	.byte	0x1
	.word	0x199
	.long	0xb27
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xb7f
	.uleb128 0x14
	.ascii "val\0"
	.byte	0x1
	.word	0x199
	.long	0x42a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "bRet\0"
	.byte	0x1
	.word	0x19b
	.long	0xb27
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x19c
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x19
	.ascii "CnvCod_HardDecoder\0"
	.byte	0x1
	.byte	0xe9
	.long	0x3cd
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xd70
	.uleb128 0x1a
	.secrel32	LASF6
	.byte	0x1
	.byte	0xe9
	.long	0x96c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.ascii "inLenBy\0"
	.byte	0x1
	.byte	0xe9
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.byte	0xe9
	.long	0x96c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF8
	.byte	0x1
	.byte	0xe9
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0xe9
	.long	0x978
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.secrel32	LASF9
	.byte	0x1
	.byte	0xe9
	.long	0xd70
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1c
	.secrel32	LASF3
	.byte	0x1
	.byte	0xeb
	.long	0x3cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1d
	.ascii "curPaths\0"
	.byte	0x1
	.byte	0xec
	.long	0x761
	.uleb128 0x4
	.byte	0x91
	.sleb128 -41536
	.uleb128 0x1d
	.ascii "prevPaths\0"
	.byte	0x1
	.byte	0xed
	.long	0x761
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83008
	.uleb128 0x1d
	.ascii "trDiagr\0"
	.byte	0x1
	.byte	0xee
	.long	0x6df
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83264
	.uleb128 0x1c
	.secrel32	LASF1
	.byte	0x1
	.byte	0xef
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.secrel32	LASF0
	.byte	0x1
	.byte	0xf0
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.secrel32	LASF4
	.byte	0x1
	.byte	0xf1
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1d
	.ascii "inIdx\0"
	.byte	0x1
	.byte	0xf1
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1d
	.ascii "wrIdx\0"
	.byte	0x1
	.byte	0xf1
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii "finIdx\0"
	.byte	0x1
	.byte	0xf1
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1d
	.ascii "candDist\0"
	.byte	0x1
	.byte	0xf2
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1d
	.ascii "i\0"
	.byte	0x1
	.byte	0xf3
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.ascii "nextSt\0"
	.byte	0x1
	.byte	0xf4
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.ascii "minDistSt\0"
	.byte	0x1
	.byte	0xf4
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -61
	.uleb128 0x1d
	.ascii "depSt\0"
	.byte	0x1
	.byte	0xf4
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -62
	.uleb128 0x1d
	.ascii "arrSt\0"
	.byte	0x1
	.byte	0xf4
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x1c
	.secrel32	LASF5
	.byte	0x1
	.byte	0xf5
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -53
	.uleb128 0x1d
	.ascii "hypIdx\0"
	.byte	0x1
	.byte	0xf5
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x1d
	.ascii "cycleBits\0"
	.byte	0x1
	.byte	0xf6
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -54
	.uleb128 0x1d
	.ascii "hamDist\0"
	.byte	0x1
	.byte	0xf7
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -55
	.uleb128 0x1d
	.ascii "erasMask\0"
	.byte	0x1
	.byte	0xf8
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -35
	.uleb128 0x1d
	.ascii "j\0"
	.byte	0x1
	.byte	0xf9
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x65d
	.uleb128 0x19
	.ascii "CnvCod_Encoder\0"
	.byte	0x1
	.byte	0x98
	.long	0x3cd
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xea4
	.uleb128 0x1a
	.secrel32	LASF6
	.byte	0x1
	.byte	0x98
	.long	0x972
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.ascii "inLenBy\0"
	.byte	0x1
	.byte	0x98
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.byte	0x98
	.long	0x96c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF8
	.byte	0x1
	.byte	0x98
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0x98
	.long	0x978
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.secrel32	LASF9
	.byte	0x1
	.byte	0x98
	.long	0xd70
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x1b
	.ascii "pPunLenBy\0"
	.byte	0x1
	.byte	0x98
	.long	0xea4
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x1c
	.secrel32	LASF3
	.byte	0x1
	.byte	0x9a
	.long	0x3cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1d
	.ascii "unpLenBy\0"
	.byte	0x1
	.byte	0x9b
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1d
	.ascii "unpLenBi\0"
	.byte	0x1
	.byte	0x9c
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.secrel32	LASF0
	.byte	0x1
	.byte	0x9d
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1d
	.ascii "wrIdx\0"
	.byte	0x1
	.byte	0x9e
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.secrel32	LASF4
	.byte	0x1
	.byte	0x9f
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1d
	.ascii "j\0"
	.byte	0x1
	.byte	0xa0
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1d
	.ascii "encState\0"
	.byte	0x1
	.byte	0xa1
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x1c
	.secrel32	LASF5
	.byte	0x1
	.byte	0xa2
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -49
	.uleb128 0x1d
	.ascii "rdBit\0"
	.byte	0x1
	.byte	0xa3
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x1ca
	.uleb128 0x19
	.ascii "CnvCod_GetConnectorPuncturationVectors\0"
	.byte	0x1
	.byte	0x53
	.long	0x3cd
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xf19
	.uleb128 0x1b
	.ascii "ioInfo\0"
	.byte	0x1
	.byte	0x53
	.long	0xf19
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.ascii "inParams\0"
	.byte	0x1
	.byte	0x53
	.long	0x978
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1c
	.secrel32	LASF3
	.byte	0x1
	.byte	0x55
	.long	0x3cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x644
	.uleb128 0x19
	.ascii "CnvCod_ListParameters\0"
	.byte	0x1
	.byte	0x37
	.long	0x3cd
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xf6c
	.uleb128 0x1b
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x37
	.long	0xf6c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.secrel32	LASF3
	.byte	0x1
	.byte	0x39
	.long	0x3cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5d1
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
LASF2:
	.ascii "pParams\0"
LASF6:
	.ascii "inBuffer\0"
LASF3:
	.ascii "retErr\0"
LASF8:
	.ascii "outLenBy\0"
LASF5:
	.ascii "bitIdx\0"
LASF0:
	.ascii "inLenBi\0"
LASF7:
	.ascii "outBuffer\0"
LASF9:
	.ascii "pEncInfo\0"
LASF4:
	.ascii "byteIdx\0"
LASF1:
	.ascii "outLenBi\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
