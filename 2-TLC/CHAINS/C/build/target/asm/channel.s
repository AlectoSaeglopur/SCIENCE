	.file	"channel.c"
	.text
Ltext0:
	.globl	_Channel_ListParameters
	.def	_Channel_ListParameters;	.scl	2;	.type	32;	.endef
_Channel_ListParameters:
LFB18:
	.file 1 "src/channel.c"
	.loc 1 40 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 41 0
	movl	$0, -12(%ebp)
	.loc 1 43 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 45 0
	movl	8(%ebp), %eax
	movl	$1, 4(%eax)
	.loc 1 46 0
	movl	8(%ebp), %eax
	movb	$2, 8(%eax)
	.loc 1 47 0
	movl	8(%ebp), %eax
	movl	$-1, (%eax)
	.loc 1 55 0
	movl	8(%ebp), %eax
	flds	LC0
	fstps	12(%eax)
	jmp	L3
L2:
	.loc 1 60 0
	movl	$1, -12(%ebp)
L3:
	.loc 1 63 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 64 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_Channel_BSC
	.def	_Channel_BSC;	.scl	2;	.type	32;	.endef
_Channel_BSC:
LFB19:
	.loc 1 78 0
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
	.loc 1 79 0
	movl	$0, -12(%ebp)
	.loc 1 84 0
	cmpl	$0, 8(%ebp)
	je	L6
	.loc 1 84 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L6
	.loc 1 84 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L6
	.loc 1 84 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L6
	.loc 1 86 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L7
	.loc 1 88 0
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L8
	.loc 1 90 0
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 91 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$-1, %eax
	jne	L9
	.loc 1 93 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	jmp	L10
L9:
	.loc 1 97 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_srand
L10:
	.loc 1 99 0
	movl	$0, -16(%ebp)
	jmp	L11
