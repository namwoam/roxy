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
	leaq	roxy_critical_sections(%rip), %rbx
	leaq	640(%rbx), %rbp
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rbx, %rdi
	xorl	%esi, %esi
	addq	$40, %rbx
	call	pthread_mutex_init@PLT
	cmpq	%rbx, %rbp
	jne	.L7
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
	movq	%rcx, %xmm3
	movq	%r9, %xmm0
	movq	%r8, %xmm4
	movd	%edi, %xmm2
	movd	%esi, %xmm5
	punpcklqdq	%xmm3, %xmm1
	punpcklqdq	%xmm4, %xmm0
	punpckldq	%xmm5, %xmm2
	cmpl	$127, %edi
	ja	.L13
	movl	%edi, %edi
	leaq	roxy_tasks(%rip), %rcx
	leaq	(%rdi,%rdi,8), %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	cmpl	$-1, (%rdx)
	je	.L18
.L13:
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
.L18:
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
	movl	%edi, 8(%rsp)
	movl	%esi, 12(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 248(%rsp)
	xorl	%eax, %eax
	cmpl	$128, %edi
	ja	.L20
	movl	%edi, %edx
	leaq	roxy_tasks(%rip), %rcx
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rcx,%rax,8), %rax
	cmpl	$-1, (%rax)
	je	.L20
	cmpl	$8, %esi
	ja	.L20
	cmpl	$-1, 40(%rax)
	jne	.L24
	cmpl	$-1, 44(%rax)
	jne	.L24
	cmpl	$-1, 48(%rax)
	jne	.L24
	cmpl	$-1, 52(%rax)
	jne	.L24
	cmpl	$-1, 56(%rax)
	jne	.L24
	cmpl	$-1, 60(%rax)
	jne	.L24
	cmpl	$-1, 64(%rax)
	jne	.L24
	leaq	(%rdx,%rdx,8), %rsi
	leaq	(%rcx,%rsi,8), %rax
	cmpl	$-1, 68(%rax)
	movq	%rax, 16(%rsp)
	jne	.L24
	leaq	120(%rsp), %rdx
	xorl	%eax, %eax
	movl	$15, %ecx
	movq	$3, 112(%rsp)
	movq	%rdx, %rdi
	rep stosq
	movl	12(%rsp), %eax
	testl	%eax, %eax
	je	.L26
	subl	$1, %eax
	movq	16(%rsp), %r12
	leaq	(%rax,%rsi,2), %rdx
	leaq	4+roxy_tasks(%rip), %rax
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 24(%rsp)
.L36:
	movl	$3, %edi
	call	mlockall@PLT
	cmpl	$-1, %eax
	je	.L47
	leaq	48(%rsp), %r13
	movq	%r13, %rdi
	call	pthread_attr_init@PLT
	testl	%eax, %eax
	jne	.L48
	movl	$75, %edi
	call	__sysconf@PLT
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	pthread_attr_setstacksize@PLT
	testl	%eax, %eax
	jne	.L49
	movl	$2, %esi
	movq	%r13, %rdi
	call	pthread_attr_setschedpolicy@PLT
	testl	%eax, %eax
	jne	.L50
	movq	16(%rsp), %rax
	leaq	36(%rsp), %rsi
	movq	%r13, %rdi
	movl	4(%rax), %eax
	movl	%eax, 36(%rsp)
	call	pthread_attr_setschedparam@PLT
	testl	%eax, %eax
	jne	.L51
	movl	$1, %esi
	movq	%r13, %rdi
	call	pthread_attr_setinheritsched@PLT
	testl	%eax, %eax
	jne	.L52
	movq	%r13, (%rsp)
	movl	$100, %ebx
	leaq	roxy_threads(%rip), %rbp
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L34:
	movq	%r14, %r8
	movl	%r15d, 40(%r12)
	salq	$4, %r8
	movl	$1, 8(%rbp,%r8)
	subl	$1, %ebx
	je	.L53
.L33:
	call	rand@PLT
	cltd
	shrl	$22, %edx
	leal	(%rax,%rdx), %r15d
	andl	$1023, %r15d
	subl	%edx, %r15d
	movslq	%r15d, %r14
	movq	%r14, %rdi
	salq	$4, %rdi
	leaq	0(%rbp,%rdi), %r13
	movl	8(%r13), %eax
	testl	%eax, %eax
	jne	.L34
	movl	8(%rsp), %eax
	movq	(%rsp), %rsi
	leaq	40(%rsp), %rcx
	movq	%r13, %rdi
	leaq	roxy_thread_runner(%rip), %rdx
	movl	$0, 44(%rsp)
	movl	%eax, 40(%rsp)
	call	pthread_create@PLT
	testl	%eax, %eax
	jne	.L54
	movq	0(%r13), %rdi
	leaq	112(%rsp), %rdx
	movl	$128, %esi
	call	pthread_setaffinity_np@PLT
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L20:
	movl	8(%rsp), %edx
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L19:
	movq	248(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L55
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
	.p2align 4,,10
	.p2align 3
.L54:
	.cfi_restore_state
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
.L29:
	movl	$2, %eax
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L24:
	movl	8(%rsp), %edx
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L19
.L53:
	addq	$4, %r12
	cmpq	24(%rsp), %r12
	jne	.L36
	movl	12(%rsp), %r12d
	movq	16(%rsp), %r13
	xorl	%ebx, %ebx
.L37:
	movl	40(%r13,%rbx,4), %eax
	xorl	%esi, %esi
	addq	$1, %rbx
	salq	$4, %rax
	movq	0(%rbp,%rax), %rdi
	call	pthread_join@PLT
	cmpl	%ebx, %r12d
	ja	.L37
.L26:
	xorl	%eax, %eax
	jmp	.L19
.L48:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	jmp	.L29
.L51:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L29
.L52:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	jmp	.L29
.L49:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	jmp	.L29
.L50:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L29
.L47:
	movl	$1, %edi
	leaq	.LC6(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$-2, %edi
	call	exit@PLT
.L55:
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
.LC13:
	.string	"ROXY-DEBUG: Failed to lock the critical section mutex (section_id=%d)\n"
	.text
	.p2align 4
	.globl	roxy_critical_section_enter
	.type	roxy_critical_section_enter, @function
roxy_critical_section_enter:
.LFB52:
	.cfi_startproc
	endbr64
	movl	$2, %eax
	cmpl	$15, %edi
	ja	.L63
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
	jne	.L66
.L57:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L63:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L66:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L57
	.cfi_endproc
.LFE52:
	.size	roxy_critical_section_enter, .-roxy_critical_section_enter
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"ROXY-DEBUG: Failed to unlock the critical section mutex (section_id=%d)\n"
	.text
	.p2align 4
	.globl	roxy_critical_section_leave
	.type	roxy_critical_section_leave, @function
roxy_critical_section_leave:
.LFB53:
	.cfi_startproc
	endbr64
	movl	$2, %eax
	cmpl	$15, %edi
	ja	.L73
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
	jne	.L76
.L67:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L73:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L67
	.cfi_endproc
.LFE53:
	.size	roxy_critical_section_leave, .-roxy_critical_section_leave
	.local	roxy_critical_sections
	.comm	roxy_critical_sections,640,32
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
