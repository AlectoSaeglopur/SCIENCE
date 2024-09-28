	.file	"convolutional.c"
	.text
Ltext0:
	.section .rdata,"dr"
	.align 4
_CC_CVMATRIX:
	.byte	7
	.byte	5
	.byte	15
	.byte	11
	.byte	23
	.byte	25
	.byte	47
	.byte	53
	.byte	79
	.byte	109
	.byte	-97
	.byte	-27
	.align 4
_CC_PUNC_VECT_23:
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.align 4
_CC_PUNC_VECT_34:
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.align 4
_CC_PUNC_VECT_56:
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.align 4
_CC_PUNC_VECT_78:
	.byte	1
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.globl	_CC_RATE_ARRAY
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
	.loc 1 68 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 69 0
	movl	$0, -12(%ebp)
	.loc 1 71 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 73 0
	movl	8(%ebp), %eax
	movl	$1, (%eax)
	.loc 1 74 0
	movl	8(%ebp), %eax
	movl	$7, 4(%eax)
	.loc 1 75 0
	movl	8(%ebp), %eax
	movw	$10, 8(%eax)
	.loc 1 76 0
	movl	8(%ebp), %eax
	movl	$0, 12(%eax)
	jmp	L3
L2:
	.loc 1 80 0
	movl	$1, -12(%ebp)
