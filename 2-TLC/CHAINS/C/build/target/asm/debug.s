	.file	"debug.c"
	.text
Ltext0:
	.globl	_Debug_GenerateRandomBytes
	.def	_Debug_GenerateRandomBytes;	.scl	2;	.type	32;	.endef
_Debug_GenerateRandomBytes:
LFB18:
	.file 1 "src/debug.c"
	.loc 1 42 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 44 0
	movl	$0, -16(%ebp)
	.loc 1 46 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 46 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L2
	.loc 1 48 0 is_stmt 1
	cmpl	$0, 12(%ebp)
	jne	L3
	.loc 1 50 0
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	jmp	L4
L3:
	.loc 1 54 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_srand
L4:
	.loc 1 57 0
	movl	$0, -12(%ebp)
	jmp	L5
L6:
	.loc 1 59 0 discriminator 3
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	call	_rand
	movb	%al, (%ebx)
	.loc 1 57 0 discriminator 3
	addl	$1, -12(%ebp)
L5:
	.loc 1 57 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	L6
	.loc 1 46 0 is_stmt 1
	jmp	L7
L2:
	.loc 1 64 0
	movl	$1, -16(%ebp)
L7:
	.loc 1 67 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 68 0
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
	.loc 1 81 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 82 0
	movl	$0, -12(%ebp)
	.loc 1 84 0
	cmpl	$0, 8(%ebp)
	je	L10
	.loc 1 84 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L10
LBB2:
	.loc 1 86 0 is_stmt 1
	movl	12(%ebp), %eax
	cmpl	$1, %eax
	je	L12
	cmpl	$1, %eax
	jb	L13
	cmpl	$2, %eax
	je	L14
	cmpl	$3, %eax
	je	L15
	jmp	L22
L13:
	.loc 1 89 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	.loc 1 90 0
	jmp	L16
L12:
	.loc 1 93 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	.loc 1 94 0
	jmp	L16
L14:
	.loc 1 97 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	.loc 1 98 0
	jmp	L16
L15:
	.loc 1 101 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	.loc 1 102 0
	jmp	L16
L22:
	.loc 1 105 0
	movl	$2, -12(%ebp)
	.loc 1 106 0
	nop
L16:
	.loc 1 112 0
	movl	$0, -16(%ebp)
	jmp	L17
L19:
	.loc 1 114 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	.loc 1 115 0
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
	jne	L18
	.loc 1 115 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-16(%ebp), %eax
	jbe	L18
	.loc 1 117 0 is_stmt 1
	movl	$LC5, (%esp)
	call	_printf
L18:
	.loc 1 112 0 discriminator 2
	addl	$1, -16(%ebp)
L17:
	.loc 1 112 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	ja	L19
	.loc 1 120 0 is_stmt 1
	movl	$10, (%esp)
	call	_putchar
	.loc 1 123 0
	movl	$10, (%esp)
	call	_putchar
LBE2:
	.loc 1 85 0
	jmp	L20
L10:
	.loc 1 127 0
	movl	$1, -12(%ebp)
L20:
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
	.loc 1 142 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 143 0
	movl	$0, -12(%ebp)
	.loc 1 145 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_IsSrcLenValid
	testb	%al, %al
	je	L24
	.loc 1 147 0
	movl	$LC6, (%esp)
	call	_printf
	.loc 1 148 0
	movl	$LC7, (%esp)
	call	_puts
	.loc 1 149 0
	movl	$7, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	.loc 1 150 0
	movl	$3, 8(%esp)
	movl	$2, 4(%esp)
	movl	$LC9, (%esp)
	call	_printf
	.loc 1 151 0
	movl	$LC10, (%esp)
	call	_printf
	.loc 1 154 0
	movl	$LC11, (%esp)
	call	_printf
	.loc 1 164 0
	movl	$LC12, (%esp)
	call	_puts
	.loc 1 173 0
	movl	$LC13, (%esp)
	call	_puts
	jmp	L25
L24:
	.loc 1 177 0
	movl	$5, -12(%ebp)
L25:
	.loc 1 180 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 181 0
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
	.loc 1 194 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	.loc 1 195 0
	movl	$0, -12(%ebp)
	.loc 1 196 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -32(%ebp)
	.loc 1 197 0
	movl	$0, -16(%ebp)
	.loc 1 198 0
	movl	-32(%ebp), %eax
	movl	%eax, -20(%ebp)
	.loc 1 199 0
	movl	$0, -24(%ebp)
	.loc 1 204 0
	cmpl	$0, 8(%ebp)
	je	L28
	.loc 1 204 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L28
	.loc 1 204 0 discriminator 2
	cmpl	$0, 12(%ebp)
	je	L28
	.loc 1 204 0 discriminator 3
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L28
	.loc 1 206 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L29
	.loc 1 208 0
	movl	$0, -28(%ebp)
	jmp	L30
