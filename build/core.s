	.file	"core.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"thread_id:%d pthread_id:%lu running on os thread:%d\n"
	.text
	.p2align 4
	.globl	roxy_thread_runner
	.type	roxy_thread_runner, @function
roxy_thread_runner:
.LFB68:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	roxy_threads(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	4(%rdi), %r12d
	movq	%rdi, %rbx
	salq	$4, %r12
	call	gettid@PLT
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	%eax, 12(%rbp,%r12)
	movl	4(%rbx), %eax
	leaq	roxy_tasks(%rip), %r12
	movq	%rax, %rdx
	salq	$4, %rax
	addq	%rbp, %rax
	movl	12(%rax), %r8d
	movq	(%rax), %rcx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	(%rbx), %eax
	leaq	(%rax,%rax,8), %rdx
	movq	8(%r12,%rdx,8), %rdx
	testq	%rdx, %rdx
	je	.L2
	xorl	%eax, %eax
	call	*%rdx
	movl	(%rbx), %eax
.L2:
	leaq	(%rax,%rax,8), %rdx
	movq	16(%r12,%rdx,8), %rdx
	testq	%rdx, %rdx
	je	.L3
	xorl	%eax, %eax
	call	*%rdx
	movl	(%rbx), %eax
.L3:
	leaq	(%rax,%rax,8), %rax
	movq	32(%r12,%rax,8), %rdx
	testq	%rdx, %rdx
	je	.L4
	xorl	%eax, %eax
	call	*%rdx
.L4:
	movl	4(%rbx), %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	salq	$4, %rax
	movl	$2, 8(%rbp,%rax)
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE68:
	.size	roxy_thread_runner, .-roxy_thread_runner
	.section	.rodata.str1.8
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
.LFB65:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$8080, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	srand@PLT
	leaq	roxy_tasks(%rip), %rax
	pxor	%xmm1, %xmm1
	pcmpeqd	%xmm0, %xmm0
	leaq	9216(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L17:
	movl	$0, (%rax)
	addq	$72, %rax
	movl	$-1, -68(%rax)
	movups	%xmm1, -64(%rax)
	movups	%xmm1, -48(%rax)
	movups	%xmm0, -32(%rax)
	movups	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L17
	leaq	8+roxy_threads(%rip), %rax
	leaq	16384(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L18:
	movl	$0, (%rax)
	addq	$16, %rax
	movl	$-1, -12(%rax)
	cmpq	%rax, %rdx
	jne	.L18
	leaq	roxy_critical_sections(%rip), %rbx
	leaq	640(%rbx), %rbp
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%rbx, %rdi
	xorl	%esi, %esi
	addq	$40, %rbx
	call	pthread_mutex_init@PLT
	cmpq	%rbp, %rbx
	jne	.L19
	leaq	roxy_mqueues(%rip), %rax
	leaq	10240(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L20:
	movb	$0, (%rax)
	addq	$80, %rax
	cmpq	%rdx, %rax
	jne	.L20
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
	setle	%al
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE65:
	.size	roxy_init, .-roxy_init
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"ROXY-DEBUG: Failed to unlink the mqueue (mqueue_id=%d , channel_name=%s) error_code=%d\n"
	.align 8
.LC4:
	.string	"Successfully unlink mqueue (mqueue_id=%d , channel_name=%s)\n"
	.text
	.p2align 4
	.globl	roxy_clean
	.type	roxy_clean, @function
roxy_clean:
.LFB66:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	roxy_mqueues(%rip), %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	.LC4(%rip), %rbx
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%r12, %rdi
	call	mq_unlink@PLT
	testl	%eax, %eax
	jne	.L37
	movq	%r12, %rcx
	movl	%r13d, %edx
	movq	%rbx, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movb	$0, (%r12)
.L28:
	addl	$1, %r13d
	addq	$80, %r12
	cmpl	$128, %r13d
	je	.L26
.L30:
	cmpb	$32, (%r12)
	jne	.L31
	cmpb	$0, 1(%r12)
	je	.L28
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L37:
	movl	%eax, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L26:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
	.size	roxy_clean, .-roxy_clean
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"ROXY-DEBUG: task_id out-of-bound or task already existed"
	.text
	.p2align 4
	.globl	roxy_task_create
	.type	roxy_task_create, @function
roxy_task_create:
.LFB67:
	.cfi_startproc
	endbr64
	movq	%rdx, %xmm1
	movq	%rcx, %xmm2
	movq	%r9, %xmm0
	movq	%r8, %xmm3
	punpcklqdq	%xmm2, %xmm1
	punpcklqdq	%xmm3, %xmm0
	cmpl	$127, %edi
	ja	.L39
	movl	%edi, %edi
	leaq	roxy_tasks(%rip), %rax
	leaq	(%rdi,%rdi,8), %rdx
	leaq	(%rax,%rdx,8), %rdx
	movl	(%rdx), %eax
	testl	%eax, %eax
	je	.L44
.L39:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L44:
	movl	$1, (%rdx)
	movl	%esi, 4(%rdx)
	movups	%xmm1, 8(%rdx)
	movups	%xmm0, 24(%rdx)
	ret
	.cfi_endproc
.LFE67:
	.size	roxy_task_create, .-roxy_task_create
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"ROXY-DEBUG: Failed to start the task (task_id=%d)\n"
	.align 8
.LC7:
	.string	"ROXY-DEBUG: The task (task_id=%d) was already started\n"
	.align 8
.LC8:
	.string	"ROXY-DEBUG: init pthread attributes failed"
	.align 8
.LC9:
	.string	"ROXY-DEBUG: pthread setstacksize failed"
	.align 8
.LC10:
	.string	"ROXY-DEBUG: pthread setschedpolicy failed"
	.align 8
.LC11:
	.string	"ROXY-DEBUG: pthread setschedparam failed"
	.align 8
.LC12:
	.string	"ROXY-DEBUG: pthread setinheritsched failed"
	.align 8
.LC13:
	.string	"ROXY-DEBUG: Failed to lock the critical section mutex (section_id=%d)\n"
	.align 8
.LC14:
	.string	"ROXY-DEBUG: create compute pthread failed"
	.align 8
.LC15:
	.string	"ROXY-DEBUG: Failed to unlock the critical section mutex (section_id=%d)\n"
	.text
	.p2align 4
	.globl	roxy_task_start
	.type	roxy_task_start, @function
roxy_task_start:
.LFB69:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
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
	subq	$280, %rsp
	.cfi_def_cfa_offset 336
	movq	%fs:40, %rax
	movq	%rax, 264(%rsp)
	xorl	%eax, %eax
	cmpl	$128, %edi
	ja	.L46
	movl	%edi, %eax
	leaq	roxy_tasks(%rip), %rcx
	movq	%rax, 40(%rsp)
	leaq	(%rax,%rax,8), %rax
	leaq	(%rcx,%rax,8), %rax
	movl	(%rax), %edx
	testl	%edx, %edx
	je	.L46
	movl	%esi, %edx
	cmpl	$8, %esi
	ja	.L46
	cmpl	$-1, 40(%rax)
	jne	.L50
	cmpl	$-1, 44(%rax)
	jne	.L50
	cmpl	$-1, 48(%rax)
	jne	.L50
	cmpl	$-1, 52(%rax)
	jne	.L50
	cmpl	$-1, 56(%rax)
	jne	.L50
	cmpl	$-1, 60(%rax)
	jne	.L50
	cmpl	$-1, 64(%rax)
	jne	.L50
	movq	40(%rsp), %rax
	leaq	(%rax,%rax,8), %rsi
	leaq	roxy_tasks(%rip), %rax
	leaq	(%rax,%rsi,8), %r13
	cmpl	$-1, 68(%r13)
	jne	.L50
	leaq	136(%rsp), %r8
	xorl	%eax, %eax
	movl	$15, %ecx
	movq	$3, 128(%rsp)
	movq	%r8, %rdi
	rep stosq
	testl	%edx, %edx
	je	.L52
	leal	-1(%rdx), %eax
	movq	%r13, 24(%rsp)
	leaq	64(%rsp), %r12
	leaq	(%rax,%rsi,2), %rdx
	leaq	4+roxy_tasks(%rip), %rax
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L66:
	movq	%r12, %rdi
	call	pthread_attr_init@PLT
	testl	%eax, %eax
	jne	.L76
	movl	$75, %edi
	call	__sysconf@PLT
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	pthread_attr_setstacksize@PLT
	testl	%eax, %eax
	jne	.L77
	movl	$2, %esi
	movq	%r12, %rdi
	call	pthread_attr_setschedpolicy@PLT
	testl	%eax, %eax
	jne	.L78
	movq	24(%rsp), %rax
	leaq	52(%rsp), %rsi
	movq	%r12, %rdi
	movl	4(%rax), %eax
	movl	%eax, 52(%rsp)
	call	pthread_attr_setschedparam@PLT
	testl	%eax, %eax
	jne	.L79
	movl	$1, %esi
	movq	%r12, %rdi
	call	pthread_attr_setinheritsched@PLT
	testl	%eax, %eax
	jne	.L80
	leaq	roxy_critical_sections(%rip), %r15
	movq	%r15, %rdi
	call	pthread_mutex_lock@PLT
	testl	%eax, %eax
	jne	.L81
.L59:
	movl	$100, %ebx
	leaq	roxy_threads(%rip), %rbp
	jmp	.L63
	.p2align 4,,10
	.p2align 3
.L60:
	subl	$1, %ebx
	je	.L62
.L63:
	call	rand@PLT
	cltd
	shrl	$22, %edx
	leal	(%rax,%rdx), %r8d
	andl	$1023, %r8d
	subl	%edx, %r8d
	movslq	%r8d, %rdi
	salq	$4, %rdi
	addq	%rbp, %rdi
	movl	8(%rdi), %eax
	testl	%eax, %eax
	jne	.L60
	movl	$1, 8(%rdi)
	movd	%r8d, %xmm1
	movq	%r12, %rsi
	movd	%r14d, %xmm0
	punpckldq	%xmm1, %xmm0
	leaq	56(%rsp), %rcx
	movl	%r8d, 20(%rsp)
	leaq	roxy_thread_runner(%rip), %rdx
	movq	%rdi, 8(%rsp)
	movq	%xmm0, 56(%rsp)
	call	pthread_create@PLT
	movq	8(%rsp), %rdi
	movl	20(%rsp), %r8d
	testl	%eax, %eax
	jne	.L82
	movq	(%rdi), %rdi
	movl	$128, %esi
	movl	%r8d, 8(%rsp)
	leaq	128(%rsp), %rdx
	call	pthread_setaffinity_np@PLT
	movl	8(%rsp), %r8d
	movl	%r8d, 40(%r13)
.L62:
	movq	%r15, %rdi
	call	pthread_mutex_unlock@PLT
	testl	%eax, %eax
	jne	.L83
	addq	$4, %r13
	cmpq	32(%rsp), %r13
	jne	.L66
.L52:
	movq	40(%rsp), %rax
	leaq	roxy_tasks(%rip), %rcx
	leaq	(%rax,%rax,8), %rax
	movl	$2, (%rcx,%rax,8)
	xorl	%eax, %eax
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L46:
	movl	%r14d, %edx
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L45:
	movq	264(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L84
	addq	$280, %rsp
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
.L81:
	.cfi_restore_state
	xorl	%edx, %edx
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L59
.L83:
	xorl	%edx, %edx
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$4, %r13
	cmpq	32(%rsp), %r13
	jne	.L66
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L50:
	movl	%r14d, %edx
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L45
.L78:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
.L54:
	movl	$2, %eax
	jmp	.L45
.L77:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L54
.L76:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	jmp	.L54
.L80:
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	jmp	.L54
.L79:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	jmp	.L54
.L82:
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L54
.L84:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE69:
	.size	roxy_task_start, .-roxy_task_start
	.p2align 4
	.globl	roxy_task_suspend
	.type	roxy_task_suspend, @function
roxy_task_suspend:
.LFB70:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE70:
	.size	roxy_task_suspend, .-roxy_task_suspend
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"ROXY-DEBUG: Invalid wait option"
	.align 8
.LC17:
	.string	"ROXY-DEBUG: Error occurred during wait (might be integer overflow)"
	.text
	.p2align 4
	.globl	roxy_task_wait
	.type	roxy_task_wait, @function
roxy_task_wait:
.LFB71:
	.cfi_startproc
	endbr64
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	jne	.L87
	movl	%edi, %eax
	pxor	%xmm0, %xmm0
	movq	%rax, 8(%rsp)
.L88:
	movhps	8(%rsp), %xmm0
	leaq	32(%rsp), %rsi
	leaq	16(%rsp), %rdi
	movaps	%xmm0, 16(%rsp)
	call	nanosleep@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	cmpl	$-1, %r8d
	je	.L94
.L86:
	movq	56(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L95
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L87:
	.cfi_restore_state
	cmpl	$1, %esi
	jne	.L89
	movq	$0, 8(%rsp)
	movd	%edi, %xmm0
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L89:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L94:
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L86
.L95:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE71:
	.size	roxy_task_wait, .-roxy_task_wait
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"ROXY-DEBUG: Failed to find the task (task_id=%d)\n"
	.align 8
.LC19:
	.string	"ROXY-DEBUG: Task must be in the loaded state to set priority, task_id=%d\n"
	.text
	.p2align 4
	.globl	roxy_task_set_priority
	.type	roxy_task_set_priority, @function
roxy_task_set_priority:
.LFB72:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	%edi, %edx
	cmpl	$127, %edi
	ja	.L97
	movl	%edi, %eax
	leaq	(%rax,%rax,8), %rcx
	leaq	roxy_tasks(%rip), %rax
	leaq	(%rax,%rcx,8), %rcx
	movl	(%rcx), %eax
	testl	%eax, %eax
	je	.L97
	cmpl	$1, %eax
	jne	.L102
	movl	%esi, 4(%rcx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L97:
	.cfi_restore_state
	leaq	.LC18(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L99:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L102:
	.cfi_restore_state
	leaq	.LC19(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L99
	.cfi_endproc
.LFE72:
	.size	roxy_task_set_priority, .-roxy_task_set_priority
	.p2align 4
	.globl	roxy_critical_section_enter
	.type	roxy_critical_section_enter, @function
roxy_critical_section_enter:
.LFB73:
	.cfi_startproc
	endbr64
	movl	$2, %eax
	cmpl	$15, %edi
	ja	.L109
	movl	%edi, %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	leaq	(%rax,%rax,4), %rdx
	leaq	roxy_critical_sections(%rip), %rax
	leaq	(%rax,%rdx,8), %rdi
	call	pthread_mutex_lock@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L112
.L103:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L109:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L112:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L103
	.cfi_endproc
.LFE73:
	.size	roxy_critical_section_enter, .-roxy_critical_section_enter
	.p2align 4
	.globl	roxy_critical_section_leave
	.type	roxy_critical_section_leave, @function
roxy_critical_section_leave:
.LFB74:
	.cfi_startproc
	endbr64
	movl	$2, %eax
	cmpl	$15, %edi
	ja	.L119
	movl	%edi, %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	leaq	(%rax,%rax,4), %rdx
	leaq	roxy_critical_sections(%rip), %rax
	leaq	(%rax,%rdx,8), %rdi
	call	pthread_mutex_unlock@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L122
.L113:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L119:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L122:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L113
	.cfi_endproc
.LFE74:
	.size	roxy_critical_section_leave, .-roxy_critical_section_leave
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"ROXY-DEBUG: Failed to join the thread: thread_id=%lu, error_code=%d\n"
	.text
	.p2align 4
	.globl	roxy_loop
	.type	roxy_loop, @function
roxy_loop:
.LFB75:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cmpl	$127, %edi
	ja	.L124
	movl	%edi, %ebx
	leaq	roxy_tasks(%rip), %r12
	leaq	(%rbx,%rbx,8), %rax
	leaq	(%r12,%rax,8), %rax
	movl	(%rax), %edx
	testl	%edx, %edx
	je	.L124
	movl	40(%rax), %eax
	cmpl	$-1, %eax
	jne	.L171
.L127:
	leaq	(%rbx,%rbx,8), %rax
	movl	44(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L172
.L129:
	leaq	(%rbx,%rbx,8), %rax
	movl	48(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L173
.L130:
	leaq	(%rbx,%rbx,8), %rax
	movl	52(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L174
.L131:
	leaq	(%rbx,%rbx,8), %rax
	movl	56(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L175
.L132:
	leaq	(%rbx,%rbx,8), %rax
	movl	60(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L176
.L133:
	leaq	(%rbx,%rbx,8), %rax
	movl	64(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L177
.L134:
	leaq	(%rbx,%rbx,8), %rax
	movl	68(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L178
.L135:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L171:
	.cfi_restore_state
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L127
	xorl	%edx, %edx
.L128:
	leaq	(%rbx,%rbx,8), %rcx
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	leaq	8(%rdx,%rcx,2), %rdx
	movl	%eax, %ecx
	xorl	%eax, %eax
	movl	8(%r12,%rdx,4), %edx
	salq	$4, %rdx
	movq	0(%rbp,%rdx), %rdx
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$2, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L172:
	.cfi_restore_state
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L129
	movl	$1, %edx
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L173:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L130
	movl	$2, %edx
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L174:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L131
	movl	$3, %edx
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L175:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L132
	movl	$4, %edx
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L176:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L133
	movl	$5, %edx
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L177:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L134
	movl	$6, %edx
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L178:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	movl	$7, %edx
	testl	%eax, %eax
	je	.L135
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L124:
	movl	%edi, %edx
	leaq	.LC18(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_def_cfa_offset 24
	movl	$2, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE75:
	.size	roxy_loop, .-roxy_loop
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"ROXY-DEBUG: Failed to start the message queue (mqueue_id=%d)\n"
	.align 8
.LC22:
	.string	"ROXY-DEBUG: The message queue (mqueue_id=%d), has been initialized before\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC23:
	.string	"/%x"
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"ROXY-DEBUG: Failed to create message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n"
	.align 8
.LC25:
	.string	"ROXY-DEBUG: Failed to close message queue (mqueue_id=%d, channel_name=%s)\n"
	.text
	.p2align 4
	.globl	roxy_mqueue_create
	.type	roxy_mqueue_create, @function
roxy_mqueue_create:
.LFB76:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%edi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	cmpl	$127, %edi
	ja	.L187
	movl	%edi, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	cmpb	$0, (%r12)
	jne	.L188
	movl	%edi, %r8d
	movl	%esi, %ebp
	movl	%edx, %ebx
	movl	$1, %esi
	leaq	.LC23(%rip), %rcx
	movl	$11, %edx
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movl	%ebp, %eax
	movq	%r12, %rdi
	xorl	%ecx, %ecx
	movq	%rax, 24(%r12)
	movl	%ebx, %eax
	movl	$420, %edx
	movl	$66, %esi
	movq	%rax, 32(%r12)
	xorl	%eax, %eax
	movq	$0, 16(%r12)
	movq	$0, 40(%r12)
	movq	$0, 48(%r12)
	movq	$0, 56(%r12)
	movq	$0, 64(%r12)
	movq	$0, 72(%r12)
	call	mq_open@PLT
	movl	%eax, %edi
	cmpl	$-1, %eax
	je	.L189
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L190
.L179:
	addq	$8, %rsp
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
	.p2align 4,,10
	.p2align 3
.L188:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC22(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$2, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L187:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC21(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$2, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L189:
	.cfi_restore_state
	call	__errno_location@PLT
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	movl	(%rax), %r8d
	leaq	.LC24(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L179
	.p2align 4,,10
	.p2align 3
.L190:
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC25(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L179
	.cfi_endproc
.LFE76:
	.size	roxy_mqueue_create, .-roxy_mqueue_create
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"ROXY-DEBUG: The message queue (mqueue_id=%d), has not been initialized before\n"
	.align 8
.LC27:
	.string	"ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n"
	.align 8
.LC28:
	.string	"ROXY-DEBUG: Failed to transmit data on message queue (mqueue_id=%d, channel_name=%s) error_code=%d\n"
	.text
	.p2align 4
	.globl	roxy_mqueue_send
	.type	roxy_mqueue_send, @function
roxy_mqueue_send:
.LFB77:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	cmpl	$127, %edi
	ja	.L192
	movl	%edi, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	cmpb	$0, (%r12)
	je	.L192
	movq	%rsi, %rbp
	movq	%r12, %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	movl	%edx, %ebx
	call	mq_open@PLT
	movl	%eax, %r14d
	cmpl	$-1, %eax
	je	.L200
	xorl	%ecx, %ecx
	movl	%ebx, %edx
	movq	%rbp, %rsi
	movl	%eax, %edi
	call	mq_send@PLT
	testl	%eax, %eax
	jne	.L201
	movl	%r14d, %edi
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L202
.L191:
	popq	%rbx
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L192:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC26(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$2, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L200:
	.cfi_restore_state
	call	__errno_location@PLT
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	movl	(%rax), %r8d
	leaq	.LC27(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L201:
	movl	%eax, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC28(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$2, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L202:
	.cfi_restore_state
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC25(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L191
	.cfi_endproc
.LFE77:
	.size	roxy_mqueue_send, .-roxy_mqueue_send
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"ROXY-DEBUG: Invalid blocking option at roxy_mqueue_receive"
	.align 8
.LC30:
	.string	"ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s)\n"
	.align 8
.LC31:
	.string	"ROXY-DEBUG: Failed to receive data on message queue (mqueue_id=%d, channel_name=%s) error_code=%d\n"
	.text
	.p2align 4
	.globl	roxy_mqueue_receive
	.type	roxy_mqueue_receive, @function
roxy_mqueue_receive:
.LFB78:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	cmpl	$127, %edi
	ja	.L204
	movl	%edi, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	cmpb	$0, (%r12)
	je	.L204
	movq	%rsi, %rbp
	movl	%edx, %ebx
	cmpl	$1, %ecx
	je	.L215
	testl	%ecx, %ecx
	jne	.L209
	movl	$2048, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
.L208:
	cmpl	$-1, %r14d
	je	.L216
	xorl	%ecx, %ecx
	movl	%ebx, %edx
	movq	%rbp, %rsi
	movl	%r14d, %edi
	call	mq_receive@PLT
	testl	%eax, %eax
	jne	.L217
	movl	%r14d, %edi
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L218
.L203:
	popq	%rbx
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L204:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC26(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$2, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L209:
	.cfi_restore_state
	leaq	.LC29(%rip), %rdi
	call	puts@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$2, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L215:
	.cfi_restore_state
	xorl	%esi, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L217:
	movl	%eax, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC31(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$2, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L216:
	.cfi_restore_state
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC30(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L218:
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC25(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L203
	.cfi_endproc
.LFE78:
	.size	roxy_mqueue_receive, .-roxy_mqueue_receive
	.section	.rodata.str1.8
	.align 8
.LC32:
	.string	"ROXY-DEBUG: Failed to obtain the attribute of message queue (mqueue_id=%d, channel_name=%s)\n"
	.text
	.p2align 4
	.globl	roxy_mqueue_get_pending
	.type	roxy_mqueue_get_pending, @function
roxy_mqueue_get_pending:
.LFB79:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	%edi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	subq	$80, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	cmpl	$127, %edi
	ja	.L220
	movl	%edi, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	cmpb	$0, (%r12)
	je	.L220
	xorl	%esi, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r13d
	cmpl	$-1, %eax
	je	.L227
	movq	%rsp, %rsi
	movl	%eax, %edi
	call	mq_getattr@PLT
	testl	%eax, %eax
	jne	.L228
	movl	24(%rsp), %r13d
.L219:
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L229
	addq	$80, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movl	%r13d, %eax
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L220:
	.cfi_restore_state
	movl	%r14d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$-1, %r13d
	leaq	.LC26(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L219
.L227:
	movq	%r12, %rcx
	movl	%r14d, %edx
	leaq	.LC30(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	jmp	.L219
.L228:
	movq	%r12, %rcx
	movl	%r14d, %edx
	leaq	.LC32(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movl	$-1, %r13d
	call	__printf_chk@PLT
	jmp	.L219
.L229:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE79:
	.size	roxy_mqueue_get_pending, .-roxy_mqueue_get_pending
	.local	roxy_mqueues
	.comm	roxy_mqueues,10240,32
	.local	roxy_critical_sections
	.comm	roxy_critical_sections,640,32
	.local	roxy_threads
	.comm	roxy_threads,16384,32
	.local	roxy_tasks
	.comm	roxy_tasks,9216,32
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
