	.file	"main.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB18:
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
	call	___main
	movl	%esp, %eax
	movl	%eax, %ebx
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
	call	_CheckParam
	call	_PrintParam
	leal	-410(%ebp), %eax
	movl	%eax, (%esp)
	call	_RandBytGen
	movl	$0, 8(%esp)
	movl	$100, 4(%esp)
	leal	-410(%ebp), %eax
	movl	%eax, (%esp)
	call	_PrintByt
	leal	-310(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-306(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetConvCP
	leal	-310(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-306(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-710(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-410(%ebp), %eax
	movl	%eax, (%esp)
	call	_ConvEncoder
	leal	-304(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetPskTable
	nop
	movl	-12(%ebp), %eax
	leal	-304(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	leal	-710(%ebp), %eax
	movl	%eax, (%esp)
	call	_Mapper
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_ChanAWGN
	leal	-268(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-306(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetTrellis
	movl	-12(%ebp), %eax
	leal	-304(%ebp), %edx
	movl	%edx, 8(%esp)
	leal	-910(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_HardDemapper
	movl	$3, 12(%esp)
	movl	$150, 8(%esp)
	leal	-910(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-710(%ebp), %eax
	movl	%eax, (%esp)
	call	_CheckWrongBits
	leal	-310(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-268(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-510(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-910(%ebp), %eax
	movl	%eax, (%esp)
	call	_HardConvDecoder
	movl	$1, 8(%esp)
	movl	$100, 4(%esp)
	leal	-510(%ebp), %eax
	movl	%eax, (%esp)
	call	_PrintByt
	movl	$1, 12(%esp)
	movl	$100, 8(%esp)
	leal	-510(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-410(%ebp), %eax
	movl	%eax, (%esp)
	call	_CheckWrongBits
	movl	$1, %eax
	movl	%ebx, %esp
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
