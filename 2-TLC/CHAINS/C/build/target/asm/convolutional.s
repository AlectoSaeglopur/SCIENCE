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
	.loc 1 60 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 61 0
	movl	$0, -12(%ebp)
	.loc 1 63 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 65 0
	movl	8(%ebp), %eax
	movl	$2, (%eax)
	.loc 1 66 0
	movl	8(%ebp), %eax
	movl	$7, 4(%eax)
	.loc 1 67 0
	movl	8(%ebp), %eax
	movw	$10, 8(%eax)
	.loc 1 68 0
	movl	8(%ebp), %eax
	movl	$1, 12(%eax)
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
	.globl	_CnvCod_Encoder
	.def	_CnvCod_Encoder;	.scl	2;	.type	32;	.endef
_CnvCod_Encoder:
LFB19:
	.loc 1 90 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$80, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 91 0
	movl	$0, -12(%ebp)
	.loc 1 92 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	addl	%eax, %eax
	movl	%eax, -28(%ebp)
	.loc 1 93 0
	movl	-28(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 94 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 95 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	addl	$1, %eax
	imull	-36(%ebp), %eax
	movl	16(%ebp), %edx
	movl	(%edx), %esi
	movl	$0, %edx
	divl	%esi
	movl	%eax, -40(%ebp)
	.loc 1 96 0
	movl	-40(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -44(%ebp)
	.loc 1 98 0
	movl	$0, -68(%ebp)
	movl	$0, -64(%ebp)
	movl	$0, -60(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, -64(%ebp)
	.loc 1 99 0
	movl	$0, -16(%ebp)
	.loc 1 102 0
	movb	$0, -21(%ebp)
	.loc 1 106 0
	cmpl	$0, 8(%ebp)
	je	L6
	.loc 1 106 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L6
	.loc 1 106 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L6
	.loc 1 107 0 is_stmt 1 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 106 0 discriminator 3
	testl	%eax, %eax
	je	L6
	.loc 1 107 0
	cmpl	$0, 16(%ebp)
	je	L6
	.loc 1 109 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-56(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrieveConnectorPuncturationVectors
	.loc 1 110 0
	movl	$0, 8(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-68(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	.loc 1 112 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-44(%ebp), %eax
	jne	L7
	.loc 1 114 0
	movl	$0, -20(%ebp)
	jmp	L8
L9:
	.loc 1 116 0 discriminator 3
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 117 0 discriminator 3
	movl	-20(%ebp), %eax
	andl	$7, %eax
	movb	%al, -49(%ebp)
	.loc 1 118 0 discriminator 3
	shrb	-21(%ebp)
	.loc 1 119 0 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-49(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movl	%eax, %edx
	.loc 1 120 0 discriminator 3
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	.loc 1 119 0 discriminator 3
	movl	%eax, %edx
	movzbl	-21(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -21(%ebp)
	.loc 1 121 0 discriminator 3
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	shrl	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 122 0 discriminator 3
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	andl	$6, %eax
	movb	%al, -49(%ebp)
	.loc 1 123 0 discriminator 3
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	movzbl	-56(%ebp), %eax
	movzbl	%al, %edx
	movzbl	-21(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movzbl	%al, %edx
	.loc 1 124 0 discriminator 3
	movzbl	-49(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	.loc 1 123 0 discriminator 3
	movl	-68(%ebp), %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	movl	-68(%ebp), %ecx
	movl	-48(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %ecx
	movl	%ebx, %edx
	orl	%ecx, %edx
	movb	%dl, (%eax)
	.loc 1 125 0 discriminator 3
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	movzbl	-55(%ebp), %eax
	movzbl	%al, %edx
	movzbl	-21(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movzbl	%al, %edx
	.loc 1 126 0 discriminator 3
	movzbl	-49(%ebp), %eax
	movl	$6, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	.loc 1 125 0 discriminator 3
	movl	-68(%ebp), %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	movl	-68(%ebp), %ecx
	movl	-48(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %ecx
	movl	%ebx, %edx
	orl	%ecx, %edx
	movb	%dl, (%eax)
	.loc 1 114 0 discriminator 3
	addl	$1, -20(%ebp)
L8:
	.loc 1 114 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L9
	.loc 1 129 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L10
	.loc 1 131 0
	movl	$0, -20(%ebp)
	jmp	L11
L14:
	.loc 1 133 0
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 134 0
	movl	-20(%ebp), %eax
	andl	$7, %eax
	movb	%al, -49(%ebp)
	.loc 1 135 0
	movl	-68(%ebp), %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-49(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movb	%al, -50(%ebp)
	.loc 1 136 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	-20(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movzbl	-54(%ebp,%eax), %eax
	testb	%al, %al
	je	L12
	.loc 1 138 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 139 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -49(%ebp)
	.loc 1 140 0
	addl	$1, -16(%ebp)
	.loc 1 141 0
	cmpb	$0, -50(%ebp)
	jne	L13
	.loc 1 143 0
	movl	-68(%ebp), %edx
	movl	-48(%ebp), %eax
	addl	%eax, %edx
	movl	-68(%ebp), %ecx
	movl	-48(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-49(%ebp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	notl	%eax
	andl	%ebx, %eax
	movb	%al, (%edx)
	jmp	L12
L13:
	.loc 1 147 0
	movl	-68(%ebp), %edx
	movl	-48(%ebp), %eax
	addl	%eax, %edx
	movl	-68(%ebp), %ecx
	movl	-48(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-49(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
L12:
	.loc 1 131 0 discriminator 2
	addl	$1, -20(%ebp)
L11:
	.loc 1 131 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L14
	.loc 1 152 0 is_stmt 1
	movl	-40(%ebp), %eax
	cmpl	-16(%ebp), %eax
	je	L10
	.loc 1 154 0
	movl	$5, -12(%ebp)
L10:
	.loc 1 158 0
	cmpl	$0, -12(%ebp)
	jne	L16
	.loc 1 160 0
	movl	12(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-68(%ebp), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	jmp	L16
L7:
	.loc 1 165 0
	movl	$5, -12(%ebp)
L16:
	.loc 1 168 0
	movl	$0, 4(%esp)
	leal	-68(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	jmp	L17
L6:
	.loc 1 172 0
	movl	$1, -12(%ebp)
L17:
	.loc 1 175 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 176 0
	addl	$80, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_CnvCod_HardDecoder
	.def	_CnvCod_HardDecoder;	.scl	2;	.type	32;	.endef
_CnvCod_HardDecoder:
LFB20:
	.loc 1 189 0
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
	.loc 1 189 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 190 0
	movl	$0, -28(%ebp)
	.loc 1 191 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 192 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -52(%ebp)
	.loc 1 193 0
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
	.loc 1 194 0
	movl	-56(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -60(%ebp)
	.loc 1 196 0
	leal	-41564(%ebp), %eax
	movl	$41472, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 202 0
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
	.loc 1 210 0
	cmpl	$0, 8(%ebp)
	je	L20
	.loc 1 210 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L20
	.loc 1 210 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L20
	.loc 1 211 0 is_stmt 1 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 210 0 discriminator 3
	testl	%eax, %eax
	je	L20
	.loc 1 211 0
	cmpl	$0, 16(%ebp)
	je	L20
	.loc 1 213 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-92(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrieveConnectorPuncturationVectors
	.loc 1 214 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-92(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-83292(%ebp), %eax
	movl	%eax, (%esp)
	call	_ComputeTrellisDiagram
	.loc 1 215 0
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-68(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 216 0
	movl	$1, -41564(%ebp)
	.loc 1 218 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L21
	.loc 1 220 0
	movb	$3, -43(%ebp)
	jmp	L22
L21:
	.loc 1 224 0
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
L22:
	.loc 1 227 0
	movl	$2, -40(%ebp)
	jmp	L23
L56:
	.loc 1 229 0
	movl	-40(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -72(%ebp)
	.loc 1 230 0
	movl	-72(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 231 0
	movl	-72(%ebp), %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 232 0
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
	.loc 1 233 0
	leal	-83036(%ebp), %eax
	leal	-41564(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 234 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L24
	.loc 1 236 0
	movb	$0, -43(%ebp)
	.loc 1 237 0
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
	.loc 1 238 0
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
L24:
	.loc 1 240 0
	movb	$0, -44(%ebp)
	jmp	L25
L39:
	.loc 1 242 0
	movzbl	-44(%ebp), %eax
	movl	-83036(%ebp,%eax,4), %eax
	movl	-40(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L26
	.loc 1 244 0
	movb	$0, -42(%ebp)
	jmp	L27
L38:
	.loc 1 246 0
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
	.loc 1 247 0
	movzbl	-44(%ebp), %edx
	movzbl	-42(%ebp), %eax
	sall	$2, %edx
	leal	-24(%ebp), %ebx
	addl	%ebx, %edx
	addl	%edx, %eax
	subl	$83266, %eax
	movzbl	(%eax), %eax
	movb	%al, -80(%ebp)
	.loc 1 248 0
	movzbl	-80(%ebp), %eax
	movl	-41564(%ebp,%eax,4), %eax
	cmpl	-40(%ebp), %eax
	jnb	L28
	.loc 1 250 0
	movzbl	-80(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, -41564(%ebp,%eax,4)
	.loc 1 251 0
	movzbl	-80(%ebp), %eax
	movzbl	-44(%ebp), %edx
	addl	$64, %edx
	movl	-83036(%ebp,%edx,4), %ecx
	movzbl	-79(%ebp), %edx
	addl	%ecx, %edx
	addl	$64, %eax
	movl	%edx, -41564(%ebp,%eax,4)
	.loc 1 252 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L29
	.loc 1 254 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L30
L29:
	.loc 1 258 0
	movl	$639, -36(%ebp)
L30:
	.loc 1 260 0
	movl	$0, -32(%ebp)
	jmp	L31
L32:
	.loc 1 262 0 discriminator 3
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
	.loc 1 260 0 discriminator 3
	addl	$1, -32(%ebp)
L31:
	.loc 1 260 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L32
	.loc 1 264 0 is_stmt 1
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
	jmp	L33
L28:
	.loc 1 268 0
	movzbl	-44(%ebp), %eax
	addl	$64, %eax
	movl	-83036(%ebp,%eax,4), %edx
	movzbl	-79(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -84(%ebp)
	.loc 1 269 0
	movzbl	-80(%ebp), %eax
	addl	$64, %eax
	movl	-41564(%ebp,%eax,4), %eax
	cmpl	-84(%ebp), %eax
	jbe	L33
	.loc 1 271 0
	movzbl	-80(%ebp), %eax
	leal	64(%eax), %edx
	movl	-84(%ebp), %eax
	movl	%eax, -41564(%ebp,%edx,4)
	.loc 1 272 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L34
	.loc 1 274 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L35
L34:
	.loc 1 278 0
	movl	$639, -36(%ebp)
L35:
	.loc 1 280 0
	movl	$0, -32(%ebp)
	jmp	L36
L37:
	.loc 1 282 0 discriminator 3
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
	.loc 1 280 0 discriminator 3
	addl	$1, -32(%ebp)
L36:
	.loc 1 280 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L37
	.loc 1 284 0 is_stmt 1
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
L33:
	.loc 1 244 0 discriminator 2
	movzbl	-42(%ebp), %eax
	addl	$1, %eax
	movb	%al, -42(%ebp)
L27:
	.loc 1 244 0 is_stmt 0 discriminator 1
	cmpb	$1, -42(%ebp)
	jbe	L38
L26:
	.loc 1 240 0 is_stmt 1 discriminator 2
	movzbl	-44(%ebp), %eax
	addl	$1, %eax
	movb	%al, -44(%ebp)
L25:
	.loc 1 240 0 is_stmt 0 discriminator 1
	cmpb	$63, -44(%ebp)
	jbe	L39
	.loc 1 291 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	-48(%ebp), %eax
	jne	L40
	.loc 1 293 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathHard
	movb	%al, -85(%ebp)
	.loc 1 294 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L41
	.loc 1 296 0
	movl	$640, -36(%ebp)
	jmp	L42
L41:
	.loc 1 300 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
L42:
	.loc 1 302 0
	movl	$0, -32(%ebp)
	jmp	L43
L48:
	.loc 1 304 0
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
	.loc 1 305 0
	movl	-36(%ebp), %eax
	subl	$1, %eax
	cmpl	-32(%ebp), %eax
	jne	L44
	.loc 1 307 0
	movzbl	-85(%ebp), %eax
	movb	%al, -41(%ebp)
	jmp	L45
L44:
	.loc 1 311 0
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
L45:
	.loc 1 313 0
	movl	-48(%ebp), %eax
	subl	-36(%ebp), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 314 0
	movl	-48(%ebp), %eax
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	subl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 315 0
	movzbl	-86(%ebp), %eax
	movzbl	-83290(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L46
	.loc 1 317 0
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
	jmp	L47
L46:
	.loc 1 321 0
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
L47:
	.loc 1 302 0 discriminator 2
	addl	$1, -32(%ebp)
L43:
	.loc 1 302 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L48
	jmp	L49
L40:
	.loc 1 325 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L49
	.loc 1 327 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathHard
	movb	%al, -85(%ebp)
	.loc 1 328 0
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
	.loc 1 329 0
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
	.loc 1 330 0
	movl	-40(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 331 0
	movl	-40(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 332 0
	movzbl	-86(%ebp), %eax
	movzbl	-83290(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L50
	.loc 1 334 0
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
	jmp	L51
L50:
	.loc 1 338 0
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
L51:
	.loc 1 340 0
	movb	$0, -44(%ebp)
	jmp	L52
L55:
	.loc 1 342 0
	movl	$0, -32(%ebp)
	jmp	L53
L54:
	.loc 1 344 0 discriminator 3
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
	.loc 1 342 0 discriminator 3
	addl	$1, -32(%ebp)
L53:
	.loc 1 342 0 is_stmt 0 discriminator 1
	cmpl	$638, -32(%ebp)
	jbe	L54
	.loc 1 340 0 is_stmt 1 discriminator 2
	movzbl	-44(%ebp), %eax
	addl	$1, %eax
	movb	%al, -44(%ebp)
L52:
	.loc 1 340 0 is_stmt 0 discriminator 1
	cmpb	$63, -44(%ebp)
	jbe	L55
L49:
	.loc 1 227 0 is_stmt 1 discriminator 2
	addl	$1, -40(%ebp)
L23:
	.loc 1 227 0 is_stmt 0 discriminator 1
	movl	-48(%ebp), %eax
	addl	$2, %eax
	cmpl	-40(%ebp), %eax
	ja	L56
	.loc 1 210 0 is_stmt 1
	jmp	L57
L20:
	.loc 1 352 0
	movl	$1, -28(%ebp)
L57:
	.loc 1 355 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 356 0
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
LFE20:
	.globl	_CnvCod_SoftDecoder
	.def	_CnvCod_SoftDecoder;	.scl	2;	.type	32;	.endef
_CnvCod_SoftDecoder:
LFB21:
	.loc 1 369 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	movl	$83340, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 369 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 370 0
	movl	$0, -28(%ebp)
	.loc 1 371 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 372 0
	movl	-48(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, -52(%ebp)
	.loc 1 373 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -56(%ebp)
	.loc 1 374 0
	movl	-52(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -60(%ebp)
	movl	-52(%ebp), %eax
	sall	$2, %eax
	leal	3(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %ebx
	movl	$0, %edx
	divl	%ebx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	20(%esp), %eax
	addl	$3, %eax
	shrl	$2, %eax
	sall	$2, %eax
	movl	%eax, -64(%ebp)
	.loc 1 375 0
	leal	-41564(%ebp), %eax
	movl	$41472, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 388 0
	cmpl	$0, 8(%ebp)
	je	L60
	.loc 1 388 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L60
	.loc 1 388 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L60
	.loc 1 389 0 is_stmt 1 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 388 0 discriminator 3
	testl	%eax, %eax
	je	L60
	.loc 1 389 0
	cmpl	$0, 16(%ebp)
	je	L60
	.loc 1 391 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-83042(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrieveConnectorPuncturationVectors
	.loc 1 392 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-83042(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-83298(%ebp), %eax
	movl	%eax, (%esp)
	call	_ComputeTrellisDiagram
	.loc 1 393 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-64(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 394 0
	movl	$1, -41564(%ebp)
	.loc 1 396 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L61
	.loc 1 398 0
	movb	$3, -44(%ebp)
	jmp	L62
L61:
	.loc 1 402 0
	movl	-64(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 16(%esp)
	leal	-83042(%ebp), %edx
	addl	$2, %edx
	movl	%edx, 12(%esp)
	movl	-52(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-56(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_SoftDepuncturer
L62:
	.loc 1 405 0
	movl	$2, -40(%ebp)
	jmp	L63
L97:
	.loc 1 407 0
	movl	-40(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -68(%ebp)
	.loc 1 408 0
	leal	-83036(%ebp), %eax
	leal	-41564(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 410 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L64
	.loc 1 412 0
	movb	$0, -44(%ebp)
	.loc 1 413 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	-68(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movzbl	-83040(%ebp,%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movzbl	-44(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -44(%ebp)
	.loc 1 414 0
	movl	-68(%ebp), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movzbl	-83040(%ebp,%eax), %eax
	orb	%al, -44(%ebp)
L64:
	.loc 1 417 0
	movb	$0, -42(%ebp)
	jmp	L65
L80:
	.loc 1 419 0
	movzbl	-42(%ebp), %eax
	movl	-83036(%ebp,%eax,4), %eax
	movl	-40(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L66
	.loc 1 421 0
	movb	$0, -43(%ebp)
	jmp	L67
L79:
	.loc 1 423 0
	movzbl	-44(%ebp), %edx
	.loc 1 424 0
	movzbl	-42(%ebp), %ecx
	movzbl	-43(%ebp), %eax
	sall	$2, %ecx
	leal	-24(%ebp), %edi
	addl	%edi, %ecx
	addl	%ecx, %eax
	subl	$83274, %eax
	movzbl	(%eax), %eax
	.loc 1 423 0
	movzbl	%al, %eax
	movl	-68(%ebp), %ecx
	leal	0(,%ecx,4), %ebx
	movl	-64(%ebp), %ecx
	addl	%ebx, %ecx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_EstimateEuclideanDist
	fstps	-83308(%ebp)
	movl	-83308(%ebp), %eax
	movl	%eax, -72(%ebp)
	.loc 1 425 0
	movzbl	-42(%ebp), %edx
	movzbl	-43(%ebp), %eax
	sall	$2, %edx
	leal	-24(%ebp), %edi
	addl	%edi, %edx
	addl	%edx, %eax
	subl	$83272, %eax
	movzbl	(%eax), %eax
	movb	%al, -73(%ebp)
	.loc 1 427 0
	movzbl	-73(%ebp), %eax
	movl	-41564(%ebp,%eax,4), %eax
	cmpl	-40(%ebp), %eax
	jnb	L68
	.loc 1 429 0
	movzbl	-73(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, -41564(%ebp,%eax,4)
	.loc 1 430 0
	movzbl	-73(%ebp), %eax
	movzbl	-42(%ebp), %edx
	addl	$64, %edx
	flds	-83036(%ebp,%edx,4)
	fadds	-72(%ebp)
	addl	$64, %eax
	fstps	-41564(%ebp,%eax,4)
	.loc 1 431 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L69
	.loc 1 433 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L70
L69:
	.loc 1 437 0
	movl	$639, -36(%ebp)
L70:
	.loc 1 439 0
	movl	$0, -32(%ebp)
	jmp	L71
L72:
	.loc 1 441 0 discriminator 3
	movzbl	-73(%ebp), %edx
	movzbl	-42(%ebp), %ecx
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
	.loc 1 439 0 discriminator 3
	addl	$1, -32(%ebp)
L71:
	.loc 1 439 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L72
	.loc 1 443 0 is_stmt 1
	movzbl	-73(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	leal	-41028(%eax), %edx
	movzbl	-42(%ebp), %eax
	movb	%al, (%edx)
	jmp	L73
L68:
	.loc 1 447 0
	movzbl	-42(%ebp), %eax
	addl	$64, %eax
	flds	-83036(%ebp,%eax,4)
	fadds	-72(%ebp)
	fstps	-80(%ebp)
	.loc 1 448 0
	movzbl	-73(%ebp), %eax
	addl	$64, %eax
	flds	-41564(%ebp,%eax,4)
	flds	-80(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L73
	.loc 1 450 0
	movzbl	-73(%ebp), %eax
	addl	$64, %eax
	flds	-80(%ebp)
	fstps	-41564(%ebp,%eax,4)
	.loc 1 451 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L75
	.loc 1 453 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L76
L75:
	.loc 1 457 0
	movl	$639, -36(%ebp)
L76:
	.loc 1 459 0
	movl	$0, -32(%ebp)
	jmp	L77
L78:
	.loc 1 461 0 discriminator 3
	movzbl	-73(%ebp), %edx
	movzbl	-42(%ebp), %ecx
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
	.loc 1 459 0 discriminator 3
	addl	$1, -32(%ebp)
L77:
	.loc 1 459 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L78
	.loc 1 463 0 is_stmt 1
	movzbl	-73(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	leal	(%edi,%eax), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	leal	-41028(%eax), %edx
	movzbl	-42(%ebp), %eax
	movb	%al, (%edx)
L73:
	.loc 1 421 0 discriminator 2
	movzbl	-43(%ebp), %eax
	addl	$1, %eax
	movb	%al, -43(%ebp)
L67:
	.loc 1 421 0 is_stmt 0 discriminator 1
	cmpb	$1, -43(%ebp)
	jbe	L79
L66:
	.loc 1 417 0 is_stmt 1 discriminator 2
	movzbl	-42(%ebp), %eax
	addl	$1, %eax
	movb	%al, -42(%ebp)
L65:
	.loc 1 417 0 is_stmt 0 discriminator 1
	cmpb	$63, -42(%ebp)
	jbe	L80
	.loc 1 470 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	-48(%ebp), %eax
	jne	L81
	.loc 1 472 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathSoft
	movb	%al, -81(%ebp)
	.loc 1 473 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L82
	.loc 1 475 0
	movl	$640, -36(%ebp)
	jmp	L83
L82:
	.loc 1 479 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
L83:
	.loc 1 481 0
	movl	$0, -32(%ebp)
	jmp	L84
L89:
	.loc 1 483 0
	movzbl	-81(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	subl	$41028, %eax
	movzbl	(%eax), %eax
	movb	%al, -82(%ebp)
	.loc 1 484 0
	movl	-36(%ebp), %eax
	subl	$1, %eax
	cmpl	-32(%ebp), %eax
	jne	L85
	.loc 1 486 0
	movzbl	-81(%ebp), %eax
	movb	%al, -41(%ebp)
	jmp	L86
L85:
	.loc 1 490 0
	movzbl	-81(%ebp), %edx
	movl	-32(%ebp), %eax
	leal	1(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	addl	%edi, %eax
	addl	%ecx, %eax
	subl	$41028, %eax
	movzbl	(%eax), %eax
	movb	%al, -41(%ebp)
L86:
	.loc 1 492 0
	movl	-48(%ebp), %eax
	subl	-36(%ebp), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, -88(%ebp)
	.loc 1 493 0
	movl	-48(%ebp), %eax
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	subl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	andl	$7, %eax
	movb	%al, -89(%ebp)
	.loc 1 494 0
	movzbl	-82(%ebp), %eax
	movzbl	-83296(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L87
	.loc 1 496 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-88(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-88(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-89(%ebp), %eax
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
	jmp	L88
L87:
	.loc 1 500 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-88(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-88(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %edi
	movzbl	-89(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%edi, %eax
	movb	%al, (%edx)
L88:
	.loc 1 481 0 discriminator 2
	addl	$1, -32(%ebp)
L84:
	.loc 1 481 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L89
	jmp	L90
L81:
	.loc 1 504 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L90
	.loc 1 506 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathSoft
	movb	%al, -81(%ebp)
	.loc 1 507 0
	movzbl	-81(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	addl	%ebx, %eax
	subl	$41028, %eax
	movzbl	(%eax), %eax
	movb	%al, -82(%ebp)
	.loc 1 508 0
	movzbl	-81(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	addl	%edi, %eax
	subl	$41027, %eax
	movzbl	(%eax), %eax
	movb	%al, -41(%ebp)
	.loc 1 509 0
	movl	-40(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -88(%ebp)
	.loc 1 510 0
	movl	-40(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -89(%ebp)
	.loc 1 511 0
	movzbl	-82(%ebp), %eax
	movzbl	-83296(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L91
	.loc 1 513 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-88(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-88(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-89(%ebp), %eax
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
	jmp	L92
L91:
	.loc 1 517 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-88(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-88(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %edi
	movzbl	-89(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%edi, %eax
	movb	%al, (%edx)
L92:
	.loc 1 519 0
	movb	$0, -42(%ebp)
	jmp	L93
L96:
	.loc 1 521 0
	movl	$0, -32(%ebp)
	jmp	L94
L95:
	.loc 1 523 0 discriminator 3
	movzbl	-42(%ebp), %edx
	movzbl	-42(%ebp), %ecx
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
	.loc 1 521 0 discriminator 3
	addl	$1, -32(%ebp)
L94:
	.loc 1 521 0 is_stmt 0 discriminator 1
	cmpl	$638, -32(%ebp)
	jbe	L95
	.loc 1 519 0 is_stmt 1 discriminator 2
	movzbl	-42(%ebp), %eax
	addl	$1, %eax
	movb	%al, -42(%ebp)
L93:
	.loc 1 519 0 is_stmt 0 discriminator 1
	cmpb	$63, -42(%ebp)
	jbe	L96
L90:
	.loc 1 405 0 is_stmt 1 discriminator 2
	addl	$1, -40(%ebp)
L63:
	.loc 1 405 0 is_stmt 0 discriminator 1
	movl	-48(%ebp), %eax
	addl	$2, %eax
	cmpl	-40(%ebp), %eax
	ja	L97
	.loc 1 388 0 is_stmt 1
	jmp	L98
L60:
	.loc 1 531 0
	movl	$1, -28(%ebp)
L98:
	.loc 1 534 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 535 0
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
	.def	_RetrieveConnectorPuncturationVectors;	.scl	3;	.type	32;	.endef
_RetrieveConnectorPuncturationVectors:
LFB22:
	.loc 1 552 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	.loc 1 553 0
	movl	$0, -12(%ebp)
	.loc 1 555 0
	cmpl	$0, 8(%ebp)
	je	L102
	.loc 1 555 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L102
	.loc 1 557 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_IsKlenValid
	testb	%al, %al
	je	L103
	.loc 1 560 0
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
	jmp	L104
L103:
	.loc 1 564 0
	movl	$4, -12(%ebp)
L104:
	.loc 1 567 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_IsRateValid
	testb	%al, %al
	je	L105
	.loc 1 569 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	L107
	cmpl	$3, %eax
	ja	L108
	cmpl	$2, %eax
	je	L109
	.loc 1 589 0
	jmp	L113
L108:
	.loc 1 569 0
	cmpl	$5, %eax
	je	L110
	cmpl	$7, %eax
	je	L111
	.loc 1 589 0
	jmp	L113
L109:
	.loc 1 572 0
	movb	$1, -46(%ebp)
	movb	$1, -45(%ebp)
	movb	$0, -44(%ebp)
	movb	$1, -43(%ebp)
	movl	8(%ebp), %eax
	leal	2(%eax), %edx
	movl	-46(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 573 0
	jmp	L113
L107:
	.loc 1 576 0
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
	.loc 1 577 0
	jmp	L113
L110:
	.loc 1 580 0
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
	.loc 1 581 0
	jmp	L113
L111:
	.loc 1 584 0
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
	.loc 1 585 0
	jmp	L113
L105:
	.loc 1 594 0
	movl	$3, -12(%ebp)
	.loc 1 567 0
	jmp	L114
L113:
	.loc 1 567 0 is_stmt 0 discriminator 2
	jmp	L114
L102:
	.loc 1 599 0 is_stmt 1
	movl	$1, -12(%ebp)
L114:
	.loc 1 602 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 603 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_IsRateValid;	.scl	3;	.type	32;	.endef
_IsRateValid:
LFB23:
	.loc 1 614 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 615 0
	movb	$0, -1(%ebp)
	.loc 1 618 0
	movb	$0, -2(%ebp)
	jmp	L117
L120:
	.loc 1 620 0
	movzbl	-2(%ebp), %eax
	movl	_CC_RATE_ARRAY(,%eax,4), %eax
	cmpl	8(%ebp), %eax
	jne	L118
	.loc 1 622 0
	movb	$1, -1(%ebp)
	.loc 1 623 0
	jmp	L119
L118:
	.loc 1 618 0 discriminator 2
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L117:
	.loc 1 618 0 is_stmt 0 discriminator 1
	cmpb	$4, -2(%ebp)
	jbe	L120
L119:
	.loc 1 627 0 is_stmt 1
	movzbl	-1(%ebp), %eax
	.loc 1 628 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	_IsKlenValid;	.scl	3;	.type	32;	.endef
_IsKlenValid:
LFB24:
	.loc 1 639 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 642 0
	cmpl	$2, 8(%ebp)
	jbe	L123
	.loc 1 642 0 is_stmt 0 discriminator 1
	cmpl	$8, 8(%ebp)
	ja	L123
	.loc 1 642 0 discriminator 3
	movl	$1, %eax
	jmp	L124
L123:
	.loc 1 642 0 discriminator 4
	movl	$0, %eax
L124:
	.loc 1 642 0 discriminator 6
	movb	%al, -1(%ebp)
	andb	$1, -1(%ebp)
	.loc 1 644 0 is_stmt 1 discriminator 6
	movzbl	-1(%ebp), %eax
	.loc 1 645 0 discriminator 6
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.def	_ComputeEncBit;	.scl	3;	.type	32;	.endef
_ComputeEncBit:
LFB25:
	.loc 1 658 0
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
	.loc 1 659 0
	movb	$0, -5(%ebp)
	.loc 1 662 0
	movb	$0, -6(%ebp)
	jmp	L127
L128:
	.loc 1 664 0 discriminator 3
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
	.loc 1 662 0 discriminator 3
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L127:
	.loc 1 662 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %eax
	cmpl	16(%ebp), %eax
	jb	L128
	.loc 1 667 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 668 0
	addl	$24, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.def	_ComputeTrellisDiagram;	.scl	3;	.type	32;	.endef
_ComputeTrellisDiagram:
LFB26:
	.loc 1 681 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$104, %esp
	.loc 1 682 0
	movl	$0, -12(%ebp)
	.loc 1 688 0
	cmpl	$0, 8(%ebp)
	je	L131
	.loc 1 690 0
	movb	$0, -14(%ebp)
	jmp	L132
L133:
	.loc 1 692 0 discriminator 3
	movzbl	-14(%ebp), %eax
	movzbl	-14(%ebp), %edx
	movb	%dl, -81(%ebp,%eax)
	.loc 1 690 0 discriminator 3
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L132:
	.loc 1 690 0 is_stmt 0 discriminator 1
	cmpb	$63, -14(%ebp)
	jbe	L133
	.loc 1 694 0 is_stmt 1
	movb	$0, -14(%ebp)
	jmp	L134
L143:
	.loc 1 696 0
	movzbl	-14(%ebp), %eax
	movzbl	-81(%ebp,%eax), %eax
	movb	%al, -15(%ebp)
	.loc 1 697 0
	movb	$0, -13(%ebp)
	jmp	L135
L138:
	.loc 1 699 0
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
	.loc 1 700 0
	cmpb	$0, -13(%ebp)
	jne	L136
	.loc 1 702 0
	movzbl	-14(%ebp), %edx
	movzbl	-16(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	8(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
	jmp	L137
L136:
	.loc 1 706 0
	movzbl	-14(%ebp), %edx
	movzbl	-14(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	(%eax,%ecx,4), %ecx
	movzbl	-16(%ebp), %eax
	addl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
L137:
	.loc 1 697 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L135:
	.loc 1 697 0 is_stmt 0 discriminator 1
	cmpb	$1, -13(%ebp)
	jbe	L138
	.loc 1 709 0 is_stmt 1
	movzbl	-14(%ebp), %edx
	movzbl	-15(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 2(%eax,%edx,4)
	.loc 1 710 0
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
	.loc 1 711 0
	movb	$0, -13(%ebp)
	jmp	L139
L142:
	.loc 1 713 0
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
	.loc 1 714 0
	cmpb	$0, -13(%ebp)
	jne	L140
	.loc 1 716 0
	movzbl	-14(%ebp), %edx
	movzbl	-16(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	8(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
	jmp	L141
L140:
	.loc 1 720 0
	movzbl	-14(%ebp), %edx
	movzbl	-14(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	1(%eax,%ecx,4), %ecx
	movzbl	-16(%ebp), %eax
	addl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
L141:
	.loc 1 711 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L139:
	.loc 1 711 0 is_stmt 0 discriminator 1
	cmpb	$1, -13(%ebp)
	jbe	L142
	.loc 1 723 0 is_stmt 1 discriminator 2
	movzbl	-14(%ebp), %edx
	movzbl	-17(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 3(%eax,%edx,4)
	.loc 1 694 0 discriminator 2
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L134:
	.loc 1 694 0 is_stmt 0 discriminator 1
	cmpb	$63, -14(%ebp)
	jbe	L143
	jmp	L144
L131:
	.loc 1 728 0 is_stmt 1
	movl	$1, -12(%ebp)
L144:
	.loc 1 731 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 732 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_HardDepuncturer;	.scl	3;	.type	32;	.endef
_HardDepuncturer:
LFB27:
	.loc 1 747 0
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
	.loc 1 748 0
	movl	$0, -12(%ebp)
	.loc 1 749 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	.loc 1 752 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	.loc 1 756 0
	cmpl	$0, 8(%ebp)
	je	L147
	.loc 1 758 0
	movl	16(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	L148
L155:
	.loc 1 760 0
	movzbl	-21(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L149
	.loc 1 762 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 763 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 764 0
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
	.loc 1 765 0
	subl	$1, -16(%ebp)
	jmp	L150
L149:
	.loc 1 769 0
	movb	$0, -22(%ebp)
L150:
	.loc 1 771 0
	cmpb	$0, -21(%ebp)
	je	L151
	.loc 1 773 0
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	jmp	L152
L151:
	.loc 1 777 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
L152:
	.loc 1 779 0
	movl	-20(%ebp), %eax
	subl	$1, %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 780 0
	movl	-20(%ebp), %eax
	negl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 781 0
	cmpb	$0, -22(%ebp)
	jne	L153
	.loc 1 783 0
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
	jmp	L154
L153:
	.loc 1 787 0
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
L154:
	.loc 1 758 0 discriminator 2
	subl	$1, -20(%ebp)
L148:
	.loc 1 758 0 is_stmt 0 discriminator 1
	cmpl	$0, -20(%ebp)
	jne	L155
	jmp	L156
L147:
	.loc 1 793 0 is_stmt 1
	movl	$1, -12(%ebp)
L156:
	.loc 1 796 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 797 0
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
LFE27:
	.def	_CountByteOnes;	.scl	3;	.type	32;	.endef
_CountByteOnes:
LFB28:
	.loc 1 808 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	.loc 1 810 0
	movb	$0, -2(%ebp)
	.loc 1 812 0
	movb	$0, -1(%ebp)
	jmp	L159
L161:
	.loc 1 814 0
	movzbl	-20(%ebp), %edx
	movzbl	-1(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L160
	.loc 1 816 0
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L160:
	.loc 1 812 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L159:
	.loc 1 812 0 is_stmt 0 discriminator 1
	cmpb	$7, -1(%ebp)
	jbe	L161
	.loc 1 820 0 is_stmt 1
	movzbl	-2(%ebp), %eax
	.loc 1 821 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.def	_FindMinSurvPathHard;	.scl	3;	.type	32;	.endef
_FindMinSurvPathHard:
LFB29:
	.loc 1 832 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 837 0
	cmpl	$0, 8(%ebp)
	je	L164
	.loc 1 839 0
	movl	8(%ebp), %eax
	movl	256(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 840 0
	movb	$0, -5(%ebp)
	.loc 1 841 0
	movb	$1, -6(%ebp)
	jmp	L165
L167:
	.loc 1 843 0
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L166
	.loc 1 843 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	cmpl	-4(%ebp), %eax
	jnb	L166
	.loc 1 845 0 is_stmt 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, -4(%ebp)
	.loc 1 846 0
	movzbl	-6(%ebp), %eax
	movb	%al, -5(%ebp)
L166:
	.loc 1 841 0 discriminator 2
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L165:
	.loc 1 841 0 is_stmt 0 discriminator 1
	cmpb	$63, -6(%ebp)
	jbe	L167
L164:
	.loc 1 851 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 852 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.def	_SoftDepuncturer;	.scl	3;	.type	32;	.endef
_SoftDepuncturer:
LFB30:
	.loc 1 867 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 868 0
	movl	$0, -12(%ebp)
	.loc 1 869 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	.loc 1 871 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	.loc 1 873 0
	cmpl	$0, 8(%ebp)
	je	L170
	.loc 1 875 0
	movl	16(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	L171
L176:
	.loc 1 877 0
	movzbl	-21(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L172
	.loc 1 879 0
	movl	-20(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	leal	0(,%edx,4), %ecx
	movl	8(%ebp), %edx
	addl	%ecx, %edx
	flds	(%edx)
	fstps	(%eax)
	.loc 1 880 0
	subl	$1, -16(%ebp)
	jmp	L173
L172:
	.loc 1 884 0
	movl	-20(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	fldz
	fstps	(%eax)
L173:
	.loc 1 886 0
	cmpb	$0, -21(%ebp)
	je	L174
	.loc 1 888 0
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	jmp	L175
L174:
	.loc 1 892 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
L175:
	.loc 1 875 0 discriminator 2
	subl	$1, -20(%ebp)
L171:
	.loc 1 875 0 is_stmt 0 discriminator 1
	cmpl	$0, -20(%ebp)
	jne	L176
	jmp	L177
L170:
	.loc 1 899 0 is_stmt 1
	movl	$1, -12(%ebp)
L177:
	.loc 1 902 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 903 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.def	_EstimateEuclideanDist;	.scl	3;	.type	32;	.endef
_EstimateEuclideanDist:
LFB31:
	.loc 1 916 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$28, %esp
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
	movb	%dl, -20(%ebp)
	movb	%al, -24(%ebp)
	.loc 1 918 0
	fldz
	fstps	-8(%ebp)
	.loc 1 920 0
	cmpl	$0, 8(%ebp)
	je	L180
	.loc 1 922 0
	movb	$0, -1(%ebp)
	jmp	L181
L183:
	.loc 1 924 0
	movzbl	-24(%ebp), %edx
	movzbl	-1(%ebp), %eax
	movl	$1, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L182
	.loc 1 926 0
	movzbl	-20(%ebp), %edx
	movzbl	-1(%ebp), %eax
	movl	$1, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movl	%eax, -28(%ebp)
	fildl	-28(%ebp)
	fld	%st(0)
	faddp	%st, %st(1)
	fld1
	fsubrp	%st, %st(1)
	movzbl	-1(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fsubrp	%st, %st(1)
	fabs
	flds	-8(%ebp)
	faddp	%st, %st(1)
	fstps	-8(%ebp)
L182:
	.loc 1 922 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L181:
	.loc 1 922 0 is_stmt 0 discriminator 1
	cmpb	$1, -1(%ebp)
	jbe	L183
L180:
	.loc 1 931 0 is_stmt 1
	flds	-8(%ebp)
	.loc 1 932 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.def	_FindMinSurvPathSoft;	.scl	3;	.type	32;	.endef
_FindMinSurvPathSoft:
LFB32:
	.loc 1 943 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 948 0
	cmpl	$0, 8(%ebp)
	je	L186
	.loc 1 950 0
	movl	8(%ebp), %eax
	flds	256(%eax)
	fstps	-4(%ebp)
	.loc 1 951 0
	movb	$0, -5(%ebp)
	.loc 1 952 0
	movb	$1, -6(%ebp)
	jmp	L187
L190:
	.loc 1 954 0
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L188
	.loc 1 954 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	flds	(%eax,%edx,4)
	flds	-4(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L188
	.loc 1 956 0 is_stmt 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	flds	(%eax,%edx,4)
	fstps	-4(%ebp)
	.loc 1 957 0
	movzbl	-6(%ebp), %eax
	movb	%al, -5(%ebp)
L188:
	.loc 1 952 0 discriminator 2
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L187:
	.loc 1 952 0 is_stmt 0 discriminator 1
	cmpb	$63, -6(%ebp)
	jbe	L190
L186:
	.loc 1 962 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 963 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE32:
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
	.long	0x1529
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
	.uleb128 0xa
	.long	0x345
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x6
	.byte	0x1b
	.long	0x458
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
	.ascii "ERR_INV_MODULATION_TYPE\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "ERR_INV_MODULATION_BPS\0"
	.byte	0x9
	.uleb128 0xe
	.ascii "ERR_INV_CHANNEL_TYPE\0"
	.byte	0xa
	.uleb128 0xe
	.ascii "ERR_NUM\0"
	.byte	0xb
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x6
	.byte	0x29
	.long	0x353
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x7
	.byte	0x1d
	.long	0x4b1
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
	.byte	0x7
	.byte	0x21
	.long	0x467
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x24
	.long	0x502
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x26
	.long	0x502
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x27
	.long	0x1ca
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x28
	.long	0x4b1
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x188
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x29
	.long	0x4c6
	.uleb128 0xa
	.long	0x508
	.uleb128 0x3
	.ascii "_float_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x2c
	.long	0x55f
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x2e
	.long	0x55f
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x2f
	.long	0x1ca
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x30
	.long	0x4b1
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x345
	.uleb128 0x6
	.ascii "float_stream_t\0"
	.byte	0x7
	.byte	0x31
	.long	0x522
	.uleb128 0xa
	.long	0x565
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x45
	.long	0x5ce
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
	.long	0x580
	.uleb128 0xa
	.long	0x5ce
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x4b
	.long	0x654
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
	.long	0x6c5
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
	.long	0x654
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x63
	.long	0x712
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
	.long	0x6d6
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0x8
	.byte	0x6b
	.long	0x775
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0x8
	.byte	0x6d
	.long	0x5ce
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0x8
	.byte	0x6e
	.long	0x6c5
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
	.long	0x712
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0x8
	.byte	0x71
	.long	0x729
	.uleb128 0xa
	.long	0x775
	.uleb128 0x3
	.ascii "_cc_encoder_info_t\0"
	.byte	0x6
	.byte	0x8
	.byte	0x74
	.long	0x7c8
	.uleb128 0x4
	.ascii "connVect\0"
	.byte	0x8
	.byte	0x76
	.long	0x7c8
	.byte	0
	.uleb128 0x4
	.ascii "puncVect\0"
	.byte	0x8
	.byte	0x77
	.long	0x7d8
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x7d8
	.uleb128 0xc
	.long	0x2df
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x7e8
	.uleb128 0xc
	.long	0x2df
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.ascii "cc_encoder_info_t\0"
	.byte	0x8
	.byte	0x78
	.long	0x78a
	.uleb128 0x3
	.ascii "_cc_trcore_t\0"
	.byte	0x4
	.byte	0x8
	.byte	0x7b
	.long	0x833
	.uleb128 0x4
	.ascii "outBits\0"
	.byte	0x8
	.byte	0x7d
	.long	0x7c8
	.byte	0
	.uleb128 0xf
	.secrel32	LASF0
	.byte	0x8
	.byte	0x7e
	.long	0x7c8
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "cc_trcore_t\0"
	.byte	0x8
	.byte	0x7f
	.long	0x801
	.uleb128 0x10
	.ascii "_cc_trellis_t\0"
	.word	0x100
	.byte	0x8
	.byte	0x82
	.long	0x86b
	.uleb128 0x4
	.ascii "trSt\0"
	.byte	0x8
	.byte	0x84
	.long	0x86b
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x833
	.long	0x87b
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.ascii "cc_trellis_t\0"
	.byte	0x8
	.byte	0x85
	.long	0x846
	.uleb128 0x10
	.ascii "_cc_hard_dec_info_t\0"
	.word	0xa200
	.byte	0x8
	.byte	0x88
	.long	0x8d6
	.uleb128 0x4
	.ascii "iter\0"
	.byte	0x8
	.byte	0x8a
	.long	0x8d6
	.byte	0
	.uleb128 0x11
	.ascii "dist\0"
	.byte	0x8
	.byte	0x8b
	.long	0x8d6
	.word	0x100
	.uleb128 0x11
	.ascii "path\0"
	.byte	0x8
	.byte	0x8c
	.long	0x8e6
	.word	0x200
	.byte	0
	.uleb128 0x7
	.long	0x1ca
	.long	0x8e6
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x8fd
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.uleb128 0x12
	.long	0x2df
	.word	0x27f
	.byte	0
	.uleb128 0x6
	.ascii "cc_hard_dec_info_t\0"
	.byte	0x8
	.byte	0x8d
	.long	0x88f
	.uleb128 0xa
	.long	0x8fd
	.uleb128 0x10
	.ascii "_cc_soft_dec_info_t\0"
	.word	0xa200
	.byte	0x8
	.byte	0x91
	.long	0x963
	.uleb128 0x4
	.ascii "iter\0"
	.byte	0x8
	.byte	0x93
	.long	0x8d6
	.byte	0
	.uleb128 0x11
	.ascii "dist\0"
	.byte	0x8
	.byte	0x94
	.long	0x963
	.word	0x100
	.uleb128 0x11
	.ascii "path\0"
	.byte	0x8
	.byte	0x95
	.long	0x8e6
	.word	0x200
	.byte	0
	.uleb128 0x7
	.long	0x345
	.long	0x973
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.ascii "cc_soft_dec_info_t\0"
	.byte	0x8
	.byte	0x96
	.long	0x91c
	.uleb128 0xa
	.long	0x973
	.uleb128 0x7
	.long	0x5df
	.long	0x9a2
	.uleb128 0xc
	.long	0x2df
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.long	0x992
	.uleb128 0x13
	.ascii "CC_RATE_ARRAY\0"
	.byte	0x1
	.byte	0x17
	.long	0x9a2
	.uleb128 0x5
	.byte	0x3
	.long	_CC_RATE_ARRAY
	.uleb128 0x14
	.ascii "FindMinSurvPathSoft\0"
	.byte	0x1
	.word	0x3ae
	.long	0x188
	.long	LFB32
	.long	LFE32-LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0xa34
	.uleb128 0x15
	.ascii "inPaths\0"
	.byte	0x1
	.word	0x3ae
	.long	0xa34
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "minDist\0"
	.byte	0x1
	.word	0x3b0
	.long	0x345
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.ascii "minStIdx\0"
	.byte	0x1
	.word	0x3b1
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x3b2
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x98d
	.uleb128 0x14
	.ascii "EstimateEuclideanDist\0"
	.byte	0x1
	.word	0x393
	.long	0x345
	.long	LFB31
	.long	LFE31-LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0xab7
	.uleb128 0x15
	.ascii "inBuf\0"
	.byte	0x1
	.word	0x393
	.long	0xab7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "trlByte\0"
	.byte	0x1
	.word	0x393
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.word	0x393
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x395
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x16
	.ascii "Dist\0"
	.byte	0x1
	.word	0x396
	.long	0x345
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x34e
	.uleb128 0x18
	.ascii "SoftDepuncturer\0"
	.byte	0x1
	.word	0x362
	.long	0x458
	.long	LFB30
	.long	LFE30-LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0xb65
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x362
	.long	0x55f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF3
	.byte	0x1
	.word	0x362
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF4
	.byte	0x1
	.word	0x362
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF5
	.byte	0x1
	.word	0x362
	.long	0xb65
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x17
	.secrel32	LASF6
	.byte	0x1
	.word	0x362
	.long	0xb6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x19
	.secrel32	LASF7
	.byte	0x1
	.word	0x364
	.long	0x458
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "i\0"
	.byte	0x1
	.word	0x365
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x366
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "k\0"
	.byte	0x1
	.word	0x367
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x197
	.uleb128 0x5
	.byte	0x4
	.long	0x785
	.uleb128 0x14
	.ascii "FindMinSurvPathHard\0"
	.byte	0x1
	.word	0x33f
	.long	0x188
	.long	LFB29
	.long	LFE29-LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0xbe6
	.uleb128 0x15
	.ascii "inPaths\0"
	.byte	0x1
	.word	0x33f
	.long	0xbe6
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "minDist\0"
	.byte	0x1
	.word	0x341
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.ascii "minStateIdx\0"
	.byte	0x1
	.word	0x342
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x343
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x917
	.uleb128 0x14
	.ascii "CountByteOnes\0"
	.byte	0x1
	.word	0x327
	.long	0x188
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0xc3f
	.uleb128 0x15
	.ascii "inByte\0"
	.byte	0x1
	.word	0x327
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x329
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x16
	.ascii "cnt\0"
	.byte	0x1
	.word	0x32a
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x18
	.ascii "HardDepuncturer\0"
	.byte	0x1
	.word	0x2ea
	.long	0x458
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xd22
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x2ea
	.long	0x502
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF3
	.byte	0x1
	.word	0x2ea
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF4
	.byte	0x1
	.word	0x2ea
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF5
	.byte	0x1
	.word	0x2ea
	.long	0xb65
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x17
	.secrel32	LASF6
	.byte	0x1
	.word	0x2ea
	.long	0xb6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x19
	.secrel32	LASF7
	.byte	0x1
	.word	0x2ec
	.long	0x458
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "rdIdx\0"
	.byte	0x1
	.word	0x2ed
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.secrel32	LASF8
	.byte	0x1
	.word	0x2ee
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x2ef
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "rdIdxPunc\0"
	.byte	0x1
	.word	0x2f0
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x19
	.secrel32	LASF9
	.byte	0x1
	.word	0x2f1
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x16
	.ascii "rdBit\0"
	.byte	0x1
	.word	0x2f2
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.byte	0
	.uleb128 0x18
	.ascii "ComputeTrellisDiagram\0"
	.byte	0x1
	.word	0x2a8
	.long	0x458
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xdfc
	.uleb128 0x15
	.ascii "ioTrellisDiagr\0"
	.byte	0x1
	.word	0x2a8
	.long	0xdfc
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "conVect\0"
	.byte	0x1
	.word	0x2a8
	.long	0xb65
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF6
	.byte	0x1
	.word	0x2a8
	.long	0xb6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.secrel32	LASF7
	.byte	0x1
	.word	0x2aa
	.long	0x458
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "StBin\0"
	.byte	0x1
	.word	0x2ab
	.long	0xe02
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x16
	.ascii "i\0"
	.byte	0x1
	.word	0x2ac
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x2ac
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.ascii "outBit\0"
	.byte	0x1
	.word	0x2ad
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "state0\0"
	.byte	0x1
	.word	0x2ae
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x16
	.ascii "state1\0"
	.byte	0x1
	.word	0x2ae
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x87b
	.uleb128 0x7
	.long	0x188
	.long	0xe12
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x14
	.ascii "ComputeEncBit\0"
	.byte	0x1
	.word	0x291
	.long	0x188
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xe89
	.uleb128 0x15
	.ascii "cState\0"
	.byte	0x1
	.word	0x291
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.ascii "cvVal\0"
	.byte	0x1
	.word	0x291
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.ascii "kLen\0"
	.byte	0x1
	.word	0x291
	.long	0x6c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x16
	.ascii "outBit\0"
	.byte	0x1
	.word	0x293
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x294
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.ascii "IsKlenValid\0"
	.byte	0x1
	.word	0x27e
	.long	0xecb
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xecb
	.uleb128 0x15
	.ascii "val\0"
	.byte	0x1
	.word	0x27e
	.long	0x6c5
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "bRet\0"
	.byte	0x1
	.word	0x280
	.long	0xecb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x14
	.ascii "IsRateValid\0"
	.byte	0x1
	.word	0x265
	.long	0xecb
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xf23
	.uleb128 0x15
	.ascii "val\0"
	.byte	0x1
	.word	0x265
	.long	0x5ce
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "bRet\0"
	.byte	0x1
	.word	0x267
	.long	0xecb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x268
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x18
	.ascii "RetrieveConnectorPuncturationVectors\0"
	.byte	0x1
	.word	0x227
	.long	0x458
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xf94
	.uleb128 0x15
	.ascii "ioInfo\0"
	.byte	0x1
	.word	0x227
	.long	0xf94
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "inParams\0"
	.byte	0x1
	.word	0x227
	.long	0xb6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF7
	.byte	0x1
	.word	0x229
	.long	0x458
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x7e8
	.uleb128 0x1a
	.ascii "CnvCod_SoftDecoder\0"
	.byte	0x1
	.word	0x170
	.long	0x458
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x118f
	.uleb128 0x17
	.secrel32	LASF10
	.byte	0x1
	.word	0x170
	.long	0x118f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF11
	.byte	0x1
	.word	0x170
	.long	0x1195
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF6
	.byte	0x1
	.word	0x170
	.long	0xb6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.secrel32	LASF7
	.byte	0x1
	.word	0x172
	.long	0x458
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.secrel32	LASF4
	.byte	0x1
	.word	0x173
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x19
	.secrel32	LASF12
	.byte	0x1
	.word	0x174
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x19
	.secrel32	LASF13
	.byte	0x1
	.word	0x175
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x19
	.secrel32	LASF14
	.byte	0x1
	.word	0x176
	.long	0x119b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0x19
	.secrel32	LASF15
	.byte	0x1
	.word	0x177
	.long	0x973
	.uleb128 0x4
	.byte	0x91
	.sleb128 -41572
	.uleb128 0x19
	.secrel32	LASF16
	.byte	0x1
	.word	0x178
	.long	0x973
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83044
	.uleb128 0x19
	.secrel32	LASF17
	.byte	0x1
	.word	0x179
	.long	0x7e8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83050
	.uleb128 0x16
	.ascii "trDiagr\0"
	.byte	0x1
	.word	0x17a
	.long	0x87b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83306
	.uleb128 0x16
	.ascii "eucliDist\0"
	.byte	0x1
	.word	0x17b
	.long	0x345
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x19
	.secrel32	LASF18
	.byte	0x1
	.word	0x17b
	.long	0x345
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x16
	.ascii "curIdx\0"
	.byte	0x1
	.word	0x17c
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x16
	.ascii "wrIdx\0"
	.byte	0x1
	.word	0x17c
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.ascii "finIdx\0"
	.byte	0x1
	.word	0x17c
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x19
	.secrel32	LASF8
	.byte	0x1
	.word	0x17d
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x16
	.ascii "i\0"
	.byte	0x1
	.word	0x17e
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.word	0x17f
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -81
	.uleb128 0x16
	.ascii "minDistState\0"
	.byte	0x1
	.word	0x17f
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x16
	.ascii "stateDep\0"
	.byte	0x1
	.word	0x180
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -90
	.uleb128 0x16
	.ascii "stateArr\0"
	.byte	0x1
	.word	0x180
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -49
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x181
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.uleb128 0x19
	.secrel32	LASF9
	.byte	0x1
	.word	0x181
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -97
	.uleb128 0x16
	.ascii "hypIdx\0"
	.byte	0x1
	.word	0x181
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -51
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.word	0x182
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x57b
	.uleb128 0x5
	.byte	0x4
	.long	0x508
	.uleb128 0x7
	.long	0x345
	.long	0x11af
	.uleb128 0x1b
	.long	0x2df
	.uleb128 0x4
	.byte	0x91
	.sleb128 -68
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.ascii "CnvCod_HardDecoder\0"
	.byte	0x1
	.byte	0xbc
	.long	0x458
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x139f
	.uleb128 0x1d
	.secrel32	LASF10
	.byte	0x1
	.byte	0xbc
	.long	0x139f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.secrel32	LASF11
	.byte	0x1
	.byte	0xbc
	.long	0x1195
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1d
	.secrel32	LASF6
	.byte	0x1
	.byte	0xbc
	.long	0xb6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1e
	.secrel32	LASF7
	.byte	0x1
	.byte	0xbe
	.long	0x458
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.secrel32	LASF4
	.byte	0x1
	.byte	0xbf
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1e
	.secrel32	LASF3
	.byte	0x1
	.byte	0xc0
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1e
	.secrel32	LASF19
	.byte	0x1
	.byte	0xc1
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1e
	.secrel32	LASF12
	.byte	0x1
	.byte	0xc2
	.long	0x1da
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1e
	.secrel32	LASF17
	.byte	0x1
	.byte	0xc3
	.long	0x7e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x1e
	.secrel32	LASF15
	.byte	0x1
	.byte	0xc4
	.long	0x8fd
	.uleb128 0x4
	.byte	0x91
	.sleb128 -41572
	.uleb128 0x1e
	.secrel32	LASF16
	.byte	0x1
	.byte	0xc5
	.long	0x8fd
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83044
	.uleb128 0x1f
	.ascii "trDiagr\0"
	.byte	0x1
	.byte	0xc6
	.long	0x87b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83300
	.uleb128 0x1e
	.secrel32	LASF8
	.byte	0x1
	.byte	0xc7
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1f
	.ascii "inIdx\0"
	.byte	0x1
	.byte	0xc7
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1f
	.ascii "wrIdx\0"
	.byte	0x1
	.byte	0xc7
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.ascii "finIdx\0"
	.byte	0x1
	.byte	0xc7
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1e
	.secrel32	LASF18
	.byte	0x1
	.byte	0xc8
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x1f
	.ascii "i\0"
	.byte	0x1
	.byte	0xc9
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1e
	.secrel32	LASF14
	.byte	0x1
	.byte	0xca
	.long	0x13a5
	.uleb128 0x4
	.byte	0x91
	.sleb128 -76
	.byte	0x6
	.uleb128 0x1e
	.secrel32	LASF0
	.byte	0x1
	.byte	0xcb
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1f
	.ascii "minDistSt\0"
	.byte	0x1
	.byte	0xcb
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -93
	.uleb128 0x1f
	.ascii "depSt\0"
	.byte	0x1
	.byte	0xcb
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -94
	.uleb128 0x1f
	.ascii "arrSt\0"
	.byte	0x1
	.byte	0xcb
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -49
	.uleb128 0x1e
	.secrel32	LASF9
	.byte	0x1
	.byte	0xcc
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -85
	.uleb128 0x1f
	.ascii "hypIdx\0"
	.byte	0x1
	.byte	0xcc
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.uleb128 0x1f
	.ascii "cycleBits\0"
	.byte	0x1
	.byte	0xcd
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -86
	.uleb128 0x1f
	.ascii "hamDist\0"
	.byte	0x1
	.byte	0xce
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -87
	.uleb128 0x1e
	.secrel32	LASF1
	.byte	0x1
	.byte	0xcf
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -51
	.uleb128 0x1f
	.ascii "j\0"
	.byte	0x1
	.byte	0xd0
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x51d
	.uleb128 0x7
	.long	0x188
	.long	0x13b9
	.uleb128 0x1b
	.long	0x2df
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.ascii "CnvCod_Encoder\0"
	.byte	0x1
	.byte	0x59
	.long	0x458
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x14d9
	.uleb128 0x1d
	.secrel32	LASF10
	.byte	0x1
	.byte	0x59
	.long	0x139f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.secrel32	LASF11
	.byte	0x1
	.byte	0x59
	.long	0x1195
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1d
	.secrel32	LASF6
	.byte	0x1
	.byte	0x59
	.long	0xb6b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1e
	.secrel32	LASF7
	.byte	0x1
	.byte	0x5b
	.long	0x458
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.secrel32	LASF19
	.byte	0x1
	.byte	0x5c
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.secrel32	LASF12
	.byte	0x1
	.byte	0x5d
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.secrel32	LASF3
	.byte	0x1
	.byte	0x5e
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1e
	.secrel32	LASF13
	.byte	0x1
	.byte	0x5f
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.ascii "punLenBy\0"
	.byte	0x1
	.byte	0x60
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1e
	.secrel32	LASF17
	.byte	0x1
	.byte	0x61
	.long	0x7e8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1e
	.secrel32	LASF14
	.byte	0x1
	.byte	0x62
	.long	0x508
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1f
	.ascii "wrIdx\0"
	.byte	0x1
	.byte	0x63
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.secrel32	LASF8
	.byte	0x1
	.byte	0x64
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.ascii "j\0"
	.byte	0x1
	.byte	0x65
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1f
	.ascii "encState\0"
	.byte	0x1
	.byte	0x66
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x1e
	.secrel32	LASF9
	.byte	0x1
	.byte	0x67
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -57
	.uleb128 0x1f
	.ascii "rdBit\0"
	.byte	0x1
	.byte	0x68
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -58
	.byte	0
	.uleb128 0x1c
	.ascii "CnvCod_ListParameters\0"
	.byte	0x1
	.byte	0x3b
	.long	0x458
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x1526
	.uleb128 0x20
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x3b
	.long	0x1526
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1e
	.secrel32	LASF7
	.byte	0x1
	.byte	0x3d
	.long	0x458
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x775
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
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 0x3f
	.uleb128 0x19
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
	.uleb128 0x2117
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
	.uleb128 0x1b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
LASF2:
	.ascii "ioBuffer\0"
LASF13:
	.ascii "punLenBi\0"
LASF10:
	.ascii "inStream\0"
LASF15:
	.ascii "curPaths\0"
LASF6:
	.ascii "pParams\0"
LASF7:
	.ascii "retErr\0"
LASF4:
	.ascii "outLenBi\0"
LASF12:
	.ascii "unpLenBi\0"
LASF9:
	.ascii "bitIdx\0"
LASF19:
	.ascii "unpLenBy\0"
LASF17:
	.ascii "encInfo\0"
LASF11:
	.ascii "outStream\0"
LASF1:
	.ascii "erasMask\0"
LASF14:
	.ascii "tmpStream\0"
LASF5:
	.ascii "punctVect\0"
LASF8:
	.ascii "byteIdx\0"
LASF0:
	.ascii "nextSt\0"
LASF18:
	.ascii "candDist\0"
LASF16:
	.ascii "prevPaths\0"
LASF3:
	.ascii "inLenBi\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_Memory_AllocateStream;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
	.def	_Memory_FreeStream;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
