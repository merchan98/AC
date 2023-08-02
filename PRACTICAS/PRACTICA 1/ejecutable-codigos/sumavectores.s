	.file	"sumavectores.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n1 componentes del vector"
	.align 8
.LC4:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f+%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f+%8.6f) /\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L15
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movsd	.LC1(%rip), %xmm3
	xorl	%eax, %eax
	movsd	.LC2(%rip), %xmm1
	.p2align 4,,10
	.p2align 3
.L3:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm7
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm2
	subsd	%xmm0, %xmm7
	addsd	%xmm1, %xmm2
	movsd	%xmm7, v2(,%rax,8)
	movsd	%xmm2, v1(,%rax,8)
	addq	$1, %rax
	cmpq	$29, %rax
	jne	.L3
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	v1(%rax), %xmm0
	addq	$8, %rax
	addsd	v2-8(%rax), %xmm0
	movsd	%xmm0, v3-8(%rax)
	cmpq	$232, %rax
	jne	.L5
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	$28, %ecx
	pxor	%xmm0, %xmm0
	movl	$28, %r9d
	pxor	%xmm1, %xmm1
	movl	$28, %r8d
	movsd	v3+224(%rip), %xmm6
	movl	$29, %edx
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movsd	v2+224(%rip), %xmm5
	movsd	v1+224(%rip), %xmm4
	movl	$.LC4, %esi
	movsd	v3(%rip), %xmm3
	movl	$1, %edi
	movsd	v2(%rip), %xmm2
	cvtsi2sdq	%rax, %xmm1
	movl	$7, %eax
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	v1(%rip), %xmm1
	call	__printf_chk
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L16
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
.L16:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.comm	v3,232,32
	.comm	v2,232,32
	.comm	v1,232,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	2576980378
	.long	1069128089
	.align 8
.LC2:
	.long	858993460
	.long	1074213683
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
