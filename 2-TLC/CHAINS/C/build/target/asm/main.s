	.file	"main.c"
	.text
Ltext0:
.lcomm _elapsedTime,4,4
.lcomm _crcParam,12,4
.lcomm _scrParam,16,4
.lcomm _rsParam,16,4
.lcomm _ccParam,16,4
.lcomm _modParam,12,4
.lcomm _chanParam,16,4
.lcomm _dgbParam,76,32
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "\12 >> Starting execution...\0"
	.align 4
LC2:
	.ascii " >> Execution completed successfully in %1.3f seconds!\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB18:
	.file 1 "src/main.c"
	.loc 1 102 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$192, %esp
	.loc 1 102 0
	call	___main
LVL0:
	.loc 1 104 0
	movl	$LC0, (%esp)
	call	_puts
	.loc 1 105 0
	call	_clock
	movl	%eax, _elapsedTime
	.loc 1 107 0
	movl	$_crcParam, (%esp)
	call	_Crc_ListParameters
	.loc 1 108 0
	movl	$_scrParam, (%esp)
	call	_Scramb_ListParameters
	.loc 1 109 0
	movl	$_rsParam, (%esp)
	call	_RsCod_ListParameters
	.loc 1 110 0
	movl	$_ccParam, (%esp)
	call	_CnvCod_ListParameters
	.loc 1 111 0
	movl	$_chanParam, (%esp)
	call	_Channel_ListParameters
	.loc 1 112 0
	movl	$_modParam, (%esp)
	call	_Modulation_ListParameters
	.loc 1 113 0
	movl	$_chanParam, 20(%esp)
	movl	$_modParam, 16(%esp)
	movl	$_ccParam, 12(%esp)
	movl	$_rsParam, 8(%esp)
	movl	$_scrParam, 4(%esp)
	movl	$_dgbParam, (%esp)
	call	_Debug_ListParameters
	.loc 1 115 0
	movl	$_dgbParam, 4(%esp)
	movl	$150, (%esp)
	call	_Debug_PrintParameters
	.loc 1 117 0
	movl	$0, 180(%esp)
	movl	$0, 184(%esp)
	movl	$0, 188(%esp)
	movl	$0, 168(%esp)
	movl	$0, 172(%esp)
	movl	$0, 176(%esp)
	movl	$0, 156(%esp)
	movl	$0, 160(%esp)
	movl	$0, 164(%esp)
	movl	$0, 144(%esp)
	movl	$0, 148(%esp)
	movl	$0, 152(%esp)
	movl	$0, 132(%esp)
	movl	$0, 136(%esp)
	movl	$0, 140(%esp)
	movl	$0, 120(%esp)
	movl	$0, 124(%esp)
	movl	$0, 128(%esp)
	movl	$0, 108(%esp)
	movl	$0, 112(%esp)
	movl	$0, 116(%esp)
	movl	$0, 96(%esp)
	movl	$0, 100(%esp)
	movl	$0, 104(%esp)
	movl	$0, 84(%esp)
	movl	$0, 88(%esp)
	movl	$2, 92(%esp)
	movl	$0, 72(%esp)
	movl	$0, 76(%esp)
	movl	$2, 80(%esp)
	movl	$0, 60(%esp)
	movl	$0, 64(%esp)
	movl	$1, 68(%esp)
	.loc 1 118 0
	movl	188(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$150, 4(%esp)
	leal	180(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	176(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$150, 4(%esp)
	leal	168(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	164(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$2, 4(%esp)
	leal	156(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	152(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$2, 4(%esp)
	leal	144(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	140(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$150, 4(%esp)
	leal	132(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	128(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$150, 4(%esp)
	leal	120(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	116(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$300, 4(%esp)
	leal	108(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	104(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$300, 4(%esp)
	leal	96(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	92(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$1200, 4(%esp)
	leal	84(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	80(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$1200, 4(%esp)
	leal	72(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	movl	68(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$2400, 4(%esp)
	leal	60(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_AllocateStream
	.loc 1 121 0
	movl	$0, 4(%esp)
	leal	180(%esp), %eax
	movl	%eax, (%esp)
	call	_Debug_GenerateRandomBytes
	.loc 1 122 0
	movl	$_crcParam, 8(%esp)
	leal	156(%esp), %eax
	movl	%eax, 4(%esp)
	leal	180(%esp), %eax
	movl	%eax, (%esp)
	call	_Crc_CalculateChecksum
	.loc 1 123 0
	movl	$_scrParam, 8(%esp)
	leal	132(%esp), %eax
	movl	%eax, 4(%esp)
	leal	180(%esp), %eax
	movl	%eax, (%esp)
	call	_Scramb_Scrambler
	.loc 1 124 0
	movl	$_ccParam, 8(%esp)
	leal	108(%esp), %eax
	movl	%eax, 4(%esp)
	leal	132(%esp), %eax
	movl	%eax, (%esp)
	call	_CnvCod_Encoder
	.loc 1 125 0
	movl	_chanParam+4, %eax
	testl	%eax, %eax
	jne	L2
	.loc 1 127 0
	movl	$_chanParam, 8(%esp)
	leal	96(%esp), %eax
	movl	%eax, 4(%esp)
	leal	108(%esp), %eax
	movl	%eax, (%esp)
	call	_Channel_BSC
	.loc 1 128 0
	movl	$_ccParam, 8(%esp)
	leal	120(%esp), %eax
	movl	%eax, 4(%esp)
	leal	96(%esp), %eax
	movl	%eax, (%esp)
	call	_CnvCod_HardDecoder
	jmp	L3
L2:
	.loc 1 130 0
	movl	_chanParam+4, %eax
	cmpl	$1, %eax
	jne	L3
	.loc 1 132 0
	movl	$_modParam, 8(%esp)
	leal	84(%esp), %eax
	movl	%eax, 4(%esp)
	leal	108(%esp), %eax
	movl	%eax, (%esp)
	call	_Modulation_Mapper
	.loc 1 133 0
	movl	$_chanParam, 8(%esp)
	leal	72(%esp), %eax
	movl	%eax, 4(%esp)
	leal	84(%esp), %eax
	movl	%eax, (%esp)
	call	_Channel_AWGN
	.loc 1 134 0
	movl	_ccParam+12, %eax
	testl	%eax, %eax
	jne	L4
	.loc 1 136 0
	movl	$_modParam, 8(%esp)
	leal	96(%esp), %eax
	movl	%eax, 4(%esp)
	leal	72(%esp), %eax
	movl	%eax, (%esp)
	call	_Modulation_HardDemapper
	.loc 1 137 0
	movl	$_ccParam, 8(%esp)
	leal	120(%esp), %eax
	movl	%eax, 4(%esp)
	leal	96(%esp), %eax
	movl	%eax, (%esp)
	call	_CnvCod_HardDecoder
	jmp	L3
L4:
	.loc 1 139 0
	movl	_ccParam+12, %eax
	cmpl	$1, %eax
	jne	L3
	.loc 1 141 0
	movl	$_modParam, 8(%esp)
	leal	60(%esp), %eax
	movl	%eax, 4(%esp)
	leal	72(%esp), %eax
	movl	%eax, (%esp)
	call	_Modulation_SoftDemapper
	.loc 1 142 0
	movl	$_ccParam, 8(%esp)
	leal	120(%esp), %eax
	movl	%eax, 4(%esp)
	leal	60(%esp), %eax
	movl	%eax, (%esp)
	call	_CnvCod_SoftDecoder
L3:
	.loc 1 145 0
	movl	$_scrParam, 8(%esp)
	leal	168(%esp), %eax
	movl	%eax, 4(%esp)
	leal	120(%esp), %eax
	movl	%eax, (%esp)
	call	_Scramb_Descrambler
	.loc 1 146 0
	movl	$_crcParam, 8(%esp)
	leal	144(%esp), %eax
	movl	%eax, 4(%esp)
	leal	168(%esp), %eax
	movl	%eax, (%esp)
	call	_Crc_CalculateChecksum
	.loc 1 164 0
	movl	$_dgbParam, 12(%esp)
	movl	$7, 8(%esp)
	leal	96(%esp), %eax
	movl	%eax, 4(%esp)
	leal	108(%esp), %eax
	movl	%eax, (%esp)
	call	_Debug_CheckWrongBits
	.loc 1 165 0
	movl	$_dgbParam, 12(%esp)
	movl	$1, 8(%esp)
	leal	168(%esp), %eax
	movl	%eax, 4(%esp)
	leal	180(%esp), %eax
	movl	%eax, (%esp)
	call	_Debug_CheckWrongBits
	.loc 1 166 0
	movl	$_dgbParam, 12(%esp)
	movl	$3, 8(%esp)
	leal	144(%esp), %eax
	movl	%eax, 4(%esp)
	leal	156(%esp), %eax
	movl	%eax, (%esp)
	call	_Debug_CheckWrongBits
	.loc 1 174 0
	movl	$0, 4(%esp)
	leal	180(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$0, 4(%esp)
	leal	168(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$0, 4(%esp)
	leal	156(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$0, 4(%esp)
	leal	144(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$0, 4(%esp)
	leal	132(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$0, 4(%esp)
	leal	120(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$0, 4(%esp)
	leal	108(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$0, 4(%esp)
	leal	96(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$2, 4(%esp)
	leal	84(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$2, 4(%esp)
	leal	72(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	movl	$1, 4(%esp)
	leal	60(%esp), %eax
	movl	%eax, (%esp)
	call	_Memory_FreeStream
	.loc 1 175 0
	call	_clock
	movl	%eax, %edx
	movl	_elapsedTime, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _elapsedTime
	.loc 1 177 0
	movl	_elapsedTime, %eax
	movl	%eax, 44(%esp)
	fildl	44(%esp)
	flds	LC1
	fdivrp	%st, %st(1)
	.loc 1 176 0
	fstpl	4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	.loc 1 179 0
	movl	$0, %eax
	.loc 1 180 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
	.align 4
LC1:
	.long	1148846080
	.text
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
	.file 11 "src/crc.h"
	.file 12 "src/reed_solomon.h"
	.file 13 "src/scrambling.h"
	.file 14 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xce9
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
	.long	0x193
	.uleb128 0xa
	.long	0x17f
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
	.long	0x205
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
	.long	0x23b
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x230
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
	.uleb128 0xb
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb1
	.uleb128 0x6
	.ascii "clock_t\0"
	.byte	0x5
	.byte	0xb7
	.long	0x94
	.uleb128 0xb
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb1
	.uleb128 0xb
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x94
	.uleb128 0x7
	.long	0x147
	.long	0x2e0
	.uleb128 0xc
	.long	0x2e0
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
	.long	0x2d0
	.uleb128 0xb
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xb1
	.uleb128 0xb
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x94
	.uleb128 0xb
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2d0
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
	.byte	0x38
	.long	0x370
	.uleb128 0x4
	.ascii "re\0"
	.byte	0x6
	.byte	0x3a
	.long	0x370
	.byte	0
	.uleb128 0x4
	.ascii "im\0"
	.byte	0x6
	.byte	0x3b
	.long	0x370
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x6
	.ascii "complex_t\0"
	.byte	0x6
	.byte	0x3c
	.long	0x346
	.uleb128 0xd
	.byte	0x4
	.long	0x6e
	.byte	0x7
	.byte	0x1d
	.long	0x3d4
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
	.long	0x38a
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x24
	.long	0x425
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x26
	.long	0x425
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x27
	.long	0x1c1
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x28
	.long	0x3d4
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x17f
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x29
	.long	0x3e9
	.uleb128 0x3
	.ascii "_float_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x2c
	.long	0x47d
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x2e
	.long	0x47d
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x2f
	.long	0x1c1
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x30
	.long	0x3d4
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x370
	.uleb128 0x6
	.ascii "float_stream_t\0"
	.byte	0x7
	.byte	0x31
	.long	0x440
	.uleb128 0x3
	.ascii "_complex_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x34
	.long	0x4d8
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x36
	.long	0x4d8
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x37
	.long	0x1c1
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x38
	.long	0x3d4
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x379
	.uleb128 0x6
	.ascii "complex_stream_t\0"
	.byte	0x7
	.byte	0x39
	.long	0x499
	.uleb128 0xd
	.byte	0x4
	.long	0x6e
	.byte	0x8
	.byte	0x1d
	.long	0x521
	.uleb128 0xe
	.ascii "MOD_PSK\0"
	.byte	0
	.uleb128 0xe
	.ascii "MOD_QAM\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "MOD_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "mod_type_t\0"
	.byte	0x8
	.byte	0x22
	.long	0x4f6
	.uleb128 0x3
	.ascii "_mod_par_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x49
	.long	0x57d
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x8
	.byte	0x4b
	.long	0x521
	.byte	0
	.uleb128 0x4
	.ascii "order\0"
	.byte	0x8
	.byte	0x4c
	.long	0x17f
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0x8
	.byte	0x4d
	.long	0x17f
	.byte	0x5
	.uleb128 0x4
	.ascii "phOfst\0"
	.byte	0x8
	.byte	0x4e
	.long	0x370
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "mod_par_t\0"
	.byte	0x8
	.byte	0x4f
	.long	0x533
	.uleb128 0xd
	.byte	0x4
	.long	0x6e
	.byte	0x9
	.byte	0x1e
	.long	0x5bd
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
	.ascii "chan_type_t\0"
	.byte	0x9
	.byte	0x23
	.long	0x58e
	.uleb128 0xf
	.byte	0x4
	.byte	0x9
	.byte	0x2b
	.long	0x5f0
	.uleb128 0x10
	.ascii "Peb\0"
	.byte	0x9
	.byte	0x2d
	.long	0x370
	.uleb128 0x10
	.ascii "EbN0\0"
	.byte	0x9
	.byte	0x2e
	.long	0x370
	.byte	0
	.uleb128 0x3
	.ascii "_chan_par_t\0"
	.byte	0x10
	.byte	0x9
	.byte	0x26
	.long	0x631
	.uleb128 0x4
	.ascii "seed\0"
	.byte	0x9
	.byte	0x28
	.long	0x1c1
	.byte	0
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x9
	.byte	0x29
	.long	0x5bd
	.byte	0x4
	.uleb128 0x4
	.ascii "bps\0"
	.byte	0x9
	.byte	0x2a
	.long	0x17f
	.byte	0x8
	.uleb128 0x11
	.long	0x5d0
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "chan_par_t\0"
	.byte	0x9
	.byte	0x30
	.long	0x5f0
	.uleb128 0xd
	.byte	0x4
	.long	0x6e
	.byte	0xa
	.byte	0x3d
	.long	0x691
	.uleb128 0xe
	.ascii "CC_RATE_12\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "CC_RATE_23\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "CC_RATE_34\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "CC_RATE_56\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "CC_RATE_78\0"
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.ascii "cc_rate_t\0"
	.byte	0xa
	.byte	0x3f
	.long	0x643
	.uleb128 0xd
	.byte	0x4
	.long	0x6e
	.byte	0xa
	.byte	0x50
	.long	0x713
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
	.uleb128 0x6
	.ascii "cc_klen_t\0"
	.byte	0xa
	.byte	0x59
	.long	0x6a2
	.uleb128 0xd
	.byte	0x4
	.long	0x6e
	.byte	0xa
	.byte	0x5e
	.long	0x760
	.uleb128 0xe
	.ascii "CC_VITDM_HARD\0"
	.byte	0
	.uleb128 0xe
	.ascii "CC_VITDM_SOFT\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "CC_VITDM_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "cc_dec_method_t\0"
	.byte	0xa
	.byte	0x63
	.long	0x724
	.uleb128 0x3
	.ascii "_cc_par_t\0"
	.byte	0x10
	.byte	0xa
	.byte	0x66
	.long	0x7c3
	.uleb128 0x4
	.ascii "cRate\0"
	.byte	0xa
	.byte	0x68
	.long	0x691
	.byte	0
	.uleb128 0x4
	.ascii "kLen\0"
	.byte	0xa
	.byte	0x69
	.long	0x713
	.byte	0x4
	.uleb128 0x4
	.ascii "memFact\0"
	.byte	0xa
	.byte	0x6a
	.long	0x1b1
	.byte	0x8
	.uleb128 0x4
	.ascii "vitDM\0"
	.byte	0xa
	.byte	0x6b
	.long	0x760
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "cc_par_t\0"
	.byte	0xa
	.byte	0x6c
	.long	0x777
	.uleb128 0x5
	.byte	0x4
	.long	0x18e
	.uleb128 0xd
	.byte	0x4
	.long	0x6e
	.byte	0xb
	.byte	0x1d
	.long	0x835
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
	.byte	0xb
	.byte	0x23
	.long	0x7d9
	.uleb128 0x3
	.ascii "_crc_par_t\0"
	.byte	0xc
	.byte	0xb
	.byte	0x25
	.long	0x890
	.uleb128 0x4
	.ascii "degree\0"
	.byte	0xb
	.byte	0x27
	.long	0x835
	.byte	0
	.uleb128 0x4
	.ascii "pGenPoly\0"
	.byte	0xb
	.byte	0x28
	.long	0x7d3
	.byte	0x4
	.uleb128 0x4
	.ascii "lenGenPoly\0"
	.byte	0xb
	.byte	0x29
	.long	0x17f
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "crc_par_t\0"
	.byte	0xb
	.byte	0x2a
	.long	0x849
	.uleb128 0xd
	.byte	0x4
	.long	0x6e
	.byte	0xc
	.byte	0x1d
	.long	0x8d0
	.uleb128 0xe
	.ascii "RS_GF_DEGREE_4\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "RS_GF_DEGREE_8\0"
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.ascii "rs_gf_degree_t\0"
	.byte	0xc
	.byte	0x20
	.long	0x8a1
	.uleb128 0x3
	.ascii "_rs_par_t\0"
	.byte	0x10
	.byte	0xc
	.byte	0x32
	.long	0x94b
	.uleb128 0x4
	.ascii "m\0"
	.byte	0xc
	.byte	0x34
	.long	0x8d0
	.byte	0
	.uleb128 0x4
	.ascii "kSh\0"
	.byte	0xc
	.byte	0x35
	.long	0x17f
	.byte	0x4
	.uleb128 0x4
	.ascii "nSh\0"
	.byte	0xc
	.byte	0x36
	.long	0x17f
	.byte	0x5
	.uleb128 0x4
	.ascii "t\0"
	.byte	0xc
	.byte	0x37
	.long	0x17f
	.byte	0x6
	.uleb128 0x4
	.ascii "kUn\0"
	.byte	0xc
	.byte	0x38
	.long	0x1b1
	.byte	0x8
	.uleb128 0x4
	.ascii "nUn\0"
	.byte	0xc
	.byte	0x39
	.long	0x1b1
	.byte	0xa
	.uleb128 0x4
	.ascii "dimGF\0"
	.byte	0xc
	.byte	0x3a
	.long	0x1b1
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "rs_par_t\0"
	.byte	0xc
	.byte	0x3b
	.long	0x8e6
	.uleb128 0xd
	.byte	0x4
	.long	0x6e
	.byte	0xd
	.byte	0x1d
	.long	0x98f
	.uleb128 0xe
	.ascii "SCRAMB_ADT\0"
	.byte	0
	.uleb128 0xe
	.ascii "SCRAMB_MLT\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "SCRAMB_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "scramb_type_t\0"
	.byte	0xd
	.byte	0x22
	.long	0x95b
	.uleb128 0x3
	.ascii "_scramb_par_t\0"
	.byte	0x10
	.byte	0xd
	.byte	0x25
	.long	0x9f6
	.uleb128 0x4
	.ascii "type\0"
	.byte	0xd
	.byte	0x27
	.long	0x98f
	.byte	0
	.uleb128 0x4
	.ascii "nCells\0"
	.byte	0xd
	.byte	0x28
	.long	0x17f
	.byte	0x4
	.uleb128 0x4
	.ascii "conVect\0"
	.byte	0xd
	.byte	0x29
	.long	0x1c1
	.byte	0x8
	.uleb128 0x4
	.ascii "initSt\0"
	.byte	0xd
	.byte	0x2a
	.long	0x1c1
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "scramb_par_t\0"
	.byte	0xd
	.byte	0x2b
	.long	0x9a4
	.uleb128 0xd
	.byte	0x4
	.long	0x6e
	.byte	0xe
	.byte	0x2c
	.long	0xab6
	.uleb128 0xe
	.ascii "PID_TX_ORG\0"
	.byte	0
	.uleb128 0xe
	.ascii "PID_RX_ORG\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "PID_TX_CRC\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "PID_RX_CRC\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "PID_TX_SCR\0"
	.byte	0x4
	.uleb128 0xe
	.ascii "PID_RX_SCR\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "PID_TX_CNVCOD\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "PID_RX_CNVCOD\0"
	.byte	0x7
	.uleb128 0xe
	.ascii "PID_TX_MAP\0"
	.byte	0x8
	.uleb128 0xe
	.ascii "PID_RX_MAP\0"
	.byte	0x9
	.uleb128 0xe
	.ascii "PID_RX_LLR\0"
	.byte	0xa
	.uleb128 0xe
	.ascii "PID_NUM\0"
	.byte	0xb
	.byte	0
	.uleb128 0x3
	.ascii "_debug_par_t\0"
	.byte	0x4c
	.byte	0xe
	.byte	0x3d
	.long	0xb16
	.uleb128 0x4
	.ascii "scrPar\0"
	.byte	0xe
	.byte	0x3f
	.long	0x9f6
	.byte	0
	.uleb128 0x4
	.ascii "rsPar\0"
	.byte	0xe
	.byte	0x40
	.long	0x94b
	.byte	0x10
	.uleb128 0x4
	.ascii "ccPar\0"
	.byte	0xe
	.byte	0x41
	.long	0x7c3
	.byte	0x20
	.uleb128 0x4
	.ascii "modPar\0"
	.byte	0xe
	.byte	0x42
	.long	0x57d
	.byte	0x30
	.uleb128 0x4
	.ascii "chanPar\0"
	.byte	0xe
	.byte	0x43
	.long	0x631
	.byte	0x3c
	.byte	0
	.uleb128 0x6
	.ascii "debug_par_t\0"
	.byte	0xe
	.byte	0x44
	.long	0xab6
	.uleb128 0x12
	.ascii "elapsedTime\0"
	.byte	0x1
	.byte	0x48
	.long	0x29d
	.uleb128 0x5
	.byte	0x3
	.long	_elapsedTime
	.uleb128 0x12
	.ascii "crcParam\0"
	.byte	0x1
	.byte	0x49
	.long	0x890
	.uleb128 0x5
	.byte	0x3
	.long	_crcParam
	.uleb128 0x12
	.ascii "scrParam\0"
	.byte	0x1
	.byte	0x4a
	.long	0x9f6
	.uleb128 0x5
	.byte	0x3
	.long	_scrParam
	.uleb128 0x12
	.ascii "rsParam\0"
	.byte	0x1
	.byte	0x4b
	.long	0x94b
	.uleb128 0x5
	.byte	0x3
	.long	_rsParam
	.uleb128 0x12
	.ascii "ccParam\0"
	.byte	0x1
	.byte	0x4c
	.long	0x7c3
	.uleb128 0x5
	.byte	0x3
	.long	_ccParam
	.uleb128 0x12
	.ascii "modParam\0"
	.byte	0x1
	.byte	0x4d
	.long	0x57d
	.uleb128 0x5
	.byte	0x3
	.long	_modParam
	.uleb128 0x12
	.ascii "chanParam\0"
	.byte	0x1
	.byte	0x4e
	.long	0x631
	.uleb128 0x5
	.byte	0x3
	.long	_chanParam
	.uleb128 0x12
	.ascii "dgbParam\0"
	.byte	0x1
	.byte	0x4f
	.long	0xb16
	.uleb128 0x5
	.byte	0x3
	.long	_dgbParam
	.uleb128 0x13
	.ascii "main\0"
	.byte	0x1
	.byte	0x65
	.long	0xb1
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.ascii "txOrgStream\0"
	.byte	0x1
	.byte	0x75
	.long	0x42b
	.uleb128 0x3
	.byte	0x74
	.sleb128 180
	.uleb128 0x12
	.ascii "rxOrgStream\0"
	.byte	0x1
	.byte	0x75
	.long	0x42b
	.uleb128 0x3
	.byte	0x74
	.sleb128 168
	.uleb128 0x12
	.ascii "txCrcStream\0"
	.byte	0x1
	.byte	0x75
	.long	0x42b
	.uleb128 0x3
	.byte	0x74
	.sleb128 156
	.uleb128 0x12
	.ascii "rxCrcStream\0"
	.byte	0x1
	.byte	0x75
	.long	0x42b
	.uleb128 0x3
	.byte	0x74
	.sleb128 144
	.uleb128 0x12
	.ascii "txScrStream\0"
	.byte	0x1
	.byte	0x75
	.long	0x42b
	.uleb128 0x3
	.byte	0x74
	.sleb128 132
	.uleb128 0x12
	.ascii "rxScrStream\0"
	.byte	0x1
	.byte	0x75
	.long	0x42b
	.uleb128 0x3
	.byte	0x74
	.sleb128 120
	.uleb128 0x12
	.ascii "txCcStream\0"
	.byte	0x1
	.byte	0x75
	.long	0x42b
	.uleb128 0x3
	.byte	0x74
	.sleb128 108
	.uleb128 0x12
	.ascii "rxCcStream\0"
	.byte	0x1
	.byte	0x75
	.long	0x42b
	.uleb128 0x3
	.byte	0x74
	.sleb128 96
	.uleb128 0x12
	.ascii "txModStream\0"
	.byte	0x1
	.byte	0x75
	.long	0x4de
	.uleb128 0x3
	.byte	0x74
	.sleb128 84
	.uleb128 0x12
	.ascii "rxModStream\0"
	.byte	0x1
	.byte	0x75
	.long	0x4de
	.uleb128 0x3
	.byte	0x74
	.sleb128 72
	.uleb128 0x12
	.ascii "rxLLRStream\0"
	.byte	0x1
	.byte	0x75
	.long	0x483
	.uleb128 0x2
	.byte	0x74
	.sleb128 60
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
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_clock;	.scl	2;	.type	32;	.endef
	.def	_Crc_ListParameters;	.scl	2;	.type	32;	.endef
	.def	_Scramb_ListParameters;	.scl	2;	.type	32;	.endef
	.def	_RsCod_ListParameters;	.scl	2;	.type	32;	.endef
	.def	_CnvCod_ListParameters;	.scl	2;	.type	32;	.endef
	.def	_Channel_ListParameters;	.scl	2;	.type	32;	.endef
	.def	_Modulation_ListParameters;	.scl	2;	.type	32;	.endef
	.def	_Debug_ListParameters;	.scl	2;	.type	32;	.endef
	.def	_Debug_PrintParameters;	.scl	2;	.type	32;	.endef
	.def	_Memory_AllocateStream;	.scl	2;	.type	32;	.endef
	.def	_Debug_GenerateRandomBytes;	.scl	2;	.type	32;	.endef
	.def	_Crc_CalculateChecksum;	.scl	2;	.type	32;	.endef
	.def	_Scramb_Scrambler;	.scl	2;	.type	32;	.endef
	.def	_CnvCod_Encoder;	.scl	2;	.type	32;	.endef
	.def	_Channel_BSC;	.scl	2;	.type	32;	.endef
	.def	_CnvCod_HardDecoder;	.scl	2;	.type	32;	.endef
	.def	_Modulation_Mapper;	.scl	2;	.type	32;	.endef
	.def	_Channel_AWGN;	.scl	2;	.type	32;	.endef
	.def	_Modulation_HardDemapper;	.scl	2;	.type	32;	.endef
	.def	_Modulation_SoftDemapper;	.scl	2;	.type	32;	.endef
	.def	_CnvCod_SoftDecoder;	.scl	2;	.type	32;	.endef
	.def	_Scramb_Descrambler;	.scl	2;	.type	32;	.endef
	.def	_Debug_CheckWrongBits;	.scl	2;	.type	32;	.endef
	.def	_Memory_FreeStream;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
