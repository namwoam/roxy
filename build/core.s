	.file	"core.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"ROXY-SYSTEM: thread_id:%d pthread_id:%lu running on os thread:%d\n"
	.text
	.p2align 4
	.globl	roxy_thread_runner
	.type	roxy_thread_runner, @function
roxy_thread_runner:
.LFB81:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	roxy_threads(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	4(%rdi), %ebp
	movq	%rdi, %rbx
	call	gettid@PLT
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %r8d
	movl	%ebp, %eax
	leaq	roxy_tasks(%rip), %rbp
	leaq	(%rax,%rax,2), %rax
	movl	%r8d, 12(%r12,%rax,8)
	movl	4(%rbx), %eax
	movq	%rax, %rdx
	leaq	(%rax,%rax,2), %rax
	leaq	(%r12,%rax,8), %rax
	movl	12(%rax), %r8d
	movq	(%rax), %rcx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	(%rbx), %eax
	leaq	(%rax,%rax,8), %rdx
	movq	8(%rbp,%rdx,8), %rdx
	testq	%rdx, %rdx
	je	.L2
	xorl	%eax, %eax
	call	*%rdx
	movl	(%rbx), %eax
.L2:
	leaq	(%rax,%rax,8), %rdx
	movq	16(%rbp,%rdx,8), %rdx
	testq	%rdx, %rdx
	je	.L3
	xorl	%eax, %eax
	call	*%rdx
	movl	(%rbx), %eax
.L3:
	leaq	(%rax,%rax,8), %rax
	movq	32(%rbp,%rax,8), %rdx
	testq	%rdx, %rdx
	je	.L4
	xorl	%eax, %eax
	call	*%rdx
.L4:
	movl	4(%rbx), %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	leaq	(%rax,%rax,2), %rax
	movl	$2, 8(%r12,%rax,8)
	xorl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE81:
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
.LFB78:
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
	leaq	24576(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L18:
	movl	$0, (%rax)
	addq	$24, %rax
	movl	$-1, -20(%rax)
	cmpq	%rdx, %rax
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
	cmpq	%rbx, %rbp
	jne	.L19
	leaq	roxy_mqueues(%rip), %rax
	leaq	10240(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L20:
	movb	$0, (%rax)
	addq	$80, %rax
	cmpq	%rax, %rdx
	jne	.L20
	leaq	roxy_events(%rip), %rbx
	leaq	98304(%rbx), %rbp
	.p2align 4,,10
	.p2align 3
.L21:
	movq	%rbx, %rdi
	xorl	%esi, %esi
	call	pthread_mutex_init@PLT
	leaq	40(%rbx), %rdi
	xorl	%esi, %esi
	addq	$96, %rbx
	call	pthread_cond_init@PLT
	movl	$0, -8(%rbx)
	cmpq	%rbp, %rbx
	jne	.L21
	leaq	roxy_interrupts(%rip), %rdx
	xorl	%eax, %eax
	movl	$64, %ecx
	movq	%rdx, %rdi
	rep stosq
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
.LFE78:
	.size	roxy_init, .-roxy_init
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"ROXY-DEBUG: Failed to unlink the mqueue (mqueue_id=%d , channel_name=%s) error_code=%d\n"
	.align 8
.LC4:
	.string	"ROXY-SYSTEM: Successfully unlink mqueue (mqueue_id=%d , channel_name=%s)\n"
	.text
	.p2align 4
	.globl	roxy_clean
	.type	roxy_clean, @function
roxy_clean:
.LFB79:
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
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L33:
	movq	%r12, %rdi
	call	mq_unlink@PLT
	testl	%eax, %eax
	jne	.L39
	movq	%r12, %rcx
	movl	%r13d, %edx
	movq	%rbx, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movb	$0, (%r12)
.L30:
	addl	$1, %r13d
	addq	$80, %r12
	cmpl	$128, %r13d
	je	.L28
.L32:
	cmpb	$32, (%r12)
	jne	.L33
	cmpb	$0, 1(%r12)
	je	.L30
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L39:
	movl	%eax, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L28:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE79:
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
.LFB80:
	.cfi_startproc
	endbr64
	movq	%rdx, %xmm1
	movq	%rcx, %xmm2
	movq	%r9, %xmm0
	movq	%r8, %xmm3
	punpcklqdq	%xmm2, %xmm1
	punpcklqdq	%xmm3, %xmm0
	cmpl	$127, %edi
	ja	.L41
	movl	%edi, %edi
	leaq	roxy_tasks(%rip), %rax
	leaq	(%rdi,%rdi,8), %rdx
	leaq	(%rax,%rdx,8), %rdx
	movl	(%rdx), %eax
	testl	%eax, %eax
	je	.L46
.L41:
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
.L46:
	movl	$1, (%rdx)
	movl	%esi, 4(%rdx)
	movups	%xmm1, 8(%rdx)
	movups	%xmm0, 24(%rdx)
	ret
	.cfi_endproc
.LFE80:
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
	.string	"ROXY-DEBUG: create compute pthread failed"
	.text
	.p2align 4
	.globl	roxy_task_start
	.type	roxy_task_start, @function
roxy_task_start:
.LFB82:
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
	subq	$264, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rax
	movq	%rax, 248(%rsp)
	xorl	%eax, %eax
	cmpl	$128, %edi
	ja	.L48
	movl	%edi, %eax
	leaq	roxy_tasks(%rip), %rcx
	movq	%rax, 24(%rsp)
	leaq	(%rax,%rax,8), %rax
	leaq	(%rcx,%rax,8), %rax
	movl	(%rax), %ecx
	testl	%ecx, %ecx
	je	.L48
	movl	%esi, %edx
	cmpl	$8, %esi
	ja	.L48
	cmpl	$-1, 40(%rax)
	jne	.L52
	cmpl	$-1, 44(%rax)
	jne	.L52
	cmpl	$-1, 48(%rax)
	jne	.L52
	cmpl	$-1, 52(%rax)
	jne	.L52
	cmpl	$-1, 56(%rax)
	jne	.L52
	cmpl	$-1, 60(%rax)
	jne	.L52
	cmpl	$-1, 64(%rax)
	jne	.L52
	movq	24(%rsp), %rax
	leaq	(%rax,%rax,8), %rsi
	leaq	roxy_tasks(%rip), %rax
	leaq	(%rax,%rsi,8), %r13
	cmpl	$-1, 68(%r13)
	jne	.L52
	leaq	120(%rsp), %r8
	movl	$15, %ecx
	xorl	%eax, %eax
	movq	$3, 112(%rsp)
	movq	%r8, %rdi
	rep stosq
	testl	%edx, %edx
	je	.L54
	leal	-1(%rdx), %eax
	leaq	48(%rsp), %r12
	movq	%r13, %r15
	leaq	(%rax,%rsi,2), %rdx
	leaq	4+roxy_tasks(%rip), %rax
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L64:
	movq	%r12, %rdi
	call	pthread_attr_init@PLT
	testl	%eax, %eax
	jne	.L73
	movl	$75, %edi
	call	__sysconf@PLT
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	pthread_attr_setstacksize@PLT
	testl	%eax, %eax
	jne	.L74
	movl	$2, %esi
	movq	%r12, %rdi
	call	pthread_attr_setschedpolicy@PLT
	testl	%eax, %eax
	jne	.L75
	movl	4(%r15), %eax
	leaq	44(%rsp), %rsi
	movq	%r12, %rdi
	movl	%eax, 44(%rsp)
	call	pthread_attr_setschedparam@PLT
	testl	%eax, %eax
	jne	.L76
	movl	$1, %esi
	movq	%r12, %rdi
	call	pthread_attr_setinheritsched@PLT
	testl	%eax, %eax
	jne	.L77
	movl	$100, %ebx
	leaq	roxy_threads(%rip), %rbp
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L61:
	subl	$1, %ebx
	je	.L63
.L60:
	call	rand@PLT
	cltd
	shrl	$22, %edx
	leal	(%rax,%rdx), %r8d
	andl	$1023, %r8d
	subl	%edx, %r8d
	movslq	%r8d, %rax
	leaq	(%rax,%rax,2), %rax
	salq	$3, %rax
	leaq	0(%rbp,%rax), %rdi
	movl	8(%rdi), %edx
	testl	%edx, %edx
	jne	.L61
	movl	$1, 8(%rdi)
	movd	%r8d, %xmm1
	movq	%r12, %rsi
	movd	%r14d, %xmm0
	punpckldq	%xmm1, %xmm0
	leaq	16(%rbp,%rax), %rcx
	leaq	roxy_thread_runner(%rip), %rdx
	movl	%r8d, 12(%rsp)
	movq	%rdi, (%rsp)
	movq	%xmm0, 16(%rbp,%rax)
	call	pthread_create@PLT
	movq	(%rsp), %rdi
	movl	12(%rsp), %r8d
	testl	%eax, %eax
	jne	.L78
	movq	(%rdi), %rdi
	leaq	112(%rsp), %rdx
	movl	$128, %esi
	movl	%r8d, (%rsp)
	call	pthread_setaffinity_np@PLT
	movl	(%rsp), %r8d
	movl	%r8d, 40(%r13)
.L63:
	addq	$4, %r13
	cmpq	16(%rsp), %r13
	jne	.L64
.L54:
	movq	24(%rsp), %rax
	leaq	roxy_tasks(%rip), %rcx
	leaq	(%rax,%rax,8), %rax
	movl	$2, (%rcx,%rax,8)
	xorl	%eax, %eax
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L48:
	movl	%r14d, %edx
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L47:
	movq	248(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L79
	addq	$264, %rsp
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
.L52:
	.cfi_restore_state
	movl	%r14d, %edx
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L47
.L75:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
.L56:
	movl	$2, %eax
	jmp	.L47
.L74:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L56
.L73:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	jmp	.L56
.L77:
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	jmp	.L56
.L76:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	jmp	.L56
.L78:
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	jmp	.L56
.L79:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE82:
	.size	roxy_task_start, .-roxy_task_start
	.p2align 4
	.globl	roxy_task_suspend
	.type	roxy_task_suspend, @function
roxy_task_suspend:
.LFB83:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE83:
	.size	roxy_task_suspend, .-roxy_task_suspend
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"ROXY-DEBUG: Invalid wait option"
	.align 8
.LC15:
	.string	"ROXY-DEBUG: Error occurred during wait (might be integer overflow)"
	.text
	.p2align 4
	.globl	roxy_task_wait
	.type	roxy_task_wait, @function
roxy_task_wait:
.LFB84:
	.cfi_startproc
	endbr64
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	jne	.L82
	movl	%edi, %eax
	pxor	%xmm0, %xmm0
	movq	%rax, 8(%rsp)
.L83:
	movhps	8(%rsp), %xmm0
	leaq	32(%rsp), %rsi
	leaq	16(%rsp), %rdi
	movaps	%xmm0, 16(%rsp)
	call	nanosleep@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	cmpl	$-1, %r8d
	je	.L89
.L81:
	movq	56(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L90
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L82:
	.cfi_restore_state
	cmpl	$1, %esi
	jne	.L84
	movq	$0, 8(%rsp)
	movd	%edi, %xmm0
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L84:
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L89:
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L81
.L90:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE84:
	.size	roxy_task_wait, .-roxy_task_wait
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"ROXY-DEBUG: Failed to find the task (task_id=%d)\n"
	.align 8
.LC17:
	.string	"ROXY-DEBUG: Task must be in the loaded state to set priority, task_id=%d\n"
	.text
	.p2align 4
	.globl	roxy_task_set_priority
	.type	roxy_task_set_priority, @function
roxy_task_set_priority:
.LFB85:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	%edi, %edx
	cmpl	$127, %edi
	ja	.L92
	movl	%edi, %eax
	leaq	(%rax,%rax,8), %rcx
	leaq	roxy_tasks(%rip), %rax
	leaq	(%rax,%rcx,8), %rcx
	movl	(%rcx), %eax
	testl	%eax, %eax
	je	.L92
	cmpl	$1, %eax
	jne	.L97
	movl	%esi, 4(%rcx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L92:
	.cfi_restore_state
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L94:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L97:
	.cfi_restore_state
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L94
	.cfi_endproc
.LFE85:
	.size	roxy_task_set_priority, .-roxy_task_set_priority
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"ROXY-DEBUG: Failed to lock the critical section mutex (section_id=%d)\n"
	.text
	.p2align 4
	.globl	roxy_critical_section_enter
	.type	roxy_critical_section_enter, @function
roxy_critical_section_enter:
.LFB86:
	.cfi_startproc
	endbr64
	movl	$2, %eax
	cmpl	$15, %edi
	ja	.L104
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
	jne	.L107
.L98:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L104:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L107:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC18(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L98
	.cfi_endproc
.LFE86:
	.size	roxy_critical_section_enter, .-roxy_critical_section_enter
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"ROXY-DEBUG: Failed to unlock the critical section mutex (section_id=%d)\n"
	.text
	.p2align 4
	.globl	roxy_critical_section_leave
	.type	roxy_critical_section_leave, @function
roxy_critical_section_leave:
.LFB87:
	.cfi_startproc
	endbr64
	movl	$2, %eax
	cmpl	$15, %edi
	ja	.L114
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
	jne	.L117
.L108:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L114:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L117:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC19(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L108
	.cfi_endproc
.LFE87:
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
.LFB88:
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
	ja	.L119
	movl	%edi, %ebx
	leaq	roxy_tasks(%rip), %r12
	leaq	(%rbx,%rbx,8), %rax
	leaq	(%r12,%rax,8), %rax
	movl	(%rax), %edx
	testl	%edx, %edx
	je	.L119
	movl	40(%rax), %eax
	cmpl	$-1, %eax
	jne	.L166
.L122:
	leaq	(%rbx,%rbx,8), %rax
	movl	44(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L167
.L124:
	leaq	(%rbx,%rbx,8), %rax
	movl	48(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L168
.L125:
	leaq	(%rbx,%rbx,8), %rax
	movl	52(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L169
.L126:
	leaq	(%rbx,%rbx,8), %rax
	movl	56(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L170
.L127:
	leaq	(%rbx,%rbx,8), %rax
	movl	60(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L171
.L128:
	leaq	(%rbx,%rbx,8), %rax
	movl	64(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L172
.L129:
	leaq	(%rbx,%rbx,8), %rax
	movl	68(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L173
.L130:
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
.L166:
	.cfi_restore_state
	leaq	roxy_threads(%rip), %rbp
	leaq	(%rax,%rax,2), %rax
	xorl	%esi, %esi
	movq	0(%rbp,%rax,8), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L122
	xorl	%edx, %edx
.L123:
	leaq	(%rbx,%rbx,8), %rcx
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	leaq	8(%rdx,%rcx,2), %rdx
	movl	%eax, %ecx
	xorl	%eax, %eax
	movl	8(%r12,%rdx,4), %edx
	leaq	(%rdx,%rdx,2), %rdx
	movq	0(%rbp,%rdx,8), %rdx
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
.L167:
	.cfi_restore_state
	leaq	roxy_threads(%rip), %rbp
	leaq	(%rax,%rax,2), %rax
	xorl	%esi, %esi
	movq	0(%rbp,%rax,8), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L124
	movl	$1, %edx
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L168:
	leaq	roxy_threads(%rip), %rbp
	leaq	(%rax,%rax,2), %rax
	xorl	%esi, %esi
	movq	0(%rbp,%rax,8), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L125
	movl	$2, %edx
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L169:
	leaq	roxy_threads(%rip), %rbp
	leaq	(%rax,%rax,2), %rax
	xorl	%esi, %esi
	movq	0(%rbp,%rax,8), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L126
	movl	$3, %edx
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L170:
	leaq	roxy_threads(%rip), %rbp
	leaq	(%rax,%rax,2), %rax
	xorl	%esi, %esi
	movq	0(%rbp,%rax,8), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L127
	movl	$4, %edx
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L171:
	leaq	roxy_threads(%rip), %rbp
	leaq	(%rax,%rax,2), %rax
	xorl	%esi, %esi
	movq	0(%rbp,%rax,8), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L128
	movl	$5, %edx
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L172:
	leaq	roxy_threads(%rip), %rbp
	leaq	(%rax,%rax,2), %rax
	xorl	%esi, %esi
	movq	0(%rbp,%rax,8), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L129
	movl	$6, %edx
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L173:
	leaq	(%rax,%rax,2), %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax,8), %rdi
	call	pthread_join@PLT
	movl	$7, %edx
	testl	%eax, %eax
	je	.L130
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L119:
	movl	%edi, %edx
	leaq	.LC16(%rip), %rsi
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
.LFE88:
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
.LFB89:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$80, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	cmpl	$127, %edi
	ja	.L183
	movl	%edi, %eax
	leaq	roxy_mqueues(%rip), %r13
	leaq	(%rax,%rax,4), %rbx
	salq	$4, %rbx
	addq	%rbx, %r13
	cmpb	$0, 0(%r13)
	jne	.L184
	movl	%edi, %r8d
	movl	%esi, %r14d
	movl	%edx, %ebp
	movl	$1, %esi
	leaq	.LC23(%rip), %rcx
	movl	$11, %edx
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movl	%r14d, %eax
	movq	%r13, %rdi
	movq	%rsp, %rcx
	movq	%rax, 8(%rsp)
	movl	%ebp, %eax
	movl	$420, %edx
	movdqa	32(%rsp), %xmm2
	movq	%rax, 16(%rsp)
	movdqa	48(%rsp), %xmm3
	movl	$524480, %esi
	leaq	16+roxy_mqueues(%rip), %rax
	movq	$0, (%rsp)
	movdqa	(%rsp), %xmm0
	addq	%rbx, %rax
	movq	$-1, 24(%rsp)
	movdqa	16(%rsp), %xmm1
	movaps	%xmm0, (%rax)
	movaps	%xmm1, 16(%rax)
	movaps	%xmm2, 32(%rax)
	movaps	%xmm3, 48(%rax)
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %edi
	cmpl	$-1, %eax
	je	.L185
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L186
.L174:
	movq	72(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L187
	addq	$80, %rsp
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
	.p2align 4,,10
	.p2align 3
.L184:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC22(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L183:
	movl	%edi, %edx
	leaq	.LC21(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L185:
	call	__errno_location@PLT
	movq	%r13, %rcx
	movl	%r12d, %edx
	movl	$1, %edi
	movl	(%rax), %r8d
	leaq	.LC24(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L186:
	movq	%r13, %rcx
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC25(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L174
.L187:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE89:
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
.LFB90:
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
	ja	.L189
	movl	%edi, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	cmpb	$0, (%r12)
	je	.L189
	movq	%rsi, %rbp
	movq	%r12, %rdi
	movl	$524289, %esi
	xorl	%eax, %eax
	movl	%edx, %ebx
	call	mq_open@PLT
	movl	%eax, %r14d
	cmpl	$-1, %eax
	je	.L197
	xorl	%ecx, %ecx
	movl	%ebx, %edx
	movq	%rbp, %rsi
	movl	%eax, %edi
	call	mq_send@PLT
	testl	%eax, %eax
	jne	.L198
	movl	%r14d, %edi
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L199
.L188:
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
.L189:
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
.L197:
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
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L198:
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
.L199:
	.cfi_restore_state
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC25(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L188
	.cfi_endproc
.LFE90:
	.size	roxy_mqueue_send, .-roxy_mqueue_send
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"ROXY-DEBUG: Invalid blocking option at roxy_mqueue_receive"
	.align 8
.LC30:
	.string	"ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s)\n"
	.text
	.p2align 4
	.globl	roxy_mqueue_receive
	.type	roxy_mqueue_receive, @function
roxy_mqueue_receive:
.LFB91:
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
	ja	.L201
	movl	%edi, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	cmpb	$0, (%r12)
	je	.L201
	movq	%rsi, %rbp
	movl	%edx, %ebx
	cmpl	$1, %ecx
	je	.L211
	testl	%ecx, %ecx
	jne	.L206
	movl	$526336, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
.L205:
	cmpl	$-1, %r14d
	je	.L212
	movl	%ebx, %edx
	xorl	%ecx, %ecx
	movq	%rbp, %rsi
	movl	%r14d, %edi
	call	mq_receive@PLT
	movl	%r14d, %edi
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L213
.L200:
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
.L201:
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
.L206:
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
.L211:
	.cfi_restore_state
	movl	$524288, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
	jmp	.L205
	.p2align 4,,10
	.p2align 3
.L212:
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC30(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L200
	.p2align 4,,10
	.p2align 3
.L213:
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC25(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L200
	.cfi_endproc
.LFE91:
	.size	roxy_mqueue_receive, .-roxy_mqueue_receive
	.section	.rodata.str1.8
	.align 8
.LC31:
	.string	"ROXY-DEBUG: Failed to obtain the attribute of message queue (mqueue_id=%d, channel_name=%s)\n"
	.text
	.p2align 4
	.globl	roxy_mqueue_get_pending
	.type	roxy_mqueue_get_pending, @function
roxy_mqueue_get_pending:
.LFB92:
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
	ja	.L215
	movl	%edi, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	cmpb	$0, (%r12)
	je	.L215
	movl	$524288, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r13d
	cmpl	$-1, %eax
	je	.L222
	movq	%rsp, %rsi
	movl	%eax, %edi
	call	mq_getattr@PLT
	testl	%eax, %eax
	jne	.L223
	movl	24(%rsp), %r13d
.L214:
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L224
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
.L215:
	.cfi_restore_state
	movl	%r14d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$-1, %r13d
	leaq	.LC26(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L214
.L222:
	movq	%r12, %rcx
	movl	%r14d, %edx
	leaq	.LC30(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	jmp	.L214
.L223:
	movq	%r12, %rcx
	movl	%r14d, %edx
	leaq	.LC31(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movl	$-1, %r13d
	call	__printf_chk@PLT
	jmp	.L214
.L224:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE92:
	.size	roxy_mqueue_get_pending, .-roxy_mqueue_get_pending
	.p2align 4
	.globl	roxy_mqueue_flush
	.type	roxy_mqueue_flush, @function
roxy_mqueue_flush:
.LFB93:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%edi, %r8d
	movl	$8, %edx
	movl	$1, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	.LC23(%rip), %rcx
	movl	%edi, %r12d
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %r13
	movq	%r13, %rdi
	call	__sprintf_chk@PLT
	movq	%r13, %rdi
	call	mq_unlink@PLT
	testl	%eax, %eax
	jne	.L229
	movq	%r13, %rcx
	movl	%r12d, %edx
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
.L225:
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L230
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L229:
	.cfi_restore_state
	movl	%eax, %r8d
	movq	%r13, %rcx
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L225
.L230:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE93:
	.size	roxy_mqueue_flush, .-roxy_mqueue_flush
	.section	.rodata.str1.8
	.align 8
.LC32:
	.string	"ROXY-DEBUG: Invalid event (event_id=%d)\n"
	.text
	.p2align 4
	.globl	roxy_event_send
	.type	roxy_event_send, @function
roxy_event_send:
.LFB94:
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
	cmpl	$1023, %edi
	ja	.L235
	movl	%edi, %edx
	leaq	roxy_events(%rip), %r12
	leaq	(%rdx,%rdx,2), %rbx
	salq	$5, %rbx
	leaq	(%rbx,%r12), %rbp
	movq	%rbp, %rdi
	call	pthread_mutex_lock@PLT
	movl	$0, 88(%rbp)
	leaq	40(%r12,%rbx), %rdi
	call	pthread_cond_broadcast@PLT
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
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
.L235:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC32(%rip), %rsi
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
.LFE94:
	.size	roxy_event_send, .-roxy_event_send
	.p2align 4
	.globl	roxy_event_receive
	.type	roxy_event_receive, @function
roxy_event_receive:
.LFB95:
	.cfi_startproc
	endbr64
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	cmpl	$1023, %edi
	ja	.L242
	movl	%edi, %edx
	leaq	roxy_events(%rip), %r12
	leaq	(%rdx,%rdx,2), %rbx
	salq	$5, %rbx
	leaq	(%r12,%rbx), %rbp
	leaq	40(%r12,%rbx), %r13
	movq	%rbp, %rdi
	call	pthread_mutex_lock@PLT
	movl	$1, 88(%rbp)
	.p2align 4,,10
	.p2align 3
.L239:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pthread_cond_wait@PLT
	cmpl	$1, 88(%r12,%rbx)
	je	.L239
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
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
.L242:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC32(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$8, %rsp
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
	.cfi_endproc
.LFE95:
	.size	roxy_event_receive, .-roxy_event_receive
	.p2align 4
	.globl	roxy_signal_handler
	.type	roxy_signal_handler, @function
roxy_signal_handler:
.LFB96:
	.cfi_startproc
	endbr64
	movslq	%edi, %rdi
	leaq	roxy_interrupts(%rip), %rax
	movq	(%rax,%rdi,8), %rdx
	testq	%rdx, %rdx
	je	.L243
	xorl	%eax, %eax
	jmp	*%rdx
	.p2align 4,,10
	.p2align 3
.L243:
	ret
	.cfi_endproc
.LFE96:
	.size	roxy_signal_handler, .-roxy_signal_handler
	.section	.rodata.str1.8
	.align 8
.LC33:
	.string	"ROXY-DEBUG: Interrupt signal out of bound (signal_id=%d)\n"
	.align 8
.LC34:
	.string	"ROXY-DEBUG: Error setting up signal handler at signal_id=%d\n"
	.text
	.p2align 4
	.globl	roxy_interrupt_catch
	.type	roxy_interrupt_catch, @function
roxy_interrupt_catch:
.LFB97:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$168, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	leaq	8(%rsp), %rbp
	movq	%rsi, (%rsp)
	movq	%rbp, %rdi
	call	sigemptyset@PLT
	movl	%r12d, %esi
	movq	%rbp, %rdi
	call	sigaddset@PLT
	cmpl	$63, %r12d
	ja	.L252
.L246:
	movq	%rsp, %rsi
	xorl	%edx, %edx
	movl	%r12d, %edi
	call	sigaction@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L253
.L245:
	movq	152(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L254
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L252:
	.cfi_restore_state
	movl	%r12d, %edx
	leaq	.LC33(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L246
	.p2align 4,,10
	.p2align 3
.L253:
	movl	%r12d, %edx
	leaq	.LC34(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L245
.L254:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE97:
	.size	roxy_interrupt_catch, .-roxy_interrupt_catch
	.local	roxy_interrupts
	.comm	roxy_interrupts,512,32
	.local	roxy_events
	.comm	roxy_events,98304,32
	.local	roxy_mqueues
	.comm	roxy_mqueues,10240,32
	.local	roxy_critical_sections
	.comm	roxy_critical_sections,640,32
	.local	roxy_threads
	.comm	roxy_threads,24576,32
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
