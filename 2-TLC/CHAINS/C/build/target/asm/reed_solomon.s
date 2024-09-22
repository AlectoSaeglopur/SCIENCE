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
	.loc 1 76 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 77 0
	movl	$0, -12(%ebp)
	.loc 1 79 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 81 0
	movl	8(%ebp), %eax
	movl	$8, (%eax)
	.loc 1 82 0
	movl	8(%ebp), %eax
	movb	$-68, 4(%eax)
	.loc 1 83 0
	movl	8(%ebp), %eax
	movb	$-52, 5(%eax)
	.loc 1 84 0
	movl	8(%ebp), %eax
	movzbl	5(%eax), %edx
	movl	8(%ebp), %eax
	movzbl	4(%eax), %eax
	subl	%eax, %edx
	movl	8(%ebp), %eax
	movb	%dl, 6(%eax)
	.loc 1 85 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movw	%dx, 12(%eax)
	.loc 1 86 0
	movl	8(%ebp), %eax
	movzwl	12(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movw	%dx, 10(%eax)
	.loc 1 87 0
	movl	8(%ebp), %eax
	movzwl	10(%eax), %edx
	movl	8(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	subl	%eax, %edx
	movl	8(%ebp), %eax
	movw	%dx, 8(%eax)
	jmp	L3
L2:
	.loc 1 91 0
	movl	$1, -12(%ebp)
L3:
	.loc 1 94 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 95 0
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
	.loc 1 111 0
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
	.loc 1 111 0
	movl	%esp, %eax
	movl	%eax, -92(%ebp)
	.loc 1 112 0
	movl	$0, -28(%ebp)
	.loc 1 113 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	16(%ebp), %edx
	movl	(%edx), %ecx
	movl	16(%ebp), %edx
	movzbl	4(%edx), %edx
	movzbl	%dl, %edx
	movl	%edx, %edi
	imull	%ecx, %edi
	movl	$0, %edx
	divl	%edi
	sall	$3, %eax
	movb	%al, -37(%ebp)
	.loc 1 114 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movb	%al, -38(%ebp)
	.loc 1 115 0
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
	.loc 1 116 0
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
	.loc 1 121 0
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
	.loc 1 122 0
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
	.loc 1 126 0
	cmpl	$0, 8(%ebp)
	je	L6
	.loc 1 126 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L6
	.loc 1 126 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L6
	.loc 1 127 0 is_stmt 1 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 126 0 discriminator 3
	testl	%eax, %eax
	je	L6
	.loc 1 127 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L6
	.loc 1 129 0
	movl	-56(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_RetrieveMappingTableGF
	.loc 1 130 0
	movl	-56(%ebp), %ecx
	movzbl	-38(%ebp), %edx
	movl	-48(%ebp), %eax
	movl	16(%ebp), %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_RetrieveGeneratorPolynomial
	.loc 1 132 0
	movb	$0, -36(%ebp)
	jmp	L7
L28:
	.loc 1 134 0
	movl	16(%ebp), %eax
	movzwl	8(%eax), %eax
	movzwl	%ax, %edx
	movl	-64(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 136 0
	movw	$0, -34(%ebp)
	jmp	L8
L13:
	.loc 1 138 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L9
	.loc 1 140 0
	movzwl	-34(%ebp), %eax
	andl	$1, %eax
	testw	%ax, %ax
	jne	L10
	.loc 1 142 0
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
	jmp	L12
L10:
	.loc 1 146 0
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
	jmp	L12
L9:
	.loc 1 151 0
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
L12:
	.loc 1 153 0 discriminator 2
	movzwl	-34(%ebp), %ebx
	movl	-56(%ebp), %edx
	movzbl	-35(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertBi2Sy
	movl	%eax, %edx
	movl	-64(%ebp), %eax
	movb	%dl, (%eax,%ebx)
	.loc 1 136 0 discriminator 2
	movzwl	-34(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -34(%ebp)
L8:
	.loc 1 136 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	cmpw	-34(%ebp), %ax
	ja	L13
	.loc 1 156 0 is_stmt 1
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %edx
	movl	-72(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 157 0
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
	.loc 1 158 0
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	subl	$1, %eax
	movw	%ax, -32(%ebp)
	.loc 1 159 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	leal	(%eax,%eax), %edx
	movzwl	-32(%ebp), %eax
	subl	%edx, %eax
	movw	%ax, -30(%ebp)
	.loc 1 161 0
	jmp	L14
L19:
	.loc 1 163 0
	movzwl	-32(%ebp), %eax
	movl	-72(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %eax
	movw	%ax, -82(%ebp)
	.loc 1 164 0
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %edx
	movl	-80(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 166 0
	movw	$0, -34(%ebp)
	jmp	L15
L16:
	.loc 1 168 0 discriminator 3
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
	.loc 1 166 0 discriminator 3
	movzwl	-34(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -34(%ebp)
L15:
	.loc 1 166 0 is_stmt 0 discriminator 1
	movzbl	-38(%ebp), %eax
	cmpw	-34(%ebp), %ax
	ja	L16
	.loc 1 171 0 is_stmt 1
	movw	$0, -34(%ebp)
	jmp	L17
L18:
	.loc 1 173 0 discriminator 3
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
	.loc 1 171 0 discriminator 3
	movzwl	-34(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -34(%ebp)
L17:
	.loc 1 171 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	cmpw	-34(%ebp), %ax
	ja	L18
	.loc 1 176 0 is_stmt 1
	movl	16(%ebp), %eax
	movzwl	10(%eax), %eax
	movzwl	%ax, %edx
	movl	-72(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_FindMaxDeg
	movw	%ax, -32(%ebp)
	.loc 1 177 0
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	leal	(%eax,%eax), %edx
	movzwl	-32(%ebp), %eax
	subl	%edx, %eax
	movw	%ax, -30(%ebp)
L14:
	.loc 1 161 0
	cmpw	$0, -30(%ebp)
	jns	L19
	.loc 1 180 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	L20
	.loc 1 182 0
	movw	$0, -34(%ebp)
	jmp	L21
L24:
	.loc 1 184 0
	movzwl	-34(%ebp), %eax
	andl	$1, %eax
	testw	%ax, %ax
	jne	L22
	.loc 1 186 0
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
	.loc 1 187 0
	movl	-56(%ebp), %edx
	movzwl	-34(%ebp), %eax
	movl	-72(%ebp), %ecx
	movzbl	(%ecx,%eax), %eax
	movzbl	%al, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertSy2Bi
	sall	$4, %eax
	.loc 1 186 0
	movb	%al, (%ebx)
	jmp	L23
L22:
	.loc 1 192 0
	movl	-56(%ebp), %edx
	movzwl	-34(%ebp), %eax
	movl	-72(%ebp), %ecx
	movzbl	(%ecx,%eax), %eax
	movzbl	%al, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertSy2Bi
	movl	%eax, %esi
	.loc 1 191 0
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
L23:
	.loc 1 182 0 discriminator 2
	movzwl	-34(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -34(%ebp)
L21:
	.loc 1 182 0 is_stmt 0 discriminator 1
	movzwl	-34(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	cmpl	%eax, %edx
	jl	L24
	.loc 1 197 0 is_stmt 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	.loc 1 196 0
	shrb	%al
	movzbl	%al, %ebx
	.loc 1 197 0
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
	.loc 1 196 0
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
	jmp	L25
L20:
	.loc 1 201 0
	movw	$0, -34(%ebp)
	jmp	L26
L27:
	.loc 1 203 0 discriminator 3
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
	.loc 1 204 0 discriminator 3
	movl	-56(%ebp), %edx
	movzwl	-34(%ebp), %eax
	movl	-72(%ebp), %ecx
	movzbl	(%ecx,%eax), %eax
	movzbl	%al, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_ConvertSy2Bi
	.loc 1 203 0 discriminator 3
	movb	%al, (%ebx)
	.loc 1 201 0 discriminator 3
	movzwl	-34(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -34(%ebp)
L26:
	.loc 1 201 0 is_stmt 0 discriminator 1
	movzwl	-34(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	6(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, %eax
	cmpl	%eax, %edx
	jl	L27
	.loc 1 208 0 is_stmt 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	.loc 1 207 0
	movzbl	%al, %ebx
	.loc 1 208 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movzbl	-36(%ebp), %ecx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	%ecx, %eax
	addl	%eax, %edx
	.loc 1 207 0
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
L25:
	.loc 1 132 0 discriminator 2
	movzbl	-36(%ebp), %eax
	addl	$1, %eax
	movb	%al, -36(%ebp)
L7:
	.loc 1 132 0 is_stmt 0 discriminator 1
	movzbl	-36(%ebp), %eax
	cmpb	-37(%ebp), %al
	jb	L28
	.loc 1 126 0 is_stmt 1
	jmp	L29
L6:
	.loc 1 214 0
	movl	$1, -28(%ebp)
L29:
	.loc 1 217 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	-92(%ebp), %esp
	.loc 1 218 0
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
	.def	_RetrievePrimitivePolynomial;	.scl	3;	.type	32;	.endef
_RetrievePrimitivePolynomial:
LFB20:
	.loc 1 235 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 236 0
	movl	$0, -12(%ebp)
	.loc 1 238 0
	cmpl	$0, 8(%ebp)
	je	L32
	.loc 1 238 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L32
	.loc 1 240 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	je	L34
	cmpl	$8, %eax
	je	L35
	jmp	L39
L34:
	.loc 1 243 0
	movl	8(%ebp), %eax
	movl	$_PrimPolyGF4, (%eax)
	.loc 1 244 0
	movl	8(%ebp), %eax
	movb	$2, 4(%eax)
	.loc 1 245 0
	jmp	L36
L35:
	.loc 1 248 0
	movl	8(%ebp), %eax
	movl	$_PrimPolyGF8, (%eax)
	.loc 1 249 0
	movl	8(%ebp), %eax
	movb	$4, 4(%eax)
	.loc 1 250 0
	jmp	L36
L39:
	.loc 1 253 0
	movl	$15, -12(%ebp)
	.loc 1 254 0
	nop
L36:
	.loc 1 256 0
	jmp	L37
L32:
	.loc 1 259 0
	movl	$1, -12(%ebp)
L37:
	.loc 1 262 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 263 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.def	_RetrieveGeneratorPolynomial;	.scl	3;	.type	32;	.endef
_RetrieveGeneratorPolynomial:
LFB21:
	.loc 1 276 0
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
	.loc 1 277 0
	movl	$0, -12(%ebp)
	.loc 1 281 0
	cmpl	$0, 8(%ebp)
	je	L41
	.loc 1 283 0
	movzbl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 285 0
	movl	8(%ebp), %eax
	movb	$2, (%eax)
	.loc 1 286 0
	movl	8(%ebp), %eax
	addl	$1, %eax
	movb	$1, (%eax)
	.loc 1 288 0
	movw	$2, -14(%ebp)
	jmp	L42
L47:
	.loc 1 290 0
	movzbl	-28(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -16(%ebp)
	jmp	L43
L46:
	.loc 1 292 0
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
	.loc 1 293 0
	cmpw	$0, -16(%ebp)
	jle	L44
	.loc 1 295 0
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
	jmp	L45
L44:
	.loc 1 299 0
	movswl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movzbl	-17(%ebp), %eax
	movb	%al, (%edx)
L45:
	.loc 1 290 0 discriminator 2
	movzwl	-16(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -16(%ebp)
L43:
	.loc 1 290 0 is_stmt 0 discriminator 1
	cmpw	$0, -16(%ebp)
	jns	L46
	.loc 1 288 0 is_stmt 1 discriminator 2
	movzwl	-14(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -14(%ebp)
L42:
	.loc 1 288 0 is_stmt 0 discriminator 1
	movswl	-14(%ebp), %edx
	movzbl	-28(%ebp), %eax
	cmpl	%eax, %edx
	jl	L47
	jmp	L48
L41:
	.loc 1 306 0 is_stmt 1
	movl	$1, -12(%ebp)
L48:
	.loc 1 309 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 310 0
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.def	_RetrieveMappingTableGF;	.scl	3;	.type	32;	.endef
_RetrieveMappingTableGF:
LFB22:
	.loc 1 323 0
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
	.loc 1 323 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 324 0
	movl	$0, -12(%ebp)
	.loc 1 329 0
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
	.loc 1 332 0
	cmpl	$0, 8(%ebp)
	je	L51
	.loc 1 332 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L51
	.loc 1 334 0 is_stmt 1
	movw	$0, -18(%ebp)
	jmp	L52
L53:
	.loc 1 336 0 discriminator 3
	movzwl	-18(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	$2, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 334 0 discriminator 3
	movzwl	-18(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -18(%ebp)
L52:
	.loc 1 334 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzwl	12(%eax), %eax
	cmpw	-18(%ebp), %ax
	ja	L53
	.loc 1 338 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_RetrievePrimitivePolynomial
	.loc 1 340 0
	movw	$1, -18(%ebp)
	jmp	L54
L59:
	.loc 1 342 0
	movl	12(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %edx
	movl	-28(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 343 0
	movzwl	-18(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -16(%ebp)
	.loc 1 344 0
	movzwl	-16(%ebp), %eax
	movl	-28(%ebp), %edx
	movb	$1, (%edx,%eax)
	.loc 1 345 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movzwl	-16(%ebp), %eax
	subl	%edx, %eax
	movw	%ax, -14(%ebp)
	.loc 1 347 0
	jmp	L55
L58:
	.loc 1 349 0
	movzwl	-16(%ebp), %eax
	movl	-28(%ebp), %edx
	movb	$0, (%edx,%eax)
	.loc 1 351 0
	movb	$0, -19(%ebp)
	jmp	L56
L57:
	.loc 1 353 0 discriminator 3
	movswl	-14(%ebp), %edx
	movl	-36(%ebp), %ecx
	movzbl	-19(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	leal	(%edx,%eax), %ecx
	.loc 1 354 0 discriminator 3
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
	.loc 1 353 0 discriminator 3
	movl	%eax, %edx
	movl	-28(%ebp), %eax
	movb	%dl, (%eax,%ecx)
	.loc 1 351 0 discriminator 3
	movzbl	-19(%ebp), %eax
	addl	$1, %eax
	movb	%al, -19(%ebp)
L56:
	.loc 1 351 0 is_stmt 0 discriminator 1
	movzbl	-32(%ebp), %eax
	cmpb	-19(%ebp), %al
	ja	L57
	.loc 1 356 0 is_stmt 1
	movl	12(%ebp), %eax
	movzwl	12(%eax), %eax
	movzwl	%ax, %edx
	movl	-28(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_FindMaxDeg
	movw	%ax, -16(%ebp)
	.loc 1 357 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movzwl	-16(%ebp), %eax
	subl	%edx, %eax
	movw	%ax, -14(%ebp)
L55:
	.loc 1 347 0
	cmpw	$0, -14(%ebp)
	jns	L58
	.loc 1 360 0 discriminator 2
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
	.loc 1 361 0 discriminator 2
	movzwl	-18(%ebp), %eax
	movl	8(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %eax
	leal	(%eax,%eax), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzwl	-18(%ebp), %edx
	movb	%dl, 1(%eax)
	.loc 1 340 0 discriminator 2
	movzwl	-18(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -18(%ebp)
L54:
	.loc 1 340 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzwl	12(%eax), %eax
	cmpw	-18(%ebp), %ax
	ja	L59
	.loc 1 332 0 is_stmt 1
	jmp	L60
L51:
	.loc 1 366 0
	movl	$1, -12(%ebp)
L60:
	.loc 1 369 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 370 0
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
LFE22:
	.def	_FindMaxDeg;	.scl	3;	.type	32;	.endef
_FindMaxDeg:
LFB23:
	.loc 1 382 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	12(%ebp), %eax
	movw	%ax, -20(%ebp)
	.loc 1 386 0
	cmpl	$0, 8(%ebp)
	je	L63
	.loc 1 388 0
	movzwl	-20(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -4(%ebp)
L65:
	.loc 1 390 0
	movzwl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	L64
	.loc 1 392 0
	movzwl	-4(%ebp), %eax
	movw	%ax, -2(%ebp)
	.loc 1 393 0
	jmp	L63
L64:
	.loc 1 388 0
	movzwl	-4(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -4(%ebp)
	.loc 1 390 0
	jmp	L65
L63:
	.loc 1 398 0
	movzwl	-2(%ebp), %eax
	.loc 1 399 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	_GetBasis;	.scl	3;	.type	32;	.endef
_GetBasis:
LFB24:
	.loc 1 411 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 412 0
	movb	$0, -1(%ebp)
	.loc 1 415 0
	cmpl	$0, 8(%ebp)
	je	L68
	.loc 1 417 0
	movb	$0, -2(%ebp)
	jmp	L69
L70:
	.loc 1 419 0 discriminator 3
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
	.loc 1 417 0 discriminator 3
	movzbl	-2(%ebp), %eax
	addl	$1, %eax
	movb	%al, -2(%ebp)
L69:
	.loc 1 417 0 is_stmt 0 discriminator 1
	movzbl	-2(%ebp), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jb	L70
L68:
	.loc 1 423 0 is_stmt 1
	movzbl	-1(%ebp), %eax
	.loc 1 424 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.def	_ConvertBi2Sy;	.scl	3;	.type	32;	.endef
_ConvertBi2Sy:
LFB25:
	.loc 1 436 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	.loc 1 437 0
	movzbl	-4(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	.loc 1 438 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.def	_ConvertSy2Bi;	.scl	3;	.type	32;	.endef
_ConvertSy2Bi:
LFB26:
	.loc 1 450 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movb	%al, -4(%ebp)
	.loc 1 451 0
	movzbl	-4(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	.loc 1 452 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.def	_AddGF;	.scl	3;	.type	32;	.endef
_AddGF:
LFB27:
	.loc 1 465 0
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
	.loc 1 468 0
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
	.loc 1 470 0
	movzbl	-1(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movzbl	1(%eax), %eax
	.loc 1 471 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.def	_MultiplyGF;	.scl	3;	.type	32;	.endef
_MultiplyGF:
LFB28:
	.loc 1 485 0
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
	.loc 1 486 0
	movb	$0, -1(%ebp)
	.loc 1 488 0
	cmpb	$0, -20(%ebp)
	je	L79
	.loc 1 488 0 is_stmt 0 discriminator 1
	cmpb	$0, -24(%ebp)
	je	L79
	.loc 1 490 0 is_stmt 1
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
L79:
	.loc 1 493 0
	movzbl	-1(%ebp), %eax
	.loc 1 494 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.def	_PowerGF;	.scl	3;	.type	32;	.endef
_PowerGF:
LFB29:
	.loc 1 511 0
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
	.loc 1 515 0
	cmpb	$0, -20(%ebp)
	je	L82
	.loc 1 515 0 is_stmt 0 discriminator 1
	cmpb	$1, -20(%ebp)
	jne	L83
L82:
	.loc 1 517 0 is_stmt 1
	movzbl	-20(%ebp), %eax
	movb	%al, -1(%ebp)
	jmp	L84
L83:
	.loc 1 521 0
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
	.loc 1 522 0
	cmpw	$0, -24(%ebp)
	jns	L85
	.loc 1 524 0
	movzwl	-4(%ebp), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movzwl	12(%eax), %eax
	addl	%edx, %eax
	movb	%al, -1(%ebp)
	jmp	L84
L85:
	.loc 1 528 0
	movzwl	-4(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L84:
	.loc 1 532 0
	movzbl	-1(%ebp), %eax
	.loc 1 533 0
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
	.file 6 "src/error.h"
	.file 7 "src/memory.h"
	.file 8 "src/reed_solomon.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xdf4
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
	.long	0x4cd
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
	.ascii "ERR_NUM\0"
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x6
	.byte	0x2e
	.long	0x357
	.uleb128 0xd
	.byte	0x4
	.long	0x76
	.byte	0x7
	.byte	0x1d
	.long	0x526
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
	.long	0x4dc
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x24
	.long	0x577
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x26
	.long	0x577
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
	.long	0x526
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x187
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x29
	.long	0x53b
	.uleb128 0xa
	.long	0x57d
	.uleb128 0xd
	.byte	0x4
	.long	0x76
	.byte	0x8
	.byte	0x1d
	.long	0x5c6
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
	.long	0x597
	.uleb128 0x3
	.ascii "_rs_par_t\0"
	.byte	0x10
	.byte	0x8
	.byte	0x32
	.long	0x641
	.uleb128 0x4
	.ascii "m\0"
	.byte	0x8
	.byte	0x34
	.long	0x5c6
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
	.long	0x5dc
	.uleb128 0xa
	.long	0x641
	.uleb128 0x7
	.long	0x196
	.long	0x666
	.uleb128 0xc
	.long	0x2e8
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.long	0x656
	.uleb128 0xf
	.ascii "PrimPolyGF4\0"
	.byte	0x1
	.byte	0x17
	.long	0x666
	.uleb128 0x5
	.byte	0x3
	.long	_PrimPolyGF4
	.uleb128 0x7
	.long	0x196
	.long	0x694
	.uleb128 0xc
	.long	0x2e8
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.long	0x684
	.uleb128 0xf
	.ascii "PrimPolyGF8\0"
	.byte	0x1
	.byte	0x18
	.long	0x694
	.uleb128 0x5
	.byte	0x3
	.long	_PrimPolyGF8
	.uleb128 0xd
	.byte	0x4
	.long	0x76
	.byte	0x1
	.byte	0x21
	.long	0x6f8
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
	.long	0x73a
	.uleb128 0x4
	.ascii "pPrimPoly\0"
	.byte	0x1
	.byte	0x29
	.long	0x73a
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
	.long	0x6f8
	.uleb128 0x10
	.ascii "PowerGF\0"
	.byte	0x1
	.word	0x1fe
	.long	0x187
	.long	LFB29
	.long	LFE29-LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x7cf
	.uleb128 0x11
	.ascii "symbBase\0"
	.byte	0x1
	.word	0x1fe
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii "exp\0"
	.byte	0x1
	.word	0x1fe
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.word	0x1fe
	.long	0x7cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "symbRes\0"
	.byte	0x1
	.word	0x200
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x13
	.ascii "tmpVal\0"
	.byte	0x1
	.word	0x201
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x651
	.uleb128 0x10
	.ascii "MultiplyGF\0"
	.byte	0x1
	.word	0x1e4
	.long	0x187
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x83b
	.uleb128 0x11
	.ascii "symbA\0"
	.byte	0x1
	.word	0x1e4
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii "symbB\0"
	.byte	0x1
	.word	0x1e4
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.word	0x1e4
	.long	0x7cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "symbRes\0"
	.byte	0x1
	.word	0x1e6
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x10
	.ascii "AddGF\0"
	.byte	0x1
	.word	0x1d0
	.long	0x187
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x89d
	.uleb128 0x11
	.ascii "symbA\0"
	.byte	0x1
	.word	0x1d0
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii "symbB\0"
	.byte	0x1
	.word	0x1d0
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x1d0
	.long	0x89d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.ascii "basisRes\0"
	.byte	0x1
	.word	0x1d2
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x656
	.uleb128 0x10
	.ascii "ConvertSy2Bi\0"
	.byte	0x1
	.word	0x1c1
	.long	0x187
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x8e8
	.uleb128 0x11
	.ascii "inSymb\0"
	.byte	0x1
	.word	0x1c1
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x1c1
	.long	0x89d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x10
	.ascii "ConvertBi2Sy\0"
	.byte	0x1
	.word	0x1b3
	.long	0x187
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x92e
	.uleb128 0x11
	.ascii "inBasis\0"
	.byte	0x1
	.word	0x1b3
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x1b3
	.long	0x89d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x10
	.ascii "GetBasis\0"
	.byte	0x1
	.word	0x19a
	.long	0x187
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x98b
	.uleb128 0x11
	.ascii "poly\0"
	.byte	0x1
	.word	0x19a
	.long	0x73a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.word	0x19a
	.long	0x7cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.ascii "basis\0"
	.byte	0x1
	.word	0x19c
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.word	0x19d
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x10
	.ascii "FindMaxDeg\0"
	.byte	0x1
	.word	0x17d
	.long	0x1c8
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x9e8
	.uleb128 0x11
	.ascii "poly\0"
	.byte	0x1
	.word	0x17d
	.long	0x73a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "len\0"
	.byte	0x1
	.word	0x17d
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.secrel32	LASF2
	.byte	0x1
	.word	0x17f
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.word	0x180
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.ascii "RetrieveMappingTableGF\0"
	.byte	0x1
	.word	0x142
	.long	0x4cd
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xaaa
	.uleb128 0x11
	.ascii "ioTable\0"
	.byte	0x1
	.word	0x142
	.long	0xaba
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.word	0x142
	.long	0x7cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.secrel32	LASF3
	.byte	0x1
	.word	0x144
	.long	0x4cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii "encInfo\0"
	.byte	0x1
	.word	0x145
	.long	0x740
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.ascii "quotDeg\0"
	.byte	0x1
	.word	0x146
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x14
	.secrel32	LASF2
	.byte	0x1
	.word	0x147
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.word	0x148
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x13
	.ascii "tmpPoly\0"
	.byte	0x1
	.word	0x149
	.long	0xac0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.uleb128 0x13
	.ascii "i\0"
	.byte	0x1
	.word	0x14a
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0xaba
	.uleb128 0xc
	.long	0x2e8
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xaaa
	.uleb128 0x7
	.long	0x187
	.long	0xad3
	.uleb128 0x16
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.byte	0
	.uleb128 0x15
	.ascii "RetrieveGeneratorPolynomial\0"
	.byte	0x1
	.word	0x113
	.long	0x4cd
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xb7f
	.uleb128 0x11
	.ascii "ioBuf\0"
	.byte	0x1
	.word	0x113
	.long	0x577
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "len\0"
	.byte	0x1
	.word	0x113
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.secrel32	LASF1
	.byte	0x1
	.word	0x113
	.long	0x89d
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.word	0x113
	.long	0x7cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x14
	.secrel32	LASF3
	.byte	0x1
	.word	0x115
	.long	0x4cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii "tmpVal\0"
	.byte	0x1
	.word	0x116
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x13
	.ascii "i\0"
	.byte	0x1
	.word	0x117
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.word	0x117
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x17
	.ascii "RetrievePrimitivePolynomial\0"
	.byte	0x1
	.byte	0xea
	.long	0x4cd
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xbde
	.uleb128 0x18
	.ascii "ioInfo\0"
	.byte	0x1
	.byte	0xea
	.long	0xbde
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0xea
	.long	0x7cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0xec
	.long	0x4cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x740
	.uleb128 0x1b
	.ascii "RcCod_Encoder\0"
	.byte	0x1
	.byte	0x6e
	.long	0x4cd
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xd31
	.uleb128 0x18
	.ascii "inStream\0"
	.byte	0x1
	.byte	0x6e
	.long	0xd31
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.ascii "outStream\0"
	.byte	0x1
	.byte	0x6e
	.long	0xd37
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0x6e
	.long	0x7cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0x70
	.long	0x4cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xf
	.ascii "numMsg\0"
	.byte	0x1
	.byte	0x71
	.long	0x196
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.uleb128 0xf
	.ascii "lenGenPoly\0"
	.byte	0x1
	.byte	0x72
	.long	0x196
	.uleb128 0x2
	.byte	0x91
	.sleb128 -46
	.uleb128 0xf
	.ascii "genPoly\0"
	.byte	0x1
	.byte	0x73
	.long	0xd3d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -56
	.byte	0x6
	.uleb128 0x1a
	.secrel32	LASF1
	.byte	0x1
	.byte	0x74
	.long	0xd50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x6
	.uleb128 0xf
	.ascii "quotDeg\0"
	.byte	0x1
	.byte	0x75
	.long	0x1ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -38
	.uleb128 0xf
	.ascii "quotCoef\0"
	.byte	0x1
	.byte	0x76
	.long	0x1c8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -90
	.uleb128 0x1a
	.secrel32	LASF2
	.byte	0x1
	.byte	0x77
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xf
	.ascii "j\0"
	.byte	0x1
	.byte	0x78
	.long	0x1c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -42
	.uleb128 0xf
	.ascii "inSymbs\0"
	.byte	0x1
	.byte	0x79
	.long	0xd69
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0xf
	.ascii "tmpPoly\0"
	.byte	0x1
	.byte	0x7a
	.long	0xd7d
	.uleb128 0x4
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.uleb128 0xf
	.ascii "divQuotCoef\0"
	.byte	0x1
	.byte	0x7a
	.long	0xd91
	.uleb128 0x4
	.byte	0x91
	.sleb128 -88
	.byte	0x6
	.uleb128 0xf
	.ascii "curSymb\0"
	.byte	0x1
	.byte	0x7b
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -43
	.uleb128 0xf
	.ascii "i\0"
	.byte	0x1
	.byte	0x7c
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x592
	.uleb128 0x5
	.byte	0x4
	.long	0x57d
	.uleb128 0x7
	.long	0x187
	.long	0xd50
	.uleb128 0x16
	.long	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0xd69
	.uleb128 0x16
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
	.long	0xd7d
	.uleb128 0x16
	.long	0x2e8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -68
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0xd91
	.uleb128 0x16
	.long	0x2e8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -76
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0xda5
	.uleb128 0x16
	.long	0x2e8
	.uleb128 0x4
	.byte	0x91
	.sleb128 -84
	.byte	0x6
	.byte	0
	.uleb128 0x1b
	.ascii "RsCod_ListParameters\0"
	.byte	0x1
	.byte	0x4b
	.long	0x4cd
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xdf1
	.uleb128 0x18
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x4b
	.long	0xdf1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0x4d
	.long	0x4cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x641
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
	.uleb128 0x2117
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
	.uleb128 0x14
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.ascii "maxDeg\0"
LASF1:
	.ascii "mapTable\0"
LASF0:
	.ascii "pParams\0"
LASF3:
	.ascii "retErr\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
