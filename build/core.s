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
.LFB49:
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
	addq	%rbp, %r12
	movl	$1, 8(%r12)
	call	gettid@PLT
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	%eax, 12(%r12)
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
.LFE49:
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
.LFB47:
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
	movq	%rcx, %xmm2
	movq	%r9, %xmm0
	movq	%r8, %xmm3
	punpcklqdq	%xmm2, %xmm1
	punpcklqdq	%xmm3, %xmm0
	cmpl	$127, %edi
	ja	.L25
	movl	%edi, %edi
	leaq	roxy_tasks(%rip), %rax
	leaq	(%rdi,%rdi,8), %rdx
	leaq	(%rax,%rdx,8), %rdx
	movl	(%rdx), %eax
	testl	%eax, %eax
	je	.L30
.L25:
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
.L30:
	movl	$1, (%rdx)
	movl	%esi, 4(%rdx)
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
	.align 8
.LC6:
	.string	"ROXY-DEBUG: init pthread attributes failed"
	.align 8
.LC7:
	.string	"ROXY-DEBUG: pthread setstacksize failed"
	.align 8
.LC8:
	.string	"ROXY-DEBUG: pthread setschedpolicy failed"
	.align 8
.LC9:
	.string	"ROXY-DEBUG: pthread setschedparam failed"
	.align 8
.LC10:
	.string	"ROXY-DEBUG: pthread setinheritsched failed"
	.align 8
.LC11:
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
	ja	.L32
	movl	%edi, %eax
	leaq	roxy_tasks(%rip), %rcx
	movq	%rax, 40(%rsp)
	leaq	(%rax,%rax,8), %rax
	leaq	(%rcx,%rax,8), %rax
	movl	(%rax), %edx
	testl	%edx, %edx
	je	.L32
	movl	%esi, %edx
	cmpl	$8, %esi
	ja	.L32
	cmpl	$-1, 40(%rax)
	jne	.L36
	cmpl	$-1, 44(%rax)
	jne	.L36
	cmpl	$-1, 48(%rax)
	jne	.L36
	cmpl	$-1, 52(%rax)
	jne	.L36
	cmpl	$-1, 56(%rax)
	jne	.L36
	cmpl	$-1, 60(%rax)
	jne	.L36
	cmpl	$-1, 64(%rax)
	jne	.L36
	movq	40(%rsp), %rax
	leaq	(%rax,%rax,8), %rsi
	leaq	roxy_tasks(%rip), %rax
	leaq	(%rax,%rsi,8), %r13
	cmpl	$-1, 68(%r13)
	jne	.L36
	leaq	136(%rsp), %r8
	xorl	%eax, %eax
	movl	$15, %ecx
	movq	$3, 128(%rsp)
	movq	%r8, %rdi
	rep stosq
	testl	%edx, %edx
	je	.L38
	leal	-1(%rdx), %eax
	movq	%r13, 24(%rsp)
	leaq	64(%rsp), %r12
	leaq	(%rax,%rsi,2), %rdx
	leaq	4+roxy_tasks(%rip), %rax
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L48:
	movq	%r12, %rdi
	call	pthread_attr_init@PLT
	testl	%eax, %eax
	jne	.L57
	movl	$75, %edi
	call	__sysconf@PLT
	movq	%r12, %rdi
	movq	%rax, %rsi
	call	pthread_attr_setstacksize@PLT
	testl	%eax, %eax
	jne	.L58
	movl	$2, %esi
	movq	%r12, %rdi
	call	pthread_attr_setschedpolicy@PLT
	testl	%eax, %eax
	jne	.L59
	movq	24(%rsp), %rax
	leaq	52(%rsp), %rsi
	movq	%r12, %rdi
	movl	4(%rax), %eax
	movl	%eax, 52(%rsp)
	call	pthread_attr_setschedparam@PLT
	testl	%eax, %eax
	jne	.L60
	movl	$1, %esi
	movq	%r12, %rdi
	call	pthread_attr_setinheritsched@PLT
	testl	%eax, %eax
	jne	.L61
	movl	$100, %ebx
	leaq	roxy_threads(%rip), %rbp
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L45:
	subl	$1, %ebx
	je	.L47
.L44:
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
	leaq	8(%rdi), %r15
	testl	%eax, %eax
	jne	.L45
	movd	%r8d, %xmm1
	movd	%r14d, %xmm0
	leaq	56(%rsp), %rcx
	movq	%r12, %rsi
	punpckldq	%xmm1, %xmm0
	leaq	roxy_thread_runner(%rip), %rdx
	movl	%r8d, 20(%rsp)
	movq	%rdi, 8(%rsp)
	movq	%xmm0, 56(%rsp)
	call	pthread_create@PLT
	movq	8(%rsp), %rdi
	movl	20(%rsp), %r8d
	testl	%eax, %eax
	jne	.L62
	movq	(%rdi), %rdi
	movl	$128, %esi
	movl	%r8d, 8(%rsp)
	leaq	128(%rsp), %rdx
	call	pthread_setaffinity_np@PLT
	movl	8(%rsp), %r8d
	movl	$1, (%r15)
	movl	%r8d, 40(%r13)
.L47:
	addq	$4, %r13
	cmpq	32(%rsp), %r13
	jne	.L48
