	.file	"pmm-secuencial.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta size\n"
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L25
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$2255, %ebx
	call	strtol
	cmpl	$2255, %eax
	cmovbe	%eax, %ebx
	testl	%ebx, %ebx
	je	.L26
	leal	-1(%rbx), %r13d
	xorl	%ebp, %ebp
	leaq	1(%r13), %r14
	movq	%r13, %rbx
	imulq	$9020, %r14, %rdx
	leaq	0(,%r14,4), %r12
.L6:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movl	$0, a(%rbp,%rax)
	movl	$2, b(%rbp,%rax)
	movl	$2, c(%rbp,%rax)
	addq	$4, %rax
	cmpq	%rax, %r12
	jne	.L5
	addq	$9020, %rbp
	cmpq	%rdx, %rbp
	jne	.L6
	movq	%rsp, %rsi
	xorl	%edi, %edi
	addq	$a, %r12
	call	clock_gettime
	movq	%r13, %rax
	movl	$b, %r9d
	addq	$c, %rbp
	imulq	$-9020, %r13, %r13
	negq	%rax
	imulq	$9024, %r14, %r11
	leaq	-9020(%r13), %r10
	leaq	-4(,%rax,4), %r13
	addq	$a, %r11
.L8:
	leaq	0(%r13,%r12), %r8
	movq	%rbp, %rdi
	.p2align 4,,10
	.p2align 3
.L12:
	movl	(%r8), %esi
	leaq	(%r10,%rdi), %rax
	movq	%r9, %rcx
	.p2align 4,,10
	.p2align 3
.L9:
	movl	(%rcx), %edx
	addq	$9020, %rax
	addq	$4, %rcx
	imull	-9020(%rax), %edx
	addl	%edx, %esi
	cmpq	%rdi, %rax
	jne	.L9
	movl	%esi, (%r8)
	addq	$4, %r8
	leaq	4(%rax), %rdi
	cmpq	%r12, %r8
	jne	.L12
	addq	$9020, %r12
	addq	$9020, %r9
	cmpq	%r11, %r12
	jne	.L8
.L11:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	%ebx, %edx
	pxor	%xmm0, %xmm0
	movl	$.LC2, %esi
	imulq	$9024, %rdx, %rdx
	movl	$1, %edi
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
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L27
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L26:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	movl	$-1, %ebx
	call	clock_gettime
	jmp	.L11
.L25:
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
	.comm	c,20340100,32
	.comm	b,20340100,32
	.comm	a,20340100,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
