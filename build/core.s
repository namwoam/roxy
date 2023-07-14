	.file	"core.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"ROXY-DEBUG: Priority provided by the os: %d\n"
	.align 8
.LC2:
	.string	"ROXY-DEBUG: Priority defined by roxy: %d\n"
	.text
	.p2align 4
	.globl	roxy_init
	.type	roxy_init, @function
roxy_init:
.LFB47:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$8080, %edi
	call	srand@PLT
	leaq	roxy_tasks(%rip), %rax
	movq	.LC0(%rip), %rdx
	pxor	%xmm1, %xmm1
	leaq	9216(%rax), %rcx
	pcmpeqd	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L2:
	movq	%rdx, (%rax)
	addq	$72, %rax
	movups	%xmm1, -64(%rax)
	movups	%xmm1, -48(%rax)
	movups	%xmm0, -32(%rax)
	movups	%xmm0, -16(%rax)
	cmpq	%rcx, %rax
	jne	.L2
	movl	$2, %edi
	call	sched_get_priority_max@PLT
	movl	$2, %edi
	movl	%eax, %ebx
	call	sched_get_priority_min@PLT
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	subl	%eax, %ebx
	xorl	%eax, %eax
	movl	%ebx, %edx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movl	$64, %edx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	cmpl	$63, %ebx
	popq	%rbx
	.cfi_def_cfa_offset 8
	setle	%al
	ret
	.cfi_endproc
.LFE47:
	.size	roxy_init, .-roxy_init
	.p2align 4
	.globl	roxy_task_create
	.type	roxy_task_create, @function
roxy_task_create:
.LFB48:
	.cfi_startproc
	endbr64
	movq	%r8, %xmm4
	movq	%rdx, %xmm1
	movq	%rcx, %xmm3
	movl	$2, %r8d
	movq	%r9, %xmm0
	movd	%edi, %xmm2
	movd	%esi, %xmm5
	punpcklqdq	%xmm3, %xmm1
	punpcklqdq	%xmm4, %xmm0
	punpckldq	%xmm5, %xmm2
	cmpl	$127, %edi
	ja	.L6
	movl	%edi, %edi
	leaq	roxy_tasks(%rip), %rcx
	leaq	(%rdi,%rdi,8), %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	cmpl	$-1, (%rdx)
	je	.L6
	movq	%xmm2, (%rcx,%rax)
	xorl	%r8d, %r8d
	movups	%xmm1, 8(%rdx)
	movups	%xmm0, 24(%rdx)
.L6:
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE48:
	.size	roxy_task_create, .-roxy_task_create
	.p2align 4
	.globl	roxy_thread_runner
	.type	roxy_thread_runner, @function
roxy_thread_runner:
.LFB49:
	.cfi_startproc
	endbr64
	movl	%edi, %edi
	leaq	roxy_tasks(%rip), %rax
	leaq	(%rdi,%rdi,8), %rdx
	movq	16(%rax,%rdx,8), %rdx
	xorl	%eax, %eax
	jmp	*%rdx
	.cfi_endproc
.LFE49:
	.size	roxy_thread_runner, .-roxy_thread_runner
	.p2align 4
	.globl	roxy_task_start
	.type	roxy_task_start, @function
roxy_task_start:
.LFB50:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jne	.L13
	ret
	.p2align 4,,10
	.p2align 3
.L13:
	movl	$2, %eax
	ret
	.cfi_endproc
.LFE50:
	.size	roxy_task_start, .-roxy_task_start
	.p2align 4
	.globl	roxy_task_suspend
	.type	roxy_task_suspend, @function
roxy_task_suspend:
.LFB51:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE51:
	.size	roxy_task_suspend, .-roxy_task_suspend
	.local	roxy_tasks
	.comm	roxy_tasks,9216,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-1
	.long	-1
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
