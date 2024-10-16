	.file	"scrambling.c"
	.text
Ltext0:
	.globl	_Scramb_ListParameters
	.def	_Scramb_ListParameters;	.scl	2;	.type	32;	.endef
_Scramb_ListParameters:
LFB18:
	.file 1 "src/scrambling.c"
	.loc 1 47 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 48 0
	movl	$0, 4(%esp)
	movl	$_Scramb_ListParameters, (%esp)
	call	_Debug_SetWatermark
	.loc 1 50 0
	movl	$0, -12(%ebp)
	.loc 1 52 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 54 0
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	.loc 1 56 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L3
	.loc 1 58 0
	movl	8(%ebp), %eax
	movb	$15, 4(%eax)
	.loc 1 59 0
	movl	8(%ebp), %eax
	movl	$393216, 8(%eax)
	.loc 1 60 0
	movl	8(%ebp), %eax
	movl	$-1795162112, 12(%eax)
	jmp	L6
L3:
	.loc 1 62 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L5
	.loc 1 64 0
	movl	8(%ebp), %eax
	movb	$17, 4(%eax)
	.loc 1 65 0
	movl	8(%ebp), %eax
	movl	$1081344, 8(%eax)
	.loc 1 66 0
	movl	8(%ebp), %eax
	movl	$741670912, 12(%eax)
	jmp	L6
L5:
	.loc 1 70 0
	movl	$13, -12(%ebp)
	jmp	L6
L2:
	.loc 1 75 0
	movl	$1, -12(%ebp)
L6:
	.loc 1 78 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 79 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_Scramb_Scrambler
	.def	_Scramb_Scrambler;	.scl	2;	.type	32;	.endef
_Scramb_Scrambler:
LFB19:
	.loc 1 92 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 93 0
	movl	$0, 4(%esp)
	movl	$_Scramb_Scrambler, (%esp)
	call	_Debug_SetWatermark
	.loc 1 95 0
	movl	$0, -12(%ebp)
	.loc 1 97 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L9
	.loc 1 98 0 discriminator 1
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	.loc 1 97 0 discriminator 1
	testb	%al, %al
	je	L9
	.loc 1 98 0
	cmpl	$0, 16(%ebp)
	je	L9
	.loc 1 101 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L11
	cmpl	$1, %eax
	je	L12
	jmp	L14
L11:
	.loc 1 104 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Scramb_AdditiveScrambler
	movl	%eax, -12(%ebp)
	.loc 1 105 0
	jmp	L9
L12:
	.loc 1 108 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Scramb_MultiplicativeScrambler
	movl	%eax, -12(%ebp)
	.loc 1 109 0
	jmp	L9
L14:
	.loc 1 112 0
	movl	$13, -12(%ebp)
	.loc 1 113 0
	nop
L9:
	.loc 1 117 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 118 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_Scramb_Descrambler
	.def	_Scramb_Descrambler;	.scl	2;	.type	32;	.endef
_Scramb_Descrambler:
LFB20:
	.loc 1 131 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 132 0
	movl	$0, 4(%esp)
	movl	$_Scramb_Descrambler, (%esp)
	call	_Debug_SetWatermark
	.loc 1 134 0
	movl	$0, -12(%ebp)
	.loc 1 136 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L16
	.loc 1 137 0 discriminator 1
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	.loc 1 136 0 discriminator 1
	testb	%al, %al
	je	L16
	.loc 1 137 0
	cmpl	$0, 16(%ebp)
	je	L16
	.loc 1 140 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L18
	cmpl	$1, %eax
	je	L19
	jmp	L21
L18:
	.loc 1 143 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Scramb_AdditiveDescrambler
	movl	%eax, -12(%ebp)
	.loc 1 144 0
	jmp	L16
L19:
	.loc 1 147 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Scramb_MultiplicativeDescrambler
	movl	%eax, -12(%ebp)
	.loc 1 148 0
	jmp	L16
L21:
	.loc 1 151 0
	movl	$13, -12(%ebp)
	.loc 1 152 0
	nop
L16:
	.loc 1 156 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 157 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.def	_Scramb_AdditiveScrambler;	.scl	3;	.type	32;	.endef
