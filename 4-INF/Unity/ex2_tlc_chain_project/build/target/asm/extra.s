	.file	"extra.c"
	.text
Ltext0:
	.globl	_CheckParam
	.def	_CheckParam;	.scl	2;	.type	32;	.endef
_CheckParam:
LFB18:
	.file 1 "src/extra.c"
	.loc 1 25 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	.loc 1 51 0
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
	.loc 1 58 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 59 0
	movl	$LC0, (%esp)
	call	_printf
	.loc 1 60 0
	movl	$LC1, (%esp)
	call	_printf
	.loc 1 61 0
	movl	$7, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	.loc 1 62 0
	movl	$3, 8(%esp)
	movl	$2, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	.loc 1 64 0
	movl	$LC4, (%esp)
	call	_printf
	.loc 1 67 0
	movl	$LC5, (%esp)
	call	_printf
	.loc 1 69 0
	movl	$LC6, (%esp)
	call	_printf
	.loc 1 72 0
	movl	$4, 4(%esp)
	movl	$LC7, (%esp)
	call	_printf
	.loc 1 73 0
	movl	$LC8, (%esp)
	call	_printf
	.loc 1 74 0
	movl	$LC9, (%esp)
	call	_printf
	.loc 1 75 0
	fldl	LC10
	fstpl	4(%esp)
	movl	$LC11, (%esp)
	call	_printf
	.loc 1 76 0
	movl	$LC12, (%esp)
	call	_puts
	.loc 1 77 0
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
	.loc 1 85 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 87 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	.loc 1 88 0
	movl	$0, -12(%ebp)
	jmp	L4
L5:
	.loc 1 89 0 discriminator 3
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	call	_rand
	movb	%al, (%ebx)
	.loc 1 88 0 discriminator 3
	addl	$1, -12(%ebp)
L4:
	.loc 1 88 0 is_stmt 0 discriminator 1
	cmpl	$99, -12(%ebp)
	jbe	L5
	.loc 1 91 0 is_stmt 1
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
	.loc 1 101 0
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
	.loc 1 104 0
	movb	$1, -13(%ebp)
	.loc 1 105 0
	cmpl	$0, 8(%ebp)
	je	L14
	.loc 1 105 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L14
	.loc 1 106 0 is_stmt 1
	movl	$150, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 107 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	.loc 1 108 0
	movl	$0, -12(%ebp)
	jmp	L8