.L38:
	movq	40(%rsp), %rax
	leaq	roxy_tasks(%rip), %rcx
	leaq	(%rax,%rax,8), %rax
	movl	$2, (%rcx,%rax,8)
	xorl	%eax, %eax
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L32:
	movl	%r14d, %edx
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L31:
	movq	264(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L63
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
.L36:
	.cfi_restore_state
	movl	%r14d, %edx
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L31
.L59:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
.L40:
	movl	$2, %eax
	jmp	.L31
.L58:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	jmp	.L40
.L57:
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	jmp	.L40
.L61:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L40
.L60:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L40
.L62:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	jmp	.L40
.L63:
	call	__stack_chk_fail@PLT
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
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"ROXY-DEBUG: Invalid wait option"
	.align 8
.LC13:
	.string	"ROXY-DEBUG: Error occurred during wait (might be integer overflow)"
	.text
	.p2align 4
	.globl	roxy_task_wait
	.type	roxy_task_wait, @function
roxy_task_wait:
.LFB52:
	.cfi_startproc
	endbr64
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	jne	.L66
	movl	%edi, %eax
	pxor	%xmm0, %xmm0
	movq	%rax, 8(%rsp)
.L67:
	movhps	8(%rsp), %xmm0
	leaq	32(%rsp), %rsi
	leaq	16(%rsp), %rdi
	movaps	%xmm0, 16(%rsp)
	call	nanosleep@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	cmpl	$-1, %r8d
	je	.L73
.L65:
	movq	56(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L74
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L66:
	.cfi_restore_state
	cmpl	$1, %esi
	jne	.L68
	movq	$0, 8(%rsp)
	movd	%edi, %xmm0
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L68:
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L65
	.p2align 4,,10
	.p2align 3
.L73:
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L65
.L74:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE52:
	.size	roxy_task_wait, .-roxy_task_wait
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"ROXY-DEBUG: Failed to find the task (task_id=%d)\n"
	.align 8
.LC15:
	.string	"ROXY-DEBUG: Task must be in the loaded state to set priority, task_id=%d\n"
	.text
	.p2align 4
	.globl	roxy_task_set_priority
	.type	roxy_task_set_priority, @function
roxy_task_set_priority:
.LFB53:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	%edi, %edx
	cmpl	$127, %edi
	ja	.L76
	movl	%edi, %eax
	leaq	(%rax,%rax,8), %rcx
	leaq	roxy_tasks(%rip), %rax
	leaq	(%rax,%rcx,8), %rcx
	movl	(%rcx), %eax
	testl	%eax, %eax
	je	.L76
	cmpl	$1, %eax
	jne	.L81
	movl	%esi, 4(%rcx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_restore_state
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L78:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L78
	.cfi_endproc
.LFE53:
	.size	roxy_task_set_priority, .-roxy_task_set_priority
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"ROXY-DEBUG: Failed to lock the critical section mutex (section_id=%d)\n"
	.text
	.p2align 4
	.globl	roxy_critical_section_enter
	.type	roxy_critical_section_enter, @function
roxy_critical_section_enter:
.LFB54:
	.cfi_startproc
	endbr64
	movl	$2, %eax
	cmpl	$15, %edi
	ja	.L88
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
	jne	.L91
.L82:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L88:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L91:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L82
	.cfi_endproc
.LFE54:
	.size	roxy_critical_section_enter, .-roxy_critical_section_enter
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"ROXY-DEBUG: Failed to unlock the critical section mutex (section_id=%d)\n"
	.text
	.p2align 4
	.globl	roxy_critical_section_leave
	.type	roxy_critical_section_leave, @function
roxy_critical_section_leave:
.LFB55:
	.cfi_startproc
	endbr64
	movl	$2, %eax
	cmpl	$15, %edi
	ja	.L98
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
	jne	.L101
.L92:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L98:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L101:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L92
	.cfi_endproc
.LFE55:
	.size	roxy_critical_section_leave, .-roxy_critical_section_leave
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"ROXY-DEBUG: Failed to join the thread: thread_id=%lu, error_code=%d\n"
	.text
	.p2align 4
	.globl	roxy_loop
	.type	roxy_loop, @function
roxy_loop:
.LFB56:
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
	ja	.L103
	movl	%edi, %ebx
	leaq	roxy_tasks(%rip), %r12
	leaq	(%rbx,%rbx,8), %rax
	leaq	(%r12,%rax,8), %rax
	movl	(%rax), %edx
	testl	%edx, %edx
	je	.L103
	movl	40(%rax), %eax
	cmpl	$-1, %eax
	jne	.L150
.L106:
	leaq	(%rbx,%rbx,8), %rax
	movl	44(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L151
.L108:
	leaq	(%rbx,%rbx,8), %rax
	movl	48(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L152
.L109:
	leaq	(%rbx,%rbx,8), %rax
	movl	52(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L153
.L110:
	leaq	(%rbx,%rbx,8), %rax
	movl	56(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L154
.L111:
	leaq	(%rbx,%rbx,8), %rax
	movl	60(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L155
.L112:
	leaq	(%rbx,%rbx,8), %rax
	movl	64(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L156
.L113:
	leaq	(%rbx,%rbx,8), %rax
	movl	68(%r12,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L157
.L114:
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
.L150:
	.cfi_restore_state
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L106
	xorl	%edx, %edx
.L107:
	leaq	(%rbx,%rbx,8), %rcx
	leaq	.LC18(%rip), %rsi
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
.L151:
	.cfi_restore_state
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L108
	movl	$1, %edx
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L152:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L109
	movl	$2, %edx
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L153:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L110
	movl	$3, %edx
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L154:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L111
	movl	$4, %edx
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L155:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L112
	movl	$5, %edx
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L156:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L113
	movl	$6, %edx
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L157:
	salq	$4, %rax
	leaq	roxy_threads(%rip), %rbp
	xorl	%esi, %esi
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	movl	$7, %edx
	testl	%eax, %eax
	je	.L114
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L103:
	movl	%edi, %edx
	leaq	.LC14(%rip), %rsi
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
.LFE56:
	.size	roxy_loop, .-roxy_loop
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
