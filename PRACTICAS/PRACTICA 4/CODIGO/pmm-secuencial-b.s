	.file	"pmm-secuencial-b.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"falta size\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
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
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L26
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$3355, %ebp
	call	strtol
	cmpl	$3355, %eax
	cmovbe	%eax, %ebp
	testl	%ebp, %ebp
	je	.L3
	leal	-1(%rbp), %ebx
	xorl	%edx, %edx
	movq	%rbx, %rbp
	addq	$1, %rbx
	imulq	$13420, %rbx, %r12
	salq	$2, %rbx
.L5:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$0, a(%rdx,%rax)
	movl	$2, b(%rdx,%rax)
	movl	$2, c(%rdx,%rax)
	addq	$4, %rax
	cmpq	%rbx, %rax
	jne	.L4
	addq	$13420, %rdx
	cmpq	%r12, %rdx
	jne	.L5
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%edx, %edx
.L10:
	leaq	b(%rdx), %r8
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L8:
	movl	(%r8), %edi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movl	c(%rsi,%rax), %ecx
	imull	%edi, %ecx
	addl	%ecx, a(%rdx,%rax)
	addq	$4, %rax
	cmpq	%rbx, %rax
	jne	.L7
	addq	$13420, %rsi
	addq	$4, %r8
	cmpq	%r12, %rsi
	jne	.L8
	addq	$13420, %rdx
	cmpq	%r12, %rdx
	jne	.L10
.L11:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	%ebp, %edx
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	imulq	$13424, %rdx, %rdx
	movl	$.LC2, %esi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movl	a(%rdx), %ecx
	movl	a(%rip), %edx
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC1(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
	xorl	%eax, %eax
	movq	40(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L27
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	movl	$-1, %ebp
	call	clock_gettime
	jmp	.L11
.L26:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$11, %edx
	movl	$1, %esi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L27:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.comm	c,45024100,32
	.comm	b,45024100,32
	.comm	a,45024100,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
