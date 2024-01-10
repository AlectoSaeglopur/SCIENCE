	.file	"convolutional.c"
	.text
	.globl	_GetConvCP
	.def	_GetConvCP;	.scl	2;	.type	32;	.endef
_GetConvCP:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movb	$4, -9(%ebp)
	cmpl	$0, 8(%ebp)
	je	L2
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
	cmpl	$0, 12(%ebp)
	je	L4
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
	nop
L4:
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
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$104, %esp
	movb	$1, -11(%ebp)
	movb	$0, -10(%ebp)
	jmp	L6
L7:
	movzbl	-10(%ebp), %eax
	movzbl	-10(%ebp), %edx
	movb	%dl, -78(%ebp,%eax)
	movzbl	-10(%ebp), %eax
	addl	$1, %eax
	movb	%al, -10(%ebp)
L6:
	cmpb	$63, -10(%ebp)
	jbe	L7
	cmpl	$0, 12(%ebp)
	je	L19
	movb	$0, -10(%ebp)
	jmp	L9
L18:
	movzbl	-10(%ebp), %eax
	movzbl	-78(%ebp,%eax), %eax
	movb	%al, -12(%ebp)
	movb	$0, -9(%ebp)
	jmp	L10
L13:
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
	cmpb	$0, -9(%ebp)
	jne	L11
	movzbl	-10(%ebp), %edx
	movzbl	-13(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	12(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
	jmp	L12
L11:
	movzbl	-10(%ebp), %edx
	movzbl	-10(%ebp), %ecx
	movl	12(%ebp), %eax
	movzbl	(%eax,%ecx,4), %ecx
	movzbl	-13(%ebp), %eax
	addl	%eax, %ecx
	movl	12(%ebp), %eax
	movb	%cl, (%eax,%edx,4)
L12:
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L10:
	cmpb	$1, -9(%ebp)
	jbe	L13
	movzbl	-10(%ebp), %edx
	movzbl	-12(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	movb	%cl, 2(%eax,%edx,4)
	movzbl	-11(%ebp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movzbl	-12(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -14(%ebp)
	movb	$0, -9(%ebp)
	jmp	L14
L17:
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
	cmpb	$0, -9(%ebp)
	jne	L15
	movzbl	-10(%ebp), %edx
	movzbl	-13(%ebp), %eax
	leal	(%eax,%eax), %ecx
	movl	12(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
	jmp	L16
L15:
	movzbl	-10(%ebp), %edx
	movzbl	-10(%ebp), %ecx
	movl	12(%ebp), %eax
	movzbl	1(%eax,%ecx,4), %ecx
	movzbl	-13(%ebp), %eax
	addl	%eax, %ecx
	movl	12(%ebp), %eax
	movb	%cl, 1(%eax,%edx,4)
L16:
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L14:
	cmpb	$1, -9(%ebp)
	jbe	L17
	movzbl	-10(%ebp), %edx
	movzbl	-14(%ebp), %eax
	shrb	%al
	movl	%eax, %ecx
	movl	12(%ebp), %eax
	movb	%cl, 3(%eax,%edx,4)
	movzbl	-10(%ebp), %eax
	addl	$1, %eax
	movb	%al, -10(%ebp)
L9:
	cmpb	$63, -10(%ebp)
	jbe	L18
L19:
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
	movb	$0, -6(%ebp)
	movb	$1, -7(%ebp)
	movb	$0, -5(%ebp)
	jmp	L21
L22:
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
	movzbl	-5(%ebp), %eax
	addl	$1, %eax
	movb	%al, -5(%ebp)
L21:
	cmpb	$6, -5(%ebp)
	jbe	L22
	movzbl	-6(%ebp), %eax
	andl	$1, %eax
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
	movb	$0, -9(%ebp)
	movb	$1, -21(%ebp)
	movl	$0, -20(%ebp)
	movl	$200, 8(%esp)
	movl	$0, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	movl	$0, -16(%ebp)
	jmp	L25
L26:
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	movl	-16(%ebp), %eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	shrb	-9(%ebp)
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
	movl	-16(%ebp), %eax
	addl	%eax, %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	movl	-16(%ebp), %eax
	addl	%eax, %eax
	andl	$6, %eax
	movb	%al, -29(%ebp)
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
	addl	$1, -16(%ebp)
L25:
	cmpl	$799, -16(%ebp)
	jbe	L26
	movl	$0, -16(%ebp)
	jmp	L27
L30:
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	movl	-16(%ebp), %eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
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
	movl	-16(%ebp), %eax
	andl	$3, %eax
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L28
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	movl	-20(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	addl	$1, -20(%ebp)
	cmpb	$0, -30(%ebp)
	jne	L29
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
	addl	$1, -16(%ebp)
L27:
	cmpl	$1599, -16(%ebp)
	jbe	L30
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
	movb	$1, -24(%ebp)
	leal	-41520(%ebp), %eax
	movl	$41472, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	movl	$1, -41520(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_HardDepuncturing
	movl	$2, -12(%ebp)
	jmp	L32
L64:
	movl	-12(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -32(%ebp)
	movl	-28(%ebp), %eax
	andl	$7, %eax
	movb	%al, -33(%ebp)
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
	leal	-82992(%ebp), %eax
	leal	-41520(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	movb	$0, -35(%ebp)
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
	movl	-28(%ebp), %eax
	addl	$1, %eax
	andl	$3, %eax
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	orb	%al, -35(%ebp)
	movb	$0, -21(%ebp)
	jmp	L33
L47:
	movzbl	-21(%ebp), %eax
	movl	-82992(%ebp,%eax,4), %eax
	movl	-12(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L34
	movb	$0, -22(%ebp)
	jmp	L35
L46:
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
	movzbl	-21(%ebp), %ecx
	movzbl	-22(%ebp), %eax
	movl	16(%ebp), %edx
	sall	$2, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	addl	$2, %eax
	movzbl	(%eax), %eax
	movb	%al, -37(%ebp)
	movzbl	-37(%ebp), %eax
	movl	-41520(%ebp,%eax,4), %eax
	cmpl	-12(%ebp), %eax
	jnb	L36
	movzbl	-37(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, -41520(%ebp,%eax,4)
	movzbl	-37(%ebp), %eax
	movzbl	-21(%ebp), %edx
	addl	$64, %edx
	movl	-82992(%ebp,%edx,4), %ecx
	movzbl	-36(%ebp), %edx
	addl	%ecx, %edx
	addl	$64, %eax
	movl	%edx, -41520(%ebp,%eax,4)
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L37
	movl	-12(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -20(%ebp)
	jmp	L38
L37:
	movl	$639, -20(%ebp)
L38:
	movl	$0, -16(%ebp)
	jmp	L39
L40:
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
	addl	$1, -16(%ebp)
L39:
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L40
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
	movzbl	-21(%ebp), %eax
	addl	$64, %eax
	movl	-82992(%ebp,%eax,4), %edx
	movzbl	-36(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -44(%ebp)
	movzbl	-37(%ebp), %eax
	addl	$64, %eax
	movl	-41520(%ebp,%eax,4), %eax
	cmpl	-44(%ebp), %eax
	jbe	L41
	movzbl	-37(%ebp), %eax
	leal	64(%eax), %edx
	movl	-44(%ebp), %eax
	movl	%eax, -41520(%ebp,%edx,4)
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L42
	movl	-12(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -20(%ebp)
	jmp	L43
L42:
	movl	$639, -20(%ebp)
L43:
	movl	$0, -16(%ebp)
	jmp	L44
L45:
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
	addl	$1, -16(%ebp)
L44:
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L45
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
	movzbl	-22(%ebp), %eax
	addl	$1, %eax
	movb	%al, -22(%ebp)
L35:
	cmpb	$1, -22(%ebp)
	jbe	L46
L34:
	movzbl	-21(%ebp), %eax
	addl	$1, %eax
	movb	%al, -21(%ebp)
L33:
	cmpb	$63, -21(%ebp)
	jbe	L47
	cmpl	$801, -12(%ebp)
	jne	L48
	leal	-41520(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinIndexHard
	movb	%al, -45(%ebp)
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L49
	movl	$640, -20(%ebp)
	jmp	L50
L49:
	movl	-12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -20(%ebp)
L50:
	movl	$0, -16(%ebp)
	jmp	L51
L56:
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
	movl	-20(%ebp), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jne	L52
	movzbl	-45(%ebp), %eax
	movb	%al, -23(%ebp)
	jmp	L53
L52:
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
	movl	-16(%ebp), %eax
	subl	-20(%ebp), %eax
	addl	$800, %eax
	shrl	$3, %eax
	movl	%eax, -32(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	andl	$7, %eax
	movb	%al, -33(%ebp)
	movzbl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	2(%eax,%edx,4), %eax
	cmpb	-23(%ebp), %al
	jne	L54
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
	addl	$1, -16(%ebp)
L51:
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L56
	jmp	L57
L48:
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L57
	leal	-41520(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinIndexHard
	movb	%al, -45(%ebp)
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
	movl	-12(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -32(%ebp)
	movl	-12(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -33(%ebp)
	movzbl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	2(%eax,%edx,4), %eax
	cmpb	-23(%ebp), %al
	jne	L58
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
	movb	$0, -21(%ebp)
	jmp	L60
L63:
	movl	$0, -16(%ebp)
	jmp	L61
L62:
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
	addl	$1, -16(%ebp)
L61:
	cmpl	$638, -16(%ebp)
	jbe	L62
	movzbl	-21(%ebp), %eax
	addl	$1, %eax
	movb	%al, -21(%ebp)
L60:
	cmpb	$63, -21(%ebp)
	jbe	L63
L57:
	addl	$1, -12(%ebp)
L32:
	cmpl	$801, -12(%ebp)
	jbe	L64
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
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	movb	$0, -2(%ebp)
	movb	$1, -3(%ebp)
	movb	$0, -1(%ebp)
	jmp	L66
L68:
	movzbl	-20(%ebp), %edx
	movzbl	-1(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movzbl	-3(%ebp), %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	L67
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L67:
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L66:
	cmpb	$7, -1(%ebp)
	jbe	L68
	movzbl	-2(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	_FindMinIndexHard;	.scl	3;	.type	32;	.endef
_FindMinIndexHard:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	cmpl	$0, 8(%ebp)
	je	L71
	movl	8(%ebp), %eax
	movl	256(%eax), %eax
	movl	%eax, -8(%ebp)
	movb	$0, -2(%ebp)
	movb	$1, -1(%ebp)
	jmp	L72
L74:
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L73
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	cmpl	-8(%ebp), %eax
	jnb	L73
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, -8(%ebp)
	movzbl	-1(%ebp), %eax
	movb	%al, -2(%ebp)
L73:
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L72:
	cmpb	$63, -1(%ebp)
	jbe	L74
L71:
	movzbl	-2(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.def	_HardDepuncturing;	.scl	3;	.type	32;	.endef
_HardDepuncturing:
LFB25:
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
	movb	$1, -22(%ebp)
	movb	$3, -9(%ebp)
	movl	$1199, -16(%ebp)
	movl	$1600, -20(%ebp)
	jmp	L77
L84:
	movzbl	-9(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L78
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
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
	subl	$1, -16(%ebp)
	jmp	L79
L78:
	movb	$0, -21(%ebp)
L79:
	cmpb	$0, -9(%ebp)
	je	L80
	movzbl	-9(%ebp), %eax
	subl	$1, %eax
	movb	%al, -9(%ebp)
	jmp	L81
L80:
	movb	$3, -9(%ebp)
L81:
	movl	-20(%ebp), %eax
	subl	$1, %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	movl	-20(%ebp), %eax
	negl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	cmpb	$0, -21(%ebp)
	jne	L82
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
	subl	$1, -20(%ebp)
L77:
	cmpl	$0, -20(%ebp)
	jne	L84
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
	movb	$1, -24(%ebp)
	leal	-41528(%ebp), %eax
	movl	$41472, %edx
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	movl	$1, -41528(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_SoftDepuncturing
	movl	$2, -12(%ebp)
	jmp	L86
L119:
	movl	-12(%ebp), %eax
	addl	$2147483646, %eax
	addl	%eax, %eax
	movl	%eax, -28(%ebp)
	leal	-83000(%ebp), %eax
	leal	-41528(%ebp), %edx
	movl	$41472, %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	movb	$0, -29(%ebp)
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
	movl	-28(%ebp), %eax
	addl	$1, %eax
	andl	$3, %eax
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	orb	%al, -29(%ebp)
	movb	$0, -21(%ebp)
	jmp	L87
L102:
	movzbl	-21(%ebp), %eax
	movl	-83000(%ebp,%eax,4), %eax
	movl	-12(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jne	L88
	movb	$0, -22(%ebp)
	jmp	L89
L101:
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
	movzbl	-21(%ebp), %ecx
	movzbl	-22(%ebp), %eax
	movl	16(%ebp), %edx
	sall	$2, %ecx
	addl	%ecx, %edx
	addl	%edx, %eax
	addl	$2, %eax
	movzbl	(%eax), %eax
	movb	%al, -37(%ebp)
	movzbl	-37(%ebp), %eax
	movl	-41528(%ebp,%eax,4), %eax
	cmpl	-12(%ebp), %eax
	jnb	L90
	movzbl	-37(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, -41528(%ebp,%eax,4)
	movzbl	-37(%ebp), %eax
	movzbl	-21(%ebp), %edx
	addl	$64, %edx
	flds	-83000(%ebp,%edx,4)
	fadds	-36(%ebp)
	addl	$64, %eax
	fstps	-41528(%ebp,%eax,4)
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L91
	movl	-12(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -20(%ebp)
	jmp	L92
L91:
	movl	$639, -20(%ebp)
L92:
	movl	$0, -16(%ebp)
	jmp	L93
L94:
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
	addl	$1, -16(%ebp)
L93:
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L94
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
	movzbl	-21(%ebp), %eax
	addl	$64, %eax
	flds	-83000(%ebp,%eax,4)
	fadds	-36(%ebp)
	fstps	-44(%ebp)
	movzbl	-37(%ebp), %eax
	addl	$64, %eax
	flds	-41528(%ebp,%eax,4)
	flds	-44(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L95
	movzbl	-37(%ebp), %eax
	addl	$64, %eax
	flds	-44(%ebp)
	fstps	-41528(%ebp,%eax,4)
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	ja	L97
	movl	-12(%ebp), %eax
	subl	$2, %eax
	movl	%eax, -20(%ebp)
	jmp	L98
L97:
	movl	$639, -20(%ebp)
L98:
	movl	$0, -16(%ebp)
	jmp	L99
L100:
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
	addl	$1, -16(%ebp)
L99:
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L100
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
	movzbl	-22(%ebp), %eax
	addl	$1, %eax
	movb	%al, -22(%ebp)
L89:
	cmpb	$1, -22(%ebp)
	jbe	L101
L88:
	movzbl	-21(%ebp), %eax
	addl	$1, %eax
	movb	%al, -21(%ebp)
L87:
	cmpb	$63, -21(%ebp)
	jbe	L102
	cmpl	$801, -12(%ebp)
	jne	L103
	leal	-41528(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinIndexSoft
	movb	%al, -45(%ebp)
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L104
	movl	$640, -20(%ebp)
	jmp	L105
L104:
	movl	-12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -20(%ebp)
L105:
	movl	$0, -16(%ebp)
	jmp	L106
L111:
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
	movl	-20(%ebp), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jne	L107
	movzbl	-45(%ebp), %eax
	movb	%al, -23(%ebp)
	jmp	L108
L107:
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
	movl	-16(%ebp), %eax
	subl	-20(%ebp), %eax
	addl	$800, %eax
	shrl	$3, %eax
	movl	%eax, -52(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	andl	$7, %eax
	movb	%al, -53(%ebp)
	movzbl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	2(%eax,%edx,4), %eax
	cmpb	-23(%ebp), %al
	jne	L109
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
	addl	$1, -16(%ebp)
L106:
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L111
	jmp	L112
L103:
	movl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	$639, %eax
	jbe	L112
	leal	-41528(%ebp), %eax
	movl	%eax, (%esp)
	call	_FindMinIndexSoft
	movb	%al, -45(%ebp)
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
	movl	-12(%ebp), %eax
	subl	$641, %eax
	shrl	$3, %eax
	movl	%eax, -52(%ebp)
	movl	-12(%ebp), %eax
	addl	$127, %eax
	andl	$7, %eax
	movb	%al, -53(%ebp)
	movzbl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	2(%eax,%edx,4), %eax
	cmpb	-23(%ebp), %al
	jne	L113
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
	movb	$0, -21(%ebp)
	jmp	L115
L118:
	movl	$0, -16(%ebp)
	jmp	L116
L117:
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
	addl	$1, -16(%ebp)
L116:
	cmpl	$638, -16(%ebp)
	jbe	L117
	movzbl	-21(%ebp), %eax
	addl	$1, %eax
	movb	%al, -21(%ebp)
L115:
	cmpb	$63, -21(%ebp)
	jbe	L118
L112:
	addl	$1, -12(%ebp)
L86:
	cmpl	$801, -12(%ebp)
	jbe	L119
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
	movb	$1, -9(%ebp)
	fldz
	fstps	-8(%ebp)
	movb	$0, -1(%ebp)
	jmp	L122
L124:
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
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L122:
	cmpb	$1, -1(%ebp)
	jbe	L124
	flds	-8(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.def	_FindMinIndexSoft;	.scl	3;	.type	32;	.endef
_FindMinIndexSoft:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	cmpl	$0, 8(%ebp)
	je	L127
	movl	8(%ebp), %eax
	flds	256(%eax)
	fstps	-8(%ebp)
	movb	$0, -2(%ebp)
	movb	$1, -1(%ebp)
	jmp	L128
L131:
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	L129
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	flds	(%eax,%edx,4)
	flds	-8(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L129
	movzbl	-1(%ebp), %edx
	movl	8(%ebp), %eax
	addl	$64, %edx
	flds	(%eax,%edx,4)
	fstps	-8(%ebp)
	movzbl	-1(%ebp), %eax
	movb	%al, -2(%ebp)
L129:
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L128:
	cmpb	$63, -1(%ebp)
	jbe	L131
L127:
	movzbl	-2(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.def	_SoftDepuncturing;	.scl	3;	.type	32;	.endef
_SoftDepuncturing:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movb	$3, -5(%ebp)
	movl	$1199, -12(%ebp)
	movl	$1600, -4(%ebp)
	jmp	L135
L140:
	movzbl	-5(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	L136
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
	subl	$1, -12(%ebp)
	jmp	L137
L136:
	movl	-4(%ebp), %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	fldz
	fstps	(%eax)
L137:
	cmpb	$0, -5(%ebp)
	je	L138
	movzbl	-5(%ebp), %eax
	subl	$1, %eax
	movb	%al, -5(%ebp)
	jmp	L139
L138:
	movb	$3, -5(%ebp)
L139:
	subl	$1, -4(%ebp)
L135:
	cmpl	$0, -4(%ebp)
	jne	L140
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_memcpy;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
