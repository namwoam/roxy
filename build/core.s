	.file	"core.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
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
	leaq	.LC1(%rip), %rsi
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
	imulq	$552, %rax, %rdx
	movq	8(%rbp,%rdx), %rdx
	testq	%rdx, %rdx
	je	.L2
	xorl	%eax, %eax
	call	*%rdx
	movl	(%rbx), %eax
.L2:
	imulq	$552, %rax, %rdx
	movq	16(%rbp,%rdx), %rdx
	testq	%rdx, %rdx
	je	.L3
	xorl	%eax, %eax
	call	*%rdx
	movl	(%rbx), %eax
.L3:
	imulq	$552, %rax, %rax
	movq	32(%rbp,%rax), %rdx
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
.LC2:
	.string	"ROXY-DEBUG: Priority provided by the os: %d\n"
	.align 8
.LC3:
	.string	"ROXY-DEBUG: Priority defined by roxy: %d\n"
	.section	.rodata
	.align 32
.LC0:
	.long	0
	.long	-1
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
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
	subq	$568, %rsp
	.cfi_def_cfa_offset 592
	movq	%fs:40, %rax
	movq	%rax, 552(%rsp)
	xorl	%eax, %eax
	call	srand@PLT
	leaq	roxy_tasks(%rip), %rax
	movq	%rsp, %rdx
	leaq	.LC0(%rip), %r9
	leaq	70656(%rax), %r10
	movq	%rdx, %r8
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%rdx, %rdi
	movl	$69, %ecx
	movq	%r9, %rsi
	movq	%r8, %rdx
	rep movsq
	movq	%rax, %rdi
	addq	$552, %rax
	movq	%r8, %rsi
	movl	$69, %ecx
	rep movsq
	cmpq	%r10, %rax
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
	cmpq	%rbp, %rbx
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
	cmpq	%rbx, %rbp
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
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	subl	%eax, %ebx
	xorl	%eax, %eax
	movl	%ebx, %edx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movl	$64, %edx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	cmpl	$63, %ebx
	setle	%al
	movq	552(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L29
	addq	$568, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L29:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE78:
	.size	roxy_init, .-roxy_init
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"ROXY-DEBUG: Failed to unlink the mqueue (mqueue_id=%d , channel_name=%s) error_code=%d\n"
	.align 8
.LC5:
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
	leaq	.LC5(%rip), %rbx
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L35:
	movq	%r12, %rdi
	call	mq_unlink@PLT
	testl	%eax, %eax
	jne	.L41
	movq	%r12, %rcx
	movl	%r13d, %edx
	movq	%rbx, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movb	$0, (%r12)
.L32:
	addl	$1, %r13d
	addq	$80, %r12
	cmpl	$128, %r13d
	je	.L30
.L34:
	cmpb	$32, (%r12)
	jne	.L35
	cmpb	$0, 1(%r12)
	je	.L32
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L41:
	movl	%eax, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L30:
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
.LC6:
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
	ja	.L43
	movl	%edi, %edi
	leaq	roxy_tasks(%rip), %rax
	imulq	$552, %rdi, %rdi
	addq	%rdi, %rax
	movl	(%rax), %r8d
	testl	%r8d, %r8d
	je	.L48
.L43:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	movl	$1, (%rax)
	movl	%esi, 4(%rax)
	movups	%xmm1, 8(%rax)
	movups	%xmm0, 24(%rax)
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE80:
	.size	roxy_task_create, .-roxy_task_create
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"ROXY-DEBUG: Failed to start the task (task_id=%d)\n"
	.align 8
.LC8:
	.string	"ROXY-DEBUG: The task (task_id=%d) was already started\n"
	.align 8
.LC9:
	.string	"ROXY-DEBUG: init pthread attributes failed"
	.align 8
.LC10:
	.string	"ROXY-DEBUG: pthread setstacksize failed"
	.align 8
.LC11:
	.string	"ROXY-DEBUG: pthread setschedpolicy failed"
	.align 8
.LC12:
	.string	"ROXY-DEBUG: pthread setschedparam failed"
	.align 8
.LC13:
	.string	"ROXY-DEBUG: pthread setinheritsched failed"
	.align 8
.LC14:
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
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edi, %r12d
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
	ja	.L50
	movl	%edi, %eax
	leaq	roxy_tasks(%rip), %r15
	movq	%rax, 8(%rsp)
	imulq	$552, %rax, %rax
	movl	(%r15,%rax), %ecx
	testl	%ecx, %ecx
	je	.L50
	cmpl	$128, %esi
	ja	.L50
	leaq	40(%r15,%rax), %r14
	leaq	552+roxy_tasks(%rip), %rdx
	addq	%rax, %rdx
	movq	%r14, %rax
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L54:
	addq	$4, %rax
	cmpq	%rdx, %rax
	je	.L76
.L55:
	cmpl	$-1, (%rax)
	je	.L54
	movl	%r12d, %edx
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L49:
	movq	264(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L77
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
	.p2align 4,,10
	.p2align 3
.L50:
	.cfi_restore_state
	movl	%r12d, %edx
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L49
.L76:
	leaq	136(%rsp), %rdx
	xorl	%eax, %eax
	movl	$15, %ecx
	movq	$3, 128(%rsp)
	movq	%rdx, %rdi
	rep stosq
	testl	%esi, %esi
	je	.L56
	movq	8(%rsp), %rcx
	leal	-1(%rsi), %eax
	leaq	64(%rsp), %r13
	leaq	roxy_threads(%rip), %rbp
	imulq	$138, %rcx, %rdx
	addq	%rdx, %rax
	leaq	44+roxy_tasks(%rip), %rdx
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 40(%rsp)
	imulq	$552, %rcx, %rax
	addq	%r15, %rax
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L66:
	movq	%r13, %rdi
	call	pthread_attr_init@PLT
	testl	%eax, %eax
	jne	.L78
	movl	$75, %edi
	call	__sysconf@PLT
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	pthread_attr_setstacksize@PLT
	testl	%eax, %eax
	jne	.L79
	movl	$2, %esi
	movq	%r13, %rdi
	call	pthread_attr_setschedpolicy@PLT
	testl	%eax, %eax
	jne	.L80
	movq	32(%rsp), %rax
	leaq	60(%rsp), %rsi
	movq	%r13, %rdi
	movl	4(%rax), %eax
	movl	%eax, 60(%rsp)
	call	pthread_attr_setschedparam@PLT
	testl	%eax, %eax
	jne	.L81
	movl	$1, %esi
	movq	%r13, %rdi
	call	pthread_attr_setinheritsched@PLT
	testl	%eax, %eax
	jne	.L82
	movl	$100, %ebx
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L63:
	subl	$1, %ebx
	je	.L65
.L62:
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
	jne	.L63
	movl	$1, 8(%rdi)
	movd	%r8d, %xmm1
	movq	%r13, %rsi
	movd	%r12d, %xmm0
	punpckldq	%xmm1, %xmm0
	leaq	16(%rbp,%rax), %rcx
	movl	%r8d, 28(%rsp)
	leaq	roxy_thread_runner(%rip), %rdx
	movq	%rdi, 16(%rsp)
	movq	%xmm0, 16(%rbp,%rax)
	call	pthread_create@PLT
	movq	16(%rsp), %rdi
	movl	28(%rsp), %r8d
	testl	%eax, %eax
	jne	.L83
	movq	(%rdi), %rdi
	movl	$128, %esi
	movl	%r8d, 16(%rsp)
	leaq	128(%rsp), %rdx
	call	pthread_setaffinity_np@PLT
	movl	16(%rsp), %r8d
	movl	%r8d, (%r14)
.L65:
	addq	$4, %r14
	cmpq	40(%rsp), %r14
	jne	.L66
.L56:
	imulq	$552, 8(%rsp), %rax
	movl	$2, (%r15,%rax)
	xorl	%eax, %eax
	jmp	.L49
.L80:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
.L58:
	movl	$2, %eax
	jmp	.L49
.L79:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L58
.L78:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L58
.L82:
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	jmp	.L58
.L81:
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	jmp	.L58
.L83:
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L58
.L77:
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
.LC15:
	.string	"ROXY-DEBUG: Invalid wait option"
	.align 8
.LC16:
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
	jne	.L86
	movl	%edi, %eax
	pxor	%xmm0, %xmm0
	movq	%rax, 8(%rsp)
.L87:
	movhps	8(%rsp), %xmm0
	leaq	32(%rsp), %rsi
	leaq	16(%rsp), %rdi
	movaps	%xmm0, 16(%rsp)
	call	nanosleep@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	cmpl	$-1, %r8d
	je	.L93
.L85:
	movq	56(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L94
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L86:
	.cfi_restore_state
	cmpl	$1, %esi
	jne	.L88
	movq	$0, 8(%rsp)
	movd	%edi, %xmm0
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L88:
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L93:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L85
.L94:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE84:
	.size	roxy_task_wait, .-roxy_task_wait
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"ROXY-DEBUG: Failed to find the task (task_id=%d)\n"
	.align 8
.LC18:
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
	ja	.L96
	movl	%edi, %ecx
	leaq	roxy_tasks(%rip), %rax
	imulq	$552, %rcx, %rcx
	addq	%rcx, %rax
	movl	(%rax), %ecx
	testl	%ecx, %ecx
	je	.L96
	cmpl	$1, %ecx
	jne	.L101
	movl	%esi, 4(%rax)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L96:
	.cfi_restore_state
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L98:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L101:
	.cfi_restore_state
	leaq	.LC18(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L98
	.cfi_endproc
.LFE85:
	.size	roxy_task_set_priority, .-roxy_task_set_priority
	.section	.rodata.str1.8
	.align 8
.LC19:
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
	ja	.L108
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
	jne	.L111
.L102:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L108:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L111:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC19(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L102
	.cfi_endproc
.LFE86:
	.size	roxy_critical_section_enter, .-roxy_critical_section_enter
	.section	.rodata.str1.8
	.align 8
.LC20:
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
	ja	.L118
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
	jne	.L121
.L112:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L118:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L121:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L112
	.cfi_endproc
.LFE87:
	.size	roxy_critical_section_leave, .-roxy_critical_section_leave
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"ROXY-DEBUG: Failed to join the thread: thread_id=%lu, error_code=%d\n"
	.text
	.p2align 4
	.globl	roxy_loop
	.type	roxy_loop, @function
roxy_loop:
.LFB88:
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
	cmpl	$127, %edi
	ja	.L123
	movl	%edi, %r12d
	leaq	roxy_tasks(%rip), %r13
	xorl	%ebx, %ebx
	imulq	$552, %r12, %r14
	leaq	roxy_threads(%rip), %rbp
	addq	%r13, %r14
	movl	(%r14), %eax
	testl	%eax, %eax
	jne	.L127
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L126:
	addq	$1, %rbx
	cmpq	$128, %rbx
	je	.L137
.L127:
	movl	40(%r14,%rbx,4), %eax
	movslq	%ebx, %r15
	cmpl	$-1, %eax
	je	.L126
	leaq	(%rax,%rax,2), %rax
	xorl	%esi, %esi
	movq	0(%rbp,%rax,8), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L126
	imulq	$138, %r12, %r12
	movl	%eax, %ecx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC21(%rip), %rsi
	leaq	8(%r15,%r12), %rdx
	movl	8(%r13,%rdx,4), %edx
	leaq	(%rdx,%rdx,2), %rdx
	movq	0(%rbp,%rdx,8), %rdx
	call	__printf_chk@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$2, %eax
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
.L123:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$2, %eax
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
.L137:
	.cfi_restore_state
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.LFE88:
	.size	roxy_loop, .-roxy_loop
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"ROXY-DEBUG: Failed to start the message queue (mqueue_id=%d)\n"
	.align 8
.LC23:
	.string	"ROXY-DEBUG: The message queue (mqueue_id=%d), has been initialized before\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC24:
	.string	"/%x"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"ROXY-DEBUG: Failed to create message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n"
	.align 8
.LC26:
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
	ja	.L147
	movl	%edi, %eax
	leaq	roxy_mqueues(%rip), %r13
	leaq	(%rax,%rax,4), %rbx
	salq	$4, %rbx
	addq	%rbx, %r13
	cmpb	$0, 0(%r13)
	jne	.L148
	movl	%edi, %r8d
	movl	%esi, %r14d
	movl	%edx, %ebp
	movl	$1, %esi
	leaq	.LC24(%rip), %rcx
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
	je	.L149
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L150
.L138:
	movq	72(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L151
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
.L148:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC23(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L147:
	movl	%edi, %edx
	leaq	.LC22(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L149:
	call	__errno_location@PLT
	movq	%r13, %rcx
	movl	%r12d, %edx
	movl	$1, %edi
	movl	(%rax), %r8d
	leaq	.LC25(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L150:
	movq	%r13, %rcx
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC26(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L138
.L151:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE89:
	.size	roxy_mqueue_create, .-roxy_mqueue_create
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"ROXY-DEBUG: The message queue (mqueue_id=%d), has not been initialized before\n"
	.align 8
.LC28:
	.string	"ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n"
	.align 8
.LC29:
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
	ja	.L153
	movl	%edi, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	cmpb	$0, (%r12)
	je	.L153
	movq	%rsi, %rbp
	movq	%r12, %rdi
	movl	$524289, %esi
	xorl	%eax, %eax
	movl	%edx, %ebx
	call	mq_open@PLT
	movl	%eax, %r14d
	cmpl	$-1, %eax
	je	.L161
	xorl	%ecx, %ecx
	movl	%ebx, %edx
	movq	%rbp, %rsi
	movl	%eax, %edi
	call	mq_send@PLT
	testl	%eax, %eax
	jne	.L162
	movl	%r14d, %edi
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L163
.L152:
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
.L153:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC27(%rip), %rsi
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
.L161:
	.cfi_restore_state
	call	__errno_location@PLT
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	movl	(%rax), %r8d
	leaq	.LC28(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L152
	.p2align 4,,10
	.p2align 3
.L162:
	movl	%eax, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC29(%rip), %rsi
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
.L163:
	.cfi_restore_state
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC26(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L152
	.cfi_endproc
.LFE90:
	.size	roxy_mqueue_send, .-roxy_mqueue_send
	.section	.rodata.str1.8
	.align 8
.LC30:
	.string	"ROXY-DEBUG: Invalid blocking option at roxy_mqueue_receive"
	.align 8
.LC31:
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
	ja	.L165
	movl	%edi, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	cmpb	$0, (%r12)
	je	.L165
	movq	%rsi, %rbp
	movl	%edx, %ebx
	cmpl	$1, %ecx
	je	.L175
	testl	%ecx, %ecx
	jne	.L170
	movl	$526336, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
.L169:
	cmpl	$-1, %r14d
	je	.L176
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
	jne	.L177
.L164:
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
.L165:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC27(%rip), %rsi
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
.L170:
	.cfi_restore_state
	leaq	.LC30(%rip), %rdi
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
.L175:
	.cfi_restore_state
	movl	$524288, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
	jmp	.L169
	.p2align 4,,10
	.p2align 3
.L176:
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC31(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L164
	.p2align 4,,10
	.p2align 3
.L177:
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC26(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L164
	.cfi_endproc
.LFE91:
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
	ja	.L179
	movl	%edi, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	cmpb	$0, (%r12)
	je	.L179
	movl	$524288, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r13d
	cmpl	$-1, %eax
	je	.L186
	movq	%rsp, %rsi
	movl	%eax, %edi
	call	mq_getattr@PLT
	testl	%eax, %eax
	jne	.L187
	movl	24(%rsp), %r13d
.L178:
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L188
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
.L179:
	.cfi_restore_state
	movl	%r14d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$-1, %r13d
	leaq	.LC27(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L178
.L186:
	movq	%r12, %rcx
	movl	%r14d, %edx
	leaq	.LC31(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	jmp	.L178
.L187:
	movq	%r12, %rcx
	movl	%r14d, %edx
	leaq	.LC32(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movl	$-1, %r13d
	call	__printf_chk@PLT
	jmp	.L178
.L188:
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
	leaq	.LC24(%rip), %rcx
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
	jne	.L193
	movq	%r13, %rcx
	movl	%r12d, %edx
	leaq	.LC5(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
.L189:
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L194
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
.L193:
	.cfi_restore_state
	movl	%eax, %r8d
	movq	%r13, %rcx
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L189
.L194:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE93:
	.size	roxy_mqueue_flush, .-roxy_mqueue_flush
	.section	.rodata.str1.8
	.align 8
.LC33:
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
	ja	.L199
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
.L199:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC33(%rip), %rsi
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
	ja	.L206
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
.L203:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pthread_cond_wait@PLT
	cmpl	$1, 88(%r12,%rbx)
	je	.L203
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
.L206:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC33(%rip), %rsi
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
	je	.L207
	xorl	%eax, %eax
	jmp	*%rdx
	.p2align 4,,10
	.p2align 3
.L207:
	ret
	.cfi_endproc
.LFE96:
	.size	roxy_signal_handler, .-roxy_signal_handler
	.section	.rodata.str1.8
	.align 8
.LC34:
	.string	"ROXY-DEBUG: Interrupt signal out of bound (signal_id=%d)\n"
	.align 8
.LC35:
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
	ja	.L216
.L210:
	movq	%rsp, %rsi
	xorl	%edx, %edx
	movl	%r12d, %edi
	call	sigaction@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L217
.L209:
	movq	152(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L218
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
.L216:
	.cfi_restore_state
	movl	%r12d, %edx
	leaq	.LC34(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L217:
	movl	%r12d, %edx
	leaq	.LC35(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L209
.L218:
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
	.comm	roxy_tasks,70656,32
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
