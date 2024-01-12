	.file	"convolutional.c"
	.text
Ltext0:
	.globl	_GetConvCP
	.def	_GetConvCP;	.scl	2;	.type	32;	.endef
_GetConvCP:
LFB18:
	.file 1 "../convolutional.c"
	.loc 1 41 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	.loc 1 42 0
	movb	$4, -9(%ebp)
	.loc 1 43 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 44 0
	movb	$7, -55(%ebp)
	movb	$5, -54(%ebp)
	movb	$15, -53(%ebp)
	movb	$11, -52(%ebp)
	movb	$23, -51(%ebp)
	movb	$25, -50(%ebp)
	movb	$47, -49(%ebp)
	movb	$53, -48(%ebp)
	movb	$79, -47(%ebp)
	movb	$109, -46(%ebp)
	movb	$-97, -45(%ebp)
	movb	$-27, -44(%ebp)
	movzwl	-47(%ebp), %edx
	movl	8(%ebp), %eax
	movw	%dx, (%eax)
L2:
	.loc 1 46 0
	cmpl	$0, 12(%ebp)
	je	L4
	.loc 1 49 0
	movzbl	-9(%ebp), %eax
	movb	$1, -43(%ebp)
	movb	$1, -42(%ebp)
	movb	$0, -41(%ebp)
	movb	$1, -40(%ebp)
	movl	%eax, 8(%esp)
	leal	-43(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 50 0
	nop
L4:
	.loc 1 62 0
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_GetTrellis
	.def	_GetTrellis;	.scl	2;	.type	32;	.endef
_GetTrellis:
LFB19:
	.loc 1 71 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$104, %esp
	.loc 1 75 0
	movb	$1, -11(%ebp)
	.loc 1 76 0
	movb	$0, -10(%ebp)
	jmp	L6
L7:
	.loc 1 77 0 discriminator 3
	movzbl	-10(%ebp), %eax
	movzbl	-10(%ebp), %edx
	movb	%dl, -78(%ebp,%eax)
	.loc 1 76 0 discriminator 3
	movzbl	-10(%ebp), %eax
	addl	$1, %eax
	movb	%al, -10(%ebp)
L6:
	.loc 1 76 0 is_stmt 0 discriminator 1
	cmpb	$63, -10(%ebp)
	jbe	L7
	.loc 1 79 0 is_stmt 1
	cmpl	$0, 12(%ebp)
	je	L19
	.loc 1 80 0
	movb	$0, -10(%ebp)
	jmp	L9
L18:
	.loc 1 81 0
	movzbl	-10(%ebp), %eax
	movzbl	-78(%ebp,%eax), %eax
	movb	%al, -12(%ebp)
	.loc 1 82 0
	movb	$0, -9(%ebp)
	jmp	L10
L13:
	.loc 1 83 0
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movb	%al, -13(%ebp)
	.loc 1 84 0
	cmpb	$0, -9(%ebp)
	jne	L11
	.loc 1 85 0
	movzbl	-10(%ebp), %edx
	movzbl	-13(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	12(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
	jmp	L12
L11:
	.loc 1 87 0
	movzbl	-10(%ebp), %edx
	movzbl	-10(%ebp), %ecx
	movl	12(%ebp), %eax
	movzbl	(%eax,%ecx,4), %ecx
	movzbl	-13(%ebp), %eax
	addl	%eax, %ecx
	movl	12(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
L12:
	.loc 1 82 0 discriminator 2
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L10:
	.loc 1 82 0 is_stmt 0 discriminator 1
	cmpb	$1, -9(%ebp)
	jbe	L13
	.loc 1 90 0 is_stmt 1
	movzbl	-10(%ebp), %edx
	movzbl	-12(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	movb	%cl, 2(%eax,%edx,4)
	.loc 1 91 0
	movzbl	-11(%ebp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movzbl	-12(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -14(%ebp)
	.loc 1 92 0
	movb	$0, -9(%ebp)
	jmp	L14
L17:
	.loc 1 93 0
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-14(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movb	%al, -13(%ebp)
	.loc 1 94 0
	cmpb	$0, -9(%ebp)
	jne	L15
	.loc 1 95 0
	movzbl	-10(%ebp), %edx
	movzbl	-13(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	12(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
	jmp	L16
L15:
	.loc 1 97 0
	movzbl	-10(%ebp), %edx
	movzbl	-10(%ebp), %ecx
	movl	12(%ebp), %eax
	movzbl	1(%eax,%ecx,4), %ecx
	movzbl	-13(%ebp), %eax
	addl	%eax, %ecx
	movl	12(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
L16:
	.loc 1 92 0 discriminator 2
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L14:
	.loc 1 92 0 is_stmt 0 discriminator 1
	cmpb	$1, -9(%ebp)
	jbe	L17
	.loc 1 100 0 is_stmt 1 discriminator 2
	movzbl	-10(%ebp), %edx
	movzbl	-14(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	movb	%cl, 3(%eax,%edx,4)
	.loc 1 80 0 discriminator 2
	movzbl	-10(%ebp), %eax
	addl	$1, %eax
	movb	%al, -10(%ebp)
L9:
	.loc 1 80 0 is_stmt 0 discriminator 1
	cmpb	$63, -10(%ebp)
	jbe	L18
L19:
	.loc 1 103 0 is_stmt 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.def	_ComputeEncBit;	.scl	3;	.type	32;	.endef
_ComputeEncBit:
LFB20:
	.loc 1 112 0
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
	.loc 1 114 0
	movb	$0, -6(%ebp)
	.loc 1 115 0
	movb	$1, -7(%ebp)
	.loc 1 116 0
	movb	$0, -5(%ebp)
	jmp	L21
L22:
	.loc 1 117 0 discriminator 3
	movzbl	-24(%ebp), %edx
	movzbl	-5(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %ebx
	movzbl	-28(%ebp), %edx
	movzbl	-5(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	%eax, %ebx
	movl	%ebx, %edx
	movzbl	-7(%ebp), %eax
	andl	%edx, %eax
	addb	%al, -6(%ebp)
	.loc 1 116 0 discriminator 3
	movzbl	-5(%ebp), %eax
	addl	$1, %eax
	movb	%al, -5(%ebp)
L21:
	.loc 1 116 0 is_stmt 0 discriminator 1
	cmpb	$6, -5(%ebp)
	jbe	L22
	.loc 1 119 0 is_stmt 1
	movzbl	-6(%ebp), %eax
	andl	$1, %eax
	.loc 1 120 0
	addl	$24, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_ConvEncoder
	.def	_ConvEncoder;	.scl	2;	.type	32;	.endef
_ConvEncoder:
LFB21:
	.loc 1 131 0
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
	.loc 1 132 0
	movb	$0, -9(%ebp)
	.loc 1 133 0
	movb	$1, -21(%ebp)
	.loc 1 136 0
	movl	$0, -20(%ebp)
	.loc 1 137 0
	movl	$200, 8(%esp)
	movl	$0, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 138 0
	movl	$0, -16(%ebp)
	jmp	L25
L26:
	.loc 1 139 0 discriminator 3
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 140 0 discriminator 3
	movl	-16(%ebp), %eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 141 0 discriminator 3
	shrb	-9(%ebp)
	.loc 1 142 0 discriminator 3
	movl	8(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-29(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movzbl	-21(%ebp), %eax
	andl	%edx, %eax
	sall	$6, %eax
	movl	%eax, %edx
	movzbl	-9(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -9(%ebp)
	.loc 1 143 0 discriminator 3
	movl	-16(%ebp), %eax
	addl	%eax, %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 144 0 discriminator 3
	movl	-16(%ebp), %eax
	addl	%eax, %eax
	andl	$6, %eax
	movb	%al, -29(%ebp)
	.loc 1 145 0 discriminator 3
	movl	16(%ebp), %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-9(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movzbl	%al, %edx
	movzbl	-29(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	12(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movl	12(%ebp), %ecx
	movl	-28(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %ecx
	movl	%ebx, %edx
	orl	%ecx, %edx
	movb	%dl, (%eax)
	.loc 1 146 0 discriminator 3
	movl	16(%ebp), %eax
	addl	$1, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-9(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ComputeEncBit
	movzbl	%al, %edx
	movzbl	-29(%ebp), %eax
	movl	$6, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	12(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movl	12(%ebp), %ecx
	movl	-28(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %ecx
	movl	%ebx, %edx
	orl	%ecx, %edx
	movb	%dl, (%eax)
	.loc 1 138 0 discriminator 3
	addl	$1, -16(%ebp)
L25:
	.loc 1 138 0 is_stmt 0 discriminator 1
	cmpl	$799, -16(%ebp)
	jbe	L26
	.loc 1 149 0 is_stmt 1
	movl	$0, -16(%ebp)
	jmp	L27
L30:
	.loc 1 150 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 151 0
	movl	-16(%ebp), %eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 152 0
	movl	12(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-29(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movzbl	-21(%ebp), %eax
	andl	%edx, %eax
	movb	%al, -30(%ebp)
	.loc 1 153 0
	movl	-16(%ebp), %eax
	andl	$3, %eax
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L28
	.loc 1 154 0
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 155 0
	movl	-20(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 156 0
	addl	$1, -20(%ebp)
	.loc 1 157 0
	cmpb	$0, -30(%ebp)
	jne	L29
	.loc 1 158 0
	movl	12(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %ecx
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
	jmp	L28
L29:
	.loc 1 160 0
	movl	12(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %ecx
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
L28:
	.loc 1 149 0 discriminator 2
	addl	$1, -16(%ebp)
L27:
	.loc 1 149 0 is_stmt 0 discriminator 1
	cmpl	$1599, -16(%ebp)
	jbe	L30
	.loc 1 165 0 is_stmt 1
	nop
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
LFE21:
	.globl	_HardConvDecoder
	.def	_HardConvDecoder;	.scl	2;	.type	32;	.endef
_HardConvDecoder:
LFB22:
	.loc 1 176 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	movl	$83008, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 180 0
	movb	$1, -24(%ebp)
	.loc 1 181 0
	leal	-41520(%ebp), %eax
	movl	$41472, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 182 0
	movl	$1, -41520(%ebp)
	.loc 1 187 0
	movl	20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_HardDepuncturing
	.loc 1 189 0
	movl	$2, -12(%ebp)
	jmp	L32
L64:
	.loc 1 190 0
	movl	-12(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -28(%ebp)
	.loc 1 191 0
	movl	-28(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 192 0
	movl	-28(%ebp), %eax
	andl	$7, %eax
	movb	%al, -33(%ebp)
	.loc 1 193 0
	movl	8(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-33(%ebp), %eax
	movl	$6, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$3, %eax
	movb	%al, -34(%ebp)
	.loc 1 194 0
	leal	-82992(%ebp), %eax
	leal	-41520(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 196 0
	movb	$0, -35(%ebp)
	.loc 1 197 0
	movl	-28(%ebp), %eax
	andl	$3, %eax
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movzbl	-35(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -35(%ebp)
	.loc 1 198 0
	movl	-28(%ebp), %eax
	addl	$1, %eax
	andl	$3, %eax
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	orb	%al, -35(%ebp)
	.loc 1 200 0
	movb	$0, -21(%ebp)
	jmp	L33
L47:
	.loc 1 201 0
	movzbl	-21(%ebp), %eax
	movl	-82992(%ebp,%eax,4), %eax
	movl	-12(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L34
	.loc 1 202 0
	movb	$0, -22(%ebp)
	jmp	L35
L46:
	.loc 1 203 0
	movzbl	-21(%ebp), %eax
	movzbl	-22(%ebp), %edx
	movl	16(%ebp), %ecx
	sall	$2, %eax
	addl	%ecx, %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	xorb	-34(%ebp), %al
	andb	-35(%ebp), %al
	movzbl	%al, %eax
	movl	%eax, (%esp)
	call	_CountByteOnes
	movb	%al, -36(%ebp)
	.loc 1 204 0
	movzbl	-21(%ebp), %ecx
	movzbl	-22(%ebp), %eax
	movl	16(%ebp), %edx
	sall	$2, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	addl	$2, %eax
	movzbl	(%eax), %eax
	movb	%al, -37(%ebp)
	.loc 1 205 0
	movzbl	-37(%ebp), %eax
	movl	-41520(%ebp,%eax,4), %eax
	cmpl	-12(%ebp), %eax
	jnb	L36
	.loc 1 206 0
	movzbl	-37(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, -41520(%ebp,%eax,4)
	.loc 1 207 0
	movzbl	-37(%ebp), %eax
	movzbl	-21(%ebp), %edx
	addl	$64, %edx
	movl	-82992(%ebp,%edx,4), %ecx
	movzbl	-36(%ebp), %edx
	addl	%ecx, %edx
	addl	$64, %eax
	movl	%edx, -41520(%ebp,%eax,4)
	.loc 1 208 0
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L37
	.loc 1 209 0
	movl	-12(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -20(%ebp)
	jmp	L38
L37:
	.loc 1 211 0
	movl	$639, -20(%ebp)
L38:
	.loc 1 213 0
	movl	$0, -16(%ebp)
	jmp	L39
L40:
	.loc 1 214 0 discriminator 3
	movzbl	-37(%ebp), %edx
	movzbl	-21(%ebp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %ecx
	movl	-16(%ebp), %eax
	addl	%ecx, %eax
	subl	$82472, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	subl	$41000, %eax
	movb	%cl, (%eax)
	.loc 1 213 0 discriminator 3
	addl	$1, -16(%ebp)
L39:
	.loc 1 213 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L40
	.loc 1 216 0 is_stmt 1
	movzbl	-37(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	leal	-41000(%eax), %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L41
L36:
	.loc 1 218 0
	movzbl	-21(%ebp), %eax
	addl	$64, %eax
	movl	-82992(%ebp,%eax,4), %edx
	movzbl	-36(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -44(%ebp)
	.loc 1 219 0
	movzbl	-37(%ebp), %eax
	addl	$64, %eax
	movl	-41520(%ebp,%eax,4), %eax
	cmpl	-44(%ebp), %eax
	jbe	L41
	.loc 1 220 0
	movzbl	-37(%ebp), %eax
	leal	64(%eax), %edx
	movl	-44(%ebp), %eax
	movl	%eax, -41520(%ebp,%edx,4)
	.loc 1 221 0
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L42
	.loc 1 222 0
	movl	-12(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -20(%ebp)
	jmp	L43
L42:
	.loc 1 224 0
	movl	$639, -20(%ebp)
L43:
	.loc 1 226 0
	movl	$0, -16(%ebp)
	jmp	L44
L45:
	.loc 1 227 0 discriminator 3
	movzbl	-37(%ebp), %edx
	movzbl	-21(%ebp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %ecx
	movl	-16(%ebp), %eax
	addl	%ecx, %eax
	subl	$82472, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	subl	$41000, %eax
	movb	%cl, (%eax)
	.loc 1 226 0 discriminator 3
	addl	$1, -16(%ebp)
L44:
	.loc 1 226 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L45
	.loc 1 229 0 is_stmt 1
	movzbl	-37(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	leal	-41000(%eax), %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
L41:
	.loc 1 202 0 discriminator 2
	movzbl	-22(%ebp), %eax
	addl	$1, %eax
	movb	%al, -22(%ebp)
L35:
	.loc 1 202 0 is_stmt 0 discriminator 1
	cmpb	$1, -22(%ebp)
	jbe	L46
L34:
	.loc 1 200 0 is_stmt 1 discriminator 2
	movzbl	-21(%ebp), %eax
	addl	$1, %eax
	movb	%al, -21(%ebp)
L33:
	.loc 1 200 0 is_stmt 0 discriminator 1
	cmpb	$63, -21(%ebp)
	jbe	L47
	.loc 1 235 0 is_stmt 1
	cmpl	$801, -12(%ebp)
	jne	L48
	.loc 1 236 0
	leal	-41520(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinIndexHard
	movb	%al, -45(%ebp)
	.loc 1 237 0
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L49
	.loc 1 238 0
	movl	$640, -20(%ebp)
	jmp	L50
L49:
	.loc 1 240 0
	movl	-12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -20(%ebp)
L50:
	.loc 1 242 0
	movl	$0, -16(%ebp)
	jmp	L51
L56:
	.loc 1 243 0
	movzbl	-45(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	subl	$41000, %eax
	movzbl	(%eax), %eax
	movb	%al, -46(%ebp)
	.loc 1 244 0
	movl	-20(%ebp), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jne	L52
	.loc 1 245 0
	movzbl	-45(%ebp), %eax
	movb	%al, -23(%ebp)
	jmp	L53
L52:
	.loc 1 247 0
	movzbl	-45(%ebp), %edx
	movl	-16(%ebp), %eax
	leal	1(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %ebx
	addl	%ebx, %eax
	addl	%ecx, %eax
	subl	$41000, %eax
	movzbl	(%eax), %eax
	movb	%al, -23(%ebp)
L53:
	.loc 1 249 0
	movl	-16(%ebp), %eax
	subl	-20(%ebp), %eax
	addl	$800, %eax
	shrl	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 250 0
	movl	-16(%ebp), %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	andl	$7, %eax
	movb	%al, -33(%ebp)
	.loc 1 251 0
	movzbl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	2(%eax,%edx,4), %eax
	cmpb	-23(%ebp), %al
	jne	L54
	.loc 1 252 0
	movl	12(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	12(%ebp), %ecx
	movl	-32(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %esi
	movzbl	-24(%ebp), %ebx
	movzbl	-33(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, %ecx
	sall	%cl, %ebx
	movl	%ebx, %edx
	notl	%edx
	andl	%esi, %edx
	movb	%dl, (%eax)
	jmp	L55
L54:
	.loc 1 254 0
	movl	12(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	12(%ebp), %ecx
	movl	-32(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %esi
	movzbl	-24(%ebp), %ebx
	movzbl	-33(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, %ecx
	sall	%cl, %ebx
	movl	%ebx, %edx
	orl	%esi, %edx
	movb	%dl, (%eax)
L55:
	.loc 1 242 0 discriminator 2
	addl	$1, -16(%ebp)
L51:
	.loc 1 242 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L56
	jmp	L57
L48:
	.loc 1 257 0 is_stmt 1
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L57
	.loc 1 258 0
	leal	-41520(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinIndexHard
	movb	%al, -45(%ebp)
	.loc 1 259 0
	movzbl	-45(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	addl	%esi, %eax
	subl	$41000, %eax
	movzbl	(%eax), %eax
	movb	%al, -46(%ebp)
	.loc 1 260 0
	movzbl	-45(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %ebx
	addl	%ebx, %eax
	subl	$40999, %eax
	movzbl	(%eax), %eax
	movb	%al, -23(%ebp)
	.loc 1 261 0
	movl	-12(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 262 0
	movl	-12(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -33(%ebp)
	.loc 1 263 0
	movzbl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	2(%eax,%edx,4), %eax
	cmpb	-23(%ebp), %al
	jne	L58
	.loc 1 264 0
	movl	12(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	12(%ebp), %ecx
	movl	-32(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %esi
	movzbl	-24(%ebp), %ebx
	movzbl	-33(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, %ecx
	sall	%cl, %ebx
	movl	%ebx, %edx
	notl	%edx
	andl	%esi, %edx
	movb	%dl, (%eax)
	jmp	L59
L58:
	.loc 1 266 0
	movl	12(%ebp), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	movl	12(%ebp), %ecx
	movl	-32(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %esi
	movzbl	-24(%ebp), %ebx
	movzbl	-33(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, %ecx
	sall	%cl, %ebx
	movl	%ebx, %edx
	orl	%esi, %edx
	movb	%dl, (%eax)
L59:
	.loc 1 268 0
	movb	$0, -21(%ebp)
	jmp	L60
L63:
	.loc 1 269 0
	movl	$0, -16(%ebp)
	jmp	L61
L62:
	.loc 1 270 0 discriminator 3
	movzbl	-21(%ebp), %edx
	movzbl	-21(%ebp), %ecx
	movl	-16(%ebp), %eax
	leal	1(%eax), %ebx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	addl	%esi, %eax
	addl	%ebx, %eax
	subl	$41000, %eax
	movzbl	(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %ebx
	leal	(%ebx,%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	subl	$41000, %eax
	movb	%cl, (%eax)
	.loc 1 269 0 discriminator 3
	addl	$1, -16(%ebp)
L61:
	.loc 1 269 0 is_stmt 0 discriminator 1
	cmpl	$638, -16(%ebp)
	jbe	L62
	.loc 1 268 0 is_stmt 1 discriminator 2
	movzbl	-21(%ebp), %eax
	addl	$1, %eax
	movb	%al, -21(%ebp)
L60:
	.loc 1 268 0 is_stmt 0 discriminator 1
	cmpb	$63, -21(%ebp)
	jbe	L63
L57:
	.loc 1 189 0 is_stmt 1 discriminator 2
	addl	$1, -12(%ebp)
L32:
	.loc 1 189 0 is_stmt 0 discriminator 1
	cmpl	$801, -12(%ebp)
	jbe	L64
	.loc 1 275 0 is_stmt 1
	nop
	addl	$83008, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_CountByteOnes;	.scl	3;	.type	32;	.endef
_CountByteOnes:
LFB23:
	.loc 1 283 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	.loc 1 285 0
	movb	$0, -2(%ebp)
	.loc 1 286 0
	movb	$1, -3(%ebp)
	.loc 1 287 0
	movb	$0, -1(%ebp)
	jmp	L66
L68:
	.loc 1 288 0
	movzbl	-20(%ebp), %edx
	movzbl	-1(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movzbl	-3(%ebp), %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	L67
	.loc 1 289 0
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L67:
	.loc 1 287 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L66:
	.loc 1 287 0 is_stmt 0 discriminator 1
	cmpb	$7, -1(%ebp)
	jbe	L68
	.loc 1 292 0 is_stmt 1
	movzbl	-2(%ebp), %eax
	.loc 1 293 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	_FindMinIndexHard;	.scl	3;	.type	32;	.endef
_FindMinIndexHard:
LFB24:
	.loc 1 301 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 304 0
	cmpl	$0, 8(%ebp)
	je	L71
	.loc 1 305 0
	movl	8(%ebp), %eax
	movl	256(%eax), %eax
	movl	%eax, -8(%ebp)
	.loc 1 306 0
	movb	$0, -2(%ebp)
	.loc 1 307 0
	movb	$1, -1(%ebp)
	jmp	L72
L74:
	.loc 1 308 0
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L73
	.loc 1 308 0 is_stmt 0 discriminator 1
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	cmpl	-8(%ebp), %eax
	jnb	L73
	.loc 1 309 0 is_stmt 1
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, -8(%ebp)
	.loc 1 310 0
	movzbl	-1(%ebp), %eax
	movb	%al, -2(%ebp)
L73:
	.loc 1 307 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L72:
	.loc 1 307 0 is_stmt 0 discriminator 1
	cmpb	$63, -1(%ebp)
	jbe	L74
L71:
	.loc 1 314 0 is_stmt 1
	movzbl	-2(%ebp), %eax
	.loc 1 315 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.def	_HardDepuncturing;	.scl	3;	.type	32;	.endef
_HardDepuncturing:
LFB25:
	.loc 1 324 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 325 0
	movb	$1, -22(%ebp)
	.loc 1 326 0
	movb	$3, -9(%ebp)
	.loc 1 327 0
	movl	$1199, -16(%ebp)
	.loc 1 330 0
	movl	$1600, -20(%ebp)
	jmp	L77
L84:
	.loc 1 331 0
	movzbl	-9(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L78
	.loc 1 332 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 333 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 334 0
	movl	8(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-22(%ebp), %edx
	movzbl	-29(%ebp), %eax
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	andl	%ebx, %eax
	movb	%al, -21(%ebp)
	.loc 1 335 0
	subl	$1, -16(%ebp)
	jmp	L79
L78:
	.loc 1 337 0
	movb	$0, -21(%ebp)
L79:
	.loc 1 339 0
	cmpb	$0, -9(%ebp)
	je	L80
	.loc 1 340 0
	movzbl	-9(%ebp), %eax
	subl	$1, %eax
	movb	%al, -9(%ebp)
	jmp	L81
L80:
	.loc 1 342 0
	movb	$3, -9(%ebp)
L81:
	.loc 1 344 0
	movl	-20(%ebp), %eax
	subl	$1, %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 345 0
	movl	-20(%ebp), %eax
	negl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 346 0
	cmpb	$0, -21(%ebp)
	jne	L82
	.loc 1 347 0
	movl	8(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-22(%ebp), %ebx
	movzbl	-29(%ebp), %eax
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	notl	%eax
	andl	%esi, %eax
	movb	%al, (%edx)
	jmp	L83
L82:
	.loc 1 349 0
	movl	8(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-22(%ebp), %ebx
	movzbl	-29(%ebp), %eax
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
L83:
	.loc 1 330 0 discriminator 2
	subl	$1, -20(%ebp)
L77:
	.loc 1 330 0 is_stmt 0 discriminator 1
	cmpl	$0, -20(%ebp)
	jne	L84
	.loc 1 352 0 is_stmt 1
	nop
	addl	$32, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_SoftConvDecoder
	.def	_SoftConvDecoder;	.scl	2;	.type	32;	.endef
_SoftConvDecoder:
LFB26:
	.loc 1 363 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	movl	$83024, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 368 0
	movb	$1, -24(%ebp)
	.loc 1 369 0
	leal	-41528(%ebp), %eax
	movl	$41472, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 370 0
	movl	$1, -41528(%ebp)
	.loc 1 375 0
	movl	20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_SoftDepuncturing
	.loc 1 377 0
	movl	$2, -12(%ebp)
	jmp	L86
L119:
	.loc 1 378 0
	movl	-12(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -28(%ebp)
	.loc 1 379 0
	leal	-83000(%ebp), %eax
	leal	-41528(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 381 0
	movb	$0, -29(%ebp)
	.loc 1 382 0
	movl	-28(%ebp), %eax
	andl	$3, %eax
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movzbl	-29(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -29(%ebp)
	.loc 1 383 0
	movl	-28(%ebp), %eax
	addl	$1, %eax
	andl	$3, %eax
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	orb	%al, -29(%ebp)
	.loc 1 385 0
	movb	$0, -21(%ebp)
	jmp	L87
L102:
	.loc 1 386 0
	movzbl	-21(%ebp), %eax
	movl	-83000(%ebp,%eax,4), %eax
	movl	-12(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L88
	.loc 1 387 0
	movb	$0, -22(%ebp)
	jmp	L89
L101:
	.loc 1 388 0
	movzbl	-29(%ebp), %edx
	movzbl	-21(%ebp), %eax
	movzbl	-22(%ebp), %ecx
	movl	16(%ebp), %ebx
	sall	$2, %eax
	addl	%ebx, %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	-28(%ebp), %ecx
	leal	0(,%ecx,4), %ebx
	movl	8(%ebp), %ecx
	addl	%ebx, %ecx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_GetEuclideanDist
	fstps	-83004(%ebp)
	movl	-83004(%ebp), %eax
	movl	%eax, -36(%ebp)
	.loc 1 389 0
	movzbl	-21(%ebp), %ecx
	movzbl	-22(%ebp), %eax
	movl	16(%ebp), %edx
	sall	$2, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	addl	$2, %eax
	movzbl	(%eax), %eax
	movb	%al, -37(%ebp)
	.loc 1 390 0
	movzbl	-37(%ebp), %eax
	movl	-41528(%ebp,%eax,4), %eax
	cmpl	-12(%ebp), %eax
	jnb	L90
	.loc 1 391 0
	movzbl	-37(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, -41528(%ebp,%eax,4)
	.loc 1 392 0
	movzbl	-37(%ebp), %eax
	movzbl	-21(%ebp), %edx
	addl	$64, %edx
	flds	-83000(%ebp,%edx,4)
	fadds	-36(%ebp)
	addl	$64, %eax
	fstps	-41528(%ebp,%eax,4)
	.loc 1 393 0
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L91
	.loc 1 394 0
	movl	-12(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -20(%ebp)
	jmp	L92
L91:
	.loc 1 396 0
	movl	$639, -20(%ebp)
L92:
	.loc 1 398 0
	movl	$0, -16(%ebp)
	jmp	L93
L94:
	.loc 1 399 0 discriminator 3
	movzbl	-37(%ebp), %edx
	movzbl	-21(%ebp), %ecx
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
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	subl	$41008, %eax
	movb	%cl, (%eax)
	.loc 1 398 0 discriminator 3
	addl	$1, -16(%ebp)
L93:
	.loc 1 398 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L94
	.loc 1 401 0 is_stmt 1
	movzbl	-37(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	leal	-41008(%eax), %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
	jmp	L95
L90:
	.loc 1 403 0
	movzbl	-21(%ebp), %eax
	addl	$64, %eax
	flds	-83000(%ebp,%eax,4)
	fadds	-36(%ebp)
	fstps	-44(%ebp)
	.loc 1 404 0
	movzbl	-37(%ebp), %eax
	addl	$64, %eax
	flds	-41528(%ebp,%eax,4)
	flds	-44(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L95
	.loc 1 405 0
	movzbl	-37(%ebp), %eax
	addl	$64, %eax
	flds	-44(%ebp)
	fstps	-41528(%ebp,%eax,4)
	.loc 1 406 0
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L97
	.loc 1 407 0
	movl	-12(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -20(%ebp)
	jmp	L98
L97:
	.loc 1 409 0
	movl	$639, -20(%ebp)
L98:
	.loc 1 411 0
	movl	$0, -16(%ebp)
	jmp	L99
L100:
	.loc 1 412 0 discriminator 3
	movzbl	-37(%ebp), %edx
	movzbl	-21(%ebp), %ecx
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
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	subl	$41008, %eax
	movb	%cl, (%eax)
	.loc 1 411 0 discriminator 3
	addl	$1, -16(%ebp)
L99:
	.loc 1 411 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L100
	.loc 1 414 0 is_stmt 1
	movzbl	-37(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	leal	(%esi,%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	leal	-41008(%eax), %edx
	movzbl	-21(%ebp), %eax
	movb	%al, (%edx)
L95:
	.loc 1 387 0 discriminator 2
	movzbl	-22(%ebp), %eax
	addl	$1, %eax
	movb	%al, -22(%ebp)
L89:
	.loc 1 387 0 is_stmt 0 discriminator 1
	cmpb	$1, -22(%ebp)
	jbe	L101
L88:
	.loc 1 385 0 is_stmt 1 discriminator 2
	movzbl	-21(%ebp), %eax
	addl	$1, %eax
	movb	%al, -21(%ebp)
L87:
	.loc 1 385 0 is_stmt 0 discriminator 1
	cmpb	$63, -21(%ebp)
	jbe	L102
	.loc 1 420 0 is_stmt 1
	cmpl	$801, -12(%ebp)
	jne	L103
	.loc 1 421 0
	leal	-41528(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinIndexSoft
	movb	%al, -45(%ebp)
	.loc 1 422 0
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L104
	.loc 1 423 0
	movl	$640, -20(%ebp)
	jmp	L105
L104:
	.loc 1 425 0
	movl	-12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -20(%ebp)
L105:
	.loc 1 427 0
	movl	$0, -16(%ebp)
	jmp	L106
L111:
	.loc 1 428 0
	movzbl	-45(%ebp), %edx
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
	movb	%al, -46(%ebp)
	.loc 1 429 0
	movl	-20(%ebp), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jne	L107
	.loc 1 430 0
	movzbl	-45(%ebp), %eax
	movb	%al, -23(%ebp)
	jmp	L108
L107:
	.loc 1 432 0
	movzbl	-45(%ebp), %edx
	movl	-16(%ebp), %eax
	leal	1(%eax), %ecx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	addl	%esi, %eax
	addl	%ecx, %eax
	subl	$41008, %eax
	movzbl	(%eax), %eax
	movb	%al, -23(%ebp)
L108:
	.loc 1 434 0
	movl	-16(%ebp), %eax
	subl	-20(%ebp), %eax
	addl	$800, %eax
	shrl	$3, %eax
	movl	%eax, -52(%ebp)
	.loc 1 435 0
	movl	-16(%ebp), %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	andl	$7, %eax
	movb	%al, -53(%ebp)
	.loc 1 436 0
	movzbl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	2(%eax,%edx,4), %eax
	cmpb	-23(%ebp), %al
	jne	L109
	.loc 1 437 0
	movl	12(%ebp), %edx
	movl	-52(%ebp), %eax
	addl	%edx, %eax
	movl	12(%ebp), %ecx
	movl	-52(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %esi
	movzbl	-24(%ebp), %ebx
	movzbl	-53(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, %ecx
	sall	%cl, %ebx
	movl	%ebx, %edx
	notl	%edx
	andl	%esi, %edx
	movb	%dl, (%eax)
	jmp	L110
L109:
	.loc 1 439 0
	movl	12(%ebp), %edx
	movl	-52(%ebp), %eax
	addl	%edx, %eax
	movl	12(%ebp), %ecx
	movl	-52(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %esi
	movzbl	-24(%ebp), %ebx
	movzbl	-53(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, %ecx
	sall	%cl, %ebx
	movl	%ebx, %edx
	orl	%esi, %edx
	movb	%dl, (%eax)
L110:
	.loc 1 427 0 discriminator 2
	addl	$1, -16(%ebp)
L106:
	.loc 1 427 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L111
	jmp	L112
L103:
	.loc 1 442 0 is_stmt 1
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L112
	.loc 1 443 0
	leal	-41528(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinIndexSoft
	movb	%al, -45(%ebp)
	.loc 1 444 0
	movzbl	-45(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %esi
	addl	%esi, %eax
	subl	$41008, %eax
	movzbl	(%eax), %eax
	movb	%al, -46(%ebp)
	.loc 1 445 0
	movzbl	-45(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$7, %eax
	leal	-8(%ebp), %ebx
	addl	%ebx, %eax
	subl	$41007, %eax
	movzbl	(%eax), %eax
	movb	%al, -23(%ebp)
	.loc 1 446 0
	movl	-12(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -52(%ebp)
	.loc 1 447 0
	movl	-12(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -53(%ebp)
	.loc 1 448 0
	movzbl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	2(%eax,%edx,4), %eax
	cmpb	-23(%ebp), %al
	jne	L113
	.loc 1 449 0
	movl	12(%ebp), %edx
	movl	-52(%ebp), %eax
	addl	%edx, %eax
	movl	12(%ebp), %ecx
	movl	-52(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %esi
	movzbl	-24(%ebp), %ebx
	movzbl	-53(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, %ecx
	sall	%cl, %ebx
	movl	%ebx, %edx
	notl	%edx
	andl	%esi, %edx
	movb	%dl, (%eax)
	jmp	L114
L113:
	.loc 1 451 0
	movl	12(%ebp), %edx
	movl	-52(%ebp), %eax
	addl	%edx, %eax
	movl	12(%ebp), %ecx
	movl	-52(%ebp), %edx
	addl	%ecx, %edx
	movzbl	(%edx), %edx
	movl	%edx, %esi
	movzbl	-24(%ebp), %ebx
	movzbl	-53(%ebp), %edx
	movl	$7, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, %ecx
	sall	%cl, %ebx
	movl	%ebx, %edx
	orl	%esi, %edx
	movb	%dl, (%eax)
L114:
	.loc 1 453 0
	movb	$0, -21(%ebp)
	jmp	L115
L118:
	.loc 1 454 0
	movl	$0, -16(%ebp)
	jmp	L116
L117:
	.loc 1 455 0 discriminator 3
	movzbl	-21(%ebp), %edx
	movzbl	-21(%ebp), %ecx
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
	.loc 1 454 0 discriminator 3
	addl	$1, -16(%ebp)
L116:
	.loc 1 454 0 is_stmt 0 discriminator 1
	cmpl	$638, -16(%ebp)
	jbe	L117
	.loc 1 453 0 is_stmt 1 discriminator 2
	movzbl	-21(%ebp), %eax
	addl	$1, %eax
	movb	%al, -21(%ebp)
L115:
	.loc 1 453 0 is_stmt 0 discriminator 1
	cmpb	$63, -21(%ebp)
	jbe	L118
L112:
	.loc 1 377 0 is_stmt 1 discriminator 2
	addl	$1, -12(%ebp)
L86:
	.loc 1 377 0 is_stmt 0 discriminator 1
	cmpl	$801, -12(%ebp)
	jbe	L119
	.loc 1 460 0 is_stmt 1
	nop
	addl	$83024, %esp
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
	.def	_GetEuclideanDist;	.scl	3;	.type	32;	.endef
_GetEuclideanDist:
LFB27:
	.loc 1 470 0
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
	.loc 1 472 0
	movb	$1, -9(%ebp)
	.loc 1 473 0
	fldz
	fstps	-8(%ebp)
	.loc 1 474 0
	movb	$0, -1(%ebp)
	jmp	L122
L124:
	.loc 1 475 0
	movzbl	-24(%ebp), %edx
	movzbl	-1(%ebp), %eax
	movl	$1, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movzbl	-9(%ebp), %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	L123
	.loc 1 476 0
	movzbl	-20(%ebp), %edx
	movzbl	-1(%ebp), %eax
	movl	$1, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movzbl	-9(%ebp), %eax
	andl	%edx, %eax
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
L123:
	.loc 1 474 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L122:
	.loc 1 474 0 is_stmt 0 discriminator 1
	cmpb	$1, -1(%ebp)
	jbe	L124
	.loc 1 479 0 is_stmt 1
	flds	-8(%ebp)
	.loc 1 480 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.def	_FindMinIndexSoft;	.scl	3;	.type	32;	.endef
_FindMinIndexSoft:
LFB28:
	.loc 1 488 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 491 0
	cmpl	$0, 8(%ebp)
	je	L127
	.loc 1 492 0
	movl	8(%ebp), %eax
	flds	256(%eax)
	fstps	-8(%ebp)
	.loc 1 493 0
	movb	$0, -2(%ebp)
	.loc 1 494 0
	movb	$1, -1(%ebp)
	jmp	L128
L131:
	.loc 1 495 0
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L129
	.loc 1 495 0 is_stmt 0 discriminator 1
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	flds	(%eax,%edx,4)
	flds	-8(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L129
	.loc 1 496 0 is_stmt 1
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	flds	(%eax,%edx,4)
	fstps	-8(%ebp)
	.loc 1 497 0
	movzbl	-1(%ebp), %eax
	movb	%al, -2(%ebp)
L129:
	.loc 1 494 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L128:
	.loc 1 494 0 is_stmt 0 discriminator 1
	cmpb	$63, -1(%ebp)
	jbe	L131
L127:
	.loc 1 501 0 is_stmt 1
	movzbl	-2(%ebp), %eax
	.loc 1 502 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.def	_SoftDepuncturing;	.scl	3;	.type	32;	.endef
_SoftDepuncturing:
LFB29:
	.loc 1 511 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 513 0
	movb	$3, -5(%ebp)
	.loc 1 514 0
	movl	$1199, -12(%ebp)
	.loc 1 515 0
	movl	$1600, -4(%ebp)
	jmp	L135
L140:
	.loc 1 516 0
	movzbl	-5(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L136
	.loc 1 517 0
	movl	-4(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-12(%ebp), %edx
	leal	0(,%edx,4), %ecx
	movl	8(%ebp), %edx
	addl	%ecx, %edx
	flds	(%edx)
	fstps	(%eax)
	.loc 1 518 0
	subl	$1, -12(%ebp)
	jmp	L137
L136:
	.loc 1 520 0
	movl	-4(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	fldz
	fstps	(%eax)
L137:
	.loc 1 522 0
	cmpb	$0, -5(%ebp)
	je	L138
	.loc 1 523 0
	movzbl	-5(%ebp), %eax
	subl	$1, %eax
	movb	%al, -5(%ebp)
	jmp	L139
L138:
	.loc 1 525 0
	movb	$3, -5(%ebp)
L139:
	.loc 1 515 0 discriminator 2
	subl	$1, -4(%ebp)
L135:
	.loc 1 515 0 is_stmt 0 discriminator 1
	cmpl	$0, -4(%ebp)
	jne	L140
	.loc 1 528 0 is_stmt 1
	nop
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
	.file 6 "../setting.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xccd
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "..\\convolutional.c\0"
	.ascii "H:\\SCIENCE\\4-INF\\binutils\\make_v2\0"
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
	.long	0x157
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x157
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xc1
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x157
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xc1
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xc1
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xc1
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xc1
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x157
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xc8
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xd0
	.uleb128 0x7
	.long	0x15d
	.long	0x174
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x169
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x19e
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
	.long	0x8e
	.uleb128 0x6
	.ascii "uint32_t\0"
	.byte	0x3
	.byte	0x3f
	.long	0x7e
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xc1
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x210
	.uleb128 0x5
	.byte	0x4
	.long	0x157
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xc1
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xc1
	.uleb128 0x7
	.long	0x157
	.long	0x246
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x23b
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x4
	.byte	0xfa
	.long	0x7e
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x7e
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x7e
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x7e
	.uleb128 0xa
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xc1
	.uleb128 0xa
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xc1
	.uleb128 0xa
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0xa4
	.uleb128 0x7
	.long	0x157
	.long	0x2dc
	.uleb128 0xb
	.long	0x2dc
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "sizetype\0"
	.uleb128 0xa
	.ascii "_tzname\0"
	.byte	0x5
	.word	0x15e
	.long	0x2cc
	.uleb128 0xa
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xc1
	.uleb128 0xa
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0xa4
	.uleb128 0xa
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2cc
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x2
	.byte	0xc
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x3
	.ascii "TD1\0"
	.byte	0x4
	.byte	0x6
	.byte	0x4f
	.long	0x371
	.uleb128 0x4
	.ascii "OutBits\0"
	.byte	0x6
	.byte	0x50
	.long	0x371
	.byte	0
	.uleb128 0x4
	.ascii "NextState\0"
	.byte	0x6
	.byte	0x51
	.long	0x371
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x18f
	.long	0x381
	.uleb128 0xb
	.long	0x2dc
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.ascii "info\0"
	.byte	0x6
	.byte	0x52
	.long	0x342
	.uleb128 0xc
	.ascii "TD2\0"
	.word	0x100
	.byte	0x6
	.byte	0x54
	.long	0x3aa
	.uleb128 0x4
	.ascii "States\0"
	.byte	0x6
	.byte	0x55
	.long	0x3aa
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x381
	.long	0x3ba
	.uleb128 0xb
	.long	0x2dc
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.ascii "trellis\0"
	.byte	0x6
	.byte	0x56
	.long	0x38d
	.uleb128 0xc
	.ascii "TD3\0"
	.word	0xa200
	.byte	0x6
	.byte	0x58
	.long	0x400
	.uleb128 0x4
	.ascii "Iter\0"
	.byte	0x6
	.byte	0x59
	.long	0x400
	.byte	0
	.uleb128 0xd
	.ascii "Dist\0"
	.byte	0x6
	.byte	0x5a
	.long	0x400
	.word	0x100
	.uleb128 0xd
	.ascii "Path\0"
	.byte	0x6
	.byte	0x5b
	.long	0x410
	.word	0x200
	.byte	0
	.uleb128 0x7
	.long	0x1cc
	.long	0x410
	.uleb128 0xb
	.long	0x2dc
	.byte	0x3f
	.byte	0
	.uleb128 0x7
	.long	0x18f
	.long	0x427
	.uleb128 0xb
	.long	0x2dc
	.byte	0x3f
	.uleb128 0xe
	.long	0x2dc
	.word	0x27f
	.byte	0
	.uleb128 0x6
	.ascii "vitdech\0"
	.byte	0x6
	.byte	0x5c
	.long	0x3c9
	.uleb128 0xc
	.ascii "TD4\0"
	.word	0xa200
	.byte	0x6
	.byte	0x5e
	.long	0x46d
	.uleb128 0x4
	.ascii "Iter\0"
	.byte	0x6
	.byte	0x5f
	.long	0x400
	.byte	0
	.uleb128 0xd
	.ascii "Dist\0"
	.byte	0x6
	.byte	0x60
	.long	0x46d
	.word	0x100
	.uleb128 0xd
	.ascii "Path\0"
	.byte	0x6
	.byte	0x61
	.long	0x410
	.word	0x200
	.byte	0
	.uleb128 0x7
	.long	0x47d
	.long	0x47d
	.uleb128 0xb
	.long	0x2dc
	.byte	0x3f
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x6
	.ascii "vitdecs\0"
	.byte	0x6
	.byte	0x62
	.long	0x436
	.uleb128 0xf
	.ascii "SoftDepuncturing\0"
	.byte	0x1
	.word	0x1ff
	.long	LFB29
	.long	LFE29-LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x507
	.uleb128 0x10
	.ascii "InLLRs\0"
	.byte	0x1
	.word	0x1ff
	.long	0x507
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.secrel32	LASF0
	.byte	0x1
	.word	0x1ff
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.ascii "j\0"
	.byte	0x1
	.word	0x200
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.secrel32	LASF1
	.byte	0x1
	.word	0x201
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x12
	.ascii "RdIdx\0"
	.byte	0x1
	.word	0x202
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x47d
	.uleb128 0x5
	.byte	0x4
	.long	0x18f
	.uleb128 0x14
	.ascii "FindMinIndexSoft\0"
	.byte	0x1
	.word	0x1e8
	.long	0x18f
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x57d
	.uleb128 0x10
	.ascii "InPaths\0"
	.byte	0x1
	.word	0x1e8
	.long	0x57d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.ascii "j\0"
	.byte	0x1
	.word	0x1e9
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x13
	.secrel32	LASF2
	.byte	0x1
	.word	0x1e9
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x12
	.ascii "MinDist\0"
	.byte	0x1
	.word	0x1ea
	.long	0x47d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x486
	.uleb128 0x14
	.ascii "GetEuclideanDist\0"
	.byte	0x1
	.word	0x1d6
	.long	0x47d
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x60c
	.uleb128 0x10
	.ascii "CurLLRs\0"
	.byte	0x1
	.word	0x1d6
	.long	0x507
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "TrlByte\0"
	.byte	0x1
	.word	0x1d6
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.secrel32	LASF3
	.byte	0x1
	.word	0x1d6
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.ascii "j\0"
	.byte	0x1
	.word	0x1d7
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x13
	.secrel32	LASF4
	.byte	0x1
	.word	0x1d8
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x12
	.ascii "Dist\0"
	.byte	0x1
	.word	0x1d9
	.long	0x47d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.ascii "SoftConvDecoder\0"
	.byte	0x1
	.word	0x16b
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x792
	.uleb128 0x10
	.ascii "InLLRs\0"
	.byte	0x1
	.word	0x16b
	.long	0x507
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "DecByt\0"
	.byte	0x1
	.word	0x16b
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.secrel32	LASF5
	.byte	0x1
	.word	0x16b
	.long	0x792
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x11
	.secrel32	LASF0
	.byte	0x1
	.word	0x16b
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x12
	.ascii "i\0"
	.byte	0x1
	.word	0x16c
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.secrel32	LASF6
	.byte	0x1
	.word	0x16c
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x12
	.ascii "CurIdx\0"
	.byte	0x1
	.word	0x16c
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.ascii "WrIdx\0"
	.byte	0x1
	.word	0x16c
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.ascii "IdxFin\0"
	.byte	0x1
	.word	0x16c
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.ascii "j\0"
	.byte	0x1
	.word	0x16d
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x13
	.secrel32	LASF7
	.byte	0x1
	.word	0x16d
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -61
	.uleb128 0x13
	.secrel32	LASF3
	.byte	0x1
	.word	0x16d
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x12
	.ascii "HypIdx\0"
	.byte	0x1
	.word	0x16d
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x12
	.ascii "NextSt\0"
	.byte	0x1
	.word	0x16e
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.uleb128 0x13
	.secrel32	LASF8
	.byte	0x1
	.word	0x16e
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -53
	.uleb128 0x13
	.secrel32	LASF9
	.byte	0x1
	.word	0x16e
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -54
	.uleb128 0x13
	.secrel32	LASF10
	.byte	0x1
	.word	0x16e
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -31
	.uleb128 0x12
	.ascii "EuclDist\0"
	.byte	0x1
	.word	0x16f
	.long	0x47d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.secrel32	LASF11
	.byte	0x1
	.word	0x16f
	.long	0x47d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x13
	.secrel32	LASF4
	.byte	0x1
	.word	0x170
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.secrel32	LASF12
	.byte	0x1
	.word	0x171
	.long	0x486
	.uleb128 0x4
	.byte	0x91
	.sleb128 -41536
	.uleb128 0x13
	.secrel32	LASF13
	.byte	0x1
	.word	0x173
	.long	0x486
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83008
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x3ba
	.uleb128 0xf
	.ascii "HardDepuncturing\0"
	.byte	0x1
	.word	0x144
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x847
	.uleb128 0x10
	.ascii "IoByt\0"
	.byte	0x1
	.word	0x144
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.secrel32	LASF0
	.byte	0x1
	.word	0x144
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.secrel32	LASF4
	.byte	0x1
	.word	0x145
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x13
	.secrel32	LASF1
	.byte	0x1
	.word	0x146
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x12
	.ascii "RdIdx\0"
	.byte	0x1
	.word	0x147
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.ascii "j\0"
	.byte	0x1
	.word	0x148
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.secrel32	LASF6
	.byte	0x1
	.word	0x148
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x13
	.secrel32	LASF7
	.byte	0x1
	.word	0x149
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x12
	.ascii "RdBit\0"
	.byte	0x1
	.word	0x149
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.byte	0
	.uleb128 0x14
	.ascii "FindMinIndexHard\0"
	.byte	0x1
	.word	0x12d
	.long	0x18f
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x8b1
	.uleb128 0x10
	.ascii "InPaths\0"
	.byte	0x1
	.word	0x12d
	.long	0x8b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.ascii "j\0"
	.byte	0x1
	.word	0x12e
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x13
	.secrel32	LASF2
	.byte	0x1
	.word	0x12e
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x12
	.ascii "MinDist\0"
	.byte	0x1
	.word	0x12f
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x427
	.uleb128 0x14
	.ascii "CountByteOnes\0"
	.byte	0x1
	.word	0x11b
	.long	0x18f
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x91d
	.uleb128 0x10
	.ascii "InByte\0"
	.byte	0x1
	.word	0x11b
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.ascii "j\0"
	.byte	0x1
	.word	0x11c
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x12
	.ascii "Counter\0"
	.byte	0x1
	.word	0x11d
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x13
	.secrel32	LASF4
	.byte	0x1
	.word	0x11e
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -11
	.byte	0
	.uleb128 0x16
	.ascii "HardConvDecoder\0"
	.byte	0x1
	.byte	0xb0
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xa9e
	.uleb128 0x17
	.ascii "EncByt\0"
	.byte	0x1
	.byte	0xb0
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.ascii "DecByt\0"
	.byte	0x1
	.byte	0xb0
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.secrel32	LASF5
	.byte	0x1
	.byte	0xb0
	.long	0x792
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x18
	.secrel32	LASF0
	.byte	0x1
	.byte	0xb0
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x19
	.ascii "i\0"
	.byte	0x1
	.byte	0xb1
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.secrel32	LASF6
	.byte	0x1
	.byte	0xb1
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.ascii "InIdx\0"
	.byte	0x1
	.byte	0xb1
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.ascii "WrIdx\0"
	.byte	0x1
	.byte	0xb1
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii "IdxFin\0"
	.byte	0x1
	.byte	0xb1
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.secrel32	LASF11
	.byte	0x1
	.byte	0xb1
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x19
	.ascii "j\0"
	.byte	0x1
	.byte	0xb2
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x19
	.ascii "CycleBits\0"
	.byte	0x1
	.byte	0xb2
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -42
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.byte	0xb2
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -41
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0xb2
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -43
	.uleb128 0x19
	.ascii "HypIdx\0"
	.byte	0x1
	.byte	0xb2
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x19
	.ascii "HamDist\0"
	.byte	0x1
	.byte	0xb2
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x19
	.ascii "NextSt\0"
	.byte	0x1
	.byte	0xb3
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.uleb128 0x1a
	.secrel32	LASF8
	.byte	0x1
	.byte	0xb3
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -53
	.uleb128 0x1a
	.secrel32	LASF9
	.byte	0x1
	.byte	0xb3
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -54
	.uleb128 0x1a
	.secrel32	LASF10
	.byte	0x1
	.byte	0xb3
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -31
	.uleb128 0x1a
	.secrel32	LASF4
	.byte	0x1
	.byte	0xb4
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.secrel32	LASF12
	.byte	0x1
	.byte	0xb5
	.long	0x427
	.uleb128 0x4
	.byte	0x91
	.sleb128 -41528
	.uleb128 0x1a
	.secrel32	LASF13
	.byte	0x1
	.byte	0xb7
	.long	0x427
	.uleb128 0x4
	.byte	0x91
	.sleb128 -83000
	.byte	0
	.uleb128 0x16
	.ascii "ConvEncoder\0"
	.byte	0x1
	.byte	0x83
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xb62
	.uleb128 0x17
	.ascii "InByt\0"
	.byte	0x1
	.byte	0x83
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.ascii "OutByt\0"
	.byte	0x1
	.byte	0x83
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.secrel32	LASF14
	.byte	0x1
	.byte	0x83
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x18
	.secrel32	LASF0
	.byte	0x1
	.byte	0x83
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x19
	.ascii "EncState\0"
	.byte	0x1
	.byte	0x84
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1a
	.secrel32	LASF4
	.byte	0x1
	.byte	0x85
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x19
	.ascii "j\0"
	.byte	0x1
	.byte	0x86
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.secrel32	LASF6
	.byte	0x1
	.byte	0x86
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.byte	0x87
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x19
	.ascii "RdBit\0"
	.byte	0x1
	.byte	0x87
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -38
	.uleb128 0x19
	.ascii "WrIdx\0"
	.byte	0x1
	.byte	0x88
	.long	0x1cc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1b
	.ascii "ComputeEncBit\0"
	.byte	0x1
	.byte	0x70
	.long	0x18f
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xbd2
	.uleb128 0x17
	.ascii "State\0"
	.byte	0x1
	.byte	0x70
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.ascii "ConVal\0"
	.byte	0x1
	.byte	0x70
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.ascii "j\0"
	.byte	0x1
	.byte	0x71
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x19
	.ascii "OutBit\0"
	.byte	0x1
	.byte	0x72
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x1a
	.secrel32	LASF4
	.byte	0x1
	.byte	0x73
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -15
	.byte	0
	.uleb128 0x16
	.ascii "GetTrellis\0"
	.byte	0x1
	.byte	0x47
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xc75
	.uleb128 0x18
	.secrel32	LASF14
	.byte	0x1
	.byte	0x47
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.secrel32	LASF5
	.byte	0x1
	.byte	0x47
	.long	0x792
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.ascii "i\0"
	.byte	0x1
	.byte	0x48
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x19
	.ascii "j\0"
	.byte	0x1
	.byte	0x48
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x19
	.ascii "StBin\0"
	.byte	0x1
	.byte	0x49
	.long	0xc75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -86
	.uleb128 0x19
	.ascii "State0\0"
	.byte	0x1
	.byte	0x4a
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.ascii "State1\0"
	.byte	0x1
	.byte	0x4a
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x19
	.ascii "OutBit\0"
	.byte	0x1
	.byte	0x4a
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x1a
	.secrel32	LASF4
	.byte	0x1
	.byte	0x4b
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.byte	0
	.uleb128 0x7
	.long	0x18f
	.long	0xc85
	.uleb128 0xb
	.long	0x2dc
	.byte	0x3f
	.byte	0
	.uleb128 0x1c
	.ascii "GetConvCP\0"
	.byte	0x1
	.byte	0x29
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.secrel32	LASF14
	.byte	0x1
	.byte	0x29
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.ascii "PuncVect\0"
	.byte	0x1
	.byte	0x29
	.long	0x50d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.ascii "PuncLen\0"
	.byte	0x1
	.byte	0x2a
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
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
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x16
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
LASF10:
	.ascii "StateArr\0"
LASF6:
	.ascii "ByteIdx\0"
LASF3:
	.ascii "MaskEras\0"
LASF9:
	.ascii "StateDep\0"
LASF8:
	.ascii "MinDistState\0"
LASF5:
	.ascii "CodeDiagr\0"
LASF7:
	.ascii "BitIdx\0"
LASF12:
	.ascii "CurPaths\0"
LASF2:
	.ascii "MinStateIdx\0"
LASF1:
	.ascii "RdIdxPunc\0"
LASF0:
	.ascii "PunctVect\0"
LASF14:
	.ascii "ConVect\0"
LASF13:
	.ascii "PrevPaths\0"
LASF4:
	.ascii "Mask\0"
LASF11:
	.ascii "CandDist\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_memcpy;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
