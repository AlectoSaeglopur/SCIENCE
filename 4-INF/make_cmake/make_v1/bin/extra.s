	.file	"extra.c"
	.text
	.globl	_CheckParam
	.def	_CheckParam;	.scl	2;	.type	32;	.endef
_CheckParam:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	nop
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC0:
	.ascii "\12 * PARAMETERS\0"
LC1:
	.ascii "\12\11* Convolutional Coding : \0"
LC2:
	.ascii "K = %d | \0"
LC3:
	.ascii "Rc = %d/%d | \0"
LC4:
	.ascii "Hard\0"
LC5:
	.ascii "\12\11* Modulation : \0"
LC6:
	.ascii "PSK | \0"
LC7:
	.ascii "M = %d\0"
LC8:
	.ascii "\12\11- Channel : \0"
LC9:
	.ascii "AWGN | \0"
LC11:
	.ascii "Eb/N0 = %1.1f dB\0"
LC12:
	.ascii "\12\0"
	.text
	.globl	_PrintParam
	.def	_PrintParam;	.scl	2;	.type	32;	.endef
_PrintParam:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC0, (%esp)
	call	_printf
	movl	$LC1, (%esp)
	call	_printf
	movl	$7, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$3, 8(%esp)
	movl	$2, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movl	$LC4, (%esp)
	call	_printf
	movl	$LC5, (%esp)
	call	_printf
	movl	$LC6, (%esp)
	call	_printf
	movl	$4, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	movl	$LC8, (%esp)
	call	_printf
	movl	$LC9, (%esp)
	call	_printf
	fldl	LC10
	fstpl	4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	movl	$LC12, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_RandBytGen
	.def	_RandBytGen;	.scl	2;	.type	32;	.endef
_RandBytGen:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, -12(%ebp)
	jmp	L4
L5:
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	call	_rand
	movb	%al, (%ebx)
	addl	$1, -12(%ebp)
L4:
	cmpl	$99, -12(%ebp)
	jbe	L5
	nop
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_ChanBSC
	.def	_ChanBSC;	.scl	2;	.type	32;	.endef
_ChanBSC:
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
	movb	$1, -13(%ebp)
	cmpl	$0, 8(%ebp)
	je	L14
	cmpl	$0, 12(%ebp)
	je	L14
	movl	$150, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_memcpy
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, -12(%ebp)
	jmp	L8
