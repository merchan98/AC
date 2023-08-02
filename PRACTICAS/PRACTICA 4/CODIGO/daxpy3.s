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
	movl	%edx, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbp
	movq	%rsi, %r12
	xorl	%edi, %edi
	movq	%rcx, %rsi
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%r8, %rbx
	movsd	%xmm0, 8(%rsp)
	call	clock_gettime
	testl	%r13d, %r13d
	movsd	8(%rsp), %xmm0
	je	.L7
	leaq	16(%r12), %rax
	cmpq	%rax, %rbp
	leaq	16(%rbp), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L3
	cmpl	$6, %r13d
	jbe	.L3
	movq	%rbp, %rax
	salq	$60, %rax
	shrq	$63, %rax
	cmpl	%r13d, %eax
	cmova	%r13d, %eax
	xorl	%esi, %esi
	testl	%eax, %eax
	je	.L4
	movsd	(%r12), %xmm1
	movl	$1, %esi
	mulsd	%xmm0, %xmm1
	addsd	0(%rbp), %xmm1
	movsd	%xmm1, 0(%rbp)
.L4:
	subl	%eax, %r13d
	movapd	%xmm0, %xmm2
	leal	-2(%r13), %edi
	movl	%eax, %eax
	xorl	%ecx, %ecx
	unpcklpd	%xmm2, %xmm2
	salq	$3, %rax
	shrl	%edi
	leaq	0(%rbp,%rax), %r8
	xorl	%edx, %edx
	addl	$1, %edi
	addq	%r12, %rax
	leal	(%rdi,%rdi), %r9d
.L5:
	movupd	(%rax,%rcx), %xmm1
	addl	$1, %edx
	mulpd	%xmm2, %xmm1
	addpd	(%r8,%rcx), %xmm1
	movaps	%xmm1, (%r8,%rcx)
	addq	$16, %rcx
	cmpl	%edi, %edx
	jb	.L5
	cmpl	%r9d, %r13d
	leal	(%rsi,%r9), %eax
	je	.L7
	mulsd	(%r12,%rax,8), %xmm0
	leaq	0(%rbp,%rax,8), %rdx
	addsd	(%rdx), %xmm0
	movsd	%xmm0, (%rdx)
