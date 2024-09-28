	.file	"memory.c"
	.text
Ltext0:
	.globl	_Memory_AllocateStream
	.def	_Memory_AllocateStream;	.scl	2;	.type	32;	.endef
_Memory_AllocateStream:
LFB18:
	.file 1 "src/memory.c"
	.loc 1 47 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 48 0
	movl	$0, -12(%ebp)
	.loc 1 53 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 55 0
	movl	16(%ebp), %eax
	cmpl	$1, %eax
	je	L4
	cmpl	$1, %eax
	jb	L5
	cmpl	$2, %eax
	je	L6
	jmp	L10
L5:
	.loc 1 58 0
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	.loc 1 59 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_AllocateByteStream
	.loc 1 60 0
	jmp	L8
L4:
	.loc 1 63 0
	movl	8(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 64 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_AllocateFloatStream
	.loc 1 65 0
	jmp	L8
L6:
	.loc 1 68 0
	movl	8(%ebp), %eax
	movl	%eax, -24(%ebp)
	.loc 1 69 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_AllocateComplexStream
	.loc 1 70 0
	jmp	L8
L10:
	.loc 1 73 0
	movl	$9, -12(%ebp)
	.loc 1 74 0
	nop
	jmp	L8
L2:
	.loc 1 79 0
	movl	$1, -12(%ebp)
L8:
	.loc 1 82 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 83 0
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
	.loc 1 95 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 96 0
	movl	$0, -12(%ebp)
	.loc 1 101 0
	cmpl	$0, 8(%ebp)
	je	L12
	.loc 1 103 0
	movl	12(%ebp), %eax
	cmpl	$1, %eax
	je	L14
	cmpl	$1, %eax
	jb	L15
	cmpl	$2, %eax
	je	L16
	jmp	L20
L15:
	.loc 1 106 0
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	.loc 1 107 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_FreeByteStream
	.loc 1 108 0
	jmp	L18
L14:
	.loc 1 111 0
	movl	8(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 112 0
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_FreeFloatStream
	.loc 1 113 0
	jmp	L18
L16:
	.loc 1 116 0
	movl	8(%ebp), %eax
	movl	%eax, -24(%ebp)
	.loc 1 117 0
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	_FreeComplexStream
	.loc 1 118 0
	jmp	L18
L20:
	.loc 1 121 0
	movl	$9, -12(%ebp)
	.loc 1 122 0
	nop
	jmp	L18
L12:
	.loc 1 127 0
	movl	$1, -12(%ebp)
L18:
	.loc 1 130 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 131 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.def	_AllocateByteStream;	.scl	3;	.type	32;	.endef
_AllocateByteStream:
LFB20:
	.loc 1 148 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 149 0
	movl	$0, -12(%ebp)
	.loc 1 151 0
	cmpl	$0, 8(%ebp)
	je	L22
	.loc 1 153 0
	movl	$1, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 154 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L23
	.loc 1 156 0
	movl	$8, -12(%ebp)
	jmp	L25
L23:
	.loc 1 160 0
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	jmp	L25
L22:
	.loc 1 165 0
	movl	$1, -12(%ebp)
L25:
	.loc 1 168 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 169 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.def	_AllocateFloatStream;	.scl	3;	.type	32;	.endef
_AllocateFloatStream:
LFB21:
	.loc 1 181 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 182 0
	movl	$0, -12(%ebp)
	.loc 1 184 0
	cmpl	$0, 8(%ebp)
	je	L28
	.loc 1 186 0
	movl	$4, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 187 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L29
	.loc 1 189 0
	movl	$8, -12(%ebp)
	jmp	L31
L29:
	.loc 1 193 0
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	jmp	L31
L28:
	.loc 1 198 0
	movl	$1, -12(%ebp)
L31:
	.loc 1 201 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 202 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.def	_AllocateComplexStream;	.scl	3;	.type	32;	.endef
_AllocateComplexStream:
LFB22:
	.loc 1 214 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 215 0
	movl	$0, -12(%ebp)
	.loc 1 217 0
	cmpl	$0, 8(%ebp)
	je	L34
	.loc 1 219 0
	movl	$8, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 220 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L35
	.loc 1 222 0
	movl	$8, -12(%ebp)
	jmp	L37
L35:
	.loc 1 226 0
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	jmp	L37
L34:
	.loc 1 231 0
	movl	$1, -12(%ebp)
L37:
	.loc 1 234 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 235 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_FreeByteStream;	.scl	3;	.type	32;	.endef
_FreeByteStream:
LFB23:
	.loc 1 246 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 247 0
	movl	$0, -12(%ebp)
	.loc 1 249 0
	cmpl	$0, 8(%ebp)
	je	L40
	.loc 1 249 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L40
	.loc 1 251 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	.loc 1 252 0
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	.loc 1 253 0
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	jmp	L41
L40:
	.loc 1 257 0
	movl	$1, -12(%ebp)
L41:
	.loc 1 260 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 261 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	_FreeFloatStream;	.scl	3;	.type	32;	.endef
_FreeFloatStream:
LFB24:
	.loc 1 272 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 273 0
	movl	$0, -12(%ebp)
	.loc 1 275 0
	cmpl	$0, 8(%ebp)
	je	L44
	.loc 1 275 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L44
	.loc 1 277 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	.loc 1 278 0
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	.loc 1 279 0
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	jmp	L45
L44:
	.loc 1 283 0
	movl	$1, -12(%ebp)
L45:
	.loc 1 286 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 287 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.def	_FreeComplexStream;	.scl	3;	.type	32;	.endef
_FreeComplexStream:
LFB25:
	.loc 1 298 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 299 0
	movl	$0, -12(%ebp)
	.loc 1 301 0
	cmpl	$0, 8(%ebp)
	je	L48
	.loc 1 301 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L48
	.loc 1 303 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	.loc 1 304 0
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	.loc 1 305 0
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	jmp	L49
L48:
	.loc 1 309 0
	movl	$1, -12(%ebp)
L49:
	.loc 1 312 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 313 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/system.h"
	.file 7 "src/error.h"
	.file 8 "src/memory.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x96c
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x190
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
	.long	0x1f2
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
	.long	0x228
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x21d
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
	.long	0x2be
	.uleb128 0xb
	.long	0x2be
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
	.long	0x2ae
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
	.long	0x2ae
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
	.byte	0x3a
	.long	0x34e
	.uleb128 0x4
	.ascii "re\0"
	.byte	0x6
	.byte	0x3c
	.long	0x34e
	.byte	0
	.uleb128 0x4
	.ascii "im\0"
	.byte	0x6
	.byte	0x3d
	.long	0x34e
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x6
	.ascii "complex_t\0"
	.byte	0x6
	.byte	0x3e
	.long	0x324
	.uleb128 0xc
	.byte	0x4
	.long	0x70
	.byte	0x7
	.byte	0x1b
	.long	0x50e
	.uleb128 0xd
	.ascii "ERR_NONE\0"
	.byte	0
	.uleb128 0xd
	.ascii "ERR_INV_NULL_POINTER\0"
	.byte	0x1
	.uleb128 0xd
	.ascii "ERR_INV_ORIG_LEN\0"
	.byte	0x2
	.uleb128 0xd
	.ascii "ERR_INV_PRINTID\0"
	.byte	0x3
	.uleb128 0xd
	.ascii "ERR_INV_CNVCOD_RATE\0"
	.byte	0x4
	.uleb128 0xd
	.ascii "ERR_INV_CNVCOD_KLEN\0"
	.byte	0x5
	.uleb128 0xd
	.ascii "ERR_INV_CNVCOD_DECMET\0"
	.byte	0x6
	.uleb128 0xd
	.ascii "ERR_INV_BUFFER_SIZE\0"
	.byte	0x7
	.uleb128 0xd
	.ascii "ERR_INV_DYNAMIC_ALLOC\0"
	.byte	0x8
	.uleb128 0xd
	.ascii "ERR_INV_STREAM_TYPE\0"
	.byte	0x9
	.uleb128 0xd
	.ascii "ERR_INV_MODULATION_TYPE\0"
	.byte	0xa
	.uleb128 0xd
	.ascii "ERR_INV_MODULATION_BPS\0"
	.byte	0xb
	.uleb128 0xd
	.ascii "ERR_INV_CHANNEL_TYPE\0"
	.byte	0xc
	.uleb128 0xd
	.ascii "ERR_INV_SCRAMBLING_TYPE\0"
	.byte	0xd
	.uleb128 0xd
	.ascii "ERR_INV_CRC_DEGREE\0"
	.byte	0xe
	.uleb128 0xd
	.ascii "ERR_INV_RS_GF_DEGREE\0"
	.byte	0xf
	.uleb128 0xd
	.ascii "ERR_INV_RS_MSG_CW_LEN\0"
	.byte	0x10
	.uleb128 0xd
	.ascii "ERR_INV_WATERMARK_LEV\0"
	.byte	0x11
	.uleb128 0xd
	.ascii "ERR_NUM\0"
	.byte	0x12
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x7
	.byte	0x30
	.long	0x368
	.uleb128 0xc
	.byte	0x4
	.long	0x70
	.byte	0x8
	.byte	0x1d
	.long	0x567
	.uleb128 0xd
	.ascii "memory_type_byte\0"
	.byte	0
	.uleb128 0xd
	.ascii "memory_type_float\0"
	.byte	0x1
	.uleb128 0xd
	.ascii "memory_type_complex\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "memory_type_t\0"
	.byte	0x8
	.byte	0x21
	.long	0x51d
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x24
	.long	0x5b8
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x26
	.long	0x5b8
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x27
	.long	0x1ae
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x28
	.long	0x567
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x181
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x8
	.byte	0x29
	.long	0x57c
	.uleb128 0x3
	.ascii "_float_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x2c
	.long	0x610
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x2e
	.long	0x610
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x2f
	.long	0x1ae
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x30
	.long	0x567
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x34e
	.uleb128 0x6
	.ascii "float_stream_t\0"
	.byte	0x8
	.byte	0x31
	.long	0x5d3
	.uleb128 0x3
	.ascii "_complex_stream_t\0"
	.byte	0xc
	.byte	0x8
	.byte	0x34
	.long	0x66b
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x8
	.byte	0x36
	.long	0x66b
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x8
	.byte	0x37
	.long	0x1ae
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x8
	.byte	0x38
	.long	0x567
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x357
	.uleb128 0x6
	.ascii "complex_stream_t\0"
	.byte	0x8
	.byte	0x39
	.long	0x62c
	.uleb128 0xe
	.ascii "FreeComplexStream\0"
	.byte	0x1
	.word	0x129
	.long	0x50e
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x6d0
	.uleb128 0xf
	.secrel32	LASF0
	.byte	0x1
	.word	0x129
	.long	0x6d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.secrel32	LASF1
	.byte	0x1
	.word	0x12b
	.long	0x50e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x671
	.uleb128 0xe
	.ascii "FreeFloatStream\0"
	.byte	0x1
	.word	0x10f
	.long	0x50e
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x71b
	.uleb128 0xf
	.secrel32	LASF0
	.byte	0x1
	.word	0x10f
	.long	0x71b
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.secrel32	LASF1
	.byte	0x1
	.word	0x111
	.long	0x50e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x616
	.uleb128 0x11
	.ascii "FreeByteStream\0"
	.byte	0x1
	.byte	0xf5
	.long	0x50e
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x762
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.byte	0xf5
	.long	0x762
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.secrel32	LASF1
	.byte	0x1
	.byte	0xf7
	.long	0x50e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5be
	.uleb128 0x11
	.ascii "AllocateComplexStream\0"
	.byte	0x1
	.byte	0xd5
	.long	0x50e
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x7be
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.byte	0xd5
	.long	0x6d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.ascii "len\0"
	.byte	0x1
	.byte	0xd5
	.long	0x1ae
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.secrel32	LASF1
	.byte	0x1
	.byte	0xd7
	.long	0x50e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x11
	.ascii "AllocateFloatStream\0"
	.byte	0x1
	.byte	0xb4
	.long	0x50e
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x812
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.byte	0xb4
	.long	0x71b
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.ascii "len\0"
	.byte	0x1
	.byte	0xb4
	.long	0x1ae
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.secrel32	LASF1
	.byte	0x1
	.byte	0xb6
	.long	0x50e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x11
	.ascii "AllocateByteStream\0"
	.byte	0x1
	.byte	0x93
	.long	0x50e
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x865
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.byte	0x93
	.long	0x762
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.ascii "len\0"
	.byte	0x1
	.byte	0x93
	.long	0x1ae
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.secrel32	LASF1
	.byte	0x1
	.byte	0x95
	.long	0x50e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.ascii "Memory_FreeStream\0"
	.byte	0x1
	.byte	0x5e
	.long	0x50e
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x8e2
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.byte	0x5e
	.long	0x8e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.ascii "type\0"
	.byte	0x1
	.byte	0x5e
	.long	0x567
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.secrel32	LASF1
	.byte	0x1
	.byte	0x60
	.long	0x50e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.secrel32	LASF2
	.byte	0x1
	.byte	0x61
	.long	0x762
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.secrel32	LASF3
	.byte	0x1
	.byte	0x62
	.long	0x71b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.secrel32	LASF4
	.byte	0x1
	.byte	0x63
	.long	0x6d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.uleb128 0x17
	.ascii "Memory_AllocateStream\0"
	.byte	0x1
	.byte	0x2e
	.long	0x50e
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.byte	0x2e
	.long	0x8e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.ascii "len\0"
	.byte	0x1
	.byte	0x2e
	.long	0x1ae
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.ascii "type\0"
	.byte	0x1
	.byte	0x2e
	.long	0x567
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x13
	.secrel32	LASF1
	.byte	0x1
	.byte	0x30
	.long	0x50e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.secrel32	LASF2
	.byte	0x1
	.byte	0x31
	.long	0x762
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.secrel32	LASF3
	.byte	0x1
	.byte	0x32
	.long	0x71b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.secrel32	LASF4
	.byte	0x1
	.byte	0x33
	.long	0x6d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
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
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x34
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
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
LASF2:
	.ascii "tmpByteStream\0"
LASF1:
	.ascii "retErr\0"
LASF3:
	.ascii "tmpFloatStream\0"
LASF4:
	.ascii "tmpComplexStream\0"
LASF0:
	.ascii "ioStream\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_calloc;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
