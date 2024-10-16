	.file	"interleaving.c"
	.text
Ltext0:
	.globl	_Intrlv_ListParameters
	.def	_Intrlv_ListParameters;	.scl	2;	.type	32;	.endef
_Intrlv_ListParameters:
LFB18:
	.file 1 "src/interleaving.c"
	.loc 1 46 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 47 0
	movl	$0, 4(%esp)
	movl	$_Intrlv_ListParameters, (%esp)
	call	_Debug_SetWatermark
	.loc 1 49 0
	movl	$0, -12(%ebp)
	.loc 1 51 0
	cmpl	$0, 8(%ebp)
	je	L2
	.loc 1 53 0
	movl	8(%ebp), %eax
	movl	$1, (%eax)
	.loc 1 55 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L3
	.loc 1 57 0
	movl	8(%ebp), %eax
	movb	$4, 4(%eax)
	.loc 1 58 0
	movl	8(%ebp), %eax
	movb	$51, 5(%eax)
	jmp	L6
L3:
	.loc 1 60 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	L5
	.loc 1 62 0
	movl	8(%ebp), %eax
	movb	$12, 4(%eax)
	.loc 1 63 0
	movl	8(%ebp), %eax
	movb	$17, 5(%eax)
	jmp	L6
L5:
	.loc 1 67 0
	movl	$18, -12(%ebp)
	jmp	L6
L2:
	.loc 1 72 0
	movl	$1, -12(%ebp)
L6:
	.loc 1 75 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 76 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_Intrlv_Interleaver
	.def	_Intrlv_Interleaver;	.scl	2;	.type	32;	.endef
_Intrlv_Interleaver:
LFB19:
	.loc 1 89 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 90 0
	movl	$0, 4(%esp)
	movl	$_Intrlv_Interleaver, (%esp)
	call	_Debug_SetWatermark
	.loc 1 92 0
	movl	$0, -12(%ebp)
	.loc 1 94 0
	cmpl	$0, 16(%ebp)
	je	L9
	.loc 1 96 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L11
	cmpl	$1, %eax
	je	L12
	jmp	L14
L11:
	.loc 1 99 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_BlockInterleaver
	movl	%eax, -12(%ebp)
	.loc 1 100 0
	jmp	L9
L12:
	.loc 1 103 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ConvolutionalInterleaver
	movl	%eax, -12(%ebp)
	.loc 1 104 0
	jmp	L9
L14:
	.loc 1 107 0
	movl	$13, -12(%ebp)
	.loc 1 108 0
	nop
L9:
	.loc 1 112 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 113 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_Intrlv_Deinterleaver
	.def	_Intrlv_Deinterleaver;	.scl	2;	.type	32;	.endef
_Intrlv_Deinterleaver:
LFB20:
	.loc 1 126 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 127 0
	movl	$0, 4(%esp)
	movl	$_Intrlv_Deinterleaver, (%esp)
	call	_Debug_SetWatermark
	.loc 1 129 0
	movl	$0, -12(%ebp)
	.loc 1 131 0
	cmpl	$0, 16(%ebp)
	je	L16
	.loc 1 133 0
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L18
	cmpl	$1, %eax
	je	L19
	jmp	L21
L18:
	.loc 1 136 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_BlockDeinterleaver
	movl	%eax, -12(%ebp)
	.loc 1 137 0
	jmp	L16
L19:
	.loc 1 140 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ConvolutionalDeinterleaver
	movl	%eax, -12(%ebp)
	.loc 1 141 0
	jmp	L16
L21:
	.loc 1 144 0
	movl	$13, -12(%ebp)
	.loc 1 145 0
	nop
L16:
	.loc 1 149 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 150 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.def	_BlockInterleaver;	.scl	3;	.type	32;	.endef
_BlockInterleaver:
LFB21:
	.loc 1 173 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	.loc 1 174 0
	movl	$1, 4(%esp)
	movl	$_BlockInterleaver, (%esp)
	call	_Debug_SetWatermark
	.loc 1 176 0
	movl	$0, -12(%ebp)
	.loc 1 177 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	-1(%eax), %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %ecx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%ecx, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	addl	$1, %eax
	movl	%eax, -36(%ebp)
	.loc 1 182 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L23
	.loc 1 183 0 discriminator 1
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	.loc 1 182 0 discriminator 1
	testb	%al, %al
	je	L23
	.loc 1 185 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L24
	.loc 1 187 0
	movl	$0, -28(%ebp)
	jmp	L25
L31:
	.loc 1 189 0
	movb	$0, -29(%ebp)
	.loc 1 190 0
	movl	$0, -24(%ebp)
	.loc 1 192 0
	movl	-36(%ebp), %eax
	subl	$1, %eax
	cmpl	-28(%ebp), %eax
	jne	L26
	.loc 1 194 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	-28(%ebp), %eax
	movl	%eax, %ecx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%ecx, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -16(%ebp)
	jmp	L27
L26:
	.loc 1 198 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %edx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%edx, %eax
	movl	%eax, -16(%ebp)
L27:
	.loc 1 201 0
	movl	$0, -20(%ebp)
	jmp	L28
