	.file	"modulation.c"
	.text
	.globl	_GetPskTable
	.def	_GetPskTable;	.scl	2;	.type	32;	.endef
_GetPskTable:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	leal	-13(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetGray
	movb	$0, -9(%ebp)
	jmp	L2
L3:
	movzbl	-9(%ebp), %eax
	movzbl	-9(%ebp), %edx
	movzbl	-13(%ebp,%edx), %ecx
	movl	8(%ebp), %edx
	movb	%cl, (%edx,%eax)
	movzbl	-9(%ebp), %ebx
	movzbl	-9(%ebp), %eax
	movl	%eax, -32(%ebp)
	fildl	-32(%ebp)
	fldl	LC0
	fmulp	%st, %st(1)
	fldl	LC1
	fdivrp	%st, %st(1)
	fldl	LC2
	faddp	%st, %st(1)
	fstpl	(%esp)
	call	_cos
	fstps	-28(%ebp)
	flds	-28(%ebp)
	movl	8(%ebp), %eax
	fstps	4(%eax,%ebx,8)
	movzbl	-9(%ebp), %ebx
	movzbl	-9(%ebp), %eax
	movl	%eax, -32(%ebp)
	fildl	-32(%ebp)
	fldl	LC0
	fmulp	%st, %st(1)
	fldl	LC1
	fdivrp	%st, %st(1)
	fldl	LC2
	faddp	%st, %st(1)
	fstpl	(%esp)
	call	_sin
	fstps	-28(%ebp)
	flds	-28(%ebp)
	movl	8(%ebp), %eax
	fstps	8(%eax,%ebx,8)
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L2:
	cmpb	$3, -9(%ebp)
	jbe	L3
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
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	movb	$1, -10(%ebp)
	movb	$2, -11(%ebp)
	leal	-15(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetGray
	movb	$0, -9(%ebp)
	jmp	L5
L6:
	movzbl	-11(%ebp), %edx
	movzbl	-9(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_div
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	movzbl	-9(%ebp), %eax
	movzbl	-9(%ebp), %edx
	movzbl	-15(%ebp,%edx), %ecx
	movl	8(%ebp), %edx
	movb	%cl, (%edx,%eax)
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
	movzbl	-9(%ebp), %edx
	movzbl	-10(%ebp), %eax
	movl	-24(%ebp), %ecx
	addl	%ecx, %ecx
	subl	%ecx, %eax
	movl	%eax, -40(%ebp)
	fildl	-40(%ebp)
	movl	8(%ebp), %eax
	fstps	8(%eax,%edx,8)
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L5:
	cmpb	$3, -9(%ebp)
	jbe	L6
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
	movb	$1, -12(%ebp)
	movl	$4, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	movb	$0, -9(%ebp)
	jmp	L8
L13:
	movzbl	-9(%ebp), %eax
	movl	$4, %edx
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movb	%al, -13(%ebp)
	movl	$1, %eax
	subb	-9(%ebp), %al
	movb	%al, -14(%ebp)
	movb	$0, -11(%ebp)
	movzbl	-13(%ebp), %eax
	shrb	%al
	movb	%al, -10(%ebp)
	jmp	L9
L12:
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
	movzbl	-11(%ebp), %eax
	movzbl	-13(%ebp), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	jge	L10
	movzbl	-11(%ebp), %eax
	addl	$1, %eax
	movb	%al, -11(%ebp)
	jmp	L11
L10:
	movb	$0, -11(%ebp)
	movzbl	-13(%ebp), %eax
	addb	%al, -10(%ebp)
L11:
	movzbl	-10(%ebp), %eax
	addl	$1, %eax
	movb	%al, -10(%ebp)
L9:
	cmpb	$3, -10(%ebp)
	jbe	L12
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L8:
	cmpb	$1, -9(%ebp)
	jbe	L13
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
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	movl	$0, -8(%ebp)
	movb	$0, -9(%ebp)
	movb	$0, -10(%ebp)
	movb	$1, -11(%ebp)
	jmp	L15
L21:
	movzbl	-10(%ebp), %eax
	addl	$1, %eax
	movb	%al, -10(%ebp)
	movl	-8(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -16(%ebp)
	movl	-8(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -17(%ebp)
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
	cmpb	$2, -10(%ebp)
	jne	L16
	movb	$0, -1(%ebp)
	jmp	L17
L20:
	movzbl	-1(%ebp), %eax
	movl	16(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %edx
	movsbl	-9(%ebp), %eax
	cmpl	%eax, %edx
	jne	L18
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
	jmp	L19
L18:
	movzbl	-1(%ebp), %eax
	addl	$1, %eax
	movb	%al, -1(%ebp)
L17:
	cmpb	$3, -1(%ebp)
	jbe	L20
L19:
	movb	$0, -10(%ebp)
	movb	$0, -9(%ebp)
L16:
	addl	$1, -8(%ebp)
L15:
	cmpl	$1199, -8(%ebp)
	jbe	L21
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
	movb	$1, -25(%ebp)
	movl	$0, -20(%ebp)
	movl	$150, 8(%esp)
	movl	$0, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_memset
	movl	$0, -16(%ebp)
	jmp	L23
L31:
	movb	$0, -10(%ebp)
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
	movb	$1, -9(%ebp)
	jmp	L24
L27:
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
	flds	-24(%ebp)
	flds	-32(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L25
	flds	-32(%ebp)
	fstps	-24(%ebp)
	movzbl	-9(%ebp), %eax
	movb	%al, -10(%ebp)
L25:
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L24:
	cmpb	$3, -9(%ebp)
	jbe	L27
	movb	$0, -9(%ebp)
	jmp	L28
L30:
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
	movl	-20(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -36(%ebp)
	movl	-20(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -37(%ebp)
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
	addl	$1, -20(%ebp)
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L28:
	cmpb	$1, -9(%ebp)
	jbe	L30
	addl	$1, -16(%ebp)
L23:
	cmpl	$599, -16(%ebp)
	jbe	L31
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
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	movb	$1, -25(%ebp)
	flds	LC5
	fstps	-32(%ebp)
	movl	$0, -12(%ebp)
	jmp	L34
L41:
	movb	$0, -13(%ebp)
	jmp	L35
L40:
	fldz
	fstps	-20(%ebp)
	fldz
	fstps	-24(%ebp)
	movb	$0, -14(%ebp)
	jmp	L36
L39:
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
	flds	-20(%ebp)
	fadds	-36(%ebp)
	fstps	-20(%ebp)
	jmp	L38
L37:
	flds	-24(%ebp)
	fadds	-36(%ebp)
	fstps	-24(%ebp)
L38:
	movzbl	-14(%ebp), %eax
	addl	$1, %eax
	movb	%al, -14(%ebp)
L36:
	cmpb	$3, -14(%ebp)
	jbe	L39
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
	movzbl	-13(%ebp), %eax
	addl	$1, %eax
	movb	%al, -13(%ebp)
L35:
	cmpb	$1, -13(%ebp)
	jbe	L40
	addl	$1, -12(%ebp)
L34:
	cmpl	$599, -12(%ebp)
	jbe	L41
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
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_cos;	.scl	2;	.type	32;	.endef
	.def	_sin;	.scl	2;	.type	32;	.endef
	.def	_div;	.scl	2;	.type	32;	.endef
	.def	_pow;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_exp;	.scl	2;	.type	32;	.endef
	.def	_log;	.scl	2;	.type	32;	.endef