L3:
	.loc 1 83 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 84 0
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
	.loc 1 97 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$96, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 98 0
	movl	$0, -12(%ebp)
	.loc 1 99 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	addl	%eax, %eax
	movl	%eax, -28(%ebp)
	.loc 1 100 0
	movl	-28(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 101 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 102 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	addl	$1, %eax
	imull	-36(%ebp), %eax
	movl	16(%ebp), %edx
	movl	(%edx), %esi
	movl	$0, %edx
	divl	%esi
	movl	%eax, -40(%ebp)
	.loc 1 103 0
	movl	-40(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -44(%ebp)
	.loc 1 105 0
	movl	$0, -80(%ebp)
	movl	$0, -76(%ebp)
	movl	$0, -72(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, -76(%ebp)
	.loc 1 106 0
	movl	$0, -16(%ebp)
	.loc 1 109 0
	movb	$0, -21(%ebp)
	.loc 1 114 0
	cmpl	$0, 8(%ebp)
	je	L6
	.loc 1 114 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L6
	.loc 1 114 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L6
	.loc 1 115 0 is_stmt 1 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 114 0 discriminator 3
	testl	%eax, %eax
	je	L6
	.loc 1 115 0
	cmpl	$0, 16(%ebp)
	je	L6
	.loc 1 117 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-68(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrieveConnectorPuncturationVectors
	.loc 1 118 0
	movl	$0, 8(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-80(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	.loc 1 120 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-44(%ebp), %eax
	jne	L7
	.loc 1 122 0
	movl	$0, -20(%ebp)
	jmp	L8
L11:
	.loc 1 124 0
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 125 0
	movl	-20(%ebp), %eax
	andl	$7, %eax
	movb	%al, -49(%ebp)
	.loc 1 126 0
	shrb	-21(%ebp)
	.loc 1 127 0
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
	.loc 1 128 0
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	.loc 1 127 0
	movl	%eax, %edx
	movzbl	-21(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -21(%ebp)
	.loc 1 129 0
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	shrl	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 130 0
	movl	-20(%ebp), %eax
	addl	%eax, %eax
	andl	$6, %eax
	movb	%al, -49(%ebp)
	.loc 1 132 0
	movb	$0, -22(%ebp)
	jmp	L9
L10:
	.loc 1 134 0 discriminator 3
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-68(%ebp), %edx
	movzbl	-22(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-21(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movzbl	%al, %edx
	.loc 1 135 0 discriminator 3
	movzbl	-22(%ebp), %eax
	negl	%eax
	movl	%eax, %ecx
	movzbl	-49(%ebp), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$7, %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	.loc 1 134 0 discriminator 3
	movl	-80(%ebp), %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	movl	-80(%ebp), %ecx
	movl	-48(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %ecx
	movl	%ebx, %edx
	orl	%ecx, %edx
	movb	%dl, (%eax)
	.loc 1 132 0 discriminator 3
	movzbl	-22(%ebp), %eax
	addl	$1, %eax
	movb	%al, -22(%ebp)
L9:
	.loc 1 132 0 is_stmt 0 discriminator 1
	cmpb	$1, -22(%ebp)
	jbe	L10
	.loc 1 122 0 is_stmt 1 discriminator 2
	addl	$1, -20(%ebp)
L8:
	.loc 1 122 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L11
	.loc 1 139 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L12
	.loc 1 141 0
	movl	$0, -20(%ebp)
	jmp	L13
L16:
	.loc 1 143 0
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 144 0
	movl	-20(%ebp), %eax
	andl	$7, %eax
	movb	%al, -49(%ebp)
	.loc 1 145 0
	movl	-80(%ebp), %edx
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
	.loc 1 146 0
	movl	-60(%ebp), %ecx
	movzbl	-56(%ebp), %eax
	movzbl	%al, %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%edx, %ebx
	imull	%eax, %ebx
	movl	-20(%ebp), %eax
	movl	$0, %edx
	divl	%ebx
	movl	%edx, %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L14
	.loc 1 148 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 149 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -49(%ebp)
	.loc 1 150 0
	addl	$1, -16(%ebp)
	.loc 1 151 0
	cmpb	$0, -50(%ebp)
	jne	L15
	.loc 1 153 0
	movl	-80(%ebp), %edx
	movl	-48(%ebp), %eax
	addl	%eax, %edx
	movl	-80(%ebp), %ecx
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
	jmp	L14
L15:
	.loc 1 157 0
	movl	-80(%ebp), %edx
	movl	-48(%ebp), %eax
	addl	%eax, %edx
	movl	-80(%ebp), %ecx
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
L14:
	.loc 1 141 0 discriminator 2
	addl	$1, -20(%ebp)
L13:
	.loc 1 141 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L16
	.loc 1 162 0 is_stmt 1
	movl	-40(%ebp), %eax
	cmpl	-16(%ebp), %eax
	je	L12
	.loc 1 164 0
	movl	$7, -12(%ebp)
L12:
	.loc 1 168 0
	cmpl	$0, -12(%ebp)
	jne	L18
	.loc 1 170 0
	movl	12(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-80(%ebp), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	jmp	L18
L7:
	.loc 1 175 0
	movl	$7, -12(%ebp)
L18:
	.loc 1 178 0
	movl	$0, 4(%esp)
	leal	-80(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	jmp	L19
L6:
	.loc 1 182 0
	movl	$1, -12(%ebp)
L19:
	.loc 1 185 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 186 0
	addl	$96, %esp
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
	.loc 1 199 0
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
	.loc 1 199 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 200 0
	movl	$0, -28(%ebp)
	.loc 1 201 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 202 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -52(%ebp)
	.loc 1 203 0
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
	.loc 1 204 0
	movl	-56(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -60(%ebp)
	.loc 1 206 0
	leal	-41576(%ebp), %eax
	movl	$41472, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 212 0
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
	.loc 1 220 0
	cmpl	$0, 8(%ebp)
	je	L22
	.loc 1 220 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L22
	.loc 1 220 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L22
	.loc 1 221 0 is_stmt 1 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 220 0 discriminator 3
	testl	%eax, %eax
	je	L22
	.loc 1 221 0
	cmpl	$0, 16(%ebp)
	je	L22
	.loc 1 223 0
	movl	16(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	jne	L23
	.loc 1 225 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-104(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrieveConnectorPuncturationVectors
	.loc 1 226 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-104(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-83304(%ebp), %eax
	movl	%eax, (%esp)
	call	_ComputeTrellisDiagram
	.loc 1 227 0
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-68(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 228 0
	movl	$1, -41576(%ebp)
	.loc 1 230 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L24
	.loc 1 232 0
	movb	$3, -43(%ebp)
	jmp	L25
L24:
	.loc 1 236 0
	movl	-96(%ebp), %edx
	movl	-68(%ebp), %eax
	movl	16(%ebp), %ecx
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	-60(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-52(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_HardDepuncturer
L25:
	.loc 1 239 0
	movl	$2, -40(%ebp)
	jmp	L26
L59:
	.loc 1 241 0
	movl	-40(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -72(%ebp)
	.loc 1 242 0
	movl	-72(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 243 0
	movl	-72(%ebp), %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 244 0
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
	.loc 1 245 0
	leal	-83048(%ebp), %eax
	leal	-41576(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 246 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L27
	.loc 1 248 0
	movb	$0, -43(%ebp)
	.loc 1 249 0
	movl	-96(%ebp), %ecx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ebx
	movl	-72(%ebp), %eax
	movl	$0, %edx
	divl	%ebx
	movl	%edx, %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movzbl	-43(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -43(%ebp)
	.loc 1 250 0
	movl	-96(%ebp), %ecx
	movl	-72(%ebp), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ebx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ebx
	movl	%edx, %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	orb	%al, -43(%ebp)
L27:
	.loc 1 252 0
	movb	$0, -44(%ebp)
	jmp	L28
L42:
	.loc 1 254 0
	movzbl	-44(%ebp), %eax
	movl	-83048(%ebp,%eax,4), %eax
	movl	-40(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L29
	.loc 1 256 0
	movb	$0, -42(%ebp)
	jmp	L30
L41:
	.loc 1 258 0
	movzbl	-44(%ebp), %edx
	movzbl	-42(%ebp), %eax
	sall	$2, %edx
	leal	-24(%ebp), %edi
	addl	%edi, %edx
	addl	%edx, %eax
	subl	$83280, %eax
	movzbl	(%eax), %eax
	xorb	-78(%ebp), %al
	andb	-43(%ebp), %al
	movzbl	%al, %eax
	movl	%eax, (%esp)
	call	_CountByteOnes
	movb	%al, -79(%ebp)
	.loc 1 259 0
	movzbl	-44(%ebp), %edx
	movzbl	-42(%ebp), %eax
	sall	$2, %edx
	leal	-24(%ebp), %edi
	addl	%edi, %edx
	addl	%edx, %eax
	subl	$83278, %eax
	movzbl	(%eax), %eax
	movb	%al, -80(%ebp)
	.loc 1 260 0
	movzbl	-80(%ebp), %eax
	movl	-41576(%ebp,%eax,4), %eax
	cmpl	-40(%ebp), %eax
	jnb	L31
	.loc 1 262 0
	movzbl	-80(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, -41576(%ebp,%eax,4)
	.loc 1 263 0
	movzbl	-80(%ebp), %eax
	movzbl	-44(%ebp), %edx
	addl	$64, %edx
	movl	-83048(%ebp,%edx,4), %ecx
	movzbl	-79(%ebp), %edx
	addl	%ecx, %edx
	addl	$64, %eax
	movl	%edx, -41576(%ebp,%eax,4)
	.loc 1 264 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L32
	.loc 1 266 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L33
L32:
	.loc 1 270 0
	movl	$639, -36(%ebp)
L33:
	.loc 1 272 0
	movl	$0, -32(%ebp)
	jmp	L34
L35:
	.loc 1 274 0 discriminator 3
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
	subl	$82512, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	subl	$41040, %eax
	movb	%cl, (%eax)
	.loc 1 272 0 discriminator 3
	addl	$1, -32(%ebp)
L34:
	.loc 1 272 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L35
	.loc 1 276 0 is_stmt 1
	movzbl	-80(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	leal	(%edi,%eax), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	leal	-41040(%eax), %edx
	movzbl	-44(%ebp), %eax
	movb	%al, (%edx)
	jmp	L36
L31:
	.loc 1 280 0
	movzbl	-44(%ebp), %eax
	addl	$64, %eax
	movl	-83048(%ebp,%eax,4), %edx
	movzbl	-79(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -84(%ebp)
	.loc 1 281 0
	movzbl	-80(%ebp), %eax
	addl	$64, %eax
	movl	-41576(%ebp,%eax,4), %eax
	cmpl	-84(%ebp), %eax
	jbe	L36
	.loc 1 283 0
	movzbl	-80(%ebp), %eax
	leal	64(%eax), %edx
	movl	-84(%ebp), %eax
	movl	%eax, -41576(%ebp,%edx,4)
	.loc 1 284 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L37
	.loc 1 286 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L38
L37:
	.loc 1 290 0
	movl	$639, -36(%ebp)
L38:
	.loc 1 292 0
	movl	$0, -32(%ebp)
	jmp	L39
L40:
	.loc 1 294 0 discriminator 3
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
	subl	$82512, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	leal	(%edi,%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	subl	$41040, %eax
	movb	%cl, (%eax)
	.loc 1 292 0 discriminator 3
	addl	$1, -32(%ebp)
L39:
	.loc 1 292 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L40
	.loc 1 296 0 is_stmt 1
	movzbl	-80(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	leal	-41040(%eax), %edx
	movzbl	-44(%ebp), %eax
	movb	%al, (%edx)
L36:
	.loc 1 256 0 discriminator 2
	movzbl	-42(%ebp), %eax
	addl	$1, %eax
	movb	%al, -42(%ebp)
L30:
	.loc 1 256 0 is_stmt 0 discriminator 1
	cmpb	$1, -42(%ebp)
	jbe	L41
L29:
	.loc 1 252 0 is_stmt 1 discriminator 2
	movzbl	-44(%ebp), %eax
	addl	$1, %eax
	movb	%al, -44(%ebp)
L28:
	.loc 1 252 0 is_stmt 0 discriminator 1
	cmpb	$63, -44(%ebp)
	jbe	L42
	.loc 1 303 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	-48(%ebp), %eax
	jne	L43
	.loc 1 305 0
	leal	-41576(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathHard
	movb	%al, -85(%ebp)
	.loc 1 306 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L44
	.loc 1 308 0
	movl	$640, -36(%ebp)
	jmp	L45
L44:
	.loc 1 312 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
L45:
	.loc 1 314 0
	movl	$0, -32(%ebp)
	jmp	L46
L51:
	.loc 1 316 0
	movzbl	-85(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	leal	(%edi,%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	subl	$41040, %eax
	movzbl	(%eax), %eax
	movb	%al, -86(%ebp)
	.loc 1 317 0
	movl	-36(%ebp), %eax
	subl	$1, %eax
	cmpl	-32(%ebp), %eax
	jne	L47
	.loc 1 319 0
	movzbl	-85(%ebp), %eax
	movb	%al, -41(%ebp)
	jmp	L48
L47:
	.loc 1 323 0
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
	subl	$41040, %eax
	movzbl	(%eax), %eax
	movb	%al, -41(%ebp)
L48:
	.loc 1 325 0
	movl	-48(%ebp), %eax
	subl	-36(%ebp), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 326 0
	movl	-48(%ebp), %eax
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	subl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 327 0
	movzbl	-86(%ebp), %eax
	movzbl	-83302(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L49
	.loc 1 329 0
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
	jmp	L50
L49:
	.loc 1 333 0
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
L50:
	.loc 1 314 0 discriminator 2
	addl	$1, -32(%ebp)
L46:
	.loc 1 314 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L51
	jmp	L52
L43:
	.loc 1 337 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L52
	.loc 1 339 0
	leal	-41576(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathHard
	movb	%al, -85(%ebp)
	.loc 1 340 0
	movzbl	-85(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %edi
	addl	%edi, %eax
	subl	$41040, %eax
	movzbl	(%eax), %eax
	movb	%al, -86(%ebp)
	.loc 1 341 0
	movzbl	-85(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	addl	%ebx, %eax
	subl	$41039, %eax
	movzbl	(%eax), %eax
	movb	%al, -41(%ebp)
	.loc 1 342 0
	movl	-40(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -76(%ebp)
	.loc 1 343 0
	movl	-40(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -77(%ebp)
	.loc 1 344 0
	movzbl	-86(%ebp), %eax
	movzbl	-83302(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L53
	.loc 1 346 0
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
	jmp	L54
L53:
	.loc 1 350 0
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
L54:
	.loc 1 352 0
	movb	$0, -44(%ebp)
	jmp	L55
L58:
	.loc 1 354 0
	movl	$0, -32(%ebp)
	jmp	L56
L57:
	.loc 1 356 0 discriminator 3
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
	subl	$41040, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-24(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	subl	$41040, %eax
	movb	%cl, (%eax)
	.loc 1 354 0 discriminator 3
	addl	$1, -32(%ebp)
L56:
	.loc 1 354 0 is_stmt 0 discriminator 1
	cmpl	$638, -32(%ebp)
	jbe	L57
	.loc 1 352 0 is_stmt 1 discriminator 2
	movzbl	-44(%ebp), %eax
	addl	$1, %eax
	movb	%al, -44(%ebp)
L55:
	.loc 1 352 0 is_stmt 0 discriminator 1
	cmpb	$63, -44(%ebp)
	jbe	L58
L52:
	.loc 1 239 0 is_stmt 1 discriminator 2
	addl	$1, -40(%ebp)
L26:
	.loc 1 239 0 is_stmt 0 discriminator 1
	movl	-48(%ebp), %eax
	addl	$2, %eax
	cmpl	-40(%ebp), %eax
	ja	L59
	.loc 1 223 0 is_stmt 1
	jmp	L61
L23:
	.loc 1 364 0
	movl	$6, -28(%ebp)
	.loc 1 223 0
	jmp	L61
L22:
	.loc 1 369 0
	movl	$1, -28(%ebp)
L61:
	.loc 1 372 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 373 0
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
	.loc 1 386 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	movl	$83356, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 386 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 387 0
	movl	$0, -28(%ebp)
	.loc 1 388 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 389 0
	movl	-48(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, -52(%ebp)
	.loc 1 390 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -56(%ebp)
	.loc 1 391 0
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
	.loc 1 392 0
	leal	-41564(%ebp), %eax
	movl	$41472, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 405 0
	cmpl	$0, 8(%ebp)
	je	L64
	.loc 1 405 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L64
	.loc 1 405 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L64
	.loc 1 406 0 is_stmt 1 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 405 0 discriminator 3
	testl	%eax, %eax
	je	L64
	.loc 1 406 0
	cmpl	$0, 16(%ebp)
	je	L64
	.loc 1 408 0
	movl	16(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$1, %eax
	jne	L65
	.loc 1 410 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-83052(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrieveConnectorPuncturationVectors
	.loc 1 411 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-83052(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-83308(%ebp), %eax
	movl	%eax, (%esp)
	call	_ComputeTrellisDiagram
	.loc 1 412 0
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
	.loc 1 413 0
	movl	$1, -41564(%ebp)
	.loc 1 415 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L66
	.loc 1 417 0
	movb	$3, -44(%ebp)
	jmp	L67
L66:
	.loc 1 421 0
	movl	-64(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 16(%esp)
	leal	-83052(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	-52(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	-56(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_SoftDepuncturer
L67:
	.loc 1 424 0
	movl	$2, -40(%ebp)
	jmp	L68
L102:
	.loc 1 426 0
	movl	-40(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -68(%ebp)
	.loc 1 427 0
	leal	-83036(%ebp), %eax
	leal	-41564(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 429 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	L69
	.loc 1 431 0
	movb	$0, -44(%ebp)
	.loc 1 432 0
	movl	-83044(%ebp), %ecx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ebx
	movl	-68(%ebp), %eax
	movl	$0, %edx
	divl	%ebx
	movl	%edx, %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movzbl	-44(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -44(%ebp)
	.loc 1 433 0
	movl	-83044(%ebp), %ecx
	movl	-68(%ebp), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	(%eax,%eax), %ebx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ebx
	movl	%edx, %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	orb	%al, -44(%ebp)
L69:
	.loc 1 436 0
	movb	$0, -42(%ebp)
	jmp	L70
L85:
	.loc 1 438 0
	movzbl	-42(%ebp), %eax
	movl	-83036(%ebp,%eax,4), %eax
	movl	-40(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L71
	.loc 1 440 0
	movb	$0, -43(%ebp)
	jmp	L72
L84:
	.loc 1 442 0
	movzbl	-44(%ebp), %edx
	.loc 1 443 0
	movzbl	-42(%ebp), %ecx
	movzbl	-43(%ebp), %eax
	sall	$2, %ecx
	leal	-24(%ebp), %edi
	addl	%edi, %ecx
	addl	%ecx, %eax
	subl	$83284, %eax
	movzbl	(%eax), %eax
	.loc 1 442 0
	movzbl	%al, %eax
	movl	-68(%ebp), %ecx
	leal	0(,%ecx,4), %ebx
	movl	-64(%ebp), %ecx
	addl	%ebx, %ecx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_EstimateEuclideanDist
	fstps	-83324(%ebp)
	movl	-83324(%ebp), %eax
	movl	%eax, -72(%ebp)
	.loc 1 444 0
	movzbl	-42(%ebp), %edx
	movzbl	-43(%ebp), %eax
	sall	$2, %edx
	leal	-24(%ebp), %edi
	addl	%edi, %edx
	addl	%edx, %eax
	subl	$83282, %eax
	movzbl	(%eax), %eax
	movb	%al, -73(%ebp)
	.loc 1 446 0
	movzbl	-73(%ebp), %eax
	movl	-41564(%ebp,%eax,4), %eax
	cmpl	-40(%ebp), %eax
	jnb	L73
	.loc 1 448 0
	movzbl	-73(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, -41564(%ebp,%eax,4)
	.loc 1 449 0
	movzbl	-73(%ebp), %eax
	movzbl	-42(%ebp), %edx
	addl	$64, %edx
	flds	-83036(%ebp,%edx,4)
	fadds	-72(%ebp)
	addl	$64, %eax
	fstps	-41564(%ebp,%eax,4)
	.loc 1 450 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L74
	.loc 1 452 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L75
L74:
	.loc 1 456 0
	movl	$639, -36(%ebp)
L75:
	.loc 1 458 0
	movl	$0, -32(%ebp)
	jmp	L76
L77:
	.loc 1 460 0 discriminator 3
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
	leal	-24(%ebp), %edi
	leal	(%edi,%eax), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	subl	$41028, %eax
	movb	%cl, (%eax)
	.loc 1 458 0 discriminator 3
	addl	$1, -32(%ebp)
L76:
	.loc 1 458 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L77
	.loc 1 462 0 is_stmt 1
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
	jmp	L78
L73:
	.loc 1 466 0
	movzbl	-42(%ebp), %eax
	addl	$64, %eax
	flds	-83036(%ebp,%eax,4)
	fadds	-72(%ebp)
	fstps	-80(%ebp)
	.loc 1 467 0
	movzbl	-73(%ebp), %eax
	addl	$64, %eax
	flds	-41564(%ebp,%eax,4)
	flds	-80(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L78
	.loc 1 469 0
	movzbl	-73(%ebp), %eax
	addl	$64, %eax
	flds	-80(%ebp)
	fstps	-41564(%ebp,%eax,4)
	.loc 1 470 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L80
	.loc 1 472 0
	movl	-40(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -36(%ebp)
	jmp	L81
L80:
	.loc 1 476 0
	movl	$639, -36(%ebp)
L81:
	.loc 1 478 0
	movl	$0, -32(%ebp)
	jmp	L82
L83:
	.loc 1 480 0 discriminator 3
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
	.loc 1 478 0 discriminator 3
	addl	$1, -32(%ebp)
L82:
	.loc 1 478 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L83
	.loc 1 482 0 is_stmt 1
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
L78:
	.loc 1 440 0 discriminator 2
	movzbl	-43(%ebp), %eax
	addl	$1, %eax
	movb	%al, -43(%ebp)
L72:
	.loc 1 440 0 is_stmt 0 discriminator 1
	cmpb	$1, -43(%ebp)
	jbe	L84
L71:
	.loc 1 436 0 is_stmt 1 discriminator 2
	movzbl	-42(%ebp), %eax
	addl	$1, %eax
	movb	%al, -42(%ebp)
L70:
	.loc 1 436 0 is_stmt 0 discriminator 1
	cmpb	$63, -42(%ebp)
	jbe	L85
	.loc 1 489 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	-48(%ebp), %eax
	jne	L86
	.loc 1 491 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathSoft
	movb	%al, -81(%ebp)
	.loc 1 492 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L87
	.loc 1 494 0
	movl	$640, -36(%ebp)
	jmp	L88
L87:
	.loc 1 498 0
	movl	-40(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
L88:
	.loc 1 500 0
	movl	$0, -32(%ebp)
	jmp	L89
L94:
	.loc 1 502 0
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
	.loc 1 503 0
	movl	-36(%ebp), %eax
	subl	$1, %eax
	cmpl	-32(%ebp), %eax
	jne	L90
	.loc 1 505 0
	movzbl	-81(%ebp), %eax
	movb	%al, -41(%ebp)
	jmp	L91
L90:
	.loc 1 509 0
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
L91:
	.loc 1 511 0
	movl	-48(%ebp), %eax
	subl	-36(%ebp), %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, -88(%ebp)
	.loc 1 512 0
	movl	-48(%ebp), %eax
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	subl	%eax, %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	andl	$7, %eax
	movb	%al, -89(%ebp)
	.loc 1 513 0
	movzbl	-82(%ebp), %eax
	movzbl	-83306(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L92
	.loc 1 515 0
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
	jmp	L93
L92:
	.loc 1 519 0
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
L93:
	.loc 1 500 0 discriminator 2
	addl	$1, -32(%ebp)
L89:
	.loc 1 500 0 is_stmt 0 discriminator 1
	movl	-32(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L94
	jmp	L95
L86:
	.loc 1 523 0 is_stmt 1
	movl	-40(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L95
	.loc 1 525 0
	leal	-41564(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinSurvPathSoft
	movb	%al, -81(%ebp)
	.loc 1 526 0
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
	.loc 1 527 0
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
	.loc 1 528 0
	movl	-40(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -88(%ebp)
	.loc 1 529 0
	movl	-40(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -89(%ebp)
	.loc 1 530 0
	movzbl	-82(%ebp), %eax
	movzbl	-83306(%ebp,%eax,4), %eax
	cmpb	-41(%ebp), %al
	jne	L96
	.loc 1 532 0
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
	jmp	L97
L96:
	.loc 1 536 0
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
L97:
	.loc 1 538 0
	movb	$0, -42(%ebp)
	jmp	L98
L101:
	.loc 1 540 0
	movl	$0, -32(%ebp)
	jmp	L99
L100:
	.loc 1 542 0 discriminator 3
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
	.loc 1 540 0 discriminator 3
	addl	$1, -32(%ebp)
L99:
	.loc 1 540 0 is_stmt 0 discriminator 1
	cmpl	$638, -32(%ebp)
	jbe	L100
	.loc 1 538 0 is_stmt 1 discriminator 2
	movzbl	-42(%ebp), %eax
	addl	$1, %eax
	movb	%al, -42(%ebp)
L98:
	.loc 1 538 0 is_stmt 0 discriminator 1
	cmpb	$63, -42(%ebp)
	jbe	L101
L95:
	.loc 1 424 0 is_stmt 1 discriminator 2
	addl	$1, -40(%ebp)
L68:
	.loc 1 424 0 is_stmt 0 discriminator 1
	movl	-48(%ebp), %eax
	addl	$2, %eax
	cmpl	-40(%ebp), %eax
	ja	L102
	.loc 1 408 0 is_stmt 1
	jmp	L104
L65:
	.loc 1 550 0
	movl	$6, -28(%ebp)
	.loc 1 408 0
	jmp	L104
L64:
	.loc 1 555 0
	movl	$1, -28(%ebp)
L104:
	.loc 1 558 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 559 0
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
	.loc 1 576 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 577 0
	movl	$0, -12(%ebp)
	.loc 1 579 0
	cmpl	$0, 8(%ebp)
	je	L108
	.loc 1 579 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L108
	.loc 1 581 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_IsKlenValid
	testb	%al, %al
	je	L109
	.loc 1 583 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	subl	$3, %eax
	addl	%eax, %eax
	leal	_CC_CVMATRIX(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 584 0
	movl	8(%ebp), %eax
	movb	$2, 4(%eax)
	jmp	L110
L109:
	.loc 1 588 0
	movl	$5, -12(%ebp)
L110:
	.loc 1 591 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_IsRateValid
	testb	%al, %al
	je	L111
	.loc 1 593 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	L113
	cmpl	$3, %eax
	ja	L114
	cmpl	$2, %eax
	je	L115
	.loc 1 617 0
	jmp	L119
L114:
	.loc 1 593 0
	cmpl	$5, %eax
	je	L116
	cmpl	$7, %eax
	je	L117
	.loc 1 617 0
	jmp	L119
L115:
	.loc 1 596 0
	movl	8(%ebp), %eax
	movl	$_CC_PUNC_VECT_23, 8(%eax)
	.loc 1 597 0
	movl	8(%ebp), %eax
	movb	$4, 12(%eax)
	.loc 1 598 0
	jmp	L119
L113:
	.loc 1 601 0
	movl	8(%ebp), %eax
	movl	$_CC_PUNC_VECT_34, 8(%eax)
	.loc 1 602 0
	movl	8(%ebp), %eax
	movb	$6, 12(%eax)
	.loc 1 603 0
	jmp	L119
L116:
	.loc 1 606 0
	movl	8(%ebp), %eax
	movl	$_CC_PUNC_VECT_56, 8(%eax)
	.loc 1 607 0
	movl	8(%ebp), %eax
	movb	$10, 12(%eax)
	.loc 1 608 0
	jmp	L119
L117:
	.loc 1 611 0
	movl	8(%ebp), %eax
	movl	$_CC_PUNC_VECT_78, 8(%eax)
	.loc 1 612 0
	movl	8(%ebp), %eax
	movb	$14, 12(%eax)
	.loc 1 613 0
	jmp	L119
L111:
	.loc 1 622 0
	movl	$4, -12(%ebp)
	.loc 1 591 0
	jmp	L120
L119:
	.loc 1 591 0 is_stmt 0 discriminator 2
	jmp	L120
L108:
	.loc 1 627 0 is_stmt 1
	movl	$1, -12(%ebp)
L120:
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
LFE22:
	.def	_IsRateValid;	.scl	3;	.type	32;	.endef
_IsRateValid:
LFB23:
	.loc 1 642 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 643 0
	movb	$0, -1(%ebp)
	.loc 1 646 0
	movb	$0, -2(%ebp)
	jmp	L123
L126:
	.loc 1 648 0
	movzbl	-2(%ebp), %eax
	movl	_CC_RATE_ARRAY(,%eax,4), %eax
	cmpl	8(%ebp), %eax
	jne	L124
	.loc 1 650 0
	movb	$1, -1(%ebp)
	.loc 1 651 0
	jmp	L125
L124:
	.loc 1 646 0 discriminator 2
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L123:
	.loc 1 646 0 is_stmt 0 discriminator 1
	cmpb	$4, -2(%ebp)
	jbe	L126
L125:
	.loc 1 655 0 is_stmt 1
	movzbl	-1(%ebp), %eax
	.loc 1 656 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	_IsKlenValid;	.scl	3;	.type	32;	.endef
_IsKlenValid:
LFB24:
	.loc 1 667 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 670 0
	cmpl	$2, 8(%ebp)
	jbe	L129
	.loc 1 670 0 is_stmt 0 discriminator 1
	cmpl	$8, 8(%ebp)
	ja	L129
	.loc 1 670 0 discriminator 3
	movl	$1, %eax
	jmp	L130
L129:
	.loc 1 670 0 discriminator 4
	movl	$0, %eax
L130:
	.loc 1 670 0 discriminator 6
	movb	%al, -1(%ebp)
	andb	$1, -1(%ebp)
	.loc 1 672 0 is_stmt 1 discriminator 6
	movzbl	-1(%ebp), %eax
	.loc 1 673 0 discriminator 6
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.def	_ComputeEncBit;	.scl	3;	.type	32;	.endef
_ComputeEncBit:
LFB25:
	.loc 1 686 0
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
	.loc 1 687 0
	movb	$0, -5(%ebp)
	.loc 1 690 0
	movb	$0, -6(%ebp)
	jmp	L133
L134:
	.loc 1 692 0 discriminator 3
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
	.loc 1 690 0 discriminator 3
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L133:
	.loc 1 690 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %eax
	cmpl	16(%ebp), %eax
	jb	L134
	.loc 1 695 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 696 0
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
	.loc 1 709 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$104, %esp
	.loc 1 710 0
	movl	$0, -12(%ebp)
	.loc 1 716 0
	cmpl	$0, 8(%ebp)
	je	L137
	.loc 1 718 0
	movb	$0, -14(%ebp)
	jmp	L138
L139:
	.loc 1 720 0 discriminator 3
	movzbl	-14(%ebp), %eax
	movzbl	-14(%ebp), %edx
	movb	%dl, -81(%ebp,%eax)
	.loc 1 718 0 discriminator 3
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L138:
	.loc 1 718 0 is_stmt 0 discriminator 1
	cmpb	$63, -14(%ebp)
	jbe	L139
	.loc 1 722 0 is_stmt 1
	movb	$0, -14(%ebp)
	jmp	L140
L149:
	.loc 1 724 0
	movzbl	-14(%ebp), %eax
	movzbl	-81(%ebp,%eax), %eax
	movb	%al, -15(%ebp)
	.loc 1 725 0
	movb	$0, -13(%ebp)
	jmp	L141
L144:
	.loc 1 727 0
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movzbl	-13(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-15(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movb	%al, -16(%ebp)
	.loc 1 728 0
	cmpb	$0, -13(%ebp)
	jne	L142
	.loc 1 730 0
	movzbl	-14(%ebp), %edx
	movzbl	-16(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	8(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
	jmp	L143
L142:
	.loc 1 734 0
	movzbl	-14(%ebp), %edx
	movzbl	-14(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	(%eax,%ecx,4), %ecx
	movzbl	-16(%ebp), %eax
	addl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
L143:
	.loc 1 725 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L141:
	.loc 1 725 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-13(%ebp), %al
	ja	L144
	.loc 1 737 0 is_stmt 1
	movzbl	-14(%ebp), %edx
	movzbl	-15(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 2(%eax,%edx,4)
	.loc 1 738 0
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
	.loc 1 739 0
	movb	$0, -13(%ebp)
	jmp	L145
L148:
	.loc 1 741 0
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movzbl	-13(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-17(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movb	%al, -16(%ebp)
	.loc 1 742 0
	cmpb	$0, -13(%ebp)
	jne	L146
	.loc 1 744 0
	movzbl	-14(%ebp), %edx
	movzbl	-16(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	8(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
	jmp	L147
L146:
	.loc 1 748 0
	movzbl	-14(%ebp), %edx
	movzbl	-14(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	1(%eax,%ecx,4), %ecx
	movzbl	-16(%ebp), %eax
	addl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
L147:
	.loc 1 739 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L145:
	.loc 1 739 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-13(%ebp), %al
	ja	L148
	.loc 1 751 0 is_stmt 1 discriminator 2
	movzbl	-14(%ebp), %edx
	movzbl	-17(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movb	%cl, 3(%eax,%edx,4)
	.loc 1 722 0 discriminator 2
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L140:
	.loc 1 722 0 is_stmt 0 discriminator 1
	cmpb	$63, -14(%ebp)
	jbe	L149
	jmp	L150
L137:
	.loc 1 756 0 is_stmt 1
	movl	$1, -12(%ebp)
L150:
	.loc 1 759 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 760 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_HardDepuncturer;	.scl	3;	.type	32;	.endef
_HardDepuncturer:
LFB27:
	.loc 1 775 0
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
	.loc 1 776 0
	movl	$0, -12(%ebp)
	.loc 1 777 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	.loc 1 780 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	.loc 1 784 0
	cmpl	$0, 8(%ebp)
	je	L153
	.loc 1 786 0
	movl	16(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	L154
L161:
	.loc 1 788 0
	movzbl	-21(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L155
	.loc 1 790 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 791 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 792 0
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
	.loc 1 793 0
	subl	$1, -16(%ebp)
	jmp	L156
L155:
	.loc 1 797 0
	movb	$0, -22(%ebp)
L156:
	.loc 1 799 0
	cmpb	$0, -21(%ebp)
	je	L157
	.loc 1 801 0
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	jmp	L158
L157:
	.loc 1 805 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
L158:
	.loc 1 807 0
	movl	-20(%ebp), %eax
	subl	$1, %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 808 0
	movl	-20(%ebp), %eax
	negl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 809 0
	cmpb	$0, -22(%ebp)
	jne	L159
	.loc 1 811 0
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
	jmp	L160
L159:
	.loc 1 815 0
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
L160:
	.loc 1 786 0 discriminator 2
	subl	$1, -20(%ebp)
L154:
	.loc 1 786 0 is_stmt 0 discriminator 1
	cmpl	$0, -20(%ebp)
	jne	L161
	jmp	L162
L153:
	.loc 1 821 0 is_stmt 1
	movl	$1, -12(%ebp)
L162:
	.loc 1 824 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 825 0
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
	.loc 1 836 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	.loc 1 838 0
	movb	$0, -2(%ebp)
	.loc 1 840 0
	movb	$0, -1(%ebp)
	jmp	L165
L167:
	.loc 1 842 0
	movzbl	-20(%ebp), %edx
	movzbl	-1(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L166
	.loc 1 844 0
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L166:
	.loc 1 840 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L165:
	.loc 1 840 0 is_stmt 0 discriminator 1
	cmpb	$7, -1(%ebp)
	jbe	L167
	.loc 1 848 0 is_stmt 1
	movzbl	-2(%ebp), %eax
	.loc 1 849 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.def	_FindMinSurvPathHard;	.scl	3;	.type	32;	.endef
_FindMinSurvPathHard:
LFB29:
	.loc 1 860 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 865 0
	cmpl	$0, 8(%ebp)
	je	L170
	.loc 1 867 0
	movl	8(%ebp), %eax
	movl	256(%eax), %eax
	movl	%eax, -4(%ebp)
	.loc 1 868 0
	movb	$0, -5(%ebp)
	.loc 1 869 0
	movb	$1, -6(%ebp)
	jmp	L171
L173:
	.loc 1 871 0
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L172
	.loc 1 871 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	cmpl	-4(%ebp), %eax
	jnb	L172
	.loc 1 873 0 is_stmt 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, -4(%ebp)
	.loc 1 874 0
	movzbl	-6(%ebp), %eax
	movb	%al, -5(%ebp)
L172:
	.loc 1 869 0 discriminator 2
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L171:
	.loc 1 869 0 is_stmt 0 discriminator 1
	cmpb	$63, -6(%ebp)
	jbe	L173
L170:
	.loc 1 879 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 880 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.def	_SoftDepuncturer;	.scl	3;	.type	32;	.endef
_SoftDepuncturer:
LFB30:
	.loc 1 895 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 896 0
	movl	$0, -12(%ebp)
	.loc 1 897 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	.loc 1 899 0
	movl	20(%ebp), %eax
	movzbl	12(%eax), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	.loc 1 901 0
	cmpl	$0, 8(%ebp)
	je	L176
	.loc 1 903 0
	movl	16(%ebp), %eax
	movl	%eax, -20(%ebp)
	jmp	L177
L182:
	.loc 1 905 0
	movl	20(%ebp), %eax
	movl	8(%eax), %edx
	movzbl	-21(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L178
	.loc 1 907 0
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
	.loc 1 908 0
	subl	$1, -16(%ebp)
	jmp	L179
L178:
	.loc 1 912 0
	movl	-20(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	fldz
	fstps	(%eax)
L179:
	.loc 1 914 0
	cmpb	$0, -21(%ebp)
	je	L180
	.loc 1 916 0
	movzbl	-21(%ebp), %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
	jmp	L181
L180:
	.loc 1 920 0
	movl	24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, %eax
	subl	$1, %eax
	movb	%al, -21(%ebp)
L181:
	.loc 1 903 0 discriminator 2
	subl	$1, -20(%ebp)
L177:
	.loc 1 903 0 is_stmt 0 discriminator 1
	cmpl	$0, -20(%ebp)
	jne	L182
	jmp	L183
L176:
	.loc 1 927 0 is_stmt 1
	movl	$1, -12(%ebp)
L183:
	.loc 1 930 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 931 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.def	_EstimateEuclideanDist;	.scl	3;	.type	32;	.endef
_EstimateEuclideanDist:
LFB31:
	.loc 1 944 0
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
	.loc 1 946 0
	fldz
	fstps	-8(%ebp)
	.loc 1 948 0
	cmpl	$0, 8(%ebp)
	je	L186
	.loc 1 950 0
	movb	$0, -1(%ebp)
	jmp	L187
L189:
	.loc 1 952 0
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
	je	L188
	.loc 1 954 0
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
L188:
	.loc 1 950 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L187:
	.loc 1 950 0 is_stmt 0 discriminator 1
	cmpb	$1, -1(%ebp)
	jbe	L189
L186:
	.loc 1 959 0 is_stmt 1
	flds	-8(%ebp)
	.loc 1 960 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.def	_FindMinSurvPathSoft;	.scl	3;	.type	32;	.endef
_FindMinSurvPathSoft:
LFB32:
	.loc 1 971 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 976 0
	cmpl	$0, 8(%ebp)
	je	L192
	.loc 1 978 0
	movl	8(%ebp), %eax
	flds	256(%eax)
	fstps	-4(%ebp)
	.loc 1 979 0
	movb	$0, -5(%ebp)
	.loc 1 980 0
	movb	$1, -6(%ebp)
	jmp	L193
L196:
	.loc 1 982 0
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L194
	.loc 1 982 0 is_stmt 0 discriminator 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	flds	(%eax,%edx,4)
	flds	-4(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L194
	.loc 1 984 0 is_stmt 1
	movzbl	-6(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	flds	(%eax,%edx,4)
	fstps	-4(%ebp)
	.loc 1 985 0
	movzbl	-6(%ebp), %eax
	movb	%al, -5(%ebp)
L194:
	.loc 1 980 0 discriminator 2
	movzbl	-6(%ebp), %eax
	addl	$1, %eax
	movb	%al, -6(%ebp)
L193:
	.loc 1 980 0 is_stmt 0 discriminator 1
	cmpb	$63, -6(%ebp)
	jbe	L196
L192:
	.loc 1 990 0 is_stmt 1
	movzbl	-5(%ebp), %eax
	.loc 1 991 0
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
	.long	0x1727
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
	.long	0x526
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
	.byte	0x6
	.byte	0x32
	.long	0x353
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x7
	.byte	0x1d
	.long	0x57f
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
	.long	0x535
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x24
	.long	0x5d0
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x26
	.long	0x5d0
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
	.long	0x57f
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x188
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x29
	.long	0x594
	.uleb128 0xa
	.long	0x5d6
	.uleb128 0x3
	.ascii "_float_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x2c
	.long	0x62d
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x2e
	.long	0x62d
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
	.long	0x57f
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x345
	.uleb128 0x6
	.ascii "float_stream_t\0"
	.byte	0x7
	.byte	0x31
	.long	0x5f0
	.uleb128 0xa
	.long	0x633
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x3d
	.long	0x69c
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
	.byte	0x3f
	.long	0x64e
	.uleb128 0xa
	.long	0x69c
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x43
	.long	0x722
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
	.byte	0x50
	.long	0x793
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
	.byte	0x59
	.long	0x722
	.uleb128 0xd
	.byte	0x4
	.long	0x77
	.byte	0x8
	.byte	0x5e
	.long	0x7e0
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
	.byte	0x63
	.long	0x7a4
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0x8
	.byte	0x66
	.long	0x843
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0x8
	.byte	0x68
	.long	0x69c
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0x8
	.byte	0x69
	.long	0x793
	.byte	0x4
	.uleb128 0x4
	.ascii "memFact\0"
	.byte	0x8
	.byte	0x6a
	.long	0x1ba
	.byte	0x8
	.uleb128 0x4
	.ascii "vitDM\0"
	.byte	0x8
	.byte	0x6b
	.long	0x7e0
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0x8
	.byte	0x6c
	.long	0x7f7
	.uleb128 0xa
	.long	0x843
	.uleb128 0x3
	.ascii "_cc_encoder_info_t\0"
	.byte	0x10
	.byte	0x8
	.byte	0x6f
	.long	0x8c0
	.uleb128 0x4
	.ascii "pConnVect\0"
	.byte	0x8
	.byte	0x71
	.long	0x8c0
	.byte	0
	.uleb128 0x4
	.ascii "lenConnVect\0"
	.byte	0x8
	.byte	0x72
	.long	0x188
	.byte	0x4
	.uleb128 0x4
	.ascii "pPuncVect\0"
	.byte	0x8
	.byte	0x73
	.long	0x8c0
	.byte	0x8
	.uleb128 0x4
	.ascii "lenPuncVect\0"
	.byte	0x8
	.byte	0x74
	.long	0x188
	.byte	0xc
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x197
	.uleb128 0x6
	.ascii "cc_encoder_info_t\0"
	.byte	0x8
	.byte	0x75
	.long	0x858
	.uleb128 0xa
	.long	0x8c6
	.uleb128 0x3
	.ascii "_cc_trcore_t\0"
	.byte	0x4
	.byte	0x8
	.byte	0x78
	.long	0x916
	.uleb128 0x4
	.ascii "outBits\0"
	.byte	0x8
	.byte	0x7a
	.long	0x916
	.byte	0
	.uleb128 0xf
	.secrel32	LASF0
	.byte	0x8
	.byte	0x7b
	.long	0x916
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x926
	.uleb128 0xc
	.long	0x2df
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.ascii "cc_trcore_t\0"
	.byte	0x8
	.byte	0x7c
	.long	0x8e4
	.uleb128 0x10
	.ascii "_cc_trellis_t\0"
	.word	0x100
	.byte	0x8
	.byte	0x7f
	.long	0x95e
	.uleb128 0x4
	.ascii "trSt\0"
	.byte	0x8
	.byte	0x81
	.long	0x95e
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x926
	.long	0x96e
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.ascii "cc_trellis_t\0"
	.byte	0x8
	.byte	0x82
	.long	0x939
	.uleb128 0x10
	.ascii "_cc_hard_dec_info_t\0"
	.word	0xa200
	.byte	0x8
	.byte	0x85
	.long	0x9c9
	.uleb128 0x4
	.ascii "iter\0"
	.byte	0x8
	.byte	0x87
	.long	0x9c9
	.byte	0
	.uleb128 0x11
	.ascii "dist\0"
	.byte	0x8
	.byte	0x88
	.long	0x9c9
	.word	0x100
	.uleb128 0x11
	.ascii "path\0"
	.byte	0x8
	.byte	0x89
	.long	0x9d9
	.word	0x200
	.byte	0
	.uleb128 0x7
	.long	0x1ca
	.long	0x9d9
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x7
	.long	0x188
	.long	0x9f0
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
	.byte	0x8a
	.long	0x982
	.uleb128 0xa
	.long	0x9f0
	.uleb128 0x10
	.ascii "_cc_soft_dec_info_t\0"
	.word	0xa200
	.byte	0x8
	.byte	0x8e
	.long	0xa56
	.uleb128 0x4
	.ascii "iter\0"
	.byte	0x8
	.byte	0x90
	.long	0x9c9
	.byte	0
	.uleb128 0x11
	.ascii "dist\0"
	.byte	0x8
	.byte	0x91
	.long	0xa56
	.word	0x100
	.uleb128 0x11
	.ascii "path\0"
	.byte	0x8
	.byte	0x92
	.long	0x9d9
	.word	0x200
	.byte	0
	.uleb128 0x7
	.long	0x345
	.long	0xa66
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.ascii "cc_soft_dec_info_t\0"
	.byte	0x8
	.byte	0x93
	.long	0xa0f
	.uleb128 0xa
	.long	0xa66
	.uleb128 0x7
	.long	0x197
	.long	0xa9b
	.uleb128 0xc
	.long	0x2df
	.byte	0x5
	.uleb128 0xc
	.long	0x2df
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.long	0xa85
	.uleb128 0x13
	.ascii "CC_CVMATRIX\0"
	.byte	0x1
	.byte	0x17
	.long	0xa9b
	.uleb128 0x5
	.byte	0x3
	.long	_CC_CVMATRIX
	.uleb128 0x7
	.long	0x197
	.long	0xac9
	.uleb128 0xc
	.long	0x2df
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.long	0xab9
	.uleb128 0x13
	.ascii "CC_PUNC_VECT_23\0"
	.byte	0x1
	.byte	0x1a
	.long	0xac9
	.uleb128 0x5
	.byte	0x3
	.long	_CC_PUNC_VECT_23
	.uleb128 0x7
	.long	0x197
	.long	0xafb
	.uleb128 0xc
	.long	0x2df
	.byte	0x5
	.byte	0
	.uleb128 0xa
	.long	0xaeb
	.uleb128 0x13
	.ascii "CC_PUNC_VECT_34\0"
	.byte	0x1
	.byte	0x1b
	.long	0xafb
	.uleb128 0x5
	.byte	0x3
	.long	_CC_PUNC_VECT_34
	.uleb128 0x7
	.long	0x197
	.long	0xb2d
	.uleb128 0xc
	.long	0x2df
	.byte	0x9
	.byte	0
	.uleb128 0xa
	.long	0xb1d
	.uleb128 0x13
	.ascii "CC_PUNC_VECT_56\0"
	.byte	0x1
	.byte	0x1c
	.long	0xb2d
	.uleb128 0x5
	.byte	0x3
	.long	_CC_PUNC_VECT_56
	.uleb128 0x7
	.long	0x197
	.long	0xb5f
	.uleb128 0xc
	.long	0x2df
	.byte	0xd
	.byte	0
	.uleb128 0xa
	.long	0xb4f
	.uleb128 0x13
	.ascii "CC_PUNC_VECT_78\0"
	.byte	0x1
	.byte	0x1d
	.long	0xb5f
	.uleb128 0x5
	.byte	0x3
	.long	_CC_PUNC_VECT_78
	.uleb128 0x7
	.long	0x6ad
	.long	0xb91
	.uleb128 0xc
	.long	0x2df
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.long	0xb81
	.uleb128 0x14
	.ascii "CC_RATE_ARRAY\0"
	.byte	0x1
	.byte	0x1f
	.long	0xb91
	.uleb128 0x5
	.byte	0x3
	.long	_CC_RATE_ARRAY
	.uleb128 0x15
	.ascii "FindMinSurvPathSoft\0"
	.byte	0x1
	.word	0x3ca
	.long	0x188
	.long	LFB32
	.long	LFE32-LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0xc23
	.uleb128 0x16
	.ascii "inPaths\0"
	.byte	0x1
	.word	0x3ca
	.long	0xc23
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.ascii "minDist\0"
	.byte	0x1
	.word	0x3cc
	.long	0x345
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.ascii "minStIdx\0"
	.byte	0x1
	.word	0x3cd
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x17
	.ascii "j\0"
	.byte	0x1
	.word	0x3ce
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xa80
	.uleb128 0x15
	.ascii "EstimateEuclideanDist\0"
	.byte	0x1
	.word	0x3af
	.long	0x345
	.long	LFB31
	.long	LFE31-LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0xca6
	.uleb128 0x16
	.ascii "inBuf\0"
	.byte	0x1
	.word	0x3af
	.long	0xca6
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "trlByte\0"
	.byte	0x1
	.word	0x3af
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x18
	.secrel32	LASF1
	.byte	0x1
	.word	0x3af
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.ascii "j\0"
	.byte	0x1
	.word	0x3b1
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x17
	.ascii "Dist\0"
	.byte	0x1
	.word	0x3b2
	.long	0x345
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x34e
	.uleb128 0x19
	.ascii "SoftDepuncturer\0"
	.byte	0x1
	.word	0x37e
	.long	0x526
	.long	LFB30
	.long	LFE30-LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0xd54
	.uleb128 0x18
	.secrel32	LASF2
	.byte	0x1
	.word	0x37e
	.long	0x62d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.secrel32	LASF3
	.byte	0x1
	.word	0x37e
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.secrel32	LASF4
	.byte	0x1
	.word	0x37e
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x18
	.secrel32	LASF5
	.byte	0x1
	.word	0x37e
	.long	0xd54
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x18
	.secrel32	LASF6
	.byte	0x1
	.word	0x37e
	.long	0xd5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.word	0x380
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.ascii "i\0"
	.byte	0x1
	.word	0x381
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.ascii "j\0"
	.byte	0x1
	.word	0x382
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.ascii "k\0"
	.byte	0x1
	.word	0x383
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x8df
	.uleb128 0x5
	.byte	0x4
	.long	0x853
	.uleb128 0x15
	.ascii "FindMinSurvPathHard\0"
	.byte	0x1
	.word	0x35b
	.long	0x188
	.long	LFB29
	.long	LFE29-LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0xdd5
	.uleb128 0x16
	.ascii "inPaths\0"
	.byte	0x1
	.word	0x35b
	.long	0xdd5
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.ascii "minDist\0"
	.byte	0x1
	.word	0x35d
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.ascii "minStateIdx\0"
	.byte	0x1
	.word	0x35e
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x17
	.ascii "j\0"
	.byte	0x1
	.word	0x35f
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xa0a
	.uleb128 0x15
	.ascii "CountByteOnes\0"
	.byte	0x1
	.word	0x343
	.long	0x188
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0xe2e
	.uleb128 0x16
	.ascii "inByte\0"
	.byte	0x1
	.word	0x343
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.ascii "j\0"
	.byte	0x1
	.word	0x345
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x17
	.ascii "cnt\0"
	.byte	0x1
	.word	0x346
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x19
	.ascii "HardDepuncturer\0"
	.byte	0x1
	.word	0x306
	.long	0x526
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xf17
	.uleb128 0x18
	.secrel32	LASF2
	.byte	0x1
	.word	0x306
	.long	0x5d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.secrel32	LASF3
	.byte	0x1
	.word	0x306
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.secrel32	LASF4
	.byte	0x1
	.word	0x306
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x16
	.ascii "punctVect\0"
	.byte	0x1
	.word	0x306
	.long	0x8c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x18
	.secrel32	LASF6
	.byte	0x1
	.word	0x306
	.long	0xd5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.word	0x308
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.ascii "rdIdx\0"
	.byte	0x1
	.word	0x309
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.secrel32	LASF8
	.byte	0x1
	.word	0x30a
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x17
	.ascii "j\0"
	.byte	0x1
	.word	0x30b
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.ascii "rdIdxPunc\0"
	.byte	0x1
	.word	0x30c
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x1a
	.secrel32	LASF9
	.byte	0x1
	.word	0x30d
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x17
	.ascii "rdBit\0"
	.byte	0x1
	.word	0x30e
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.byte	0
	.uleb128 0x19
	.ascii "ComputeTrellisDiagram\0"
	.byte	0x1
	.word	0x2c4
	.long	0x526
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xfed
	.uleb128 0x16
	.ascii "ioTrellisDiagr\0"
	.byte	0x1
	.word	0x2c4
	.long	0xfed
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.secrel32	LASF5
	.byte	0x1
	.word	0x2c4
	.long	0xd54
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.secrel32	LASF6
	.byte	0x1
	.word	0x2c4
	.long	0xd5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.word	0x2c6
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.ascii "StBin\0"
	.byte	0x1
	.word	0x2c7
	.long	0xff3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x17
	.ascii "i\0"
	.byte	0x1
	.word	0x2c8
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x17
	.ascii "j\0"
	.byte	0x1
	.word	0x2c8
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x17
	.ascii "outBit\0"
	.byte	0x1
	.word	0x2c9
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.ascii "state0\0"
	.byte	0x1
	.word	0x2ca
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x17
	.ascii "state1\0"
	.byte	0x1
	.word	0x2ca
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x96e
	.uleb128 0x7
	.long	0x188
	.long	0x1003
	.uleb128 0xc
	.long	0x2df
	.byte	0x3f
	.byte	0
	.uleb128 0x15
	.ascii "ComputeEncBit\0"
	.byte	0x1
	.word	0x2ad
	.long	0x188
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x107a
	.uleb128 0x16
	.ascii "cState\0"
	.byte	0x1
	.word	0x2ad
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.ascii "cvVal\0"
	.byte	0x1
	.word	0x2ad
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.ascii "kLen\0"
	.byte	0x1
	.word	0x2ad
	.long	0x793
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.ascii "outBit\0"
	.byte	0x1
	.word	0x2af
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x17
	.ascii "j\0"
	.byte	0x1
	.word	0x2b0
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x15
	.ascii "IsKlenValid\0"
	.byte	0x1
	.word	0x29a
	.long	0x10bd
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x10bd
	.uleb128 0x16
	.ascii "kVal\0"
	.byte	0x1
	.word	0x29a
	.long	0x793
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.ascii "bRet\0"
	.byte	0x1
	.word	0x29c
	.long	0x10bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x15
	.ascii "IsRateValid\0"
	.byte	0x1
	.word	0x281
	.long	0x10bd
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x1119
	.uleb128 0x16
	.ascii "rateVal\0"
	.byte	0x1
	.word	0x281
	.long	0x69c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.ascii "bRet\0"
	.byte	0x1
	.word	0x283
	.long	0x10bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x17
	.ascii "j\0"
	.byte	0x1
	.word	0x284
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x19
	.ascii "RetrieveConnectorPuncturationVectors\0"
	.byte	0x1
	.word	0x23f
	.long	0x526
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x1185
	.uleb128 0x16
	.ascii "ioInfo\0"
	.byte	0x1
	.word	0x23f
	.long	0x1185
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.secrel32	LASF6
	.byte	0x1
	.word	0x23f
	.long	0xd5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.word	0x241
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x8c6
	.uleb128 0x1b
	.ascii "CnvCod_SoftDecoder\0"
	.byte	0x1
	.word	0x181
	.long	0x526
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x1380
	.uleb128 0x18
	.secrel32	LASF10
	.byte	0x1
	.word	0x181
	.long	0x1380
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.secrel32	LASF11
	.byte	0x1
	.word	0x181
	.long	0x1386
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.secrel32	LASF6
	.byte	0x1
	.word	0x181
	.long	0xd5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.word	0x183
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.secrel32	LASF4
	.byte	0x1
	.word	0x184
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1a
	.secrel32	LASF12
	.byte	0x1
	.word	0x185
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1a
	.secrel32	LASF13
	.byte	0x1
	.word	0x186
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1a
	.secrel32	LASF14
	.byte	0x1
	.word	0x187
	.long	0x138c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0x1a
	.secrel32	LASF15
	.byte	0x1
	.word	0x188
	.long	0xa66
	.uleb128 0x4
	.byte	0x91
	.sleb128 -41572
	.uleb128 0x1a
	.secrel32	LASF16
	.byte	0x1
	.word	0x189
	.long	0xa66
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83044
	.uleb128 0x1a
	.secrel32	LASF5
	.byte	0x1
	.word	0x18a
	.long	0x8c6
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83060
	.uleb128 0x17
	.ascii "trDiagr\0"
	.byte	0x1
	.word	0x18b
	.long	0x96e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83316
	.uleb128 0x17
	.ascii "eucliDist\0"
	.byte	0x1
	.word	0x18c
	.long	0x345
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1a
	.secrel32	LASF17
	.byte	0x1
	.word	0x18c
	.long	0x345
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x17
	.ascii "curIdx\0"
	.byte	0x1
	.word	0x18d
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x17
	.ascii "wrIdx\0"
	.byte	0x1
	.word	0x18d
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.ascii "finIdx\0"
	.byte	0x1
	.word	0x18d
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1a
	.secrel32	LASF8
	.byte	0x1
	.word	0x18e
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x17
	.ascii "i\0"
	.byte	0x1
	.word	0x18f
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.word	0x190
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -81
	.uleb128 0x17
	.ascii "minDistState\0"
	.byte	0x1
	.word	0x190
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x17
	.ascii "stateDep\0"
	.byte	0x1
	.word	0x191
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -90
	.uleb128 0x17
	.ascii "stateArr\0"
	.byte	0x1
	.word	0x191
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -49
	.uleb128 0x17
	.ascii "j\0"
	.byte	0x1
	.word	0x192
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.uleb128 0x1a
	.secrel32	LASF9
	.byte	0x1
	.word	0x192
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -97
	.uleb128 0x17
	.ascii "hypIdx\0"
	.byte	0x1
	.word	0x192
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -51
	.uleb128 0x1a
	.secrel32	LASF1
	.byte	0x1
	.word	0x193
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x649
	.uleb128 0x5
	.byte	0x4
	.long	0x5d6
	.uleb128 0x7
	.long	0x345
	.long	0x13a0
	.uleb128 0x1c
	.long	0x2df
	.uleb128 0x4
	.byte	0x91
	.sleb128 -68
	.byte	0x6
	.byte	0
	.uleb128 0x1d
	.ascii "CnvCod_HardDecoder\0"
	.byte	0x1
	.byte	0xc6
	.long	0x526
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x1590
	.uleb128 0x1e
	.secrel32	LASF10
	.byte	0x1
	.byte	0xc6
	.long	0x1590
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1e
	.secrel32	LASF11
	.byte	0x1
	.byte	0xc6
	.long	0x1386
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1e
	.secrel32	LASF6
	.byte	0x1
	.byte	0xc6
	.long	0xd5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1f
	.secrel32	LASF7
	.byte	0x1
	.byte	0xc8
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.secrel32	LASF4
	.byte	0x1
	.byte	0xc9
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.secrel32	LASF3
	.byte	0x1
	.byte	0xca
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1f
	.secrel32	LASF18
	.byte	0x1
	.byte	0xcb
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1f
	.secrel32	LASF12
	.byte	0x1
	.byte	0xcc
	.long	0x1da
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1f
	.secrel32	LASF5
	.byte	0x1
	.byte	0xcd
	.long	0x8c6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1f
	.secrel32	LASF15
	.byte	0x1
	.byte	0xce
	.long	0x9f0
	.uleb128 0x4
	.byte	0x91
	.sleb128 -41584
	.uleb128 0x1f
	.secrel32	LASF16
	.byte	0x1
	.byte	0xcf
	.long	0x9f0
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83056
	.uleb128 0x13
	.ascii "trDiagr\0"
	.byte	0x1
	.byte	0xd0
	.long	0x96e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83312
	.uleb128 0x1f
	.secrel32	LASF8
	.byte	0x1
	.byte	0xd1
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x13
	.ascii "inIdx\0"
	.byte	0x1
	.byte	0xd1
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x13
	.ascii "wrIdx\0"
	.byte	0x1
	.byte	0xd1
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.ascii "finIdx\0"
	.byte	0x1
	.byte	0xd1
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1f
	.secrel32	LASF17
	.byte	0x1
	.byte	0xd2
	.long	0x1ca
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x13
	.ascii "i\0"
	.byte	0x1
	.byte	0xd3
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1f
	.secrel32	LASF14
	.byte	0x1
	.byte	0xd4
	.long	0x1596
	.uleb128 0x4
	.byte	0x91
	.sleb128 -76
	.byte	0x6
	.uleb128 0x1f
	.secrel32	LASF0
	.byte	0x1
	.byte	0xd5
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x13
	.ascii "minDistSt\0"
	.byte	0x1
	.byte	0xd5
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -93
	.uleb128 0x13
	.ascii "depSt\0"
	.byte	0x1
	.byte	0xd5
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -94
	.uleb128 0x13
	.ascii "arrSt\0"
	.byte	0x1
	.byte	0xd5
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -49
	.uleb128 0x1f
	.secrel32	LASF9
	.byte	0x1
	.byte	0xd6
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -85
	.uleb128 0x13
	.ascii "hypIdx\0"
	.byte	0x1
	.byte	0xd6
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.uleb128 0x13
	.ascii "cycleBits\0"
	.byte	0x1
	.byte	0xd7
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -86
	.uleb128 0x13
	.ascii "hamDist\0"
	.byte	0x1
	.byte	0xd8
	.long	0x188
	.uleb128 0x3
	.byte	0x91
	.sleb128 -87
	.uleb128 0x1f
	.secrel32	LASF1
	.byte	0x1
	.byte	0xd9
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -51
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.byte	0xda
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5eb
	.uleb128 0x7
	.long	0x188
	.long	0x15aa
	.uleb128 0x1c
	.long	0x2df
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0
	.uleb128 0x1d
	.ascii "CnvCod_Encoder\0"
	.byte	0x1
	.byte	0x60
	.long	0x526
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x16d7
	.uleb128 0x1e
	.secrel32	LASF10
	.byte	0x1
	.byte	0x60
	.long	0x1590
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1e
	.secrel32	LASF11
	.byte	0x1
	.byte	0x60
	.long	0x1386
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1e
	.secrel32	LASF6
	.byte	0x1
	.byte	0x60
	.long	0xd5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1f
	.secrel32	LASF7
	.byte	0x1
	.byte	0x62
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1f
	.secrel32	LASF18
	.byte	0x1
	.byte	0x63
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.secrel32	LASF12
	.byte	0x1
	.byte	0x64
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.secrel32	LASF3
	.byte	0x1
	.byte	0x65
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1f
	.secrel32	LASF13
	.byte	0x1
	.byte	0x66
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.ascii "punLenBy\0"
	.byte	0x1
	.byte	0x67
	.long	0x1da
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1f
	.secrel32	LASF5
	.byte	0x1
	.byte	0x68
	.long	0x8c6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1f
	.secrel32	LASF14
	.byte	0x1
	.byte	0x69
	.long	0x5d6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x13
	.ascii "wrIdx\0"
	.byte	0x1
	.byte	0x6a
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1f
	.secrel32	LASF8
	.byte	0x1
	.byte	0x6b
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.byte	0x6c
	.long	0x1ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.ascii "encState\0"
	.byte	0x1
	.byte	0x6d
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x1f
	.secrel32	LASF9
	.byte	0x1
	.byte	0x6e
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -57
	.uleb128 0x13
	.ascii "rdBit\0"
	.byte	0x1
	.byte	0x6f
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -58
	.uleb128 0x13
	.ascii "k\0"
	.byte	0x1
	.byte	0x70
	.long	0x188
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.byte	0
	.uleb128 0x1d
	.ascii "CnvCod_ListParameters\0"
	.byte	0x1
	.byte	0x43
	.long	0x526
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x1724
	.uleb128 0x20
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x43
	.long	0x1724
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1f
	.secrel32	LASF7
	.byte	0x1
	.byte	0x45
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x843
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
LASF18:
	.ascii "unpLenBy\0"
LASF5:
	.ascii "encInfo\0"
LASF11:
	.ascii "outStream\0"
LASF1:
	.ascii "erasMask\0"
LASF14:
	.ascii "tmpStream\0"
LASF8:
	.ascii "byteIdx\0"
LASF0:
	.ascii "nextSt\0"
LASF17:
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