L12:
	.loc 1 109 0
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
	.loc 1 110 0
	movl	-12(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -20(%ebp)
	.loc 1 111 0
	movl	-12(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -21(%ebp)
	.loc 1 112 0
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
	.loc 1 113 0
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
	.loc 1 115 0
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
	.loc 1 108 0 discriminator 2
	addl	$1, -12(%ebp)
L8:
	.loc 1 108 0 is_stmt 0 discriminator 1
	cmpl	$1199, -12(%ebp)
	jbe	L12
L14:
	.loc 1 120 0 is_stmt 1
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
	.loc 1 128 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	.loc 1 132 0
	fldz
	fstps	-16(%ebp)
	.loc 1 133 0
	movl	$600, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetCpxSgnPower
	fstps	-72(%ebp)
	movl	-72(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 134 0
	flds	LC16
	fstps	-24(%ebp)
	.loc 1 135 0
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
	.loc 1 136 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	.loc 1 137 0
	movl	$0, -12(%ebp)
	jmp	L16
L18:
	.loc 1 138 0
	call	_rand
	movl	%eax, -72(%ebp)
	fildl	-72(%ebp)
	fldl	LC19
	fmulp	%st, %st(1)
	fstps	-32(%ebp)
	.loc 1 139 0
	call	_rand
	movl	%eax, -72(%ebp)
	fildl	-72(%ebp)
	fldl	LC19
	fmulp	%st, %st(1)
	fstps	-36(%ebp)
	.loc 1 140 0
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
	.loc 1 141 0
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
	.loc 1 142 0
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
	.loc 1 142 0 is_stmt 0 discriminator 1
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
	.loc 1 143 0 is_stmt 1
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
	.loc 1 144 0
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
	.loc 1 137 0 discriminator 2
	addl	$1, -12(%ebp)
L16:
	.loc 1 137 0 is_stmt 0 discriminator 1
	cmpl	$599, -12(%ebp)
	jbe	L18
	.loc 1 147 0 is_stmt 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.globl	_GetCpxSgnPower
	.def	_GetCpxSgnPower;	.scl	2;	.type	32;	.endef
_GetCpxSgnPower:
LFB23:
	.loc 1 156 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 158 0
	fldz
	fstps	-16(%ebp)
	.loc 1 159 0
	movl	$0, -12(%ebp)
	jmp	L20
L21:
	.loc 1 160 0 discriminator 3
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
	.loc 1 159 0 discriminator 3
	addl	$1, -12(%ebp)
L20:
	.loc 1 159 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L21
	.loc 1 162 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	$0, %edx
	movl	%eax, -40(%ebp)
	movl	%edx, -36(%ebp)
	fildq	-40(%ebp)
	fstps	-28(%ebp)
	flds	-28(%ebp)
	flds	-16(%ebp)
	fdivp	%st, %st(1)
	.loc 1 163 0
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
	.loc 1 173 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	16(%ebp), %eax
	movb	%al, -28(%ebp)
	.loc 1 174 0
	cmpb	$0, -28(%ebp)
	jne	L24
	.loc 1 175 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC25, (%esp)
	call	_printf
	jmp	L25
L24:
	.loc 1 176 0
	cmpb	$1, -28(%ebp)
	jne	L25
	.loc 1 177 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC26, (%esp)
	call	_printf
L25:
	.loc 1 181 0
	movl	$0, -12(%ebp)
	jmp	L26
L28:
	.loc 1 182 0
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC27, (%esp)
	call	_printf
	.loc 1 183 0
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
	.loc 1 183 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-12(%ebp), %eax
	jbe	L27
	.loc 1 184 0 is_stmt 1
	movl	$LC28, (%esp)
	call	_printf
L27:
	.loc 1 181 0 discriminator 2
	addl	$1, -12(%ebp)
L26:
	.loc 1 181 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L28
	.loc 1 187 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
	.loc 1 189 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 190 0
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
	.loc 1 200 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	16(%ebp), %eax
	movb	%al, -28(%ebp)
	.loc 1 202 0
	cmpb	$4, -28(%ebp)
	jne	L30
	.loc 1 203 0
	movl	$LC29, (%esp)
	call	_printf
	jmp	L31
L30:
	.loc 1 204 0
	cmpb	$5, -28(%ebp)
	jne	L31
	.loc 1 205 0
	movl	$LC30, (%esp)
	call	_printf
L31:
	.loc 1 207 0
	movl	$0, -12(%ebp)
	jmp	L32
L38:
	.loc 1 208 0
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
	.loc 1 209 0
	movl	$43, (%esp)
	call	_putchar
L33:
	.loc 1 211 0
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	.loc 1 213 0
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
	.loc 1 214 0
	movl	$43, (%esp)
	call	_putchar
L35:
	.loc 1 216 0
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	4(%eax)
	fstpl	4(%esp)
	movl	$LC32, (%esp)
	call	_printf
	.loc 1 218 0
	movl	-12(%ebp), %eax
	andl	$3, %eax
	cmpl	$3, %eax
	jne	L37
	.loc 1 218 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-12(%ebp), %eax
	jbe	L37
	.loc 1 219 0 is_stmt 1
	movl	$LC28, (%esp)
	call	_printf
L37:
	.loc 1 207 0 discriminator 2
	addl	$1, -12(%ebp)
L32:
	.loc 1 207 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L38
	.loc 1 223 0 is_stmt 1
	movl	$LC12, (%esp)
	call	_puts
	.loc 1 224 0
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
	.loc 1 233 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 235 0
	movl	$LC33, (%esp)
	call	_printf
	.loc 1 236 0
	movl	$0, -12(%ebp)
	jmp	L42
L46:
	.loc 1 237 0
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
	.loc 1 238 0
	movl	$43, (%esp)
	call	_putchar
L43:
	.loc 1 240 0
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$LC34, (%esp)
	call	_printf
	.loc 1 241 0
	movl	-12(%ebp), %eax
	andl	$7, %eax
	cmpl	$7, %eax
	jne	L45
	.loc 1 241 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-12(%ebp), %eax
	jbe	L45
	.loc 1 242 0 is_stmt 1
	movl	$LC28, (%esp)
	call	_printf
L45:
	.loc 1 236 0 discriminator 2
	addl	$1, -12(%ebp)
L42:
	.loc 1 236 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L46
	.loc 1 245 0 is_stmt 1
	movl	$LC12, (%esp)
	call	_puts
	.loc 1 246 0
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
	.loc 1 254 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 256 0
	movb	$0, -9(%ebp)
	jmp	L49
L50:
	.loc 1 257 0 discriminator 3
	movzbl	-9(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC35, (%esp)
	call	_printf
	.loc 1 258 0 discriminator 3
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
	.loc 1 259 0 discriminator 3
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
	.loc 1 256 0 discriminator 3
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L49:
	.loc 1 256 0 is_stmt 0 discriminator 1
	cmpb	$63, -9(%ebp)
	jbe	L50
	.loc 1 261 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
	.loc 1 262 0
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
	.loc 1 270 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 272 0
	movl	$LC38, (%esp)
	call	_printf
	.loc 1 273 0
	movb	$0, -9(%ebp)
	jmp	L52
L59:
	.loc 1 274 0
	movzbl	-9(%ebp), %eax
	movl	8(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC39, (%esp)
	call	_printf
	.loc 1 275 0
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	flds	4(%eax,%edx,8)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L53
	.loc 1 276 0
	movl	$43, (%esp)
	call	_putchar
L53:
	.loc 1 278 0
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	flds	4(%eax,%edx,8)
	fstpl	4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	.loc 1 280 0
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	flds	8(%eax,%edx,8)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jb	L55
	.loc 1 281 0
	movl	$43, (%esp)
	call	_putchar
L55:
	.loc 1 283 0
	movzbl	-9(%ebp), %edx
	movl	8(%ebp), %eax
	flds	8(%eax,%edx,8)
	fstpl	4(%esp)
	movl	$LC40, (%esp)
	call	_printf
	.loc 1 285 0
	movzbl	-9(%ebp), %eax
	andl	$3, %eax
	cmpb	$3, %al
	jne	L57
	.loc 1 285 0 is_stmt 0 discriminator 1
	cmpb	$2, -9(%ebp)
	ja	L57
	.loc 1 286 0 is_stmt 1
	movl	$LC28, (%esp)
	call	_printf
	jmp	L58
L57:
	.loc 1 287 0
	cmpb	$2, -9(%ebp)
	ja	L58
	.loc 1 288 0
	movl	$LC41, (%esp)
	call	_printf
L58:
	.loc 1 273 0 discriminator 2
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L52:
	.loc 1 273 0 is_stmt 0 discriminator 1
	cmpb	$3, -9(%ebp)
	jbe	L59
	.loc 1 291 0 is_stmt 1
	movl	$LC12, (%esp)
	call	_puts
	.loc 1 292 0
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
	.loc 1 302 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	16(%ebp), %eax
	movb	%al, -28(%ebp)
	.loc 1 305 0
	cmpb	$0, -28(%ebp)
	jne	L63
	.loc 1 306 0
	movl	$LC42, 4(%esp)
	movl	$LC43, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	jmp	L64
L63:
	.loc 1 307 0
	cmpb	$1, -28(%ebp)
	jne	L64
	.loc 1 308 0
	movl	$LC42, 4(%esp)
	movl	$LC44, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
L64:
	.loc 1 310 0
	cmpl	$0, -16(%ebp)
	je	L65
	.loc 1 311 0
	movl	$0, -12(%ebp)
	jmp	L66
L68:
	.loc 1 312 0
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
	.loc 1 313 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-12(%ebp), %eax
	jbe	L67
	.loc 1 314 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L67:
	.loc 1 311 0 discriminator 2
	addl	$1, -12(%ebp)
L66:
	.loc 1 311 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L68
L65:
	.loc 1 318 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	.loc 1 319 0
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
	.loc 1 329 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	16(%ebp), %eax
	movb	%al, -28(%ebp)
	.loc 1 332 0
	cmpb	$4, -28(%ebp)
	jne	L70
	.loc 1 333 0
	movl	$LC42, 4(%esp)
	movl	$LC46, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	jmp	L71
L70:
	.loc 1 334 0
	cmpb	$5, -28(%ebp)
	jne	L71
	.loc 1 335 0
	movl	$LC42, 4(%esp)
	movl	$LC47, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
L71:
	.loc 1 337 0
	cmpl	$0, -16(%ebp)
	je	L72
	.loc 1 338 0
	movl	$0, -12(%ebp)
	jmp	L73
L75:
	.loc 1 339 0
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
	.loc 1 340 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-12(%ebp), %eax
	jbe	L74
	.loc 1 341 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L74:
	.loc 1 338 0 discriminator 2
	addl	$1, -12(%ebp)
L73:
	.loc 1 338 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L75
L72:
	.loc 1 345 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	.loc 1 346 0
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
	.loc 1 357 0
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
	.loc 1 360 0
	movl	$0, -16(%ebp)
	.loc 1 361 0
	movb	$1, -17(%ebp)
	.loc 1 362 0
	movl	16(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -24(%ebp)
	.loc 1 363 0
	cmpl	$0, 8(%ebp)
	je	L77
	.loc 1 363 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L77
	.loc 1 364 0 is_stmt 1
	movl	$0, -12(%ebp)
	jmp	L78
L80:
	.loc 1 365 0
	movl	-12(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 366 0
	movl	-12(%ebp), %eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 367 0
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
	.loc 1 368 0
	addl	$1, -16(%ebp)
L79:
	.loc 1 364 0 discriminator 2
	addl	$1, -12(%ebp)
L78:
	.loc 1 364 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jb	L80
L77:
	.loc 1 372 0 is_stmt 1
	cmpb	$3, -44(%ebp)
	jne	L81
	.loc 1 373 0
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC49, (%esp)
	call	_printf
	jmp	L82
L81:
	.loc 1 374 0
	cmpb	$1, -44(%ebp)
	jne	L82
	.loc 1 375 0
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC50, (%esp)
	call	_printf
	.loc 1 376 0
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
L82:
	.loc 1 379 0
	cmpl	$0, -16(%ebp)
	sete	%al
	.loc 1 380 0
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
	.text
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/setting.h"
	.file 7 "src/extra.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xa02
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\extra.c\0"
	.ascii "H:\\SCIENCE\\4-INF\\Unity\\ex2_tlc_chain_project\0"
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
	.long	0x15b
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x15b
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xc5
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x15b
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xc5
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xc5
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xc5
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xc5
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x15b
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xcc
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xd4
	.uleb128 0x7
	.long	0x161
	.long	0x178
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x16d
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
	.long	0x82
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xc5
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x204
	.uleb128 0x5
	.byte	0x4
	.long	0x15b
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xc5
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xc5
	.uleb128 0x7
	.long	0x15b
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
	.long	0x82
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x82
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x82
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x82
	.uleb128 0xa
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xc5
	.uleb128 0xa
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xc5
	.uleb128 0xa
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0xa8
	.uleb128 0x7
	.long	0x15b
	.long	0x2d0
	.uleb128 0xb
	.long	0x2d0
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
	.long	0x2c0
	.uleb128 0xa
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xc5
	.uleb128 0xa
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0xa8
	.uleb128 0xa
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2c0
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
	.byte	0x50
	.long	0x365
	.uleb128 0x4
	.ascii "OutBits\0"
	.byte	0x6
	.byte	0x51
	.long	0x365
	.byte	0
	.uleb128 0x4
	.ascii "NextState\0"
	.byte	0x6
	.byte	0x52
	.long	0x365
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x193
	.long	0x375
	.uleb128 0xb
	.long	0x2d0
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.ascii "info\0"
	.byte	0x6
	.byte	0x53
	.long	0x336
	.uleb128 0xc
	.ascii "TD2\0"
	.word	0x100
	.byte	0x6
	.byte	0x55
	.long	0x39e
	.uleb128 0x4
	.ascii "States\0"
	.byte	0x6
	.byte	0x56
	.long	0x39e
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x375
	.long	0x3ae
	.uleb128 0xb
	.long	0x2d0
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.ascii "trellis\0"
	.byte	0x6
	.byte	0x57
	.long	0x381
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x3
	.ascii "TD5\0"
	.byte	0x8
	.byte	0x6
	.byte	0x65
	.long	0x3e9
	.uleb128 0x4
	.ascii "Re\0"
	.byte	0x6
	.byte	0x66
	.long	0x3bd
	.byte	0
	.uleb128 0x4
	.ascii "Im\0"
	.byte	0x6
	.byte	0x67
	.long	0x3bd
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.ascii "complex\0"
	.byte	0x6
	.byte	0x68
	.long	0x3c6
	.uleb128 0x3
	.ascii "TD6\0"
	.byte	0x24
	.byte	0x6
	.byte	0x6a
	.long	0x420
	.uleb128 0x4
	.ascii "Bits\0"
	.byte	0x6
	.byte	0x6b
	.long	0x420
	.byte	0
	.uleb128 0x4
	.ascii "Symbs\0"
	.byte	0x6
	.byte	0x6c
	.long	0x430
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	0x193
	.long	0x430
	.uleb128 0xb
	.long	0x2d0
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	0x3e9
	.long	0x440
	.uleb128 0xb
	.long	0x2d0
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.ascii "phasemap\0"
	.byte	0x6
	.byte	0x6d
	.long	0x3f8
	.uleb128 0xd
	.byte	0x4
	.long	0x82
	.byte	0x7
	.byte	0x1a
	.long	0x4c0
	.uleb128 0xe
	.ascii "PRID_TXINFOB\0"
	.byte	0
	.uleb128 0xe
	.ascii "PRID_RXINFOB\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "PRID_TXCCB\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "PRID_RXCCB\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "PRID_TXSYMB\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "PRID_RXSYMB\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "PRID_INVALID\0"
	.byte	0xff
	.byte	0
	.uleb128 0xf
	.ascii "CheckWrongBits\0"
	.byte	0x1
	.word	0x165
	.long	0x594
	.long	LFB31
	.long	LFE31-LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x594
	.uleb128 0x10
	.ascii "Stream_A\0"
	.byte	0x1
	.word	0x165
	.long	0x59d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "Stream_B\0"
	.byte	0x1
	.word	0x165
	.long	0x59d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.ascii "Len\0"
	.byte	0x1
	.word	0x165
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x11
	.secrel32	LASF0
	.byte	0x1
	.word	0x165
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x12
	.ascii "BitIdx\0"
	.byte	0x1
	.word	0x166
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x12
	.ascii "j\0"
	.byte	0x1
	.word	0x167
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.ascii "ByteIdx\0"
	.byte	0x1
	.word	0x167
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.ascii "ErrCount\0"
	.byte	0x1
	.word	0x168
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.ascii "Mask\0"
	.byte	0x1
	.word	0x169
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x12
	.ascii "BitLen\0"
	.byte	0x1
	.word	0x16a
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x5
	.byte	0x4
	.long	0x193
	.uleb128 0x13
	.ascii "WriteSymCsv\0"
	.byte	0x1
	.word	0x149
	.long	LFB30
	.long	LFE30-LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x60f
	.uleb128 0x10
	.ascii "Symbols\0"
	.byte	0x1
	.word	0x149
	.long	0x60f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "Len\0"
	.byte	0x1
	.word	0x149
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.secrel32	LASF0
	.byte	0x1
	.word	0x149
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.ascii "j\0"
	.byte	0x1
	.word	0x14a
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.ascii "fid\0"
	.byte	0x1
	.word	0x14b
	.long	0x615
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x3e9
	.uleb128 0x5
	.byte	0x4
	.long	0x161
	.uleb128 0x13
	.ascii "WriteBytCsv\0"
	.byte	0x1
	.word	0x12e
	.long	LFB29
	.long	LFE29-LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x685
	.uleb128 0x10
	.ascii "Bytes\0"
	.byte	0x1
	.word	0x12e
	.long	0x59d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "Len\0"
	.byte	0x1
	.word	0x12e
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.secrel32	LASF0
	.byte	0x1
	.word	0x12e
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.ascii "j\0"
	.byte	0x1
	.word	0x12f
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.ascii "fid\0"
	.byte	0x1
	.word	0x130
	.long	0x615
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x13
	.ascii "PrintTable\0"
	.byte	0x1
	.word	0x10e
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x6c4
	.uleb128 0x10
	.ascii "MapTable\0"
	.byte	0x1
	.word	0x10e
	.long	0x6c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.ascii "j\0"
	.byte	0x1
	.word	0x10f
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x440
	.uleb128 0x14
	.ascii "PrintConvDiagr\0"
	.byte	0x1
	.byte	0xfe
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x70b
	.uleb128 0x15
	.ascii "ConvDiagr\0"
	.byte	0x1
	.byte	0xfe
	.long	0x70b
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.byte	0xff
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x3ae
	.uleb128 0x14
	.ascii "PrintLLRs\0"
	.byte	0x1
	.byte	0xe9
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x756
	.uleb128 0x15
	.ascii "LLRs\0"
	.byte	0x1
	.byte	0xe9
	.long	0x756
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "Len\0"
	.byte	0x1
	.byte	0xe9
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.byte	0xea
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x3bd
	.uleb128 0x14
	.ascii "PrintSym\0"
	.byte	0x1
	.byte	0xc8
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x7b1
	.uleb128 0x15
	.ascii "Symbols\0"
	.byte	0x1
	.byte	0xc8
	.long	0x60f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "Len\0"
	.byte	0x1
	.byte	0xc8
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF0
	.byte	0x1
	.byte	0xc8
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.byte	0xc9
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.ascii "PrintByt\0"
	.byte	0x1
	.byte	0xad
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x804
	.uleb128 0x15
	.ascii "Bytes\0"
	.byte	0x1
	.byte	0xad
	.long	0x59d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "Len\0"
	.byte	0x1
	.byte	0xad
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF0
	.byte	0x1
	.byte	0xad
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.byte	0xb4
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.ascii "GetCpxSgnPower\0"
	.byte	0x1
	.byte	0x9c
	.long	0x3bd
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x865
	.uleb128 0x15
	.ascii "Stream\0"
	.byte	0x1
	.byte	0x9c
	.long	0x60f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "Len\0"
	.byte	0x1
	.byte	0x9c
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.byte	0x9d
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "Energy\0"
	.byte	0x1
	.byte	0x9e
	.long	0x3bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x14
	.ascii "ChanAWGN\0"
	.byte	0x1
	.byte	0x80
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x913
	.uleb128 0x15
	.ascii "IoStream\0"
	.byte	0x1
	.byte	0x80
	.long	0x60f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.byte	0x81
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "U1\0"
	.byte	0x1
	.byte	0x82
	.long	0x3bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.ascii "U2\0"
	.byte	0x1
	.byte	0x82
	.long	0x3bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.ascii "ReN\0"
	.byte	0x1
	.byte	0x83
	.long	0x3bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.ascii "ImN\0"
	.byte	0x1
	.byte	0x83
	.long	0x3bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x16
	.ascii "Mu\0"
	.byte	0x1
	.byte	0x84
	.long	0x3bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.ascii "SgnPwr\0"
	.byte	0x1
	.byte	0x85
	.long	0x3bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "SNR\0"
	.byte	0x1
	.byte	0x86
	.long	0x3bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.ascii "SqSigma\0"
	.byte	0x1
	.byte	0x87
	.long	0x3bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x14
	.ascii "ChanBSC\0"
	.byte	0x1
	.byte	0x65
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x99a
	.uleb128 0x15
	.ascii "InByt\0"
	.byte	0x1
	.byte	0x65
	.long	0x59d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.ascii "OutByt\0"
	.byte	0x1
	.byte	0x65
	.long	0x59d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.ascii "Peb\0"
	.byte	0x1
	.byte	0x65
	.long	0x3bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.byte	0x66
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.ascii "ByteIdx\0"
	.byte	0x1
	.byte	0x66
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii "BitIdx\0"
	.byte	0x1
	.byte	0x67
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x16
	.ascii "Mask\0"
	.byte	0x1
	.byte	0x68
	.long	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x14
	.ascii "RandBytGen\0"
	.byte	0x1
	.byte	0x55
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x9d5
	.uleb128 0x15
	.ascii "IoBytes\0"
	.byte	0x1
	.byte	0x55
	.long	0x59d
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.byte	0x56
	.long	0x1c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.ascii "PrintParam\0"
	.byte	0x1
	.byte	0x3a
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.ascii "CheckParam\0"
	.byte	0x1
	.byte	0x19
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0
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
	.ascii "Label\0"
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
