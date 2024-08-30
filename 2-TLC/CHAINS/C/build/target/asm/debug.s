	.file	"debug.c"
	.text
Ltext0:
	.globl	_Debug_GenerateRandomBytes
	.def	_Debug_GenerateRandomBytes;	.scl	2;	.type	32;	.endef
_Debug_GenerateRandomBytes:
LFB18:
	.file 1 "src/debug.c"
	.loc 1 43 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 45 0
	movl	$0, -16(%ebp)
	.loc 1 47 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 49 0
	cmpl	$0, 16(%ebp)
	jne	L3
	.loc 1 51 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	jmp	L4
L3:
	.loc 1 55 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_srand
L4:
	.loc 1 58 0
	movl	$0, -12(%ebp)
	jmp	L5
L6:
	.loc 1 60 0 discriminator 3
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	call	_rand
	movb	%al, (%ebx)
	.loc 1 58 0 discriminator 3
	addl	$1, -12(%ebp)
L5:
	.loc 1 58 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L6
	jmp	L7
L2:
	.loc 1 65 0 is_stmt 1
	movl	$1, -16(%ebp)
L7:
	.loc 1 68 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 69 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.section .rdata,"dr"
LC0:
	.ascii " * TX SOURCE BYTES (%d)\12\11\0"
LC1:
	.ascii " * RX SOURCE BYTES (%d)\12\11\0"
	.align 4
LC2:
	.ascii " * TX CONVOLUTIONAL CODED BYTES (%d)\12\11\0"
	.align 4
LC3:
	.ascii " * RX CONVOLUTIONAL CODED BYTES (%d)\12\11\0"
LC4:
	.ascii "%2X \0"
LC5:
	.ascii "\12\11\0"
	.text
	.globl	_Debug_PrintBytes
	.def	_Debug_PrintBytes;	.scl	2;	.type	32;	.endef
_Debug_PrintBytes:
LFB19:
	.loc 1 82 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 83 0
	movl	$0, -12(%ebp)
	.loc 1 85 0
	movl	16(%ebp), %eax
	cmpl	$1, %eax
	je	L11
	cmpl	$1, %eax
	jb	L12
	cmpl	$2, %eax
	je	L13
	cmpl	$3, %eax
	je	L14
	jmp	L20
L12:
	.loc 1 88 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	.loc 1 89 0
	jmp	L15
L11:
	.loc 1 92 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	.loc 1 93 0
	jmp	L15
L13:
	.loc 1 96 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	.loc 1 97 0
	jmp	L15
L14:
	.loc 1 100 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	.loc 1 101 0
	jmp	L15
L20:
	.loc 1 104 0
	movl	$2, -12(%ebp)
	.loc 1 105 0
	nop
L15:
	.loc 1 111 0
	movl	$0, -16(%ebp)
	jmp	L16