_Scramb_AdditiveScrambler:
LFB21:
	.loc 1 174 0
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
	.loc 1 175 0
	movl	$1, 4(%esp)
	movl	$_Scramb_AdditiveScrambler, (%esp)
	call	_Debug_SetWatermark
	.loc 1 177 0
	movl	$0, -12(%ebp)
	.loc 1 178 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -24(%ebp)
	.loc 1 181 0
	movl	16(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -20(%ebp)
	.loc 1 185 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L23
	.loc 1 186 0 discriminator 1
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	.loc 1 185 0 discriminator 1
	testb	%al, %al
	je	L23
	.loc 1 186 0
	cmpl	$0, 16(%ebp)
	je	L23
	.loc 1 189 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L24
	.loc 1 191 0
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
	.loc 1 193 0
	movl	$0, -16(%ebp)
	jmp	L25
L31:
	.loc 1 195 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 196 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 197 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_ComputeRegBit
	movb	%al, -30(%ebp)
	.loc 1 198 0
	shrl	-20(%ebp)
	.loc 1 200 0
	cmpb	$1, -30(%ebp)
	jne	L26
	.loc 1 202 0
	orl	$-2147483648, -20(%ebp)
	.loc 1 203 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-29(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movl	%eax, %edx
	movzbl	-30(%ebp), %eax
	xorl	%edx, %eax
	movb	%al, -30(%ebp)
	.loc 1 205 0
	cmpb	$0, -30(%ebp)
	je	L27
	.loc 1 207 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-29(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
	jmp	L29
L27:
	.loc 1 211 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-29(%ebp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	notl	%eax
	andl	%ebx, %eax
	movb	%al, (%edx)
	jmp	L29
L26:
	.loc 1 216 0
	andl	$2147483647, -20(%ebp)
	.loc 1 217 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-29(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movl	%eax, %edx
	movzbl	-30(%ebp), %eax
	xorl	%edx, %eax
	movb	%al, -30(%ebp)
	.loc 1 219 0
	cmpb	$0, -30(%ebp)
	je	L30
	.loc 1 221 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-29(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
	jmp	L29
L30:
	.loc 1 225 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-29(%ebp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	notl	%eax
	andl	%ebx, %eax
	movb	%al, (%edx)
L29:
	.loc 1 193 0 discriminator 2
	addl	$1, -16(%ebp)
L25:
	.loc 1 193 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jb	L31
	.loc 1 189 0 is_stmt 1
	jmp	L33
L24:
	.loc 1 232 0
	movl	$7, -12(%ebp)
	.loc 1 189 0
	jmp	L33
L23:
	.loc 1 237 0
	movl	$1, -12(%ebp)
L33:
	.loc 1 240 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 241 0
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
LFE21:
	.def	_Scramb_AdditiveDescrambler;	.scl	3;	.type	32;	.endef
_Scramb_AdditiveDescrambler:
LFB22:
	.loc 1 254 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 255 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Scramb_AdditiveScrambler
	.loc 1 256 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_Scramb_MultiplicativeScrambler;	.scl	3;	.type	32;	.endef
_Scramb_MultiplicativeScrambler:
LFB23:
	.loc 1 269 0
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
	.loc 1 270 0
	movl	$1, 4(%esp)
	movl	$_Scramb_MultiplicativeScrambler, (%esp)
	call	_Debug_SetWatermark
	.loc 1 272 0
	movl	$0, -12(%ebp)
	.loc 1 273 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -24(%ebp)
	.loc 1 276 0
	movl	16(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -20(%ebp)
	.loc 1 280 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L38
	.loc 1 281 0 discriminator 1
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	.loc 1 280 0 discriminator 1
	testb	%al, %al
	je	L38
	.loc 1 281 0
	cmpl	$0, 16(%ebp)
	je	L38
	.loc 1 284 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L39
	.loc 1 286 0
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
	.loc 1 288 0
	movl	$0, -16(%ebp)
	jmp	L40
L43:
	.loc 1 290 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 291 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 292 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-29(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movb	%al, -30(%ebp)
	.loc 1 293 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_ComputeRegBit
	xorb	-30(%ebp), %al
	movb	%al, -31(%ebp)
	.loc 1 294 0
	shrl	-20(%ebp)
	.loc 1 296 0
	cmpb	$1, -31(%ebp)
	jne	L41
	.loc 1 298 0
	orl	$-2147483648, -20(%ebp)
	.loc 1 299 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-29(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
	jmp	L42
L41:
	.loc 1 303 0
	andl	$2147483647, -20(%ebp)
	.loc 1 304 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-29(%ebp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	notl	%eax
	andl	%ebx, %eax
	movb	%al, (%edx)
L42:
	.loc 1 288 0 discriminator 2
	addl	$1, -16(%ebp)
L40:
	.loc 1 288 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jb	L43
	.loc 1 284 0 is_stmt 1
	jmp	L45
L39:
	.loc 1 310 0
	movl	$7, -12(%ebp)
	.loc 1 284 0
	jmp	L45
L38:
	.loc 1 315 0
	movl	$1, -12(%ebp)
L45:
	.loc 1 318 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 319 0
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
LFE23:
	.def	_Scramb_MultiplicativeDescrambler;	.scl	3;	.type	32;	.endef
_Scramb_MultiplicativeDescrambler:
LFB24:
	.loc 1 332 0
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
	.loc 1 333 0
	movl	$1, 4(%esp)
	movl	$_Scramb_MultiplicativeDescrambler, (%esp)
	call	_Debug_SetWatermark
	.loc 1 335 0
	movl	$0, -12(%ebp)
	.loc 1 336 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	movl	%eax, -24(%ebp)
	.loc 1 339 0
	movl	16(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -20(%ebp)
	.loc 1 343 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L48
	.loc 1 344 0 discriminator 1
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	.loc 1 343 0 discriminator 1
	testb	%al, %al
	je	L48
	.loc 1 344 0
	cmpl	$0, 16(%ebp)
	je	L48
	.loc 1 347 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L49
	.loc 1 349 0
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
	.loc 1 351 0
	movl	$0, -16(%ebp)
	jmp	L50
L55:
	.loc 1 353 0
	movl	-16(%ebp), %eax
	shrl	$3, %eax
	movl	%eax, -28(%ebp)
	.loc 1 354 0
	movl	-16(%ebp), %eax
	notl	%eax
	andl	$7, %eax
	movb	%al, -29(%ebp)
	.loc 1 355 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movzbl	-29(%ebp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	movb	%al, -30(%ebp)
	.loc 1 356 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_ComputeRegBit
	xorb	-30(%ebp), %al
	movb	%al, -31(%ebp)
	.loc 1 357 0
	shrl	-20(%ebp)
	.loc 1 359 0
	cmpb	$1, -31(%ebp)
	jne	L51
	.loc 1 361 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %esi
	movzbl	-29(%ebp), %eax
	movl	$1, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	%ebx, %eax
	orl	%esi, %eax
	movb	%al, (%edx)
	jmp	L52
L51:
	.loc 1 365 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-28(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movl	%eax, %ebx
	movzbl	-29(%ebp), %eax
	movl	$1, %esi
	movl	%eax, %ecx
	sall	%cl, %esi
	movl	%esi, %eax
	notl	%eax
	andl	%ebx, %eax
	movb	%al, (%edx)
L52:
	.loc 1 368 0
	cmpb	$1, -30(%ebp)
	jne	L53
	.loc 1 370 0
	orl	$-2147483648, -20(%ebp)
	jmp	L54
L53:
	.loc 1 374 0
	andl	$2147483647, -20(%ebp)
L54:
	.loc 1 351 0 discriminator 2
	addl	$1, -16(%ebp)
L50:
	.loc 1 351 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jb	L55
	.loc 1 347 0 is_stmt 1
	jmp	L57
L49:
	.loc 1 380 0
	movl	$7, -12(%ebp)
	.loc 1 347 0
	jmp	L57
L48:
	.loc 1 385 0
	movl	$1, -12(%ebp)
L57:
	.loc 1 388 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 389 0
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
LFE24:
	.def	_ComputeRegBit;	.scl	3;	.type	32;	.endef
_ComputeRegBit:
LFB25:
	.loc 1 400 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 401 0
	movl	$2, 4(%esp)
	movl	$_ComputeRegBit, (%esp)
	call	_Debug_SetWatermark
	.loc 1 404 0
	movb	$0, -10(%ebp)
	.loc 1 406 0
	movb	$0, -9(%ebp)
	jmp	L60
L62:
	.loc 1 408 0
	movzbl	-9(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, %ebx
	movl	%eax, %ecx
	sall	%cl, %ebx
	movl	12(%ebp), %eax
	movl	8(%eax), %edx
	movzbl	-9(%ebp), %eax
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	andl	%ebx, %eax
	testl	%eax, %eax
	jns	L61
	.loc 1 410 0
	xorb	$1, -10(%ebp)
L61:
	.loc 1 406 0 discriminator 2
	movzbl	-9(%ebp), %eax
	addl	$1, %eax
	movb	%al, -9(%ebp)
L60:
	.loc 1 406 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %eax
	movzbl	4(%eax), %eax
	cmpb	-9(%ebp), %al
	ja	L62
	.loc 1 414 0 is_stmt 1
	movzbl	-10(%ebp), %eax
	.loc 1 415 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
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
	.file 6 "src/error.h"
	.file 7 "src/memory.h"
	.file 8 "src/scrambling.h"
	.file 9 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xb22
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\scrambling.c\0"
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
	.long	0x14d
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x14d
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xb7
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x14d
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xb7
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xb7
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xb7
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xb7
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x14d
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xbe
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xc6
	.uleb128 0x7
	.long	0x153
	.long	0x16a
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x15f
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x194
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
	.long	0x74
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
	.long	0xb7
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x1fb
	.uleb128 0x5
	.byte	0x4
	.long	0x14d
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xb7
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xb7
	.uleb128 0x7
	.long	0x14d
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
	.long	0x74
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x74
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x74
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x74
	.uleb128 0xb
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb7
	.uleb128 0xb
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb7
	.uleb128 0xb
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x9a
	.uleb128 0x7
	.long	0x14d
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
	.long	0xb7
	.uleb128 0xb
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x9a
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0xd
	.byte	0x4
	.long	0x74
	.byte	0x6
	.byte	0x1c
	.long	0x509
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
	.byte	0x33
	.long	0x336
	.uleb128 0xd
	.byte	0x4
	.long	0x74
	.byte	0x7
	.byte	0x1d
	.long	0x562
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
	.long	0x518
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x24
	.long	0x5b3
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x26
	.long	0x5b3
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x27
	.long	0x1b2
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x28
	.long	0x562
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x185
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x29
	.long	0x577
	.uleb128 0xa
	.long	0x5b9
	.uleb128 0xd
	.byte	0x4
	.long	0x74
	.byte	0x8
	.byte	0x1f
	.long	0x607
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
	.byte	0x8
	.byte	0x24
	.long	0x5d3
	.uleb128 0x3
	.ascii "_scr_par_t\0"
	.byte	0x10
	.byte	0x8
	.byte	0x27
	.long	0x66b
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x8
	.byte	0x29
	.long	0x607
	.byte	0
	.uleb128 0x4
	.ascii "nCells\0"
	.byte	0x8
	.byte	0x2a
	.long	0x185
	.byte	0x4
	.uleb128 0x4
	.ascii "conVect\0"
	.byte	0x8
	.byte	0x2b
	.long	0x1b2
	.byte	0x8
	.uleb128 0x4
	.ascii "initSt\0"
	.byte	0x8
	.byte	0x2c
	.long	0x1b2
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.ascii "scr_par_t\0"
	.byte	0x8
	.byte	0x2d
	.long	0x61c
	.uleb128 0xa
	.long	0x66b
	.uleb128 0xf
	.ascii "_wm_level_t\0"
	.byte	0x4
	.long	0x74
	.byte	0x9
	.byte	0x55
	.long	0x6d0
	.uleb128 0xe
	.ascii "WM_LEVEL_1\0"
	.byte	0
	.uleb128 0xe
	.ascii "WM_LEVEL_2\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "WM_LEVEL_3\0"
	.byte	0x2
	.uleb128 0xe
	.ascii "WM_LEVEL_NUM\0"
	.byte	0x3
	.byte	0
	.uleb128 0x10
	.ascii "ComputeRegBit\0"
	.byte	0x1
	.word	0x18f
	.long	0x185
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x731
	.uleb128 0x11
	.ascii "curSt\0"
	.byte	0x1
	.word	0x18f
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.word	0x18f
	.long	0x731
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.word	0x193
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x14
	.secrel32	LASF1
	.byte	0x1
	.word	0x194
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x67c
	.uleb128 0x10
	.ascii "Scramb_MultiplicativeDescrambler\0"
	.byte	0x1
	.word	0x14b
	.long	0x509
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x814
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x14b
	.long	0x814
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF3
	.byte	0x1
	.word	0x14b
	.long	0x81a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.word	0x14b
	.long	0x731
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.secrel32	LASF4
	.byte	0x1
	.word	0x14f
	.long	0x509
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.secrel32	LASF5
	.byte	0x1
	.word	0x150
	.long	0x1c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.secrel32	LASF6
	.byte	0x1
	.word	0x151
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.word	0x152
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.secrel32	LASF7
	.byte	0x1
	.word	0x153
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.ascii "inBit\0"
	.byte	0x1
	.word	0x154
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -38
	.uleb128 0x14
	.secrel32	LASF1
	.byte	0x1
	.word	0x154
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -39
	.uleb128 0x14
	.secrel32	LASF8
	.byte	0x1
	.word	0x155
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5ce
	.uleb128 0x5
	.byte	0x4
	.long	0x5b9
	.uleb128 0x10
	.ascii "Scramb_MultiplicativeScrambler\0"
	.byte	0x1
	.word	0x10c
	.long	0x509
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x8fb
	.uleb128 0x12
	.secrel32	LASF2
	.byte	0x1
	.word	0x10c
	.long	0x814
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.secrel32	LASF3
	.byte	0x1
	.word	0x10c
	.long	0x81a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.secrel32	LASF0
	.byte	0x1
	.word	0x10c
	.long	0x731
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.secrel32	LASF4
	.byte	0x1
	.word	0x110
	.long	0x509
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.secrel32	LASF5
	.byte	0x1
	.word	0x111
	.long	0x1c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.secrel32	LASF6
	.byte	0x1
	.word	0x112
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x13
	.ascii "j\0"
	.byte	0x1
	.word	0x113
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.secrel32	LASF7
	.byte	0x1
	.word	0x114
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.ascii "inBit\0"
	.byte	0x1
	.word	0x115
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -38
	.uleb128 0x14
	.secrel32	LASF1
	.byte	0x1
	.word	0x115
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -39
	.uleb128 0x14
	.secrel32	LASF8
	.byte	0x1
	.word	0x116
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.byte	0
	.uleb128 0x15
	.ascii "Scramb_AdditiveDescrambler\0"
	.byte	0x1
	.byte	0xfd
	.long	0x509
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x956
	.uleb128 0x16
	.secrel32	LASF2
	.byte	0x1
	.byte	0xfd
	.long	0x814
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF3
	.byte	0x1
	.byte	0xfd
	.long	0x81a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.byte	0xfd
	.long	0x731
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x15
	.ascii "Scramb_AdditiveScrambler\0"
	.byte	0x1
	.byte	0xad
	.long	0x509
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xa12
	.uleb128 0x16
	.secrel32	LASF2
	.byte	0x1
	.byte	0xad
	.long	0x814
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF3
	.byte	0x1
	.byte	0xad
	.long	0x81a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.byte	0xad
	.long	0x731
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF4
	.byte	0x1
	.byte	0xb1
	.long	0x509
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.secrel32	LASF5
	.byte	0x1
	.byte	0xb2
	.long	0x1c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.secrel32	LASF6
	.byte	0x1
	.byte	0xb3
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.ascii "j\0"
	.byte	0x1
	.byte	0xb4
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.secrel32	LASF7
	.byte	0x1
	.byte	0xb5
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x18
	.ascii "scrBit\0"
	.byte	0x1
	.byte	0xb6
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -38
	.uleb128 0x17
	.secrel32	LASF8
	.byte	0x1
	.byte	0xb7
	.long	0x185
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.byte	0
	.uleb128 0x19
	.ascii "Scramb_Descrambler\0"
	.byte	0x1
	.byte	0x82
	.long	0x509
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xa73
	.uleb128 0x16
	.secrel32	LASF2
	.byte	0x1
	.byte	0x82
	.long	0x814
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF3
	.byte	0x1
	.byte	0x82
	.long	0x81a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.byte	0x82
	.long	0x731
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF4
	.byte	0x1
	.byte	0x86
	.long	0x509
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.ascii "Scramb_Scrambler\0"
	.byte	0x1
	.byte	0x5b
	.long	0x509
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xad2
	.uleb128 0x16
	.secrel32	LASF2
	.byte	0x1
	.byte	0x5b
	.long	0x814
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.secrel32	LASF3
	.byte	0x1
	.byte	0x5b
	.long	0x81a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.secrel32	LASF0
	.byte	0x1
	.byte	0x5b
	.long	0x731
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.secrel32	LASF4
	.byte	0x1
	.byte	0x5f
	.long	0x509
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.ascii "Scramb_ListParameters\0"
	.byte	0x1
	.byte	0x2e
	.long	0x509
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xb1f
	.uleb128 0x1a
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x2e
	.long	0xb1f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.secrel32	LASF4
	.byte	0x1
	.byte	0x32
	.long	0x509
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x66b
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x1a
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
	.ascii "outBit\0"
LASF8:
	.ascii "bitIdx\0"
LASF0:
	.ascii "pParams\0"
LASF6:
	.ascii "byteIdx\0"
LASF5:
	.ascii "bitLen\0"
LASF3:
	.ascii "outStream\0"
LASF7:
	.ascii "lfsrSt\0"
LASF2:
	.ascii "inStream\0"
LASF4:
	.ascii "retErr\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Debug_SetWatermark;	.scl	2;	.type	32;	.endef
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_Memory_IsStreamValid;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
