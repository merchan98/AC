	.file	"pmm-secuencial-a.c"
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L31
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	$3355, %edx
	cmpl	$3355, %eax
	cmovbe	%eax, %edx
	testl	%edx, %edx
	movl	%edx, %r15d
	je	.L3
	leal	-1(%rdx), %ecx
	xorl	%edx, %edx
	movl	%ecx, 76(%rsp)
	addq	$1, %rcx
	imulq	$13420, %rcx, %rsi
	salq	$2, %rcx
.L5:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$0, a(%rdx,%rax)
	movl	$2, b(%rdx,%rax)
	movl	$2, c(%rdx,%rax)
	addq	$4, %rax
	cmpq	%rcx, %rax
	jne	.L4
	addq	$13420, %rdx
	cmpq	%rsi, %rdx
	jne	.L5
	movl	%r15d, %eax
	leaq	80(%rsp), %rsi
	xorl	%edi, %edi
	shrl	$3, %eax
	movl	%eax, %ebx
	movl	%eax, 48(%rsp)
	call	clock_gettime
	movl	%ebx, %eax
	leal	0(,%rbx,8), %ebx
	movq	$a, 64(%rsp)
	subl	$1, %eax
	movq	$b, 40(%rsp)
	movl	$0, 72(%rsp)
	salq	$5, %rax
	movl	%ebx, 52(%rsp)
	addq	$32, %rax
	movq	%rax, 56(%rsp)
.L14:
	movl	72(%rsp), %r14d
	movq	64(%rsp), %rax
	movq	$c, 32(%rsp)
	movq	$c+4, 24(%rsp)
	movl	$0, 12(%rsp)
	movq	%rax, 16(%rsp)
	imulq	$3355, %r14, %r14
	.p2align 4,,10
	.p2align 3
.L10:
	movl	48(%rsp), %eax
	testl	%eax, %eax
	je	.L32
	movq	24(%rsp), %rax
	movq	56(%rsp), %r13
	xorl	%ebp, %ebp
	movq	32(%rsp), %rdi
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
	xorl	%r11d, %r11d
	addq	%rax, %r13
	movq	%rax, %rdx
	movq	40(%rsp), %rax
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L7:
	movl	(%rax), %esi
	addq	$32, %rdx
	addq	$32, %rax
	imull	(%rdi), %esi
	addq	$107360, %rdi
	addl	%esi, %r12d
	movl	-28(%rax), %esi
	imull	-32(%rdx), %esi
	addl	%esi, %ebx
	movl	-24(%rax), %esi
	imull	-28(%rdx), %esi
	addl	%esi, %r11d
	movl	-20(%rax), %esi
	imull	-24(%rdx), %esi
	addl	%esi, %r10d
	movl	-16(%rax), %esi
	imull	-20(%rdx), %esi
	addl	%esi, %r9d
	movl	-12(%rax), %esi
	imull	-16(%rdx), %esi
	addl	%esi, %r8d
	movl	-8(%rax), %esi
	imull	-12(%rdx), %esi
	addl	%esi, %ecx
	movl	-4(%rax), %esi
	imull	-8(%rdx), %esi
	addl	%esi, %ebp
	cmpq	%rdx, %r13
	jne	.L7
	addl	%r12d, %ebx
	addl	%r11d, %ebx
	addl	%r10d, %ebx
	addl	%ebx, %r9d
	addl	%r9d, %r8d
	addl	%r8d, %ecx
	addl	%ecx, %ebp
.L13:
	movl	52(%rsp), %eax
	cmpl	%eax, %r15d
	jbe	.L8
	movl	12(%rsp), %ecx
	movl	%eax, %edx
	imulq	$3355, %rcx, %rcx
	.p2align 4,,10
	.p2align 3
.L9:
	movl	%edx, %eax
	addl	$1, %edx
	leaq	(%r14,%rax), %rsi
	addq	%rcx, %rax
	movl	b(,%rsi,4), %esi
	imull	c(,%rax,4), %esi
	addl	%esi, %ebp
	cmpl	%r15d, %edx
	jne	.L9
.L8:
	addl	$1, 12(%rsp)
	movq	16(%rsp), %rax
	movl	12(%rsp), %ebx
	addq	$4, 32(%rsp)
	addq	$13420, 24(%rsp)
	movl	%ebp, (%rax)
	addq	$4, %rax
	cmpl	%r15d, %ebx
	movq	%rax, 16(%rsp)
	jne	.L10
	addl	$1, 72(%rsp)
	addq	$13420, 64(%rsp)
	movl	72(%rsp), %eax
	addq	$13420, 40(%rsp)
	cmpl	%r15d, %eax
	jne	.L14
	jmp	.L15
.L3:
	leaq	80(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	$-1, 76(%rsp)
.L15:
	leaq	96(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	104(%rsp), %rax
	subq	88(%rsp), %rax
	movl	$.LC2, %esi
	pxor	%xmm0, %xmm0
	movl	76(%rsp), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	96(%rsp), %rax
	subq	80(%rsp), %rax
	imulq	$13424, %rdx, %rdx
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
	movq	120(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L33
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L31:
	.cfi_restore_state
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$11, %edx
	movl	$1, %esi
	call	fwrite
	movl	$-1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L32:
	xorl	%ebp, %ebp
	jmp	.L13
.L33:
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