L12:
	call	_rand
	movl	%eax, -28(%ebp)
	fildl	-28(%ebp)
	flds	LC14
	fdivrp	%st, %st(1)
	flds	16(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L9
	movl	-12(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -20(%ebp)
	movl	-12(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -21(%ebp)
	movl	12(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-13(%ebp), %ebx
	movzbl	-21(%ebp), %eax
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	L11
	movl	12(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %ecx
	movl	-20(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-13(%ebp), %ebx
	movzbl	-21(%ebp), %eax
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	notl	%eax
	andl	%esi, %eax
	movb	%al, (%edx)
	jmp	L9
L11:
	movl	12(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %ecx
	movl	-20(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-13(%ebp), %ebx
	movzbl	-21(%ebp), %eax
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
L9:
	addl	$1, -12(%ebp)
L8:
	cmpl	$1199, -12(%ebp)
	jbe	L12
L14:
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
	.globl	_ChanAWGN
	.def	_ChanAWGN;	.scl	2;	.type	32;	.endef
_ChanAWGN:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	fldz
	fstps	-16(%ebp)
	movl	$600, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetCpxSgnPower
	fstps	-72(%ebp)
	movl	-72(%ebp), %eax
	movl	%eax, -20(%ebp)
	flds	LC16
	fstps	-24(%ebp)
	flds	-20(%ebp)
	fstpl	-72(%ebp)
	flds	-24(%ebp)
	fchs
	flds	LC17
	fdivrp	%st, %st(1)
	fstpl	8(%esp)
	fldl	LC18
	fstpl	(%esp)
	call	_pow
	fmull	-72(%ebp)
	fstps	-28(%ebp)
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, -12(%ebp)
	jmp	L16
L18:
	call	_rand
	movl	%eax, -72(%ebp)
	fildl	-72(%ebp)
	fldl	LC19
	fmulp	%st, %st(1)
	fstps	-32(%ebp)
	call	_rand
	movl	%eax, -72(%ebp)
	fildl	-72(%ebp)
	fldl	LC19
	fmulp	%st, %st(1)
	fstps	-36(%ebp)
	flds	-32(%ebp)
	fstpl	(%esp)
	call	_log
	fldl	LC20
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	_sqrt
	fstpl	-72(%ebp)
	flds	-36(%ebp)
	fldl	LC21
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	_cos
	fmull	-72(%ebp)
	fstpl	-72(%ebp)
	flds	-28(%ebp)
	flds	LC22
	fdivrp	%st, %st(1)
	fstpl	(%esp)
	call	_sqrt
	fldl	-72(%ebp)
	fmulp	%st, %st(1)
	flds	-16(%ebp)
	faddp	%st, %st(1)
	fstps	-40(%ebp)
	flds	-32(%ebp)
	fstpl	(%esp)
	call	_log
	fldl	LC20
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	_sqrt
	fstpl	-72(%ebp)
	flds	-36(%ebp)
	fldl	LC21
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	_sin
	fmull	-72(%ebp)
	fstpl	-72(%ebp)
	flds	-28(%ebp)
	flds	LC22
	fdivrp	%st, %st(1)
	fstpl	(%esp)
	call	_sqrt
	fldl	-72(%ebp)
	fmulp	%st, %st(1)
	flds	-16(%ebp)
	faddp	%st, %st(1)
	fstps	-44(%ebp)
	flds	-40(%ebp)
	fabs
	flds	LC23
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	seta	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L17
	flds	-44(%ebp)
	fabs
	flds	LC23
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	seta	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L17
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-12(%ebp), %edx
	leal	0(,%edx,8), %ecx
	movl	8(%ebp), %edx
	addl	%ecx, %edx
	flds	(%edx)
	fadds	-40(%ebp)
	fstps	(%eax)
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-12(%ebp), %edx
	leal	0(,%edx,8), %ecx
	movl	8(%ebp), %edx
	addl	%ecx, %edx
	flds	4(%edx)
	fadds	-44(%ebp)
	fstps	4(%eax)
L17:
	addl	$1, -12(%ebp)
L16:
	cmpl	$599, -12(%ebp)
	jbe	L18
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_GetCpxSgnPower;	.scl	3;	.type	32;	.endef
_GetCpxSgnPower:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	fldz
	fstps	-16(%ebp)
	movl	$0, -12(%ebp)
	jmp	L20
L21:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fldl	LC24
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_pow
	fstpl	-40(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	4(%eax)
	fldl	LC24
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_pow
	faddl	-40(%ebp)
	flds	-16(%ebp)
	faddp	%st, %st(1)
	fstps	-16(%ebp)
	addl	$1, -12(%ebp)
L20:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L21
	movl	12(%ebp), %eax
	movl	$0, %edx
	movl	%eax, -40(%ebp)
	movl	%edx, -36(%ebp)
	fildq	-40(%ebp)
	fstps	-28(%ebp)
	flds	-28(%ebp)
	flds	-16(%ebp)
	fdivp	%st, %st(1)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.section .rdata,"dr"
LC25:
	.ascii " * TX INFO BITS (%d bytes)\12\11\0"
LC26:
	.ascii " * RX INFO BITS (%d bytes)\12\11\0"
LC27:
	.ascii "%2X \0"
LC28:
	.ascii "\12\11\0"
	.text
	.globl	_PrintByt
	.def	_PrintByt;	.scl	2;	.type	32;	.endef
_PrintByt:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	16(%ebp), %eax
	movb	%al, -28(%ebp)
	cmpb	$0, -28(%ebp)
	jne	L24
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC25, (%esp)
	call	_printf
	jmp	L25
L24:
	cmpb	$1, -28(%ebp)
	jne	L25
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC26, (%esp)
	call	_printf
L25:
	movl	$0, -12(%ebp)
	jmp	L26
L28:
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC27, (%esp)
	call	_printf
	movl	-12(%ebp), %ecx
	movl	$-858993459, %edx
	movl	%ecx, %eax
	mull	%edx
	shrl	$4, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	cmpl	$19, %edx
	jne	L27
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-12(%ebp), %eax
	jbe	L27
	movl	$LC28, (%esp)
	call	_printf
L27:
	addl	$1, -12(%ebp)
L26:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L28
	movl	$LC12, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.section .rdata,"dr"
LC29:
	.ascii " * TX SYMBOLS\12\11\0"
LC30:
	.ascii " * RX SYMBOLS\12\11\0"
LC31:
	.ascii "%1.2f\0"
LC32:
	.ascii "%1.2fi | \0"
	.text
	.globl	_PrintSym
	.def	_PrintSym;	.scl	2;	.type	32;	.endef
_PrintSym:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	16(%ebp), %eax
	movb	%al, -28(%ebp)
	cmpb	$4, -28(%ebp)
	jne	L30
	movl	$LC29, (%esp)
	call	_printf
	jmp	L31
L30:
	cmpb	$5, -28(%ebp)
	jne	L31
	movl	$LC30, (%esp)
	call	_printf
L31:
	movl	$0, -12(%ebp)
	jmp	L32
L38:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L33
	movl	$43, (%esp)
	call	_putchar
L33:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	4(%eax)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L35
	movl	$43, (%esp)
	call	_putchar
L35:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	4(%eax)
	fstpl	4(%esp)
	movl	$LC32, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	andl	$3, %eax
	cmpl	$3, %eax
	jne	L37
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-12(%ebp), %eax
	jbe	L37
	movl	$LC28, (%esp)
	call	_printf
L37:
	addl	$1, -12(%ebp)
L32:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L38
	movl	$LC12, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.section .rdata,"dr"
	.align 4
LC33:
	.ascii " * SOFT DEMAPPING LLR VALUES\12\11\0"
LC34:
	.ascii "%1.3f \0"
	.text
	.globl	_PrintLLRs
	.def	_PrintLLRs;	.scl	2;	.type	32;	.endef
_PrintLLRs:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC33, (%esp)
	call	_printf
	movl	$0, -12(%ebp)
	jmp	L42
L46:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L43
	movl	$43, (%esp)
	call	_putchar
L43:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC34, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	andl	$7, %eax
	cmpl	$7, %eax
	jne	L45
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-12(%ebp), %eax
	jbe	L45
	movl	$LC28, (%esp)
	call	_printf
L45:
	addl	$1, -12(%ebp)
L42:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L46
	movl	$LC12, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
LC35:
	.ascii "State#%2d\0"
LC36:
	.ascii "\11"
	.ascii "0 -> %d %d |\0"
LC37:
	.ascii " 1 -> %d %d\12\0"
	.text
	.globl	_PrintConvDiagr
	.def	_PrintConvDiagr;	.scl	2;	.type	32;	.endef
_PrintConvDiagr:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movb	$0, -9(%ebp)
	jmp	L49
L50:
	movzbl	-9(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC35, (%esp)
	call	_printf
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	movzbl	2(%eax,%edx,4), %eax
	movzbl	%al, %edx
	movzbl	-9(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	(%eax,%ecx,4), %eax
	movzbl	%al, %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC36, (%esp)
	call	_printf
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	movzbl	3(%eax,%edx,4), %eax
	movzbl	%al, %edx
	movzbl	-9(%ebp), %ecx
	movl	8(%ebp), %eax
	movzbl	1(%eax,%ecx,4), %eax
	movzbl	%al, %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC37, (%esp)
	call	_printf
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L49:
	cmpb	$63, -9(%ebp)
	jbe	L50
	movl	$10, (%esp)
	call	_putchar
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
LC38:
	.ascii " * MAPPING TABLE\12\11\0"
LC39:
	.ascii "%2d: \0"
LC40:
	.ascii "%1.2fi\0"
LC41:
	.ascii " | \0"
	.text
	.globl	_PrintTable
	.def	_PrintTable;	.scl	2;	.type	32;	.endef
_PrintTable:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$LC38, (%esp)
	call	_printf
	movb	$0, -9(%ebp)
	jmp	L52
L59:
	movzbl	-9(%ebp), %eax
	movl	8(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC39, (%esp)
	call	_printf
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	flds	4(%eax,%edx,8)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L53
	movl	$43, (%esp)
	call	_putchar
L53:
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	flds	4(%eax,%edx,8)
	fstpl	4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	flds	8(%eax,%edx,8)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L55
	movl	$43, (%esp)
	call	_putchar
L55:
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	flds	8(%eax,%edx,8)
	fstpl	4(%esp)
	movl	$LC40, (%esp)
	call	_printf
	movzbl	-9(%ebp), %eax
	andl	$3, %eax
	cmpb	$3, %al
	jne	L57
	cmpb	$2, -9(%ebp)
	ja	L57
	movl	$LC28, (%esp)
	call	_printf
	jmp	L58
L57:
	cmpb	$2, -9(%ebp)
	ja	L58
	movl	$LC41, (%esp)
	call	_printf
L58:
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L52:
	cmpb	$3, -9(%ebp)
	jbe	L59
	movl	$LC12, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.section .rdata,"dr"
LC42:
	.ascii "w\0"
LC43:
	.ascii "TxInfoBytes.csv\0"
LC44:
	.ascii "RxInfoBytes.csv\0"
LC45:
	.ascii "%d\0"
	.text
	.globl	_WriteBytCsv
	.def	_WriteBytCsv;	.scl	2;	.type	32;	.endef
_WriteBytCsv:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	16(%ebp), %eax
	movb	%al, -28(%ebp)
	cmpb	$0, -28(%ebp)
	jne	L63
	movl	$LC42, 4(%esp)
	movl	$LC43, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	jmp	L64
L63:
	cmpb	$1, -28(%ebp)
	jne	L64
	movl	$LC42, 4(%esp)
	movl	$LC44, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
L64:
	cmpl	$0, -16(%ebp)
	je	L65
	movl	$0, -12(%ebp)
	jmp	L66
L68:
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$LC45, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-12(%ebp), %eax
	jbe	L67
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L67:
	addl	$1, -12(%ebp)
L66:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L68
L65:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.section .rdata,"dr"
LC46:
	.ascii "TxCpxSymbs.csv\0"
LC47:
	.ascii "RxCpxSymbs.csv\0"
LC48:
	.ascii "%1.4f,%1.4f\0"
	.text
	.globl	_WriteSymCsv
	.def	_WriteSymCsv;	.scl	2;	.type	32;	.endef
_WriteSymCsv:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	16(%ebp), %eax
	movb	%al, -28(%ebp)
	cmpb	$4, -28(%ebp)
	jne	L70
	movl	$LC42, 4(%esp)
	movl	$LC46, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	jmp	L71
L70:
	cmpb	$5, -28(%ebp)
	jne	L71
	movl	$LC42, 4(%esp)
	movl	$LC47, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
L71:
	cmpl	$0, -16(%ebp)
	je	L72
	movl	$0, -12(%ebp)
	jmp	L73
L75:
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	4(%eax)
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fxch	%st(1)
	fstpl	16(%esp)
	fstpl	8(%esp)
	movl	$LC48, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-12(%ebp), %eax
	jbe	L74
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L74:
	addl	$1, -12(%ebp)
L73:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L75
L72:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.section .rdata,"dr"
	.align 4
LC49:
	.ascii " * Errors before decoding : %d out of %d bits\12\12\0"
	.align 4
LC50:
	.ascii " * Errors after decoding : %d out of %d bits\0"
LC51:
	.ascii " (BER = %1.2e)\12\12\0"
	.text
	.globl	_CheckWrongBits
	.def	_CheckWrongBits;	.scl	2;	.type	32;	.endef
_CheckWrongBits:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	movl	20(%ebp), %eax
	movb	%al, -44(%ebp)
	movl	$0, -16(%ebp)
	movb	$1, -17(%ebp)
	movl	16(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -24(%ebp)
	cmpl	$0, 8(%ebp)
	je	L77
	cmpl	$0, 12(%ebp)
	je	L77
	movl	$0, -12(%ebp)
	jmp	L78
L80:
	movl	-12(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	movl	-12(%ebp), %eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	movl	8(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-29(%ebp), %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sarl	%cl, %ebx
	movl	12(%ebp), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-29(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	xorl	%eax, %ebx
	movl	%ebx, %edx
	movzbl	-17(%ebp), %eax
	andl	%edx, %eax
	testl	%eax, %eax
	je	L79
	addl	$1, -16(%ebp)
L79:
	addl	$1, -12(%ebp)
L78:
	movl	-12(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jb	L80
L77:
	cmpb	$3, -44(%ebp)
	jne	L81
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC49, (%esp)
	call	_printf
	jmp	L83
L81:
	cmpb	$1, -44(%ebp)
	jne	L83
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC50, (%esp)
	call	_printf
	movl	-16(%ebp), %eax
	movl	$0, %edx
	movl	%eax, -56(%ebp)
	movl	%edx, -52(%ebp)
	fildq	-56(%ebp)
	fstps	-48(%ebp)
	flds	-48(%ebp)
	movl	-24(%ebp), %eax
	movl	$0, %edx
	movl	%eax, -56(%ebp)
	movl	%edx, -52(%ebp)
	fildq	-56(%ebp)
	fstps	-48(%ebp)
	flds	-48(%ebp)
	fdivrp	%st, %st(1)
	fstpl	4(%esp)
	movl	$LC51, (%esp)
	call	_printf
L83:
	nop
	addl	$68, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.section .rdata,"dr"
	.align 8
LC10:
	.long	0
	.long	1075052544
	.align 4
LC14:
	.long	1191181824
	.align 4
LC16:
	.long	1090529840
	.align 4
LC17:
	.long	1092616192
	.align 8
LC18:
	.long	0
	.long	1076101120
	.align 8
LC19:
	.long	4194432
	.long	1056964640
	.align 8
LC20:
	.long	0
	.long	-1073741824
	.align 8
LC21:
	.long	1413754136
	.long	1075388923
	.align 4
LC22:
	.long	1073741824
	.align 4
LC23:
	.long	2139095039
	.align 8
LC24:
	.long	0
	.long	1073741824
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
	.def	_pow;	.scl	2;	.type	32;	.endef
	.def	_log;	.scl	2;	.type	32;	.endef
	.def	_sqrt;	.scl	2;	.type	32;	.endef
	.def	_cos;	.scl	2;	.type	32;	.endef
	.def	_sin;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fputc;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