.L7:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%rbx, %rsi
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
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore_state
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L8:
	movsd	(%r12,%rax,8), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	0(%rbp,%rax,8), %xmm1
	movsd	%xmm1, 0(%rbp,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r13d
	ja	.L8
	jmp	.L7
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
.LCOLDB16:
	.section	.text.startup,"ax",@progbits
.LHOTB16:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
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
	jle	.L62
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movq	%rax, %r12
	movl	%r12d, %ebp
	call	strtol
	pxor	%xmm0, %xmm0
	salq	$3, %rbp
	movq	%rbp, %rdi
	cvtsi2sdq	%rax, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	malloc
	testl	%r12d, %r12d
	movq	%rax, %rbp
	movsd	8(%rsp), %xmm0
	je	.L63
	movq	%rbx, %rax
	salq	$60, %rax
	shrq	$63, %rax
	cmpl	%r12d, %eax
	cmova	%r12d, %eax
	cmpl	$5, %r12d
	ja	.L64
	movl	%r12d, %eax
.L25:
	movsd	.LC5(%rip), %xmm5
	cmpl	$1, %eax
	movq	$0, 0(%rbp)
	movsd	%xmm5, (%rbx)
	je	.L50
	movsd	.LC7(%rip), %xmm6
	cmpl	$2, %eax
	movsd	%xmm5, 8(%rbp)
	movsd	%xmm6, 8(%rbx)
	je	.L51
	movsd	.LC8(%rip), %xmm6
	cmpl	$3, %eax
	movsd	%xmm6, 16(%rbx)
	movsd	%xmm6, 16(%rbp)
	je	.L52
	movsd	.LC9(%rip), %xmm6
	cmpl	$5, %eax
	movsd	.LC10(%rip), %xmm3
	movsd	%xmm6, 24(%rbx)
	movsd	%xmm3, 24(%rbp)
	jne	.L53
	movsd	.LC11(%rip), %xmm7
	movl	$5, %ecx
	movsd	%xmm3, 32(%rbx)
	movsd	%xmm7, 32(%rbp)
.L27:
	cmpl	%eax, %r12d
	leal	-1(%r12), %r13d
	je	.L46
.L26:
	movl	%r12d, %r8d
	leal	-1(%r12), %r13d
	movl	%eax, %edx
	subl	%eax, %r8d
	leal	-4(%r8), %esi
	movl	%r13d, %edi
	subl	%eax, %edi
	shrl	$2, %esi
	addl	$1, %esi
	cmpl	$2, %edi
	leal	0(,%rsi,4), %r9d
	jbe	.L29
	movl	%ecx, 8(%rsp)
	leaq	0(,%rdx,8), %rax
	xorl	%edi, %edi
	movd	8(%rsp), %xmm5
	pxor	%xmm3, %xmm3
	movdqa	.LC13(%rip), %xmm6
	leaq	(%rbx,%rax), %rdx
	pshufd	$0, %xmm5, %xmm1
	addq	%rbp, %rax
	movdqa	.LC14(%rip), %xmm5
	movapd	.LC15(%rip), %xmm4
	paddd	.LC12(%rip), %xmm1
.L30:
	movdqa	%xmm1, %xmm2
	movdqa	%xmm1, %xmm7
	pslld	$1, %xmm1
	addl	$1, %edi
	addq	$32, %rdx
	addq	$32, %rax
	paddd	%xmm5, %xmm2
	cvtdq2pd	%xmm2, %xmm9
	movapd	%xmm9, %xmm8
	pshufd	$238, %xmm2, %xmm2
	paddd	%xmm6, %xmm7
	cmpltpd	%xmm3, %xmm8
	cvtdq2pd	%xmm2, %xmm2
	andpd	%xmm4, %xmm8
	addpd	%xmm9, %xmm8
	movaps	%xmm8, -32(%rdx)
	movapd	%xmm2, %xmm8
	cmpltpd	%xmm3, %xmm8
	andpd	%xmm4, %xmm8
	addpd	%xmm8, %xmm2
	cvtdq2pd	%xmm1, %xmm8
	pshufd	$238, %xmm1, %xmm1
	cvtdq2pd	%xmm1, %xmm1
	movaps	%xmm2, -16(%rdx)
	movapd	%xmm8, %xmm2
	cmpltpd	%xmm3, %xmm2
	andpd	%xmm4, %xmm2
	addpd	%xmm8, %xmm2
	movups	%xmm2, -32(%rax)
	movapd	%xmm1, %xmm2
	cmpltpd	%xmm3, %xmm2
	andpd	%xmm4, %xmm2
	addpd	%xmm2, %xmm1
	movups	%xmm1, -16(%rax)
	cmpl	%edi, %esi
	jbe	.L65
	movdqa	%xmm7, %xmm1
	jmp	.L30
.L65:
	addl	%r9d, %ecx
	cmpl	%r9d, %r8d
	je	.L46
.L29:
	pxor	%xmm1, %xmm1
	leal	2(%rcx), %edi
	movl	%ecx, %esi
	leal	(%rcx,%rcx), %edx
	movq	%rdi, %rax
	cvtsi2sdq	%rdi, %xmm1
	movsd	%xmm1, (%rbx,%rsi,8)
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
	leal	1(%rcx), %edx
	cmpl	%edx, %r12d
	movsd	%xmm1, 0(%rbp,%rsi,8)
	jbe	.L46
	pxor	%xmm1, %xmm1
	leal	3(%rcx), %esi
	movl	%edx, %r8d
	addl	%edx, %edx
	cmpl	%edi, %r12d
	cvtsi2sdq	%rsi, %xmm1
	movsd	%xmm1, (%rbx,%r8,8)
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
	movsd	%xmm1, 0(%rbp,%r8,8)
	jbe	.L46
	pxor	%xmm1, %xmm1
	leal	4(%rcx), %edx
	addl	%eax, %eax
	cvtsi2sdq	%rdx, %xmm1
	movsd	%xmm1, (%rbx,%rdi,8)
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	%xmm1, 0(%rbp,%rdi,8)
.L46:
	leaq	16(%rsp), %rcx
	leaq	32(%rsp), %r8
	movl	%r12d, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	daxpy
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	%r13d, %edx
	pxor	%xmm2, %xmm2
	movl	$.LC3, %esi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm2
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	%r13d, %eax
	movsd	(%rbx,%rax,8), %xmm1
	movl	$2, %eax
	divsd	.LC2(%rip), %xmm2
	addsd	%xmm0, %xmm2
	movsd	(%rbx), %xmm0
	movsd	%xmm2, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm2
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$1, %eax
	movapd	%xmm2, %xmm0
	call	__printf_chk
	movq	%rbx, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	xorl	%eax, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L66
	addq	$72, %rsp
	.cfi_remember_state
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
.L64:
	.cfi_restore_state
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L26
	movl	$1, %eax
	jmp	.L25
.L53:
	movl	$4, %ecx
	jmp	.L27
.L52:
	movl	$3, %ecx
	jmp	.L27
.L50:
	movl	$1, %ecx
	jmp	.L27
.L51:
	movl	$2, %ecx
	jmp	.L27
.L63:
	orl	$-1, %r13d
	jmp	.L46
.L62:
	movq	stderr(%rip), %rcx
	movl	$.LC1, %edi
	movl	$46, %edx
	movl	$1, %esi
	call	fwrite
	movl	$1, %edi
	call	exit
.L66:
	call	__stack_chk_fail
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE16:
	.section	.text.startup
.LHOTE16:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.align 8
.LC5:
	.long	0
	.long	1073741824
	.align 8
.LC7:
	.long	0
	.long	1074266112
	.align 8
.LC8:
	.long	0
	.long	1074790400
	.align 8
.LC9:
	.long	0
	.long	1075052544
	.align 8
.LC10:
	.long	0
	.long	1075314688
	.align 8
.LC11:
	.long	0
	.long	1075838976
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC12:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC13:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC14:
	.long	2
	.long	2
	.long	2
	.long	2
	.align 16
.LC15:
	.long	0
	.long	1106247680
	.long	0
	.long	1106247680
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
