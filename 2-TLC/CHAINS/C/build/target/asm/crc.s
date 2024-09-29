	.file	"crc.c"
	.text
Ltext0:
	.section .rdata,"dr"
	.align 4
_CRC_GENPOLY_8:
	.byte	0
	.byte	2
	.byte	4
	.byte	6
	.byte	7
_CRC_GENPOLY_16:
	.byte	0
	.byte	5
	.byte	12
	.align 4
_CRC_GENPOLY_24:
	.byte	0
	.byte	1
	.byte	5
	.byte	6
	.byte	23
	.align 4
_CRC_GENPOLY_32:
	.byte	0
	.byte	1
	.byte	2
	.byte	4
	.byte	5
	.byte	7
	.byte	8
	.byte	10
	.byte	11
	.byte	12
	.byte	16
	.byte	22
	.byte	23
	.byte	26
	.align 4
_CRC_GENPOLY_64:
	.byte	0
	.byte	1
	.byte	3
	.byte	4
	.text
	.globl	_Crc_ListParameters
	.def	_Crc_ListParameters;	.scl	2;	.type	32;	.endef
_Crc_ListParameters:
LFB18:
	.file 1 "src/crc.c"
	.loc 1 55 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 56 0
	movl	$0, 4(%esp)
	movl	$_Crc_ListParameters, (%esp)
	call	_Debug_SetWatermark
	.loc 1 58 0
	movl	$0, -12(%ebp)
	.loc 1 60 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 62 0
	movl	8(%ebp), %eax
	movl	$16, (%eax)
	.loc 1 64 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$24, %eax
	je	L4
	cmpl	$24, %eax
	ja	L5
	cmpl	$8, %eax
	je	L6
	cmpl	$16, %eax
	je	L7
	jmp	L3
L5:
	cmpl	$32, %eax
	je	L8
	cmpl	$64, %eax
	je	L9
	jmp	L3
L6:
	.loc 1 67 0
	movl	8(%ebp), %eax
	movl	$_CRC_GENPOLY_8, 4(%eax)
	.loc 1 68 0
	movl	8(%ebp), %eax
	movb	$5, 8(%eax)
	.loc 1 69 0
	jmp	L11
L7:
	.loc 1 72 0
	movl	8(%ebp), %eax
	movl	$_CRC_GENPOLY_16, 4(%eax)
	.loc 1 73 0
	movl	8(%ebp), %eax
	movb	$3, 8(%eax)
	.loc 1 74 0
	jmp	L11
L4:
	.loc 1 77 0
	movl	8(%ebp), %eax
	movl	$_CRC_GENPOLY_24, 4(%eax)
	.loc 1 78 0
	movl	8(%ebp), %eax
	movb	$5, 8(%eax)
	.loc 1 79 0
	jmp	L11
L8:
	.loc 1 82 0
	movl	8(%ebp), %eax
	movl	$_CRC_GENPOLY_32, 4(%eax)
	.loc 1 83 0
	movl	8(%ebp), %eax
	movb	$14, 8(%eax)
	.loc 1 84 0
	jmp	L11
L9:
	.loc 1 87 0
	movl	8(%ebp), %eax
	movl	$_CRC_GENPOLY_64, 4(%eax)
	.loc 1 88 0
	movl	8(%ebp), %eax
	movb	$4, 8(%eax)
	.loc 1 89 0
	jmp	L11
L3:
	.loc 1 92 0
	movl	$14, -12(%ebp)
	.loc 1 93 0
	nop
	jmp	L11
L2:
	.loc 1 98 0
	movl	$1, -12(%ebp)
L11:
	.loc 1 101 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 102 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_Crc_CalculateChecksum
	.def	_Crc_CalculateChecksum;	.scl	2;	.type	32;	.endef
