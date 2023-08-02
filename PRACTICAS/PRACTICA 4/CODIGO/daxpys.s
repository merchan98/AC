	.file	"daxpy.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.globl	daxpy
	.type	daxpy, @function
daxpy:
.LFB20:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rcx, %rsi
	movq	%rdi, %rbx
	xorl	%edi, %edi
	movl	%edx, %ebp
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movsd	%xmm0, 8(%rsp)
	movq	%r8, (%rsp)
	call	clock_gettime
	movq	(%rsp), %r8
	xorl	%eax, %eax
	movsd	8(%rsp), %xmm0
.L2:
	cmpl	%eax, %ebp
	jbe	.L6
	movsd	(%r12,%rax,8), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	(%rbx,%rax,8), %xmm1
	movsd	%xmm1, (%rbx,%rax,8)
	incq	%rax
	jmp	.L2
.L6:
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%r8, %rsi
	xorl	%edi, %edi
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	clock_gettime
	.cfi_endproc
.LFE20:
	.size	daxpy, .-daxpy
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"ERROR: falta tama\303\261o del vector y/o constante\n"
.LC3:
	.string	"y[0] = %11.9f, y[%i] = %11.9f\n"
.LC4:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.section	.text.unlikely
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.globl	main
	.type	main, @function
main:
.LFB21:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jg	.L8
	movq	stderr(%rip), %rsi
	movl	$.LC1, %edi
	call	fputs
	movl	$1, %edi
	call	exit
.L8:
	movq	8(%rsi), %rdi
	movq	%rsi, %rbp
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	16(%rbp), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %rbx
	movl	%eax, %r13d
	movl	%ebx, %r12d
	call	strtol
	cvtsi2sdq	%rax, %xmm0
	salq	$3, %r12
	movq	%r12, %rdi
	movsd	%xmm0, 8(%rsp)
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	malloc
	movsd	8(%rsp), %xmm0
	movq	%rax, %r12
	xorl	%eax, %eax
.L9:
	cmpl	%eax, %r13d
	jbe	.L17
	leal	2(%rax), %edx
	cvtsi2sdq	%rdx, %xmm1
	leal	(%rax,%rax), %edx
	movsd	%xmm1, 0(%rbp,%rax,8)
	cvtsi2sdq	%rdx, %xmm1
	movsd	%xmm1, (%r12,%rax,8)
	incq	%rax
	jmp	.L9
.L17:
	leaq	24(%rsp), %rcx
	leaq	40(%rsp), %r8
	movl	%ebx, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	daxpy
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	movl	$.LC3, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm2
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	leal	-1(%rbx), %eax
	movsd	0(%rbp,%rax,8), %xmm1
	movq	%rax, %rdx
	movb	$2, %al
	divsd	.LC2(%rip), %xmm2
	addsd	%xmm0, %xmm2
	movsd	0(%rbp), %xmm0
	movsd	%xmm2, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm2
	movl	$.LC4, %esi
	movl	$1, %edi
	movb	$1, %al
	movapd	%xmm2, %xmm0
	call	__printf_chk
	movq	%rbp, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	xorl	%eax, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L15
	call	__stack_chk_fail
.L15:
	addq	$72, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
