	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"roxy idle on thread:%d\n"
.LC2:
	.string	"error at nanosleep!"
	.text
	.p2align 4
	.globl	idle_task
	.type	idle_task, @function
idle_task:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	.LC1(%rip), %r13
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
	movdqa	.LC0(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	8(%rsp), %rbx
	leaq	32(%rsp), %r12
	movaps	%xmm0, 16(%rsp)
	leaq	16(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbx, %rdi
	call	time@PLT
	movq	%rbx, %rdi
	call	localtime@PLT
	xorl	%eax, %eax
	call	sched_getcpu@PLT
	movq	%r13, %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	rand@PLT
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	nanosleep@PLT
	cmpl	$-1, %eax
	jne	.L3
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE40:
	.size	idle_task, .-idle_task
	.p2align 4
	.globl	fib
	.type	fib, @function
fib:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edi, %eax
	subl	$1, %edi
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	%edi, 8(%rsp)
	movl	$0, 20(%rsp)
	cmpl	$1, %eax
	jbe	.L50
	cmpl	$1, 8(%rsp)
	jbe	.L51
.L9:
	movl	8(%rsp), %eax
	movl	$0, 24(%rsp)
	subl	$1, %eax
	movl	%eax, 12(%rsp)
	cmpl	$1, 12(%rsp)
	movl	%eax, 36(%rsp)
	je	.L52
.L12:
	movl	12(%rsp), %eax
	movl	$0, 28(%rsp)
	subl	$1, %eax
	movl	%eax, 16(%rsp)
	cmpl	$1, 16(%rsp)
	movl	%eax, 40(%rsp)
	je	.L53
.L15:
	movl	16(%rsp), %eax
	movl	$0, 32(%rsp)
	subl	$1, %eax
	movl	%eax, 48(%rsp)
	movl	%eax, %r11d
.L19:
	cmpl	$1, %r11d
	je	.L54
	leal	-1(%r11), %eax
	xorl	%ecx, %ecx
	movl	%eax, 44(%rsp)
	movl	%eax, %ebp
.L22:
	cmpl	$1, %ebp
	je	.L55
	leal	-1(%rbp), %esi
	xorl	%r12d, %r12d
	movl	%esi, %edx
.L25:
	cmpl	$1, %edx
	je	.L56
	leal	-2(%rdx), %r8d
	xorl	%r15d, %r15d
	movl	%r8d, %r9d
.L28:
	leal	1(%r9), %eax
	movl	%r9d, %ebx
	xorl	%r13d, %r13d
	cmpl	$1, %eax
	jbe	.L57
	movl	%ebx, %r10d
	xorl	%r14d, %r14d
	cmpl	$1, %ebx
	je	.L58
	.p2align 4,,10
	.p2align 3
.L30:
	leal	-1(%r10), %edi
	movl	%r8d, 76(%rsp)
	movl	%esi, 72(%rsp)
	movl	%r9d, 68(%rsp)
	movl	%edx, 64(%rsp)
	movl	%r11d, 60(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%r10d, 52(%rsp)
	call	fib
	movl	52(%rsp), %r10d
	movl	56(%rsp), %ecx
	addl	%eax, %r14d
	movl	60(%rsp), %r11d
	movl	64(%rsp), %edx
	subl	$2, %r10d
	movl	68(%rsp), %r9d
	movl	72(%rsp), %esi
	cmpl	$1, %r10d
	movl	76(%rsp), %r8d
	ja	.L30
	addl	$1, %r14d
	leal	-2(%rbx), %eax
	subl	$1, %ebx
	addl	%r14d, %r13d
	cmpl	$1, %ebx
	jbe	.L59
.L42:
	movl	%eax, %ebx
	xorl	%r14d, %r14d
	movl	%ebx, %r10d
	cmpl	$1, %ebx
	jne	.L30
.L58:
	movl	$1, %r14d
	leal	-2(%rbx), %eax
	subl	$1, %ebx
	addl	%r14d, %r13d
	cmpl	$1, %ebx
	ja	.L42
.L59:
	addl	$1, %r13d
	leal	-2(%r9), %eax
	addl	%r13d, %r15d
	cmpl	$1, %r9d
	ja	.L40
.L62:
	addl	$1, %r15d
	subl	$1, %edx
	addl	%r15d, %r12d
	cmpl	$1, %edx
	ja	.L38
.L61:
	addl	$1, %r12d
.L26:
	addl	%r12d, %ecx
	subl	$2, %ebp
	cmpl	$1, %esi
	ja	.L22
	addl	$1, %ecx
.L23:
	addl	%ecx, 32(%rsp)
	subl	$2, %r11d
	cmpl	$1, 44(%rsp)
	ja	.L19
	movl	32(%rsp), %eax
	addl	$1, %eax
.L20:
	addl	%eax, 28(%rsp)
	movl	16(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 48(%rsp)
	jbe	.L60
	movl	%eax, 16(%rsp)
	cmpl	$1, 16(%rsp)
	jne	.L15
.L53:
	movl	$0, 48(%rsp)
	movl	$1, %eax
	jmp	.L20
.L56:
	movl	$1, %r15d
	subl	$1, %edx
	movl	$-1, %r8d
	addl	%r15d, %r12d
	cmpl	$1, %edx
	jbe	.L61
.L38:
	movl	%r8d, %edx
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L57:
	movl	$1, %r13d
	leal	-2(%r9), %eax
	addl	%r13d, %r15d
	cmpl	$1, %r9d
	jbe	.L62
.L40:
	movl	%eax, %r9d
	jmp	.L28
.L55:
	movl	$1, %r12d
	xorl	%esi, %esi
	jmp	.L26
.L54:
	movl	$0, 44(%rsp)
	movl	$1, %ecx
	jmp	.L23
.L60:
	movl	28(%rsp), %eax
	addl	$1, %eax
.L17:
	addl	%eax, 24(%rsp)
	movl	12(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 40(%rsp)
	jbe	.L63
	movl	%eax, 12(%rsp)
	cmpl	$1, 12(%rsp)
	jne	.L12
.L52:
	movl	$0, 40(%rsp)
	movl	$1, %eax
	jmp	.L17
.L63:
	movl	24(%rsp), %eax
	addl	$1, %eax
.L14:
	addl	%eax, 20(%rsp)
	movl	8(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 36(%rsp)
	jbe	.L64
	movl	%eax, 8(%rsp)
	cmpl	$1, 8(%rsp)
	ja	.L9
.L51:
	movl	8(%rsp), %edi
	movl	$1, %eax
	subl	$1, %edi
	movl	%edi, 36(%rsp)
	jmp	.L14
.L64:
	movl	20(%rsp), %eax
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	addl	$1, %eax
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L50:
	.cfi_restore_state
	addq	$88, %rsp
	.cfi_def_cfa_offset 56
	movl	$1, %eax
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
	.cfi_endproc
.LFE41:
	.size	fib, .-fib
	.section	.rodata.str1.1
.LC3:
	.string	"fib(%d)=%d on thread:%d \n"
	.text
	.p2align 4
	.globl	compute_task
	.type	compute_task, @function
compute_task:
.LFB42:
	.cfi_startproc
	endbr64
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.L69:
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	call	sched_getcpu@PLT
	movl	%eax, %r14d
	.p2align 4,,10
	.p2align 3
.L66:
	movl	%r13d, %edx
	leal	1(%r12), %ecx
	movl	%r14d, %r8d
	movl	$1, %edi
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	addl	$1, %r13d
	call	__printf_chk@PLT
	cmpl	$40, %r13d
	je	.L69
	xorl	%eax, %eax
	movl	%r13d, %ebp
	xorl	%r12d, %r12d
	call	sched_getcpu@PLT
	movl	%eax, %r14d
	cmpl	$1, %r13d
	je	.L66
	leal	-1(%rbp), %ebx
	xorl	%r15d, %r15d
	cmpl	$1, %ebx
	je	.L80
	.p2align 4,,10
	.p2align 3
.L70:
	leal	-1(%rbx), %edi
	subl	$2, %ebx
	call	fib
	addl	%eax, %r15d
	cmpl	$1, %ebx
	jg	.L70
	leal	1(%r15), %edx
.L72:
	subl	$2, %ebp
	addl	%edx, %r12d
	cmpl	$1, %ebp
	jle	.L66
	leal	-1(%rbp), %ebx
	xorl	%r15d, %r15d
	cmpl	$1, %ebx
	jne	.L70
.L80:
	movl	$1, %edx
	jmp	.L72
	.cfi_endproc
.LFE42:
	.size	compute_task, .-compute_task
	.section	.rodata.str1.1
.LC4:
	.string	"Failed at init"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB43:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	roxy_init@PLT
	testl	%eax, %eax
	jne	.L87
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	xorl	%edi, %edi
	leaq	idle_task(%rip), %rcx
	movl	$5, %esi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	je	.L88
.L83:
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L88:
	.cfi_restore_state
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$20, %esi
	leaq	compute_task(%rip), %rcx
	movl	$1, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	jne	.L83
	movl	$2, %esi
	movl	$1, %edi
	call	roxy_task_start@PLT
	jmp	.L83
.L87:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L83
	.cfi_endproc
.LFE43:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	0
	.quad	500000000
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
