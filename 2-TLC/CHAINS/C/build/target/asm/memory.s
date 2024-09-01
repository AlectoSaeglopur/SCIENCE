	.file	"memory.c"
	.text
Ltext0:
	.globl	_Memory_AllocateStream
	.def	_Memory_AllocateStream;	.scl	2;	.type	32;	.endef
_Memory_AllocateStream:
LFB18:
	.file 1 "src/memory.c"
	.loc 1 43 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 44 0
	movl	$0, -12(%ebp)
	.loc 1 47 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 49 0
	movl	16(%ebp), %eax
	cmpl	$8, %eax
	jne	L8
	.loc 1 52 0
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	.loc 1 53 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_AllocateByteStream
	.loc 1 54 0
	jmp	L6
L8:
	.loc 1 57 0
	movl	$7, -12(%ebp)
	.loc 1 58 0
	nop
	jmp	L6
L2:
	.loc 1 63 0
	movl	$1, -12(%ebp)
L6:
	.loc 1 66 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 67 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_Memory_FreeStream
	.def	_Memory_FreeStream;	.scl	2;	.type	32;	.endef
_Memory_FreeStream:
LFB19:
	.loc 1 79 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 80 0
	movl	$0, -12(%ebp)
	.loc 1 83 0
	cmpl	$0, 8(%ebp)
	je	L10
	.loc 1 85 0
	movl	12(%ebp), %eax
	cmpl	$8, %eax
	jne	L16
	.loc 1 88 0
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	.loc 1 89 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_FreeByteStream
	.loc 1 90 0
	jmp	L14
L16:
	.loc 1 93 0
	movl	$7, -12(%ebp)
	.loc 1 94 0
	nop
	jmp	L14
L10:
	.loc 1 99 0
	movl	$1, -12(%ebp)
L14:
	.loc 1 102 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 103 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.def	_AllocateByteStream;	.scl	3;	.type	32;	.endef
_AllocateByteStream:
LFB20:
	.loc 1 120 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 121 0
	movl	$0, -12(%ebp)
	.loc 1 123 0
	cmpl	$0, 8(%ebp)
	je	L18
	.loc 1 125 0
	movl	$1, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 126 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L19
	.loc 1 128 0
	movl	$6, -12(%ebp)
	jmp	L21
L19:
	.loc 1 132 0
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	jmp	L21
L18:
	.loc 1 137 0
	movl	$1, -12(%ebp)
L21:
	.loc 1 140 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 141 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.def	_FreeByteStream;	.scl	3;	.type	32;	.endef
_FreeByteStream:
LFB21:
	.loc 1 152 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 153 0
	movl	$0, -12(%ebp)
	.loc 1 155 0
	cmpl	$0, 8(%ebp)
	je	L24
	.loc 1 155 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L24
	.loc 1 157 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	.loc 1 158 0
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	.loc 1 159 0
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	jmp	L25
L24:
	.loc 1 163 0
	movl	$1, -12(%ebp)
