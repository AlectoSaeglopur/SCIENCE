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
	.loc 1 57 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 58 0
	movl	$0, -12(%ebp)
	.loc 1 60 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 62 0
	movl	8(%ebp), %eax
	movl	$2, (%eax)
	.loc 1 63 0
	movl	8(%ebp), %eax
	movl	$7, 4(%eax)
	.loc 1 64 0
	movl	8(%ebp), %eax
	movw	$10, 8(%eax)
	.loc 1 65 0
	movl	8(%ebp), %eax
	movl	$0, 12(%eax)
	jmp	L3
L2:
	.loc 1 69 0
	movl	$1, -12(%ebp)
L3:
	.loc 1 72 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 73 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.def	_RetrieveConnectorPuncturationVectors;	.scl	3;	.type	32;	.endef
_RetrieveConnectorPuncturationVectors:
LFB19:
	.loc 1 85 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	.loc 1 86 0
	movl	$0, -12(%ebp)
	.loc 1 88 0
	cmpl	$0, 8(%ebp)
	je	L6
	.loc 1 88 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L6
	.loc 1 90 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_IsKlenValid
	testb	%al, %al
	je	L7
	.loc 1 93 0
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
	.loc 1 97 0
	movl	$4, -12(%ebp)
L8:
	.loc 1 100 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_IsRateValid
	testb	%al, %al
	je	L9
	.loc 1 102 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	L11
	cmpl	$3, %eax
	ja	L12
	cmpl	$2, %eax
	je	L13
	.loc 1 122 0
	jmp	L17
L12:
	.loc 1 102 0
	cmpl	$5, %eax
	je	L14
	cmpl	$7, %eax
	je	L15
	.loc 1 122 0
	jmp	L17
