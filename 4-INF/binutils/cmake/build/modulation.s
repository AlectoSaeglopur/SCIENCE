	.file	"modulation.c"
	.text
Ltext0:
	.globl	_GetPskTable
	.def	_GetPskTable;	.scl	2;	.type	32;	.endef
_GetPskTable:
LFB18:
	.file 1 "H:/SCIENCE/4-INF/binutils/modulation.c"
	.loc 1 35 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	.loc 1 38 0
	leal	-13(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetGray
	.loc 1 39 0
	movb	$0, -9(%ebp)
	jmp	L2
L3:
	.loc 1 40 0 discriminator 3
	movzbl	-9(%ebp), %eax
	movzbl	-9(%ebp), %edx
	movzbl	-13(%ebp,%edx), %ecx
	movl	8(%ebp), %edx
	movb	%cl, (%edx,%eax)
	.loc 1 41 0 discriminator 3
	movzbl	-9(%ebp), %ebx
	.loc 1 41 0 discriminator 3
	movzbl	-9(%ebp), %eax
	movl	%eax, -32(%ebp)
	fildl	-32(%ebp)
	fldl	LC0
	fmulp	%st, %st(1)
	fldl	LC1
	fdivrp	%st, %st(1)
	.loc 1 41 0 discriminator 3
	fldl	LC2
	faddp	%st, %st(1)
	fstpl	(%esp)
	call	_cos
	fstps	-28(%ebp)
	flds	-28(%ebp)
	movl	8(%ebp), %eax
	fstps	4(%eax,%ebx,8)
	.loc 1 42 0 discriminator 3
	movzbl	-9(%ebp), %ebx
	.loc 1 42 0 discriminator 3
	movzbl	-9(%ebp), %eax
	movl	%eax, -32(%ebp)
	fildl	-32(%ebp)
	fldl	LC0
	fmulp	%st, %st(1)
	fldl	LC1
	fdivrp	%st, %st(1)
	.loc 1 42 0 discriminator 3
	fldl	LC2
	faddp	%st, %st(1)
	fstpl	(%esp)
	call	_sin
	fstps	-28(%ebp)
	flds	-28(%ebp)
	movl	8(%ebp), %eax
	fstps	8(%eax,%ebx,8)
	.loc 1 39 0 discriminator 3
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L2:
	.loc 1 39 0 is_stmt 0 discriminator 1
	cmpb	$3, -9(%ebp)
	jbe	L3
	.loc 1 44 0 is_stmt 1
	nop
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_GetQamTable
	.def	_GetQamTable;	.scl	2;	.type	32;	.endef
_GetQamTable:
LFB19:
	.loc 1 52 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	.loc 1 55 0
	movb	$1, -10(%ebp)
	.loc 1 56 0
	movb	$2, -11(%ebp)
	.loc 1 58 0
	leal	-15(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetGray
	.loc 1 59 0
	movb	$0, -9(%ebp)
	jmp	L5
L6:
	.loc 1 60 0 discriminator 3
	movzbl	-11(%ebp), %edx
	movzbl	-9(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_div
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	.loc 1 61 0 discriminator 3
	movzbl	-9(%ebp), %eax
	movzbl	-9(%ebp), %edx
	movzbl	-15(%ebp,%edx), %ecx
	movl	8(%ebp), %edx
	movb	%cl, (%edx,%eax)
	.loc 1 62 0 discriminator 3
	movzbl	-9(%ebp), %ebx
	movl	-20(%ebp), %eax
	leal	(%eax,%eax), %edx
	movzbl	-10(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -40(%ebp)
	fildl	-40(%ebp)
	fstpl	-40(%ebp)
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -32(%ebp)
	fildl	-32(%ebp)
	fstpl	8(%esp)
	fld1
	fchs
	fstpl	(%esp)
	call	_pow
	fmull	-40(%ebp)
	fstps	-28(%ebp)
	flds	-28(%ebp)
	movl	8(%ebp), %eax
	fstps	4(%eax,%ebx,8)
	.loc 1 63 0 discriminator 3
	movzbl	-9(%ebp), %edx
	movzbl	-10(%ebp), %eax
	movl	-24(%ebp), %ecx
	addl	%ecx, %ecx
	subl	%ecx, %eax
	movl	%eax, -40(%ebp)
	fildl	-40(%ebp)
	movl	8(%ebp), %eax
	fstps	8(%eax,%edx,8)
	.loc 1 59 0 discriminator 3
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L5:
	.loc 1 59 0 is_stmt 0 discriminator 1
	cmpb	$3, -9(%ebp)
	jbe	L6
	.loc 1 65 0 is_stmt 1
	nop
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.def	_GetGray;	.scl	3;	.type	32;	.endef
_GetGray:
LFB20:
	.loc 1 73 0
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
	.loc 1 76 0
	movb	$1, -12(%ebp)
	.loc 1 77 0
	movl	$4, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 78 0
	movb	$0, -9(%ebp)
	jmp	L8
L13:
	.loc 1 79 0
	movzbl	-9(%ebp), %eax
	movl	$4, %edx
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movb	%al, -13(%ebp)
	.loc 1 80 0
	movl	$1, %eax
	subb	-9(%ebp), %al
	movb	%al, -14(%ebp)
	.loc 1 81 0
	movb	$0, -11(%ebp)
	.loc 1 82 0
	movzbl	-13(%ebp), %eax
	shrb	%al
	movb	%al, -10(%ebp)
	.loc 1 83 0
	jmp	L9
L12:
	.loc 1 84 0
	movzbl	-10(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movzbl	-10(%ebp), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-12(%ebp), %ebx
	movzbl	-14(%ebp), %eax
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
	.loc 1 85 0
	movzbl	-11(%ebp), %eax
	movzbl	-13(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jge	L10
	.loc 1 86 0
	movzbl	-11(%ebp), %eax
	addl	$1, %eax
	movb	%al, -11(%ebp)
	jmp	L11
L10:
	.loc 1 88 0
	movb	$0, -11(%ebp)
	.loc 1 89 0
	movzbl	-13(%ebp), %eax
	addb	%al, -10(%ebp)
L11:
	.loc 1 91 0
	movzbl	-10(%ebp), %eax
	addl	$1, %eax
	movb	%al, -10(%ebp)
L9:
	.loc 1 83 0
	cmpb	$3, -10(%ebp)
	jbe	L12
	.loc 1 78 0 discriminator 2
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L8:
	.loc 1 78 0 is_stmt 0 discriminator 1
	cmpb	$1, -9(%ebp)
	jbe	L13
	.loc 1 94 0 is_stmt 1
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
LFE20:
	.globl	_Mapper
	.def	_Mapper;	.scl	2;	.type	32;	.endef
_Mapper:
LFB21:
	.loc 1 104 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	.loc 1 107 0
	movl	$0, -8(%ebp)
	.loc 1 108 0
	movb	$0, -9(%ebp)
	.loc 1 109 0
	movb	$0, -10(%ebp)
	.loc 1 110 0
	movb	$1, -11(%ebp)
	.loc 1 111 0
	jmp	L15
L21:
	.loc 1 112 0
	movzbl	-10(%ebp), %eax
	addl	$1, %eax
	movb	%al, -10(%ebp)
	.loc 1 113 0
	movl	-8(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -16(%ebp)
	.loc 1 114 0
	movl	-8(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -17(%ebp)
	.loc 1 115 0
	movl	8(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-17(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movzbl	-11(%ebp), %eax
	andl	%eax, %edx
	movzbl	-10(%ebp), %eax
	movl	$2, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	orb	%al, -9(%ebp)
	.loc 1 116 0
	cmpb	$2, -10(%ebp)
	jne	L16
	.loc 1 117 0
	movb	$0, -1(%ebp)
	jmp	L17
L20:
	.loc 1 118 0
	movzbl	-1(%ebp), %eax
	movl	16(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %edx
	movsbl	-9(%ebp), %eax
	cmpl	%eax, %edx
	jne	L18
	.loc 1 119 0
	movl	-8(%ebp), %eax
	addl	$1, %eax
	shrl	%eax
	addl	$536870911, %eax
	leal	0(,%eax,8), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movzbl	-1(%ebp), %edx
	movl	16(%ebp), %eax
	leal	4(%eax,%edx,8), %edx
	movl	(%edx), %eax
	movl	4(%edx), %edx
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
	.loc 1 120 0
	jmp	L19
L18:
	.loc 1 117 0 discriminator 2
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L17:
	.loc 1 117 0 is_stmt 0 discriminator 1
	cmpb	$3, -1(%ebp)
	jbe	L20
L19:
	.loc 1 123 0 is_stmt 1
	movb	$0, -10(%ebp)
	.loc 1 124 0
	movb	$0, -9(%ebp)
L16:
	.loc 1 126 0
	addl	$1, -8(%ebp)
L15:
	.loc 1 111 0
	cmpl	$1199, -8(%ebp)
	jbe	L21
	.loc 1 128 0
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.globl	_HardDemapper
	.def	_HardDemapper;	.scl	2;	.type	32;	.endef
_HardDemapper:
LFB22:
	.loc 1 138 0
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
	.loc 1 141 0
	movb	$1, -25(%ebp)
	.loc 1 142 0
	movl	$0, -20(%ebp)
	.loc 1 144 0
	movl	$150, 8(%esp)
	movl	$0, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	.loc 1 145 0
	movl	$0, -16(%ebp)
	jmp	L23
L31:
	.loc 1 146 0
	movb	$0, -10(%ebp)
	.loc 1 147 0
	movl	-16(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	movl	16(%ebp), %eax
	flds	4(%eax)
	fsubrp	%st, %st(1)
	fabs
	movl	-16(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	4(%eax)
	movl	16(%ebp), %eax
	flds	8(%eax)
	fsubrp	%st, %st(1)
	fabs
	faddp	%st, %st(1)
	fstps	-24(%ebp)
	.loc 1 148 0
	movb	$1, -9(%ebp)
	jmp	L24
L27:
	.loc 1 149 0
	movl	-16(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	movzbl	-9(%ebp), %edx
	movl	16(%ebp), %eax
	flds	4(%eax,%edx,8)
	fsubrp	%st, %st(1)
	fabs
	movl	-16(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	4(%eax)
	movzbl	-9(%ebp), %edx
	movl	16(%ebp), %eax
	flds	8(%eax,%edx,8)
	fsubrp	%st, %st(1)
	fabs
	faddp	%st, %st(1)
	fstps	-32(%ebp)
	.loc 1 150 0
	flds	-24(%ebp)
	flds	-32(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L25
	.loc 1 151 0
	flds	-32(%ebp)
	fstps	-24(%ebp)
	.loc 1 152 0
	movzbl	-9(%ebp), %eax
	movb	%al, -10(%ebp)
L25:
	.loc 1 148 0 discriminator 2
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L24:
	.loc 1 148 0 is_stmt 0 discriminator 1
	cmpb	$3, -9(%ebp)
	jbe	L27
	.loc 1 155 0 is_stmt 1
	movb	$0, -9(%ebp)
	jmp	L28
L30:
	.loc 1 156 0
	movzbl	-10(%ebp), %eax
	movl	16(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %eax
	movzbl	-25(%ebp), %ebx
	movzbl	-9(%ebp), %edx
	movl	$1, %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, %ecx
	sall	%cl, %ebx
	movl	%ebx, %edx
	andl	%edx, %eax
	testl	%eax, %eax
	je	L29
	.loc 1 157 0
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 158 0
	movl	-20(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -37(%ebp)
	.loc 1 159 0
	movl	12(%ebp), %edx
	movl	-36(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %ecx
	movl	-36(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-25(%ebp), %ebx
	movzbl	-37(%ebp), %eax
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
L29:
	.loc 1 161 0 discriminator 2
	addl	$1, -20(%ebp)
	.loc 1 155 0 discriminator 2
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L28:
	.loc 1 155 0 is_stmt 0 discriminator 1
	cmpb	$1, -9(%ebp)
	jbe	L30
	.loc 1 145 0 is_stmt 1 discriminator 2
	addl	$1, -16(%ebp)
L23:
	.loc 1 145 0 is_stmt 0 discriminator 1
	cmpl	$599, -16(%ebp)
	jbe	L31
	.loc 1 164 0 is_stmt 1
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
LFE22:
	.globl	_SoftDemapper
	.def	_SoftDemapper;	.scl	2;	.type	32;	.endef
_SoftDemapper:
LFB23:
	.loc 1 174 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	.loc 1 178 0
	movb	$1, -25(%ebp)
	.loc 1 179 0
	flds	LC5
	fstps	-32(%ebp)
	.loc 1 185 0
	movl	$0, -12(%ebp)
	jmp	L34
L41:
	.loc 1 186 0
	movb	$0, -13(%ebp)
	jmp	L35
L40:
	.loc 1 187 0
	fldz
	fstps	-20(%ebp)
	.loc 1 188 0
	fldz
	fstps	-24(%ebp)
	.loc 1 189 0
	movb	$0, -14(%ebp)
	jmp	L36
L39:
	.loc 1 190 0
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	movzbl	-14(%ebp), %edx
	movl	16(%ebp), %eax
	flds	4(%eax,%edx,8)
	fsubrp	%st, %st(1)
	fldl	LC7
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_pow
	fstpl	-56(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	4(%eax)
	movzbl	-14(%ebp), %edx
	movl	16(%ebp), %eax
	flds	8(%eax,%edx,8)
	fsubrp	%st, %st(1)
	fldl	LC7
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_pow
	faddl	-56(%ebp)
	fchs
	flds	-32(%ebp)
	fdivrp	%st, %st(1)
	fstpl	(%esp)
	call	_exp
	fstps	-36(%ebp)
	.loc 1 191 0
	movzbl	-14(%ebp), %eax
	movl	16(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %edx
	movzbl	-13(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movzbl	-25(%ebp), %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	L37
	.loc 1 192 0
	flds	-20(%ebp)
	fadds	-36(%ebp)
	fstps	-20(%ebp)
	jmp	L38
L37:
	.loc 1 194 0
	flds	-24(%ebp)
	fadds	-36(%ebp)
	fstps	-24(%ebp)
L38:
	.loc 1 189 0 discriminator 2
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L36:
	.loc 1 189 0 is_stmt 0 discriminator 1
	cmpb	$3, -14(%ebp)
	jbe	L39
	.loc 1 197 0 is_stmt 1 discriminator 2
	movl	-12(%ebp), %eax
	addl	$1, %eax
	leal	(%eax,%eax), %edx
	movzbl	-13(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$1073741823, %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	flds	-32(%ebp)
	flds	LC8
	fdivrp	%st, %st(1)
	fstpl	-56(%ebp)
	flds	-20(%ebp)
	fdivs	-24(%ebp)
	fstpl	(%esp)
	call	_log
	fmull	-56(%ebp)
	fstps	-44(%ebp)
	flds	-44(%ebp)
	fstps	(%ebx)
	.loc 1 186 0 discriminator 2
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L35:
	.loc 1 186 0 is_stmt 0 discriminator 1
	cmpb	$1, -13(%ebp)
	jbe	L40
	.loc 1 185 0 is_stmt 1 discriminator 2
	addl	$1, -12(%ebp)
L34:
	.loc 1 185 0 is_stmt 0 discriminator 1
	cmpl	$599, -12(%ebp)
	jbe	L41
	.loc 1 201 0 is_stmt 1
	nop
	addl	$68, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
	.align 8
LC0:
	.long	1413754136
	.long	1075388923
	.align 8
LC1:
	.long	0
	.long	1074790400
	.align 8
LC2:
	.long	1610612736
	.long	1072243195
	.align 4
LC5:
	.long	1082130432
	.align 8
LC7:
	.long	0
	.long	1073741824
	.align 4
LC8:
	.long	1073741824
	.text
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "H:/SCIENCE/4-INF/binutils/setting.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x7aa
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "H:\\SCIENCE\\4-INF\\binutils\\modulation.c\0"
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
	.long	0x149
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x149
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xb3
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x149
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xb3
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xb3
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xb3
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xb3
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x149
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xba
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xc2
	.uleb128 0x7
	.long	0x14f
	.long	0x166
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x15b
	.uleb128 0x6
	.ascii "int8_t\0"
	.byte	0x3
	.byte	0x3a
	.long	0x180
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
	.ascii "uint32_t\0"
	.byte	0x3
	.byte	0x3f
	.long	0x70
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xb3
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x200
	.uleb128 0x5
	.byte	0x4
	.long	0x149
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xb3
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xb3
	.uleb128 0x7
	.long	0x149
	.long	0x236
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x22b
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x4
	.byte	0xfa
	.long	0x70
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x70
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x70
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x70
	.uleb128 0xa
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb3
	.uleb128 0xb
	.byte	0x8
	.byte	0x4
	.word	0x207
	.long	0x2bd
	.uleb128 0xc
	.ascii "quot\0"
	.byte	0x4
	.word	0x207
	.long	0xb3
	.byte	0
	.uleb128 0xc
	.ascii "rem\0"
	.byte	0x4
	.word	0x207
	.long	0xb3
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.ascii "div_t\0"
	.byte	0x4
	.word	0x207
	.long	0x298
	.uleb128 0xa
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb3
	.uleb128 0xa
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x96
	.uleb128 0x7
	.long	0x149
	.long	0x2ff
	.uleb128 0xe
	.long	0x2ff
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
	.long	0x2ef
	.uleb128 0xa
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xb3
	.uleb128 0xa
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x96
	.uleb128 0xa
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2ef
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
	.uleb128 0x3
	.ascii "TD5\0"
	.byte	0x8
	.byte	0x6
	.byte	0x64
	.long	0x391
	.uleb128 0x4
	.ascii "Re\0"
	.byte	0x6
	.byte	0x65
	.long	0x365
	.byte	0
	.uleb128 0x4
	.ascii "Im\0"
	.byte	0x6
	.byte	0x66
	.long	0x365
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.ascii "complex\0"
	.byte	0x6
	.byte	0x67
	.long	0x36e
	.uleb128 0x3
	.ascii "TD6\0"
	.byte	0x24
	.byte	0x6
	.byte	0x69
	.long	0x3c8
	.uleb128 0x4
	.ascii "Bits\0"
	.byte	0x6
	.byte	0x6a
	.long	0x3c8
	.byte	0
	.uleb128 0x4
	.ascii "Symbs\0"
	.byte	0x6
	.byte	0x6b
	.long	0x3d8
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	0x18f
	.long	0x3d8
	.uleb128 0xe
	.long	0x2ff
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	0x391
	.long	0x3e8
	.uleb128 0xe
	.long	0x2ff
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.ascii "phasemap\0"
	.byte	0x6
	.byte	0x6c
	.long	0x3a0
	.uleb128 0xf
	.ascii "SoftDemapper\0"
	.byte	0x1
	.byte	0xae
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x4b4
	.uleb128 0x10
	.ascii "InSym\0"
	.byte	0x1
	.byte	0xae
	.long	0x4b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "OutLLRs\0"
	.byte	0x1
	.byte	0xae
	.long	0x4ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.ascii "Table\0"
	.byte	0x1
	.byte	0xae
	.long	0x4c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x11
	.ascii "k\0"
	.byte	0x1
	.byte	0xaf
	.long	0x1bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii "i\0"
	.byte	0x1
	.byte	0xb0
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x11
	.ascii "j\0"
	.byte	0x1
	.byte	0xb0
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x11
	.ascii "Num\0"
	.byte	0x1
	.byte	0xb1
	.long	0x365
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii "Den\0"
	.byte	0x1
	.byte	0xb1
	.long	0x365
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.ascii "Dist\0"
	.byte	0x1
	.byte	0xb1
	.long	0x365
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.ascii "Mask\0"
	.byte	0x1
	.byte	0xb2
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x11
	.ascii "N0\0"
	.byte	0x1
	.byte	0xb3
	.long	0x365
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x391
	.uleb128 0x5
	.byte	0x4
	.long	0x365
	.uleb128 0x5
	.byte	0x4
	.long	0x3e8
	.uleb128 0xf
	.ascii "HardDemapper\0"
	.byte	0x1
	.byte	0x8a
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x5a3
	.uleb128 0x10
	.ascii "InSym\0"
	.byte	0x1
	.byte	0x8a
	.long	0x4b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "OutBytes\0"
	.byte	0x1
	.byte	0x8a
	.long	0x5a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.ascii "Table\0"
	.byte	0x1
	.byte	0x8a
	.long	0x4c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x11
	.ascii "i\0"
	.byte	0x1
	.byte	0x8b
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x11
	.ascii "MinIdx\0"
	.byte	0x1
	.byte	0x8b
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x11
	.ascii "BitIdx\0"
	.byte	0x1
	.byte	0x8b
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.uleb128 0x11
	.ascii "j\0"
	.byte	0x1
	.byte	0x8c
	.long	0x1bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.ascii "ByteIdx\0"
	.byte	0x1
	.byte	0x8c
	.long	0x1bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x11
	.ascii "Mask\0"
	.byte	0x1
	.byte	0x8d
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x11
	.ascii "k\0"
	.byte	0x1
	.byte	0x8e
	.long	0x1bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii "MinDist\0"
	.byte	0x1
	.byte	0x8f
	.long	0x365
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.ascii "CurDist\0"
	.byte	0x1
	.byte	0x8f
	.long	0x365
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x18f
	.uleb128 0x12
	.ascii "Mapper\0"
	.byte	0x1
	.byte	0x68
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x663
	.uleb128 0x10
	.ascii "InByt\0"
	.byte	0x1
	.byte	0x68
	.long	0x5a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "OutSymbs\0"
	.byte	0x1
	.byte	0x68
	.long	0x4b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.ascii "Table\0"
	.byte	0x1
	.byte	0x68
	.long	0x4c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x11
	.ascii "i\0"
	.byte	0x1
	.byte	0x69
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x11
	.ascii "BitIdx\0"
	.byte	0x1
	.byte	0x69
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x11
	.ascii "ByteIdx\0"
	.byte	0x1
	.byte	0x6a
	.long	0x1bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.ascii "j\0"
	.byte	0x1
	.byte	0x6b
	.long	0x1bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x11
	.ascii "CurBits\0"
	.byte	0x1
	.byte	0x6c
	.long	0x172
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x11
	.ascii "SymbIdx\0"
	.byte	0x1
	.byte	0x6d
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x11
	.ascii "Mask\0"
	.byte	0x1
	.byte	0x6e
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.byte	0
	.uleb128 0x13
	.ascii "GetGray\0"
	.byte	0x1
	.byte	0x49
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x6eb
	.uleb128 0x10
	.ascii "IoArray\0"
	.byte	0x1
	.byte	0x49
	.long	0x5a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "i\0"
	.byte	0x1
	.byte	0x4a
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x11
	.ascii "WrIdx\0"
	.byte	0x1
	.byte	0x4a
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x11
	.ascii "Counter\0"
	.byte	0x1
	.byte	0x4a
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0x11
	.ascii "Nblk\0"
	.byte	0x1
	.byte	0x4b
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x11
	.ascii "Shift\0"
	.byte	0x1
	.byte	0x4b
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x11
	.ascii "Mask\0"
	.byte	0x1
	.byte	0x4c
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.ascii "GetQamTable\0"
	.byte	0x1
	.byte	0x34
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x767
	.uleb128 0x10
	.ascii "IoTable\0"
	.byte	0x1
	.byte	0x34
	.long	0x4c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "j\0"
	.byte	0x1
	.byte	0x35
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x14
	.secrel32	LASF0
	.byte	0x1
	.byte	0x36
	.long	0x3c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x11
	.ascii "MaxVal\0"
	.byte	0x1
	.byte	0x37
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x11
	.ascii "Nrows\0"
	.byte	0x1
	.byte	0x38
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0x11
	.ascii "DivFct\0"
	.byte	0x1
	.byte	0x39
	.long	0x2bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x15
	.ascii "GetPskTable\0"
	.byte	0x1
	.byte	0x23
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.ascii "IoTable\0"
	.byte	0x1
	.byte	0x23
	.long	0x4c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "j\0"
	.byte	0x1
	.byte	0x24
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x14
	.secrel32	LASF0
	.byte	0x1
	.byte	0x25
	.long	0x3c8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x14
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
LASF0:
	.ascii "GrayArray\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_cos;	.scl	2;	.type	32;	.endef
	.def	_sin;	.scl	2;	.type	32;	.endef
	.def	_div;	.scl	2;	.type	32;	.endef
	.def	_pow;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_exp;	.scl	2;	.type	32;	.endef
	.def	_log;	.scl	2;	.type	32;	.endef