L18:
	.loc 1 113 0
	movl	8(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	.loc 1 114 0
	movl	-16(%ebp), %ecx
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
	jne	L17
	.loc 1 114 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L17
	.loc 1 116 0 is_stmt 1
	movl	$LC5, (%esp)
	call	_printf
L17:
	.loc 1 111 0 discriminator 2
	addl	$1, -16(%ebp)
L16:
	.loc 1 111 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L18
	.loc 1 119 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
	.loc 1 122 0
	movl	$10, (%esp)
	call	_putchar
	.loc 1 124 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 125 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC6:
	.ascii "\12 # PARAMETERS\0"
	.align 4
LC7:
	.ascii "\12    * Convolutional Coding : \0"
LC8:
	.ascii "      - Klen = %d\12\0"
LC9:
	.ascii "      - Rc = %d/%d\12\0"
LC10:
	.ascii "      - VDM = \0"
LC11:
	.ascii "Hard\0"
LC12:
	.ascii "\12    * Modulation : \0"
LC13:
	.ascii "\12\0"
	.text
	.globl	_Debug_PrintParameters
	.def	_Debug_PrintParameters;	.scl	2;	.type	32;	.endef
_Debug_PrintParameters:
LFB20:
	.loc 1 136 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 137 0
	movl	$0, -12(%ebp)
	.loc 1 139 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IsSrcLenValid
	testb	%al, %al
	je	L22
	.loc 1 141 0
	movl	$LC6, (%esp)
	call	_printf
	.loc 1 142 0
	movl	$LC7, (%esp)
	call	_puts
	.loc 1 143 0
	movl	$7, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	.loc 1 144 0
	movl	$3, 8(%esp)
	movl	$2, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	.loc 1 145 0
	movl	$LC10, (%esp)
	call	_printf
	.loc 1 148 0
	movl	$LC11, (%esp)
	call	_printf
	.loc 1 158 0
	movl	$LC12, (%esp)
	call	_puts
	.loc 1 167 0
	movl	$LC13, (%esp)
	call	_puts
	jmp	L23
L22:
	.loc 1 171 0
	movl	$5, -12(%ebp)
L23:
	.loc 1 174 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 175 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
	.align 4
LC14:
	.ascii " * Errors at convolutional encoding level: %u out of %u bits (MD = %u)\12\12\0"
	.align 4
LC15:
	.ascii " * Errors at source level: %u out of %u bits (MD = %u)\12\12\0"
	.text
	.globl	_Debug_CheckWrongBits
	.def	_Debug_CheckWrongBits;	.scl	2;	.type	32;	.endef
_Debug_CheckWrongBits:
LFB21:
	.loc 1 189 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	.loc 1 190 0
	movl	$0, -12(%ebp)
	.loc 1 191 0
	movl	$0, -16(%ebp)
	.loc 1 192 0
	movl	16(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 193 0
	movl	-32(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 194 0
	movl	$0, -24(%ebp)
	.loc 1 199 0
	cmpl	$0, 8(%ebp)
	je	L26
	.loc 1 199 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	je	L26
	.loc 1 201 0 is_stmt 1
	movl	$0, -28(%ebp)
	jmp	L27
L30:
	.loc 1 203 0
	movl	-28(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 204 0
	movl	-28(%ebp), %eax
	andl	$7, %eax
	movb	%al, -37(%ebp)
	.loc 1 205 0
	addl	$1, -24(%ebp)
	.loc 1 206 0
	movl	8(%ebp), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-37(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ebx
	movl	%eax, %ecx
	sarl	%cl, %ebx
	movl	12(%ebp), %edx
	movl	-36(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-37(%ebp), %eax
	movl	$7, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	xorl	%ebx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L28
	.loc 1 208 0
	addl	$1, -16(%ebp)
	.loc 1 209 0
	cmpl	$1, -16(%ebp)
	jbe	L29
	.loc 1 209 0 is_stmt 0 discriminator 1
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jnb	L29
	.loc 1 211 0 is_stmt 1
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
L29:
	.loc 1 213 0
	movl	$0, -24(%ebp)
L28:
	.loc 1 201 0 discriminator 2
	addl	$1, -28(%ebp)
L27:
	.loc 1 201 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L30
	.loc 1 216 0 is_stmt 1
	cmpl	$1, -16(%ebp)
	ja	L31
	.loc 1 218 0
	movl	$0, -20(%ebp)
L31:
	.loc 1 221 0
	movl	20(%ebp), %eax
	cmpl	$1, %eax
	jbe	L33
	cmpl	$3, %eax
	ja	L32
	.loc 1 225 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	.loc 1 226 0
	jmp	L35
L33:
	.loc 1 230 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_printf
	.loc 1 231 0
	jmp	L35
L32:
	.loc 1 234 0
	movl	$2, -12(%ebp)
	.loc 1 235 0
	nop
L35:
	.loc 1 237 0
	jmp	L36
L26:
	.loc 1 240 0
	movl	$1, -12(%ebp)
L36:
	.loc 1 243 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 244 0
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
LC16:
	.ascii "w\0"
LC17:
	.ascii "txSrcBytes.csv\0"
LC18:
	.ascii "rxSrcBytes.csv\0"
LC19:
	.ascii "%d\0"
	.text
	.globl	_Debug_WriteBytesToCsv
	.def	_Debug_WriteBytesToCsv;	.scl	2;	.type	32;	.endef
_Debug_WriteBytesToCsv:
LFB22:
	.loc 1 257 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 258 0
	movl	$0, -12(%ebp)
	.loc 1 259 0
	movl	$0, -16(%ebp)
	.loc 1 262 0
	cmpl	$0, 8(%ebp)
	je	L39
	.loc 1 264 0
	movl	16(%ebp), %eax
	testl	%eax, %eax
	je	L41
	cmpl	$1, %eax
	je	L42
	jmp	L50
L41:
	.loc 1 267 0
	movl	$LC16, 4(%esp)
	movl	$LC17, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 268 0
	jmp	L43
L42:
	.loc 1 271 0
	movl	$LC16, 4(%esp)
	movl	$LC18, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 272 0
	jmp	L43
L50:
	.loc 1 275 0
	movl	$2, -12(%ebp)
	.loc 1 276 0
	nop
L43:
	.loc 1 279 0
	cmpl	$0, -12(%ebp)
	jne	L48
	.loc 1 279 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L48
	.loc 1 281 0 is_stmt 1
	movl	$0, -20(%ebp)
	jmp	L45
L47:
	.loc 1 283 0
	movl	8(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$LC19, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 284 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L46
	.loc 1 286 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L46:
	.loc 1 281 0 discriminator 2
	addl	$1, -20(%ebp)
L45:
	.loc 1 281 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L47
	.loc 1 289 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	jmp	L48
L39:
	.loc 1 294 0
	movl	$1, -12(%ebp)
L48:
	.loc 1 297 0
	movl	-12(%ebp), %eax
	.loc 1 298 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_IsSrcLenValid;	.scl	3;	.type	32;	.endef
_IsSrcLenValid:
LFB23:
	.loc 1 314 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 315 0
	movb	$0, -1(%ebp)
	.loc 1 316 0
	movl	8(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -8(%ebp)
	.loc 1 318 0
	movl	-8(%ebp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	L52
	.loc 1 319 0 discriminator 1
	movl	-8(%ebp), %eax
	shrl	%eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	andl	$7, %eax
	.loc 1 318 0 discriminator 1
	testl	%eax, %eax
	jne	L52
	.loc 1 321 0
	movb	$1, -1(%ebp)
L52:
	.loc 1 326 0
	movzbl	-1(%ebp), %eax
	.loc 1 327 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/error.h"
	.file 7 "src/convolutional.h"
	.file 8 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x857
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\debug.c\0"
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
	.long	0x148
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x148
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xb2
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x148
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xb2
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xb2
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xb2
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xb2
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x148
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xb9
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xc1
	.uleb128 0x7
	.long	0x14e
	.long	0x165
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x15a
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x194
	.uleb128 0xa
	.long	0x180
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
	.long	0x6f
	.uleb128 0xa
	.long	0x1b2
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xb2
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x1fb
	.uleb128 0x5
	.byte	0x4
	.long	0x148
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xb2
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xb2
	.uleb128 0x7
	.long	0x148
	.long	0x231
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x226
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x4
	.byte	0xfa
	.long	0x6f
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x6f
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x6f
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x6f
	.uleb128 0xb
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb2
	.uleb128 0xb
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb2
	.uleb128 0xb
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x95
	.uleb128 0x7
	.long	0x148
	.long	0x2c7
	.uleb128 0xc
	.long	0x2c7
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
	.long	0x2b7
	.uleb128 0xb
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xb2
	.uleb128 0xb
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x95
	.uleb128 0xb
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2b7
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x2
	.byte	0xc
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x6
	.byte	0x1b
	.long	0x3ba
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
	.ascii "ERR_INV_BUFFER_SIZE\0"
	.byte	0x5
	.uleb128 0xe
	.ascii "ERR_NUM\0"
	.byte	0x6
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x6
	.byte	0x24
	.long	0x32d
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x7
	.byte	0x25
	.long	0x417
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
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x7
	.byte	0x35
	.long	0x488
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
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x7
	.byte	0x43
	.long	0x4c4
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
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x8
	.byte	0x26
	.long	0x515
	.uleb128 0xe
	.ascii "PID_TX_SRC\0"
	.byte	0
	.uleb128 0xe
	.ascii "PID_RX_SRC\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "PID_TX_CNVCOD\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "PID_RX_CNVCOD\0"
	.byte	0x3
	.uleb128 0xe
	.ascii "PID_NUM\0"
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.ascii "print_label_t\0"
	.byte	0x8
	.byte	0x2d
	.long	0x4c4
	.uleb128 0xf
	.ascii "IsSrcLenValid\0"
	.byte	0x1
	.word	0x139
	.long	0x581
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x581
	.uleb128 0x10
	.ascii "lenBy\0"
	.byte	0x1
	.word	0x139
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "bRet\0"
	.byte	0x1
	.word	0x13b
	.long	0x581
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x11
	.ascii "lenBi\0"
	.byte	0x1
	.word	0x13c
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x12
	.ascii "Debug_WriteBytesToCsv\0"
	.byte	0x1
	.word	0x100
	.long	0x3ba
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x611
	.uleb128 0x13
	.secrel32	LASF0
	.byte	0x1
	.word	0x100
	.long	0x611
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "len\0"
	.byte	0x1
	.word	0x100
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.ascii "label\0"
	.byte	0x1
	.word	0x100
	.long	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.secrel32	LASF1
	.byte	0x1
	.word	0x102
	.long	0x3ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii "fid\0"
	.byte	0x1
	.word	0x103
	.long	0x617
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.ascii "j\0"
	.byte	0x1
	.word	0x104
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x18f
	.uleb128 0x5
	.byte	0x4
	.long	0x14e
	.uleb128 0x15
	.ascii "Debug_CheckWrongBits\0"
	.byte	0x1
	.byte	0xbc
	.long	0x3ba
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x71e
	.uleb128 0x16
	.ascii "inBufferA\0"
	.byte	0x1
	.byte	0xbc
	.long	0x611
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "inBufferB\0"
	.byte	0x1
	.byte	0xbc
	.long	0x611
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.ascii "byteLen\0"
	.byte	0x1
	.byte	0xbc
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x16
	.ascii "label\0"
	.byte	0x1
	.byte	0xbc
	.long	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.byte	0xbe
	.long	0x3ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii "bitErrCnt\0"
	.byte	0x1
	.byte	0xbf
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.ascii "bitLen\0"
	.byte	0x1
	.byte	0xc0
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.ascii "minErrDist\0"
	.byte	0x1
	.byte	0xc1
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x18
	.ascii "curErrDist\0"
	.byte	0x1
	.byte	0xc2
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x18
	.ascii "j\0"
	.byte	0x1
	.byte	0xc3
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.ascii "byteIdx\0"
	.byte	0x1
	.byte	0xc4
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x18
	.ascii "bitIdx\0"
	.byte	0x1
	.byte	0xc5
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.byte	0
	.uleb128 0x15
	.ascii "Debug_PrintParameters\0"
	.byte	0x1
	.byte	0x87
	.long	0x3ba
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x766
	.uleb128 0x16
	.ascii "len\0"
	.byte	0x1
	.byte	0x87
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.byte	0x89
	.long	0x3ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.ascii "Debug_PrintBytes\0"
	.byte	0x1
	.byte	0x51
	.long	0x3ba
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x7d3
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0x51
	.long	0x611
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "len\0"
	.byte	0x1
	.byte	0x51
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.ascii "label\0"
	.byte	0x1
	.byte	0x51
	.long	0x515
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.byte	0x53
	.long	0x3ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii "j\0"
	.byte	0x1
	.byte	0x6d
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.ascii "Debug_GenerateRandomBytes\0"
	.byte	0x1
	.byte	0x2a
	.long	0x3ba
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x84e
	.uleb128 0x16
	.ascii "ioBuffer\0"
	.byte	0x1
	.byte	0x2a
	.long	0x84e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "len\0"
	.byte	0x1
	.byte	0x2a
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.ascii "pSeed\0"
	.byte	0x1
	.byte	0x2a
	.long	0x854
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x18
	.ascii "j\0"
	.byte	0x1
	.byte	0x2c
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.byte	0x2d
	.long	0x3ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x180
	.uleb128 0x5
	.byte	0x4
	.long	0x1c2
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
	.uleb128 0x2117
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.ascii "inBuffer\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_fputc;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