_Crc_CalculateChecksum:
LFB19:
	.loc 1 115 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	.loc 1 115 0
	movl	%esp, %eax
	movl	%eax, %ebx
	.loc 1 116 0
	movl	$0, 4(%esp)
	movl	$_Crc_CalculateChecksum, (%esp)
	call	_Debug_SetWatermark
	.loc 1 118 0
	movl	$0, -12(%ebp)
	.loc 1 119 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 120 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	0(,%eax,8), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	addl	%edx, %eax
	movl	%eax, -32(%ebp)
	.loc 1 121 0
	movl	-32(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 124 0
	movl	-36(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -40(%ebp)
	movl	$16, %eax
	leal	-1(%eax), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movl	$16, %ecx
	movl	$0, %edx
	divl	%ecx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	12(%esp), %eax
	addl	$0, %eax
	movl	%eax, -44(%ebp)
	.loc 1 129 0
	cmpl	$0, 8(%ebp)
	je	L14
	.loc 1 129 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L14
	.loc 1 129 0 discriminator 2
	cmpl	$0, 16(%ebp)
	je	L14
	.loc 1 130 0 is_stmt 1 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	.loc 1 129 0 discriminator 3
	testl	%eax, %eax
	je	L14
	.loc 1 130 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L14
	.loc 1 132 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-28(%ebp), %eax
	jne	L15
	.loc 1 134 0
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 135 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	-44(%ebp), %eax
	addl	%eax, %edx
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	%edx, (%esp)
	call	_memset
	.loc 1 136 0
	movl	-44(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_FindMaxDegree
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	subl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	.loc 1 137 0
	movl	-16(%ebp), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -20(%ebp)
	.loc 1 139 0
	movl	-16(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jnb	L16
	.loc 1 141 0
	jmp	L17
L20:
	.loc 1 143 0
	movl	-16(%ebp), %eax
	movl	-32(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	subl	$1, %eax
	shrl	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 144 0
	movl	-32(%ebp), %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	subl	$1, %eax
	andl	$7, %eax
	movb	%al, -49(%ebp)
	.loc 1 145 0
	movzbl	-49(%ebp), %eax
	movl	$128, %edx
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	notl	%eax
	movb	%al, -50(%ebp)
	.loc 1 146 0
	movl	-44(%ebp), %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	andb	-50(%ebp), %al
	movl	-44(%ebp), %ecx
	movl	-48(%ebp), %edx
	addl	%ecx, %edx
	movb	%al, (%edx)
	.loc 1 147 0
	movb	$0, -21(%ebp)
	jmp	L18
L19:
	.loc 1 149 0 discriminator 3
	movl	-20(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	16(%ebp), %eax
	movl	4(%eax), %edx
	movzbl	-21(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	$1, %eax
	shrl	$3, %eax
	movl	%eax, -48(%ebp)
	.loc 1 150 0 discriminator 3
	movl	-32(%ebp), %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	16(%ebp), %eax
	movl	4(%eax), %edx
	movzbl	-21(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	$1, %eax
	andl	$7, %eax
	movb	%al, -49(%ebp)
	.loc 1 151 0 discriminator 3
	movzbl	-49(%ebp), %eax
	movl	$128, %edx
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movb	%al, -50(%ebp)
	.loc 1 152 0 discriminator 3
	movl	-44(%ebp), %edx
	movl	-48(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	xorb	-50(%ebp), %al
	movl	-44(%ebp), %ecx
	movl	-48(%ebp), %edx
	addl	%ecx, %edx
	movb	%al, (%edx)
	.loc 1 147 0 discriminator 3
	movzbl	-21(%ebp), %eax
	addl	$1, %eax
	movb	%al, -21(%ebp)
L18:
	.loc 1 147 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	movzbl	8(%eax), %eax
	cmpb	-21(%ebp), %al
	ja	L19
	.loc 1 154 0 is_stmt 1
	movl	-44(%ebp), %eax
	movl	-32(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_FindMaxDegree
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	subl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -16(%ebp)
	.loc 1 155 0
	movl	-16(%ebp), %edx
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -20(%ebp)
L17:
	.loc 1 141 0
	cmpl	$0, -20(%ebp)
	jns	L20
L16:
	.loc 1 159 0
	movl	-36(%ebp), %eax
	subl	-28(%ebp), %eax
	movl	%eax, %edx
	movl	-44(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	_memcpy
	.loc 1 132 0
	jmp	L22
L15:
	.loc 1 163 0
	movl	$7, -12(%ebp)
	.loc 1 132 0
	jmp	L22
L14:
	.loc 1 168 0
	movl	$1, -12(%ebp)
L22:
	.loc 1 171 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%ebx, %esp
	.loc 1 172 0
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.def	_FindMaxDegree;	.scl	3;	.type	32;	.endef
_FindMaxDegree:
LFB20:
	.loc 1 195 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 196 0
	movl	$1, 4(%esp)
	movl	$_FindMaxDegree, (%esp)
	call	_Debug_SetWatermark
	.loc 1 199 0
	movl	$-1, -16(%ebp)
	.loc 1 202 0
	movl	$0, -12(%ebp)
	jmp	L25
L28:
	.loc 1 204 0
	movl	-12(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -20(%ebp)
	.loc 1 205 0
	movl	-12(%ebp), %eax
	andl	$7, %eax
	movb	%al, -21(%ebp)
	.loc 1 207 0
	movl	8(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-21(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L26
	.loc 1 209 0
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	.loc 1 210 0
	jmp	L27
L26:
	.loc 1 202 0 discriminator 2
	addl	$1, -12(%ebp)
L25:
	.loc 1 202 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L28
L27:
	.loc 1 214 0 is_stmt 1
	movl	-16(%ebp), %eax
	.loc 1 215 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/error.h"
	.file 7 "src/memory.h"
	.file 8 "src/crc.h"
	.file 9 "src/convolutional.h"
	.file 10 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xa5e
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\crc.c\0"
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
	.long	0x146
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x146
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xb0
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x146
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xb0
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xb0
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xb0
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xb0
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x146
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xb7
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xbf
	.uleb128 0x7
	.long	0x14c
	.long	0x163
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x158
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x192
	.uleb128 0xa
	.long	0x17e
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x6
	.ascii "int32_t\0"
	.byte	0x3
	.byte	0x3e
	.long	0xb0
	.uleb128 0x6
	.ascii "uint32_t\0"
	.byte	0x3
	.byte	0x3f
	.long	0x6d
	.uleb128 0xa
	.long	0x1bf
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xb0
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x208
	.uleb128 0x5
	.byte	0x4
	.long	0x146
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xb0
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xb0
	.uleb128 0x7
	.long	0x146
	.long	0x23e
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x233
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x4
	.byte	0xfa
	.long	0x6d
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x6d
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x6d
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x6d
	.uleb128 0xb
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb0
	.uleb128 0xb
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb0
	.uleb128 0xb
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x93
	.uleb128 0x7
	.long	0x146
	.long	0x2d4
	.uleb128 0xc
	.long	0x2d4
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
	.long	0x2c4
	.uleb128 0xb
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xb0
	.uleb128 0xb
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x93
	.uleb128 0xb
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2c4
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
	.long	0x6d
	.byte	0x6
	.byte	0x1b
	.long	0x516
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
	.ascii "ERR_INV_INTERLEAVING_TYPE\0"
	.byte	0x12
	.uleb128 0xe
	.ascii "ERR_INV_STREAM\0"
	.byte	0x13
	.uleb128 0xe
	.ascii "ERR_NUM\0"
	.byte	0x14
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x6
	.byte	0x32
	.long	0x343
	.uleb128 0xd
	.byte	0x4
	.long	0x6d
	.byte	0x7
	.byte	0x1d
	.long	0x56f
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
	.long	0x525
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x24
	.long	0x5c0
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x26
	.long	0x5c0
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x27
	.long	0x1bf
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x28
	.long	0x56f
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x17e
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x29
	.long	0x584
	.uleb128 0xa
	.long	0x5c6
	.uleb128 0xd
	.byte	0x4
	.long	0x6d
	.byte	0x8
	.byte	0x1d
	.long	0x63c
	.uleb128 0xe
	.ascii "CRC_DEGREE_8\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "CRC_DEGREE_16\0"
	.byte	0x10
	.uleb128 0xe
	.ascii "CRC_DEGREE_24\0"
	.byte	0x18
	.uleb128 0xe
	.ascii "CRC_DEGREE_32\0"
	.byte	0x20
	.uleb128 0xe
	.ascii "CRC_DEGREE_64\0"
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.ascii "crc_degree_t\0"
	.byte	0x8
	.byte	0x23
	.long	0x5e0
	.uleb128 0x3
	.ascii "_crc_par_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x25
	.long	0x697
	.uleb128 0x4
	.ascii "degree\0"
	.byte	0x8
	.byte	0x27
	.long	0x63c
	.byte	0
	.uleb128 0x4
	.ascii "pGenPoly\0"
	.byte	0x8
	.byte	0x28
	.long	0x697
	.byte	0x4
	.uleb128 0x4
	.ascii "lenGenPoly\0"
	.byte	0x8
	.byte	0x29
	.long	0x17e
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x18d
	.uleb128 0x6
	.ascii "crc_par_t\0"
	.byte	0x8
	.byte	0x2a
	.long	0x650
	.uleb128 0xa
	.long	0x69d
	.uleb128 0xd
	.byte	0x4
	.long	0x6d
	.byte	0x9
	.byte	0x50
	.long	0x724
	.uleb128 0xe
	.ascii "CC_KLEN_3\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "CC_KLEN_4\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "CC_KLEN_5\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "CC_KLEN_6\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "CC_KLEN_7\0"
	.byte	0x7
	.uleb128 0xe
	.ascii "CC_KLEN_8\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "CC_KLEN_MIN\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "CC_KLEN_MAX\0"
	.byte	0x8
	.byte	0
	.uleb128 0xf
	.ascii "_wm_level_t\0"
	.byte	0x4
	.long	0x6d
	.byte	0xa
	.byte	0x4d
	.long	0x766
	.uleb128 0xe
	.ascii "WM_LEVEL_1\0"
	.byte	0
	.uleb128 0xe
	.ascii "WM_LEVEL_2\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "WM_LEVEL_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x18d
	.long	0x776
	.uleb128 0xc
	.long	0x2d4
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.long	0x766
	.uleb128 0x10
	.ascii "CRC_GENPOLY_8\0"
	.byte	0x1
	.byte	0x1a
	.long	0x776
	.uleb128 0x5
	.byte	0x3
	.long	_CRC_GENPOLY_8
	.uleb128 0x7
	.long	0x18d
	.long	0x7a6
	.uleb128 0xc
	.long	0x2d4
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.long	0x796
	.uleb128 0x10
	.ascii "CRC_GENPOLY_16\0"
	.byte	0x1
	.byte	0x1b
	.long	0x7a6
	.uleb128 0x5
	.byte	0x3
	.long	_CRC_GENPOLY_16
	.uleb128 0x10
	.ascii "CRC_GENPOLY_24\0"
	.byte	0x1
	.byte	0x1c
	.long	0x776
	.uleb128 0x5
	.byte	0x3
	.long	_CRC_GENPOLY_24
	.uleb128 0x7
	.long	0x18d
	.long	0x7f3
	.uleb128 0xc
	.long	0x2d4
	.byte	0xd
	.byte	0
	.uleb128 0xa
	.long	0x7e3
	.uleb128 0x10
	.ascii "CRC_GENPOLY_32\0"
	.byte	0x1
	.byte	0x1d
	.long	0x7f3
	.uleb128 0x5
	.byte	0x3
	.long	_CRC_GENPOLY_32
	.uleb128 0x7
	.long	0x18d
	.long	0x824
	.uleb128 0xc
	.long	0x2d4
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.long	0x814
	.uleb128 0x10
	.ascii "CRC_GENPOLY_64\0"
	.byte	0x1
	.byte	0x1f
	.long	0x824
	.uleb128 0x5
	.byte	0x3
	.long	_CRC_GENPOLY_64
	.uleb128 0x11
	.ascii "FindMaxDegree\0"
	.byte	0x1
	.byte	0xc2
	.long	0x1b0
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x8c8
	.uleb128 0x12
	.ascii "poly\0"
	.byte	0x1
	.byte	0xc2
	.long	0x697
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.ascii "lenBi\0"
	.byte	0x1
	.byte	0xc2
	.long	0x1bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.ascii "j\0"
	.byte	0x1
	.byte	0xc6
	.long	0x1bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.ascii "byteIdx\0"
	.byte	0x1
	.byte	0xc6
	.long	0x1bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.ascii "maxDeg\0"
	.byte	0x1
	.byte	0xc7
	.long	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.ascii "bitIdx\0"
	.byte	0x1
	.byte	0xc8
	.long	0x17e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.byte	0
	.uleb128 0x13
	.ascii "Crc_CalculateChecksum\0"
	.byte	0x1
	.byte	0x72
	.long	0x516
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x9e9
	.uleb128 0x12
	.ascii "inStream\0"
	.byte	0x1
	.byte	0x72
	.long	0x9e9
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.ascii "outStream\0"
	.byte	0x1
	.byte	0x72
	.long	0x9ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.ascii "pParams\0"
	.byte	0x1
	.byte	0x72
	.long	0x9f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x10
	.ascii "retErr\0"
	.byte	0x1
	.byte	0x76
	.long	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.ascii "crcLenBy\0"
	.byte	0x1
	.byte	0x77
	.long	0x1cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.ascii "upLenBi\0"
	.byte	0x1
	.byte	0x78
	.long	0x1cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.ascii "upLenBy\0"
	.byte	0x1
	.byte	0x79
	.long	0x1cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x10
	.ascii "maxDeg\0"
	.byte	0x1
	.byte	0x7a
	.long	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.ascii "quotDeg\0"
	.byte	0x1
	.byte	0x7a
	.long	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.ascii "byteIdx\0"
	.byte	0x1
	.byte	0x7b
	.long	0x1bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x10
	.ascii "tmpPoly\0"
	.byte	0x1
	.byte	0x7c
	.long	0x9fb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.uleb128 0x10
	.ascii "mask\0"
	.byte	0x1
	.byte	0x7d
	.long	0x17e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -58
	.uleb128 0x10
	.ascii "bitIdx\0"
	.byte	0x1
	.byte	0x7e
	.long	0x17e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -57
	.uleb128 0x10
	.ascii "j\0"
	.byte	0x1
	.byte	0x7f
	.long	0x17e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5db
	.uleb128 0x5
	.byte	0x4
	.long	0x5c6
	.uleb128 0x5
	.byte	0x4
	.long	0x6ae
	.uleb128 0x7
	.long	0x17e
	.long	0xa0e
	.uleb128 0x14
	.long	0x2d4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.byte	0
	.uleb128 0x13
	.ascii "Crc_ListParameters\0"
	.byte	0x1
	.byte	0x36
	.long	0x516
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xa5b
	.uleb128 0x12
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x36
	.long	0xa5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "retErr\0"
	.byte	0x1
	.byte	0x3a
	.long	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x69d
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
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Debug_SetWatermark;	.scl	2;	.type	32;	.endef
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
