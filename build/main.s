	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"roxy idle on cpu:%d %s"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"message queue pending message:%d\n"
	.text
	.p2align 4
	.globl	idle_task
	.type	idle_task, @function
idle_task:
.LFB67:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	.LC1(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbx
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rbx, %rdi
	call	time@PLT
	movq	%rbx, %rdi
	call	localtime@PLT
	movq	%rax, %rdi
	call	asctime@PLT
	movq	%rax, %r13
	xorl	%eax, %eax
	call	sched_getcpu@PLT
	movq	%r13, %rcx
	movq	%r12, %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$30, %edi
	call	roxy_mqueue_get_pending@PLT
	movq	%rbp, %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$1, %esi
	movl	$3, %edi
	call	roxy_task_wait@PLT
	jmp	.L2
	.cfi_endproc
.LFE67:
	.size	idle_task, .-idle_task
	.section	.rodata.str1.1
.LC2:
	.string	"0"
.LC3:
	.string	"Hello!!!!"
	.text
	.p2align 4
	.globl	send_task
	.type	send_task, @function
send_task:
.LFB70:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC2(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	.LC3(%rip), %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L7:
	movl	$3, %edx
	movq	%rbp, %rsi
	movl	$30, %edi
	call	roxy_mqueue_send@PLT
	movl	$1, %esi
	movl	$1, %edi
	call	roxy_task_wait@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	jmp	.L7
	.cfi_endproc
.LFE70:
	.size	send_task, .-send_task
	.p2align 4
	.globl	fib
	.type	fib, @function
fib:
.LFB68:
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
	jbe	.L52
	cmpl	$1, 8(%rsp)
	jbe	.L53
.L11:
	movl	8(%rsp), %eax
	movl	$0, 24(%rsp)
	subl	$1, %eax
	movl	%eax, 12(%rsp)
	cmpl	$1, 12(%rsp)
	movl	%eax, 36(%rsp)
	je	.L54
.L14:
	movl	12(%rsp), %eax
	movl	$0, 28(%rsp)
	subl	$1, %eax
	movl	%eax, 16(%rsp)
	cmpl	$1, 16(%rsp)
	movl	%eax, 40(%rsp)
	je	.L55
.L17:
	movl	16(%rsp), %eax
	movl	$0, 32(%rsp)
	subl	$1, %eax
	movl	%eax, 48(%rsp)
	movl	%eax, %r11d
.L21:
	cmpl	$1, %r11d
	je	.L56
	leal	-1(%r11), %eax
	xorl	%ecx, %ecx
	movl	%eax, 44(%rsp)
	movl	%eax, %ebp
.L24:
	cmpl	$1, %ebp
	je	.L57
	leal	-1(%rbp), %esi
	xorl	%r12d, %r12d
	movl	%esi, %edx
.L27:
	cmpl	$1, %edx
	je	.L58
	leal	-2(%rdx), %r8d
	xorl	%r15d, %r15d
	movl	%r8d, %r9d
.L30:
	leal	1(%r9), %eax
	movl	%r9d, %ebx
	xorl	%r13d, %r13d
	cmpl	$1, %eax
	jbe	.L59
	movl	%ebx, %r10d
	xorl	%r14d, %r14d
	cmpl	$1, %ebx
	je	.L60
	.p2align 4,,10
	.p2align 3
.L32:
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
	ja	.L32
	addl	$1, %r14d
	leal	-2(%rbx), %eax
	subl	$1, %ebx
	addl	%r14d, %r13d
	cmpl	$1, %ebx
	jbe	.L61
.L44:
	movl	%eax, %ebx
	xorl	%r14d, %r14d
	movl	%ebx, %r10d
	cmpl	$1, %ebx
	jne	.L32
.L60:
	movl	$1, %r14d
	leal	-2(%rbx), %eax
	subl	$1, %ebx
	addl	%r14d, %r13d
	cmpl	$1, %ebx
	ja	.L44
.L61:
	addl	$1, %r13d
	leal	-2(%r9), %eax
	addl	%r13d, %r15d
	cmpl	$1, %r9d
	ja	.L42
.L64:
	addl	$1, %r15d
	subl	$1, %edx
	addl	%r15d, %r12d
	cmpl	$1, %edx
	ja	.L40
.L63:
	addl	$1, %r12d
.L28:
	addl	%r12d, %ecx
	subl	$2, %ebp
	cmpl	$1, %esi
	ja	.L24
	addl	$1, %ecx
.L25:
	addl	%ecx, 32(%rsp)
	subl	$2, %r11d
	cmpl	$1, 44(%rsp)
	ja	.L21
	movl	32(%rsp), %eax
	addl	$1, %eax
.L22:
	addl	%eax, 28(%rsp)
	movl	16(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 48(%rsp)
	jbe	.L62
	movl	%eax, 16(%rsp)
	cmpl	$1, 16(%rsp)
	jne	.L17
.L55:
	movl	$0, 48(%rsp)
	movl	$1, %eax
	jmp	.L22
.L58:
	movl	$1, %r15d
	subl	$1, %edx
	movl	$-1, %r8d
	addl	%r15d, %r12d
	cmpl	$1, %edx
	jbe	.L63
.L40:
	movl	%r8d, %edx
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L59:
	movl	$1, %r13d
	leal	-2(%r9), %eax
	addl	%r13d, %r15d
	cmpl	$1, %r9d
	jbe	.L64
.L42:
	movl	%eax, %r9d
	jmp	.L30
.L57:
	movl	$1, %r12d
	xorl	%esi, %esi
	jmp	.L28
.L56:
	movl	$0, 44(%rsp)
	movl	$1, %ecx
	jmp	.L25
.L62:
	movl	28(%rsp), %eax
	addl	$1, %eax
.L19:
	addl	%eax, 24(%rsp)
	movl	12(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 40(%rsp)
	jbe	.L65
	movl	%eax, 12(%rsp)
	cmpl	$1, 12(%rsp)
	jne	.L14
.L54:
	movl	$0, 40(%rsp)
	movl	$1, %eax
	jmp	.L19
.L65:
	movl	24(%rsp), %eax
	addl	$1, %eax
.L16:
	addl	%eax, 20(%rsp)
	movl	8(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 36(%rsp)
	jbe	.L66
	movl	%eax, 8(%rsp)
	cmpl	$1, 8(%rsp)
	ja	.L11
.L53:
	movl	8(%rsp), %edi
	movl	$1, %eax
	subl	$1, %edi
	movl	%edi, 36(%rsp)
	jmp	.L16
.L66:
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
.L52:
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
.LFE68:
	.size	fib, .-fib
	.p2align 4
	.globl	compute_task
	.type	compute_task, @function
compute_task:
.LFB69:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L69:
	movl	$39, %ebp
.L70:
	movl	%ebp, %ebx
	cmpl	$1, %ebp
	jbe	.L77
	.p2align 4,,10
	.p2align 3
.L68:
	leal	-1(%rbx), %edi
	subl	$2, %ebx
	call	fib
	cmpl	$1, %ebx
	ja	.L68
	subl	$2, %ebp
	movl	%ebp, %ebx
	cmpl	$1, %ebp
	ja	.L68
.L77:
	je	.L69
	movl	$-2, %ebp
	jmp	.L70
	.cfi_endproc
.LFE69:
	.size	compute_task, .-compute_task
	.section	.rodata.str1.1
.LC4:
	.string	"Failed at init"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB71:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	roxy_init@PLT
	testl	%eax, %eax
	jne	.L84
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$10, %esi
	leaq	idle_task(%rip), %rcx
	movl	$100, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	je	.L85
.L80:
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L85:
	.cfi_restore_state
	movl	$1, %esi
	movl	$100, %edi
	call	roxy_task_start@PLT
	testl	%eax, %eax
	jne	.L80
	movl	$12, %edx
	movl	$20, %esi
	movl	$30, %edi
	call	roxy_mqueue_create@PLT
	testl	%eax, %eax
	jne	.L80
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$3, %esi
	leaq	send_task(%rip), %rcx
	movl	$102, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	jne	.L80
	movl	$1, %esi
	movl	$102, %edi
	call	roxy_task_start@PLT
	testl	%eax, %eax
	jne	.L80
	movl	$100, %edi
	call	roxy_loop@PLT
	testl	%eax, %eax
	jne	.L80
	call	roxy_clean@PLT
	jmp	.L80
.L84:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L80
	.cfi_endproc
.LFE71:
	.size	main, .-main
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