L33:
	.loc 1 210 0
	movl	-28(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -36(%ebp)
	.loc 1 211 0
	movl	-28(%ebp), %eax
	andl	$7, %eax
	movb	%al, -37(%ebp)
	.loc 1 212 0
	addl	$1, -24(%ebp)
	.loc 1 213 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
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
	.loc 1 214 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
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
	.loc 1 213 0
	xorl	%ebx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L31
	.loc 1 216 0
	addl	$1, -16(%ebp)
	.loc 1 217 0
	cmpl	$1, -16(%ebp)
	jbe	L32
	.loc 1 217 0 is_stmt 0 discriminator 1
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jnb	L32
	.loc 1 219 0 is_stmt 1
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
L32:
	.loc 1 221 0
	movl	$0, -24(%ebp)
L31:
	.loc 1 208 0 discriminator 2
	addl	$1, -28(%ebp)
L30:
	.loc 1 208 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jb	L33
	.loc 1 224 0 is_stmt 1
	cmpl	$1, -16(%ebp)
	ja	L34
	.loc 1 226 0
	movl	$0, -20(%ebp)
L34:
	.loc 1 229 0
	movl	16(%ebp), %eax
	cmpl	$1, %eax
	jbe	L36
	cmpl	$3, %eax
	ja	L35
	.loc 1 233 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC14, (%esp)
	call	_printf
	.loc 1 234 0
	jmp	L39
L36:
	.loc 1 238 0
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC15, (%esp)
	call	_printf
	.loc 1 239 0
	jmp	L39
L35:
	.loc 1 242 0
	movl	$2, -12(%ebp)
	.loc 1 243 0
	nop
	jmp	L39
L29:
	.loc 1 248 0
	movl	$5, -12(%ebp)
	.loc 1 206 0
	jmp	L40
L39:
	.loc 1 206 0 is_stmt 0 discriminator 1
	jmp	L40
L28:
	.loc 1 253 0 is_stmt 1
	movl	$1, -12(%ebp)
L40:
	.loc 1 256 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 257 0
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
	.loc 1 269 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 270 0
	movl	$0, -12(%ebp)
	.loc 1 271 0
	movl	$0, -16(%ebp)
	.loc 1 274 0
	cmpl	$0, 8(%ebp)
	je	L43
	.loc 1 274 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L43
	.loc 1 276 0 is_stmt 1
	movl	12(%ebp), %eax
	testl	%eax, %eax
	je	L45
	cmpl	$1, %eax
	je	L46
	jmp	L54
L45:
	.loc 1 279 0
	movl	$LC16, 4(%esp)
	movl	$LC17, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 280 0
	jmp	L47
L46:
	.loc 1 283 0
	movl	$LC16, 4(%esp)
	movl	$LC18, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	.loc 1 284 0
	jmp	L47
L54:
	.loc 1 287 0
	movl	$2, -12(%ebp)
	.loc 1 288 0
	nop
L47:
	.loc 1 291 0
	cmpl	$0, -12(%ebp)
	jne	L55
	.loc 1 291 0 is_stmt 0 discriminator 1
	cmpl	$0, -16(%ebp)
	je	L55
	.loc 1 293 0 is_stmt 1
	movl	$0, -20(%ebp)
	jmp	L49
L51:
	.loc 1 295 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$LC19, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fprintf
	.loc 1 296 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	jbe	L50
	.loc 1 298 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$44, (%esp)
	call	_fputc
L50:
	.loc 1 293 0 discriminator 2
	addl	$1, -20(%ebp)
L49:
	.loc 1 293 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	ja	L51
	.loc 1 301 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	.loc 1 291 0
	jmp	L55
L43:
	.loc 1 306 0
	movl	$1, -12(%ebp)
	jmp	L52
L55:
	.loc 1 291 0
	nop
L52:
	.loc 1 309 0
	movl	-12(%ebp), %eax
	.loc 1 310 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_IsSrcLenValid;	.scl	3;	.type	32;	.endef
_IsSrcLenValid:
LFB23:
	.loc 1 326 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 327 0
	movb	$0, -1(%ebp)
	.loc 1 328 0
	movl	8(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -8(%ebp)
	.loc 1 330 0
	movl	-8(%ebp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	L57
	.loc 1 331 0 discriminator 1
	movl	-8(%ebp), %eax
	shrl	%eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	andl	$7, %eax
	.loc 1 330 0 discriminator 1
	testl	%eax, %eax
	jne	L57
	.loc 1 333 0
	movb	$1, -1(%ebp)
L57:
	.loc 1 336 0
	movzbl	-1(%ebp), %eax
	.loc 1 337 0
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
	.file 7 "src/memory.h"
	.file 8 "src/convolutional.h"
	.file 9 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x888
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
	.long	0x18f
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
	.long	0x1ad
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
	.long	0x1f6
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
	.long	0x22c
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x221
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
	.long	0x2c2
	.uleb128 0xc
	.long	0x2c2
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
	.long	0x2b2
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
	.long	0x2b2
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
	.long	0x3cd
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
	.ascii "ERR_INV_DYNAMIC_ALLOC\0"
	.byte	0x6
	.uleb128 0xe
	.ascii "ERR_NUM\0"
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.ascii "error_t\0"
	.byte	0x6
	.byte	0x25
	.long	0x328
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0x8
	.byte	0x7
	.byte	0x1c
	.long	0x40d
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x1e
	.long	0x40d
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x1f
	.long	0x1ad
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x180
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x20
	.long	0x3dc
	.uleb128 0xa
	.long	0x413
	.uleb128 0xd
	.byte	0x4
	.long	0x6f
	.byte	0x8
	.byte	0x26
	.long	0x47b
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
	.byte	0x8
	.byte	0x36
	.long	0x4ec
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
	.byte	0x8
	.byte	0x44
	.long	0x528
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
	.byte	0x9
	.byte	0x27
	.long	0x579
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
	.byte	0x9
	.byte	0x2e
	.long	0x528
	.uleb128 0xf
	.ascii "IsSrcLenValid\0"
	.byte	0x1
	.word	0x145
	.long	0x5e5
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x5e5
	.uleb128 0x10
	.ascii "lenBy\0"
	.byte	0x1
	.word	0x145
	.long	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.ascii "bRet\0"
	.byte	0x1
	.word	0x147
	.long	0x5e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x11
	.ascii "lenBi\0"
	.byte	0x1
	.word	0x148
	.long	0x1ad
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
	.word	0x10c
	.long	0x3cd
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x666
	.uleb128 0x13
	.secrel32	LASF0
	.byte	0x1
	.word	0x10c
	.long	0x666
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "label\0"
	.byte	0x1
	.word	0x10c
	.long	0x579
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.secrel32	LASF1
	.byte	0x1
	.word	0x10e
	.long	0x3cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii "fid\0"
	.byte	0x1
	.word	0x10f
	.long	0x66c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.ascii "j\0"
	.byte	0x1
	.word	0x110
	.long	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x428
	.uleb128 0x5
	.byte	0x4
	.long	0x14e
	.uleb128 0x15
	.ascii "Debug_CheckWrongBits\0"
	.byte	0x1
	.byte	0xc1
	.long	0x3cd
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x761
	.uleb128 0x16
	.ascii "inStreamA\0"
	.byte	0x1
	.byte	0xc1
	.long	0x666
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "inStreamB\0"
	.byte	0x1
	.byte	0xc1
	.long	0x666
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.ascii "label\0"
	.byte	0x1
	.byte	0xc1
	.long	0x579
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.byte	0xc3
	.long	0x3cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii "bitLen\0"
	.byte	0x1
	.byte	0xc4
	.long	0x1bd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.ascii "bitErrCnt\0"
	.byte	0x1
	.byte	0xc5
	.long	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.ascii "minErrDist\0"
	.byte	0x1
	.byte	0xc6
	.long	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x18
	.ascii "curErrDist\0"
	.byte	0x1
	.byte	0xc7
	.long	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x18
	.ascii "j\0"
	.byte	0x1
	.byte	0xc8
	.long	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.ascii "byteIdx\0"
	.byte	0x1
	.byte	0xc9
	.long	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x18
	.ascii "bitIdx\0"
	.byte	0x1
	.byte	0xca
	.long	0x180
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.byte	0
	.uleb128 0x15
	.ascii "Debug_PrintParameters\0"
	.byte	0x1
	.byte	0x8d
	.long	0x3cd
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x7a9
	.uleb128 0x16
	.ascii "len\0"
	.byte	0x1
	.byte	0x8d
	.long	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.byte	0x8f
	.long	0x3cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.ascii "Debug_PrintBytes\0"
	.byte	0x1
	.byte	0x50
	.long	0x3cd
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x812
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0x50
	.long	0x666
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "label\0"
	.byte	0x1
	.byte	0x50
	.long	0x579
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.byte	0x52
	.long	0x3cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.long	LBB2
	.long	LBE2-LBB2
	.uleb128 0x18
	.ascii "j\0"
	.byte	0x1
	.byte	0x6e
	.long	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x15
	.ascii "Debug_GenerateRandomBytes\0"
	.byte	0x1
	.byte	0x29
	.long	0x3cd
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x87f
	.uleb128 0x16
	.ascii "ioStream\0"
	.byte	0x1
	.byte	0x29
	.long	0x87f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.ascii "pSeed\0"
	.byte	0x1
	.byte	0x29
	.long	0x885
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.ascii "j\0"
	.byte	0x1
	.byte	0x2b
	.long	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.secrel32	LASF1
	.byte	0x1
	.byte	0x2c
	.long	0x3cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x413
	.uleb128 0x5
	.byte	0x4
	.long	0x1bd
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
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.ascii "inStream\0"
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
