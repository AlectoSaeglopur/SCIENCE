	.file	"modulation.c"
	.text
Ltext0:
	.globl	_Modulation_ListParameters
	.def	_Modulation_ListParameters;	.scl	2;	.type	32;	.endef
_Modulation_ListParameters:
LFB18:
	.file 1 "src/modulation.c"
	.loc 1 43 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 44 0
	movl	$0, -12(%ebp)
	.loc 1 46 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 48 0
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	.loc 1 49 0
	movl	8(%ebp), %eax
	movb	$4, 4(%eax)
	.loc 1 50 0
	movl	8(%ebp), %eax
	movb	$2, 5(%eax)
	.loc 1 51 0
	movl	8(%ebp), %eax
	flds	LC0
	fstps	8(%eax)
	jmp	L3
L2:
	.loc 1 55 0
	movl	$1, -12(%ebp)
L3:
	.loc 1 58 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 59 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_Modulation_Mapper
	.def	_Modulation_Mapper;	.scl	2;	.type	32;	.endef
_Modulation_Mapper:
LFB19:
	.loc 1 72 0
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
	.loc 1 73 0
	movl	$0, -12(%ebp)
	.loc 1 75 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -24(%ebp)
	.loc 1 76 0
	movl	$0, -16(%ebp)
	.loc 1 78 0
	movb	$0, -17(%ebp)
	.loc 1 79 0
	movb	$0, -18(%ebp)
	.loc 1 83 0
	cmpl	$0, 8(%ebp)
	je	L6
	.loc 1 83 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L6
	.loc 1 83 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L6
	.loc 1 85 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-68(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetMappingTable
	.loc 1 87 0
	jmp	L7
L13:
	.loc 1 89 0
	movzbl	-18(%ebp), %eax
	addl	$1, %eax
	movb	%al, -18(%ebp)
	.loc 1 90 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 91 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 92 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-29(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movl	%eax, %ebx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %edx
	movzbl	-18(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orb	%al, -17(%ebp)
	.loc 1 93 0
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	cmpb	-18(%ebp), %al
	jne	L8
	.loc 1 95 0
	movb	$0, -19(%ebp)
	jmp	L9
L12:
	.loc 1 97 0
	movzbl	-19(%ebp), %eax
	movzbl	-68(%ebp,%eax), %eax
	movzbl	%al, %edx
	movsbl	-17(%ebp), %eax
	cmpl	%eax, %edx
	jne	L10
	.loc 1 99 0
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-16(%ebp), %eax
	leal	1(%eax), %ebx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %esi
	movl	%ebx, %eax
	movl	$0, %edx
	divl	%esi
	addl	$536870911, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	movzbl	-19(%ebp), %eax
	movl	-60(%ebp,%eax,8), %edx
	movl	-64(%ebp,%eax,8), %eax
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
	.loc 1 100 0
	jmp	L11
L10:
	.loc 1 95 0 discriminator 2
	movzbl	-19(%ebp), %eax
	addl	$1, %eax
	movb	%al, -19(%ebp)
L9:
	.loc 1 95 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-19(%ebp), %al
	ja	L12
L11:
	.loc 1 103 0 is_stmt 1
	movb	$0, -18(%ebp)
	.loc 1 104 0
	movb	$0, -17(%ebp)
L8:
	.loc 1 106 0
	addl	$1, -16(%ebp)
L7:
	.loc 1 87 0
	movl	-16(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jb	L13
	.loc 1 83 0
	jmp	L14
L6:
	.loc 1 111 0
	movl	$1, -12(%ebp)
L14:
	.loc 1 114 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 115 0
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
	.def	_GetMappingTable;	.scl	3;	.type	32;	.endef
_GetMappingTable:
LFB20:
	.loc 1 133 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 134 0
	movl	$0, -12(%ebp)
	.loc 1 136 0
	cmpl	$0, 8(%ebp)
	je	L17
	.loc 1 136 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L17
	.loc 1 138 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L19
	cmpl	$1, %eax
	je	L20
	jmp	L24
L19:
	.loc 1 141 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetPskTable
	.loc 1 142 0
	jmp	L21
L20:
	.loc 1 145 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetQamTable
	.loc 1 146 0
	jmp	L21
L24:
	.loc 1 149 0
	movl	$8, -12(%ebp)
	.loc 1 150 0
	nop
L21:
	.loc 1 152 0
	jmp	L22
L17:
	.loc 1 155 0
	movl	$1, -12(%ebp)
L22:
	.loc 1 158 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 159 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.def	_GetPskTable;	.scl	3;	.type	32;	.endef
_GetPskTable:
LFB21:
	.loc 1 171 0
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
	.loc 1 171 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 172 0
	movl	$0, -12(%ebp)
	.loc 1 173 0
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	subl	$1, %eax
	movl	%eax, -20(%ebp)
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movl	$16, %edx
	subl	$1, %edx
	addl	%edx, %eax
	movl	$16, %ecx
	movl	$0, %edx
	divl	%ecx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	8(%esp), %eax
	addl	$0, %eax
	movl	%eax, -24(%ebp)
	.loc 1 176 0
	cmpl	$0, 8(%ebp)
	je	L26
	.loc 1 176 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L26
	.loc 1 178 0 is_stmt 1
	movl	-24(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_GetGraySequence
	.loc 1 180 0
	movb	$0, -13(%ebp)
	jmp	L27
L28:
	.loc 1 182 0 discriminator 3
	movzbl	-13(%ebp), %eax
	movzbl	-13(%ebp), %edx
	movl	-24(%ebp), %ecx
	movzbl	(%ecx,%edx), %ecx
	movl	8(%ebp), %edx
	movb	%cl, (%edx,%eax)
	.loc 1 183 0 discriminator 3
	movzbl	-13(%ebp), %ebx
	movl	12(%ebp), %eax
	flds	8(%eax)
	movzbl	-13(%ebp), %eax
	movl	%eax, -32(%ebp)
	fildl	-32(%ebp)
	fldl	LC2
	fmulp	%st, %st(1)
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, -32(%ebp)
	fildl	-32(%ebp)
	fdivrp	%st, %st(1)
	faddp	%st, %st(1)
	fstpl	(%esp)
	call	_cos
	fstps	-28(%ebp)
	flds	-28(%ebp)
	movl	8(%ebp), %eax
	fstps	4(%eax,%ebx,8)
	.loc 1 184 0 discriminator 3
	movzbl	-13(%ebp), %ebx
	movl	12(%ebp), %eax
	flds	8(%eax)
	movzbl	-13(%ebp), %eax
	movl	%eax, -32(%ebp)
	fildl	-32(%ebp)
	fldl	LC2
	fmulp	%st, %st(1)
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, -32(%ebp)
	fildl	-32(%ebp)
	fdivrp	%st, %st(1)
	faddp	%st, %st(1)
	fstpl	(%esp)
	call	_sin
	fstps	-28(%ebp)
	flds	-28(%ebp)
	movl	8(%ebp), %eax
	fstps	8(%eax,%ebx,8)
	.loc 1 180 0 discriminator 3
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L27:
	.loc 1 180 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-13(%ebp), %al
	ja	L28
	.loc 1 176 0 is_stmt 1
	jmp	L29
L26:
	.loc 1 189 0
	movl	$1, -12(%ebp)
L29:
	.loc 1 192 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 193 0
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
LFE21:
	.def	_GetQamTable;	.scl	3;	.type	32;	.endef
_GetQamTable:
LFB22:
	.loc 1 205 0
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
	.loc 1 205 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 206 0
	movl	$0, -12(%ebp)
	.loc 1 207 0
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	subl	$1, %eax
	movl	%eax, -20(%ebp)
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movl	$16, %edx
	subl	$1, %edx
	addl	%edx, %eax
	movl	$16, %ebx
	movl	$0, %edx
	divl	%ebx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	16(%esp), %eax
	addl	$0, %eax
	movl	%eax, -24(%ebp)
	.loc 1 209 0
	movl	12(%ebp), %eax
	movzbl	5(%eax), %eax
	shrb	%al
	movzbl	%al, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	subl	$1, %eax
	movb	%al, -25(%ebp)
	.loc 1 210 0
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movw	%ax, -64(%ebp)
	filds	-64(%ebp)
	fstpl	(%esp)
	call	_sqrt
	fnstcw	-46(%ebp)
	movzwl	-46(%ebp), %eax
	movb	$12, %ah
	movw	%ax, -48(%ebp)
	fldcw	-48(%ebp)
	fistps	-50(%ebp)
	fldcw	-46(%ebp)
	movzwl	-50(%ebp), %eax
	movb	%al, -26(%ebp)
	.loc 1 213 0
	cmpl	$0, 8(%ebp)
	je	L32
	.loc 1 213 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L32
	.loc 1 215 0 is_stmt 1
	movl	-24(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_GetGraySequence
	.loc 1 217 0
	movb	$0, -13(%ebp)
	jmp	L33
L34:
	.loc 1 219 0 discriminator 3
	movzbl	-26(%ebp), %edx
	movzbl	-13(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_div
	movl	%eax, -36(%ebp)
	movl	%edx, -32(%ebp)
	.loc 1 220 0 discriminator 3
	movzbl	-13(%ebp), %eax
	movzbl	-13(%ebp), %edx
	movl	-24(%ebp), %ecx
	movzbl	(%ecx,%edx), %ecx
	movl	8(%ebp), %edx
	movb	%cl, (%edx,%eax)
	.loc 1 221 0 discriminator 3
	movzbl	-13(%ebp), %ebx
	movl	-32(%ebp), %eax
	leal	(%eax,%eax), %edx
	movzbl	-25(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -64(%ebp)
	fildl	-64(%ebp)
	fstpl	-64(%ebp)
	movl	-36(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -56(%ebp)
	fildl	-56(%ebp)
	fstpl	8(%esp)
	fld1
	fchs
	fstpl	(%esp)
	call	_pow
	fmull	-64(%ebp)
	fstps	-44(%ebp)
	flds	-44(%ebp)
	movl	8(%ebp), %eax
	fstps	4(%eax,%ebx,8)
	.loc 1 222 0 discriminator 3
	movzbl	-13(%ebp), %edx
	movzbl	-25(%ebp), %eax
	movl	-36(%ebp), %ecx
	addl	%ecx, %ecx
	subl	%ecx, %eax
	movl	%eax, -64(%ebp)
	fildl	-64(%ebp)
	movl	8(%ebp), %eax
	fstps	8(%eax,%edx,8)
	.loc 1 217 0 discriminator 3
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L33:
	.loc 1 217 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-13(%ebp), %al
	ja	L34
	.loc 1 213 0 is_stmt 1
	jmp	L35
L32:
	.loc 1 227 0
	movl	$1, -12(%ebp)
L35:
	.loc 1 230 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 231 0
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
	.def	_GetGraySequence;	.scl	3;	.type	32;	.endef
_GetGraySequence:
LFB23:
	.loc 1 243 0
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
	.loc 1 244 0
	movl	$0, -12(%ebp)
	.loc 1 250 0
	cmpl	$0, 8(%ebp)
	je	L38
	.loc 1 250 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L38
	.loc 1 252 0 is_stmt 1
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 254 0
	movb	$0, -13(%ebp)
	jmp	L39
L44:
	.loc 1 256 0
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %edx
	movzbl	-13(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movb	%al, -16(%ebp)
	.loc 1 257 0
	movl	12(%ebp), %eax
	movzbl	5(%eax), %eax
	subb	-13(%ebp), %al
	subl	$1, %eax
	movb	%al, -17(%ebp)
	.loc 1 258 0
	movb	$0, -14(%ebp)
	.loc 1 259 0
	movzbl	-16(%ebp), %eax
	shrb	%al
	movb	%al, -15(%ebp)
	.loc 1 260 0
	jmp	L40
L43:
	.loc 1 262 0
	movzbl	-15(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movzbl	-15(%ebp), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-17(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
	.loc 1 263 0
	movzbl	-14(%ebp), %eax
	movzbl	-16(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jge	L41
	.loc 1 265 0
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
	jmp	L42
L41:
	.loc 1 269 0
	movb	$0, -14(%ebp)
	.loc 1 270 0
	movzbl	-16(%ebp), %eax
	addb	%al, -15(%ebp)
L42:
	.loc 1 272 0
	movzbl	-15(%ebp), %eax
	addl	$1, %eax
	movb	%al, -15(%ebp)
L40:
	.loc 1 260 0
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-15(%ebp), %al
	ja	L43
	.loc 1 254 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L39:
	.loc 1 254 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzbl	5(%eax), %eax
	cmpb	-13(%ebp), %al
	ja	L44
	.loc 1 250 0 is_stmt 1
	jmp	L45
L38:
	.loc 1 278 0
	movl	$1, -12(%ebp)
L45:
	.loc 1 281 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 282 0
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
LFE23:
	.section .rdata,"dr"
	.align 4
LC0:
	.long	1061752795
	.align 8
LC2:
	.long	1413754136
	.long	1075388923
	.text
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/system.h"
	.file 7 "src/error.h"
	.file 8 "src/memory.h"
	.file 9 "src/modulation.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xa11
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\modulation.c\0"
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
	.long	0x14d
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x14d
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xb7
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x14d
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xb7
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xb7
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xb7
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xb7
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x14d
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xbe
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xc6
	.uleb128 0x7
	.long	0x153
	.long	0x16a
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x15f
	.uleb128 0x6
	.ascii "int8_t\0"
	.byte	0x3
	.byte	0x3a
	.long	0x184
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x1a2
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x6
	.ascii "uint32_t\0"
	.byte	0x3
	.byte	0x3f
	.long	0x74
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xb7
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x204
	.uleb128 0x5
	.byte	0x4
	.long	0x14d
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xb7
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xb7
	.uleb128 0x7
	.long	0x14d
	.long	0x23a
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x22f
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x4
	.byte	0xfa
	.long	0x74
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x74
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x74
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x74
	.uleb128 0xa
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb7
	.uleb128 0xb
	.byte	0x8
	.byte	0x4
	.word	0x207
	.long	0x2c1
	.uleb128 0xc
	.ascii "quot\0"
	.byte	0x4
	.word	0x207
	.long	0xb7
	.byte	0
	.uleb128 0xc
	.ascii "rem\0"
	.byte	0x4
	.word	0x207
	.long	0xb7
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.ascii "div_t\0"
	.byte	0x4
	.word	0x207
	.long	0x29c
	.uleb128 0xa
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb7
	.uleb128 0xa
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x9a
	.uleb128 0x7
	.long	0x14d
	.long	0x303
	.uleb128 0xe
	.long	0x303
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
	.long	0x2f3
	.uleb128 0xa
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xb7
	.uleb128 0xa
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x9a
	.uleb128 0xa
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2f3
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
	.byte	0x33
	.long	0x393
	.uleb128 0x4
	.ascii "re\0"
	.byte	0x6
	.byte	0x35
	.long	0x393
	.byte	0
	.uleb128 0x4
	.ascii "im\0"
	.byte	0x6
	.byte	0x36
	.long	0x393
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x6
	.ascii "complex_t\0"
	.byte	0x6
	.byte	0x37
	.long	0x369
	.uleb128 0xf
	.byte	0x4
	.long	0x74
	.byte	0x7
	.byte	0x1b
	.long	0x47d
	.uleb128 0x10
	.ascii "ERR_NONE\0"
	.byte	0
	.uleb128 0x10
	.ascii "ERR_INV_NULL_POINTER\0"
	.byte	0x1
	.uleb128 0x10
	.ascii "ERR_INV_PRINTID\0"
	.byte	0x2
	.uleb128 0x10
	.ascii "ERR_INV_CNVCOD_RATE\0"
	.byte	0x3
	.uleb128 0x10
	.ascii "ERR_INV_CNVCOD_KLEN\0"
	.byte	0x4
	.uleb128 0x10
	.ascii "ERR_INV_BUFFER_SIZE\0"
	.byte	0x5
	.uleb128 0x10
	.ascii "ERR_INV_DYNAMIC_ALLOC\0"
	.byte	0x6
	.uleb128 0x10
	.ascii "ERR_INV_STREAM_TYPE\0"
	.byte	0x7
	.uleb128 0x10
	.ascii "ERR_INV_MODULATION\0"
	.byte	0x8
	.uleb128 0x10
	.ascii "ERR_NUM\0"
	.byte	0x9
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x7
	.byte	0x27
	.long	0x3ad
	.uleb128 0xf
	.byte	0x4
	.long	0x74
	.byte	0x8
	.byte	0x1d
	.long	0x4c2
	.uleb128 0x10
	.ascii "memory_type_byte\0"
	.byte	0
	.uleb128 0x10
	.ascii "memory_type_complex\0"
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.ascii "memory_type_t\0"
	.byte	0x8
	.byte	0x20
	.long	0x48c
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x23
	.long	0x513
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x25
	.long	0x513
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x26
	.long	0x1c0
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x27
	.long	0x4c2
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x193
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x8
	.byte	0x28
	.long	0x4d7
	.uleb128 0x11
	.long	0x519
	.uleb128 0x3
	.ascii "_complex_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x2b
	.long	0x572
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x2d
	.long	0x572
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x2e
	.long	0x1c0
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x2f
	.long	0x4c2
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x39c
	.uleb128 0x6
	.ascii "complex_stream_t\0"
	.byte	0x8
	.byte	0x30
	.long	0x533
	.uleb128 0xf
	.byte	0x4
	.long	0x74
	.byte	0x9
	.byte	0x1d
	.long	0x5bb
	.uleb128 0x10
	.ascii "MOD_PSK\0"
	.byte	0
	.uleb128 0x10
	.ascii "MOD_QAM\0"
	.byte	0x1
	.uleb128 0x10
	.ascii "MOD_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "modulation_t\0"
	.byte	0x9
	.byte	0x22
	.long	0x590
	.uleb128 0x3
	.ascii "_mod_par_t\0"
	.byte	0xc
	.byte	0x9
	.byte	0x3b
	.long	0x619
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x9
	.byte	0x3d
	.long	0x5bb
	.byte	0
	.uleb128 0x4
	.ascii "order\0"
	.byte	0x9
	.byte	0x3e
	.long	0x193
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0x9
	.byte	0x3f
	.long	0x193
	.byte	0x5
	.uleb128 0x4
	.ascii "phOfst\0"
	.byte	0x9
	.byte	0x40
	.long	0x393
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "mod_par_t\0"
	.byte	0x9
	.byte	0x41
	.long	0x5cf
	.uleb128 0x11
	.long	0x619
	.uleb128 0x3
	.ascii "_mod_maptable_t\0"
	.byte	0x24
	.byte	0x9
	.byte	0x44
	.long	0x663
	.uleb128 0x4
	.ascii "bits\0"
	.byte	0x9
	.byte	0x46
	.long	0x663
	.byte	0
	.uleb128 0x4
	.ascii "symbs\0"
	.byte	0x9
	.byte	0x47
	.long	0x673
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	0x193
	.long	0x673
	.uleb128 0xe
	.long	0x303
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	0x39c
	.long	0x683
	.uleb128 0xe
	.long	0x303
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.ascii "mod_maptable_t\0"
	.byte	0x9
	.byte	0x48
	.long	0x62f
	.uleb128 0x12
	.ascii "GetGraySequence\0"
	.byte	0x1
	.byte	0xf2
	.long	0x47d
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x737
	.uleb128 0x13
	.ascii "ioBuffer\0"
	.byte	0x1
	.byte	0xf2
	.long	0x513
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.secrel32	LASF0
	.byte	0x1
	.byte	0xf2
	.long	0x737
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.secrel32	LASF1
	.byte	0x1
	.byte	0xf4
	.long	0x47d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "i\0"
	.byte	0x1
	.byte	0xf5
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x16
	.ascii "cnt\0"
	.byte	0x1
	.byte	0xf5
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.ascii "wrIdx\0"
	.byte	0x1
	.byte	0xf6
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x16
	.ascii "shift\0"
	.byte	0x1
	.byte	0xf7
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x16
	.ascii "nBlk\0"
	.byte	0x1
	.byte	0xf8
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x62a
	.uleb128 0x12
	.ascii "GetQamTable\0"
	.byte	0x1
	.byte	0xcc
	.long	0x47d
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x7da
	.uleb128 0x14
	.secrel32	LASF2
	.byte	0x1
	.byte	0xcc
	.long	0x7da
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.secrel32	LASF0
	.byte	0x1
	.byte	0xcc
	.long	0x737
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.secrel32	LASF1
	.byte	0x1
	.byte	0xce
	.long	0x47d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "graySeq\0"
	.byte	0x1
	.byte	0xcf
	.long	0x7e0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.byte	0xd0
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x16
	.ascii "maxVal\0"
	.byte	0x1
	.byte	0xd1
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x16
	.ascii "nRows\0"
	.byte	0x1
	.byte	0xd2
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x16
	.ascii "divFct\0"
	.byte	0x1
	.byte	0xd3
	.long	0x2c1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x683
	.uleb128 0x7
	.long	0x193
	.long	0x7f3
	.uleb128 0x17
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0
	.uleb128 0x12
	.ascii "GetPskTable\0"
	.byte	0x1
	.byte	0xaa
	.long	0x47d
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x85e
	.uleb128 0x14
	.secrel32	LASF2
	.byte	0x1
	.byte	0xaa
	.long	0x7da
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.secrel32	LASF0
	.byte	0x1
	.byte	0xaa
	.long	0x737
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.secrel32	LASF1
	.byte	0x1
	.byte	0xac
	.long	0x47d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "graySeq\0"
	.byte	0x1
	.byte	0xad
	.long	0x85e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.byte	0xae
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x7
	.long	0x193
	.long	0x871
	.uleb128 0x17
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0
	.uleb128 0x12
	.ascii "GetMappingTable\0"
	.byte	0x1
	.byte	0x84
	.long	0x47d
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x8c1
	.uleb128 0x14
	.secrel32	LASF2
	.byte	0x1
	.byte	0x84
	.long	0x7da
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.secrel32	LASF0
	.byte	0x1
	.byte	0x84
	.long	0x737
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.secrel32	LASF1
	.byte	0x1
	.byte	0x86
	.long	0x47d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.ascii "Modulation_Mapper\0"
	.byte	0x1
	.byte	0x47
	.long	0x47d
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x9b1
	.uleb128 0x13
	.ascii "inStream\0"
	.byte	0x1
	.byte	0x47
	.long	0x9b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.ascii "outStream\0"
	.byte	0x1
	.byte	0x47
	.long	0x9b7
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.secrel32	LASF0
	.byte	0x1
	.byte	0x47
	.long	0x737
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.secrel32	LASF1
	.byte	0x1
	.byte	0x49
	.long	0x47d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "mapTable\0"
	.byte	0x1
	.byte	0x4a
	.long	0x683
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x16
	.ascii "inLenBi\0"
	.byte	0x1
	.byte	0x4b
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.byte	0x4c
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "byteIdx\0"
	.byte	0x1
	.byte	0x4d
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.ascii "curBits\0"
	.byte	0x1
	.byte	0x4e
	.long	0x176
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x16
	.ascii "symbIdx\0"
	.byte	0x1
	.byte	0x4f
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x16
	.ascii "bitIdx\0"
	.byte	0x1
	.byte	0x50
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x16
	.ascii "i\0"
	.byte	0x1
	.byte	0x51
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x52e
	.uleb128 0x5
	.byte	0x4
	.long	0x578
	.uleb128 0x18
	.ascii "Modulation_ListParameters\0"
	.byte	0x1
	.byte	0x2a
	.long	0x47d
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xa0e
	.uleb128 0x13
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x2a
	.long	0xa0e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.secrel32	LASF1
	.byte	0x1
	.byte	0x2c
	.long	0x47d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x619
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x18
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
LASF0:
	.ascii "pParams\0"
LASF2:
	.ascii "ioTable\0"
LASF1:
	.ascii "retErr\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_cos;	.scl	2;	.type	32;	.endef
	.def	_sin;	.scl	2;	.type	32;	.endef
	.def	_sqrt;	.scl	2;	.type	32;	.endef
	.def	_div;	.scl	2;	.type	32;	.endef
	.def	_pow;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
