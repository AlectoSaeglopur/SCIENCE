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
	movl	$1, (%eax)
	.loc 1 66 0
	movl	8(%ebp), %eax
	movl	$7, 4(%eax)
	.loc 1 67 0
	movl	8(%ebp), %eax
	movw	$10, 8(%eax)
	.loc 1 68 0
	movl	8(%ebp), %eax
	movl	$0, 12(%eax)
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
	leal	-54(%ebp), %eax
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
	movzbl	-54(%ebp), %eax
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
	movzbl	-53(%ebp), %eax
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
	movzbl	-52(%ebp,%eax), %eax
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
	movl	$6, -12(%ebp)
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
	movl	$6, -12(%ebp)
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
	movl	12(%eax), %eax
	testl	%eax, %eax
	jne	L21
	.loc 1 215 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-90(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrieveConnectorPuncturationVectors
	.loc 1 216 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-90(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-83292(%ebp), %eax
	movl	%eax, (%esp)
	call	_ComputeTrellisDiagram
	.loc 1 217 0
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-68(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 218 0
	movl	$1, -41564(%ebp)
	.loc 1 220 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L22
	.loc 1 222 0
	movb	$3, -43(%ebp)
	jmp	L23
L22:
	.loc 1 226 0
	movl	-68(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 16(%esp)
	leal	-90(%ebp), %edx
	addl	$2, %edx
	movl	%edx, 12(%esp)
	movl	-60(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-52(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_HardDepuncturer
L23:
	.loc 1 229 0
	movl	$2, -40(%ebp)
	jmp	L24
L57:
	.loc 1 231 0
	movl	-40(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -72(%ebp)
	.loc 1 232 0
	movl	-72(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 233 0
	movl	-72(%ebp), %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 234 0
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
	.loc 1 235 0
	leal	-83036(%ebp), %eax
	leal	-41564(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 236 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L25
	.loc 1 238 0
	movb	$0, -43(%ebp)
	.loc 1 239 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	-72(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movzbl	-88(%ebp,%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movzbl	-43(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -43(%ebp)
	.loc 1 240 0
	movl	-72(%ebp), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movzbl	-88(%ebp,%eax), %eax
	orb	%al, -43(%ebp)
L25:
	.loc 1 242 0
	movb	$0, -44(%ebp)
	jmp	L26
L40:
	.loc 1 244 0
	movzbl	-44(%ebp), %eax
	movl	-83036(%ebp,%eax,4), %eax
	movl	-40(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L27
	.loc 1 246 0
	movb	$0, -42(%ebp)
	jmp	L28
L39:
	.loc 1 248 0
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
	.loc 1 249 0
	movzbl	-44(%ebp), %edx
	movzbl	-42(%ebp), %eax
	sall	$2, %edx
	leal	-24(%ebp), %ebx
	addl	%ebx, %edx
	addl	%edx, %eax
	subl	$83266, %eax
	movzbl	(%eax), %eax
	movb	%al, -80(%ebp)
	.loc 1 250 0
	movzbl	-80(%ebp), %eax
	movl	-41564(%ebp,%eax,4), %eax
	cmpl	-40(%ebp), %eax
	jnb	L29
	.loc 1 252 0
	movzbl	-80(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, -41564(%ebp,%eax,4)
	.loc 1 253 0
	movzbl	-80(%ebp), %eax
	movzbl	-44(%ebp), %edx
	addl	$64, %edx
	movl	-83036(%ebp,%edx,4), %ecx
	movzbl	-79(%ebp), %edx
	addl	%ecx, %edx
	addl	$64, %eax
	movl	%edx, -41564(%ebp,%eax,4)
	.loc 1 254 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L30
	.loc 1 256 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L31
L30:
	.loc 1 260 0
	movl	$639, -36(%ebp)
L31:
	.loc 1 262 0
	movl	$0, -32(%ebp)
	jmp	L32
L33:
	.loc 1 264 0 discriminator 3
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
	.loc 1 262 0 discriminator 3
	addl	$1, -32(%ebp)
L32:
	.loc 1 262 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L33
	.loc 1 266 0 is_stmt 1
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
	jmp	L34
L29:
	.loc 1 270 0
	movzbl	-44(%ebp), %eax
	addl	$64, %eax
	movl	-83036(%ebp,%eax,4), %edx
	movzbl	-79(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -84(%ebp)
	.loc 1 271 0
	movzbl	-80(%ebp), %eax
	addl	$64, %eax
	movl	-41564(%ebp,%eax,4), %eax
	cmpl	-84(%ebp), %eax
	jbe	L34
	.loc 1 273 0
	movzbl	-80(%ebp), %eax
	leal	64(%eax), %edx
	movl	-84(%ebp), %eax
	movl	%eax, -41564(%ebp,%edx,4)
	.loc 1 274 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L35
	.loc 1 276 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L36
L35:
	.loc 1 280 0
	movl	$639, -36(%ebp)
L36:
	.loc 1 282 0
	movl	$0, -32(%ebp)
	jmp	L37
L38:
	.loc 1 284 0 discriminator 3
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
	.loc 1 282 0 discriminator 3
	addl	$1, -32(%ebp)
L37:
	.loc 1 282 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L38
	.loc 1 286 0 is_stmt 1
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
L34:
	.loc 1 246 0 discriminator 2
	movzbl	-42(%ebp), %eax
	addl	$1, %eax
	movb	%al, -42(%ebp)
L28:
	.loc 1 246 0 is_stmt 0 discriminator 1
	cmpb	$1, -42(%ebp)
	jbe	L39
L27:
	.loc 1 242 0 is_stmt 1 discriminator 2
	movzbl	-44(%ebp), %eax
	addl	$1, %eax
	movb	%al, -44(%ebp)
L26:
	.loc 1 242 0 is_stmt 0 discriminator 1
	cmpb	$63, -44(%ebp)
	jbe	L40
	.loc 1 293 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	-48(%ebp), %eax
	jne	L41
	.loc 1 295 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathHard
	movb	%al, -85(%ebp)
	.loc 1 296 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L42
	.loc 1 298 0
	movl	$640, -36(%ebp)
	jmp	L43
L42:
	.loc 1 302 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
L43:
	.loc 1 304 0
	movl	$0, -32(%ebp)
	jmp	L44
L49:
	.loc 1 306 0
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
	.loc 1 307 0
	movl	-36(%ebp), %eax
	subl	$1, %eax
	cmpl	-32(%ebp), %eax
	jne	L45
	.loc 1 309 0
	movzbl	-85(%ebp), %eax
	movb	%al, -41(%ebp)
	jmp	L46
L45:
	.loc 1 313 0
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
L46:
	.loc 1 315 0
	movl	-48(%ebp), %eax
	subl	-36(%ebp), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 316 0
	movl	-48(%ebp), %eax
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	subl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 317 0
	movzbl	-86(%ebp), %eax
	movzbl	-83290(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L47
	.loc 1 319 0
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
	jmp	L48
L47:
	.loc 1 323 0
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
L48:
	.loc 1 304 0 discriminator 2
	addl	$1, -32(%ebp)
L44:
	.loc 1 304 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L49
	jmp	L50
L41:
	.loc 1 327 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L50
	.loc 1 329 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathHard
	movb	%al, -85(%ebp)
	.loc 1 330 0
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
	.loc 1 331 0
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
	.loc 1 332 0
	movl	-40(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 333 0
	movl	-40(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 334 0
	movzbl	-86(%ebp), %eax
	movzbl	-83290(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L51
	.loc 1 336 0
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
	jmp	L52
L51:
	.loc 1 340 0
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
L52:
	.loc 1 342 0
	movb	$0, -44(%ebp)
	jmp	L53
L56:
	.loc 1 344 0
	movl	$0, -32(%ebp)
	jmp	L54
L55:
	.loc 1 346 0 discriminator 3
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
	.loc 1 344 0 discriminator 3
	addl	$1, -32(%ebp)
L54:
	.loc 1 344 0 is_stmt 0 discriminator 1
	cmpl	$638, -32(%ebp)
	jbe	L55
	.loc 1 342 0 is_stmt 1 discriminator 2
	movzbl	-44(%ebp), %eax
	addl	$1, %eax
	movb	%al, -44(%ebp)
L53:
	.loc 1 342 0 is_stmt 0 discriminator 1
	cmpb	$63, -44(%ebp)
	jbe	L56
L50:
	.loc 1 229 0 is_stmt 1 discriminator 2
	addl	$1, -40(%ebp)
L24:
	.loc 1 229 0 is_stmt 0 discriminator 1
	movl	-48(%ebp), %eax
	addl	$2, %eax
	cmpl	-40(%ebp), %eax
	ja	L57
	.loc 1 213 0 is_stmt 1
	jmp	L59
L21:
	.loc 1 354 0
	movl	$5, -28(%ebp)
	.loc 1 213 0
	jmp	L59
L20:
	.loc 1 359 0
	movl	$1, -28(%ebp)
L59:
	.loc 1 362 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 363 0
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
	.loc 1 376 0
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
	.loc 1 376 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 377 0
	movl	$0, -28(%ebp)
	.loc 1 378 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 379 0
	movl	-48(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, -52(%ebp)
	.loc 1 380 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -56(%ebp)
	.loc 1 381 0
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
	.loc 1 382 0
	leal	-41564(%ebp), %eax
	movl	$41472, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 395 0
	cmpl	$0, 8(%ebp)
	je	L62
	.loc 1 395 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L62
	.loc 1 395 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L62
	.loc 1 396 0 is_stmt 1 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 395 0 discriminator 3
	testl	%eax, %eax
	je	L62
	.loc 1 396 0
	cmpl	$0, 16(%ebp)
	je	L62
	.loc 1 398 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-83040(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrieveConnectorPuncturationVectors
	.loc 1 399 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-83040(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-83296(%ebp), %eax
	movl	%eax, (%esp)
	call	_ComputeTrellisDiagram
	.loc 1 400 0
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
	.loc 1 401 0
	movl	$1, -41564(%ebp)
	.loc 1 403 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L63
	.loc 1 405 0
	movb	$3, -44(%ebp)
	jmp	L64
L63:
	.loc 1 409 0
	movl	-64(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 16(%esp)
	leal	-83040(%ebp), %edx
	addl	$2, %edx
	movl	%edx, 12(%esp)
	movl	-52(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-56(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_SoftDepuncturer
L64:
	.loc 1 412 0
	movl	$2, -40(%ebp)
	jmp	L65
L99:
	.loc 1 414 0
	movl	-40(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -68(%ebp)
	.loc 1 415 0
	leal	-83036(%ebp), %eax
	leal	-41564(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 417 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L66
	.loc 1 419 0
	movb	$0, -44(%ebp)
	.loc 1 420 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	-68(%ebp), %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movzbl	-83038(%ebp,%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movzbl	-44(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -44(%ebp)
	.loc 1 421 0
	movl	-68(%ebp), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ecx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movzbl	-83038(%ebp,%eax), %eax
	orb	%al, -44(%ebp)
L66:
	.loc 1 424 0
	movb	$0, -42(%ebp)
	jmp	L67
L82:
	.loc 1 426 0
	movzbl	-42(%ebp), %eax
	movl	-83036(%ebp,%eax,4), %eax
	movl	-40(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L68
	.loc 1 428 0
	movb	$0, -43(%ebp)
	jmp	L69
L81:
	.loc 1 430 0
	movzbl	-44(%ebp), %edx
	.loc 1 431 0
	movzbl	-42(%ebp), %ecx
	movzbl	-43(%ebp), %eax
	sall	$2, %ecx
	leal	-24(%ebp), %edi
	addl	%edi, %ecx
	addl	%ecx, %eax
	subl	$83272, %eax
	movzbl	(%eax), %eax
	.loc 1 430 0
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
	.loc 1 432 0
	movzbl	-42(%ebp), %edx
	movzbl	-43(%ebp), %eax
	sall	$2, %edx
	leal	-24(%ebp), %edi
	addl	%edi, %edx
	addl	%edx, %eax
	subl	$83270, %eax
	movzbl	(%eax), %eax
	movb	%al, -73(%ebp)
	.loc 1 434 0
	movzbl	-73(%ebp), %eax
	movl	-41564(%ebp,%eax,4), %eax
	cmpl	-40(%ebp), %eax
	jnb	L70
	.loc 1 436 0
	movzbl	-73(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, -41564(%ebp,%eax,4)
	.loc 1 437 0
	movzbl	-73(%ebp), %eax
	movzbl	-42(%ebp), %edx
	addl	$64, %edx
	flds	-83036(%ebp,%edx,4)
	fadds	-72(%ebp)
	addl	$64, %eax
	fstps	-41564(%ebp,%eax,4)
	.loc 1 438 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L71
	.loc 1 440 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L72
L71:
	.loc 1 444 0
	movl	$639, -36(%ebp)
L72:
	.loc 1 446 0
	movl	$0, -32(%ebp)
	jmp	L73
L74:
	.loc 1 448 0 discriminator 3
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
	.loc 1 446 0 discriminator 3
	addl	$1, -32(%ebp)
L73:
	.loc 1 446 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L74
	.loc 1 450 0 is_stmt 1
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
	jmp	L75
L70:
	.loc 1 454 0
	movzbl	-42(%ebp), %eax
	addl	$64, %eax
	flds	-83036(%ebp,%eax,4)
	fadds	-72(%ebp)
	fstps	-80(%ebp)
	.loc 1 455 0
	movzbl	-73(%ebp), %eax
	addl	$64, %eax
	flds	-41564(%ebp,%eax,4)
	flds	-80(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L75
	.loc 1 457 0
	movzbl	-73(%ebp), %eax
	addl	$64, %eax
	flds	-80(%ebp)
	fstps	-41564(%ebp,%eax,4)
	.loc 1 458 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L77
	.loc 1 460 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L78
L77:
	.loc 1 464 0
	movl	$639, -36(%ebp)
L78:
	.loc 1 466 0
	movl	$0, -32(%ebp)
	jmp	L79
L80:
	.loc 1 468 0 discriminator 3
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
	.loc 1 466 0 discriminator 3
	addl	$1, -32(%ebp)
L79:
	.loc 1 466 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L80
	.loc 1 470 0 is_stmt 1
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
L75:
	.loc 1 428 0 discriminator 2
	movzbl	-43(%ebp), %eax
	addl	$1, %eax
	movb	%al, -43(%ebp)
L69:
	.loc 1 428 0 is_stmt 0 discriminator 1
	cmpb	$1, -43(%ebp)
	jbe	L81
L68:
	.loc 1 424 0 is_stmt 1 discriminator 2
	movzbl	-42(%ebp), %eax
	addl	$1, %eax
	movb	%al, -42(%ebp)
L67:
	.loc 1 424 0 is_stmt 0 discriminator 1
	cmpb	$63, -42(%ebp)
	jbe	L82
	.loc 1 477 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	-48(%ebp), %eax
	jne	L83
	.loc 1 479 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathSoft
	movb	%al, -81(%ebp)
	.loc 1 480 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L84
	.loc 1 482 0
	movl	$640, -36(%ebp)
	jmp	L85
L84:
	.loc 1 486 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
L85:
	.loc 1 488 0
	movl	$0, -32(%ebp)
	jmp	L86
L91:
	.loc 1 490 0
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
	.loc 1 491 0
	movl	-36(%ebp), %eax
	subl	$1, %eax
	cmpl	-32(%ebp), %eax
	jne	L87
	.loc 1 493 0
	movzbl	-81(%ebp), %eax
	movb	%al, -41(%ebp)
	jmp	L88
L87:
	.loc 1 497 0
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
L88:
	.loc 1 499 0
	movl	-48(%ebp), %eax
	subl	-36(%ebp), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, -88(%ebp)
	.loc 1 500 0
	movl	-48(%ebp), %eax
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	subl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	andl	$7, %eax
	movb	%al, -89(%ebp)
	.loc 1 501 0
	movzbl	-82(%ebp), %eax
	movzbl	-83294(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L89
	.loc 1 503 0
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
	jmp	L90
L89:
	.loc 1 507 0
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
L90:
	.loc 1 488 0 discriminator 2
	addl	$1, -32(%ebp)
L86:
	.loc 1 488 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L91
	jmp	L92
L83:
	.loc 1 511 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L92
	.loc 1 513 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathSoft
	movb	%al, -81(%ebp)
	.loc 1 514 0
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
	.loc 1 515 0
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
	.loc 1 516 0
	movl	-40(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -88(%ebp)
	.loc 1 517 0
	movl	-40(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -89(%ebp)
	.loc 1 518 0
	movzbl	-82(%ebp), %eax
	movzbl	-83294(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L93
	.loc 1 520 0
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
	jmp	L94
L93:
	.loc 1 524 0
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
L94:
	.loc 1 526 0
	movb	$0, -42(%ebp)
	jmp	L95
L98:
	.loc 1 528 0
	movl	$0, -32(%ebp)
	jmp	L96
L97:
	.loc 1 530 0 discriminator 3
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
	.loc 1 528 0 discriminator 3
	addl	$1, -32(%ebp)
L96:
	.loc 1 528 0 is_stmt 0 discriminator 1
	cmpl	$638, -32(%ebp)
	jbe	L97
	.loc 1 526 0 is_stmt 1 discriminator 2
	movzbl	-42(%ebp), %eax
	addl	$1, %eax
	movb	%al, -42(%ebp)
L95:
	.loc 1 526 0 is_stmt 0 discriminator 1
	cmpb	$63, -42(%ebp)
	jbe	L98
L92:
	.loc 1 412 0 is_stmt 1 discriminator 2
	addl	$1, -40(%ebp)
L65:
	.loc 1 412 0 is_stmt 0 discriminator 1
	movl	-48(%ebp), %eax
	addl	$2, %eax
	cmpl	-40(%ebp), %eax
	ja	L99
	.loc 1 395 0 is_stmt 1
	jmp	L100
L62:
	.loc 1 538 0
	movl	$1, -28(%ebp)
L100:
	.loc 1 541 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 542 0
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
	.loc 1 559 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	.loc 1 560 0
	movl	$0, -12(%ebp)
	.loc 1 562 0
	cmpl	$0, 8(%ebp)
	je	L104
	.loc 1 562 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L104
	.loc 1 564 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_IsKlenValid
	testb	%al, %al
	je	L105
	.loc 1 567 0
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
	jmp	L106
L105:
	.loc 1 571 0
	movl	$4, -12(%ebp)
L106:
	.loc 1 574 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_IsRateValid
	testb	%al, %al
	je	L107
	.loc 1 576 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	L109
	cmpl	$3, %eax
	ja	L110
	cmpl	$2, %eax
	je	L111
	.loc 1 596 0
	jmp	L115
L110:
	.loc 1 576 0
	cmpl	$5, %eax
	je	L112
	cmpl	$7, %eax
	je	L113
	.loc 1 596 0
	jmp	L115
L111:
	.loc 1 579 0
	movb	$1, -46(%ebp)
	movb	$1, -45(%ebp)
	movb	$0, -44(%ebp)
	movb	$1, -43(%ebp)
	movl	8(%ebp), %eax
	leal	2(%eax), %edx
	movzwl	-46(%ebp), %eax
	movw	%ax, (%edx)
	.loc 1 580 0
	jmp	L115
L109:
	.loc 1 583 0
	movb	$1, -42(%ebp)
	movb	$1, -41(%ebp)
	movb	$0, -40(%ebp)
	movb	$1, -39(%ebp)
	movb	$1, -38(%ebp)
	movb	$0, -37(%ebp)
	movl	8(%ebp), %eax
	leal	2(%eax), %edx
	movzwl	-42(%ebp), %eax
	movw	%ax, (%edx)
	.loc 1 584 0
	jmp	L115
L112:
	.loc 1 587 0
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
	movzwl	-36(%ebp), %eax
	movw	%ax, (%edx)
	.loc 1 588 0
	jmp	L115
L113:
	.loc 1 591 0
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
	movzwl	-26(%ebp), %eax
	movw	%ax, (%edx)
	.loc 1 592 0
	jmp	L115
L107:
	.loc 1 601 0
	movl	$3, -12(%ebp)
	.loc 1 574 0
	jmp	L116
L115:
	.loc 1 574 0 is_stmt 0 discriminator 2
	jmp	L116
L104:
	.loc 1 606 0 is_stmt 1
	movl	$1, -12(%ebp)
L116:
	.loc 1 609 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 610 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_IsRateValid;	.scl	3;	.type	32;	.endef
_IsRateValid:
LFB23:
	.loc 1 621 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 622 0
	movb	$0, -1(%ebp)
	.loc 1 625 0
	movb	$0, -2(%ebp)
	jmp	L119
L122:
	.loc 1 627 0
	movzbl	-2(%ebp), %eax
	movl	_CC_RATE_ARRAY(,%eax,4), %eax
	cmpl	8(%ebp), %eax
	jne	L120
	.loc 1 629 0
	movb	$1, -1(%ebp)
	.loc 1 630 0
	jmp	L121
L120:
	.loc 1 625 0 discriminator 2
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L119:
	.loc 1 625 0 is_stmt 0 discriminator 1
	cmpb	$4, -2(%ebp)
	jbe	L122
L121:
	.loc 1 634 0 is_stmt 1
	movzbl	-1(%ebp), %eax
	.loc 1 635 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	_IsKlenValid;	.scl	3;	.type	32;	.endef
_IsKlenValid:
LFB24:
	.loc 1 646 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 649 0
	cmpl	$2, 8(%ebp)
	jbe	L125
	.loc 1 649 0 is_stmt 0 discriminator 1
	cmpl	$8, 8(%ebp)
	ja	L125
	.loc 1 649 0 discriminator 3
	movl	$1, %eax
	jmp	L126
L125:
	.loc 1 649 0 discriminator 4
	movl	$0, %eax
L126:
	.loc 1 649 0 discriminator 6
	movb	%al, -1(%ebp)
	andb	$1, -1(%ebp)
	.loc 1 651 0 is_stmt 1 discriminator 6
	movzbl	-1(%ebp), %eax
	.loc 1 652 0 discriminator 6
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.def	_ComputeEncBit;	.scl	3;	.type	32;	.endef
_ComputeEncBit:
LFB25:
	.loc 1 665 0
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
	.loc 1 666 0
	movb	$0, -5(%ebp)
	.loc 1 669 0
	movb	$0, -6(%ebp)
	jmp	L129
L130:
	.loc 1 671 0 discriminator 3
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
	.loc 1 669 0 discriminator 3
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L129:
	.loc 1 669 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %eax
	cmpl	16(%ebp), %eax
	jb	L130
	.loc 1 674 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 675 0
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
	.loc 1 688 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$104, %esp
	.loc 1 689 0
	movl	$0, -12(%ebp)
	.loc 1 695 0
	cmpl	$0, 8(%ebp)
	je	L133
	.loc 1 697 0
	movb	$0, -14(%ebp)
	jmp	L134
L135:
	.loc 1 699 0 discriminator 3
	movzbl	-14(%ebp), %eax
	movzbl	-14(%ebp), %edx
	movb	%dl, -81(%ebp,%eax)
	.loc 1 697 0 discriminator 3
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L134:
	.loc 1 697 0 is_stmt 0 discriminator 1
	cmpb	$63, -14(%ebp)
	jbe	L135
	.loc 1 701 0 is_stmt 1
	movb	$0, -14(%ebp)
	jmp	L136
L145:
	.loc 1 703 0
	movzbl	-14(%ebp), %eax
	movzbl	-81(%ebp,%eax), %eax
	movb	%al, -15(%ebp)
	.loc 1 704 0
	movb	$0, -13(%ebp)
	jmp	L137
L140:
	.loc 1 706 0
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
	.loc 1 707 0
	cmpb	$0, -13(%ebp)
	jne	L138
	.loc 1 709 0
	movzbl	-14(%ebp), %edx
	movzbl	-16(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	8(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
	jmp	L139
L138:
	.loc 1 713 0
	movzbl	-14(%ebp), %edx
	movzbl	-14(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	(%eax,%ecx,4), %ecx
	movzbl	-16(%ebp), %eax
	addl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
L139:
	.loc 1 704 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L137:
	.loc 1 704 0 is_stmt 0 discriminator 1
	cmpb	$1, -13(%ebp)
	jbe	L140
	.loc 1 716 0 is_stmt 1
	movzbl	-14(%ebp), %edx
	movzbl	-15(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 2(%eax,%edx,4)
	.loc 1 717 0
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
	.loc 1 718 0
	movb	$0, -13(%ebp)
	jmp	L141
L144:
	.loc 1 720 0
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
	.loc 1 721 0
	cmpb	$0, -13(%ebp)
	jne	L142
	.loc 1 723 0
	movzbl	-14(%ebp), %edx
	movzbl	-16(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	8(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
	jmp	L143
L142:
	.loc 1 727 0
	movzbl	-14(%ebp), %edx
	movzbl	-14(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	1(%eax,%ecx,4), %ecx
	movzbl	-16(%ebp), %eax
	addl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
L143:
	.loc 1 718 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L141:
	.loc 1 718 0 is_stmt 0 discriminator 1
	cmpb	$1, -13(%ebp)
	jbe	L144
	.loc 1 730 0 is_stmt 1 discriminator 2
	movzbl	-14(%ebp), %edx
	movzbl	-17(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 3(%eax,%edx,4)
	.loc 1 701 0 discriminator 2
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L136:
	.loc 1 701 0 is_stmt 0 discriminator 1
	cmpb	$63, -14(%ebp)
	jbe	L145
	jmp	L146
L133:
	.loc 1 735 0 is_stmt 1
	movl	$1, -12(%ebp)
L146:
	.loc 1 738 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 739 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_HardDepuncturer;	.scl	3;	.type	32;	.endef
_HardDepuncturer:
LFB27:
	.loc 1 754 0
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
	.loc 1 755 0
	movl	$0, -12(%ebp)
	.loc 1 756 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	.loc 1 759 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	.loc 1 763 0
	cmpl	$0, 8(%ebp)
	je	L149
	.loc 1 765 0
	movl	16(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	L150
L157:
	.loc 1 767 0
	movzbl	-21(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L151
	.loc 1 769 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 770 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 771 0
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
	.loc 1 772 0
	subl	$1, -16(%ebp)
	jmp	L152
L151:
	.loc 1 776 0
	movb	$0, -22(%ebp)
L152:
	.loc 1 778 0
	cmpb	$0, -21(%ebp)
	je	L153
	.loc 1 780 0
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	jmp	L154
L153:
	.loc 1 784 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
L154:
	.loc 1 786 0
	movl	-20(%ebp), %eax
	subl	$1, %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 787 0
	movl	-20(%ebp), %eax
	negl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 788 0
	cmpb	$0, -22(%ebp)
	jne	L155
	.loc 1 790 0
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
	jmp	L156
L155:
	.loc 1 794 0
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
L156:
	.loc 1 765 0 discriminator 2
	subl	$1, -20(%ebp)
L150:
	.loc 1 765 0 is_stmt 0 discriminator 1
	cmpl	$0, -20(%ebp)
	jne	L157
	jmp	L158
L149:
	.loc 1 800 0 is_stmt 1
	movl	$1, -12(%ebp)
L158:
	.loc 1 803 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 804 0
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
	.loc 1 815 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	.loc 1 817 0
	movb	$0, -2(%ebp)
	.loc 1 819 0
	movb	$0, -1(%ebp)
	jmp	L161
L163:
	.loc 1 821 0
	movzbl	-20(%ebp), %edx
	movzbl	-1(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L162
	.loc 1 823 0
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L162:
	.loc 1 819 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L161:
	.loc 1 819 0 is_stmt 0 discriminator 1
	cmpb	$7, -1(%ebp)
	jbe	L163
	.loc 1 827 0 is_stmt 1
	movzbl	-2(%ebp), %eax
	.loc 1 828 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.def	_FindMinSurvPathHard;	.scl	3;	.type	32;	.endef
_FindMinSurvPathHard:
LFB29:
	.loc 1 839 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 844 0
	cmpl	$0, 8(%ebp)
	je	L166
	.loc 1 846 0
	movl	8(%ebp), %eax
	movl	256(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 847 0
	movb	$0, -5(%ebp)
	.loc 1 848 0
	movb	$1, -6(%ebp)
	jmp	L167
L169:
	.loc 1 850 0
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L168
	.loc 1 850 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	cmpl	-4(%ebp), %eax
	jnb	L168
	.loc 1 852 0 is_stmt 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, -4(%ebp)
	.loc 1 853 0
	movzbl	-6(%ebp), %eax
	movb	%al, -5(%ebp)
L168:
	.loc 1 848 0 discriminator 2
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L167:
	.loc 1 848 0 is_stmt 0 discriminator 1
	cmpb	$63, -6(%ebp)
	jbe	L169
L166:
	.loc 1 858 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 859 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.def	_SoftDepuncturer;	.scl	3;	.type	32;	.endef
_SoftDepuncturer:
LFB30:
	.loc 1 874 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 875 0
	movl	$0, -12(%ebp)
	.loc 1 876 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	.loc 1 878 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	.loc 1 880 0
	cmpl	$0, 8(%ebp)
	je	L172
	.loc 1 882 0
	movl	16(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	L173
L178:
	.loc 1 884 0
	movzbl	-21(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L174
	.loc 1 886 0
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
	.loc 1 887 0
	subl	$1, -16(%ebp)
	jmp	L175
L174:
	.loc 1 891 0
	movl	-20(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	fldz
	fstps	(%eax)
L175:
	.loc 1 893 0
	cmpb	$0, -21(%ebp)
	je	L176
	.loc 1 895 0
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	jmp	L177
L176:
	.loc 1 899 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
L177:
	.loc 1 882 0 discriminator 2
	subl	$1, -20(%ebp)
L173:
	.loc 1 882 0 is_stmt 0 discriminator 1
	cmpl	$0, -20(%ebp)
	jne	L178
	jmp	L179
L172:
	.loc 1 906 0 is_stmt 1
	movl	$1, -12(%ebp)
L179:
	.loc 1 909 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 910 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.def	_EstimateEuclideanDist;	.scl	3;	.type	32;	.endef
_EstimateEuclideanDist:
LFB31:
	.loc 1 923 0
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
	.loc 1 925 0
	fldz
	fstps	-8(%ebp)
	.loc 1 927 0
	cmpl	$0, 8(%ebp)
	je	L182
	.loc 1 929 0
	movb	$0, -1(%ebp)
	jmp	L183
L185:
	.loc 1 931 0
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
	je	L184
	.loc 1 933 0
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
L184:
	.loc 1 929 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L183:
	.loc 1 929 0 is_stmt 0 discriminator 1
	cmpb	$1, -1(%ebp)
	jbe	L185
L182:
	.loc 1 938 0 is_stmt 1
	flds	-8(%ebp)
	.loc 1 939 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.def	_FindMinSurvPathSoft;	.scl	3;	.type	32;	.endef
_FindMinSurvPathSoft:
LFB32:
	.loc 1 950 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 955 0
	cmpl	$0, 8(%ebp)
	je	L188
	.loc 1 957 0
	movl	8(%ebp), %eax
	flds	256(%eax)
	fstps	-4(%ebp)
	.loc 1 958 0
	movb	$0, -5(%ebp)
	.loc 1 959 0
	movb	$1, -6(%ebp)
	jmp	L189
L192:
	.loc 1 961 0
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L190
	.loc 1 961 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	flds	(%eax,%edx,4)
	flds	-4(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L190
	.loc 1 963 0 is_stmt 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	flds	(%eax,%edx,4)
	fstps	-4(%ebp)
	.loc 1 964 0
	movzbl	-6(%ebp), %eax
	movb	%al, -5(%ebp)
L190:
	.loc 1 959 0 discriminator 2
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L189:
	.loc 1 959 0 is_stmt 0 discriminator 1
	cmpb	$63, -6(%ebp)
	jbe	L192
L188:
	.loc 1 969 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 970 0
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
	.long	0x1531
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
	.long	0x470
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
	.byte	0x6
	.byte	0x2a
	.long	0x353
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x7
	.byte	0x1d
	.long	0x4c9
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
	.long	0x47f
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x24
	.long	0x51a
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x26
	.long	0x51a
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
	.long	0x4c9
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x188
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x29
	.long	0x4de
	.uleb128 0xa
	.long	0x520
	.uleb128 0x3
	.ascii "_float_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x2c
	.long	0x577
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x2e
	.long	0x577
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
	.long	0x4c9
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x345
	.uleb128 0x6
	.ascii "float_stream_t\0"
	.byte	0x7
	.byte	0x31
	.long	0x53a
	.uleb128 0xa
	.long	0x57d
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x45
	.long	0x5e6
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
	.long	0x598
	.uleb128 0xa
	.long	0x5e6
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x4b
	.long	0x66c
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
	.long	0x6dd
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
	.long	0x66c
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x63
	.long	0x72a
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
	.long	0x6ee
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0x8
	.byte	0x6b
	.long	0x78d
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0x8
	.byte	0x6d
	.long	0x5e6
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0x8
	.byte	0x6e
	.long	0x6dd
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
	.long	0x72a
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0x8
	.byte	0x71
	.long	0x741
	.uleb128 0xa
	.long	0x78d
	.uleb128 0x3
	.ascii "_cc_encoder_info_t\0"
	.byte	0x4
	.byte	0x8
	.byte	0x74
	.long	0x7e0
	.uleb128 0x4
	.ascii "connVect\0"
	.byte	0x8
	.byte	0x76
	.long	0x7e0
	.byte	0
	.uleb128 0x4
	.ascii "puncVect\0"
	.byte	0x8
	.byte	0x77
	.long	0x7e0
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x7f0
	.uleb128 0xc
	.long	0x2df
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.ascii "cc_encoder_info_t\0"
	.byte	0x8
	.byte	0x78
	.long	0x7a2
	.uleb128 0x3
	.ascii "_cc_trcore_t\0"
	.byte	0x4
	.byte	0x8
	.byte	0x7b
	.long	0x83b
	.uleb128 0x4
	.ascii "outBits\0"
	.byte	0x8
	.byte	0x7d
	.long	0x7e0
	.byte	0
	.uleb128 0xf
	.secrel32	LASF0
	.byte	0x8
	.byte	0x7e
	.long	0x7e0
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "cc_trcore_t\0"
	.byte	0x8
	.byte	0x7f
	.long	0x809
	.uleb128 0x10
	.ascii "_cc_trellis_t\0"
	.word	0x100
	.byte	0x8
	.byte	0x82
	.long	0x873
	.uleb128 0x4
	.ascii "trSt\0"
	.byte	0x8
	.byte	0x84
	.long	0x873
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x83b
	.long	0x883
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.ascii "cc_trellis_t\0"
	.byte	0x8
	.byte	0x85
	.long	0x84e
	.uleb128 0x10
	.ascii "_cc_hard_dec_info_t\0"
	.word	0xa200
	.byte	0x8
	.byte	0x88
	.long	0x8de
	.uleb128 0x4
	.ascii "iter\0"
	.byte	0x8
	.byte	0x8a
	.long	0x8de
	.byte	0
	.uleb128 0x11
	.ascii "dist\0"
	.byte	0x8
	.byte	0x8b
	.long	0x8de
	.word	0x100
	.uleb128 0x11
	.ascii "path\0"
	.byte	0x8
	.byte	0x8c
	.long	0x8ee
	.word	0x200
	.byte	0
	.uleb128 0x7
	.long	0x1ca
	.long	0x8ee
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x905
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
	.long	0x897
	.uleb128 0xa
	.long	0x905
	.uleb128 0x10
	.ascii "_cc_soft_dec_info_t\0"
	.word	0xa200
	.byte	0x8
	.byte	0x91
	.long	0x96b
	.uleb128 0x4
	.ascii "iter\0"
	.byte	0x8
	.byte	0x93
	.long	0x8de
	.byte	0
	.uleb128 0x11
	.ascii "dist\0"
	.byte	0x8
	.byte	0x94
	.long	0x96b
	.word	0x100
	.uleb128 0x11
	.ascii "path\0"
	.byte	0x8
	.byte	0x95
	.long	0x8ee
	.word	0x200
	.byte	0
	.uleb128 0x7
	.long	0x345
	.long	0x97b
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.ascii "cc_soft_dec_info_t\0"
	.byte	0x8
	.byte	0x96
	.long	0x924
	.uleb128 0xa
	.long	0x97b
	.uleb128 0x7
	.long	0x5f7
	.long	0x9aa
	.uleb128 0xc
	.long	0x2df
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.long	0x99a
	.uleb128 0x13
	.ascii "CC_RATE_ARRAY\0"
	.byte	0x1
	.byte	0x17
	.long	0x9aa
	.uleb128 0x5
	.byte	0x3
	.long	_CC_RATE_ARRAY
	.uleb128 0x14
	.ascii "FindMinSurvPathSoft\0"
	.byte	0x1
	.word	0x3b5
	.long	0x188
	.long	LFB32
	.long	LFE32-LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0xa3c
	.uleb128 0x15
	.ascii "inPaths\0"
	.byte	0x1
	.word	0x3b5
	.long	0xa3c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "minDist\0"
	.byte	0x1
	.word	0x3b7
	.long	0x345
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.ascii "minStIdx\0"
	.byte	0x1
	.word	0x3b8
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x3b9
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x995
	.uleb128 0x14
	.ascii "EstimateEuclideanDist\0"
	.byte	0x1
	.word	0x39a
	.long	0x345
	.long	LFB31
	.long	LFE31-LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0xabf
	.uleb128 0x15
	.ascii "inBuf\0"
	.byte	0x1
	.word	0x39a
	.long	0xabf
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "trlByte\0"
	.byte	0x1
	.word	0x39a
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.word	0x39a
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x39c
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x16
	.ascii "Dist\0"
	.byte	0x1
	.word	0x39d
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
	.word	0x369
	.long	0x470
	.long	LFB30
	.long	LFE30-LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0xb6d
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x369
	.long	0x577
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF3
	.byte	0x1
	.word	0x369
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF4
	.byte	0x1
	.word	0x369
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF5
	.byte	0x1
	.word	0x369
	.long	0xb6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x17
	.secrel32	LASF6
	.byte	0x1
	.word	0x369
	.long	0xb73
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x19
	.secrel32	LASF7
	.byte	0x1
	.word	0x36b
	.long	0x470
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "i\0"
	.byte	0x1
	.word	0x36c
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x36d
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "k\0"
	.byte	0x1
	.word	0x36e
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
	.long	0x79d
	.uleb128 0x14
	.ascii "FindMinSurvPathHard\0"
	.byte	0x1
	.word	0x346
	.long	0x188
	.long	LFB29
	.long	LFE29-LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0xbee
	.uleb128 0x15
	.ascii "inPaths\0"
	.byte	0x1
	.word	0x346
	.long	0xbee
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "minDist\0"
	.byte	0x1
	.word	0x348
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.ascii "minStateIdx\0"
	.byte	0x1
	.word	0x349
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x34a
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x91f
	.uleb128 0x14
	.ascii "CountByteOnes\0"
	.byte	0x1
	.word	0x32e
	.long	0x188
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0xc47
	.uleb128 0x15
	.ascii "inByte\0"
	.byte	0x1
	.word	0x32e
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x330
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x16
	.ascii "cnt\0"
	.byte	0x1
	.word	0x331
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x18
	.ascii "HardDepuncturer\0"
	.byte	0x1
	.word	0x2f1
	.long	0x470
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xd2a
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.word	0x2f1
	.long	0x51a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF3
	.byte	0x1
	.word	0x2f1
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF4
	.byte	0x1
	.word	0x2f1
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF5
	.byte	0x1
	.word	0x2f1
	.long	0xb6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x17
	.secrel32	LASF6
	.byte	0x1
	.word	0x2f1
	.long	0xb73
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x19
	.secrel32	LASF7
	.byte	0x1
	.word	0x2f3
	.long	0x470
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "rdIdx\0"
	.byte	0x1
	.word	0x2f4
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.secrel32	LASF8
	.byte	0x1
	.word	0x2f5
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x2f6
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "rdIdxPunc\0"
	.byte	0x1
	.word	0x2f7
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x19
	.secrel32	LASF9
	.byte	0x1
	.word	0x2f8
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x16
	.ascii "rdBit\0"
	.byte	0x1
	.word	0x2f9
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.byte	0
	.uleb128 0x18
	.ascii "ComputeTrellisDiagram\0"
	.byte	0x1
	.word	0x2af
	.long	0x470
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xe04
	.uleb128 0x15
	.ascii "ioTrellisDiagr\0"
	.byte	0x1
	.word	0x2af
	.long	0xe04
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "conVect\0"
	.byte	0x1
	.word	0x2af
	.long	0xb6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF6
	.byte	0x1
	.word	0x2af
	.long	0xb73
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.secrel32	LASF7
	.byte	0x1
	.word	0x2b1
	.long	0x470
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "StBin\0"
	.byte	0x1
	.word	0x2b2
	.long	0xe0a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x16
	.ascii "i\0"
	.byte	0x1
	.word	0x2b3
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x2b3
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.ascii "outBit\0"
	.byte	0x1
	.word	0x2b4
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "state0\0"
	.byte	0x1
	.word	0x2b5
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x16
	.ascii "state1\0"
	.byte	0x1
	.word	0x2b5
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x883
	.uleb128 0x7
	.long	0x188
	.long	0xe1a
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x14
	.ascii "ComputeEncBit\0"
	.byte	0x1
	.word	0x298
	.long	0x188
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xe91
	.uleb128 0x15
	.ascii "cState\0"
	.byte	0x1
	.word	0x298
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.ascii "cvVal\0"
	.byte	0x1
	.word	0x298
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.ascii "kLen\0"
	.byte	0x1
	.word	0x298
	.long	0x6dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x16
	.ascii "outBit\0"
	.byte	0x1
	.word	0x29a
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x29b
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.ascii "IsKlenValid\0"
	.byte	0x1
	.word	0x285
	.long	0xed3
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xed3
	.uleb128 0x15
	.ascii "val\0"
	.byte	0x1
	.word	0x285
	.long	0x6dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "bRet\0"
	.byte	0x1
	.word	0x287
	.long	0xed3
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
	.word	0x26c
	.long	0xed3
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0xf2b
	.uleb128 0x15
	.ascii "val\0"
	.byte	0x1
	.word	0x26c
	.long	0x5e6
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "bRet\0"
	.byte	0x1
	.word	0x26e
	.long	0xed3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x26f
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x18
	.ascii "RetrieveConnectorPuncturationVectors\0"
	.byte	0x1
	.word	0x22e
	.long	0x470
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xf9c
	.uleb128 0x15
	.ascii "ioInfo\0"
	.byte	0x1
	.word	0x22e
	.long	0xf9c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "inParams\0"
	.byte	0x1
	.word	0x22e
	.long	0xb73
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF7
	.byte	0x1
	.word	0x230
	.long	0x470
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x7f0
	.uleb128 0x1a
	.ascii "CnvCod_SoftDecoder\0"
	.byte	0x1
	.word	0x177
	.long	0x470
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x1197
	.uleb128 0x17
	.secrel32	LASF10
	.byte	0x1
	.word	0x177
	.long	0x1197
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF11
	.byte	0x1
	.word	0x177
	.long	0x119d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF6
	.byte	0x1
	.word	0x177
	.long	0xb73
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.secrel32	LASF7
	.byte	0x1
	.word	0x179
	.long	0x470
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.secrel32	LASF4
	.byte	0x1
	.word	0x17a
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x19
	.secrel32	LASF12
	.byte	0x1
	.word	0x17b
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x19
	.secrel32	LASF13
	.byte	0x1
	.word	0x17c
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x19
	.secrel32	LASF14
	.byte	0x1
	.word	0x17d
	.long	0x11a3
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0x19
	.secrel32	LASF15
	.byte	0x1
	.word	0x17e
	.long	0x97b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -41572
	.uleb128 0x19
	.secrel32	LASF16
	.byte	0x1
	.word	0x17f
	.long	0x97b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83044
	.uleb128 0x19
	.secrel32	LASF17
	.byte	0x1
	.word	0x180
	.long	0x7f0
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83048
	.uleb128 0x16
	.ascii "trDiagr\0"
	.byte	0x1
	.word	0x181
	.long	0x883
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83304
	.uleb128 0x16
	.ascii "eucliDist\0"
	.byte	0x1
	.word	0x182
	.long	0x345
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x19
	.secrel32	LASF18
	.byte	0x1
	.word	0x182
	.long	0x345
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x16
	.ascii "curIdx\0"
	.byte	0x1
	.word	0x183
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x16
	.ascii "wrIdx\0"
	.byte	0x1
	.word	0x183
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.ascii "finIdx\0"
	.byte	0x1
	.word	0x183
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x19
	.secrel32	LASF8
	.byte	0x1
	.word	0x184
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x16
	.ascii "i\0"
	.byte	0x1
	.word	0x185
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.word	0x186
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -81
	.uleb128 0x16
	.ascii "minDistState\0"
	.byte	0x1
	.word	0x186
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x16
	.ascii "stateDep\0"
	.byte	0x1
	.word	0x187
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -90
	.uleb128 0x16
	.ascii "stateArr\0"
	.byte	0x1
	.word	0x187
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -49
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x188
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.uleb128 0x19
	.secrel32	LASF9
	.byte	0x1
	.word	0x188
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -97
	.uleb128 0x16
	.ascii "hypIdx\0"
	.byte	0x1
	.word	0x188
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -51
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.word	0x189
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x593
	.uleb128 0x5
	.byte	0x4
	.long	0x520
	.uleb128 0x7
	.long	0x345
	.long	0x11b7
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
	.long	0x470
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x13a7
	.uleb128 0x1d
	.secrel32	LASF10
	.byte	0x1
	.byte	0xbc
	.long	0x13a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.secrel32	LASF11
	.byte	0x1
	.byte	0xbc
	.long	0x119d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1d
	.secrel32	LASF6
	.byte	0x1
	.byte	0xbc
	.long	0xb73
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1e
	.secrel32	LASF7
	.byte	0x1
	.byte	0xbe
	.long	0x470
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
	.long	0x7f0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -98
	.uleb128 0x1e
	.secrel32	LASF15
	.byte	0x1
	.byte	0xc4
	.long	0x905
	.uleb128 0x4
	.byte	0x91
	.sleb128 -41572
	.uleb128 0x1e
	.secrel32	LASF16
	.byte	0x1
	.byte	0xc5
	.long	0x905
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83044
	.uleb128 0x1f
	.ascii "trDiagr\0"
	.byte	0x1
	.byte	0xc6
	.long	0x883
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
	.long	0x13ad
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
	.long	0x535
	.uleb128 0x7
	.long	0x188
	.long	0x13c1
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
	.long	0x470
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x14e1
	.uleb128 0x1d
	.secrel32	LASF10
	.byte	0x1
	.byte	0x59
	.long	0x13a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.secrel32	LASF11
	.byte	0x1
	.byte	0x59
	.long	0x119d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1d
	.secrel32	LASF6
	.byte	0x1
	.byte	0x59
	.long	0xb73
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1e
	.secrel32	LASF7
	.byte	0x1
	.byte	0x5b
	.long	0x470
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
	.long	0x7f0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -62
	.uleb128 0x1e
	.secrel32	LASF14
	.byte	0x1
	.byte	0x62
	.long	0x520
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
	.long	0x470
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x152e
	.uleb128 0x20
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x3b
	.long	0x152e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1e
	.secrel32	LASF7
	.byte	0x1
	.byte	0x3d
	.long	0x470
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x78d
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
