	.file	"main.c"
	.text
Ltext0:
.lcomm _ccParams,16,4
.lcomm _modParams,12,4
.lcomm _chanParams,16,4
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii " >> Execution completed successfully!\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB18:
	.file 1 "src/main.c"
	.loc 1 78 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$80, %esp
	.loc 1 78 0
	call	___main
LVL0:
	.loc 1 79 0
	movl	$0, 68(%esp)
	movl	$0, 72(%esp)
	movl	$0, 76(%esp)
	movl	$0, 56(%esp)
	movl	$0, 60(%esp)
	movl	$0, 64(%esp)
	movl	$0, 44(%esp)
	movl	$0, 48(%esp)
	movl	$0, 52(%esp)
	movl	$0, 32(%esp)
	movl	$0, 36(%esp)
	movl	$0, 40(%esp)
	movl	$0, 20(%esp)
	movl	$0, 24(%esp)
	movl	$1, 28(%esp)
	.loc 1 80 0
	movl	76(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$100, 4(%esp)
	leal	68(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	64(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$100, 4(%esp)
	leal	56(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	52(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$200, 4(%esp)
	leal	44(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	40(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$150, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	28(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$100, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	.loc 1 81 0
	movl	$100, (%esp)
	call	_Debug_PrintParameters
	.loc 1 82 0
	movl	$0, 4(%esp)
	leal	68(%esp), %eax
	movl	%eax, (%esp)
	call	_Debug_GenerateRandomBytes
	.loc 1 83 0
	movl	$0, 4(%esp)
	leal	68(%esp), %eax
	movl	%eax, (%esp)
	call	_Debug_PrintBytes
	.loc 1 84 0
	movl	$_ccParams, (%esp)
	call	_CnvCod_ListParameters
	.loc 1 85 0
	movl	$_ccParams, 8(%esp)
	leal	44(%esp), %eax
	movl	%eax, 4(%esp)
	leal	68(%esp), %eax
	movl	%eax, (%esp)
	call	_CnvCod_Encoder
	.loc 1 86 0
	movl	$2, 4(%esp)
	leal	44(%esp), %eax
	movl	%eax, (%esp)
	call	_Debug_PrintBytes
	.loc 1 87 0
	movl	$_chanParams, (%esp)
	call	_Channel_ListParameters
	.loc 1 90 0
	movl	$_chanParams, 8(%esp)
	leal	32(%esp), %eax
	movl	%eax, 4(%esp)
	leal	44(%esp), %eax
	movl	%eax, (%esp)
	call	_Channel_BSC
	.loc 1 97 0
	movl	$3, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	_Debug_PrintBytes
	.loc 1 98 0
	movl	$3, 8(%esp)
	leal	32(%esp), %eax
	movl	%eax, 4(%esp)
	leal	44(%esp), %eax
	movl	%eax, (%esp)
	call	_Debug_CheckWrongBits
	.loc 1 99 0
	movl	$_ccParams, 8(%esp)
	leal	56(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	_CnvCod_HardDecoder
	.loc 1 100 0
	movl	$1, 8(%esp)
	leal	56(%esp), %eax
	movl	%eax, 4(%esp)
	leal	68(%esp), %eax
	movl	%eax, (%esp)
	call	_Debug_CheckWrongBits
	.loc 1 106 0
	movl	$0, 4(%esp)
	leal	68(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$0, 4(%esp)
	leal	56(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$0, 4(%esp)
	leal	44(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$0, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$1, 4(%esp)
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	.loc 1 107 0
	movl	$LC0, (%esp)
	call	_puts
	.loc 1 153 0
	movl	$0, %eax
	.loc 1 154 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/system.h"
	.file 7 "src/memory.h"
	.file 8 "src/modulation.h"
	.file 9 "src/channel.h"
	.file 10 "src/convolutional.h"
	.file 11 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x886
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\main.c\0"
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
	.long	0x147
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x147
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xb1
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x147
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xb1
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xb1
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xb1
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xb1
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x147
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xb8
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xc0
	.uleb128 0x7
	.long	0x14d
	.long	0x164
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x159
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x18e
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x6
	.ascii "uint16_t\0"
	.byte	0x3
	.byte	0x3d
	.long	0x7e
	.uleb128 0x6
	.ascii "uint32_t\0"
	.byte	0x3
	.byte	0x3f
	.long	0x6e
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xb1
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x200
	.uleb128 0x5
	.byte	0x4
	.long	0x147
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xb1
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xb1
	.uleb128 0x7
	.long	0x147
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
	.long	0x6e
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x6e
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x6e
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x6e
	.uleb128 0xa
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb1
	.uleb128 0xa
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb1
	.uleb128 0xa
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x94
	.uleb128 0x7
	.long	0x147
	.long	0x2cc
	.uleb128 0xb
	.long	0x2cc
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
	.long	0x2bc
	.uleb128 0xa
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xb1
	.uleb128 0xa
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x94
	.uleb128 0xa
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2bc
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
	.long	0x35c
	.uleb128 0x4
	.ascii "re\0"
	.byte	0x6
	.byte	0x35
	.long	0x35c
	.byte	0
	.uleb128 0x4
	.ascii "im\0"
	.byte	0x6
	.byte	0x36
	.long	0x35c
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
	.long	0x332
	.uleb128 0xc
	.byte	0x4
	.long	0x6e
	.byte	0x7
	.byte	0x1d
	.long	0x3ac
	.uleb128 0xd
	.ascii "memory_type_byte\0"
	.byte	0
	.uleb128 0xd
	.ascii "memory_type_complex\0"
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.ascii "memory_type_t\0"
	.byte	0x7
	.byte	0x20
	.long	0x376
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x23
	.long	0x3fd
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x25
	.long	0x3fd
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x26
	.long	0x1bc
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x27
	.long	0x3ac
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x17f
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x28
	.long	0x3c1
	.uleb128 0x3
	.ascii "_complex_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x2b
	.long	0x457
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x2d
	.long	0x457
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x2e
	.long	0x1bc
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x2f
	.long	0x3ac
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x365
	.uleb128 0x6
	.ascii "complex_stream_t\0"
	.byte	0x7
	.byte	0x30
	.long	0x418
	.uleb128 0xc
	.byte	0x4
	.long	0x6e
	.byte	0x8
	.byte	0x1c
	.long	0x4a0
	.uleb128 0xd
	.ascii "MOD_PSK\0"
	.byte	0
	.uleb128 0xd
	.ascii "MOD_QAM\0"
	.byte	0x1
	.uleb128 0xd
	.ascii "MOD_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "modulation_t\0"
	.byte	0x8
	.byte	0x21
	.long	0x475
	.uleb128 0x3
	.ascii "_mod_par_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x29
	.long	0x4fe
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x8
	.byte	0x2b
	.long	0x4a0
	.byte	0
	.uleb128 0x4
	.ascii "order\0"
	.byte	0x8
	.byte	0x2c
	.long	0x17f
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0x8
	.byte	0x2d
	.long	0x17f
	.byte	0x5
	.uleb128 0x4
	.ascii "phOfst\0"
	.byte	0x8
	.byte	0x2e
	.long	0x35c
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "mod_par_t\0"
	.byte	0x8
	.byte	0x2f
	.long	0x4b4
	.uleb128 0xc
	.byte	0x4
	.long	0x6e
	.byte	0x9
	.byte	0x1e
	.long	0x53e
	.uleb128 0xd
	.ascii "CHAN_BSC\0"
	.byte	0
	.uleb128 0xd
	.ascii "CHAN_AWGN\0"
	.byte	0x1
	.uleb128 0xd
	.ascii "CHAN_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "channel_t\0"
	.byte	0x9
	.byte	0x23
	.long	0x50f
	.uleb128 0xe
	.byte	0x4
	.byte	0x9
	.byte	0x2b
	.long	0x56f
	.uleb128 0xf
	.ascii "Peb\0"
	.byte	0x9
	.byte	0x2d
	.long	0x35c
	.uleb128 0xf
	.ascii "EbN0\0"
	.byte	0x9
	.byte	0x2e
	.long	0x35c
	.byte	0
	.uleb128 0x3
	.ascii "_chan_par_t\0"
	.byte	0x10
	.byte	0x9
	.byte	0x26
	.long	0x5b0
	.uleb128 0x4
	.ascii "seed\0"
	.byte	0x9
	.byte	0x28
	.long	0x1bc
	.byte	0
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x9
	.byte	0x29
	.long	0x53e
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0x9
	.byte	0x2a
	.long	0x17f
	.byte	0x8
	.uleb128 0x10
	.long	0x54f
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "chan_par_t\0"
	.byte	0x9
	.byte	0x30
	.long	0x56f
	.uleb128 0xc
	.byte	0x4
	.long	0x6e
	.byte	0xa
	.byte	0x45
	.long	0x610
	.uleb128 0xd
	.ascii "CC_RATE_12\0"
	.byte	0x1
	.uleb128 0xd
	.ascii "CC_RATE_23\0"
	.byte	0x2
	.uleb128 0xd
	.ascii "CC_RATE_34\0"
	.byte	0x3
	.uleb128 0xd
	.ascii "CC_RATE_56\0"
	.byte	0x5
	.uleb128 0xd
	.ascii "CC_RATE_78\0"
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.ascii "cc_rate_t\0"
	.byte	0xa
	.byte	0x47
	.long	0x5c2
	.uleb128 0xc
	.byte	0x4
	.long	0x6e
	.byte	0xa
	.byte	0x55
	.long	0x692
	.uleb128 0xd
	.ascii "CC_KLEN_3\0"
	.byte	0x3
	.uleb128 0xd
	.ascii "CC_KLEN_4\0"
	.byte	0x4
	.uleb128 0xd
	.ascii "CC_KLEN_5\0"
	.byte	0x5
	.uleb128 0xd
	.ascii "CC_KLEN_6\0"
	.byte	0x6
	.uleb128 0xd
	.ascii "CC_KLEN_7\0"
	.byte	0x7
	.uleb128 0xd
	.ascii "CC_KLEN_8\0"
	.byte	0x8
	.uleb128 0xd
	.ascii "CC_KLEN_MIN\0"
	.byte	0x3
	.uleb128 0xd
	.ascii "CC_KLEN_MAX\0"
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "cc_klen_t\0"
	.byte	0xa
	.byte	0x5e
	.long	0x621
	.uleb128 0xc
	.byte	0x4
	.long	0x6e
	.byte	0xa
	.byte	0x63
	.long	0x6df
	.uleb128 0xd
	.ascii "CC_VITDM_HARD\0"
	.byte	0
	.uleb128 0xd
	.ascii "CC_VITDM_SOFT\0"
	.byte	0x1
	.uleb128 0xd
	.ascii "CC_VITDM_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "cc_dec_method_t\0"
	.byte	0xa
	.byte	0x68
	.long	0x6a3
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0xa
	.byte	0x6b
	.long	0x742
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0xa
	.byte	0x6d
	.long	0x610
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0xa
	.byte	0x6e
	.long	0x692
	.byte	0x4
	.uleb128 0x4
	.ascii "memFact\0"
	.byte	0xa
	.byte	0x6f
	.long	0x1ac
	.byte	0x8
	.uleb128 0x4
	.ascii "vitDM\0"
	.byte	0xa
	.byte	0x70
	.long	0x6df
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0xa
	.byte	0x71
	.long	0x6f6
	.uleb128 0xc
	.byte	0x4
	.long	0x6e
	.byte	0xb
	.byte	0x28
	.long	0x7a3
	.uleb128 0xd
	.ascii "PID_TX_SRC\0"
	.byte	0
	.uleb128 0xd
	.ascii "PID_RX_SRC\0"
	.byte	0x1
	.uleb128 0xd
	.ascii "PID_TX_CNVCOD\0"
	.byte	0x2
	.uleb128 0xd
	.ascii "PID_RX_CNVCOD\0"
	.byte	0x3
	.uleb128 0xd
	.ascii "PID_NUM\0"
	.byte	0x4
	.byte	0
	.uleb128 0x11
	.ascii "ccParams\0"
	.byte	0x1
	.byte	0x3b
	.long	0x742
	.uleb128 0x5
	.byte	0x3
	.long	_ccParams
	.uleb128 0x11
	.ascii "modParams\0"
	.byte	0x1
	.byte	0x3c
	.long	0x4fe
	.uleb128 0x5
	.byte	0x3
	.long	_modParams
	.uleb128 0x11
	.ascii "chanParams\0"
	.byte	0x1
	.byte	0x3d
	.long	0x5b0
	.uleb128 0x5
	.byte	0x3
	.long	_chanParams
	.uleb128 0x12
	.ascii "main\0"
	.byte	0x1
	.byte	0x4d
	.long	0xb1
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.ascii "txSrcStream\0"
	.byte	0x1
	.byte	0x4f
	.long	0x403
	.uleb128 0x3
	.byte	0x74
	.sleb128 68
	.uleb128 0x11
	.ascii "rxSrcStream\0"
	.byte	0x1
	.byte	0x4f
	.long	0x403
	.uleb128 0x2
	.byte	0x74
	.sleb128 56
	.uleb128 0x11
	.ascii "txCcStream\0"
	.byte	0x1
	.byte	0x4f
	.long	0x403
	.uleb128 0x2
	.byte	0x74
	.sleb128 44
	.uleb128 0x11
	.ascii "rxCcStream\0"
	.byte	0x1
	.byte	0x4f
	.long	0x403
	.uleb128 0x2
	.byte	0x74
	.sleb128 32
	.uleb128 0x11
	.ascii "txModStream\0"
	.byte	0x1
	.byte	0x4f
	.long	0x45d
	.uleb128 0x2
	.byte	0x74
	.sleb128 20
	.uleb128 0x13
	.uleb128 0x14
	.ascii "Modulation_Mapper\0"
	.byte	0x1
	.byte	0x5f
	.long	0xb1
	.uleb128 0x15
	.byte	0
	.byte	0
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
	.uleb128 0xd
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
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
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x18
	.byte	0
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
	.def	_Memory_AllocateStream;	.scl	2;	.type	32;	.endef
	.def	_Debug_PrintParameters;	.scl	2;	.type	32;	.endef
	.def	_Debug_GenerateRandomBytes;	.scl	2;	.type	32;	.endef
	.def	_Debug_PrintBytes;	.scl	2;	.type	32;	.endef
	.def	_CnvCod_ListParameters;	.scl	2;	.type	32;	.endef
	.def	_CnvCod_Encoder;	.scl	2;	.type	32;	.endef
	.def	_Channel_ListParameters;	.scl	2;	.type	32;	.endef
	.def	_Channel_BSC;	.scl	2;	.type	32;	.endef
	.def	_Debug_CheckWrongBits;	.scl	2;	.type	32;	.endef
	.def	_CnvCod_HardDecoder;	.scl	2;	.type	32;	.endef
	.def	_Memory_FreeStream;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
