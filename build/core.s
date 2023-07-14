	.file	"core.c"
	.text
	.p2align 4
	.globl	roxy_thread_runner
	.type	roxy_thread_runner, @function
roxy_thread_runner:
.LFB49:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	(%rdi), %eax
	leaq	roxy_tasks(%rip), %rdx
	leaq	(%rax,%rax,8), %rcx
	xorl	%eax, %eax
	call	*16(%rdx,%rcx,8)
	xorl	%eax, %eax
	addq	$8, %rsp
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
	ja	.L9
	movl	%edi, %edi
	leaq	roxy_tasks(%rip), %rcx
	leaq	(%rdi,%rdi,8), %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	cmpl	$-1, (%rdx)
	je	.L14
.L9:
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
.L14:
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	%edi, 8(%rsp)
	movl	%esi, 12(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	cmpl	$128, %edi
	ja	.L16
	movl	%edi, %edx
	leaq	roxy_tasks(%rip), %rcx
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rcx,%rax,8), %rax
	cmpl	$-1, (%rax)
	je	.L16
	cmpl	$8, %esi
	ja	.L16
	cmpl	$-1, 40(%rax)
	jne	.L20
	cmpl	$-1, 44(%rax)
	jne	.L20
	cmpl	$-1, 48(%rax)
	jne	.L20
	cmpl	$-1, 52(%rax)
	jne	.L20
	cmpl	$-1, 56(%rax)
	jne	.L20
	cmpl	$-1, 60(%rax)
	jne	.L20
	cmpl	$-1, 64(%rax)
	jne	.L20
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rcx,%rax,8), %rcx
	cmpl	$-1, 68(%rcx)
	movq	%rcx, 16(%rsp)
	jne	.L20
	testl	%esi, %esi
	je	.L22
	leal	-1(%rsi), %edx
	movq	%rcx, %r12
	leaq	(%rdx,%rax,2), %rdx
	leaq	4+roxy_tasks(%rip), %rax
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 24(%rsp)
.L32:
	movl	$3, %edi
	call	mlockall@PLT
	cmpl	$-1, %eax
	je	.L46
	leaq	48(%rsp), %r14
	movq	%r14, %rdi
	call	pthread_attr_init@PLT
	testl	%eax, %eax
	jne	.L47
	movl	$75, %edi
	call	__sysconf@PLT
	movq	%r14, %rdi
	movq	%rax, %rsi
	call	pthread_attr_setstacksize@PLT
	testl	%eax, %eax
	jne	.L48
	movl	$2, %esi
	movq	%r14, %rdi
	call	pthread_attr_setschedpolicy@PLT
	testl	%eax, %eax
	jne	.L49
	movq	16(%rsp), %rax
	leaq	40(%rsp), %rsi
	movq	%r14, %rdi
	movl	4(%rax), %eax
	movl	%eax, 40(%rsp)
	call	pthread_attr_setschedparam@PLT
	testl	%eax, %eax
	jne	.L50
	movl	$1, %esi
	movq	%r14, %rdi
	call	pthread_attr_setinheritsched@PLT
	testl	%eax, %eax
	jne	.L51
	movl	$100, %ebx
	leaq	roxy_threads(%rip), %rbp
	leaq	roxy_thread_runner(%rip), %r15
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L30:
	leaq	0(,%r13,8), %rax
	movl	%r8d, 40(%r12)
	subq	%r13, %rax
	salq	$4, %rax
	movl	$1, 16(%rbp,%rax)
	subl	$1, %ebx
	je	.L52
.L29:
	call	rand@PLT
	cltd
	shrl	$22, %edx
	leal	(%rax,%rdx), %r8d
	andl	$1023, %r8d
	subl	%edx, %r8d
	movslq	%r8d, %r13
	leaq	0(,%r13,8), %rax
	subq	%r13, %rax
	salq	$4, %rax
	movl	16(%rbp,%rax), %edx
	testl	%edx, %edx
	jne	.L30
	movl	8(%rsp), %esi
	leaq	44(%rsp), %rcx
	leaq	8(%rbp,%rax), %rdi
	movq	%r15, %rdx
	movl	%r8d, 4(%rsp)
	movl	%esi, 44(%rsp)
	movq	%r14, %rsi
	call	pthread_create@PLT
	movl	4(%rsp), %r8d
	testl	%eax, %eax
	je	.L30
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
.L25:
	movl	$2, %eax
.L15:
	movq	104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L53
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
.L16:
	.cfi_restore_state
	movl	8(%rsp), %edx
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L20:
	movl	8(%rsp), %edx
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L15
.L52:
	addq	$4, %r12
	cmpq	24(%rsp), %r12
	jne	.L32
	xorl	%ebx, %ebx
.L33:
	movq	16(%rsp), %rax
	xorl	%esi, %esi
	movl	40(%rax,%rbx,4), %edx
	addq	$1, %rbx
	leaq	0(,%rdx,8), %rax
	subq	%rdx, %rax
	salq	$4, %rax
	movq	8(%rbp,%rax), %rdi
	call	pthread_join@PLT
	cmpl	%ebx, 12(%rsp)
	ja	.L33
.L22:
	xorl	%eax, %eax
	jmp	.L15
.L48:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	jmp	.L25
.L51:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	jmp	.L25
.L47:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	jmp	.L25
.L49:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L25
.L50:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L25
.L53:
	call	__stack_chk_fail@PLT
.L46:
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
	.comm	roxy_threads,114688,32
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