L15:
	.loc 1 101 0
	call	_rand
	movl	%eax, -28(%ebp)
	fildl	-28(%ebp)
	flds	LC2
	fdivrp	%st, %st(1)
	movl	16(%ebp), %eax
	flds	12(%eax)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L12
	.loc 1 103 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -20(%ebp)
	.loc 1 104 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -21(%ebp)
	.loc 1 105 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-21(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L14
	.loc 1 107 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-20(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-21(%ebp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	notl	%eax
	andl	%ebx, %eax
	movb	%al, (%edx)
	jmp	L12
L14:
	.loc 1 111 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-20(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-21(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
L12:
	.loc 1 99 0 discriminator 2
	addl	$1, -16(%ebp)
L11:
	.loc 1 99 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L15
	.loc 1 86 0 is_stmt 1
	jmp	L18
L8:
	.loc 1 118 0
	movl	$11, -12(%ebp)
	.loc 1 86 0
	jmp	L18
L7:
	.loc 1 123 0
	movl	$6, -12(%ebp)
	.loc 1 86 0
	jmp	L18
L6:
	.loc 1 128 0
	movl	$1, -12(%ebp)
L18:
	.loc 1 131 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 132 0
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
LFE19:
	.globl	_Channel_AWGN
	.def	_Channel_AWGN;	.scl	2;	.type	32;	.endef
_Channel_AWGN:
LFB20:
	.loc 1 146 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	.loc 1 147 0
	movl	$0, -12(%ebp)
	.loc 1 148 0
	fldz
	fstps	-20(%ebp)
	.loc 1 149 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetComplexSgnPower
	fstps	-72(%ebp)
	movl	-72(%ebp), %eax
	movl	%eax, -24(%ebp)
	.loc 1 150 0
	movl	16(%ebp), %eax
	flds	12(%eax)
	fstpl	-72(%ebp)
	movl	16(%ebp), %eax
	movzbl	8(%eax), %eax
	movzbl	%al, %eax
	movw	%ax, -62(%ebp)
	filds	-62(%ebp)
	fstpl	(%esp)
	call	_log10
	fldl	LC4
	fmulp	%st, %st(1)
	faddl	-72(%ebp)
	fstps	-28(%ebp)
	.loc 1 151 0
	flds	-24(%ebp)
	fstpl	-72(%ebp)
	flds	-28(%ebp)
	fchs
	flds	LC5
	fdivrp	%st, %st(1)
	fstpl	8(%esp)
	fldl	LC4
	fstpl	(%esp)
	call	_pow
	fmull	-72(%ebp)
	fstps	-32(%ebp)
	.loc 1 156 0
	cmpl	$0, 8(%ebp)
	je	L22
	.loc 1 156 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L22
	.loc 1 156 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L22
	.loc 1 156 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L22
	.loc 1 158 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L23
	.loc 1 160 0
	movl	16(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$1, %eax
	jne	L24
	.loc 1 162 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	0(,%eax,8), %ecx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 163 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$-1, %eax
	jne	L25
	.loc 1 165 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	jmp	L26
L25:
	.loc 1 169 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_srand
L26:
	.loc 1 171 0
	movl	$0, -16(%ebp)
	jmp	L27
L29:
	.loc 1 173 0
	call	_rand
	movl	%eax, -72(%ebp)
	fildl	-72(%ebp)
	fldl	LC6
	fmulp	%st, %st(1)
	fstps	-36(%ebp)
	.loc 1 174 0
	call	_rand
	movl	%eax, -72(%ebp)
	fildl	-72(%ebp)
	fldl	LC6
	fmulp	%st, %st(1)
	fstps	-40(%ebp)
	.loc 1 175 0
	flds	-36(%ebp)
	fstpl	(%esp)
	call	_log
	fldl	LC7
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	_sqrt
	fstpl	-72(%ebp)
	flds	-40(%ebp)
	flds	LC8
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	_cos
	fmull	-72(%ebp)
	fstpl	-72(%ebp)
	flds	-32(%ebp)
	flds	LC9
	fdivrp	%st, %st(1)
	fstpl	(%esp)
	call	_sqrt
	fldl	-72(%ebp)
	fmulp	%st, %st(1)
	flds	-20(%ebp)
	faddp	%st, %st(1)
	fstps	-44(%ebp)
	.loc 1 176 0
	flds	-36(%ebp)
	fstpl	(%esp)
	call	_log
	fldl	LC7
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	_sqrt
	fstpl	-72(%ebp)
	flds	-40(%ebp)
	flds	LC8
	fmulp	%st, %st(1)
	fstpl	(%esp)
	call	_sin
	fmull	-72(%ebp)
	fstpl	-72(%ebp)
	flds	-32(%ebp)
	flds	LC9
	fdivrp	%st, %st(1)
	fstpl	(%esp)
	call	_sqrt
	fldl	-72(%ebp)
	fmulp	%st, %st(1)
	flds	-20(%ebp)
	faddp	%st, %st(1)
	fstps	-48(%ebp)
	.loc 1 177 0
	flds	-44(%ebp)
	fabs
	flds	LC10
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	seta	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L28
	.loc 1 177 0 is_stmt 0 discriminator 1
	flds	-48(%ebp)
	fabs
	flds	LC10
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	seta	%al
	xorl	$1, %eax
	testb	%al, %al
	je	L28
	.loc 1 179 0 is_stmt 1
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %ecx
	sall	$3, %ecx
	addl	%ecx, %eax
	flds	(%eax)
	fadds	-44(%ebp)
	fstps	(%edx)
	.loc 1 180 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %ecx
	sall	$3, %ecx
	addl	%ecx, %eax
	flds	4(%eax)
	fadds	-48(%ebp)
	fstps	4(%edx)
L28:
	.loc 1 171 0 discriminator 2
	addl	$1, -16(%ebp)
L27:
	.loc 1 171 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L29
	.loc 1 158 0 is_stmt 1
	jmp	L32
L24:
	.loc 1 186 0
	movl	$11, -12(%ebp)
	.loc 1 158 0
	jmp	L32
L23:
	.loc 1 191 0
	movl	$6, -12(%ebp)
	.loc 1 158 0
	jmp	L32
L22:
	.loc 1 196 0
	movl	$1, -12(%ebp)
L32:
	.loc 1 199 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 200 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.def	_GetComplexSgnPower;	.scl	3;	.type	32;	.endef
_GetComplexSgnPower:
LFB21:
	.loc 1 217 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	.loc 1 218 0
	fldz
	fstps	-4(%ebp)
	.loc 1 221 0
	movl	$0, -8(%ebp)
	jmp	L35
L36:
	.loc 1 223 0 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-8(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-8(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	(%eax)
	fmulp	%st, %st(1)
	.loc 1 224 0 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-8(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-8(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	flds	4(%eax)
	fmulp	%st, %st(1)
	.loc 1 223 0 discriminator 3
	faddp	%st, %st(1)
	flds	-4(%ebp)
	faddp	%st, %st(1)
	fstps	-4(%ebp)
	.loc 1 221 0 discriminator 3
	addl	$1, -8(%ebp)
L35:
	.loc 1 221 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-8(%ebp), %eax
	ja	L36
	.loc 1 227 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -32(%ebp)
	movl	$0, -28(%ebp)
	fildq	-32(%ebp)
	fstps	-20(%ebp)
	flds	-20(%ebp)
	flds	-4(%ebp)
	fdivp	%st, %st(1)
	.loc 1 228 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
	.align 4
LC0:
	.long	1077516698
	.align 4
LC2:
	.long	1191181824
	.align 8
LC4:
	.long	0
	.long	1076101120
	.align 4
LC5:
	.long	1092616192
	.align 8
LC6:
	.long	4194432
	.long	1056964640
	.align 8
LC7:
	.long	0
	.long	-1073741824
	.align 4
LC8:
	.long	1086918608
	.align 4
LC9:
	.long	1073741824
	.align 4
LC10:
	.long	2139095039
	.text
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/system.h"
	.file 7 "src/error.h"
	.file 8 "src/memory.h"
	.file 9 "src/channel.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x8a1
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\channel.c\0"
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
	.long	0x14a
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x14a
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xb4
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x14a
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xb4
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xb4
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xb4
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xb4
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x14a
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xbb
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xc3
	.uleb128 0x7
	.long	0x150
	.long	0x167
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x15c
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x191
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
	.long	0x71
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xb4
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x1f3
	.uleb128 0x5
	.byte	0x4
	.long	0x14a
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xb4
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xb4
	.uleb128 0x7
	.long	0x14a
	.long	0x229
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x21e
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x4
	.byte	0xfa
	.long	0x71
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x71
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x71
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x71
	.uleb128 0xa
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb4
	.uleb128 0xa
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb4
	.uleb128 0xa
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x97
	.uleb128 0x7
	.long	0x14a
	.long	0x2bf
	.uleb128 0xb
	.long	0x2bf
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
	.long	0x2af
	.uleb128 0xa
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xb4
	.uleb128 0xa
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x97
	.uleb128 0xa
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2af
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
	.long	0x34f
	.uleb128 0x4
	.ascii "re\0"
	.byte	0x6
	.byte	0x35
	.long	0x34f
	.byte	0
	.uleb128 0x4
	.ascii "im\0"
	.byte	0x6
	.byte	0x36
	.long	0x34f
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0xc
	.long	0x34f
	.uleb128 0x6
	.ascii "complex_t\0"
	.byte	0x6
	.byte	0x37
	.long	0x325
	.uleb128 0xd
	.byte	0x4
	.long	0x71
	.byte	0x7
	.byte	0x1b
	.long	0x48b
	.uleb128 0xe
	.ascii "ERR_NONE\0"
	.byte	0
	.uleb128 0xe
	.ascii "ERR_INV_NULL_POINTER\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "ERR_INV_PRINTID\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "ERR_INV_CNVCOD_RATE\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "ERR_INV_CNVCOD_KLEN\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "ERR_INV_CNVCOD_DECMET\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "ERR_INV_BUFFER_SIZE\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "ERR_INV_DYNAMIC_ALLOC\0"
	.byte	0x7
	.uleb128 0xe
	.ascii "ERR_INV_STREAM_TYPE\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "ERR_INV_MODULATION_TYPE\0"
	.byte	0x9
	.uleb128 0xe
	.ascii "ERR_INV_MODULATION_BPS\0"
	.byte	0xa
	.uleb128 0xe
	.ascii "ERR_INV_CHANNEL_TYPE\0"
	.byte	0xb
	.uleb128 0xe
	.ascii "ERR_NUM\0"
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x7
	.byte	0x2a
	.long	0x36e
	.uleb128 0xd
	.byte	0x4
	.long	0x71
	.byte	0x8
	.byte	0x1d
	.long	0x4e4
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
	.byte	0x8
	.byte	0x21
	.long	0x49a
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x24
	.long	0x535
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x26
	.long	0x535
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x27
	.long	0x1af
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x28
	.long	0x4e4
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x182
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x8
	.byte	0x29
	.long	0x4f9
	.uleb128 0xc
	.long	0x53b
	.uleb128 0x3
	.ascii "_complex_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x34
	.long	0x594
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x36
	.long	0x594
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x37
	.long	0x1af
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x38
	.long	0x4e4
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x35d
	.uleb128 0x6
	.ascii "complex_stream_t\0"
	.byte	0x8
	.byte	0x39
	.long	0x555
	.uleb128 0xc
	.long	0x59a
	.uleb128 0xd
	.byte	0x4
	.long	0x71
	.byte	0x9
	.byte	0x1e
	.long	0x5e6
	.uleb128 0xe
	.ascii "CHAN_BSC\0"
	.byte	0
	.uleb128 0xe
	.ascii "CHAN_AWGN\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "CHAN_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "channel_t\0"
	.byte	0x9
	.byte	0x23
	.long	0x5b7
	.uleb128 0xf
	.byte	0x4
	.byte	0x9
	.byte	0x2b
	.long	0x617
	.uleb128 0x10
	.ascii "Peb\0"
	.byte	0x9
	.byte	0x2d
	.long	0x34f
	.uleb128 0x10
	.ascii "EbN0\0"
	.byte	0x9
	.byte	0x2e
	.long	0x34f
	.byte	0
	.uleb128 0x3
	.ascii "_chan_par_t\0"
	.byte	0x10
	.byte	0x9
	.byte	0x26
	.long	0x658
	.uleb128 0x4
	.ascii "seed\0"
	.byte	0x9
	.byte	0x28
	.long	0x1af
	.byte	0
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x9
	.byte	0x29
	.long	0x5e6
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0x9
	.byte	0x2a
	.long	0x182
	.byte	0x8
	.uleb128 0x11
	.long	0x5f7
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "chan_par_t\0"
	.byte	0x9
	.byte	0x30
	.long	0x617
	.uleb128 0xc
	.long	0x658
	.uleb128 0x12
	.ascii "GetComplexSgnPower\0"
	.byte	0x1
	.byte	0xd8
	.long	0x34f
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x6c3
	.uleb128 0x13
	.secrel32	LASF0
	.byte	0x1
	.byte	0xd8
	.long	0x6c3
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.ascii "energy\0"
	.byte	0x1
	.byte	0xda
	.long	0x34f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.byte	0xdb
	.long	0x1af
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5b2
	.uleb128 0x15
	.ascii "Channel_AWGN\0"
	.byte	0x1
	.byte	0x91
	.long	0x48b
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x7ab
	.uleb128 0x13
	.secrel32	LASF0
	.byte	0x1
	.byte	0x91
	.long	0x6c3
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.secrel32	LASF1
	.byte	0x1
	.byte	0x91
	.long	0x7ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.ascii "pParams\0"
	.byte	0x1
	.byte	0x91
	.long	0x7b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.byte	0x93
	.long	0x48b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "mu\0"
	.byte	0x1
	.byte	0x94
	.long	0x358
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.ascii "sgnPwr\0"
	.byte	0x1
	.byte	0x95
	.long	0x358
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.ascii "SNR\0"
	.byte	0x1
	.byte	0x96
	.long	0x358
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.ascii "SqSigma\0"
	.byte	0x1
	.byte	0x97
	.long	0x358
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.ascii "nU1\0"
	.byte	0x1
	.byte	0x98
	.long	0x34f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.ascii "nU2\0"
	.byte	0x1
	.byte	0x98
	.long	0x34f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.ascii "nReN\0"
	.byte	0x1
	.byte	0x99
	.long	0x34f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x14
	.ascii "nIm\0"
	.byte	0x1
	.byte	0x99
	.long	0x34f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.byte	0x9a
	.long	0x1af
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x59a
	.uleb128 0x5
	.byte	0x4
	.long	0x66a
	.uleb128 0x15
	.ascii "Channel_BSC\0"
	.byte	0x1
	.byte	0x4d
	.long	0x48b
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x844
	.uleb128 0x13
	.secrel32	LASF0
	.byte	0x1
	.byte	0x4d
	.long	0x844
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.secrel32	LASF1
	.byte	0x1
	.byte	0x4d
	.long	0x84a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.ascii "pParams\0"
	.byte	0x1
	.byte	0x4d
	.long	0x7b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.byte	0x4f
	.long	0x48b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.ascii "j\0"
	.byte	0x1
	.byte	0x50
	.long	0x1af
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.ascii "byteIdx\0"
	.byte	0x1
	.byte	0x51
	.long	0x1af
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.ascii "bitIdx\0"
	.byte	0x1
	.byte	0x52
	.long	0x182
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x550
	.uleb128 0x5
	.byte	0x4
	.long	0x53b
	.uleb128 0x15
	.ascii "Channel_ListParameters\0"
	.byte	0x1
	.byte	0x27
	.long	0x48b
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x89e
	.uleb128 0x16
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x27
	.long	0x89e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF2
	.byte	0x1
	.byte	0x29
	.long	0x48b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x658
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x17
	.byte	0x1
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
	.uleb128 0x10
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
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.ascii "outStream\0"
LASF0:
	.ascii "inStream\0"
LASF2:
	.ascii "retErr\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_log10;	.scl	2;	.type	32;	.endef
	.def	_pow;	.scl	2;	.type	32;	.endef
	.def	_log;	.scl	2;	.type	32;	.endef
	.def	_sqrt;	.scl	2;	.type	32;	.endef
	.def	_cos;	.scl	2;	.type	32;	.endef
	.def	_sin;	.scl	2;	.type	32;	.endef