L13:
	.loc 1 105 0
	movb	$1, -46(%ebp)
	movb	$1, -45(%ebp)
	movb	$0, -44(%ebp)
	movb	$1, -43(%ebp)
	movl	8(%ebp), %eax
	leal	2(%eax), %edx
	movl	-46(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 106 0
	jmp	L17
L11:
	.loc 1 109 0
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
	.loc 1 110 0
	jmp	L17
L14:
	.loc 1 113 0
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
	.loc 1 114 0
	jmp	L17
L15:
	.loc 1 117 0
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
	.loc 1 118 0
	jmp	L17
L9:
	.loc 1 127 0
	movl	$3, -12(%ebp)
	.loc 1 100 0
	jmp	L18
L17:
	.loc 1 100 0 is_stmt 0 discriminator 2
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
	.loc 1 150 0
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
	.loc 1 151 0
	movl	$0, -12(%ebp)
	.loc 1 152 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	addl	%eax, %eax
	movl	%eax, -28(%ebp)
	.loc 1 153 0
	movl	-28(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 154 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 155 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	addl	$1, %eax
	imull	-36(%ebp), %eax
	movl	16(%ebp), %edx
	movl	(%edx), %esi
	movl	$0, %edx
	divl	%esi
	movl	%eax, -40(%ebp)
	.loc 1 157 0
	movl	$0, -16(%ebp)
	.loc 1 160 0
	movb	$0, -21(%ebp)
	.loc 1 164 0
	cmpl	$0, 8(%ebp)
	je	L21
	.loc 1 164 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L21
	.loc 1 164 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L21
	.loc 1 165 0 is_stmt 1 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 164 0 discriminator 3
	testl	%eax, %eax
	je	L21
	.loc 1 165 0
	cmpl	$0, 16(%ebp)
	je	L21
	.loc 1 167 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-52(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrieveConnectorPuncturationVectors
	.loc 1 169 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-28(%ebp), %eax
	jne	L22
	.loc 1 171 0
	movl	$0, -20(%ebp)
	jmp	L23
L24:
	.loc 1 173 0 discriminator 3
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -44(%ebp)
	.loc 1 174 0 discriminator 3
	movl	-20(%ebp), %eax
	andl	$7, %eax
	movb	%al, -45(%ebp)
	.loc 1 175 0 discriminator 3
	shrb	-21(%ebp)
	.loc 1 176 0 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-45(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movl	%eax, %edx
	.loc 1 177 0 discriminator 3
	movl	16(%ebp), %eax
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
	movl	%eax, -44(%ebp)
	.loc 1 179 0 discriminator 3
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	andl	$6, %eax
	movb	%al, -45(%ebp)
	.loc 1 180 0 discriminator 3
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	movzbl	-52(%ebp), %eax
	movzbl	%al, %edx
	movzbl	-21(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movzbl	%al, %edx
	.loc 1 181 0 discriminator 3
	movzbl	-45(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	.loc 1 180 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-44(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ecx
	movl	%ebx, %eax
	orl	%ecx, %eax
	movb	%al, (%edx)
	.loc 1 182 0 discriminator 3
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	movzbl	-51(%ebp), %eax
	movzbl	%al, %edx
	movzbl	-21(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movzbl	%al, %edx
	.loc 1 183 0 discriminator 3
	movzbl	-45(%ebp), %eax
	movl	$6, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	.loc 1 182 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-44(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ecx
	movl	%ebx, %eax
	orl	%ecx, %eax
	movb	%al, (%edx)
	.loc 1 171 0 discriminator 3
	addl	$1, -20(%ebp)
L23:
	.loc 1 171 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L24
	.loc 1 186 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L34
	.loc 1 188 0
	movl	$0, -20(%ebp)
	jmp	L26
L29:
	.loc 1 190 0
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -44(%ebp)
	.loc 1 191 0
	movl	-20(%ebp), %eax
	andl	$7, %eax
	movb	%al, -45(%ebp)
	.loc 1 192 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-45(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movb	%al, -46(%ebp)
	.loc 1 193 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	-20(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movzbl	-50(%ebp,%eax), %eax
	testb	%al, %al
	je	L27
	.loc 1 195 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -44(%ebp)
	.loc 1 196 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -45(%ebp)
	.loc 1 197 0
	addl	$1, -16(%ebp)
	.loc 1 198 0
	cmpb	$0, -46(%ebp)
	jne	L28
	.loc 1 200 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-44(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-45(%ebp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	notl	%eax
	andl	%ebx, %eax
	movb	%al, (%edx)
	jmp	L27
L28:
	.loc 1 204 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-44(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-45(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
L27:
	.loc 1 188 0 discriminator 2
	addl	$1, -20(%ebp)
L26:
	.loc 1 188 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L29
	.loc 1 208 0 is_stmt 1
	movl	-40(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jne	L30
	.loc 1 210 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%eax)
	.loc 1 169 0
	jmp	L34
L30:
	.loc 1 214 0
	movl	$5, -12(%ebp)
	.loc 1 169 0
	jmp	L34
L22:
	.loc 1 220 0
	movl	$5, -12(%ebp)
	.loc 1 169 0
	jmp	L34
L21:
	.loc 1 225 0
	movl	$1, -12(%ebp)
	jmp	L32
L34:
	.loc 1 169 0
	nop
L32:
	.loc 1 228 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 229 0
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
	.loc 1 243 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	movl	$83324, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 243 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 244 0
	movl	$0, -28(%ebp)
	.loc 1 245 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 246 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -52(%ebp)
	.loc 1 247 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	imull	%edx, %eax
	leal	(%eax,%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	1(%eax), %ecx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	movl	%eax, -56(%ebp)
	.loc 1 248 0
	movl	-56(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -60(%ebp)
	.loc 1 250 0
	leal	-41564(%ebp), %eax
	movl	$41472, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 256 0
	movl	-56(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -64(%ebp)
	movl	$16, %eax
	leal	-1(%eax), %edx
	movl	-56(%ebp), %eax
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	20(%esp), %eax
	addl	$0, %eax
	movl	%eax, -68(%ebp)
	.loc 1 264 0
	cmpl	$0, 8(%ebp)
	je	L36
	.loc 1 264 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L36
	.loc 1 264 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L36
	.loc 1 264 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L36
	.loc 1 266 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-92(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrieveConnectorPuncturationVectors
	.loc 1 267 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-92(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-83292(%ebp), %eax
	movl	%eax, (%esp)
	call	_ComputeTrellisDiagram
	.loc 1 268 0
	movl	$1, -41564(%ebp)
	.loc 1 269 0
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-68(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 271 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L37
	.loc 1 273 0
	movb	$3, -43(%ebp)
	jmp	L38
L37:
	.loc 1 277 0
	movl	-68(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 16(%esp)
	leal	-92(%ebp), %edx
	addl	$2, %edx
	movl	%edx, 12(%esp)
	movl	-60(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-52(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_HardDepuncturer
L38:
	.loc 1 280 0
	movl	$2, -40(%ebp)
	jmp	L39
L72:
	.loc 1 282 0
	movl	-40(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -72(%ebp)
	.loc 1 283 0
	movl	-72(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 284 0
	movl	-72(%ebp), %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 285 0
	movl	-68(%ebp), %edx
	movl	-76(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-77(%ebp), %eax
	movl	$6, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$3, %eax
	movb	%al, -78(%ebp)
	.loc 1 286 0
	leal	-83036(%ebp), %eax
	leal	-41564(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 287 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L40
	.loc 1 289 0
	movb	$0, -43(%ebp)
	.loc 1 290 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	-72(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movzbl	-90(%ebp,%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movzbl	-43(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -43(%ebp)
	.loc 1 291 0
	movl	-72(%ebp), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movzbl	-90(%ebp,%eax), %eax
	orb	%al, -43(%ebp)
L40:
	.loc 1 293 0
	movb	$0, -44(%ebp)
	jmp	L41
L55:
	.loc 1 295 0
	movzbl	-44(%ebp), %eax
	movl	-83036(%ebp,%eax,4), %eax
	movl	-40(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L42
	.loc 1 297 0
	movb	$0, -42(%ebp)
	jmp	L43
L54:
	.loc 1 299 0
	movzbl	-44(%ebp), %edx
	movzbl	-42(%ebp), %eax
	sall	$2, %edx
	leal	-24(%ebp), %edi
	addl	%edi, %edx
	addl	%edx, %eax
	subl	$83268, %eax
	movzbl	(%eax), %eax
	xorb	-78(%ebp), %al
	andb	-43(%ebp), %al
	movzbl	%al, %eax
	movl	%eax, (%esp)
	call	_CountByteOnes
	movb	%al, -79(%ebp)
	.loc 1 300 0
	movzbl	-44(%ebp), %edx
	movzbl	-42(%ebp), %eax
	sall	$2, %edx
	leal	-24(%ebp), %ebx
	addl	%ebx, %edx
	addl	%edx, %eax
	subl	$83266, %eax
	movzbl	(%eax), %eax
	movb	%al, -80(%ebp)
	.loc 1 301 0
	movzbl	-80(%ebp), %eax
	movl	-41564(%ebp,%eax,4), %eax
	cmpl	-40(%ebp), %eax
	jnb	L44
	.loc 1 303 0
	movzbl	-80(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, -41564(%ebp,%eax,4)
	.loc 1 304 0
	movzbl	-80(%ebp), %eax
	movzbl	-44(%ebp), %edx
	addl	$64, %edx
	movl	-83036(%ebp,%edx,4), %ecx
	movzbl	-79(%ebp), %edx
	addl	%ecx, %edx
	addl	$64, %eax
	movl	%edx, -41564(%ebp,%eax,4)
	.loc 1 305 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L45
	.loc 1 307 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L46
L45:
	.loc 1 311 0
	movl	$639, -36(%ebp)
L46:
	.loc 1 313 0
	movl	$0, -32(%ebp)
	jmp	L47
L48:
	.loc 1 315 0 discriminator 3
	movzbl	-80(%ebp), %edx
	movzbl	-44(%ebp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	leal	(%edi,%eax), %ecx
	movl	-32(%ebp), %eax
	addl	%ecx, %eax
	subl	$82500, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	subl	$41028, %eax
	movb	%cl, (%eax)
	.loc 1 313 0 discriminator 3
	addl	$1, -32(%ebp)
L47:
	.loc 1 313 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L48
	.loc 1 317 0 is_stmt 1
	movzbl	-80(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	leal	(%edi,%eax), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	leal	-41028(%eax), %edx
	movzbl	-44(%ebp), %eax
	movb	%al, (%edx)
	jmp	L49
L44:
	.loc 1 321 0
	movzbl	-44(%ebp), %eax
	addl	$64, %eax
	movl	-83036(%ebp,%eax,4), %edx
	movzbl	-79(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -84(%ebp)
	.loc 1 322 0
	movzbl	-80(%ebp), %eax
	addl	$64, %eax
	movl	-41564(%ebp,%eax,4), %eax
	cmpl	-84(%ebp), %eax
	jbe	L49
	.loc 1 324 0
	movzbl	-80(%ebp), %eax
	leal	64(%eax), %edx
	movl	-84(%ebp), %eax
	movl	%eax, -41564(%ebp,%edx,4)
	.loc 1 325 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L50
	.loc 1 327 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L51
L50:
	.loc 1 331 0
	movl	$639, -36(%ebp)
L51:
	.loc 1 333 0
	movl	$0, -32(%ebp)
	jmp	L52
L53:
	.loc 1 335 0 discriminator 3
	movzbl	-80(%ebp), %edx
	movzbl	-44(%ebp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	leal	(%ebx,%eax), %ecx
	movl	-32(%ebp), %eax
	addl	%ecx, %eax
	subl	$82500, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	leal	(%edi,%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	subl	$41028, %eax
	movb	%cl, (%eax)
	.loc 1 333 0 discriminator 3
	addl	$1, -32(%ebp)
L52:
	.loc 1 333 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L53
	.loc 1 337 0 is_stmt 1
	movzbl	-80(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	leal	-41028(%eax), %edx
	movzbl	-44(%ebp), %eax
	movb	%al, (%edx)
L49:
	.loc 1 297 0 discriminator 2
	movzbl	-42(%ebp), %eax
	addl	$1, %eax
	movb	%al, -42(%ebp)
L43:
	.loc 1 297 0 is_stmt 0 discriminator 1
	cmpb	$1, -42(%ebp)
	jbe	L54
L42:
	.loc 1 293 0 is_stmt 1 discriminator 2
	movzbl	-44(%ebp), %eax
	addl	$1, %eax
	movb	%al, -44(%ebp)
L41:
	.loc 1 293 0 is_stmt 0 discriminator 1
	cmpb	$63, -44(%ebp)
	jbe	L55
	.loc 1 344 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	-48(%ebp), %eax
	jne	L56
	.loc 1 346 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathHard
	movb	%al, -85(%ebp)
	.loc 1 347 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L57
	.loc 1 349 0
	movl	$640, -36(%ebp)
	jmp	L58
L57:
	.loc 1 353 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
L58:
	.loc 1 355 0
	movl	$0, -32(%ebp)
	jmp	L59
L64:
	.loc 1 357 0
	movzbl	-85(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	leal	(%edi,%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	subl	$41028, %eax
	movzbl	(%eax), %eax
	movb	%al, -86(%ebp)
	.loc 1 358 0
	movl	-36(%ebp), %eax
	subl	$1, %eax
	cmpl	-32(%ebp), %eax
	jne	L60
	.loc 1 360 0
	movzbl	-85(%ebp), %eax
	movb	%al, -41(%ebp)
	jmp	L61
L60:
	.loc 1 364 0
	movzbl	-85(%ebp), %edx
	movl	-32(%ebp), %eax
	leal	1(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	addl	%ebx, %eax
	addl	%ecx, %eax
	subl	$41028, %eax
	movzbl	(%eax), %eax
	movb	%al, -41(%ebp)
L61:
	.loc 1 366 0
	movl	-48(%ebp), %eax
	subl	-36(%ebp), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 367 0
	movl	-48(%ebp), %eax
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	subl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 368 0
	movzbl	-86(%ebp), %eax
	movzbl	-83290(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L62
	.loc 1 370 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-76(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-76(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-77(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	$1, %edi
	movl	%eax, %ecx
	sall	%cl, %edi
	movl	%edi, %eax
	notl	%eax
	andl	%ebx, %eax
	movb	%al, (%edx)
	jmp	L63
L62:
	.loc 1 374 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-76(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-76(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %edi
	movzbl	-77(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%edi, %eax
	movb	%al, (%edx)
L63:
	.loc 1 355 0 discriminator 2
	addl	$1, -32(%ebp)
L59:
	.loc 1 355 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L64
	jmp	L65
L56:
	.loc 1 378 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L65
	.loc 1 380 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathHard
	movb	%al, -85(%ebp)
	.loc 1 381 0
	movzbl	-85(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	addl	%edi, %eax
	subl	$41028, %eax
	movzbl	(%eax), %eax
	movb	%al, -86(%ebp)
	.loc 1 382 0
	movzbl	-85(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	addl	%ebx, %eax
	subl	$41027, %eax
	movzbl	(%eax), %eax
	movb	%al, -41(%ebp)
	.loc 1 383 0
	movl	-40(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 384 0
	movl	-40(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 385 0
	movzbl	-86(%ebp), %eax
	movzbl	-83290(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L66
	.loc 1 387 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-76(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-76(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-77(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	$1, %edi
	movl	%eax, %ecx
	sall	%cl, %edi
	movl	%edi, %eax
	notl	%eax
	andl	%ebx, %eax
	movb	%al, (%edx)
	jmp	L67
L66:
	.loc 1 391 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-76(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-76(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %edi
	movzbl	-77(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%edi, %eax
	movb	%al, (%edx)
L67:
	.loc 1 393 0
	movb	$0, -44(%ebp)
	jmp	L68
L71:
	.loc 1 395 0
	movl	$0, -32(%ebp)
	jmp	L69
L70:
	.loc 1 397 0 discriminator 3
	movzbl	-44(%ebp), %edx
	movzbl	-44(%ebp), %ecx
	movl	-32(%ebp), %eax
	leal	1(%eax), %ebx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	addl	%edi, %eax
	addl	%ebx, %eax
	subl	$41028, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	subl	$41028, %eax
	movb	%cl, (%eax)
	.loc 1 395 0 discriminator 3
	addl	$1, -32(%ebp)
L69:
	.loc 1 395 0 is_stmt 0 discriminator 1
	cmpl	$638, -32(%ebp)
	jbe	L70
	.loc 1 393 0 is_stmt 1 discriminator 2
	movzbl	-44(%ebp), %eax
	addl	$1, %eax
	movb	%al, -44(%ebp)
L68:
	.loc 1 393 0 is_stmt 0 discriminator 1
	cmpb	$63, -44(%ebp)
	jbe	L71
L65:
	.loc 1 280 0 is_stmt 1 discriminator 2
	addl	$1, -40(%ebp)
L39:
	.loc 1 280 0 is_stmt 0 discriminator 1
	movl	-48(%ebp), %eax
	addl	$2, %eax
	cmpl	-40(%ebp), %eax
	ja	L72
	.loc 1 264 0 is_stmt 1
	jmp	L73
L36:
	.loc 1 405 0
	movl	$1, -28(%ebp)
L73:
	.loc 1 408 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 409 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.def	_IsRateValid;	.scl	3;	.type	32;	.endef
_IsRateValid:
LFB22:
	.loc 1 425 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 426 0
	movb	$0, -1(%ebp)
	.loc 1 429 0
	movb	$0, -2(%ebp)
	jmp	L76
L79:
	.loc 1 431 0
	movzbl	-2(%ebp), %eax
	movl	_CC_RATE_ARRAY(,%eax,4), %eax
	cmpl	8(%ebp), %eax
	jne	L77
	.loc 1 433 0
	movb	$1, -1(%ebp)
	.loc 1 434 0
	jmp	L78
L77:
	.loc 1 429 0 discriminator 2
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L76:
	.loc 1 429 0 is_stmt 0 discriminator 1
	cmpb	$4, -2(%ebp)
	jbe	L79
L78:
	.loc 1 438 0 is_stmt 1
	movzbl	-1(%ebp), %eax
	.loc 1 439 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_IsKlenValid;	.scl	3;	.type	32;	.endef
_IsKlenValid:
LFB23:
	.loc 1 450 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 453 0
	cmpl	$2, 8(%ebp)
	jbe	L82
	.loc 1 453 0 is_stmt 0 discriminator 1
	cmpl	$8, 8(%ebp)
	ja	L82
	.loc 1 453 0 discriminator 3
	movl	$1, %eax
	jmp	L83
L82:
	.loc 1 453 0 discriminator 4
	movl	$0, %eax
L83:
	.loc 1 453 0 discriminator 6
	movb	%al, -1(%ebp)
	andb	$1, -1(%ebp)
	.loc 1 455 0 is_stmt 1 discriminator 6
	movzbl	-1(%ebp), %eax
	.loc 1 456 0 discriminator 6
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	_ComputeEncBit;	.scl	3;	.type	32;	.endef
_ComputeEncBit:
LFB24:
	.loc 1 469 0
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
	.loc 1 470 0
	movb	$0, -5(%ebp)
	.loc 1 473 0
	movb	$0, -6(%ebp)
	jmp	L86
L87:
	.loc 1 475 0 discriminator 3
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
	.loc 1 473 0 discriminator 3
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L86:
	.loc 1 473 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %eax
	cmpl	16(%ebp), %eax
	jb	L87
	.loc 1 478 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 479 0
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
	.loc 1 492 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$104, %esp
	.loc 1 493 0
	movl	$0, -12(%ebp)
	.loc 1 499 0
	cmpl	$0, 8(%ebp)
	je	L90
	.loc 1 501 0
	movb	$0, -14(%ebp)
	jmp	L91
L92:
	.loc 1 503 0 discriminator 3
	movzbl	-14(%ebp), %eax
	movzbl	-14(%ebp), %edx
	movb	%dl, -81(%ebp,%eax)
	.loc 1 501 0 discriminator 3
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L91:
	.loc 1 501 0 is_stmt 0 discriminator 1
	cmpb	$63, -14(%ebp)
	jbe	L92
	.loc 1 505 0 is_stmt 1
	movb	$0, -14(%ebp)
	jmp	L93
L102:
	.loc 1 507 0
	movzbl	-14(%ebp), %eax
	movzbl	-81(%ebp,%eax), %eax
	movb	%al, -15(%ebp)
	.loc 1 508 0
	movb	$0, -13(%ebp)
	jmp	L94
L97:
	.loc 1 510 0
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
	.loc 1 511 0
	cmpb	$0, -13(%ebp)
	jne	L95
	.loc 1 513 0
	movzbl	-14(%ebp), %edx
	movzbl	-16(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	8(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
	jmp	L96
L95:
	.loc 1 517 0
	movzbl	-14(%ebp), %edx
	movzbl	-14(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	(%eax,%ecx,4), %ecx
	movzbl	-16(%ebp), %eax
	addl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
L96:
	.loc 1 508 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L94:
	.loc 1 508 0 is_stmt 0 discriminator 1
	cmpb	$1, -13(%ebp)
	jbe	L97
	.loc 1 520 0 is_stmt 1
	movzbl	-14(%ebp), %edx
	movzbl	-15(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 2(%eax,%edx,4)
	.loc 1 521 0
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
	.loc 1 522 0
	movb	$0, -13(%ebp)
	jmp	L98
L101:
	.loc 1 524 0
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
	.loc 1 525 0
	cmpb	$0, -13(%ebp)
	jne	L99
	.loc 1 527 0
	movzbl	-14(%ebp), %edx
	movzbl	-16(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	8(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
	jmp	L100
L99:
	.loc 1 531 0
	movzbl	-14(%ebp), %edx
	movzbl	-14(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	1(%eax,%ecx,4), %ecx
	movzbl	-16(%ebp), %eax
	addl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
L100:
	.loc 1 522 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L98:
	.loc 1 522 0 is_stmt 0 discriminator 1
	cmpb	$1, -13(%ebp)
	jbe	L101
	.loc 1 534 0 is_stmt 1 discriminator 2
	movzbl	-14(%ebp), %edx
	movzbl	-17(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 3(%eax,%edx,4)
	.loc 1 505 0 discriminator 2
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L93:
	.loc 1 505 0 is_stmt 0 discriminator 1
	cmpb	$63, -14(%ebp)
	jbe	L102
	jmp	L103
L90:
	.loc 1 539 0 is_stmt 1
	movl	$1, -12(%ebp)
L103:
	.loc 1 542 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 543 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.def	_HardDepuncturer;	.scl	3;	.type	32;	.endef
_HardDepuncturer:
LFB26:
	.loc 1 558 0
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
	.loc 1 559 0
	movl	$0, -12(%ebp)
	.loc 1 560 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	.loc 1 563 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	.loc 1 567 0
	cmpl	$0, 8(%ebp)
	je	L106
	.loc 1 569 0
	movl	16(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	L107
L114:
	.loc 1 571 0
	movzbl	-21(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L108
	.loc 1 573 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 574 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 575 0
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
	.loc 1 576 0
	subl	$1, -16(%ebp)
	jmp	L109
L108:
	.loc 1 580 0
	movb	$0, -22(%ebp)
L109:
	.loc 1 582 0
	cmpb	$0, -21(%ebp)
	je	L110
	.loc 1 584 0
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	jmp	L111
L110:
	.loc 1 588 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
L111:
	.loc 1 590 0
	movl	-20(%ebp), %eax
	subl	$1, %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 591 0
	movl	-20(%ebp), %eax
	negl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 592 0
	cmpb	$0, -22(%ebp)
	jne	L112
	.loc 1 594 0
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
	.loc 1 598 0
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
	.loc 1 569 0 discriminator 2
	subl	$1, -20(%ebp)
L107:
	.loc 1 569 0 is_stmt 0 discriminator 1
	cmpl	$0, -20(%ebp)
	jne	L114
	jmp	L115
L106:
	.loc 1 604 0 is_stmt 1
	movl	$1, -12(%ebp)
L115:
	.loc 1 607 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 608 0
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
	.loc 1 619 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	.loc 1 621 0
	movb	$0, -2(%ebp)
	.loc 1 623 0
	movb	$0, -1(%ebp)
	jmp	L118
L120:
	.loc 1 625 0
	movzbl	-20(%ebp), %edx
	movzbl	-1(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L119
	.loc 1 627 0
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L119:
	.loc 1 623 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L118:
	.loc 1 623 0 is_stmt 0 discriminator 1
	cmpb	$7, -1(%ebp)
	jbe	L120
	.loc 1 631 0 is_stmt 1
	movzbl	-2(%ebp), %eax
	.loc 1 632 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.def	_FindMinSurvPathHard;	.scl	3;	.type	32;	.endef
_FindMinSurvPathHard:
LFB28:
	.loc 1 643 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 648 0
	cmpl	$0, 8(%ebp)
	je	L123
	.loc 1 650 0
	movl	8(%ebp), %eax
	movl	256(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 651 0
	movb	$0, -5(%ebp)
	.loc 1 652 0
	movb	$1, -6(%ebp)
	jmp	L124
L126:
	.loc 1 654 0
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L125
	.loc 1 654 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	cmpl	-4(%ebp), %eax
	jnb	L125
	.loc 1 656 0 is_stmt 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, -4(%ebp)
	.loc 1 657 0
	movzbl	-6(%ebp), %eax
	movb	%al, -5(%ebp)
L125:
	.loc 1 652 0 discriminator 2
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L124:
	.loc 1 652 0 is_stmt 0 discriminator 1
	cmpb	$63, -6(%ebp)
	jbe	L126
L123:
	.loc 1 662 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 663 0
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
	.file 7 "src/memory.h"
	.file 8 "src/convolutional.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x108a
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
	.uleb128 0xa
	.long	0x1ca
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
	.long	0x213
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
	.long	0x249
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x23e
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
	.long	0x2df
	.uleb128 0xc
	.long	0x2df
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
	.long	0x2cf
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
	.long	0x2cf
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x2
	.byte	0xc
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x6
	.byte	0x1b
	.long	0x435
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
	.ascii "ERR_INV_DYNAMIC_ALLOC\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "ERR_INV_STREAM_TYPE\0"
	.byte	0x7
	.uleb128 0xe
	.ascii "ERR_INV_MODULATION\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "ERR_INV_CHANNEL_TYPE\0"
	.byte	0x9
	.uleb128 0xe
	.ascii "ERR_NUM\0"
	.byte	0xa
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x6
	.byte	0x28
	.long	0x34e
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x7
	.byte	0x1d
	.long	0x47a
	.uleb128 0xe
	.ascii "memory_type_byte\0"
	.byte	0
	.uleb128 0xe
	.ascii "memory_type_complex\0"
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.ascii "memory_type_t\0"
	.byte	0x7
	.byte	0x20
	.long	0x444
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x23
	.long	0x4cb
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x25
	.long	0x4cb
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x26
	.long	0x1ca
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x27
	.long	0x47a
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x188
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x28
	.long	0x48f
	.uleb128 0xa
	.long	0x4d1
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x45
	.long	0x539
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
	.byte	0x8
	.byte	0x47
	.long	0x4eb
	.uleb128 0xa
	.long	0x539
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x4b
	.long	0x5bf
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
	.byte	0x8
	.byte	0x55
	.long	0x630
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
	.byte	0x8
	.byte	0x5e
	.long	0x5bf
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x63
	.long	0x67d
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
	.byte	0x8
	.byte	0x68
	.long	0x641
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0x8
	.byte	0x6b
	.long	0x6e0
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0x8
	.byte	0x6d
	.long	0x539
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0x8
	.byte	0x6e
	.long	0x630
	.byte	0x4
	.uleb128 0x4
	.ascii "memFact\0"
	.byte	0x8
	.byte	0x6f
	.long	0x1ba
	.byte	0x8
	.uleb128 0x4
	.ascii "vitDM\0"
	.byte	0x8
	.byte	0x70
	.long	0x67d
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0x8
	.byte	0x71
	.long	0x694
	.uleb128 0xa
	.long	0x6e0
	.uleb128 0x3
	.ascii "_cc_encoder_info_t\0"
	.byte	0x6
	.byte	0x8
	.byte	0x74
	.long	0x733
	.uleb128 0x4
	.ascii "connVect\0"
	.byte	0x8
	.byte	0x76
	.long	0x733
	.byte	0
	.uleb128 0x4
	.ascii "puncVect\0"
	.byte	0x8
	.byte	0x77
	.long	0x743
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x743
	.uleb128 0xc
	.long	0x2df
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x753
	.uleb128 0xc
	.long	0x2df
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.ascii "cc_encoder_info_t\0"
	.byte	0x8
	.byte	0x78
	.long	0x6f5
	.uleb128 0x3
	.ascii "_cc_trcore_t\0"
	.byte	0x4
	.byte	0x8
	.byte	0x7b
	.long	0x7a1
	.uleb128 0x4
	.ascii "outBits\0"
	.byte	0x8
	.byte	0x7d
	.long	0x733
	.byte	0
	.uleb128 0x4
	.ascii "nextSt\0"
	.byte	0x8
	.byte	0x7e
	.long	0x733
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "cc_trcore_t\0"
	.byte	0x8
	.byte	0x7f
	.long	0x76c
	.uleb128 0xf
	.ascii "_cc_trellis_t\0"
	.word	0x100
	.byte	0x8
	.byte	0x82
	.long	0x7d9
	.uleb128 0x4
	.ascii "trSt\0"
	.byte	0x8
	.byte	0x84
	.long	0x7d9
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x7a1
	.long	0x7e9
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.ascii "cc_trellis_t\0"
	.byte	0x8
	.byte	0x85
	.long	0x7b4
	.uleb128 0xf
	.ascii "_cc_hard_dec_info_t\0"
	.word	0xa200
	.byte	0x8
	.byte	0x88
	.long	0x844
	.uleb128 0x4
	.ascii "iter\0"
	.byte	0x8
	.byte	0x8a
	.long	0x844
	.byte	0
	.uleb128 0x10
	.ascii "dist\0"
	.byte	0x8
	.byte	0x8b
	.long	0x844
	.word	0x100
	.uleb128 0x10
	.ascii "path\0"
	.byte	0x8
	.byte	0x8c
	.long	0x854
	.word	0x200
	.byte	0
	.uleb128 0x7
	.long	0x1ca
	.long	0x854
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x86b
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.uleb128 0x11
	.long	0x2df
	.word	0x27f
	.byte	0
	.uleb128 0x6
	.ascii "cc_hard_dec_info_t\0"
	.byte	0x8
	.byte	0x8d
	.long	0x7fd
	.uleb128 0xa
	.long	0x86b
	.uleb128 0x7
	.long	0x54a
	.long	0x89a
	.uleb128 0xc
	.long	0x2df
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.long	0x88a
	.uleb128 0x12
	.ascii "CC_RATE_ARRAY\0"
	.byte	0x1
	.byte	0x17
	.long	0x89a
	.uleb128 0x5
	.byte	0x3
	.long	_CC_RATE_ARRAY
	.uleb128 0x13
	.ascii "FindMinSurvPathHard\0"
	.byte	0x1
	.word	0x282
	.long	0x188
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x92f
	.uleb128 0x14
	.ascii "inPaths\0"
	.byte	0x1
	.word	0x282
	.long	0x92f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "minDist\0"
	.byte	0x1
	.word	0x284
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.ascii "minStateIdx\0"
	.byte	0x1
	.word	0x285
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x286
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x885
	.uleb128 0x13
	.ascii "CountByteOnes\0"
	.byte	0x1
	.word	0x26a
	.long	0x188
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x988
	.uleb128 0x14
	.ascii "inByte\0"
	.byte	0x1
	.word	0x26a
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x26c
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x15
	.ascii "cnt\0"
	.byte	0x1
	.word	0x26d
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x16
	.ascii "HardDepuncturer\0"
	.byte	0x1
	.word	0x22d
	.long	0x435
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xa76
	.uleb128 0x14
	.ascii "ioBuffer\0"
	.byte	0x1
	.word	0x22d
	.long	0x4cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF0
	.byte	0x1
	.word	0x22d
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.word	0x22d
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.ascii "punctVect\0"
	.byte	0x1
	.word	0x22d
	.long	0xa76
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x22d
	.long	0xa7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x18
	.secrel32	LASF3
	.byte	0x1
	.word	0x22f
	.long	0x435
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.ascii "rdIdx\0"
	.byte	0x1
	.word	0x230
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.secrel32	LASF4
	.byte	0x1
	.word	0x231
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x232
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.ascii "rdIdxPunc\0"
	.byte	0x1
	.word	0x233
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x18
	.secrel32	LASF5
	.byte	0x1
	.word	0x234
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x15
	.ascii "rdBit\0"
	.byte	0x1
	.word	0x235
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x197
	.uleb128 0x5
	.byte	0x4
	.long	0x6f0
	.uleb128 0x16
	.ascii "ComputeTrellisDiagram\0"
	.byte	0x1
	.word	0x1eb
	.long	0x435
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xb5c
	.uleb128 0x14
	.ascii "ioTrellisDiagr\0"
	.byte	0x1
	.word	0x1eb
	.long	0xb5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.ascii "conVect\0"
	.byte	0x1
	.word	0x1eb
	.long	0xa76
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x1eb
	.long	0xa7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x18
	.secrel32	LASF3
	.byte	0x1
	.word	0x1ed
	.long	0x435
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.ascii "StBin\0"
	.byte	0x1
	.word	0x1ee
	.long	0xb62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x15
	.ascii "i\0"
	.byte	0x1
	.word	0x1ef
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x1ef
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x15
	.ascii "outBit\0"
	.byte	0x1
	.word	0x1f0
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.ascii "state0\0"
	.byte	0x1
	.word	0x1f1
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x15
	.ascii "state1\0"
	.byte	0x1
	.word	0x1f1
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x7e9
	.uleb128 0x7
	.long	0x188
	.long	0xb72
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x13
	.ascii "ComputeEncBit\0"
	.byte	0x1
	.word	0x1d4
	.long	0x188
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xbe9
	.uleb128 0x14
	.ascii "cState\0"
	.byte	0x1
	.word	0x1d4
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.ascii "cvVal\0"
	.byte	0x1
	.word	0x1d4
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.ascii "kLen\0"
	.byte	0x1
	.word	0x1d4
	.long	0x630
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.ascii "outBit\0"
	.byte	0x1
	.word	0x1d6
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x1d7
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x13
	.ascii "IsKlenValid\0"
	.byte	0x1
	.word	0x1c1
	.long	0xc2b
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xc2b
	.uleb128 0x14
	.ascii "val\0"
	.byte	0x1
	.word	0x1c1
	.long	0x630
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "bRet\0"
	.byte	0x1
	.word	0x1c3
	.long	0xc2b
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
	.word	0x1a8
	.long	0xc2b
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xc83
	.uleb128 0x14
	.ascii "val\0"
	.byte	0x1
	.word	0x1a8
	.long	0x539
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "bRet\0"
	.byte	0x1
	.word	0x1aa
	.long	0xc2b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x1ab
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x19
	.ascii "CnvCod_HardDecoder\0"
	.byte	0x1
	.byte	0xf2
	.long	0x435
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xea0
	.uleb128 0x1a
	.secrel32	LASF6
	.byte	0x1
	.byte	0xf2
	.long	0xea0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.byte	0xf2
	.long	0xea6
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0xf2
	.long	0xa7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1b
	.secrel32	LASF3
	.byte	0x1
	.byte	0xf4
	.long	0x435
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.secrel32	LASF1
	.byte	0x1
	.byte	0xf5
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.secrel32	LASF0
	.byte	0x1
	.byte	0xf6
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1b
	.secrel32	LASF8
	.byte	0x1
	.byte	0xf7
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1b
	.secrel32	LASF9
	.byte	0x1
	.byte	0xf8
	.long	0x1da
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1c
	.ascii "encInfo\0"
	.byte	0x1
	.byte	0xf9
	.long	0x753
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x1c
	.ascii "curPaths\0"
	.byte	0x1
	.byte	0xfa
	.long	0x86b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -41572
	.uleb128 0x1c
	.ascii "prevPaths\0"
	.byte	0x1
	.byte	0xfb
	.long	0x86b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83044
	.uleb128 0x1c
	.ascii "trDiagr\0"
	.byte	0x1
	.byte	0xfc
	.long	0x7e9
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83300
	.uleb128 0x1b
	.secrel32	LASF4
	.byte	0x1
	.byte	0xfd
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1c
	.ascii "inIdx\0"
	.byte	0x1
	.byte	0xfd
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1c
	.ascii "wrIdx\0"
	.byte	0x1
	.byte	0xfd
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.ascii "finIdx\0"
	.byte	0x1
	.byte	0xfd
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.ascii "candDist\0"
	.byte	0x1
	.byte	0xfe
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x1c
	.ascii "i\0"
	.byte	0x1
	.byte	0xff
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.ascii "tmpStream\0"
	.byte	0x1
	.word	0x100
	.long	0xeac
	.uleb128 0x4
	.byte	0x91
	.sleb128 -76
	.byte	0x6
	.uleb128 0x15
	.ascii "nextSt\0"
	.byte	0x1
	.word	0x101
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x15
	.ascii "minDistSt\0"
	.byte	0x1
	.word	0x101
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -93
	.uleb128 0x15
	.ascii "depSt\0"
	.byte	0x1
	.word	0x101
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -94
	.uleb128 0x15
	.ascii "arrSt\0"
	.byte	0x1
	.word	0x101
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -49
	.uleb128 0x18
	.secrel32	LASF5
	.byte	0x1
	.word	0x102
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -85
	.uleb128 0x15
	.ascii "hypIdx\0"
	.byte	0x1
	.word	0x102
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.uleb128 0x15
	.ascii "cycleBits\0"
	.byte	0x1
	.word	0x103
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -86
	.uleb128 0x15
	.ascii "hamDist\0"
	.byte	0x1
	.word	0x104
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -87
	.uleb128 0x15
	.ascii "erasMask\0"
	.byte	0x1
	.word	0x105
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -51
	.uleb128 0x15
	.ascii "j\0"
	.byte	0x1
	.word	0x106
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x4e6
	.uleb128 0x5
	.byte	0x4
	.long	0x4d1
	.uleb128 0x7
	.long	0x188
	.long	0xec0
	.uleb128 0x1d
	.long	0x2df
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0
	.uleb128 0x19
	.ascii "CnvCod_Encoder\0"
	.byte	0x1
	.byte	0x95
	.long	0x435
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xfc7
	.uleb128 0x1a
	.secrel32	LASF6
	.byte	0x1
	.byte	0x95
	.long	0xea0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.byte	0x95
	.long	0xea6
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0x95
	.long	0xa7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1b
	.secrel32	LASF3
	.byte	0x1
	.byte	0x97
	.long	0x435
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.secrel32	LASF8
	.byte	0x1
	.byte	0x98
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.secrel32	LASF9
	.byte	0x1
	.byte	0x99
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.secrel32	LASF0
	.byte	0x1
	.byte	0x9a
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.ascii "punLenBi\0"
	.byte	0x1
	.byte	0x9b
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.ascii "encInfo\0"
	.byte	0x1
	.byte	0x9c
	.long	0x753
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1c
	.ascii "wrIdx\0"
	.byte	0x1
	.byte	0x9d
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.secrel32	LASF4
	.byte	0x1
	.byte	0x9e
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1c
	.ascii "j\0"
	.byte	0x1
	.byte	0x9f
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.ascii "encState\0"
	.byte	0x1
	.byte	0xa0
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x1b
	.secrel32	LASF5
	.byte	0x1
	.byte	0xa1
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -53
	.uleb128 0x1c
	.ascii "rdBit\0"
	.byte	0x1
	.byte	0xa2
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -54
	.byte	0
	.uleb128 0x1e
	.ascii "RetrieveConnectorPuncturationVectors\0"
	.byte	0x1
	.byte	0x54
	.long	0x435
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x1034
	.uleb128 0x1f
	.ascii "ioInfo\0"
	.byte	0x1
	.byte	0x54
	.long	0x1034
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1f
	.ascii "inParams\0"
	.byte	0x1
	.byte	0x54
	.long	0xa7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.secrel32	LASF3
	.byte	0x1
	.byte	0x56
	.long	0x435
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x753
	.uleb128 0x19
	.ascii "CnvCod_ListParameters\0"
	.byte	0x1
	.byte	0x38
	.long	0x435
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x1087
	.uleb128 0x1f
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x38
	.long	0x1087
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.secrel32	LASF3
	.byte	0x1
	.byte	0x3a
	.long	0x435
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x6e0
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
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
LASF2:
	.ascii "pParams\0"
LASF9:
	.ascii "unpLenBi\0"
LASF7:
	.ascii "outStream\0"
LASF3:
	.ascii "retErr\0"
LASF5:
	.ascii "bitIdx\0"
LASF8:
	.ascii "unpLenBy\0"
LASF0:
	.ascii "inLenBi\0"
LASF6:
	.ascii "inStream\0"
LASF4:
	.ascii "byteIdx\0"
LASF1:
	.ascii "outLenBi\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