L25:
	.loc 1 166 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 167 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/lib/gcc/mingw32/6.3.0/include/stddef.h"
	.file 4 "c:/mingw/include/stdint.h"
	.file 5 "c:/mingw/include/stdlib.h"
	.file 6 "c:/mingw/include/time.h"
	.file 7 "src/error.h"
	.file 8 "src/memory.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x5b1
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\memory.c\0"
	.ascii "H:\\SCIENCE\\2-TLC\\CHAINS\\C\0"
	.long	Ltext0
	.long	Letext0-Ltext0
	.secrel32	Ldebug_line0
	.uleb128 0x2
	.ascii "size_t\0"
	.byte	0x3
	.byte	0xd8
	.long	0x7e
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x4
	.ascii "_iobuf\0"
	.byte	0x20
	.byte	0x2
	.byte	0xd2
	.long	0x157
	.uleb128 0x5
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x157
	.byte	0
	.uleb128 0x5
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xc1
	.byte	0x4
	.uleb128 0x5
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x157
	.byte	0x8
	.uleb128 0x5
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xc1
	.byte	0xc
	.uleb128 0x5
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xc1
	.byte	0x10
	.uleb128 0x5
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xc1
	.byte	0x14
	.uleb128 0x5
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xc1
	.byte	0x18
	.uleb128 0x5
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x157
	.byte	0x1c
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0xc8
	.uleb128 0x2
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xd0
	.uleb128 0x7
	.long	0x15d
	.long	0x174
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x169
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x2
	.ascii "uint8_t\0"
	.byte	0x4
	.byte	0x3b
	.long	0x19e
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x2
	.ascii "uint32_t\0"
	.byte	0x4
	.byte	0x3f
	.long	0x7e
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x5
	.byte	0x63
	.long	0xc1
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x5
	.byte	0x64
	.long	0x200
	.uleb128 0x6
	.byte	0x4
	.long	0x157
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x5
	.byte	0x8e
	.long	0xc1
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x5
	.byte	0xca
	.long	0xc1
	.uleb128 0x7
	.long	0x157
	.long	0x236
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x5
	.byte	0xe3
	.long	0x22b
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x5
	.byte	0xfa
	.long	0x7e
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x5
	.byte	0xfb
	.long	0x7e
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x5
	.byte	0xfc
	.long	0x7e
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x5
	.byte	0xfd
	.long	0x7e
	.uleb128 0xa
	.ascii "_fmode\0"
	.byte	0x5
	.word	0x145
	.long	0xc1
	.uleb128 0xa
	.ascii "_daylight\0"
	.byte	0x6
	.word	0x15c
	.long	0xc1
	.uleb128 0xa
	.ascii "_timezone\0"
	.byte	0x6
	.word	0x15d
	.long	0xa4
	.uleb128 0x7
	.long	0x157
	.long	0x2cc
	.uleb128 0xb
	.long	0x2cc
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.ascii "sizetype\0"
	.uleb128 0xa
	.ascii "_tzname\0"
	.byte	0x6
	.word	0x15e
	.long	0x2bc
	.uleb128 0xa
	.ascii "daylight\0"
	.byte	0x6
	.word	0x17d
	.long	0xc1
	.uleb128 0xa
	.ascii "timezone\0"
	.byte	0x6
	.word	0x17e
	.long	0xa4
	.uleb128 0xa
	.ascii "tzname\0"
	.byte	0x6
	.word	0x17f
	.long	0x2bc
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x3
	.byte	0xc
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0xc
	.byte	0x4
	.long	0x7e
	.byte	0x7
	.byte	0x1b
	.long	0x3ed
	.uleb128 0xd
	.ascii "ERR_NONE\0"
	.byte	0
	.uleb128 0xd
	.ascii "ERR_INV_NULL_POINTER\0"
	.byte	0x1
	.uleb128 0xd
	.ascii "ERR_INV_PRINTID\0"
	.byte	0x2
	.uleb128 0xd
	.ascii "ERR_INV_CNVCOD_RATE\0"
	.byte	0x3
	.uleb128 0xd
	.ascii "ERR_INV_CNVCOD_KLEN\0"
	.byte	0x4
	.uleb128 0xd
	.ascii "ERR_INV_BUFFER_SIZE\0"
	.byte	0x5
	.uleb128 0xd
	.ascii "ERR_INV_DYNAMIC_ALLOC\0"
	.byte	0x6
	.uleb128 0xd
	.ascii "ERR_INV_STREAM_TYPE\0"
	.byte	0x7
	.uleb128 0xd
	.ascii "ERR_NUM\0"
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.ascii "error_t\0"
	.byte	0x7
	.byte	0x26
	.long	0x332
	.uleb128 0x4
	.ascii "_byte_stream_t\0"
	.byte	0x8
	.byte	0x8
	.byte	0x1c
	.long	0x42d
	.uleb128 0x5
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x1e
	.long	0x42d
	.byte	0
	.uleb128 0x5
	.ascii "len\0"
	.byte	0x8
	.byte	0x1f
	.long	0x1bc
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x18f
	.uleb128 0x2
	.ascii "byte_stream_t\0"
	.byte	0x8
	.byte	0x20
	.long	0x3fc
	.uleb128 0xe
	.ascii "FreeByteStream\0"
	.byte	0x1
	.byte	0x97
	.long	0x3ed
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x489
	.uleb128 0xf
	.secrel32	LASF0
	.byte	0x1
	.byte	0x97
	.long	0x489
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.secrel32	LASF1
	.byte	0x1
	.byte	0x99
	.long	0x3ed
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x433
	.uleb128 0xe
	.ascii "AllocateByteStream\0"
	.byte	0x1
	.byte	0x77
	.long	0x3ed
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x4e2
	.uleb128 0xf
	.secrel32	LASF0
	.byte	0x1
	.byte	0x77
	.long	0x489
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "len\0"
	.byte	0x1
	.byte	0x77
	.long	0x1bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.secrel32	LASF1
	.byte	0x1
	.byte	0x79
	.long	0x3ed
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.ascii "Memory_FreeStream\0"
	.byte	0x1
	.byte	0x4e
	.long	0x3ed
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x543
	.uleb128 0xf
	.secrel32	LASF0
	.byte	0x1
	.byte	0x4e
	.long	0x543
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "size\0"
	.byte	0x1
	.byte	0x4e
	.long	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.secrel32	LASF1
	.byte	0x1
	.byte	0x50
	.long	0x3ed
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.secrel32	LASF2
	.byte	0x1
	.byte	0x51
	.long	0x489
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.uleb128 0x14
	.ascii "Memory_AllocateStream\0"
	.byte	0x1
	.byte	0x2a
	.long	0x3ed
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.secrel32	LASF0
	.byte	0x1
	.byte	0x2a
	.long	0x543
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "len\0"
	.byte	0x1
	.byte	0x2a
	.long	0x1bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.ascii "size\0"
	.byte	0x1
	.byte	0x2a
	.long	0x70
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x10
	.secrel32	LASF1
	.byte	0x1
	.byte	0x2c
	.long	0x3ed
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.secrel32	LASF2
	.byte	0x1
	.byte	0x2d
	.long	0x489
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
LASF1:
	.ascii "retErr\0"
LASF0:
	.ascii "ioStream\0"
LASF2:
	.ascii "tmpStream\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_calloc;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
