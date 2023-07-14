	.file	"core.c"
	.text
	.p2align 4
	.globl	roxy_thread_runner
	.type	roxy_thread_runner, @function
roxy_thread_runner:
.LFB49:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	roxy_threads(%rip), %rbp
	leaq	roxy_tasks(%rip), %rdx
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	4(%rdi), %eax
	salq	$4, %rax
	movl	$1, 8(%rbp,%rax)
	movl	(%rdi), %eax
	leaq	(%rax,%rax,8), %rcx
	xorl	%eax, %eax
	call	*16(%rdx,%rcx,8)
	movl	4(%rbx), %eax
	salq	$4, %rax
	movl	$2, 8(%rbp,%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE49:
	.size	roxy_thread_runner, .-roxy_thread_runner
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
.L5:
	movq	%rdx, (%rax)
	addq	$72, %rax
	movups	%xmm1, -64(%rax)
	movups	%xmm1, -48(%rax)
	movups	%xmm0, -32(%rax)
	movups	%xmm0, -16(%rax)
	cmpq	%rcx, %rax
	jne	.L5
	leaq	8+roxy_threads(%rip), %rax
	leaq	16384(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$0, (%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L6
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
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"ROXY-DEBUG: Task id out-of-bound or task already existed"
	.text
	.p2align 4
	.globl	roxy_task_create
	.type	roxy_task_create, @function
roxy_task_create:
.LFB48:
	.cfi_startproc
	endbr64
	movq	%rdx, %xmm1
	movq	%rcx, %xmm3
	movq	%r9, %xmm0
	movq	%r8, %xmm4
	movd	%edi, %xmm2
	movd	%esi, %xmm5
	punpcklqdq	%xmm3, %xmm1
	punpcklqdq	%xmm4, %xmm0
	punpckldq	%xmm5, %xmm2
	cmpl	$127, %edi
	ja	.L11
	movl	%edi, %edi
	leaq	roxy_tasks(%rip), %rcx
	leaq	(%rdi,%rdi,8), %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	cmpl	$-1, (%rdx)
	je	.L16
.L11:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	movq	%xmm2, (%rcx,%rax)
	xorl	%eax, %eax
	movups	%xmm1, 8(%rdx)
	movups	%xmm0, 24(%rdx)
	ret
	.cfi_endproc
.LFE48:
	.size	roxy_task_create, .-roxy_task_create
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"ROXY-DEBUG: Failed to start the task (task_id=%d)\n"
	.align 8
.LC5:
	.string	"ROXY-DEBUG: The task (task_id=%d) was already started\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"mlockall failed: %m\n"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"ROXY-DEBUG: init pthread attributes failed"
	.align 8
.LC8:
	.string	"ROXY-DEBUG: pthread setstacksize failed"
	.align 8
.LC9:
	.string	"ROXY-DEBUG: pthread setschedpolicy failed"
	.align 8
.LC10:
	.string	"ROXY-DEBUG: pthread setschedparam failed"
	.align 8
.LC11:
	.string	"ROXY-DEBUG: pthread setinheritsched failed"
	.align 8
.LC12:
	.string	"ROXY-DEBUG: create compute pthread failed"
	.text
	.p2align 4
	.globl	roxy_task_start
	.type	roxy_task_start, @function
roxy_task_start:
.LFB50:
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
	movl	%edi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	%esi, 12(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	cmpl	$128, %edi
	ja	.L18
	movl	%edi, %edx
	leaq	roxy_tasks(%rip), %rcx
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rcx,%rax,8), %rax
	cmpl	$-1, (%rax)
	je	.L18
	cmpl	$8, %esi
	ja	.L18
	cmpl	$-1, 40(%rax)
	jne	.L22
	cmpl	$-1, 44(%rax)
	jne	.L22
	cmpl	$-1, 48(%rax)
	jne	.L22
	cmpl	$-1, 52(%rax)
	jne	.L22
	cmpl	$-1, 56(%rax)
	jne	.L22
	cmpl	$-1, 60(%rax)
	jne	.L22
	cmpl	$-1, 64(%rax)
	jne	.L22
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rcx,%rax,8), %rsi
	cmpl	$-1, 68(%rsi)
	movq	%rsi, 16(%rsp)
	jne	.L22
	movl	12(%rsp), %ebx
	testl	%ebx, %ebx
	je	.L24
	leal	-1(%rbx), %edx
	movq	%rsi, %r12
	leaq	(%rdx,%rax,2), %rdx
	leaq	4+roxy_tasks(%rip), %rax
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 24(%rsp)
.L34:
	movl	$3, %edi
	call	mlockall@PLT
	cmpl	$-1, %eax
	je	.L48
	leaq	48(%rsp), %r14
	movq	%r14, %rdi
	call	pthread_attr_init@PLT
	testl	%eax, %eax
	jne	.L49
	movl	$75, %edi
	call	__sysconf@PLT
	movq	%r14, %rdi
	movq	%rax, %rsi
	call	pthread_attr_setstacksize@PLT
	testl	%eax, %eax
	jne	.L50
	movl	$2, %esi
	movq	%r14, %rdi
	call	pthread_attr_setschedpolicy@PLT
	testl	%eax, %eax
	jne	.L51
	movq	16(%rsp), %rax
	leaq	36(%rsp), %rsi
	movq	%r14, %rdi
	movl	4(%rax), %eax
	movl	%eax, 36(%rsp)
	call	pthread_attr_setschedparam@PLT
	testl	%eax, %eax
	jne	.L52
	movl	$1, %esi
	movq	%r14, %rdi
	call	pthread_attr_setinheritsched@PLT
	testl	%eax, %eax
	jne	.L53
	movl	$100, %ebx
	leaq	roxy_threads(%rip), %rbp
	leaq	roxy_thread_runner(%rip), %r15
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L32:
	salq	$4, %r9
	movl	%r8d, 40(%r12)
	movl	$1, 8(%rbp,%r9)
	subl	$1, %ebx
	je	.L54
.L31:
	call	rand@PLT
	cltd
	shrl	$22, %edx
	leal	(%rax,%rdx), %r8d
	andl	$1023, %r8d
	subl	%edx, %r8d
	movslq	%r8d, %r9
	movq	%r9, %rdi
	salq	$4, %rdi
	addq	%rbp, %rdi
	movl	8(%rdi), %eax
	testl	%eax, %eax
	jne	.L32
	leaq	40(%rsp), %rcx
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%r9, (%rsp)
	movl	%r8d, 8(%rsp)
	movl	$0, 44(%rsp)
	movl	%r13d, 40(%rsp)
	call	pthread_create@PLT
	movl	8(%rsp), %r8d
	movq	(%rsp), %r9
	testl	%eax, %eax
	je	.L32
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
.L27:
	movl	$2, %eax
.L17:
	movq	104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L55
	addq	$120, %rsp
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
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L22:
	movl	%r13d, %edx
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L17
.L54:
	addq	$4, %r12
	cmpq	24(%rsp), %r12
	jne	.L34
	xorl	%ebx, %ebx
.L35:
	movq	16(%rsp), %rax
	xorl	%esi, %esi
	movl	40(%rax,%rbx,4), %eax
	addq	$1, %rbx
	salq	$4, %rax
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	cmpl	%ebx, 12(%rsp)
	ja	.L35
.L24:
	xorl	%eax, %eax
	jmp	.L17
.L50:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	jmp	.L27
.L53:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	jmp	.L27
.L49:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	jmp	.L27
.L51:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L27
.L52:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L27
.L55:
	call	__stack_chk_fail@PLT
.L48:
	movl	$1, %edi
	leaq	.LC6(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$-2, %edi
	call	exit@PLT
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
	.local	roxy_threads
	.comm	roxy_threads,16384,32
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
