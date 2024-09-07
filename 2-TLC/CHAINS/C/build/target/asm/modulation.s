	.file	"modulation.c"
	.text
Ltext0:
	.globl	_Modulation_ListParameters
	.def	_Modulation_ListParameters;	.scl	2;	.type	32;	.endef
_Modulation_ListParameters:
LFB18:
	.file 1 "src/modulation.c"
	.loc 1 44 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 45 0
	movl	$0, -12(%ebp)
	.loc 1 47 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 49 0
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	.loc 1 50 0
	movl	8(%ebp), %eax
	movb	$4, 4(%eax)
	.loc 1 51 0
	movl	8(%ebp), %eax
	movb	$2, 5(%eax)
	.loc 1 52 0
	movl	8(%ebp), %eax
	flds	LC0
	fstps	8(%eax)
	jmp	L3
L2:
	.loc 1 56 0
	movl	$1, -12(%ebp)
L3:
	.loc 1 59 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 60 0
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
	.loc 1 73 0
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
	.loc 1 74 0
	movl	$0, -12(%ebp)
	.loc 1 76 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -24(%ebp)
	.loc 1 77 0
	movl	$0, -16(%ebp)
	.loc 1 79 0
	movb	$0, -17(%ebp)
	.loc 1 80 0
	movb	$0, -18(%ebp)
	.loc 1 84 0
	cmpl	$0, 8(%ebp)
	je	L6
	.loc 1 84 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L6
	.loc 1 84 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L6
	.loc 1 86 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-68(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetMappingTable
	.loc 1 88 0
	jmp	L7
L13:
	.loc 1 90 0
	movzbl	-18(%ebp), %eax
	addl	$1, %eax
	movb	%al, -18(%ebp)
	.loc 1 91 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 92 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 93 0
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
	movl	%eax, %edx
	movzbl	-17(%ebp), %eax
	orl	%edx, %eax
	movb	%al, -17(%ebp)
	.loc 1 94 0
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	cmpb	-18(%ebp), %al
	jne	L8
	.loc 1 96 0
	movb	$0, -19(%ebp)
	jmp	L9
L12:
	.loc 1 98 0
	movzbl	-19(%ebp), %eax
	movzbl	-68(%ebp,%eax), %eax
	cmpb	-17(%ebp), %al
	jne	L10
	.loc 1 100 0
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
	.loc 1 101 0
	jmp	L11
L10:
	.loc 1 96 0 discriminator 2
	movzbl	-19(%ebp), %eax
	addl	$1, %eax
	movb	%al, -19(%ebp)
L9:
	.loc 1 96 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-19(%ebp), %al
	ja	L12
L11:
	.loc 1 104 0 is_stmt 1
	movb	$0, -18(%ebp)
	.loc 1 105 0
	movb	$0, -17(%ebp)
L8:
	.loc 1 107 0
	addl	$1, -16(%ebp)
L7:
	.loc 1 88 0
	movl	-16(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jb	L13
	.loc 1 84 0
	jmp	L14
L6:
	.loc 1 113 0
	movl	$1, -12(%ebp)
L14:
	.loc 1 116 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 117 0
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
	.globl	_Modulation_HardDemapper
	.def	_Modulation_HardDemapper;	.scl	2;	.type	32;	.endef
_Modulation_HardDemapper:
LFB20:
	.loc 1 130 0
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
	.loc 1 131 0
	movl	$0, -12(%ebp)
	.loc 1 134 0
	movl	$0, -20(%ebp)
	.loc 1 141 0
	cmpl	$0, 8(%ebp)
	je	L17
	.loc 1 141 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L17
	.loc 1 141 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L17
	.loc 1 143 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-76(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetMappingTable
	.loc 1 144 0
	movl	12(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 146 0
	movl	$0, -24(%ebp)
	jmp	L18
L26:
	.loc 1 148 0
	movb	$0, -25(%ebp)
	.loc 1 149 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-24(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	flds	-72(%ebp)
	fsubrp	%st, %st(1)
	fabs
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-24(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	flds	-68(%ebp)
	fsubrp	%st, %st(1)
	fabs
	faddp	%st, %st(1)
	fstps	-16(%ebp)
	.loc 1 150 0
	movb	$1, -26(%ebp)
	jmp	L19
L22:
	.loc 1 152 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-24(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	movzbl	-26(%ebp), %eax
	flds	-72(%ebp,%eax,8)
	fsubrp	%st, %st(1)
	fabs
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-24(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	movzbl	-26(%ebp), %eax
	flds	-68(%ebp,%eax,8)
	fsubrp	%st, %st(1)
	fabs
	faddp	%st, %st(1)
	fstps	-32(%ebp)
	.loc 1 153 0
	flds	-16(%ebp)
	flds	-32(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L20
	.loc 1 155 0
	flds	-32(%ebp)
	fstps	-16(%ebp)
	.loc 1 156 0
	movzbl	-26(%ebp), %eax
	movb	%al, -25(%ebp)
L20:
	.loc 1 150 0 discriminator 2
	movzbl	-26(%ebp), %eax
	addl	$1, %eax
	movb	%al, -26(%ebp)
L19:
	.loc 1 150 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-26(%ebp), %al
	ja	L22
	.loc 1 159 0 is_stmt 1
	movb	$0, -26(%ebp)
	jmp	L23
L25:
	.loc 1 161 0
	movzbl	-25(%ebp), %eax
	movzbl	-76(%ebp,%eax), %eax
	movzbl	%al, %edx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	leal	-1(%eax), %ecx
	movzbl	-26(%ebp), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L24
	.loc 1 163 0
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 164 0
	movl	-20(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -37(%ebp)
	.loc 1 165 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-36(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-37(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
L24:
	.loc 1 167 0 discriminator 2
	addl	$1, -20(%ebp)
	.loc 1 159 0 discriminator 2
	movzbl	-26(%ebp), %eax
	addl	$1, %eax
	movb	%al, -26(%ebp)
L23:
	.loc 1 159 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	cmpb	-26(%ebp), %al
	ja	L25
	.loc 1 146 0 is_stmt 1 discriminator 2
	addl	$1, -24(%ebp)
L18:
	.loc 1 146 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-24(%ebp), %eax
	ja	L26
	.loc 1 141 0 is_stmt 1
	jmp	L27
L17:
	.loc 1 173 0
	movl	$1, -12(%ebp)
L27:
	.loc 1 176 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 177 0
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
LFE20:
	.globl	_Modulation_SoftDemapper
	.def	_Modulation_SoftDemapper;	.scl	2;	.type	32;	.endef
_Modulation_SoftDemapper:
LFB21:
	.loc 1 190 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$100, %esp
	.cfi_offset 3, -12
	.loc 1 191 0
	movl	$0, -12(%ebp)
	.loc 1 193 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 199 0
	cmpl	$0, 8(%ebp)
	je	L31
	.loc 1 199 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L31
	.loc 1 199 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L31
	.loc 1 201 0 is_stmt 1
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-72(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetMappingTable
	.loc 1 203 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	$2, %al
	jne	L32
	.loc 1 205 0
	movl	$0, -16(%ebp)
	jmp	L33
L34:
	.loc 1 207 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %ecx
	sall	$3, %ecx
	addl	%ecx, %eax
	flds	4(%eax)
	fchs
	fstps	(%edx)
	.loc 1 205 0 discriminator 3
	addl	$1, -16(%ebp)
L33:
	.loc 1 205 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L34
	.loc 1 203 0 is_stmt 1
	jmp	L44
L32:
	.loc 1 212 0
	movl	$0, -16(%ebp)
	jmp	L36
L43:
	.loc 1 214 0
	movb	$0, -25(%ebp)
	jmp	L37
L42:
	.loc 1 216 0
	fldz
	fstps	-20(%ebp)
	.loc 1 217 0
	fldz
	fstps	-24(%ebp)
	.loc 1 218 0
	movb	$0, -26(%ebp)
	jmp	L38
L41:
	.loc 1 220 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	movzbl	-26(%ebp), %eax
	flds	-68(%ebp,%eax,8)
	fsubrp	%st, %st(1)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	movzbl	-26(%ebp), %eax
	flds	-68(%ebp,%eax,8)
	fsubrp	%st, %st(1)
	fmulp	%st, %st(1)
	.loc 1 221 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	movzbl	-26(%ebp), %eax
	flds	-64(%ebp,%eax,8)
	fsubrp	%st, %st(1)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	movzbl	-26(%ebp), %eax
	flds	-64(%ebp,%eax,8)
	fsubrp	%st, %st(1)
	fmulp	%st, %st(1)
	.loc 1 220 0
	faddp	%st, %st(1)
	fchs
	.loc 1 221 0
	flds	LC3
	fdivrp	%st, %st(1)
	.loc 1 220 0
	fstpl	(%esp)
	call	_exp
	fstps	-36(%ebp)
	.loc 1 222 0
	movzbl	-26(%ebp), %eax
	movzbl	-72(%ebp,%eax), %eax
	movzbl	%al, %edx
	movzbl	-25(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L39
	.loc 1 224 0
	flds	-20(%ebp)
	fadds	-36(%ebp)
	fstps	-20(%ebp)
	jmp	L40
L39:
	.loc 1 228 0
	flds	-24(%ebp)
	fadds	-36(%ebp)
	fstps	-24(%ebp)
L40:
	.loc 1 218 0 discriminator 2
	movzbl	-26(%ebp), %eax
	addl	$1, %eax
	movb	%al, -26(%ebp)
L38:
	.loc 1 218 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-26(%ebp), %al
	ja	L41
	.loc 1 231 0 is_stmt 1 discriminator 2
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	leal	1(%eax), %ecx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%eax, %ecx
	movzbl	-25(%ebp), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$1073741823, %eax
	sall	$2, %eax
	leal	(%edx,%eax), %ebx
	flds	-20(%ebp)
	fdivs	-24(%ebp)
	fstpl	(%esp)
	call	_log
	fadd	%st(0), %st
	fstps	-76(%ebp)
	flds	-76(%ebp)
	fstps	(%ebx)
	.loc 1 214 0 discriminator 2
	movzbl	-25(%ebp), %eax
	addl	$1, %eax
	movb	%al, -25(%ebp)
L37:
	.loc 1 214 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	cmpb	-25(%ebp), %al
	ja	L42
	.loc 1 212 0 is_stmt 1 discriminator 2
	addl	$1, -16(%ebp)
L36:
	.loc 1 212 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L43
	.loc 1 203 0 is_stmt 1
	jmp	L44
L31:
	.loc 1 238 0
	movl	$1, -12(%ebp)
L44:
	.loc 1 241 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 242 0
	addl	$100, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.def	_GetMappingTable;	.scl	3;	.type	32;	.endef
_GetMappingTable:
LFB22:
	.loc 1 261 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 262 0
	movl	$0, -12(%ebp)
	.loc 1 264 0
	cmpl	$0, 8(%ebp)
	je	L47
	.loc 1 264 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L47
	.loc 1 266 0 is_stmt 1
	movl	12(%ebp), %eax
	movzbl	5(%eax), %eax
	testb	%al, %al
	je	L48
	.loc 1 266 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzbl	5(%eax), %eax
	cmpb	$6, %al
	ja	L48
	.loc 1 268 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L50
	cmpl	$1, %eax
	je	L51
	jmp	L56
L50:
	.loc 1 271 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetPskTable
	.loc 1 272 0
	jmp	L52
L51:
	.loc 1 275 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetQamTable
	.loc 1 276 0
	jmp	L52
L56:
	.loc 1 279 0
	movl	$8, -12(%ebp)
	.loc 1 280 0
	nop
L52:
	.loc 1 282 0
	nop
	.loc 1 266 0
	jmp	L54
L48:
	.loc 1 285 0
	movl	$9, -12(%ebp)
	.loc 1 266 0
	jmp	L54
L47:
	.loc 1 290 0
	movl	$1, -12(%ebp)
L54:
	.loc 1 293 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 294 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_GetPskTable;	.scl	3;	.type	32;	.endef
_GetPskTable:
LFB23:
	.loc 1 306 0
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
	.loc 1 306 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 307 0
	movl	$0, -12(%ebp)
	.loc 1 308 0
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
	.loc 1 311 0
	cmpl	$0, 8(%ebp)
	je	L58
	.loc 1 311 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L58
	.loc 1 313 0 is_stmt 1
	movl	-24(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_GetGraySequence
	.loc 1 315 0
	movb	$0, -13(%ebp)
	jmp	L59
L60:
	.loc 1 317 0 discriminator 3
	movzbl	-13(%ebp), %eax
	movzbl	-13(%ebp), %edx
	movl	-24(%ebp), %ecx
	movzbl	(%ecx,%edx), %ecx
	movl	8(%ebp), %edx
	movb	%cl, (%edx,%eax)
	.loc 1 318 0 discriminator 3
	movzbl	-13(%ebp), %ebx
	movl	12(%ebp), %eax
	flds	8(%eax)
	movzbl	-13(%ebp), %eax
	movl	%eax, -32(%ebp)
	fildl	-32(%ebp)
	flds	LC4
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
	.loc 1 319 0 discriminator 3
	movzbl	-13(%ebp), %ebx
	movl	12(%ebp), %eax
	flds	8(%eax)
	movzbl	-13(%ebp), %eax
	movl	%eax, -32(%ebp)
	fildl	-32(%ebp)
	flds	LC4
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
	.loc 1 315 0 discriminator 3
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L59:
	.loc 1 315 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-13(%ebp), %al
	ja	L60
	.loc 1 311 0 is_stmt 1
	jmp	L61
L58:
	.loc 1 324 0
	movl	$1, -12(%ebp)
L61:
	.loc 1 327 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 328 0
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
	.def	_GetQamTable;	.scl	3;	.type	32;	.endef
_GetQamTable:
LFB24:
	.loc 1 340 0
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
	.loc 1 340 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 341 0
	movl	$0, -12(%ebp)
	.loc 1 342 0
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
	.loc 1 344 0
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
	.loc 1 345 0
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
	.loc 1 348 0
	cmpl	$0, 8(%ebp)
	je	L64
	.loc 1 348 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L64
	.loc 1 350 0 is_stmt 1
	movl	12(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, (%esp)
	call	_IsQamBpsValid
	testb	%al, %al
	je	L65
	.loc 1 352 0
	movl	-24(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_GetGraySequence
	.loc 1 354 0
	movb	$0, -13(%ebp)
	jmp	L66
L67:
	.loc 1 356 0 discriminator 3
	movzbl	-26(%ebp), %edx
	movzbl	-13(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_div
	movl	%eax, -36(%ebp)
	movl	%edx, -32(%ebp)
	.loc 1 357 0 discriminator 3
	movzbl	-13(%ebp), %eax
	movzbl	-13(%ebp), %edx
	movl	-24(%ebp), %ecx
	movzbl	(%ecx,%edx), %ecx
	movl	8(%ebp), %edx
	movb	%cl, (%edx,%eax)
	.loc 1 358 0 discriminator 3
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
	.loc 1 359 0 discriminator 3
	movzbl	-13(%ebp), %edx
	movzbl	-25(%ebp), %eax
	movl	-36(%ebp), %ecx
	addl	%ecx, %ecx
	subl	%ecx, %eax
	movl	%eax, -64(%ebp)
	fildl	-64(%ebp)
	movl	8(%ebp), %eax
	fstps	8(%eax,%edx,8)
	.loc 1 354 0 discriminator 3
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L66:
	.loc 1 354 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-13(%ebp), %al
	ja	L67
	.loc 1 350 0 is_stmt 1
	jmp	L69
L65:
	.loc 1 364 0
	movl	$9, -12(%ebp)
	.loc 1 350 0
	jmp	L69
L64:
	.loc 1 369 0
	movl	$1, -12(%ebp)
L69:
	.loc 1 372 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 373 0
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
LFE24:
	.def	_GetGraySequence;	.scl	3;	.type	32;	.endef
_GetGraySequence:
LFB25:
	.loc 1 385 0
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
	.loc 1 386 0
	movl	$0, -12(%ebp)
	.loc 1 392 0
	cmpl	$0, 8(%ebp)
	je	L72
	.loc 1 392 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L72
	.loc 1 394 0 is_stmt 1
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 396 0
	movb	$0, -13(%ebp)
	jmp	L73
L78:
	.loc 1 398 0
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %edx
	movzbl	-13(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movb	%al, -16(%ebp)
	.loc 1 399 0
	movl	12(%ebp), %eax
	movzbl	5(%eax), %eax
	subb	-13(%ebp), %al
	subl	$1, %eax
	movb	%al, -17(%ebp)
	.loc 1 400 0
	movb	$0, -14(%ebp)
	.loc 1 401 0
	movzbl	-16(%ebp), %eax
	shrb	%al
	movb	%al, -15(%ebp)
	.loc 1 402 0
	jmp	L74
L77:
	.loc 1 404 0
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
	.loc 1 405 0
	movzbl	-14(%ebp), %eax
	movzbl	-16(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jge	L75
	.loc 1 407 0
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
	jmp	L76
L75:
	.loc 1 411 0
	movb	$0, -14(%ebp)
	.loc 1 412 0
	movzbl	-16(%ebp), %eax
	addb	%al, -15(%ebp)
L76:
	.loc 1 414 0
	movzbl	-15(%ebp), %eax
	addl	$1, %eax
	movb	%al, -15(%ebp)
L74:
	.loc 1 402 0
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-15(%ebp), %al
	ja	L77
	.loc 1 396 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L73:
	.loc 1 396 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzbl	5(%eax), %eax
	cmpb	-13(%ebp), %al
	ja	L78
	.loc 1 392 0 is_stmt 1
	jmp	L79
L72:
	.loc 1 420 0
	movl	$1, -12(%ebp)
L79:
	.loc 1 423 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 424 0
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
	.def	_IsQamBpsValid;	.scl	3;	.type	32;	.endef
_IsQamBpsValid:
LFB26:
	.loc 1 435 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	.loc 1 438 0
	movzbl	-20(%ebp), %eax
	andl	$1, %eax
	testb	%al, %al
	sete	%al
	movb	%al, -1(%ebp)
	.loc 1 440 0
	movzbl	-1(%ebp), %eax
	.loc 1 441 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
	.align 4
LC0:
	.long	1061752784
	.align 4
LC3:
	.long	1082130432
	.align 4
LC4:
	.long	1086918608
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
	.long	0xcf4
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x194
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
	.uleb128 0xa
	.long	0x1b2
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
	.long	0x1fb
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
	.long	0x231
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x226
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
	.uleb128 0xb
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb7
	.uleb128 0xc
	.byte	0x8
	.byte	0x4
	.word	0x207
	.long	0x2b8
	.uleb128 0xd
	.ascii "quot\0"
	.byte	0x4
	.word	0x207
	.long	0xb7
	.byte	0
	.uleb128 0xd
	.ascii "rem\0"
	.byte	0x4
	.word	0x207
	.long	0xb7
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.ascii "div_t\0"
	.byte	0x4
	.word	0x207
	.long	0x293
	.uleb128 0xb
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb7
	.uleb128 0xb
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x9a
	.uleb128 0x7
	.long	0x14d
	.long	0x2fa
	.uleb128 0xf
	.long	0x2fa
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
	.long	0x2ea
	.uleb128 0xb
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xb7
	.uleb128 0xb
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x9a
	.uleb128 0xb
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2ea
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
	.long	0x38a
	.uleb128 0x4
	.ascii "re\0"
	.byte	0x6
	.byte	0x35
	.long	0x38a
	.byte	0
	.uleb128 0x4
	.ascii "im\0"
	.byte	0x6
	.byte	0x36
	.long	0x38a
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
	.long	0x360
	.uleb128 0x10
	.byte	0x4
	.long	0x74
	.byte	0x7
	.byte	0x1b
	.long	0x4a9
	.uleb128 0x11
	.ascii "ERR_NONE\0"
	.byte	0
	.uleb128 0x11
	.ascii "ERR_INV_NULL_POINTER\0"
	.byte	0x1
	.uleb128 0x11
	.ascii "ERR_INV_PRINTID\0"
	.byte	0x2
	.uleb128 0x11
	.ascii "ERR_INV_CNVCOD_RATE\0"
	.byte	0x3
	.uleb128 0x11
	.ascii "ERR_INV_CNVCOD_KLEN\0"
	.byte	0x4
	.uleb128 0x11
	.ascii "ERR_INV_BUFFER_SIZE\0"
	.byte	0x5
	.uleb128 0x11
	.ascii "ERR_INV_DYNAMIC_ALLOC\0"
	.byte	0x6
	.uleb128 0x11
	.ascii "ERR_INV_STREAM_TYPE\0"
	.byte	0x7
	.uleb128 0x11
	.ascii "ERR_INV_MODULATION_TYPE\0"
	.byte	0x8
	.uleb128 0x11
	.ascii "ERR_INV_MODULATION_BPS\0"
	.byte	0x9
	.uleb128 0x11
	.ascii "ERR_INV_CHANNEL_TYPE\0"
	.byte	0xa
	.uleb128 0x11
	.ascii "ERR_NUM\0"
	.byte	0xb
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x7
	.byte	0x29
	.long	0x3a4
	.uleb128 0x10
	.byte	0x4
	.long	0x74
	.byte	0x8
	.byte	0x1d
	.long	0x502
	.uleb128 0x11
	.ascii "memory_type_byte\0"
	.byte	0
	.uleb128 0x11
	.ascii "memory_type_float\0"
	.byte	0x1
	.uleb128 0x11
	.ascii "memory_type_complex\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "memory_type_t\0"
	.byte	0x8
	.byte	0x21
	.long	0x4b8
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x24
	.long	0x553
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x26
	.long	0x553
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x27
	.long	0x1b2
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x28
	.long	0x502
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x185
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x8
	.byte	0x29
	.long	0x517
	.uleb128 0xa
	.long	0x559
	.uleb128 0x3
	.ascii "_float_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x2c
	.long	0x5b0
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x2e
	.long	0x5b0
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x2f
	.long	0x1b2
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x30
	.long	0x502
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x38a
	.uleb128 0x6
	.ascii "float_stream_t\0"
	.byte	0x8
	.byte	0x31
	.long	0x573
	.uleb128 0x3
	.ascii "_complex_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x34
	.long	0x60b
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x36
	.long	0x60b
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x37
	.long	0x1b2
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x38
	.long	0x502
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x393
	.uleb128 0x6
	.ascii "complex_stream_t\0"
	.byte	0x8
	.byte	0x39
	.long	0x5cc
	.uleb128 0xa
	.long	0x611
	.uleb128 0x10
	.byte	0x4
	.long	0x74
	.byte	0x9
	.byte	0x1d
	.long	0x659
	.uleb128 0x11
	.ascii "MOD_PSK\0"
	.byte	0
	.uleb128 0x11
	.ascii "MOD_QAM\0"
	.byte	0x1
	.uleb128 0x11
	.ascii "MOD_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "modulation_t\0"
	.byte	0x9
	.byte	0x22
	.long	0x62e
	.uleb128 0x3
	.ascii "_mod_par_t\0"
	.byte	0xc
	.byte	0x9
	.byte	0x49
	.long	0x6b7
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x9
	.byte	0x4b
	.long	0x659
	.byte	0
	.uleb128 0x4
	.ascii "order\0"
	.byte	0x9
	.byte	0x4c
	.long	0x185
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0x9
	.byte	0x4d
	.long	0x185
	.byte	0x5
	.uleb128 0x4
	.ascii "phOfst\0"
	.byte	0x9
	.byte	0x4e
	.long	0x38a
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "mod_par_t\0"
	.byte	0x9
	.byte	0x4f
	.long	0x66d
	.uleb128 0xa
	.long	0x6b7
	.uleb128 0x3
	.ascii "_mod_maptable_t\0"
	.byte	0x24
	.byte	0x9
	.byte	0x52
	.long	0x701
	.uleb128 0x4
	.ascii "bits\0"
	.byte	0x9
	.byte	0x54
	.long	0x701
	.byte	0
	.uleb128 0x4
	.ascii "symbs\0"
	.byte	0x9
	.byte	0x55
	.long	0x711
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	0x185
	.long	0x711
	.uleb128 0xf
	.long	0x2fa
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	0x393
	.long	0x721
	.uleb128 0xf
	.long	0x2fa
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.ascii "mod_maptable_t\0"
	.byte	0x9
	.byte	0x56
	.long	0x6cd
	.uleb128 0x12
	.ascii "IsQamBpsValid\0"
	.byte	0x1
	.word	0x1b2
	.long	0x77b
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x77b
	.uleb128 0x13
	.ascii "bps\0"
	.byte	0x1
	.word	0x1b2
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.ascii "bRet\0"
	.byte	0x1
	.word	0x1b4
	.long	0x77b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x15
	.ascii "GetGraySequence\0"
	.byte	0x1
	.word	0x180
	.long	0x4a9
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x82b
	.uleb128 0x13
	.ascii "ioBuffer\0"
	.byte	0x1
	.word	0x180
	.long	0x553
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x180
	.long	0x82b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.word	0x182
	.long	0x4a9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "i\0"
	.byte	0x1
	.word	0x183
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x14
	.ascii "cnt\0"
	.byte	0x1
	.word	0x183
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x14
	.ascii "wrIdx\0"
	.byte	0x1
	.word	0x184
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x14
	.ascii "shift\0"
	.byte	0x1
	.word	0x185
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x14
	.ascii "nBlk\0"
	.byte	0x1
	.word	0x186
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x6c8
	.uleb128 0x15
	.ascii "GetQamTable\0"
	.byte	0x1
	.word	0x153
	.long	0x4a9
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x8d7
	.uleb128 0x16
	.secrel32	LASF2
	.byte	0x1
	.word	0x153
	.long	0x8d7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x153
	.long	0x82b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.word	0x155
	.long	0x4a9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "graySeq\0"
	.byte	0x1
	.word	0x156
	.long	0x8dd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x157
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x14
	.ascii "maxVal\0"
	.byte	0x1
	.word	0x158
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x14
	.ascii "nRows\0"
	.byte	0x1
	.word	0x159
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x14
	.ascii "divFct\0"
	.byte	0x1
	.word	0x15a
	.long	0x2b8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x721
	.uleb128 0x7
	.long	0x185
	.long	0x8f0
	.uleb128 0x18
	.long	0x2fa
	.uleb128 0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0
	.uleb128 0x15
	.ascii "GetPskTable\0"
	.byte	0x1
	.word	0x131
	.long	0x4a9
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x961
	.uleb128 0x16
	.secrel32	LASF2
	.byte	0x1
	.word	0x131
	.long	0x8d7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x131
	.long	0x82b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.word	0x133
	.long	0x4a9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "graySeq\0"
	.byte	0x1
	.word	0x134
	.long	0x961
	.uleb128 0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.word	0x135
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x7
	.long	0x185
	.long	0x974
	.uleb128 0x18
	.long	0x2fa
	.uleb128 0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0
	.uleb128 0x15
	.ascii "GetMappingTable\0"
	.byte	0x1
	.word	0x104
	.long	0x4a9
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x9c8
	.uleb128 0x16
	.secrel32	LASF2
	.byte	0x1
	.word	0x104
	.long	0x8d7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.word	0x104
	.long	0x82b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.word	0x106
	.long	0x4a9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.ascii "Modulation_SoftDemapper\0"
	.byte	0x1
	.byte	0xbd
	.long	0x4a9
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xab1
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0xbd
	.long	0xab1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.secrel32	LASF4
	.byte	0x1
	.byte	0xbd
	.long	0xab7
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.byte	0xbd
	.long	0x82b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1b
	.secrel32	LASF1
	.byte	0x1
	.byte	0xbf
	.long	0x4a9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.secrel32	LASF5
	.byte	0x1
	.byte	0xc0
	.long	0x721
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1c
	.ascii "punLenBi\0"
	.byte	0x1
	.byte	0xc1
	.long	0x1c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.ascii "k\0"
	.byte	0x1
	.byte	0xc2
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii "numerator\0"
	.byte	0x1
	.byte	0xc3
	.long	0x38a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.ascii "denominator\0"
	.byte	0x1
	.byte	0xc3
	.long	0x38a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii "distance\0"
	.byte	0x1
	.byte	0xc4
	.long	0x38a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.ascii "i\0"
	.byte	0x1
	.byte	0xc5
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x1c
	.ascii "j\0"
	.byte	0x1
	.byte	0xc5
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x629
	.uleb128 0x5
	.byte	0x4
	.long	0x5b6
	.uleb128 0x19
	.ascii "Modulation_HardDemapper\0"
	.byte	0x1
	.byte	0x81
	.long	0x4a9
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xbae
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0x81
	.long	0xab1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.secrel32	LASF4
	.byte	0x1
	.byte	0x81
	.long	0xbae
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.byte	0x81
	.long	0x82b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1b
	.secrel32	LASF1
	.byte	0x1
	.byte	0x83
	.long	0x4a9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.secrel32	LASF5
	.byte	0x1
	.byte	0x84
	.long	0x721
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1c
	.ascii "minDist\0"
	.byte	0x1
	.byte	0x85
	.long	0x38a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii "curDist\0"
	.byte	0x1
	.byte	0x85
	.long	0x38a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.ascii "k\0"
	.byte	0x1
	.byte	0x86
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.ascii "byteIdx\0"
	.byte	0x1
	.byte	0x87
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.ascii "j\0"
	.byte	0x1
	.byte	0x88
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii "minIdx\0"
	.byte	0x1
	.byte	0x89
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x1c
	.ascii "bitIdx\0"
	.byte	0x1
	.byte	0x8a
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.uleb128 0x1c
	.ascii "i\0"
	.byte	0x1
	.byte	0x8b
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x559
	.uleb128 0x19
	.ascii "Modulation_Mapper\0"
	.byte	0x1
	.byte	0x48
	.long	0x4a9
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xc94
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0x48
	.long	0xc94
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.secrel32	LASF4
	.byte	0x1
	.byte	0x48
	.long	0xc9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.secrel32	LASF0
	.byte	0x1
	.byte	0x48
	.long	0x82b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1b
	.secrel32	LASF1
	.byte	0x1
	.byte	0x4a
	.long	0x4a9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.secrel32	LASF5
	.byte	0x1
	.byte	0x4b
	.long	0x721
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1c
	.ascii "inLenBi\0"
	.byte	0x1
	.byte	0x4c
	.long	0x1c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.ascii "j\0"
	.byte	0x1
	.byte	0x4d
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.ascii "byteIdx\0"
	.byte	0x1
	.byte	0x4e
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.ascii "curBits\0"
	.byte	0x1
	.byte	0x4f
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x1c
	.ascii "symbIdx\0"
	.byte	0x1
	.byte	0x50
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x1c
	.ascii "bitIdx\0"
	.byte	0x1
	.byte	0x51
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x1c
	.ascii "i\0"
	.byte	0x1
	.byte	0x52
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x56e
	.uleb128 0x5
	.byte	0x4
	.long	0x611
	.uleb128 0x19
	.ascii "Modulation_ListParameters\0"
	.byte	0x1
	.byte	0x2b
	.long	0x4a9
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xcf1
	.uleb128 0x1d
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x2b
	.long	0xcf1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.secrel32	LASF1
	.byte	0x1
	.byte	0x2d
	.long	0x4a9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x6b7
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x13
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
LASF0:
	.ascii "pParams\0"
LASF4:
	.ascii "outStream\0"
LASF1:
	.ascii "retErr\0"
LASF5:
	.ascii "mapTable\0"
LASF2:
	.ascii "ioTable\0"
LASF3:
	.ascii "inStream\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_exp;	.scl	2;	.type	32;	.endef
	.def	_log;	.scl	2;	.type	32;	.endef
	.def	_cos;	.scl	2;	.type	32;	.endef
	.def	_sin;	.scl	2;	.type	32;	.endef
	.def	_sqrt;	.scl	2;	.type	32;	.endef
	.def	_div;	.scl	2;	.type	32;	.endef
	.def	_pow;	.scl	2;	.type	32;	.endef