L30:
	.loc 1 203 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	-28(%ebp), %eax
	movl	%eax, %ecx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%eax, %ecx
	movl	-20(%ebp), %eax
	addl	%ecx, %eax
	addl	%eax, %edx
	.loc 1 204 0
	movl	8(%ebp), %eax
	movl	(%eax), %ecx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	-28(%ebp), %eax
	movl	%eax, %ebx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%eax, %ebx
	movl	-24(%ebp), %eax
	addl	%ebx, %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	.loc 1 203 0
	movb	%al, (%edx)
	.loc 1 205 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, -24(%ebp)
	.loc 1 207 0
	movl	-24(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jb	L29
	.loc 1 209 0
	addb	$1, -29(%ebp)
	.loc 1 210 0
	movzbl	-29(%ebp), %eax
	movl	%eax, -24(%ebp)
L29:
	.loc 1 201 0 discriminator 2
	addl	$1, -20(%ebp)
L28:
	.loc 1 201 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jb	L30
	.loc 1 187 0 is_stmt 1 discriminator 2
	addl	$1, -28(%ebp)
L25:
	.loc 1 187 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L31
	.loc 1 185 0 is_stmt 1
	jmp	L33
L24:
	.loc 1 217 0
	movl	$7, -12(%ebp)
	.loc 1 185 0
	jmp	L33
L23:
	.loc 1 222 0
	movl	$19, -12(%ebp)
L33:
	.loc 1 225 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	.loc 1 226 0
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.def	_BlockDeinterleaver;	.scl	3;	.type	32;	.endef
_BlockDeinterleaver:
LFB22:
	.loc 1 243 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$64, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 243 0
	movl	%esp, %eax
	movl	%eax, %esi
	.loc 1 244 0
	movl	$1, 4(%esp)
	movl	$_BlockDeinterleaver, (%esp)
	call	_Debug_SetWatermark
	.loc 1 246 0
	movl	$0, -12(%ebp)
	.loc 1 247 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	-1(%eax), %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %ecx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%ecx, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	addl	$1, %eax
	movl	%eax, -36(%ebp)
	.loc 1 248 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	-36(%ebp), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%eax, %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -40(%ebp)
	.loc 1 251 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	subl	$1, %eax
	movl	%eax, -44(%ebp)
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	movl	$16, %edx
	subl	$1, %edx
	addl	%edx, %eax
	movl	$16, %ebx
	movl	$0, %edx
	divl	%ebx
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	12(%esp), %eax
	addl	$0, %eax
	movl	%eax, -48(%ebp)
	.loc 1 254 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L36
	.loc 1 255 0 discriminator 1
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	.loc 1 254 0 discriminator 1
	testb	%al, %al
	je	L36
	.loc 1 257 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L37
	.loc 1 259 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %edx
	movl	-48(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	_memset
	.loc 1 260 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	subl	$1, %eax
	movb	%al, -29(%ebp)
	.loc 1 261 0
	movl	$0, -28(%ebp)
	jmp	L38
L41:
	.loc 1 263 0
	movzbl	-29(%ebp), %eax
	movzbl	-29(%ebp), %edx
	movl	-48(%ebp), %ecx
	movzbl	(%ecx,%edx), %edx
	leal	1(%edx), %ecx
	movl	-48(%ebp), %edx
	movb	%cl, (%edx,%eax)
	.loc 1 265 0
	cmpb	$0, -29(%ebp)
	jne	L39
	.loc 1 267 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	subl	$1, %eax
	movb	%al, -29(%ebp)
	jmp	L40
L39:
	.loc 1 271 0
	subb	$1, -29(%ebp)
L40:
	.loc 1 261 0 discriminator 2
	addl	$1, -28(%ebp)
L38:
	.loc 1 261 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	cmpl	-40(%ebp), %eax
	jb	L41
	.loc 1 275 0 is_stmt 1
	movl	$0, -28(%ebp)
	jmp	L42
L49:
	.loc 1 277 0
	movb	$0, -29(%ebp)
	.loc 1 278 0
	movb	$0, -30(%ebp)
	.loc 1 279 0
	movl	$0, -24(%ebp)
	.loc 1 281 0
	movl	-36(%ebp), %eax
	subl	$1, %eax
	cmpl	-28(%ebp), %eax
	jne	L43
	.loc 1 283 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	-28(%ebp), %eax
	movl	%eax, %ecx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%ecx, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -16(%ebp)
	jmp	L44
L43:
	.loc 1 287 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %edx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%edx, %eax
	movl	%eax, -16(%ebp)
L44:
	.loc 1 290 0
	movl	$0, -20(%ebp)
	jmp	L45
L48:
	.loc 1 292 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	-28(%ebp), %eax
	movl	%eax, %ecx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%eax, %ecx
	movl	-20(%ebp), %eax
	addl	%ecx, %eax
	addl	%eax, %edx
	.loc 1 293 0
	movl	8(%ebp), %eax
	movl	(%eax), %ecx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	imull	-28(%ebp), %eax
	movl	%eax, %ebx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	imull	%eax, %ebx
	movl	-24(%ebp), %eax
	addl	%ebx, %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	.loc 1 292 0
	movb	%al, (%edx)
	.loc 1 294 0
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, -24(%ebp)
	.loc 1 296 0
	movl	-36(%ebp), %eax
	subl	$1, %eax
	cmpl	-28(%ebp), %eax
	jne	L46
	.loc 1 298 0
	movzbl	-29(%ebp), %eax
	movl	-48(%ebp), %edx
	movzbl	(%edx,%eax), %eax
	movzbl	%al, %eax
	subl	%eax, -24(%ebp)
	.loc 1 299 0
	addb	$1, -29(%ebp)
L46:
	.loc 1 302 0
	movl	-24(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jb	L47
	.loc 1 304 0
	addb	$1, -30(%ebp)
	.loc 1 305 0
	movzbl	-30(%ebp), %eax
	movl	%eax, -24(%ebp)
	.loc 1 306 0
	movb	$0, -29(%ebp)
L47:
	.loc 1 290 0 discriminator 2
	addl	$1, -20(%ebp)
L45:
	.loc 1 290 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jb	L48
	.loc 1 275 0 is_stmt 1 discriminator 2
	addl	$1, -28(%ebp)
L42:
	.loc 1 275 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jb	L49
	.loc 1 257 0 is_stmt 1
	jmp	L51
L37:
	.loc 1 313 0
	movl	$7, -12(%ebp)
	.loc 1 257 0
	jmp	L51
L36:
	.loc 1 318 0
	movl	$19, -12(%ebp)
L51:
	.loc 1 321 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	%esi, %esp
	.loc 1 322 0
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.def	_ConvolutionalInterleaver;	.scl	3;	.type	32;	.endef
_ConvolutionalInterleaver:
LFB23:
	.loc 1 335 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 335 0
	movl	%esp, %eax
	movl	%eax, -80(%ebp)
	.loc 1 336 0
	movl	$1, 4(%esp)
	movl	$_ConvolutionalInterleaver, (%esp)
	call	_Debug_SetWatermark
	.loc 1 338 0
	movl	$0, -28(%ebp)
	.loc 1 339 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	subl	$1, %eax
	movw	%ax, -48(%ebp)
	.loc 1 340 0
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	subl	$1, %eax
	imull	%edx, %eax
	movw	%ax, -50(%ebp)
	.loc 1 341 0
	movzwl	-50(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -56(%ebp)
	movzwl	-50(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, -76(%ebp)
	movzwl	-48(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -60(%ebp)
	movzwl	-50(%ebp), %eax
	movl	%eax, %ecx
	movl	$0, %ebx
	movzwl	-48(%ebp), %eax
	movl	$0, %edx
	movl	%ebx, %edi
	imull	%eax, %edi
	movl	%edx, %esi
	imull	%ecx, %esi
	addl	%edi, %esi
	mull	%ecx
	leal	(%esi,%edx), %ecx
	movl	%ecx, %edx
	movzwl	-50(%ebp), %eax
	movl	%eax, %ecx
	movl	$0, %ebx
	movzwl	-48(%ebp), %eax
	movl	$0, %edx
	movl	%ebx, %edi
	imull	%eax, %edi
	movl	%edx, %esi
	imull	%ecx, %esi
	addl	%edi, %esi
	mull	%ecx
	leal	(%esi,%edx), %ecx
	movl	%ecx, %edx
	movzwl	-50(%ebp), %edx
	movzwl	-48(%ebp), %eax
	imull	%edx, %eax
	addl	%eax, %eax
	leal	1(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	8(%esp), %eax
	addl	$1, %eax
	shrl	%eax
	addl	%eax, %eax
	movl	%eax, -64(%ebp)
	.loc 1 343 0
	movl	$0, -40(%ebp)
	.loc 1 344 0
	movl	$0, -44(%ebp)
	.loc 1 345 0
	movw	$-1, -46(%ebp)
	.loc 1 347 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L54
	.loc 1 348 0 discriminator 1
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	.loc 1 347 0 discriminator 1
	testb	%al, %al
	je	L54
	.loc 1 350 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L55
	.loc 1 352 0
	movl	$0, -32(%ebp)
	jmp	L56
L59:
	.loc 1 354 0
	movl	$0, -36(%ebp)
	jmp	L57
L58:
	.loc 1 356 0 discriminator 3
	movl	-76(%ebp), %edx
	shrl	%edx
	movl	-64(%ebp), %eax
	movl	%edx, %ecx
	imull	-32(%ebp), %ecx
	movl	-36(%ebp), %edx
	addl	%ecx, %edx
	movw	$-1, (%eax,%edx,2)
	.loc 1 354 0 discriminator 3
	addl	$1, -36(%ebp)
L57:
	.loc 1 354 0 is_stmt 0 discriminator 1
	movzwl	-50(%ebp), %eax
	cmpl	-36(%ebp), %eax
	ja	L58
	.loc 1 352 0 is_stmt 1 discriminator 2
	addl	$1, -32(%ebp)
L56:
	.loc 1 352 0 is_stmt 0 discriminator 1
	movzwl	-48(%ebp), %eax
	cmpl	-32(%ebp), %eax
	ja	L59
	.loc 1 360 0 is_stmt 1
	jmp	L60
L67:
	.loc 1 362 0
	cmpw	$-1, -46(%ebp)
	jne	L61
	.loc 1 364 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	(%eax), %ecx
	movl	-40(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	.loc 1 365 0
	addl	$1, -44(%ebp)
	jmp	L62
L61:
	.loc 1 369 0
	movl	-76(%ebp), %ebx
	shrl	%ebx
	movswl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	movswl	-46(%ebp), %ecx
	addl	$1, %ecx
	imull	%ecx, %eax
	leal	-1(%eax), %ecx
	movl	-64(%ebp), %eax
	imull	%ebx, %edx
	addl	%ecx, %edx
	movzwl	(%eax,%edx,2), %eax
	cmpw	$-1, %ax
	je	L63
	.loc 1 371 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	leal	(%edx,%eax), %ebx
	.loc 1 372 0
	movl	-76(%ebp), %edi
	shrl	%edi
	movswl	-46(%ebp), %esi
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %edx
	movswl	-46(%ebp), %eax
	addl	$1, %eax
	imull	%edx, %eax
	leal	-1(%eax), %ecx
	movl	-64(%ebp), %edx
	movl	%edi, %eax
	imull	%esi, %eax
	addl	%ecx, %eax
	movzwl	(%edx,%eax,2), %eax
	.loc 1 371 0
	movb	%al, (%ebx)
	.loc 1 373 0
	addl	$1, -44(%ebp)
L63:
	.loc 1 376 0
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	movswl	-46(%ebp), %edx
	addl	$1, %edx
	imull	%edx, %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
	jmp	L64
L65:
	.loc 1 378 0 discriminator 3
	movl	-76(%ebp), %esi
	movl	%esi, %eax
	shrl	%eax
	movl	%eax, -84(%ebp)
	movswl	-46(%ebp), %edi
	shrl	%esi
	movswl	-46(%ebp), %ecx
	movl	-36(%ebp), %eax
	leal	-1(%eax), %ebx
	movl	-64(%ebp), %edx
	imull	%ecx, %esi
	movl	%esi, %eax
	addl	%ebx, %eax
	movzwl	(%edx,%eax,2), %edx
	movl	-64(%ebp), %eax
	movl	-84(%ebp), %ebx
	imull	%edi, %ebx
	movl	-36(%ebp), %ecx
	addl	%ebx, %ecx
	movw	%dx, (%eax,%ecx,2)
	.loc 1 376 0 discriminator 3
	subl	$1, -36(%ebp)
L64:
	.loc 1 376 0 is_stmt 0 discriminator 1
	cmpl	$0, -36(%ebp)
	jne	L65
	.loc 1 380 0 is_stmt 1
	movl	-76(%ebp), %ebx
	shrl	%ebx
	movswl	-46(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %ecx
	movl	-40(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %ecx
	movl	-64(%ebp), %eax
	imull	%ebx, %edx
	movw	%cx, (%eax,%edx,2)
L62:
	.loc 1 383 0
	addl	$1, -40(%ebp)
	.loc 1 385 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	leal	-2(%eax), %edx
	movswl	-46(%ebp), %eax
	cmpl	%eax, %edx
	jne	L66
	.loc 1 387 0
	movw	$-1, -46(%ebp)
	jmp	L60
L66:
	.loc 1 391 0
	movzwl	-46(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -46(%ebp)
L60:
	.loc 1 360 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-40(%ebp), %eax
	ja	L67
	.loc 1 395 0
	cmpw	$-1, -46(%ebp)
	jne	L69
	.loc 1 397 0
	movw	$0, -46(%ebp)
	.loc 1 400 0
	jmp	L69
L74:
	.loc 1 402 0
	movl	-76(%ebp), %ebx
	shrl	%ebx
	movswl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	movswl	-46(%ebp), %ecx
	addl	$1, %ecx
	imull	%ecx, %eax
	leal	-1(%eax), %ecx
	movl	-64(%ebp), %eax
	imull	%ebx, %edx
	addl	%ecx, %edx
	movzwl	(%eax,%edx,2), %eax
	cmpw	$-1, %ax
	je	L70
	.loc 1 404 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	leal	(%edx,%eax), %ebx
	.loc 1 405 0
	movl	-76(%ebp), %edi
	shrl	%edi
	movswl	-46(%ebp), %esi
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %edx
	movswl	-46(%ebp), %eax
	addl	$1, %eax
	imull	%edx, %eax
	leal	-1(%eax), %ecx
	movl	-64(%ebp), %edx
	movl	%edi, %eax
	imull	%esi, %eax
	addl	%ecx, %eax
	movzwl	(%edx,%eax,2), %eax
	.loc 1 404 0
	movb	%al, (%ebx)
	.loc 1 406 0
	addl	$1, -44(%ebp)
L70:
	.loc 1 409 0
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %eax
	movswl	-46(%ebp), %edx
	addl	$1, %edx
	imull	%edx, %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
	jmp	L71
L72:
	.loc 1 411 0 discriminator 3
	movl	-76(%ebp), %esi
	movl	%esi, %eax
	shrl	%eax
	movl	%eax, -84(%ebp)
	movswl	-46(%ebp), %edi
	shrl	%esi
	movswl	-46(%ebp), %ecx
	movl	-36(%ebp), %eax
	leal	-1(%eax), %ebx
	movl	-64(%ebp), %edx
	imull	%ecx, %esi
	movl	%esi, %eax
	addl	%ebx, %eax
	movzwl	(%edx,%eax,2), %edx
	movl	-64(%ebp), %eax
	movl	-84(%ebp), %ebx
	imull	%edi, %ebx
	movl	-36(%ebp), %ecx
	addl	%ebx, %ecx
	movw	%dx, (%eax,%ecx,2)
	.loc 1 409 0 discriminator 3
	subl	$1, -36(%ebp)
L71:
	.loc 1 409 0 is_stmt 0 discriminator 1
	cmpl	$0, -36(%ebp)
	jne	L72
	.loc 1 414 0 is_stmt 1
	movl	-76(%ebp), %ecx
	shrl	%ecx
	movswl	-46(%ebp), %edx
	movl	-64(%ebp), %eax
	imull	%ecx, %edx
	movw	$-1, (%eax,%edx,2)
	.loc 1 416 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	leal	-2(%eax), %edx
	movswl	-46(%ebp), %eax
	cmpl	%eax, %edx
	jne	L73
	.loc 1 418 0
	movw	$0, -46(%ebp)
	jmp	L69
L73:
	.loc 1 422 0
	movzwl	-46(%ebp), %eax
	addl	$1, %eax
	movw	%ax, -46(%ebp)
L69:
	.loc 1 400 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-44(%ebp), %eax
	ja	L74
	.loc 1 350 0
	jmp	L76
L55:
	.loc 1 428 0
	movl	$7, -28(%ebp)
	.loc 1 350 0
	jmp	L76
L54:
	.loc 1 433 0
	movl	$19, -28(%ebp)
L76:
	.loc 1 436 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	-80(%ebp), %esp
	.loc 1 437 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.def	_ConvolutionalDeinterleaver;	.scl	3;	.type	32;	.endef
_ConvolutionalDeinterleaver:
LFB24:
	.loc 1 450 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 450 0
	movl	%esp, %eax
	movl	%eax, -80(%ebp)
	.loc 1 451 0
	movl	$1, 4(%esp)
	movl	$_ConvolutionalDeinterleaver, (%esp)
	call	_Debug_SetWatermark
	.loc 1 453 0
	movl	$0, -28(%ebp)
	.loc 1 454 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	subl	$1, %eax
	movw	%ax, -50(%ebp)
	.loc 1 455 0
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	subl	$1, %eax
	imull	%edx, %eax
	movw	%ax, -52(%ebp)
	.loc 1 456 0
	movzwl	-52(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -56(%ebp)
	movzwl	-52(%ebp), %eax
	addl	%eax, %eax
	movl	%eax, -76(%ebp)
	movzwl	-50(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -60(%ebp)
	movzwl	-52(%ebp), %eax
	movl	%eax, %ecx
	movl	$0, %ebx
	movzwl	-50(%ebp), %eax
	movl	$0, %edx
	movl	%ebx, %edi
	imull	%eax, %edi
	movl	%edx, %esi
	imull	%ecx, %esi
	addl	%edi, %esi
	mull	%ecx
	leal	(%esi,%edx), %ecx
	movl	%ecx, %edx
	movzwl	-52(%ebp), %eax
	movl	%eax, %ecx
	movl	$0, %ebx
	movzwl	-50(%ebp), %eax
	movl	$0, %edx
	movl	%ebx, %edi
	imull	%eax, %edi
	movl	%edx, %esi
	imull	%ecx, %esi
	addl	%edi, %esi
	mull	%ecx
	leal	(%esi,%edx), %ecx
	movl	%ecx, %edx
	movzwl	-52(%ebp), %edx
	movzwl	-50(%ebp), %eax
	imull	%edx, %eax
	addl	%eax, %eax
	leal	1(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, %edi
	movl	$0, %edx
	divl	%edi
	imull	$16, %eax, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	leal	8(%esp), %eax
	addl	$1, %eax
	shrl	%eax
	addl	%eax, %eax
	movl	%eax, -64(%ebp)
	.loc 1 458 0
	movl	$0, -40(%ebp)
	.loc 1 459 0
	movl	$0, -44(%ebp)
	.loc 1 460 0
	movw	$0, -46(%ebp)
	.loc 1 461 0
	movw	$0, -48(%ebp)
	.loc 1 463 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	testb	%al, %al
	je	L79
	.loc 1 464 0 discriminator 1
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_Memory_IsStreamValid
	.loc 1 463 0 discriminator 1
	testb	%al, %al
	je	L79
	.loc 1 466 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jne	L80
	.loc 1 468 0
	movl	$0, -32(%ebp)
	jmp	L81
L84:
	.loc 1 470 0
	movl	$0, -36(%ebp)
	jmp	L82
L83:
	.loc 1 472 0 discriminator 3
	movl	-76(%ebp), %edx
	shrl	%edx
	movl	-64(%ebp), %eax
	movl	%edx, %ecx
	imull	-32(%ebp), %ecx
	movl	-36(%ebp), %edx
	addl	%ecx, %edx
	movw	$-1, (%eax,%edx,2)
	.loc 1 470 0 discriminator 3
	addl	$1, -36(%ebp)
L82:
	.loc 1 470 0 is_stmt 0 discriminator 1
	movzwl	-52(%ebp), %eax
	cmpl	-36(%ebp), %eax
	ja	L83
	.loc 1 468 0 is_stmt 1 discriminator 2
	addl	$1, -32(%ebp)
L81:
	.loc 1 468 0 is_stmt 0 discriminator 1
	movzwl	-50(%ebp), %eax
	cmpl	-32(%ebp), %eax
	ja	L84
	.loc 1 476 0 is_stmt 1
	jmp	L85
L96:
	.loc 1 478 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	leal	-1(%eax), %edx
	movzwl	-46(%ebp), %eax
	cmpl	%eax, %edx
	jne	L86
	.loc 1 479 0 discriminator 1
	movzwl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %ecx
	movzwl	-48(%ebp), %ebx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %esi
	movzwl	-46(%ebp), %eax
	imull	%esi, %eax
	subl	%eax, %ebx
	movl	%ebx, %eax
	imull	%ecx, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	.loc 1 478 0 discriminator 1
	cmpl	%eax, %edx
	jnb	L86
	.loc 1 481 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	(%eax), %ecx
	movl	-40(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	.loc 1 482 0
	addl	$1, -44(%ebp)
	.loc 1 483 0
	addl	$1, -40(%ebp)
	jmp	L87
L86:
	.loc 1 487 0
	movl	-76(%ebp), %esi
	shrl	%esi
	movzwl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %ecx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %ebx
	movzwl	-46(%ebp), %eax
	subl	%eax, %ebx
	movl	%ebx, %eax
	subl	$1, %eax
	imull	%ecx, %eax
	leal	-1(%eax), %ecx
	movl	-64(%ebp), %eax
	imull	%esi, %edx
	addl	%ecx, %edx
	movzwl	(%eax,%edx,2), %eax
	cmpw	$-1, %ax
	je	L88
	.loc 1 489 0
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-44(%ebp), %eax
	leal	(%edx,%eax), %ebx
	.loc 1 490 0
	movl	-76(%ebp), %edi
	shrl	%edi
	movzwl	-46(%ebp), %esi
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %ecx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %edx
	movzwl	-46(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	subl	$1, %eax
	imull	%ecx, %eax
	leal	-1(%eax), %ecx
	movl	-64(%ebp), %edx
	movl	%edi, %eax
	imull	%esi, %eax
	addl	%ecx, %eax
	movzwl	(%edx,%eax,2), %eax
	.loc 1 489 0
	movb	%al, (%ebx)
	.loc 1 491 0
	addl	$1, -44(%ebp)
L88:
	.loc 1 494 0
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %ecx
	movzwl	-46(%ebp), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	$1, %eax
	imull	%edx, %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
	jmp	L89
L90:
	.loc 1 496 0 discriminator 3
	movl	-76(%ebp), %esi
	movl	%esi, %eax
	shrl	%eax
	movl	%eax, -84(%ebp)
	movzwl	-46(%ebp), %edi
	shrl	%esi
	movzwl	-46(%ebp), %ecx
	movl	-36(%ebp), %eax
	leal	-1(%eax), %ebx
	movl	-64(%ebp), %edx
	imull	%ecx, %esi
	movl	%esi, %eax
	addl	%ebx, %eax
	movzwl	(%edx,%eax,2), %edx
	movl	-64(%ebp), %eax
	movl	-84(%ebp), %ebx
	imull	%edi, %ebx
	movl	-36(%ebp), %ecx
	addl	%ebx, %ecx
	movw	%dx, (%eax,%ecx,2)
	.loc 1 494 0 discriminator 3
	subl	$1, -36(%ebp)
L89:
	.loc 1 494 0 is_stmt 0 discriminator 1
	cmpl	$0, -36(%ebp)
	jne	L90
	.loc 1 499 0 is_stmt 1
	movzwl	-46(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %ecx
	movzwl	-48(%ebp), %ebx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %esi
	movzwl	-46(%ebp), %eax
	imull	%esi, %eax
	subl	%eax, %ebx
	movl	%ebx, %eax
	imull	%ecx, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jnb	L91
	.loc 1 501 0
	movl	-76(%ebp), %ebx
	shrl	%ebx
	movzwl	-46(%ebp), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %ecx
	movl	-40(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %ecx
	movl	-64(%ebp), %eax
	imull	%ebx, %edx
	movw	%cx, (%eax,%edx,2)
	.loc 1 502 0
	addl	$1, -40(%ebp)
	jmp	L87
L91:
	.loc 1 506 0
	movl	-76(%ebp), %ecx
	shrl	%ecx
	movzwl	-46(%ebp), %edx
	movl	-64(%ebp), %eax
	imull	%ecx, %edx
	movw	$-1, (%eax,%edx,2)
L87:
	.loc 1 510 0
	movzwl	-48(%ebp), %edx
	movl	16(%ebp), %eax
	movzbl	5(%eax), %eax
	movzbl	%al, %ecx
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	subl	$1, %eax
	imull	%ecx, %eax
	cmpl	%eax, %edx
	jge	L92
	.loc 1 512 0
	movzwl	-46(%ebp), %ecx
	movzwl	-48(%ebp), %eax
	movl	16(%ebp), %edx
	movzbl	5(%edx), %edx
	movzbl	%dl, %edi
	cltd
	idivl	%edi
	cmpl	%eax, %ecx
	jne	L93
	.loc 1 514 0
	movw	$0, -46(%ebp)
	.loc 1 515 0
	addw	$1, -48(%ebp)
	jmp	L85
L93:
	.loc 1 519 0
	addw	$1, -46(%ebp)
	jmp	L85
L92:
	.loc 1 524 0
	movl	16(%ebp), %eax
	movzbl	4(%eax), %eax
	movzbl	%al, %eax
	leal	-1(%eax), %edx
	movzwl	-46(%ebp), %eax
	cmpl	%eax, %edx
	jne	L95
	.loc 1 526 0
	movw	$0, -46(%ebp)
	.loc 1 527 0
	addw	$1, -48(%ebp)
	jmp	L85
L95:
	.loc 1 531 0
	addw	$1, -46(%ebp)
L85:
	.loc 1 476 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-44(%ebp), %eax
	ja	L96
	.loc 1 466 0
	jmp	L98
L80:
	.loc 1 538 0
	movl	$7, -28(%ebp)
	.loc 1 466 0
	jmp	L98
L79:
	.loc 1 543 0
	movl	$19, -28(%ebp)
L98:
	.loc 1 546 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_Error_HandleErr
	movl	-80(%ebp), %esp
	.loc 1 547 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
Letext0:
	.file 2 "c:/mingw/include/stdio.h"
	.file 3 "c:/mingw/include/stdint.h"
	.file 4 "c:/mingw/include/stdlib.h"
	.file 5 "c:/mingw/include/time.h"
	.file 6 "src/error.h"
	.file 7 "src/memory.h"
	.file 8 "src/interleaving.h"
	.file 9 "src/debug.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xc0e
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -mtune=generic -march=i586 -g -O0\0"
	.byte	0xc
	.ascii "src\\interleaving.c\0"
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
	.long	0x14f
	.uleb128 0x4
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0xd4
	.long	0x14f
	.byte	0
	.uleb128 0x4
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0xd5
	.long	0xb9
	.byte	0x4
	.uleb128 0x4
	.ascii "_base\0"
	.byte	0x2
	.byte	0xd6
	.long	0x14f
	.byte	0x8
	.uleb128 0x4
	.ascii "_flag\0"
	.byte	0x2
	.byte	0xd7
	.long	0xb9
	.byte	0xc
	.uleb128 0x4
	.ascii "_file\0"
	.byte	0x2
	.byte	0xd8
	.long	0xb9
	.byte	0x10
	.uleb128 0x4
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0xd9
	.long	0xb9
	.byte	0x14
	.uleb128 0x4
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0xda
	.long	0xb9
	.byte	0x18
	.uleb128 0x4
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0xdb
	.long	0x14f
	.byte	0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0xc0
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0xdc
	.long	0xc8
	.uleb128 0x7
	.long	0x155
	.long	0x16c
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_iob\0"
	.byte	0x2
	.byte	0xef
	.long	0x161
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x6
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x3b
	.long	0x196
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x6
	.ascii "int16_t\0"
	.byte	0x3
	.byte	0x3c
	.long	0x1b6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x6
	.ascii "uint16_t\0"
	.byte	0x3
	.byte	0x3d
	.long	0x86
	.uleb128 0xa
	.long	0x1c3
	.uleb128 0x6
	.ascii "uint32_t\0"
	.byte	0x3
	.byte	0x3f
	.long	0x76
	.uleb128 0xa
	.long	0x1d8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x9
	.ascii "_argc\0"
	.byte	0x4
	.byte	0x63
	.long	0xb9
	.uleb128 0x9
	.ascii "_argv\0"
	.byte	0x4
	.byte	0x64
	.long	0x221
	.uleb128 0x5
	.byte	0x4
	.long	0x14f
	.uleb128 0x9
	.ascii "__mb_cur_max\0"
	.byte	0x4
	.byte	0x8e
	.long	0xb9
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xca
	.long	0xb9
	.uleb128 0x7
	.long	0x14f
	.long	0x257
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xe3
	.long	0x24c
	.uleb128 0x9
	.ascii "_osver\0"
	.byte	0x4
	.byte	0xfa
	.long	0x76
	.uleb128 0x9
	.ascii "_winver\0"
	.byte	0x4
	.byte	0xfb
	.long	0x76
	.uleb128 0x9
	.ascii "_winmajor\0"
	.byte	0x4
	.byte	0xfc
	.long	0x76
	.uleb128 0x9
	.ascii "_winminor\0"
	.byte	0x4
	.byte	0xfd
	.long	0x76
	.uleb128 0xb
	.ascii "_fmode\0"
	.byte	0x4
	.word	0x145
	.long	0xb9
	.uleb128 0xb
	.ascii "_daylight\0"
	.byte	0x5
	.word	0x15c
	.long	0xb9
	.uleb128 0xb
	.ascii "_timezone\0"
	.byte	0x5
	.word	0x15d
	.long	0x9c
	.uleb128 0x7
	.long	0x14f
	.long	0x2ed
	.uleb128 0xc
	.long	0x2ed
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
	.long	0x2dd
	.uleb128 0xb
	.ascii "daylight\0"
	.byte	0x5
	.word	0x17d
	.long	0xb9
	.uleb128 0xb
	.ascii "timezone\0"
	.byte	0x5
	.word	0x17e
	.long	0x9c
	.uleb128 0xb
	.ascii "tzname\0"
	.byte	0x5
	.word	0x17f
	.long	0x2dd
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
	.long	0x76
	.byte	0x6
	.byte	0x1c
	.long	0x52f
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
	.long	0x35c
	.uleb128 0xd
	.byte	0x4
	.long	0x76
	.byte	0x7
	.byte	0x1d
	.long	0x588
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
	.long	0x53e
	.uleb128 0x3
	.ascii "_byte_stream_t\0"
	.byte	0xc
	.byte	0x7
	.byte	0x24
	.long	0x5d9
	.uleb128 0x4
	.ascii "pBuf\0"
	.byte	0x7
	.byte	0x26
	.long	0x5d9
	.byte	0
	.uleb128 0x4
	.ascii "len\0"
	.byte	0x7
	.byte	0x27
	.long	0x1d8
	.byte	0x4
	.uleb128 0x4
	.ascii "id\0"
	.byte	0x7
	.byte	0x28
	.long	0x588
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x187
	.uleb128 0x6
	.ascii "byte_stream_t\0"
	.byte	0x7
	.byte	0x29
	.long	0x59d
	.uleb128 0xa
	.long	0x5df
	.uleb128 0xd
	.byte	0x4
	.long	0x76
	.byte	0x8
	.byte	0x1f
	.long	0x630
	.uleb128 0xe
	.ascii "INTRLV_BLOCK\0"
	.byte	0
	.uleb128 0xe
	.ascii "INTRLV_CONV\0"
	.byte	0x1
	.uleb128 0xe
	.ascii "INTRLV_NUM\0"
	.byte	0x2
	.byte	0
	.uleb128 0x6
	.ascii "itlv_type_t\0"
	.byte	0x8
	.byte	0x24
	.long	0x5f9
	.uleb128 0xf
	.byte	0x1
	.byte	0x8
	.byte	0x2a
	.long	0x664
	.uleb128 0x10
	.ascii "rows\0"
	.byte	0x8
	.byte	0x2c
	.long	0x187
	.uleb128 0x10
	.ascii "dlys\0"
	.byte	0x8
	.byte	0x2d
	.long	0x187
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.byte	0x8
	.byte	0x2f
	.long	0x686
	.uleb128 0x10
	.ascii "cols\0"
	.byte	0x8
	.byte	0x31
	.long	0x187
	.uleb128 0x10
	.ascii "cells\0"
	.byte	0x8
	.byte	0x32
	.long	0x187
	.byte	0
	.uleb128 0x3
	.ascii "_itlv_par_t\0"
	.byte	0x8
	.byte	0x8
	.byte	0x27
	.long	0x6b4
	.uleb128 0x4
	.ascii "type\0"
	.byte	0x8
	.byte	0x29
	.long	0x630
	.byte	0
	.uleb128 0x11
	.long	0x643
	.byte	0x4
	.uleb128 0x11
	.long	0x664
	.byte	0x5
	.byte	0
	.uleb128 0x6
	.ascii "itlv_par_t\0"
	.byte	0x8
	.byte	0x34
	.long	0x686
	.uleb128 0xa
	.long	0x6b4
	.uleb128 0x12
	.ascii "_wm_level_t\0"
	.byte	0x4
	.long	0x76
	.byte	0x9
	.byte	0x55
	.long	0x71a
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
	.uleb128 0x13
	.ascii "ConvolutionalDeinterleaver\0"
	.byte	0x1
	.word	0x1c1
	.long	0x52f
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x815
	.uleb128 0x14
	.secrel32	LASF0
	.byte	0x1
	.word	0x1c1
	.long	0x815
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.secrel32	LASF1
	.byte	0x1
	.word	0x1c1
	.long	0x81b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.secrel32	LASF2
	.byte	0x1
	.word	0x1c1
	.long	0x821
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.secrel32	LASF3
	.byte	0x1
	.word	0x1c5
	.long	0x52f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.secrel32	LASF4
	.byte	0x1
	.word	0x1c6
	.long	0x1d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -58
	.uleb128 0x15
	.secrel32	LASF5
	.byte	0x1
	.word	0x1c7
	.long	0x1d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x15
	.secrel32	LASF6
	.byte	0x1
	.word	0x1c8
	.long	0x827
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0x16
	.ascii "i\0"
	.byte	0x1
	.word	0x1c9
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x1c9
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.ascii "inIdx\0"
	.byte	0x1
	.word	0x1ca
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.ascii "outIdx\0"
	.byte	0x1
	.word	0x1cb
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x15
	.secrel32	LASF7
	.byte	0x1
	.word	0x1cc
	.long	0x1c3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -54
	.uleb128 0x16
	.ascii "colIdx\0"
	.byte	0x1
	.word	0x1cd
	.long	0x1c3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x5f4
	.uleb128 0x5
	.byte	0x4
	.long	0x5df
	.uleb128 0x5
	.byte	0x4
	.long	0x6c6
	.uleb128 0x7
	.long	0x1c3
	.long	0x844
	.uleb128 0x17
	.long	0x2ed
	.uleb128 0x4
	.byte	0x91
	.sleb128 -68
	.byte	0x6
	.uleb128 0x17
	.long	0x2ed
	.uleb128 0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x6
	.byte	0
	.uleb128 0x13
	.ascii "ConvolutionalInterleaver\0"
	.byte	0x1
	.word	0x14e
	.long	0x52f
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x92b
	.uleb128 0x14
	.secrel32	LASF0
	.byte	0x1
	.word	0x14e
	.long	0x815
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.secrel32	LASF1
	.byte	0x1
	.word	0x14e
	.long	0x81b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.secrel32	LASF2
	.byte	0x1
	.word	0x14e
	.long	0x821
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.secrel32	LASF3
	.byte	0x1
	.word	0x152
	.long	0x52f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.secrel32	LASF4
	.byte	0x1
	.word	0x153
	.long	0x1d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x15
	.secrel32	LASF5
	.byte	0x1
	.word	0x154
	.long	0x1d3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -58
	.uleb128 0x15
	.secrel32	LASF6
	.byte	0x1
	.word	0x155
	.long	0x92b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0x16
	.ascii "i\0"
	.byte	0x1
	.word	0x156
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.ascii "j\0"
	.byte	0x1
	.word	0x156
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.ascii "inIdx\0"
	.byte	0x1
	.word	0x157
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.ascii "outIdx\0"
	.byte	0x1
	.word	0x158
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x15
	.secrel32	LASF7
	.byte	0x1
	.word	0x159
	.long	0x1a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -54
	.byte	0
	.uleb128 0x7
	.long	0x1c3
	.long	0x948
	.uleb128 0x17
	.long	0x2ed
	.uleb128 0x4
	.byte	0x91
	.sleb128 -68
	.byte	0x6
	.uleb128 0x17
	.long	0x2ed
	.uleb128 0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.ascii "BlockDeinterleaver\0"
	.byte	0x1
	.byte	0xf2
	.long	0x52f
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0xa34
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0xf2
	.long	0x815
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0xf2
	.long	0x81b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF2
	.byte	0x1
	.byte	0xf2
	.long	0x821
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0xf6
	.long	0x52f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii "cycNum\0"
	.byte	0x1
	.byte	0xf7
	.long	0x1e8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1b
	.ascii "misElem\0"
	.byte	0x1
	.byte	0xf8
	.long	0x1e8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.ascii "cycLen\0"
	.byte	0x1
	.byte	0xf9
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.ascii "i\0"
	.byte	0x1
	.byte	0xfa
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0xfa
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.ascii "k\0"
	.byte	0x1
	.byte	0xfa
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.ascii "skipElem\0"
	.byte	0x1
	.byte	0xfb
	.long	0xa34
	.uleb128 0x3
	.byte	0x91
	.sleb128 -56
	.byte	0x6
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.byte	0xfc
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x1b
	.ascii "colIdx\0"
	.byte	0x1
	.byte	0xfc
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -38
	.byte	0
	.uleb128 0x7
	.long	0x187
	.long	0xa47
	.uleb128 0x17
	.long	0x2ed
	.uleb128 0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.ascii "BlockInterleaver\0"
	.byte	0x1
	.byte	0xac
	.long	0x52f
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xafa
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0xac
	.long	0x815
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0xac
	.long	0x81b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF2
	.byte	0x1
	.byte	0xac
	.long	0x821
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0xb0
	.long	0x52f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii "cycNum\0"
	.byte	0x1
	.byte	0xb1
	.long	0x1e8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1b
	.ascii "cycLen\0"
	.byte	0x1
	.byte	0xb2
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.ascii "i\0"
	.byte	0x1
	.byte	0xb3
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.ascii "j\0"
	.byte	0x1
	.byte	0xb3
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.ascii "k\0"
	.byte	0x1
	.byte	0xb3
	.long	0x1d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.secrel32	LASF7
	.byte	0x1
	.byte	0xb4
	.long	0x187
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.byte	0
	.uleb128 0x1c
	.ascii "Intrlv_Deinterleaver\0"
	.byte	0x1
	.byte	0x7d
	.long	0x52f
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xb5d
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0x7d
	.long	0x815
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0x7d
	.long	0x81b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF2
	.byte	0x1
	.byte	0x7d
	.long	0x821
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0x81
	.long	0x52f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1c
	.ascii "Intrlv_Interleaver\0"
	.byte	0x1
	.byte	0x58
	.long	0x52f
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xbbe
	.uleb128 0x19
	.secrel32	LASF0
	.byte	0x1
	.byte	0x58
	.long	0x815
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.secrel32	LASF1
	.byte	0x1
	.byte	0x58
	.long	0x81b
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.secrel32	LASF2
	.byte	0x1
	.byte	0x58
	.long	0x821
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0x5c
	.long	0x52f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1c
	.ascii "Intrlv_ListParameters\0"
	.byte	0x1
	.byte	0x2d
	.long	0x52f
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xc0b
	.uleb128 0x1d
	.ascii "ioParams\0"
	.byte	0x1
	.byte	0x2d
	.long	0xc0b
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.secrel32	LASF3
	.byte	0x1
	.byte	0x31
	.long	0x52f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x6b4
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
LASF4:
	.ascii "shiftRegRows\0"
LASF2:
	.ascii "pParams\0"
LASF1:
	.ascii "outStream\0"
LASF3:
	.ascii "retErr\0"
LASF7:
	.ascii "rowIdx\0"
LASF5:
	.ascii "shiftRegCols\0"
LASF0:
	.ascii "inStream\0"
LASF6:
	.ascii "shiftRegMtx\0"
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_Debug_SetWatermark;	.scl	2;	.type	32;	.endef
	.def	_Error_HandleErr;	.scl	2;	.type	32;	.endef
	.def	_Memory_IsStreamValid;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
