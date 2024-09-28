	.file	"reed_solomon.c"
	.text
Ltext0:
	.section .rdata,"dr"
_PrimPolyGF4:
	.byte	0
	.byte	1
	.align 4
_PrimPolyGF8:
	.byte	0
	.byte	2
	.byte	3
	.byte	4
	.text
	.globl	_RsCod_ListParameters
	.def	_RsCod_ListParameters;	.scl	2;	.type	32;	.endef
_RsCod_ListParameters:
LFB18:
	.file 1 "src/reed_solomon.c"
	.loc 1 82 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 83 0
	movl	$0, -12(%ebp)
	.loc 1 85 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 87 0
	movl	8(%ebp), %eax
	movl	$8, (%eax)
	.loc 1 88 0
	movl	8(%ebp), %eax
	movb	$-68, 4(%eax)
	.loc 1 89 0
	movl	8(%ebp), %eax
	movb	$-52, 5(%eax)
	.loc 1 90 0
	movl	8(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %edx
	movl	8(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movb	%dl, 6(%eax)
	.loc 1 91 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movw	%dx, 12(%eax)
	.loc 1 92 0
	movl	8(%ebp), %eax
	movzwl	12(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movw	%dx, 10(%eax)
	.loc 1 93 0
	movl	8(%ebp), %eax
	movzwl	10(%eax), %edx
	movl	8(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	subl	%eax, %edx
	movl	8(%ebp), %eax
	movw	%dx, 8(%eax)
	.loc 1 95 0
	movl	8(%ebp), %eax
	movzbl	4(%eax), %eax
	testb	%al, %al
	je	L3
	.loc 1 95 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movzbl	5(%eax), %eax
	testb	%al, %al
	je	L3
	.loc 1 96 0 is_stmt 1 discriminator 2
	movl	8(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %edx
	movl	8(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	andl	$1, %eax
	.loc 1 95 0 discriminator 2
	testl	%eax, %eax
	jne	L3
	.loc 1 97 0
	movl	8(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %edx
	movl	8(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %eax
	subl	$1, %eax
	.loc 1 96 0
	cmpl	%eax, %edx
	jg	L3
	.loc 1 98 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 97 0
	cmpl	$4, %eax
	jne	L5
	.loc 1 98 0
	movl	8(%ebp), %eax
	movzbl	5(%eax), %eax
	andl	$1, %eax
	testb	%al, %al
	je	L5
L3:
	.loc 1 100 0
	movl	$16, -12(%ebp)
	jmp	L5
L2:
	.loc 1 105 0
	movl	$1, -12(%ebp)
L5:
	.loc 1 108 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 109 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_RcCod_Encoder
	.def	_RcCod_Encoder;	.scl	2;	.type	32;	.endef
_RcCod_Encoder:
LFB19:
	.loc 1 125 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$108, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 125 0
	movl	%esp, %eax
	movl	%eax, -92(%ebp)
	.loc 1 126 0
	movl	$0, -28(%ebp)
	.loc 1 127 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	0(,%eax,8), %ecx
	movl	16(%ebp), %eax
	movl	(%eax), %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movl	%edx, %edi
	imull	%eax, %edi
	movl	%ecx, %eax
	movl	$0, %edx
	divl	%edi
	movb	%al, -37(%ebp)
	.loc 1 128 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movb	%al, -38(%ebp)
	.loc 1 129 0
	movzbl	-38(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -44(%ebp)
	movzbl	-38(%ebp), %eax
	movl	$16, %edx
	subl	$1, %edx
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	16(%esp), %eax
	addl	$0, %eax
	movl	%eax, -48(%ebp)
	.loc 1 130 0
	movl	16(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %eax
	subl	$1, %eax
	movl	%eax, -52(%ebp)
	movl	16(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %eax
	leal	(%eax,%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %esi
	movl	$0, %edx
	divl	%esi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	16(%esp), %eax
	addl	$0, %eax
	movl	%eax, -56(%ebp)
	.loc 1 135 0
	movl	16(%ebp), %eax
	movzwl	8(%eax), %eax
	movzwl	%ax, %eax
	subl	$1, %eax
	movl	%eax, -60(%ebp)
	movl	16(%ebp), %eax
	movzwl	8(%eax), %eax
	movzwl	%ax, %eax
	movl	$16, %edx
	subl	$1, %edx
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	16(%esp), %eax
	addl	$0, %eax
	movl	%eax, -64(%ebp)
	.loc 1 136 0
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %eax
	subl	$1, %eax
	movl	%eax, -68(%ebp)
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %eax
	movl	$16, %edx
	subl	$1, %edx
	addl	%edx, %eax
	movl	$16, %esi
	movl	$0, %edx
	divl	%esi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	16(%esp), %eax
	addl	$0, %eax
	movl	%eax, -72(%ebp)
	.loc 1 137 0
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %eax
	subl	$1, %eax
	movl	%eax, -76(%ebp)
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %eax
	movl	$16, %edx
	subl	$1, %edx
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	16(%esp), %eax
	addl	$0, %eax
	movl	%eax, -80(%ebp)
	.loc 1 141 0
	cmpl	$0, 8(%ebp)
	je	L8
	.loc 1 141 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L8
	.loc 1 141 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L8
	.loc 1 142 0 is_stmt 1 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 141 0 discriminator 3
	testl	%eax, %eax
	je	L8
	.loc 1 142 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L8
	.loc 1 144 0
	movl	-56(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_RetrieveMappingTableGF
	.loc 1 145 0
	movl	-56(%ebp), %ecx
	movzbl	-38(%ebp), %edx
	movl	-48(%ebp), %eax
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_RetrieveGeneratorPolynomial
	.loc 1 147 0
	movb	$0, -36(%ebp)
	jmp	L9
L30:
	.loc 1 149 0
	movl	16(%ebp), %eax
	movzwl	8(%eax), %eax
	movzwl	%ax, %edx
	movl	-64(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 151 0
	movw	$0, -34(%ebp)
	jmp	L10
L15:
	.loc 1 153 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L11
	.loc 1 155 0
	movzwl	-34(%ebp), %eax
	andl	$1, %eax
	testw	%ax, %ax
	jne	L12
	.loc 1 157 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movzwl	-34(%ebp), %ecx
	movzbl	-36(%ebp), %ebx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	shrb	$4, %al
	movb	%al, -35(%ebp)
	jmp	L14
L12:
	.loc 1 161 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movzwl	-34(%ebp), %eax
	leal	-1(%eax), %ebx
	movzbl	-36(%ebp), %ecx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	%ecx, %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	andl	$15, %eax
	movb	%al, -35(%ebp)
	jmp	L14
L11:
	.loc 1 166 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movzwl	-34(%ebp), %ecx
	movzbl	-36(%ebp), %ebx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movb	%al, -35(%ebp)
L14:
	.loc 1 168 0 discriminator 2
	movzwl	-34(%ebp), %ebx
	movl	-56(%ebp), %edx
	movzbl	-35(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertBi2Sy
	movl	%eax, %edx
	movl	-64(%ebp), %eax
	movb	%dl, (%eax,%ebx)
	.loc 1 151 0 discriminator 2
	movzwl	-34(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -34(%ebp)
L10:
	.loc 1 151 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	cmpw	-34(%ebp), %ax
	ja	L15
	.loc 1 171 0 is_stmt 1
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %edx
	movl	-72(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 172 0
	movl	16(%ebp), %eax
	movzwl	8(%eax), %eax
	movzwl	%ax, %edx
	movl	-64(%ebp), %eax
	movl	16(%ebp), %ecx
	movzbl	6(%ecx), %ecx
	movzbl	%cl, %ecx
	leal	(%ecx,%ecx), %ebx
	movl	-72(%ebp), %ecx
	addl	%ebx, %ecx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_memcpy
	.loc 1 173 0
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	subl	$1, %eax
	movw	%ax, -32(%ebp)
	.loc 1 174 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	leal	(%eax,%eax), %edx
	movzwl	-32(%ebp), %eax
	subl	%edx, %eax
	movw	%ax, -30(%ebp)
	.loc 1 176 0
	jmp	L16
L21:
	.loc 1 178 0
	movzwl	-32(%ebp), %eax
	movl	-72(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %eax
	movw	%ax, -82(%ebp)
	.loc 1 179 0
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %edx
	movl	-80(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 181 0
	movw	$0, -34(%ebp)
	jmp	L17
L18:
	.loc 1 183 0 discriminator 3
	movzwl	-34(%ebp), %edx
	movswl	-30(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movzwl	-34(%ebp), %eax
	movl	-48(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %edx
	movzwl	-82(%ebp), %eax
	movzbl	%al, %eax
	movl	16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movl	%eax, %edx
	movl	-80(%ebp), %eax
	movb	%dl, (%eax,%ebx)
	.loc 1 181 0 discriminator 3
	movzwl	-34(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -34(%ebp)
L17:
	.loc 1 181 0 is_stmt 0 discriminator 1
	movzbl	-38(%ebp), %eax
	cmpw	-34(%ebp), %ax
	ja	L18
	.loc 1 186 0 is_stmt 1
	movw	$0, -34(%ebp)
	jmp	L19
L20:
	.loc 1 188 0 discriminator 3
	movzwl	-34(%ebp), %ebx
	movl	-56(%ebp), %ecx
	movzwl	-34(%ebp), %eax
	movl	-80(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %edx
	movzwl	-34(%ebp), %eax
	movl	-72(%ebp), %esi
	movzbl	(%esi,%eax), %eax
	movzbl	%al, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_AddGF
	movl	%eax, %edx
	movl	-72(%ebp), %eax
	movb	%dl, (%eax,%ebx)
	.loc 1 186 0 discriminator 3
	movzwl	-34(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -34(%ebp)
L19:
	.loc 1 186 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	cmpw	-34(%ebp), %ax
	ja	L20
	.loc 1 191 0 is_stmt 1
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %edx
	movl	-72(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_FindMaxDeg
	movw	%ax, -32(%ebp)
	.loc 1 192 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	leal	(%eax,%eax), %edx
	movzwl	-32(%ebp), %eax
	subl	%edx, %eax
	movw	%ax, -30(%ebp)
L16:
	.loc 1 176 0
	cmpw	$0, -30(%ebp)
	jns	L21
	.loc 1 195 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L22
	.loc 1 197 0
	movw	$0, -34(%ebp)
	jmp	L23
L26:
	.loc 1 199 0
	movzwl	-34(%ebp), %eax
	andl	$1, %eax
	testw	%ax, %ax
	jne	L24
	.loc 1 201 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movzwl	-34(%ebp), %ecx
	movzbl	-36(%ebp), %ebx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	leal	(%edx,%eax), %ebx
	.loc 1 202 0
	movl	-56(%ebp), %edx
	movzwl	-34(%ebp), %eax
	movl	-72(%ebp), %ecx
	movzbl	(%ecx,%eax), %eax
	movzbl	%al, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertSy2Bi
	sall	$4, %eax
	.loc 1 201 0
	movb	%al, (%ebx)
	jmp	L25
L24:
	.loc 1 207 0
	movl	-56(%ebp), %edx
	movzwl	-34(%ebp), %eax
	movl	-72(%ebp), %ecx
	movzbl	(%ecx,%eax), %eax
	movzbl	%al, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertSy2Bi
	movl	%eax, %esi
	.loc 1 206 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movzwl	-34(%ebp), %eax
	leal	-1(%eax), %ebx
	movzbl	-36(%ebp), %ecx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%ecx, %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	orl	%esi, %eax
	movb	%al, (%edx)
L25:
	.loc 1 197 0 discriminator 2
	movzwl	-34(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -34(%ebp)
L23:
	.loc 1 197 0 is_stmt 0 discriminator 1
	movzwl	-34(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	cmpl	%eax, %edx
	jl	L26
	.loc 1 212 0 is_stmt 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	.loc 1 211 0
	shrb	%al
	movzbl	%al, %ebx
	.loc 1 212 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movzbl	-36(%ebp), %ecx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	leal	(%edx,%eax), %ecx
	.loc 1 211 0
	movl	12(%ebp), %eax
	movl	(%eax), %esi
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %edi
	movzbl	-36(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	%edi, %eax
	addl	%esi, %eax
	movl	%ebx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	jmp	L27
L22:
	.loc 1 216 0
	movw	$0, -34(%ebp)
	jmp	L28
L29:
	.loc 1 218 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movzwl	-34(%ebp), %ecx
	movzbl	-36(%ebp), %ebx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	leal	(%edx,%eax), %ebx
	.loc 1 219 0 discriminator 3
	movl	-56(%ebp), %edx
	movzwl	-34(%ebp), %eax
	movl	-72(%ebp), %ecx
	movzbl	(%ecx,%eax), %eax
	movzbl	%al, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertSy2Bi
	.loc 1 218 0 discriminator 3
	movb	%al, (%ebx)
	.loc 1 216 0 discriminator 3
	movzwl	-34(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -34(%ebp)
L28:
	.loc 1 216 0 is_stmt 0 discriminator 1
	movzwl	-34(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	cmpl	%eax, %edx
	jl	L29
	.loc 1 223 0 is_stmt 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	.loc 1 222 0
	movzbl	%al, %ebx
	.loc 1 223 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movzbl	-36(%ebp), %ecx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	%ecx, %eax
	addl	%eax, %edx
	.loc 1 222 0
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	leal	(%eax,%eax), %edi
	movzbl	-36(%ebp), %esi
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%esi, %eax
	addl	%edi, %eax
	addl	%ecx, %eax
	movl	%ebx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
L27:
	.loc 1 147 0 discriminator 2
	movzbl	-36(%ebp), %eax
	addl	$1, %eax
	movb	%al, -36(%ebp)
L9:
	.loc 1 147 0 is_stmt 0 discriminator 1
	movzbl	-36(%ebp), %eax
	cmpb	-37(%ebp), %al
	jb	L30
	.loc 1 141 0 is_stmt 1
	jmp	L31
L8:
	.loc 1 229 0
	movl	$1, -28(%ebp)
L31:
	.loc 1 232 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	-92(%ebp), %esp
	.loc 1 233 0
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
LFE19:
	.globl	_RcCod_Decoder
	.def	_RcCod_Decoder;	.scl	2;	.type	32;	.endef
_RcCod_Decoder:
LFB20:
	.loc 1 249 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$124, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 249 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 250 0
	movl	$0, -28(%ebp)
	.loc 1 251 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	0(,%eax,8), %ecx
	movl	16(%ebp), %eax
	movl	(%eax), %edx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	movl	%edx, %edi
	imull	%eax, %edi
	movl	%ecx, %eax
	movl	$0, %edx
	divl	%edi
	movb	%al, -32(%ebp)
	.loc 1 252 0
	movl	16(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
	movl	16(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %eax
	leal	(%eax,%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	20(%esp), %eax
	addl	$0, %eax
	movl	%eax, -40(%ebp)
	.loc 1 253 0
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %eax
	subl	$1, %eax
	movl	%eax, -44(%ebp)
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %eax
	movl	$16, %edx
	subl	$1, %edx
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	20(%esp), %eax
	addl	$0, %eax
	movl	%eax, -48(%ebp)
	.loc 1 254 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	subl	$1, %eax
	movl	%eax, -52(%ebp)
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	20(%esp), %eax
	addl	$0, %eax
	movl	%eax, -56(%ebp)
	.loc 1 255 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, -60(%ebp)
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	leal	1(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	20(%esp), %eax
	addl	$0, %eax
	movl	%eax, -64(%ebp)
	.loc 1 256 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, -68(%ebp)
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	leal	1(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	20(%esp), %eax
	addl	$0, %eax
	movl	%eax, -72(%ebp)
	.loc 1 257 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	subl	$1, %eax
	movl	%eax, -76(%ebp)
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	movl	$16, %edx
	subl	$1, %edx
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	20(%esp), %eax
	addl	$0, %eax
	movl	%eax, -80(%ebp)
	.loc 1 258 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	subl	$1, %eax
	movl	%eax, -84(%ebp)
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	movl	$16, %edx
	subl	$1, %edx
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	20(%esp), %eax
	addl	$0, %eax
	movl	%eax, -88(%ebp)
	.loc 1 263 0
	cmpl	$0, 8(%ebp)
	je	L34
	.loc 1 263 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L34
	.loc 1 263 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L34
	.loc 1 264 0 is_stmt 1 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 263 0 discriminator 3
	testl	%eax, %eax
	je	L34
	.loc 1 264 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L34
	.loc 1 266 0
	movl	-40(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_RetrieveMappingTableGF
	.loc 1 267 0
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %edx
	movl	-48(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 269 0
	movb	$0, -30(%ebp)
	jmp	L35
L51:
	.loc 1 271 0
	movb	$0, -31(%ebp)
	jmp	L36
L41:
	.loc 1 273 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L37
	.loc 1 275 0
	movzbl	-31(%ebp), %eax
	andl	$1, %eax
	testb	%al, %al
	jne	L38
	.loc 1 277 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movzbl	-31(%ebp), %ecx
	movzbl	-30(%ebp), %ebx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	shrb	$4, %al
	movb	%al, -29(%ebp)
	jmp	L40
L38:
	.loc 1 281 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movzbl	-31(%ebp), %eax
	leal	-1(%eax), %ebx
	movzbl	-30(%ebp), %ecx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%ecx, %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	andl	$15, %eax
	movb	%al, -29(%ebp)
	jmp	L40
L37:
	.loc 1 286 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movzbl	-31(%ebp), %ecx
	movzbl	-30(%ebp), %ebx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movb	%al, -29(%ebp)
L40:
	.loc 1 288 0 discriminator 2
	movzbl	-31(%ebp), %ebx
	movl	-40(%ebp), %edx
	movzbl	-29(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertBi2Sy
	movl	%eax, %edx
	movl	-48(%ebp), %eax
	movb	%dl, (%eax,%ebx)
	.loc 1 271 0 discriminator 2
	movzbl	-31(%ebp), %eax
	addl	$1, %eax
	movb	%al, -31(%ebp)
L36:
	.loc 1 271 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	cmpb	-31(%ebp), %al
	ja	L41
	.loc 1 291 0 is_stmt 1
	movl	-40(%ebp), %ecx
	movl	-56(%ebp), %edx
	movl	-48(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_GetSyndrome
	movb	%al, -89(%ebp)
	.loc 1 293 0
	cmpb	$0, -89(%ebp)
	je	L42
	.loc 1 295 0
	movl	-40(%ebp), %ecx
	movl	-56(%ebp), %edx
	movl	-64(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_BerlekampMasseyAlgorithm
	.loc 1 296 0
	movl	-40(%ebp), %ecx
	movl	-64(%ebp), %edx
	movl	-80(%ebp), %eax
	movl	%ecx, 12(%esp)
	movl	16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ChienAlgorithm
	.loc 1 297 0
	movl	-40(%ebp), %ebx
	movl	-64(%ebp), %ecx
	movl	-56(%ebp), %edx
	movl	-72(%ebp), %eax
	movl	%ebx, 16(%esp)
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_KeyAlgorithm
	.loc 1 298 0
	movl	-40(%ebp), %ebx
	movl	-80(%ebp), %ecx
	movl	-72(%ebp), %edx
	movl	-88(%ebp), %eax
	movl	%ebx, 16(%esp)
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ForneyAlgorithm
	.loc 1 299 0
	movl	-40(%ebp), %ebx
	movl	-88(%ebp), %ecx
	movl	-80(%ebp), %edx
	movl	-48(%ebp), %eax
	movl	%ebx, 16(%esp)
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ErrorCorrector
L42:
	.loc 1 302 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L43
	.loc 1 304 0
	movb	$0, -31(%ebp)
	jmp	L44
L47:
	.loc 1 306 0
	movzbl	-31(%ebp), %eax
	andl	$1, %eax
	testb	%al, %al
	jne	L45
	.loc 1 308 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movzbl	-31(%ebp), %ecx
	movzbl	-30(%ebp), %ebx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	leal	(%edx,%eax), %ebx
	.loc 1 309 0
	movl	-40(%ebp), %edx
	movzbl	-31(%ebp), %ecx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	addl	%eax, %ecx
	movl	-48(%ebp), %eax
	movzbl	(%eax,%ecx), %eax
	movzbl	%al, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertSy2Bi
	sall	$4, %eax
	.loc 1 308 0
	movb	%al, (%ebx)
	jmp	L46
L45:
	.loc 1 314 0
	movl	-40(%ebp), %edx
	movzbl	-31(%ebp), %ecx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	addl	%eax, %ecx
	movl	-48(%ebp), %eax
	movzbl	(%eax,%ecx), %eax
	movzbl	%al, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertSy2Bi
	movl	%eax, %edi
	.loc 1 313 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movzbl	-31(%ebp), %eax
	leal	-1(%eax), %ebx
	movzbl	-30(%ebp), %ecx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	%ecx, %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	orl	%edi, %eax
	movb	%al, (%edx)
L46:
	.loc 1 304 0 discriminator 2
	movzbl	-31(%ebp), %eax
	addl	$1, %eax
	movb	%al, -31(%ebp)
L44:
	.loc 1 304 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-31(%ebp), %al
	ja	L47
	jmp	L48
L43:
	.loc 1 320 0 is_stmt 1
	movb	$0, -31(%ebp)
	jmp	L49
L50:
	.loc 1 322 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movzbl	-31(%ebp), %ecx
	movzbl	-30(%ebp), %ebx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	%ebx, %eax
	addl	%ecx, %eax
	leal	(%edx,%eax), %ebx
	.loc 1 323 0 discriminator 3
	movl	-40(%ebp), %edx
	movzbl	-31(%ebp), %ecx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	addl	%eax, %ecx
	movl	-48(%ebp), %eax
	movzbl	(%eax,%ecx), %eax
	movzbl	%al, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertSy2Bi
	.loc 1 322 0 discriminator 3
	movb	%al, (%ebx)
	.loc 1 320 0 discriminator 3
	movzbl	-31(%ebp), %eax
	addl	$1, %eax
	movb	%al, -31(%ebp)
L49:
	.loc 1 320 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-31(%ebp), %al
	ja	L50
L48:
	.loc 1 269 0 is_stmt 1 discriminator 2
	movzbl	-30(%ebp), %eax
	addl	$1, %eax
	movb	%al, -30(%ebp)
L35:
	.loc 1 269 0 is_stmt 0 discriminator 1
	movzbl	-30(%ebp), %eax
	cmpb	-32(%ebp), %al
	jb	L51
	.loc 1 263 0 is_stmt 1
	jmp	L52
L34:
	.loc 1 330 0
	movl	$1, -28(%ebp)
L52:
	.loc 1 333 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 334 0
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
	.def	_RetrievePrimitivePolynomial;	.scl	3;	.type	32;	.endef
_RetrievePrimitivePolynomial:
LFB21:
	.loc 1 351 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 352 0
	movl	$0, -12(%ebp)
	.loc 1 354 0
	cmpl	$0, 8(%ebp)
	je	L55
	.loc 1 354 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L55
	.loc 1 356 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L57
	cmpl	$8, %eax
	je	L58
	jmp	L62
L57:
	.loc 1 359 0
	movl	8(%ebp), %eax
	movl	$_PrimPolyGF4, (%eax)
	.loc 1 360 0
	movl	8(%ebp), %eax
	movb	$2, 4(%eax)
	.loc 1 361 0
	jmp	L59
L58:
	.loc 1 364 0
	movl	8(%ebp), %eax
	movl	$_PrimPolyGF8, (%eax)
	.loc 1 365 0
	movl	8(%ebp), %eax
	movb	$4, 4(%eax)
	.loc 1 366 0
	jmp	L59
L62:
	.loc 1 369 0
	movl	$15, -12(%ebp)
	.loc 1 370 0
	nop
L59:
	.loc 1 372 0
	jmp	L60
L55:
	.loc 1 375 0
	movl	$1, -12(%ebp)
L60:
	.loc 1 378 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 379 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.def	_RetrieveGeneratorPolynomial;	.scl	3;	.type	32;	.endef
_RetrieveGeneratorPolynomial:
LFB22:
	.loc 1 392 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movl	12(%ebp), %eax
	movb	%al, -28(%ebp)
	.loc 1 393 0
	movl	$0, -12(%ebp)
	.loc 1 397 0
	cmpl	$0, 8(%ebp)
	je	L64
	.loc 1 399 0
	movzbl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 401 0
	movl	8(%ebp), %eax
	movb	$2, (%eax)
	.loc 1 402 0
	movl	8(%ebp), %eax
	addl	$1, %eax
	movb	$1, (%eax)
	.loc 1 404 0
	movw	$2, -14(%ebp)
	jmp	L65
L70:
	.loc 1 406 0
	movzbl	-28(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -16(%ebp)
	jmp	L66
L69:
	.loc 1 408 0
	movswl	-14(%ebp), %eax
	movl	20(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$2, (%esp)
	call	_PowerGF
	movzbl	%al, %edx
	movswl	-16(%ebp), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	20(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movb	%al, -17(%ebp)
	.loc 1 409 0
	cmpw	$0, -16(%ebp)
	jle	L67
	.loc 1 411 0
	movswl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movswl	-16(%ebp), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-17(%ebp), %eax
	movl	16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_AddGF
	movb	%al, (%ebx)
	jmp	L68
L67:
	.loc 1 415 0
	movswl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movzbl	-17(%ebp), %eax
	movb	%al, (%edx)
L68:
	.loc 1 406 0 discriminator 2
	movzwl	-16(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -16(%ebp)
L66:
	.loc 1 406 0 is_stmt 0 discriminator 1
	cmpw	$0, -16(%ebp)
	jns	L69
	.loc 1 404 0 is_stmt 1 discriminator 2
	movzwl	-14(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -14(%ebp)
L65:
	.loc 1 404 0 is_stmt 0 discriminator 1
	movswl	-14(%ebp), %edx
	movzbl	-28(%ebp), %eax
	cmpl	%eax, %edx
	jl	L70
	jmp	L71
L64:
	.loc 1 422 0 is_stmt 1
	movl	$1, -12(%ebp)
L71:
	.loc 1 425 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 426 0
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_RetrieveMappingTableGF;	.scl	3;	.type	32;	.endef
_RetrieveMappingTableGF:
LFB23:
	.loc 1 439 0
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
	.loc 1 439 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 440 0
	movl	$0, -12(%ebp)
	.loc 1 445 0
	movl	12(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %eax
	subl	$1, %eax
	movl	%eax, -24(%ebp)
	movl	12(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %eax
	movl	$16, %edx
	subl	$1, %edx
	addl	%edx, %eax
	movl	$16, %ecx
	movl	$0, %edx
	divl	%ecx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	12(%esp), %eax
	addl	$0, %eax
	movl	%eax, -28(%ebp)
	.loc 1 448 0
	cmpl	$0, 8(%ebp)
	je	L74
	.loc 1 448 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L74
	.loc 1 450 0 is_stmt 1
	movw	$0, -18(%ebp)
	jmp	L75
L76:
	.loc 1 452 0 discriminator 3
	movzwl	-18(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	$2, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 450 0 discriminator 3
	movzwl	-18(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -18(%ebp)
L75:
	.loc 1 450 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzwl	12(%eax), %eax
	cmpw	-18(%ebp), %ax
	ja	L76
	.loc 1 455 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrievePrimitivePolynomial
	.loc 1 457 0
	movw	$1, -18(%ebp)
	jmp	L77
L82:
	.loc 1 459 0
	movl	12(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %edx
	movl	-28(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 460 0
	movzwl	-18(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -16(%ebp)
	.loc 1 461 0
	movzwl	-16(%ebp), %eax
	movl	-28(%ebp), %edx
	movb	$1, (%edx,%eax)
	.loc 1 462 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movzwl	-16(%ebp), %eax
	subl	%edx, %eax
	movw	%ax, -14(%ebp)
	.loc 1 464 0
	jmp	L78
L81:
	.loc 1 466 0
	movzwl	-16(%ebp), %eax
	movl	-28(%ebp), %edx
	movb	$0, (%edx,%eax)
	.loc 1 468 0
	movb	$0, -19(%ebp)
	jmp	L79
L80:
	.loc 1 470 0 discriminator 3
	movswl	-14(%ebp), %edx
	movl	-36(%ebp), %ecx
	movzbl	-19(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	leal	(%edx,%eax), %ecx
	.loc 1 471 0 discriminator 3
	movswl	-14(%ebp), %edx
	movl	-36(%ebp), %ebx
	movzbl	-19(%ebp), %eax
	addl	%ebx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %edx
	movl	-28(%ebp), %eax
	movzbl	(%eax,%edx), %eax
	movzbl	%al, %eax
	leal	1(%eax), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$31, %eax
	addl	%eax, %edx
	andl	$1, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	.loc 1 470 0 discriminator 3
	movl	%eax, %edx
	movl	-28(%ebp), %eax
	movb	%dl, (%eax,%ecx)
	.loc 1 468 0 discriminator 3
	movzbl	-19(%ebp), %eax
	addl	$1, %eax
	movb	%al, -19(%ebp)
L79:
	.loc 1 468 0 is_stmt 0 discriminator 1
	movzbl	-32(%ebp), %eax
	cmpb	-19(%ebp), %al
	ja	L80
	.loc 1 473 0 is_stmt 1
	movl	12(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %edx
	movl	-28(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_FindMaxDeg
	movw	%ax, -16(%ebp)
	.loc 1 474 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movzwl	-16(%ebp), %eax
	subl	%edx, %eax
	movw	%ax, -14(%ebp)
L78:
	.loc 1 464 0
	cmpw	$0, -14(%ebp)
	jns	L81
	.loc 1 477 0 discriminator 2
	movzwl	-18(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movl	-28(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_GetBasis
	movb	%al, (%ebx)
	.loc 1 478 0 discriminator 2
	movzwl	-18(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	leal	(%eax,%eax), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzwl	-18(%ebp), %edx
	movb	%dl, 1(%eax)
	.loc 1 457 0 discriminator 2
	movzwl	-18(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -18(%ebp)
L77:
	.loc 1 457 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzwl	12(%eax), %eax
	cmpw	-18(%ebp), %ax
	ja	L82
	.loc 1 448 0 is_stmt 1
	jmp	L83
L74:
	.loc 1 483 0
	movl	$1, -12(%ebp)
L83:
	.loc 1 486 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 487 0
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	_FindMaxDeg;	.scl	3;	.type	32;	.endef
_FindMaxDeg:
LFB24:
	.loc 1 499 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	12(%ebp), %eax
	movw	%ax, -20(%ebp)
	.loc 1 503 0
	cmpl	$0, 8(%ebp)
	je	L86
	.loc 1 505 0
	movzwl	-20(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -4(%ebp)
L88:
	.loc 1 507 0
	movzwl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L87
	.loc 1 509 0
	movzwl	-4(%ebp), %eax
	movw	%ax, -2(%ebp)
	.loc 1 510 0
	jmp	L86
L87:
	.loc 1 505 0
	movzwl	-4(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -4(%ebp)
	.loc 1 507 0
	jmp	L88
L86:
	.loc 1 515 0
	movzwl	-2(%ebp), %eax
	.loc 1 516 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.def	_GetBasis;	.scl	3;	.type	32;	.endef
_GetBasis:
LFB25:
	.loc 1 528 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 529 0
	movb	$0, -1(%ebp)
	.loc 1 532 0
	cmpl	$0, 8(%ebp)
	je	L91
	.loc 1 534 0
	movb	$0, -2(%ebp)
	jmp	L92
L93:
	.loc 1 536 0 discriminator 3
	movzbl	-2(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movzbl	-2(%ebp), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	$1, %eax
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movzbl	-1(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -1(%ebp)
	.loc 1 534 0 discriminator 3
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L92:
	.loc 1 534 0 is_stmt 0 discriminator 1
	movzbl	-2(%ebp), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jb	L93
L91:
	.loc 1 540 0 is_stmt 1
	movzbl	-1(%ebp), %eax
	.loc 1 541 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.def	_ConvertBi2Sy;	.scl	3;	.type	32;	.endef
_ConvertBi2Sy:
LFB26:
	.loc 1 553 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	.loc 1 554 0
	movzbl	-4(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	.loc 1 555 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_ConvertSy2Bi;	.scl	3;	.type	32;	.endef
_ConvertSy2Bi:
LFB27:
	.loc 1 567 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	.loc 1 568 0
	movzbl	-4(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	.loc 1 569 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.def	_AddGF;	.scl	3;	.type	32;	.endef
_AddGF:
LFB28:
	.loc 1 582 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movb	%dl, -20(%ebp)
	movb	%al, -24(%ebp)
	.loc 1 585 0
	movzbl	-20(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %ecx
	movzbl	-24(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	xorl	%ecx, %eax
	movb	%al, -1(%ebp)
	.loc 1 587 0
	movzbl	-1(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	.loc 1 588 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.def	_MultiplyGF;	.scl	3;	.type	32;	.endef
_MultiplyGF:
LFB29:
	.loc 1 601 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movb	%dl, -20(%ebp)
	movb	%al, -24(%ebp)
	.loc 1 602 0
	movb	$0, -1(%ebp)
	.loc 1 604 0
	cmpb	$0, -20(%ebp)
	je	L102
	.loc 1 604 0 is_stmt 0 discriminator 1
	cmpb	$0, -24(%ebp)
	je	L102
	.loc 1 606 0 is_stmt 1
	movzbl	-20(%ebp), %edx
	movzbl	-24(%ebp), %eax
	addl	%edx, %eax
	leal	-2(%eax), %edx
	movl	16(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %eax
	leal	-1(%eax), %ecx
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L102:
	.loc 1 609 0
	movzbl	-1(%ebp), %eax
	.loc 1 610 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.def	_PowerGF;	.scl	3;	.type	32;	.endef
_PowerGF:
LFB30:
	.loc 1 627 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movb	%dl, -20(%ebp)
	movw	%ax, -24(%ebp)
	.loc 1 631 0
	cmpb	$0, -20(%ebp)
	je	L105
	.loc 1 631 0 is_stmt 0 discriminator 1
	cmpb	$1, -20(%ebp)
	jne	L106
L105:
	.loc 1 633 0 is_stmt 1
	movzbl	-20(%ebp), %eax
	movb	%al, -1(%ebp)
	jmp	L107
L106:
	.loc 1 637 0
	movzbl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movswl	-24(%ebp), %eax
	imull	%edx, %eax
	movl	16(%ebp), %edx
	movzwl	12(%edx), %edx
	movzwl	%dx, %edx
	leal	-1(%edx), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	movw	%ax, -4(%ebp)
	.loc 1 638 0
	cmpw	$0, -24(%ebp)
	jns	L108
	.loc 1 640 0
	movzwl	-4(%ebp), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movzwl	12(%eax), %eax
	addl	%edx, %eax
	movb	%al, -1(%ebp)
	jmp	L107
L108:
	.loc 1 644 0
	movzwl	-4(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L107:
	.loc 1 648 0
	movzbl	-1(%ebp), %eax
	.loc 1 649 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.def	_GetSyndrome;	.scl	3;	.type	32;	.endef
_GetSyndrome:
LFB31:
	.loc 1 664 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$28, %esp
	.loc 1 668 0
	movb	$0, -6(%ebp)
	.loc 1 670 0
	cmpl	$0, 8(%ebp)
	je	L111
	.loc 1 670 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L111
	.loc 1 670 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L111
	.loc 1 672 0 is_stmt 1
	movw	$0, -2(%ebp)
	jmp	L112
L116:
	.loc 1 674 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movb	%al, -5(%ebp)
	.loc 1 676 0
	movw	$1, -4(%ebp)
	jmp	L113
L114:
	.loc 1 678 0 discriminator 3
	movswl	-4(%ebp), %edx
	movzwl	-2(%ebp), %eax
	addl	$2, %eax
	movzbl	%al, %eax
	movl	16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_PowerGF
	movzbl	%al, %edx
	movswl	-4(%ebp), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movzbl	%al, %edx
	movzbl	-5(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_AddGF
	movb	%al, -5(%ebp)
	.loc 1 676 0 discriminator 3
	movzwl	-4(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -4(%ebp)
L113:
	.loc 1 676 0 is_stmt 0 discriminator 1
	movswl	-4(%ebp), %edx
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %eax
	cmpl	%eax, %edx
	jl	L114
	.loc 1 681 0 is_stmt 1
	movzwl	-2(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movzbl	-5(%ebp), %eax
	movb	%al, (%edx)
	.loc 1 683 0
	cmpb	$0, -5(%ebp)
	je	L115
	.loc 1 685 0
	movb	$1, -6(%ebp)
L115:
	.loc 1 672 0 discriminator 2
	movzwl	-2(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -2(%ebp)
L112:
	.loc 1 672 0 is_stmt 0 discriminator 1
	movzwl	-2(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	cmpl	%eax, %edx
	jl	L116
L111:
	.loc 1 690 0 is_stmt 1
	movzbl	-6(%ebp), %eax
	.loc 1 691 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.def	_BerlekampMasseyAlgorithm;	.scl	3;	.type	32;	.endef
_BerlekampMasseyAlgorithm:
LFB32:
	.loc 1 706 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 706 0
	movl	%esp, %eax
	movl	%eax, %edi
	.loc 1 707 0
	movl	$0, -28(%ebp)
	.loc 1 708 0
	movw	$0, -30(%ebp)
	.loc 1 711 0
	movw	$-1, -32(%ebp)
	.loc 1 712 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, -40(%ebp)
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	leal	1(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %esi
	movl	$0, %edx
	divl	%esi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	24(%esp), %eax
	addl	$0, %eax
	movl	%eax, -44(%ebp)
	.loc 1 713 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, -48(%ebp)
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	leal	1(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %ebx
	movl	$0, %edx
	divl	%ebx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	24(%esp), %eax
	addl	$0, %eax
	movl	%eax, -52(%ebp)
	.loc 1 716 0
	cmpl	$0, 8(%ebp)
	je	L119
	.loc 1 716 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L119
	.loc 1 716 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L119
	.loc 1 716 0 discriminator 3
	cmpl	$0, 20(%ebp)
	je	L119
	.loc 1 718 0 is_stmt 1
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	$1, %eax
	movl	%eax, %edx
	movl	-52(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 719 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	$1, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 720 0
	movl	-52(%ebp), %eax
	movb	$1, 1(%eax)
	.loc 1 721 0
	movl	8(%ebp), %eax
	movb	$1, (%eax)
	.loc 1 723 0
	movb	$0, -33(%ebp)
	jmp	L120
L128:
	.loc 1 725 0
	movswl	-30(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	cmpl	%eax, %edx
	jg	L121
	.loc 1 727 0
	movzbl	-33(%ebp), %edx
	movswl	-30(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	%ecx, 20(%esp)
	movl	16(%ebp), %ecx
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetDiscrepancy
	movw	%ax, -54(%ebp)
	.loc 1 729 0
	cmpw	$0, -54(%ebp)
	je	L122
	.loc 1 731 0
	movb	$0, -34(%ebp)
	jmp	L123
L124:
	.loc 1 733 0 discriminator 3
	movzbl	-34(%ebp), %ebx
	movzbl	-34(%ebp), %eax
	movl	-52(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %edx
	movzwl	-54(%ebp), %eax
	movzbl	%al, %eax
	movl	16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movzbl	%al, %edx
	movzbl	-34(%ebp), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	20(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_AddGF
	movl	%eax, %edx
	movl	-44(%ebp), %eax
	movb	%dl, (%eax,%ebx)
	.loc 1 731 0 discriminator 3
	movzbl	-34(%ebp), %eax
	addl	$1, %eax
	movb	%al, -34(%ebp)
L123:
	.loc 1 731 0 is_stmt 0 discriminator 1
	movzbl	-34(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	$1, %eax
	cmpl	%eax, %edx
	jl	L124
	.loc 1 736 0 is_stmt 1
	movswl	-30(%ebp), %eax
	movzbl	-33(%ebp), %ecx
	movswl	-32(%ebp), %edx
	subl	%edx, %ecx
	movl	%ecx, %edx
	cmpl	%edx, %eax
	jge	L125
	.loc 1 738 0
	movzbl	-33(%ebp), %edx
	movzwl	-32(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movw	%ax, -56(%ebp)
	.loc 1 739 0
	movzbl	-33(%ebp), %edx
	movzwl	-30(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movw	%ax, -32(%ebp)
	.loc 1 741 0
	movb	$0, -34(%ebp)
	jmp	L126
L127:
	.loc 1 743 0 discriminator 3
	movzbl	-34(%ebp), %ebx
	movzbl	-34(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %esi
	movzwl	-54(%ebp), %eax
	movl	$1, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cwtl
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$2, (%esp)
	call	_PowerGF
	movzbl	%al, %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movl	%eax, %edx
	movl	-52(%ebp), %eax
	movb	%dl, (%eax,%ebx)
	.loc 1 741 0 discriminator 3
	movzbl	-34(%ebp), %eax
	addl	$1, %eax
	movb	%al, -34(%ebp)
L126:
	.loc 1 741 0 is_stmt 0 discriminator 1
	movzbl	-34(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	$1, %eax
	cmpl	%eax, %edx
	jl	L127
	.loc 1 746 0 is_stmt 1
	movzwl	-56(%ebp), %eax
	movw	%ax, -30(%ebp)
L125:
	.loc 1 749 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	$1, %eax
	movl	%eax, %edx
	movl	-44(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memcpy
L122:
	.loc 1 752 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %edx
	movl	-52(%ebp), %eax
	movl	-52(%ebp), %ecx
	addl	$1, %ecx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_memcpy
	.loc 1 753 0
	movl	-52(%ebp), %eax
	movb	$0, (%eax)
L121:
	.loc 1 723 0 discriminator 2
	movzbl	-33(%ebp), %eax
	addl	$1, %eax
	movb	%al, -33(%ebp)
L120:
	.loc 1 723 0 is_stmt 0 discriminator 1
	movzbl	-33(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	cmpl	%eax, %edx
	jl	L128
	.loc 1 716 0 is_stmt 1
	jmp	L129
L119:
	.loc 1 759 0
	movl	$1, -28(%ebp)
L129:
	.loc 1 762 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%edi, %esp
	.loc 1 763 0
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
LFE32:
	.def	_GetDiscrepancy;	.scl	3;	.type	32;	.endef
_GetDiscrepancy:
LFB33:
	.loc 1 779 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$36, %esp
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	movw	%dx, -20(%ebp)
	movb	%al, -24(%ebp)
	.loc 1 781 0
	movw	$0, -2(%ebp)
	.loc 1 784 0
	cmpl	$0, 8(%ebp)
	je	L132
	.loc 1 784 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L132
	.loc 1 784 0 discriminator 2
	cmpl	$0, 24(%ebp)
	je	L132
	.loc 1 784 0 discriminator 3
	cmpl	$0, 28(%ebp)
	je	L132
	.loc 1 786 0 is_stmt 1
	movb	$0, -3(%ebp)
	jmp	L133
L134:
	.loc 1 788 0 discriminator 3
	movzbl	-24(%ebp), %edx
	movzbl	-3(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-3(%ebp), %ecx
	movl	12(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	24(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movzbl	%al, %edx
	movzwl	-2(%ebp), %eax
	movzbl	%al, %eax
	movl	28(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_AddGF
	movzbl	%al, %eax
	movw	%ax, -2(%ebp)
	.loc 1 786 0 discriminator 3
	movzbl	-3(%ebp), %eax
	addl	$1, %eax
	movb	%al, -3(%ebp)
L133:
	.loc 1 786 0 is_stmt 0 discriminator 1
	movzbl	-3(%ebp), %eax
	movswl	-20(%ebp), %edx
	addl	$1, %edx
	cmpl	%edx, %eax
	jl	L134
L132:
	.loc 1 792 0 is_stmt 1
	movzwl	-2(%ebp), %eax
	.loc 1 793 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE33:
	.def	_ChienAlgorithm;	.scl	3;	.type	32;	.endef
_ChienAlgorithm:
LFB34:
	.loc 1 808 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 809 0
	movl	$0, -12(%ebp)
	.loc 1 810 0
	movb	$0, -13(%ebp)
	.loc 1 814 0
	cmpl	$0, 8(%ebp)
	je	L137
	.loc 1 814 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L137
	.loc 1 814 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L137
	.loc 1 814 0 discriminator 3
	cmpl	$0, 20(%ebp)
	je	L137
	.loc 1 816 0 is_stmt 1
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 818 0
	movb	$0, -15(%ebp)
	jmp	L138
L142:
	.loc 1 820 0
	movl	12(%ebp), %eax
	movzbl	(%eax), %eax
	movb	%al, -14(%ebp)
	.loc 1 822 0
	movb	$1, -16(%ebp)
	jmp	L139
L140:
	.loc 1 824 0 discriminator 3
	movzbl	-16(%ebp), %edx
	movzbl	-15(%ebp), %eax
	addl	$1, %eax
	movzbl	%al, %eax
	movl	16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_PowerGF
	movzbl	%al, %edx
	movzbl	-16(%ebp), %ecx
	movl	12(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	16(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movzbl	%al, %edx
	movzbl	-14(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_AddGF
	movb	%al, -14(%ebp)
	.loc 1 822 0 discriminator 3
	movzbl	-16(%ebp), %eax
	addl	$1, %eax
	movb	%al, -16(%ebp)
L139:
	.loc 1 822 0 is_stmt 0 discriminator 1
	movzbl	-16(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	$1, %eax
	cmpl	%eax, %edx
	jl	L140
	.loc 1 826 0 is_stmt 1
	cmpb	$0, -14(%ebp)
	jne	L141
	.loc 1 826 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	cmpb	-13(%ebp), %al
	jbe	L141
	.loc 1 828 0 is_stmt 1
	movzbl	-13(%ebp), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movzbl	-15(%ebp), %eax
	addl	$1, %eax
	movzbl	%al, %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$-1, 4(%esp)
	movl	%eax, (%esp)
	call	_PowerGF
	movb	%al, (%ebx)
	.loc 1 829 0
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L141:
	.loc 1 818 0 discriminator 2
	movzbl	-15(%ebp), %eax
	addl	$1, %eax
	movb	%al, -15(%ebp)
L138:
	.loc 1 818 0 is_stmt 0 discriminator 1
	movzbl	-15(%ebp), %edx
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	cmpw	%ax, %dx
	jb	L142
	.loc 1 814 0 is_stmt 1
	jmp	L143
L137:
	.loc 1 835 0
	movl	$1, -12(%ebp)
L143:
	.loc 1 838 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 839 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE34:
	.def	_KeyAlgorithm;	.scl	3;	.type	32;	.endef
_KeyAlgorithm:
LFB35:
	.loc 1 855 0
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
	.loc 1 855 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 856 0
	movl	$0, -12(%ebp)
	.loc 1 857 0
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -20(%ebp)
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	leal	1(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %ebx
	movl	$0, %edx
	divl	%ebx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	12(%esp), %eax
	addl	$0, %eax
	movl	%eax, -24(%ebp)
	.loc 1 858 0
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, -28(%ebp)
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	leal	1(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %ebx
	movl	$0, %edx
	divl	%ebx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	12(%esp), %eax
	addl	$0, %eax
	movl	%eax, -32(%ebp)
	.loc 1 861 0
	cmpl	$0, 8(%ebp)
	je	L146
	.loc 1 861 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L146
	.loc 1 861 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L146
	.loc 1 861 0 discriminator 3
	cmpl	$0, 20(%ebp)
	je	L146
	.loc 1 861 0 discriminator 4
	cmpl	$0, 24(%ebp)
	je	L146
	.loc 1 857 0 is_stmt 1
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	.loc 1 863 0
	leal	1(%eax), %edx
	movl	-24(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 864 0
	movl	-32(%ebp), %eax
	movb	$1, (%eax)
	.loc 1 865 0
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	movl	%eax, %ecx
	movl	-32(%ebp), %eax
	leal	1(%eax), %edx
	movl	%ecx, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_memcpy
	.loc 1 867 0
	movb	$0, -13(%ebp)
	jmp	L147
L150:
	.loc 1 869 0
	movb	$0, -14(%ebp)
	jmp	L148
L149:
	.loc 1 871 0 discriminator 3
	movzbl	-13(%ebp), %edx
	movzbl	-14(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movzbl	-14(%ebp), %eax
	movl	-32(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %edx
	movzbl	-13(%ebp), %ecx
	movl	16(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	20(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movzbl	%al, %edx
	movzbl	-13(%ebp), %ecx
	movzbl	-14(%ebp), %eax
	addl	%eax, %ecx
	movl	-24(%ebp), %eax
	movzbl	(%eax,%ecx), %eax
	movzbl	%al, %eax
	movl	24(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_AddGF
	movl	%eax, %edx
	movl	-24(%ebp), %eax
	movb	%dl, (%eax,%ebx)
	.loc 1 869 0 discriminator 3
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L148:
	.loc 1 869 0 is_stmt 0 discriminator 1
	movzbl	-14(%ebp), %edx
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	addl	$1, %eax
	cmpl	%eax, %edx
	jl	L149
	.loc 1 867 0 is_stmt 1 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L147:
	.loc 1 867 0 is_stmt 0 discriminator 1
	movzbl	-13(%ebp), %edx
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	$1, %eax
	cmpl	%eax, %edx
	jl	L150
	.loc 1 875 0 is_stmt 1
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	%eax, %edx
	movl	-24(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memcpy
	jmp	L151
L146:
	.loc 1 879 0
	movl	$1, -12(%ebp)
L151:
	.loc 1 882 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 883 0
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE35:
	.def	_ForneyAlgorithm;	.scl	3;	.type	32;	.endef
_ForneyAlgorithm:
LFB36:
	.loc 1 899 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 900 0
	movl	$0, -12(%ebp)
	.loc 1 905 0
	cmpl	$0, 8(%ebp)
	je	L154
	.loc 1 905 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L154
	.loc 1 905 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L154
	.loc 1 905 0 discriminator 3
	cmpl	$0, 20(%ebp)
	je	L154
	.loc 1 905 0 discriminator 4
	cmpl	$0, 24(%ebp)
	je	L154
	.loc 1 907 0 is_stmt 1
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 909 0
	movb	$0, -15(%ebp)
	jmp	L155
L162:
	.loc 1 911 0
	movzbl	-15(%ebp), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L156
	.loc 1 913 0
	movzbl	-15(%ebp), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	20(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$-1, 4(%esp)
	movl	%eax, (%esp)
	call	_PowerGF
	movb	%al, -17(%ebp)
	.loc 1 914 0
	movl	12(%ebp), %eax
	movzbl	(%eax), %eax
	movb	%al, -13(%ebp)
	.loc 1 916 0
	movb	$1, -16(%ebp)
	jmp	L157
L158:
	.loc 1 918 0 discriminator 3
	movzbl	-16(%ebp), %edx
	movzbl	-17(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_PowerGF
	movzbl	%al, %edx
	movzbl	-16(%ebp), %ecx
	movl	12(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	20(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movzbl	%al, %edx
	movzbl	-13(%ebp), %eax
	movl	24(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_AddGF
	movb	%al, -13(%ebp)
	.loc 1 916 0 discriminator 3
	movzbl	-16(%ebp), %eax
	addl	$1, %eax
	movb	%al, -16(%ebp)
L157:
	.loc 1 916 0 is_stmt 0 discriminator 1
	movzbl	-16(%ebp), %edx
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	addl	$1, %eax
	cmpl	%eax, %edx
	jl	L158
	.loc 1 921 0 is_stmt 1
	movb	$1, -14(%ebp)
	.loc 1 923 0
	movb	$0, -16(%ebp)
	jmp	L159
L161:
	.loc 1 925 0
	movzbl	-15(%ebp), %eax
	cmpb	-16(%ebp), %al
	je	L160
	.loc 1 927 0
	movzbl	-16(%ebp), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-17(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movzbl	%al, %eax
	movl	24(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	_AddGF
	movzbl	%al, %edx
	movzbl	-14(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movb	%al, -14(%ebp)
L160:
	.loc 1 923 0 discriminator 2
	movzbl	-16(%ebp), %eax
	addl	$1, %eax
	movb	%al, -16(%ebp)
L159:
	.loc 1 923 0 is_stmt 0 discriminator 1
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	cmpb	-16(%ebp), %al
	ja	L161
	.loc 1 931 0 is_stmt 1
	movzbl	-15(%ebp), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movzbl	-14(%ebp), %eax
	movl	$1, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cwtl
	movl	20(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$2, (%esp)
	call	_PowerGF
	movzbl	%al, %edx
	movzbl	-13(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_MultiplyGF
	movb	%al, (%ebx)
L156:
	.loc 1 909 0 discriminator 2
	movzbl	-15(%ebp), %eax
	addl	$1, %eax
	movb	%al, -15(%ebp)
L155:
	.loc 1 909 0 is_stmt 0 discriminator 1
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	cmpb	-15(%ebp), %al
	ja	L162
	.loc 1 905 0 is_stmt 1
	jmp	L163
L154:
	.loc 1 937 0
	movl	$1, -12(%ebp)
L163:
	.loc 1 940 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 941 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE36:
	.def	_ErrorCorrector;	.scl	3;	.type	32;	.endef
_ErrorCorrector:
LFB37:
	.loc 1 957 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 958 0
	movl	$0, -12(%ebp)
	.loc 1 961 0
	cmpl	$0, 8(%ebp)
	je	L166
	.loc 1 961 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L166
	.loc 1 961 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L166
	.loc 1 961 0 discriminator 3
	cmpl	$0, 20(%ebp)
	je	L166
	.loc 1 961 0 discriminator 4
	cmpl	$0, 24(%ebp)
	je	L166
	.loc 1 963 0 is_stmt 1
	movb	$0, -13(%ebp)
	jmp	L167
L169:
	.loc 1 965 0
	movzbl	-13(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L168
	.loc 1 967 0
	movzbl	-13(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movzbl	-13(%ebp), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-13(%ebp), %ecx
	movl	12(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	leal	-1(%eax), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	24(%ebp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_AddGF
	movb	%al, (%ebx)
L168:
	.loc 1 963 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L167:
	.loc 1 963 0 is_stmt 0 discriminator 1
	movl	20(%ebp), %eax
	movzbl	6(%eax), %eax
	cmpb	-13(%ebp), %al
	ja	L169
	.loc 1 961 0 is_stmt 1
	jmp	L170
L166:
	.loc 1 973 0
	movl	$1, -12(%ebp)
L170:
	.loc 1 976 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 977 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE37:
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/error.h"
	.file 7 "src/memory.h"
	.file 8 "src/reed_solomon.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x1549
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\reed_solomon.c\0"
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
	.long	0x14f
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x14f
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xb9
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x14f
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xb9
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xb9
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xb9
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xb9
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x14f
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xc0
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xc8
	.uleb128 0x7
	.long	0x155
	.long	0x16c
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x161
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x19b
	.uleb128 0xa
	.long	0x187
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x6
	.ascii "int16_t\0"
	.byte	0x3
	.byte	0x3c
	.long	0x1bb
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x6
	.ascii "uint16_t\0"
	.byte	0x3
	.byte	0x3d
	.long	0x86
	.uleb128 0x6
	.ascii "uint32_t\0"
	.byte	0x3
	.byte	0x3f
	.long	0x76
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xb9
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x21c
	.uleb128 0x5
	.byte	0x4
	.long	0x14f
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xb9
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xb9
	.uleb128 0x7
	.long	0x14f
	.long	0x252
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x247
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x4
	.byte	0xfa
	.long	0x76
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x76
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x76
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x76
	.uleb128 0xb
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb9
	.uleb128 0xb
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb9
	.uleb128 0xb
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x9c
	.uleb128 0x7
	.long	0x14f
	.long	0x2e8
	.uleb128 0xc
	.long	0x2e8
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
	.long	0x2d8
	.uleb128 0xb
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xb9
	.uleb128 0xb
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x9c
	.uleb128 0xb
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2d8
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
	.long	0x76
	.byte	0x6
	.byte	0x1b
	.long	0x4fd
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
	.ascii "ERR_NUM\0"
	.byte	0x12
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x6
	.byte	0x30
	.long	0x357
	.uleb128 0xd
	.byte	0x4
	.long	0x76
	.byte	0x7
	.byte	0x1d
	.long	0x556
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
	.long	0x50c
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x24
	.long	0x5a7
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x26
	.long	0x5a7
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x27
	.long	0x1d8
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x28
	.long	0x556
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x187
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x29
	.long	0x56b
	.uleb128 0xa
	.long	0x5ad
	.uleb128 0xd
	.byte	0x4
	.long	0x76
	.byte	0x8
	.byte	0x1d
	.long	0x5f6
	.uleb128 0xe
	.ascii "RS_GF_DEGREE_4\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "RS_GF_DEGREE_8\0"
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "rs_gf_degree_t\0"
	.byte	0x8
	.byte	0x20
	.long	0x5c7
	.uleb128 0x3
	.ascii "_rs_par_t\0"
	.byte	0x10
	.byte	0x8
	.byte	0x32
	.long	0x671
	.uleb128 0x4
	.ascii "m\0"
	.byte	0x8
	.byte	0x34
	.long	0x5f6
	.byte	0
	.uleb128 0x4
	.ascii "kSh\0"
	.byte	0x8
	.byte	0x35
	.long	0x187
	.byte	0x4
	.uleb128 0x4
	.ascii "nSh\0"
	.byte	0x8
	.byte	0x36
	.long	0x187
	.byte	0x5
	.uleb128 0x4
	.ascii "t\0"
	.byte	0x8
	.byte	0x37
	.long	0x187
	.byte	0x6
	.uleb128 0x4
	.ascii "kUn\0"
	.byte	0x8
	.byte	0x38
	.long	0x1c8
	.byte	0x8
	.uleb128 0x4
	.ascii "nUn\0"
	.byte	0x8
	.byte	0x39
	.long	0x1c8
	.byte	0xa
	.uleb128 0x4
	.ascii "dimGF\0"
	.byte	0x8
	.byte	0x3a
	.long	0x1c8
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "rs_par_t\0"
	.byte	0x8
	.byte	0x3b
	.long	0x60c
	.uleb128 0xa
	.long	0x671
	.uleb128 0x7
	.long	0x196
	.long	0x696
	.uleb128 0xc
	.long	0x2e8
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.long	0x686
	.uleb128 0xf
	.ascii "PrimPolyGF4\0"
	.byte	0x1
	.byte	0x17
	.long	0x696
	.uleb128 0x5
	.byte	0x3
	.long	_PrimPolyGF4
	.uleb128 0x7
	.long	0x196
	.long	0x6c4
	.uleb128 0xc
	.long	0x2e8
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.long	0x6b4
	.uleb128 0xf
	.ascii "PrimPolyGF8\0"
	.byte	0x1
	.byte	0x18
	.long	0x6c4
	.uleb128 0x5
	.byte	0x3
	.long	_PrimPolyGF8
	.uleb128 0xd
	.byte	0x4
	.long	0x76
	.byte	0x1
	.byte	0x21
	.long	0x728
	.uleb128 0xe
	.ascii "RS_TABLE_IDX_BIT\0"
	.byte	0
	.uleb128 0xe
	.ascii "RS_TABLE_IDX_SYM\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "RS_TABLE_IDX_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.ascii "_rs_encoder_info_t\0"
	.byte	0x8
	.byte	0x1
	.byte	0x27
	.long	0x76a
	.uleb128 0x4
	.ascii "pPrimPoly\0"
	.byte	0x1
	.byte	0x29
	.long	0x76a
	.byte	0
	.uleb128 0x4
	.ascii "lenPrimPoly\0"
	.byte	0x1
	.byte	0x2a
	.long	0x187
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x196
	.uleb128 0x6
	.ascii "rs_encoder_info_t\0"
	.byte	0x1
	.byte	0x2b
	.long	0x728
	.uleb128 0x10
	.ascii "ErrorCorrector\0"
	.byte	0x1
	.word	0x3bc
	.long	0x4fd
	.long	LFB37
	.long	LFE37-LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x81d
	.uleb128 0x11
	.ascii "ioSymbs\0"
	.byte	0x1
	.word	0x3bc
	.long	0x5a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.word	0x3bc
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.ascii "errMag\0"
	.byte	0x1
	.word	0x3bc
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x3bc
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x3bc
	.long	0x823
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x13
	.secrel32	LASF3
	.byte	0x1
	.word	0x3be
	.long	0x4fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x3bf
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x681
	.uleb128 0x5
	.byte	0x4
	.long	0x686
	.uleb128 0x10
	.ascii "ForneyAlgorithm\0"
	.byte	0x1
	.word	0x382
	.long	0x4fd
	.long	LFB36
	.long	LFE36-LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x8fb
	.uleb128 0x11
	.ascii "errMag\0"
	.byte	0x1
	.word	0x382
	.long	0x5a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "omega\0"
	.byte	0x1
	.word	0x382
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.word	0x382
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x382
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x382
	.long	0x823
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x13
	.secrel32	LASF3
	.byte	0x1
	.word	0x384
	.long	0x4fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "root\0"
	.byte	0x1
	.word	0x385
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x14
	.ascii "numer\0"
	.byte	0x1
	.word	0x386
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x14
	.ascii "denom\0"
	.byte	0x1
	.word	0x386
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x14
	.ascii "i\0"
	.byte	0x1
	.word	0x387
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x387
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.ascii "KeyAlgorithm\0"
	.byte	0x1
	.word	0x356
	.long	0x4fd
	.long	LFB35
	.long	LFE35-LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0x9bf
	.uleb128 0x11
	.ascii "omega\0"
	.byte	0x1
	.word	0x356
	.long	0x5a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF4
	.byte	0x1
	.word	0x356
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.secrel32	LASF5
	.byte	0x1
	.word	0x356
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x356
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x356
	.long	0x823
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x13
	.secrel32	LASF3
	.byte	0x1
	.word	0x358
	.long	0x4fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "tmpOmega\0"
	.byte	0x1
	.word	0x359
	.long	0x9bf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.uleb128 0x14
	.ascii "tmpSyndr\0"
	.byte	0x1
	.word	0x35a
	.long	0x9d2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.uleb128 0x14
	.ascii "i\0"
	.byte	0x1
	.word	0x35b
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x35b
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x9d2
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x9e5
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.byte	0
	.uleb128 0x10
	.ascii "ChienAlgorithm\0"
	.byte	0x1
	.word	0x327
	.long	0x4fd
	.long	LFB34
	.long	LFE34-LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0xa8f
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.word	0x327
	.long	0x5a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF5
	.byte	0x1
	.word	0x327
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x327
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x327
	.long	0x823
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x13
	.secrel32	LASF3
	.byte	0x1
	.word	0x329
	.long	0x4fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "idx\0"
	.byte	0x1
	.word	0x32a
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x14
	.ascii "root\0"
	.byte	0x1
	.word	0x32b
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x14
	.ascii "i\0"
	.byte	0x1
	.word	0x32c
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x32c
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.ascii "GetDiscrepancy\0"
	.byte	0x1
	.word	0x30a
	.long	0x1ac
	.long	LFB33
	.long	LFE33-LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0xb31
	.uleb128 0x12
	.secrel32	LASF4
	.byte	0x1
	.word	0x30a
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF5
	.byte	0x1
	.word	0x30a
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.ascii "errNum\0"
	.byte	0x1
	.word	0x30a
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii "iter\0"
	.byte	0x1
	.word	0x30a
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x30a
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x30a
	.long	0x823
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x14
	.ascii "delta\0"
	.byte	0x1
	.word	0x30d
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x30e
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -11
	.byte	0
	.uleb128 0x10
	.ascii "BerlekampMasseyAlgorithm\0"
	.byte	0x1
	.word	0x2c1
	.long	0x4fd
	.long	LFB32
	.long	LFE32-LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0xc2e
	.uleb128 0x12
	.secrel32	LASF5
	.byte	0x1
	.word	0x2c1
	.long	0x5a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF4
	.byte	0x1
	.word	0x2c1
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x2c1
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x2c1
	.long	0x823
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x13
	.secrel32	LASF3
	.byte	0x1
	.word	0x2c3
	.long	0x4fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.ascii "curErr\0"
	.byte	0x1
	.word	0x2c4
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -38
	.uleb128 0x14
	.ascii "nextErr\0"
	.byte	0x1
	.word	0x2c5
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x14
	.ascii "delta\0"
	.byte	0x1
	.word	0x2c6
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -62
	.uleb128 0x14
	.ascii "h\0"
	.byte	0x1
	.word	0x2c7
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.ascii "tmpSigma\0"
	.byte	0x1
	.word	0x2c8
	.long	0xc2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.uleb128 0x14
	.ascii "tau\0"
	.byte	0x1
	.word	0x2c9
	.long	0xc41
	.uleb128 0x3
	.byte	0x91
	.sleb128 -60
	.byte	0x6
	.uleb128 0x14
	.ascii "i\0"
	.byte	0x1
	.word	0x2ca
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -41
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x2ca
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -42
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0xc41
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0xc54
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -56
	.byte	0x6
	.byte	0
	.uleb128 0x10
	.ascii "GetSyndrome\0"
	.byte	0x1
	.word	0x297
	.long	0xcf3
	.long	LFB31
	.long	LFE31-LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0xcf3
	.uleb128 0x11
	.ascii "cwSymbs\0"
	.byte	0x1
	.word	0x297
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF4
	.byte	0x1
	.word	0x297
	.long	0x5a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x297
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x297
	.long	0x823
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x14
	.ascii "i\0"
	.byte	0x1
	.word	0x299
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x29a
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.ascii "sum\0"
	.byte	0x1
	.word	0x29b
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x14
	.ascii "errFlag\0"
	.byte	0x1
	.word	0x29c
	.long	0xcf3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x16
	.ascii "PowerGF\0"
	.byte	0x1
	.word	0x272
	.long	0x187
	.long	LFB30
	.long	LFE30-LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0xd72
	.uleb128 0x11
	.ascii "symbBase\0"
	.byte	0x1
	.word	0x272
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii "exp\0"
	.byte	0x1
	.word	0x272
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x272
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.ascii "symbRes\0"
	.byte	0x1
	.word	0x274
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x14
	.ascii "tmpVal\0"
	.byte	0x1
	.word	0x275
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.ascii "MultiplyGF\0"
	.byte	0x1
	.word	0x258
	.long	0x187
	.long	LFB29
	.long	LFE29-LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0xdd8
	.uleb128 0x11
	.ascii "symbA\0"
	.byte	0x1
	.word	0x258
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii "symbB\0"
	.byte	0x1
	.word	0x258
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x258
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.ascii "symbRes\0"
	.byte	0x1
	.word	0x25a
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x16
	.ascii "AddGF\0"
	.byte	0x1
	.word	0x245
	.long	0x187
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0xe3a
	.uleb128 0x11
	.ascii "symbA\0"
	.byte	0x1
	.word	0x245
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii "symbB\0"
	.byte	0x1
	.word	0x245
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x245
	.long	0x823
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.ascii "basisRes\0"
	.byte	0x1
	.word	0x247
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x16
	.ascii "ConvertSy2Bi\0"
	.byte	0x1
	.word	0x236
	.long	0x187
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xe7f
	.uleb128 0x11
	.ascii "inSymb\0"
	.byte	0x1
	.word	0x236
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x236
	.long	0x823
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x16
	.ascii "ConvertBi2Sy\0"
	.byte	0x1
	.word	0x228
	.long	0x187
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xec5
	.uleb128 0x11
	.ascii "inBasis\0"
	.byte	0x1
	.word	0x228
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x228
	.long	0x823
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x16
	.ascii "GetBasis\0"
	.byte	0x1
	.word	0x20f
	.long	0x187
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xf22
	.uleb128 0x11
	.ascii "poly\0"
	.byte	0x1
	.word	0x20f
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x20f
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.ascii "basis\0"
	.byte	0x1
	.word	0x211
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x212
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x16
	.ascii "FindMaxDeg\0"
	.byte	0x1
	.word	0x1f2
	.long	0x1c8
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xf7f
	.uleb128 0x11
	.ascii "poly\0"
	.byte	0x1
	.word	0x1f2
	.long	0x76a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "len\0"
	.byte	0x1
	.word	0x1f2
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.secrel32	LASF6
	.byte	0x1
	.word	0x1f4
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x1f5
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x10
	.ascii "RetrieveMappingTableGF\0"
	.byte	0x1
	.word	0x1b6
	.long	0x4fd
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x1041
	.uleb128 0x11
	.ascii "ioTable\0"
	.byte	0x1
	.word	0x1b6
	.long	0x1051
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x1b6
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.secrel32	LASF3
	.byte	0x1
	.word	0x1b8
	.long	0x4fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "encInfo\0"
	.byte	0x1
	.word	0x1b9
	.long	0x770
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.ascii "quotDeg\0"
	.byte	0x1
	.word	0x1ba
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x13
	.secrel32	LASF6
	.byte	0x1
	.word	0x1bb
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x1bc
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x14
	.ascii "tmpPoly\0"
	.byte	0x1
	.word	0x1bd
	.long	0x1057
	.uleb128 0x3
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.uleb128 0x14
	.ascii "i\0"
	.byte	0x1
	.word	0x1be
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x1051
	.uleb128 0xc
	.long	0x2e8
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x1041
	.uleb128 0x7
	.long	0x187
	.long	0x106a
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.byte	0
	.uleb128 0x10
	.ascii "RetrieveGeneratorPolynomial\0"
	.byte	0x1
	.word	0x187
	.long	0x4fd
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x1116
	.uleb128 0x11
	.ascii "ioBuf\0"
	.byte	0x1
	.word	0x187
	.long	0x5a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "len\0"
	.byte	0x1
	.word	0x187
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x187
	.long	0x823
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x187
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x13
	.secrel32	LASF3
	.byte	0x1
	.word	0x189
	.long	0x4fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "tmpVal\0"
	.byte	0x1
	.word	0x18a
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x14
	.ascii "i\0"
	.byte	0x1
	.word	0x18b
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x18b
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.ascii "RetrievePrimitivePolynomial\0"
	.byte	0x1
	.word	0x15e
	.long	0x4fd
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x1179
	.uleb128 0x11
	.ascii "ioInfo\0"
	.byte	0x1
	.word	0x15e
	.long	0x1179
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x15e
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.secrel32	LASF3
	.byte	0x1
	.word	0x160
	.long	0x4fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x770
	.uleb128 0x17
	.ascii "RcCod_Decoder\0"
	.byte	0x1
	.byte	0xf8
	.long	0x4fd
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x12b5
	.uleb128 0x18
	.secrel32	LASF7
	.byte	0x1
	.byte	0xf8
	.long	0x12b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.secrel32	LASF8
	.byte	0x1
	.byte	0xf8
	.long	0x12bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.secrel32	LASF1
	.byte	0x1
	.byte	0xf8
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.secrel32	LASF3
	.byte	0x1
	.byte	0xfa
	.long	0x4fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xf
	.ascii "numMsg\0"
	.byte	0x1
	.byte	0xfb
	.long	0x196
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.secrel32	LASF2
	.byte	0x1
	.byte	0xfc
	.long	0x12c1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.uleb128 0xf
	.ascii "tmpSymbs\0"
	.byte	0x1
	.byte	0xfd
	.long	0x12da
	.uleb128 0x3
	.byte	0x91
	.sleb128 -56
	.byte	0x6
	.uleb128 0x19
	.secrel32	LASF4
	.byte	0x1
	.byte	0xfe
	.long	0x12ed
	.uleb128 0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x6
	.uleb128 0x19
	.secrel32	LASF5
	.byte	0x1
	.byte	0xff
	.long	0x1300
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0x14
	.ascii "omega\0"
	.byte	0x1
	.word	0x100
	.long	0x1314
	.uleb128 0x4
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.uleb128 0x14
	.ascii "errLocation\0"
	.byte	0x1
	.word	0x101
	.long	0x1328
	.uleb128 0x4
	.byte	0x91
	.sleb128 -88
	.byte	0x6
	.uleb128 0x14
	.ascii "errMagnitude\0"
	.byte	0x1
	.word	0x102
	.long	0x133c
	.uleb128 0x4
	.byte	0x91
	.sleb128 -96
	.byte	0x6
	.uleb128 0x14
	.ascii "curSymb\0"
	.byte	0x1
	.word	0x103
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x14
	.ascii "i\0"
	.byte	0x1
	.word	0x104
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -38
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x104
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -39
	.uleb128 0x14
	.ascii "errFlag\0"
	.byte	0x1
	.word	0x105
	.long	0xcf3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -97
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5c2
	.uleb128 0x5
	.byte	0x4
	.long	0x5ad
	.uleb128 0x7
	.long	0x187
	.long	0x12da
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -44
	.byte	0x6
	.uleb128 0xc
	.long	0x2e8
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x12ed
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x1300
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -60
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x1314
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -68
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x1328
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -76
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x133c
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -84
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x1350
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -92
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.ascii "RcCod_Encoder\0"
	.byte	0x1
	.byte	0x7c
	.long	0x4fd
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x1492
	.uleb128 0x18
	.secrel32	LASF7
	.byte	0x1
	.byte	0x7c
	.long	0x12b5
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.secrel32	LASF8
	.byte	0x1
	.byte	0x7c
	.long	0x12bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.secrel32	LASF1
	.byte	0x1
	.byte	0x7c
	.long	0x81d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.secrel32	LASF3
	.byte	0x1
	.byte	0x7e
	.long	0x4fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xf
	.ascii "numMsg\0"
	.byte	0x1
	.byte	0x7f
	.long	0x196
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.uleb128 0xf
	.ascii "lenGenPoly\0"
	.byte	0x1
	.byte	0x80
	.long	0x196
	.uleb128 0x2
	.byte	0x91
	.sleb128 -46
	.uleb128 0xf
	.ascii "genPoly\0"
	.byte	0x1
	.byte	0x81
	.long	0x1492
	.uleb128 0x3
	.byte	0x91
	.sleb128 -56
	.byte	0x6
	.uleb128 0x19
	.secrel32	LASF2
	.byte	0x1
	.byte	0x82
	.long	0x14a5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x6
	.uleb128 0xf
	.ascii "quotDeg\0"
	.byte	0x1
	.byte	0x83
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -38
	.uleb128 0xf
	.ascii "quotCoef\0"
	.byte	0x1
	.byte	0x84
	.long	0x1c8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -90
	.uleb128 0x19
	.secrel32	LASF6
	.byte	0x1
	.byte	0x85
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xf
	.ascii "j\0"
	.byte	0x1
	.byte	0x86
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -42
	.uleb128 0xf
	.ascii "inSymbs\0"
	.byte	0x1
	.byte	0x87
	.long	0x14be
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0xf
	.ascii "tmpPoly\0"
	.byte	0x1
	.byte	0x88
	.long	0x14d2
	.uleb128 0x4
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.uleb128 0xf
	.ascii "divQuotCoef\0"
	.byte	0x1
	.byte	0x89
	.long	0x14e6
	.uleb128 0x4
	.byte	0x91
	.sleb128 -88
	.byte	0x6
	.uleb128 0xf
	.ascii "curSymb\0"
	.byte	0x1
	.byte	0x8a
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -43
	.uleb128 0xf
	.ascii "i\0"
	.byte	0x1
	.byte	0x8b
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x14a5
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x14be
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -60
	.byte	0x6
	.uleb128 0xc
	.long	0x2e8
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x14d2
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -68
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x14e6
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -76
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0x14fa
	.uleb128 0x15
	.long	0x2e8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -84
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.ascii "RsCod_ListParameters\0"
	.byte	0x1
	.byte	0x51
	.long	0x4fd
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x1546
	.uleb128 0x1a
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x51
	.long	0x1546
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF3
	.byte	0x1
	.byte	0x53
	.long	0x4fd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x671
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.ascii "pParams\0"
LASF8:
	.ascii "outStream\0"
LASF3:
	.ascii "retErr\0"
LASF2:
	.ascii "mapTable\0"
LASF4:
	.ascii "syndrome\0"
LASF0:
	.ascii "errLoc\0"
LASF5:
	.ascii "sigma\0"
LASF7:
	.ascii "inStream\0"
LASF6:
	.ascii "maxDeg\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
