	.file	"daxpy.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	daxpy
	.type	daxpy, @function
daxpy:
.LFB38:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%edx, %ebp
	movq	%rdi, %rbx
	movq	%rcx, %rsi
	xorl	%edi, %edi
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%r8, %r13
	movsd	%xmm0, 8(%rsp)
	call	clock_gettime
	xorl	%eax, %eax
	testl	%ebp, %ebp
	movsd	8(%rsp), %xmm0
	je	.L4
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	(%r12,%rax,8), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	(%rbx,%rax,8), %xmm1
	movsd	%xmm1, (%rbx,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebp
	ja	.L5
.L4:
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	movq	%r13, %rsi
	xorl	%edi, %edi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	clock_gettime
	.cfi_endproc
.LFE38:
	.size	daxpy, .-daxpy
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"ERROR: falta tama\303\261o del vector y/o constante\n"
	.align 8
.LC3:
	.string	"y[0] = %11.9f, y[%i] = %11.9f\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.section	.text.unlikely
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jle	.L24
	movq	8(%rsi), %rdi
	movq	%rsi, %rbp
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	16(%rbp), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movq	%rax, %rbx
	movl	%ebx, %r12d
	call	strtol
	pxor	%xmm0, %xmm0
	salq	$3, %r12
	movq	%r12, %rdi
	cvtsi2sdq	%rax, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	malloc
	testl	%ebx, %ebx
	movq	%rax, %r12
	movsd	8(%rsp), %xmm0
	je	.L18
	leal	2(%rbx), %edx
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	movl	$2, %eax
	.p2align 4,,10
	.p2align 3
.L17:
	pxor	%xmm1, %xmm1
	movl	%eax, %esi
	addl	$1, %eax
	cvtsi2sdq	%rsi, %xmm1
	movl	%edi, %esi
	addl	$2, %edi
	movsd	%xmm1, 0(%rbp,%rcx)
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rsi, %xmm1
	movsd	%xmm1, (%r12,%rcx)
	addq	$8, %rcx
	cmpl	%edx, %eax
	jne	.L17
.L18:
	leaq	32(%rsp), %r8
	leaq	16(%rsp), %rcx
	movl	%ebx, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	daxpy
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	$.LC3, %esi
	pxor	%xmm2, %xmm2
	movl	$1, %edi
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm2
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	leal	-1(%rbx), %eax
	movsd	0(%rbp,%rax,8), %xmm1
	movq	%rax, %rdx
	movl	$2, %eax
	divsd	.LC2(%rip), %xmm2
	addsd	%xmm0, %xmm2
	movsd	0(%rbp), %xmm0
	movsd	%xmm2, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm2
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$1, %eax
	movapd	%xmm2, %xmm0
	call	__printf_chk
	movq	%rbp, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	xorl	%eax, %eax
	movq	56(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L25
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	movq	stderr(%rip), %rcx
	movl	$.LC1, %edi
	movl	$46, %edx
	movl	$1, %esi
	call	fwrite
	movl	$1, %edi
	call	exit
.L25:
	call	__stack_chk_fail
	.cfi_endproc
.LFE39:
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
