	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"roxy idle on cpu:%d %s"
	.text
	.p2align 4
	.globl	idle_task
	.type	idle_task, @function
idle_task:
.LFB67:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	.LC0(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
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
	movq	%rax, %r12
	xorl	%eax, %eax
	call	sched_getcpu@PLT
	movq	%rbp, %rsi
	movq	%r12, %rcx
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$1, %esi
	movl	$10, %edi
	call	roxy_task_wait@PLT
	jmp	.L2
	.cfi_endproc
.LFE67:
	.size	idle_task, .-idle_task
	.section	.rodata.str1.1
.LC1:
	.string	"Clock: Clock ticking"
	.text
	.p2align 4
	.globl	clock_task
	.type	clock_task, @function
clock_task:
.LFB69:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC1(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rbx, %rdi
	call	puts@PLT
	xorl	%edi, %edi
	call	roxy_event_send@PLT
	movl	$1, %esi
	movl	$4, %edi
	call	roxy_task_wait@PLT
	jmp	.L7
	.cfi_endproc
.LFE69:
	.size	clock_task, .-clock_task
	.section	.rodata.str1.1
.LC2:
	.string	"Display: Clock ticked!"
	.text
	.p2align 4
	.globl	display_clock
	.type	display_clock, @function
display_clock:
.LFB70:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC2(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L10:
	xorl	%edi, %edi
	call	roxy_event_receive@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	jmp	.L10
	.cfi_endproc
.LFE70:
	.size	display_clock, .-display_clock
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
	jbe	.L55
	cmpl	$1, 8(%rsp)
	jbe	.L56
.L14:
	movl	8(%rsp), %eax
	movl	$0, 24(%rsp)
	subl	$1, %eax
	movl	%eax, 12(%rsp)
	cmpl	$1, 12(%rsp)
	movl	%eax, 36(%rsp)
	je	.L57
.L17:
	movl	12(%rsp), %eax
	movl	$0, 28(%rsp)
	subl	$1, %eax
	movl	%eax, 16(%rsp)
	cmpl	$1, 16(%rsp)
	movl	%eax, 40(%rsp)
	je	.L58
.L20:
	movl	16(%rsp), %eax
	movl	$0, 32(%rsp)
	subl	$1, %eax
	movl	%eax, 48(%rsp)
	movl	%eax, %r11d
.L24:
	cmpl	$1, %r11d
	je	.L59
	leal	-1(%r11), %eax
	xorl	%ecx, %ecx
	movl	%eax, 44(%rsp)
	movl	%eax, %ebp
.L27:
	cmpl	$1, %ebp
	je	.L60
	leal	-1(%rbp), %esi
	xorl	%r12d, %r12d
	movl	%esi, %edx
.L30:
	cmpl	$1, %edx
	je	.L61
	leal	-2(%rdx), %r8d
	xorl	%r15d, %r15d
	movl	%r8d, %r9d
.L33:
	leal	1(%r9), %eax
	movl	%r9d, %ebx
	xorl	%r13d, %r13d
	cmpl	$1, %eax
	jbe	.L62
	movl	%ebx, %r10d
	xorl	%r14d, %r14d
	cmpl	$1, %ebx
	je	.L63
	.p2align 4,,10
	.p2align 3
.L35:
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
	ja	.L35
	addl	$1, %r14d
	leal	-2(%rbx), %eax
	subl	$1, %ebx
	addl	%r14d, %r13d
	cmpl	$1, %ebx
	jbe	.L64
.L47:
	movl	%eax, %ebx
	xorl	%r14d, %r14d
	movl	%ebx, %r10d
	cmpl	$1, %ebx
	jne	.L35
.L63:
	movl	$1, %r14d
	leal	-2(%rbx), %eax
	subl	$1, %ebx
	addl	%r14d, %r13d
	cmpl	$1, %ebx
	ja	.L47
.L64:
	addl	$1, %r13d
	leal	-2(%r9), %eax
	addl	%r13d, %r15d
	cmpl	$1, %r9d
	ja	.L45
.L67:
	addl	$1, %r15d
	subl	$1, %edx
	addl	%r15d, %r12d
	cmpl	$1, %edx
	ja	.L43
.L66:
	addl	$1, %r12d
.L31:
	addl	%r12d, %ecx
	subl	$2, %ebp
	cmpl	$1, %esi
	ja	.L27
	addl	$1, %ecx
.L28:
	addl	%ecx, 32(%rsp)
	subl	$2, %r11d
	cmpl	$1, 44(%rsp)
	ja	.L24
	movl	32(%rsp), %eax
	addl	$1, %eax
.L25:
	addl	%eax, 28(%rsp)
	movl	16(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 48(%rsp)
	jbe	.L65
	movl	%eax, 16(%rsp)
	cmpl	$1, 16(%rsp)
	jne	.L20
.L58:
	movl	$0, 48(%rsp)
	movl	$1, %eax
	jmp	.L25
.L61:
	movl	$1, %r15d
	subl	$1, %edx
	movl	$-1, %r8d
	addl	%r15d, %r12d
	cmpl	$1, %edx
	jbe	.L66
.L43:
	movl	%r8d, %edx
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L62:
	movl	$1, %r13d
	leal	-2(%r9), %eax
	addl	%r13d, %r15d
	cmpl	$1, %r9d
	jbe	.L67
.L45:
	movl	%eax, %r9d
	jmp	.L33
.L60:
	movl	$1, %r12d
	xorl	%esi, %esi
	jmp	.L31
.L59:
	movl	$0, 44(%rsp)
	movl	$1, %ecx
	jmp	.L28
.L65:
	movl	28(%rsp), %eax
	addl	$1, %eax
.L22:
	addl	%eax, 24(%rsp)
	movl	12(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 40(%rsp)
	jbe	.L68
	movl	%eax, 12(%rsp)
	cmpl	$1, 12(%rsp)
	jne	.L17
.L57:
	movl	$0, 40(%rsp)
	movl	$1, %eax
	jmp	.L22
.L68:
	movl	24(%rsp), %eax
	addl	$1, %eax
.L19:
	addl	%eax, 20(%rsp)
	movl	8(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 36(%rsp)
	jbe	.L69
	movl	%eax, 8(%rsp)
	cmpl	$1, 8(%rsp)
	ja	.L14
.L56:
	movl	8(%rsp), %edi
	movl	$1, %eax
	subl	$1, %edi
	movl	%edi, 36(%rsp)
	jmp	.L19
.L69:
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
.L55:
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
	.section	.rodata.str1.1
.LC3:
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
	jne	.L76
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$10, %esi
	leaq	idle_task(%rip), %rcx
	movl	$100, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	je	.L77
.L72:
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L77:
	.cfi_restore_state
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$10, %esi
	leaq	clock_task(%rip), %rcx
	movl	$104, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	jne	.L72
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$10, %esi
	leaq	display_clock(%rip), %rcx
	movl	$105, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	jne	.L72
	movl	$1, %esi
	movl	$100, %edi
	call	roxy_task_start@PLT
	testl	%eax, %eax
	jne	.L72
	movl	$1, %esi
	movl	$104, %edi
	call	roxy_task_start@PLT
	testl	%eax, %eax
	jne	.L72
	movl	$1, %esi
	movl	$105, %edi
	call	roxy_task_start@PLT
	testl	%eax, %eax
	jne	.L72
	movl	$100, %edi
	call	roxy_loop@PLT
	testl	%eax, %eax
	jne	.L72
	call	roxy_clean@PLT
	jmp	.L72
.L76:
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	jmp	.L72
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
