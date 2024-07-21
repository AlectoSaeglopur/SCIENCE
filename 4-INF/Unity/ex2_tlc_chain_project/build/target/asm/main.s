	.file	"main.c"
	.text
Ltext0:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB18:
	.file 1 "src/main.c"
	.loc 1 24 0
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	movl	$7328, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	.loc 1 24 0
	call	___main
LVL0:
	movl	%esp, %eax
	movl	%eax, %ebx
	.loc 1 33 0
	movl	$16, %eax
	subl	$1, %eax
	addl	$4803, %eax
	movl	$16, %ecx
	movl	$0, %edx
	divl	%ecx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	16(%esp), %eax
	addl	$3, %eax
	shrl	$2, %eax
	sall	$2, %eax
	movl	%eax, -12(%ebp)
	.loc 1 35 0
	call	_CheckParam
	.loc 1 36 0
	call	_PrintParam
	.loc 1 38 0
	leal	-410(%ebp), %eax
	movl	%eax, (%esp)
	call	_RandBytGen
	.loc 1 39 0
	movl	$0, 8(%esp)
	movl	$100, 4(%esp)
	leal	-410(%ebp), %eax
	movl	%eax, (%esp)
	call	_PrintByt
	.loc 1 42 0
	leal	-310(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-306(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetConvCP
	.loc 1 43 0
	leal	-310(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-306(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-710(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-410(%ebp), %eax
	movl	%eax, (%esp)
	call	_ConvEncoder
	.loc 1 47 0
	leal	-304(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetPskTable
	.loc 1 48 0
	nop
	.loc 1 55 0
	movl	-12(%ebp), %eax
	leal	-304(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	leal	-710(%ebp), %eax
	movl	%eax, (%esp)
	call	_Mapper
	.loc 1 59 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_ChanAWGN
	.loc 1 62 0
	leal	-268(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-306(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetTrellis
	.loc 1 65 0
	movl	-12(%ebp), %eax
	leal	-304(%ebp), %edx
	movl	%edx, 8(%esp)
	leal	-910(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_HardDemapper
	.loc 1 66 0
	movl	$3, 12(%esp)
	movl	$150, 8(%esp)
	leal	-910(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-710(%ebp), %eax
	movl	%eax, (%esp)
	call	_CheckWrongBits
	.loc 1 67 0
	leal	-310(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-268(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-510(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-910(%ebp), %eax
	movl	%eax, (%esp)
	call	_HardConvDecoder
	.loc 1 73 0
	movl	$1, 8(%esp)
	movl	$100, 4(%esp)
	leal	-510(%ebp), %eax
	movl	%eax, (%esp)
	call	_PrintByt
	.loc 1 74 0
	movl	$1, 12(%esp)
	movl	$100, 8(%esp)
	leal	-510(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-410(%ebp), %eax
	movl	%eax, (%esp)
	call	_CheckWrongBits
	.loc 1 76 0
	movl	$0, %eax
	movl	%ebx, %esp
	.loc 1 78 0
	leal	-8(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/setting.h"
	.file 7 "src/extra.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x5d9
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\main.c\0"
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
	.long	0x15a
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x15a
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xc4
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x15a
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xc4
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xc4
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xc4
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xc4
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x15a
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xcb
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xd3
	.uleb128 0x7
	.long	0x160
	.long	0x177
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x16c
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x1a1
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
	.long	0x81
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xc4
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x203
	.uleb128 0x5
	.byte	0x4
	.long	0x15a
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xc4
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xc4
	.uleb128 0x7
	.long	0x15a
	.long	0x239
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x22e
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x4
	.byte	0xfa
	.long	0x81
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x81
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x81
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x81
	.uleb128 0xa
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xc4
	.uleb128 0xa
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xc4
	.uleb128 0xa
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0xa7
	.uleb128 0x7
	.long	0x15a
	.long	0x2cf
	.uleb128 0xb
	.long	0x2cf
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
	.long	0x2bf
	.uleb128 0xa
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xc4
	.uleb128 0xa
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0xa7
	.uleb128 0xa
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2bf
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
	.long	0x364
	.uleb128 0x4
	.ascii "OutBits\0"
	.byte	0x6
	.byte	0x51
	.long	0x364
	.byte	0
	.uleb128 0x4
	.ascii "NextState\0"
	.byte	0x6
	.byte	0x52
	.long	0x364
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.long	0x192
	.long	0x374
	.uleb128 0xb
	.long	0x2cf
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.ascii "info\0"
	.byte	0x6
	.byte	0x53
	.long	0x335
	.uleb128 0xc
	.ascii "TD2\0"
	.word	0x100
	.byte	0x6
	.byte	0x55
	.long	0x39d
	.uleb128 0x4
	.ascii "States\0"
	.byte	0x6
	.byte	0x56
	.long	0x39d
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x374
	.long	0x3ad
	.uleb128 0xb
	.long	0x2cf
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.ascii "trellis\0"
	.byte	0x6
	.byte	0x57
	.long	0x380
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x3
	.ascii "TD5\0"
	.byte	0x8
	.byte	0x6
	.byte	0x65
	.long	0x3e8
	.uleb128 0x4
	.ascii "Re\0"
	.byte	0x6
	.byte	0x66
	.long	0x3bc
	.byte	0
	.uleb128 0x4
	.ascii "Im\0"
	.byte	0x6
	.byte	0x67
	.long	0x3bc
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.ascii "complex\0"
	.byte	0x6
	.byte	0x68
	.long	0x3c5
	.uleb128 0x3
	.ascii "TD6\0"
	.byte	0x24
	.byte	0x6
	.byte	0x6a
	.long	0x41f
	.uleb128 0x4
	.ascii "Bits\0"
	.byte	0x6
	.byte	0x6b
	.long	0x41f
	.byte	0
	.uleb128 0x4
	.ascii "Symbs\0"
	.byte	0x6
	.byte	0x6c
	.long	0x42f
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	0x192
	.long	0x42f
	.uleb128 0xb
	.long	0x2cf
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.long	0x3e8
	.long	0x43f
	.uleb128 0xb
	.long	0x2cf
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.ascii "phasemap\0"
	.byte	0x6
	.byte	0x6d
	.long	0x3f7
	.uleb128 0xd
	.byte	0x4
	.long	0x81
	.byte	0x7
	.byte	0x1a
	.long	0x4bf
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
	.ascii "main\0"
	.byte	0x1
	.byte	0x18
	.long	0xc4
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x59e
	.uleb128 0x10
	.ascii "ConvDiagr\0"
	.byte	0x1
	.byte	0x1a
	.long	0x3ad
	.uleb128 0x3
	.byte	0x75
	.sleb128 -268
	.uleb128 0x10
	.ascii "ModTable\0"
	.byte	0x1
	.byte	0x1b
	.long	0x43f
	.uleb128 0x3
	.byte	0x75
	.sleb128 -304
	.uleb128 0x10
	.ascii "ConVect\0"
	.byte	0x1
	.byte	0x1c
	.long	0x364
	.uleb128 0x3
	.byte	0x75
	.sleb128 -306
	.uleb128 0x10
	.ascii "PunctVect\0"
	.byte	0x1
	.byte	0x1d
	.long	0x41f
	.uleb128 0x3
	.byte	0x75
	.sleb128 -310
	.uleb128 0x10
	.ascii "TxSrcByt\0"
	.byte	0x1
	.byte	0x1e
	.long	0x59e
	.uleb128 0x3
	.byte	0x75
	.sleb128 -410
	.uleb128 0x10
	.ascii "RxSrcByt\0"
	.byte	0x1
	.byte	0x1e
	.long	0x59e
	.uleb128 0x3
	.byte	0x75
	.sleb128 -510
	.uleb128 0x10
	.ascii "TxConvByt\0"
	.byte	0x1
	.byte	0x1f
	.long	0x5ae
	.uleb128 0x3
	.byte	0x75
	.sleb128 -710
	.uleb128 0x10
	.ascii "DemByt\0"
	.byte	0x1
	.byte	0x1f
	.long	0x5ae
	.uleb128 0x3
	.byte	0x75
	.sleb128 -910
	.uleb128 0x10
	.ascii "SoftLLR\0"
	.byte	0x1
	.byte	0x20
	.long	0x5be
	.uleb128 0x3
	.byte	0x75
	.sleb128 -7312
	.uleb128 0x10
	.ascii "ChSym\0"
	.byte	0x1
	.byte	0x21
	.long	0x5cf
	.uleb128 0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	0x192
	.long	0x5ae
	.uleb128 0xb
	.long	0x2cf
	.byte	0x63
	.byte	0
	.uleb128 0x7
	.long	0x192
	.long	0x5be
	.uleb128 0xb
	.long	0x2cf
	.byte	0xc7
	.byte	0
	.uleb128 0x7
	.long	0x3bc
	.long	0x5cf
	.uleb128 0x11
	.long	0x2cf
	.word	0x63f
	.byte	0
	.uleb128 0x12
	.long	0x3e8
	.uleb128 0x11
	.long	0x2cf
	.word	0x257
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
	.uleb128 0xb
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
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
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_CheckParam;	.scl	2;	.type	32;	.endef
	.def	_PrintParam;	.scl	2;	.type	32;	.endef
	.def	_RandBytGen;	.scl	2;	.type	32;	.endef
	.def	_PrintByt;	.scl	2;	.type	32;	.endef
	.def	_GetConvCP;	.scl	2;	.type	32;	.endef
	.def	_ConvEncoder;	.scl	2;	.type	32;	.endef
	.def	_GetPskTable;	.scl	2;	.type	32;	.endef
	.def	_Mapper;	.scl	2;	.type	32;	.endef
	.def	_ChanAWGN;	.scl	2;	.type	32;	.endef
	.def	_GetTrellis;	.scl	2;	.type	32;	.endef
	.def	_HardDemapper;	.scl	2;	.type	32;	.endef
	.def	_CheckWrongBits;	.scl	2;	.type	32;	.endef
	.def	_HardConvDecoder;	.scl	2;	.type	32;	.endef
