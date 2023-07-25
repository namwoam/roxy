	.file	"core.c"
	.text
	.section	.rodata
	.align 32
.LC1:
	.string	"ROXY-SYSTEM: thread_id:%d pthread_id:%lu running on os thread:%d\n"
	.zero	62
	.text
	.p2align 4
	.globl	roxy_thread_runner
	.type	roxy_thread_runner, @function
roxy_thread_runner:
.LASANPC81:
.LFB81:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	4(%rdi), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%r12, %rax
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	shrq	$3, %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movzbl	2147450880(%rax), %edx
	movq	%r12, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L2
	testb	%dl, %dl
	jne	.L83
.L2:
	movl	4(%rbp), %ebx
	call	gettid@PLT
	movl	%ebx, %edx
	leaq	roxy_threads(%rip), %rbx
	leaq	(%rdx,%rdx,2), %rcx
	leaq	12(%rbx,%rcx,8), %rdi
	movq	%rdi, %rcx
	shrq	$3, %rcx
	movzbl	2147450880(%rcx), %esi
	movq	%rdi, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%sil, %cl
	jl	.L3
	testb	%sil, %sil
	jne	.L84
.L3:
	leaq	(%rdx,%rdx,2), %rdx
	movl	%eax, 12(%rbx,%rdx,8)
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%r12, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L4
	testb	%dl, %dl
	jne	.L85
.L4:
	movl	4(%rbp), %eax
	leaq	(%rax,%rax,2), %rdx
	movq	%rax, %r9
	leaq	12(%rbx,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L5
	testb	%cl, %cl
	jne	.L86
.L5:
	leaq	(%rax,%rax,2), %rax
	leaq	(%rbx,%rax,8), %rdi
	movq	%rdi, %rax
	movl	12(%rdi), %r8d
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L87
	movq	(%rdi), %rcx
	movl	%r9d, %edx
	leaq	.LC1(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	%rbp, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbp, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L7
	testb	%dl, %dl
	jne	.L88
.L7:
	movl	0(%rbp), %eax
	leaq	roxy_tasks(%rip), %r13
	imulq	$552, %rax, %rdx
	addq	%r13, %rdx
	leaq	8(%rdx), %rdi
	movq	%rdi, %rcx
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L89
	movq	8(%rdx), %rdx
	testq	%rdx, %rdx
	je	.L9
	xorl	%eax, %eax
	call	*%rdx
	movq	%rbp, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbp, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L10
	testb	%dl, %dl
	jne	.L90
.L10:
	movl	0(%rbp), %eax
.L9:
	imulq	$552, %rax, %rdx
	leaq	16(%r13,%rdx), %rdi
	movq	%rdi, %rcx
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L91
	movq	16(%r13,%rdx), %rdx
	testq	%rdx, %rdx
	je	.L12
	xorl	%eax, %eax
	call	*%rdx
	movq	%rbp, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbp, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L13
	testb	%dl, %dl
	jne	.L92
.L13:
	movl	0(%rbp), %eax
.L12:
	imulq	$552, %rax, %rax
	leaq	32(%r13,%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L93
	movq	32(%r13,%rax), %rdx
	testq	%rdx, %rdx
	je	.L15
	xorl	%eax, %eax
	call	*%rdx
.L15:
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%r12, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L16
	testb	%dl, %dl
	jne	.L94
.L16:
	movl	4(%rbp), %eax
	leaq	(%rax,%rax,2), %rdx
	leaq	8(%rbx,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L17
	cmpb	$3, %dl
	jle	.L95
.L17:
	leaq	(%rax,%rax,2), %rax
	movl	$2, 8(%rbx,%rax,8)
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
.L88:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	__asan_report_load4@PLT
.L86:
	call	__asan_report_load4@PLT
.L85:
	movq	%r12, %rdi
	call	__asan_report_load4@PLT
.L84:
	call	__asan_report_store4@PLT
.L83:
	movq	%r12, %rdi
	call	__asan_report_load4@PLT
.L95:
	call	__asan_report_store4@PLT
.L94:
	movq	%r12, %rdi
	call	__asan_report_load4@PLT
.L92:
	movq	%rbp, %rdi
	call	__asan_report_load4@PLT
.L90:
	movq	%rbp, %rdi
	call	__asan_report_load4@PLT
.L91:
	call	__asan_report_load8@PLT
.L89:
	call	__asan_report_load8@PLT
.L87:
	call	__asan_report_load8@PLT
.L93:
	call	__asan_report_load8@PLT
	.cfi_endproc
.LFE81:
	.size	roxy_thread_runner, .-roxy_thread_runner
	.globl	__asan_stack_malloc_4
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"1 48 552 15 default_task:32"
	.section	.rodata
	.align 32
.LC3:
	.string	""
	.zero	63
	.align 32
.LC4:
	.string	"ROXY-DEBUG: Priority provided by the os: %d\n"
	.zero	51
	.align 32
.LC5:
	.string	"ROXY-DEBUG: Priority defined by roxy: %d\n"
	.zero	54
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
.LASANPC78:
.LFB78:
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
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$768, %rsp
	.cfi_def_cfa_offset 816
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %r12
	movq	%r12, %r13
	testl	%eax, %eax
	jne	.L139
.L96:
	leaq	.LC2(%rip), %rax
	movq	%r12, %rbx
	movl	$8080, %edi
	movq	$1102416563, (%r12)
	movq	%rax, 8(%r12)
	shrq	$3, %rbx
	leaq	.LASANPC78(%rip), %rax
	movq	%rax, 16(%r12)
	movl	$-235802127, 2147450880(%rbx)
	movl	$61937, 2147450884(%rbx)
	movl	$-218103808, 2147450952(%rbx)
	movl	$-202116109, 2147450956(%rbx)
	movl	$-202116109, 2147450960(%rbx)
	movl	$-202116109, 2147450964(%rbx)
	movl	$-202116109, 2147450968(%rbx)
	movq	%fs:40, %rax
	movq	%rax, 760(%rsp)
	xorl	%eax, %eax
	call	srand@PLT
	leaq	roxy_tasks(%rip), %r8
	leaq	48(%r12), %rdx
	leaq	70656(%r8), %r10
	leaq	.LC0(%rip), %r9
	.p2align 4,,10
	.p2align 3
.L102:
	movq	%r8, %rax
	movl	$69, %ecx
	movq	%rdx, %rdi
	movq	%r9, %rsi
	rep movsq
	shrq	$3, %rax
	movzbl	2147450880(%rax), %esi
	leaq	551(%r8), %rax
	movq	%rax, %rcx
	andl	$7, %eax
	shrq	$3, %rcx
	movzbl	2147450880(%rcx), %ecx
	cmpb	%al, %cl
	setle	%dil
	testb	%cl, %cl
	setne	%al
	testb	%al, %dil
	jne	.L113
	testb	%sil, %sil
	setne	%cl
	setle	%al
	testb	%al, %cl
	jne	.L113
	movq	%r8, %rdi
	addq	$552, %r8
	movl	$69, %ecx
	movq	%rdx, %rsi
	rep movsq
	cmpq	%r10, %r8
	jne	.L102
	leaq	8+roxy_threads(%rip), %rdi
	leaq	24576(%rdi), %rcx
	.p2align 4,,10
	.p2align 3
.L105:
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L103
	cmpb	$3, %al
	jle	.L140
.L103:
	leaq	4(%rdi), %r8
	movl	$0, (%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L104
	testb	%dl, %dl
	jne	.L141
.L104:
	movl	$-1, 4(%rdi)
	addq	$24, %rdi
	cmpq	%rcx, %rdi
	jne	.L105
	leaq	roxy_critical_sections(%rip), %rbp
	leaq	640(%rbp), %r14
	.p2align 4,,10
	.p2align 3
.L106:
	movq	%rbp, %rdi
	xorl	%esi, %esi
	addq	$40, %rbp
	call	pthread_mutex_init@PLT
	cmpq	%r14, %rbp
	jne	.L106
	leaq	roxy_mqueues(%rip), %rcx
	leaq	.LC3(%rip), %rbp
	leaq	10240(%rcx), %r14
	.p2align 4,,10
	.p2align 3
.L107:
	movq	%rcx, %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	memcpy@PLT
	movq	%rax, %rcx
	addq	$80, %rcx
	cmpq	%r14, %rcx
	jne	.L107
	leaq	88+roxy_events(%rip), %rbp
	leaq	98304(%rbp), %r14
	.p2align 4,,10
	.p2align 3
.L109:
	leaq	-88(%rbp), %rdi
	xorl	%esi, %esi
	call	pthread_mutex_init@PLT
	leaq	-48(%rbp), %rdi
	xorl	%esi, %esi
	call	pthread_cond_init@PLT
	movq	%rbp, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L108
	cmpb	$3, %al
	jle	.L142
.L108:
	movl	$0, 0(%rbp)
	addq	$96, %rbp
	cmpq	%r14, %rbp
	jne	.L109
	leaq	roxy_interrupts(%rip), %rdi
	leaq	512(%rdi), %rdx
	.p2align 4,,10
	.p2align 3
.L111:
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L143
	movq	$0, (%rdi)
	addq	$8, %rdi
	cmpq	%rdx, %rdi
	jne	.L111
	movl	$2, %edi
	call	sched_get_priority_max@PLT
	movl	$2, %edi
	movl	%eax, %ebp
	call	sched_get_priority_min@PLT
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	subl	%eax, %ebp
	xorl	%eax, %eax
	movl	%ebp, %edx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movl	$64, %edx
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	cmpl	$63, %ebp
	setle	%al
	cmpq	%r12, %r13
	jne	.L144
	movq	$0, 2147450880(%rbx)
	pxor	%xmm0, %xmm0
	movl	$0, 2147450968(%rbx)
	movups	%xmm0, 2147450952(%rbx)
.L98:
	movq	760(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L145
	addq	$768, %rsp
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
.L113:
	.cfi_restore_state
	movl	$552, %esi
	movq	%r8, %rdi
	call	__asan_report_store_n@PLT
.L142:
	movq	%rbp, %rdi
	call	__asan_report_store4@PLT
.L141:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L140:
	call	__asan_report_store4@PLT
.L143:
	call	__asan_report_store8@PLT
.L139:
	movl	$736, %edi
	call	__asan_stack_malloc_4@PLT
	testq	%rax, %rax
	cmovne	%rax, %r12
	jmp	.L96
.L145:
	call	__stack_chk_fail@PLT
.L144:
	movdqa	.LC6(%rip), %xmm0
	movq	$1172321806, (%r12)
	movabsq	$-723401728380766731, %rdx
	movq	%rdx, 2147450960(%rbx)
	movl	$-168430091, 2147450968(%rbx)
	movups	%xmm0, 2147450880(%rbx)
	movups	%xmm0, 2147450896(%rbx)
	movups	%xmm0, 2147450912(%rbx)
	movups	%xmm0, 2147450928(%rbx)
	movups	%xmm0, 2147450944(%rbx)
	movq	1016(%r12), %rdx
	movb	$0, (%rdx)
	jmp	.L98
	.cfi_endproc
.LFE78:
	.size	roxy_init, .-roxy_init
	.section	.rodata
	.align 32
.LC7:
	.string	" "
	.zero	62
	.align 32
.LC8:
	.string	"ROXY-DEBUG: Failed to unlink the mqueue (mqueue_id=%d , channel_name=%s) error_code=%d\n"
	.zero	40
	.align 32
.LC9:
	.string	"ROXY-SYSTEM: Successfully unlink mqueue (mqueue_id=%d , channel_name=%s)\n"
	.zero	54
	.text
	.p2align 4
	.globl	roxy_clean
	.type	roxy_clean, @function
roxy_clean:
.LASANPC79:
.LFB79:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	.LC9(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	roxy_mqueues(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	.LC3(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	.LC7(%rip), %rbx
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L147:
	addl	$1, %r13d
	addq	$80, %r12
	cmpl	$128, %r13d
	je	.L146
.L149:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L147
	movq	%r12, %rdi
	call	mq_unlink@PLT
	testl	%eax, %eax
	jne	.L155
	movl	%r13d, %edx
	movq	%r14, %rsi
	movq	%r12, %rcx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$1, %edx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	memcpy@PLT
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L155:
	movl	%eax, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC8(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L146:
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
	.cfi_endproc
.LFE79:
	.size	roxy_clean, .-roxy_clean
	.section	.rodata
	.align 32
.LC10:
	.string	"ROXY-DEBUG: task_id out-of-bound or task already existed"
	.zero	39
	.text
	.p2align 4
	.globl	roxy_task_create
	.type	roxy_task_create, @function
roxy_task_create:
.LASANPC80:
.LFB80:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpl	$127, %eax
	ja	.L157
	imulq	$552, %rax, %rdi
	movq	%rdx, %r10
	leaq	roxy_tasks(%rip), %rdx
	addq	%rdx, %rdi
	movq	%rdi, %r11
	shrq	$3, %r11
	movzbl	2147450880(%r11), %r11d
	testb	%r11b, %r11b
	je	.L158
	cmpb	$3, %r11b
	jle	.L178
.L158:
	imulq	$552, %rax, %rdi
	addq	%rdx, %rdi
	movl	(%rdi), %r11d
	testl	%r11d, %r11d
	je	.L179
.L157:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$2, %r11d
	movl	%r11d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L179:
	.cfi_restore_state
	movl	$1, (%rdi)
	addq	$4, %rdi
	movq	%rdi, %rbx
	shrq	$3, %rbx
	movzbl	2147450880(%rbx), %ebp
	movq	%rdi, %rbx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%bpl, %bl
	jl	.L159
	testb	%bpl, %bpl
	jne	.L180
.L159:
	imulq	$552, %rax, %rax
	leaq	(%rdx,%rax), %rbx
	leaq	8(%rbx), %rdi
	movl	%esi, 4(%rbx)
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L181
	leaq	16(%rdx,%rax), %rdi
	movq	%r10, 8(%rbx)
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L182
	leaq	32(%rdx,%rax), %r10
	movq	%rcx, 16(%rbx)
	movq	%r10, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L183
	addq	$8, %rdi
	movq	%r8, 32(%rbx)
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L184
	movq	%r9, 24(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r11d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L178:
	.cfi_restore_state
	call	__asan_report_load4@PLT
.L180:
	call	__asan_report_store4@PLT
.L181:
	call	__asan_report_store8@PLT
.L182:
	call	__asan_report_store8@PLT
.L183:
	movq	%r10, %rdi
	call	__asan_report_store8@PLT
.L184:
	call	__asan_report_store8@PLT
	.cfi_endproc
.LFE80:
	.size	roxy_task_create, .-roxy_task_create
	.globl	__asan_stack_malloc_3
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC11:
	.string	"3 48 4 15 scheduler_param 64 56 11 thread_attr 160 128 10 cpuset:199"
	.section	.rodata
	.align 32
.LC12:
	.string	"ROXY-DEBUG: Failed to start the task (task_id=%d)\n"
	.zero	45
	.align 32
.LC13:
	.string	"ROXY-DEBUG: The task (task_id=%d) was already started\n"
	.zero	41
	.align 32
.LC14:
	.string	"ROXY-DEBUG: init pthread attributes failed"
	.zero	53
	.align 32
.LC15:
	.string	"ROXY-DEBUG: pthread setstacksize failed"
	.zero	56
	.align 32
.LC16:
	.string	"ROXY-DEBUG: pthread setschedpolicy failed"
	.zero	54
	.align 32
.LC17:
	.string	"ROXY-DEBUG: pthread setschedparam failed"
	.zero	55
	.align 32
.LC18:
	.string	"ROXY-DEBUG: pthread setinheritsched failed"
	.zero	53
	.align 32
.LC19:
	.string	"ROXY-DEBUG: create compute pthread failed"
	.zero	54
	.text
	.p2align 4
	.globl	roxy_task_start
	.type	roxy_task_start, @function
roxy_task_start:
.LASANPC82:
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
	movl	%esi, %ebx
	subq	$472, %rsp
	.cfi_def_cfa_offset 528
	movl	__asan_option_detect_stack_use_after_return(%rip), %r10d
	leaq	112(%rsp), %r12
	movq	%r12, 8(%rsp)
	testl	%r10d, %r10d
	jne	.L280
.L185:
	leaq	352(%r12), %rax
	movq	%r12, %rbp
	movq	%rax, 24(%rsp)
	leaq	.LC11(%rip), %rax
	shrq	$3, %rbp
	movq	%rax, 8(%r12)
	leaq	.LASANPC82(%rip), %rax
	movq	$1102416563, (%r12)
	movq	%rax, 16(%r12)
	movl	$-235802127, 2147450880(%rbp)
	movl	$-234556943, 2147450884(%rbp)
	movl	$-234881024, 2147450892(%rbp)
	movl	$-218959118, 2147450896(%rbp)
	movl	$-202116109, 2147450916(%rbp)
	movq	%fs:40, %rax
	movq	%rax, 456(%rsp)
	xorl	%eax, %eax
	cmpl	$128, %r13d
	ja	.L189
	movl	%r13d, %eax
	leaq	roxy_tasks(%rip), %rsi
	movq	%rax, 16(%rsp)
	imulq	$552, %rax, %rax
	addq	%rsi, %rax
	movq	%rax, 40(%rsp)
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L190
	cmpb	$3, %al
	jle	.L281
.L190:
	imulq	$552, 16(%rsp), %rax
	leaq	roxy_tasks(%rip), %rcx
	movl	(%rcx,%rax), %r9d
	testl	%r9d, %r9d
	je	.L189
	cmpl	$128, %ebx
	ja	.L189
	leaq	roxy_tasks(%rip), %rsi
	leaq	40(%rsi,%rax), %rdi
	leaq	552(%rsi), %rcx
	movq	%rdi, 32(%rsp)
	addq	%rax, %rcx
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L195:
	addq	$4, %rdi
	cmpq	%rcx, %rdi
	je	.L282
.L196:
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L194
	testb	%dl, %dl
	jne	.L283
.L194:
	cmpl	$-1, (%rdi)
	je	.L195
	movl	%r13d, %edx
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L188:
	cmpq	%r12, 8(%rsp)
	jne	.L284
	movl	$0, 2147450896(%rbp)
	pxor	%xmm0, %xmm0
	movl	$0, 2147450916(%rbp)
	movups	%xmm0, 2147450880(%rbp)
.L187:
	movq	456(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L285
	addq	$472, %rsp
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
.L189:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L188
.L282:
	movq	24(%rsp), %rax
	xorl	%esi, %esi
	movl	$120, %edx
	leaq	-192(%rax), %r15
	leaq	-184(%rax), %rdi
	movq	%r15, 64(%rsp)
	call	memset@PLT
	movq	%r15, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L286
	movq	24(%rsp), %rcx
	movq	$3, -192(%rcx)
	testl	%ebx, %ebx
	je	.L198
	movq	16(%rsp), %rsi
	leal	-1(%rbx), %edx
	movl	%r13d, 76(%rsp)
	leaq	-304(%rcx), %rbx
	movq	%rbx, 96(%rsp)
	leaq	-288(%rcx), %r14
	imulq	$138, %rsi, %rax
	movq	%rbp, 88(%rsp)
	movq	32(%rsp), %rbp
	movq	%r12, 80(%rsp)
	movq	%rbx, %r12
	addq	%rdx, %rax
	leaq	44+roxy_tasks(%rip), %rdx
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 56(%rsp)
	imulq	$552, %rsi, %rax
	leaq	-44(%rdx), %rsi
	leaq	4(%rsi,%rax), %r15
	movq	%r15, %rax
	movq	%r15, 104(%rsp)
	shrq	$3, %rax
	movq	%rax, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L215:
	movq	%r14, %rdx
	movq	%r12, %rax
	xorl	%r8d, %r8d
	movq	%r14, %rdi
	shrq	$3, %rdx
	shrq	$3, %rax
	movl	$0, 2147450880(%rdx)
	movw	%r8w, 2147450884(%rdx)
	movb	$0, 2147450886(%rdx)
	movb	$4, 2147450880(%rax)
	call	pthread_attr_init@PLT
	testl	%eax, %eax
	jne	.L287
	movl	$75, %edi
	call	__sysconf@PLT
	movq	%r14, %rdi
	movq	%rax, %rsi
	call	pthread_attr_setstacksize@PLT
	testl	%eax, %eax
	jne	.L288
	movl	$2, %esi
	movq	%r14, %rdi
	call	pthread_attr_setschedpolicy@PLT
	testl	%eax, %eax
	jne	.L289
	movq	48(%rsp), %rax
	movzbl	2147450880(%rax), %edx
	movq	%r15, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L203
	testb	%dl, %dl
	jne	.L290
.L203:
	movq	%r12, %rax
	movl	(%r15), %edx
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L204
	cmpb	$3, %al
	jle	.L291
.L204:
	movq	24(%rsp), %rax
	movq	%r12, %rsi
	movq	%r14, %rdi
	movl	%edx, -304(%rax)
	call	pthread_attr_setschedparam@PLT
	testl	%eax, %eax
	jne	.L292
	movl	$1, %esi
	movq	%r14, %rdi
	call	pthread_attr_setinheritsched@PLT
	testl	%eax, %eax
	jne	.L293
	movl	$100, %ebx
	leaq	roxy_threads(%rip), %r13
	jmp	.L206
	.p2align 4,,10
	.p2align 3
.L208:
	subl	$1, %ebx
	je	.L214
.L206:
	call	rand@PLT
	cltd
	shrl	$22, %edx
	addl	%edx, %eax
	andl	$1023, %eax
	subl	%edx, %eax
	movslq	%eax, %rcx
	leaq	(%rcx,%rcx,2), %rdx
	leaq	8(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L207
	cmpb	$3, %dl
	jle	.L294
.L207:
	leaq	(%rcx,%rcx,2), %rdx
	salq	$3, %rdx
	leaq	0(%r13,%rdx), %rsi
	movl	8(%rsi), %edi
	testl	%edi, %edi
	jne	.L208
	leaq	16(%r13,%rdx), %rdi
	movl	%eax, %r8d
	movl	$1, 8(%rsi)
	movq	%rcx, %rax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L209
	cmpb	$3, %dl
	jle	.L295
.L209:
	leaq	(%rax,%rax,2), %rdx
	movl	76(%rsp), %ebx
	salq	$3, %rdx
	leaq	20(%r13,%rdx), %rdi
	movl	%ebx, 16(%r13,%rdx)
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %esi
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%sil, %dl
	jl	.L210
	testb	%sil, %sil
	jne	.L296
.L210:
	leaq	(%rax,%rax,2), %rax
	leaq	roxy_thread_runner(%rip), %rdx
	movq	%r14, %rsi
	movl	%r8d, 32(%rsp)
	salq	$3, %rax
	leaq	0(%r13,%rax), %rbx
	leaq	16(%r13,%rax), %rcx
	movl	%r8d, 20(%rbx)
	movq	%rbx, %rdi
	call	pthread_create@PLT
	movl	32(%rsp), %r8d
	testl	%eax, %eax
	jne	.L297
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L298
	movq	64(%rsp), %rdx
	movq	(%rbx), %rdi
	movl	$128, %esi
	movl	%r8d, 32(%rsp)
	call	pthread_setaffinity_np@PLT
	movq	%rbp, %rax
	movl	32(%rsp), %r8d
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbp, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L213
	testb	%dl, %dl
	jne	.L299
.L213:
	movl	%r8d, 0(%rbp)
.L214:
	movq	%r14, %rdx
	movl	$-1800, %eax
	addq	$4, %rbp
	shrq	$3, %rdx
	movw	%ax, 2147450884(%rdx)
	movq	%r12, %rax
	shrq	$3, %rax
	movb	$-8, 2147450886(%rdx)
	movl	$-117901064, 2147450880(%rdx)
	movb	$-8, 2147450880(%rax)
	cmpq	56(%rsp), %rbp
	jne	.L215
	movq	80(%rsp), %r12
	movq	88(%rsp), %rbp
.L198:
	movq	40(%rsp), %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L216
	cmpb	$3, %al
	jle	.L300
.L216:
	imulq	$552, 16(%rsp), %rax
	leaq	roxy_tasks(%rip), %rbx
	movl	$2, (%rbx,%rax)
	xorl	%eax, %eax
	jmp	.L188
.L287:
	leaq	.LC14(%rip), %rdi
	movq	80(%rsp), %r12
	movq	88(%rsp), %rbp
	call	puts@PLT
.L200:
	movl	$2, %eax
	jmp	.L188
.L289:
	leaq	.LC16(%rip), %rdi
	movq	80(%rsp), %r12
	movq	88(%rsp), %rbp
	call	puts@PLT
	jmp	.L200
.L288:
	leaq	.LC15(%rip), %rdi
	movq	80(%rsp), %r12
	movq	88(%rsp), %rbp
	call	puts@PLT
	jmp	.L200
.L293:
	leaq	.LC18(%rip), %rdi
	movq	80(%rsp), %r12
	movq	88(%rsp), %rbp
	call	puts@PLT
	jmp	.L200
.L292:
	leaq	.LC17(%rip), %rdi
	movq	80(%rsp), %r12
	movq	88(%rsp), %rbp
	call	puts@PLT
	jmp	.L200
.L297:
	leaq	.LC19(%rip), %rdi
	movq	80(%rsp), %r12
	movq	88(%rsp), %rbp
	call	puts@PLT
	jmp	.L200
.L294:
	call	__asan_report_load4@PLT
.L283:
	call	__asan_report_load4@PLT
.L280:
	movl	$320, %edi
	call	__asan_stack_malloc_3@PLT
	testq	%rax, %rax
	cmovne	%rax, %r12
	jmp	.L185
.L284:
	movdqa	.LC6(%rip), %xmm0
	movq	$1172321806, (%r12)
	movabsq	$-723401728380766731, %rbx
	movq	%rbx, 2147450912(%rbp)
	movups	%xmm0, 2147450880(%rbp)
	movups	%xmm0, 2147450896(%rbp)
	movq	504(%r12), %rdx
	movb	$0, (%rdx)
	jmp	.L187
.L295:
	call	__asan_report_store4@PLT
.L281:
	movq	40(%rsp), %rdi
	call	__asan_report_load4@PLT
.L286:
	movq	64(%rsp), %rdi
	call	__asan_report_store8@PLT
.L285:
	call	__stack_chk_fail@PLT
.L291:
	movq	96(%rsp), %rdi
	call	__asan_report_store4@PLT
.L290:
	movq	104(%rsp), %rdi
	call	__asan_report_load4@PLT
.L300:
	movq	40(%rsp), %rdi
	call	__asan_report_store4@PLT
.L296:
	call	__asan_report_store4@PLT
.L299:
	movq	%rbp, %rdi
	call	__asan_report_store4@PLT
.L298:
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
	.cfi_endproc
.LFE82:
	.size	roxy_task_start, .-roxy_task_start
	.p2align 4
	.globl	roxy_task_suspend
	.type	roxy_task_suspend, @function
roxy_task_suspend:
.LASANPC83:
.LFB83:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE83:
	.size	roxy_task_suspend, .-roxy_task_suspend
	.globl	__asan_stack_malloc_1
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"2 32 16 7 req:298 64 16 7 rem:298"
	.section	.rodata
	.align 32
.LC21:
	.string	"ROXY-DEBUG: Invalid wait option"
	.zero	32
	.align 32
.LC22:
	.string	"ROXY-DEBUG: Error occurred during wait (might be integer overflow)"
	.zero	61
	.text
	.p2align 4
	.globl	roxy_task_wait
	.type	roxy_task_wait, @function
roxy_task_wait:
.LASANPC84:
.LFB84:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$152, %rsp
	.cfi_def_cfa_offset 192
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %rbx
	movq	%rbx, %r13
	testl	%eax, %eax
	jne	.L315
.L302:
	leaq	.LC20(%rip), %rdx
	movq	%rbx, %rbp
	movl	%r12d, %edi
	movq	$1102416563, (%rbx)
	movq	%rdx, 8(%rbx)
	shrq	$3, %rbp
	leaq	.LASANPC84(%rip), %rdx
	leaq	128(%rbx), %rax
	movq	%rdx, 16(%rbx)
	movl	$-235802127, 2147450880(%rbp)
	movl	$-219021312, 2147450884(%rbp)
	movl	$-202178560, 2147450888(%rbp)
	movq	%fs:40, %rdx
	movq	%rdx, 136(%rsp)
	xorl	%edx, %edx
	testl	%esi, %esi
	je	.L307
	cmpl	$1, %esi
	jne	.L308
	movl	%r12d, %edx
	xorl	%edi, %edi
.L307:
	leaq	-88(%rax), %r9
	leaq	-96(%rax), %r8
	movq	%r9, %rcx
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L316
	movq	%r8, %rcx
	movq	%rdi, -88(%rax)
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L317
	movq	%r8, %rdi
	leaq	-64(%rax), %rsi
	movq	%rdx, -96(%rax)
	call	nanosleep@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	cmpl	$-1, %r8d
	je	.L318
.L305:
	cmpq	%rbx, %r13
	jne	.L319
	movq	$0, 2147450880(%rbp)
	movl	$0, 2147450888(%rbp)
.L304:
	movq	136(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L320
	addq	$152, %rsp
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
.L308:
	.cfi_restore_state
	leaq	.LC21(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L305
	.p2align 4,,10
	.p2align 3
.L318:
	leaq	.LC22(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L305
.L319:
	movabsq	$-723401728380766731, %rdi
	movq	$1172321806, (%rbx)
	movq	%rdi, 2147450880(%rbp)
	movl	$-168430091, 2147450888(%rbp)
	movq	120(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L304
.L315:
	movl	$96, %edi
	movl	%esi, 12(%rsp)
	call	__asan_stack_malloc_1@PLT
	movl	12(%rsp), %esi
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L302
.L316:
	movq	%r9, %rdi
	call	__asan_report_store8@PLT
.L317:
	movq	%r8, %rdi
	call	__asan_report_store8@PLT
.L320:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE84:
	.size	roxy_task_wait, .-roxy_task_wait
	.section	.rodata
	.align 32
.LC23:
	.string	"ROXY-DEBUG: Failed to find the task (task_id=%d)\n"
	.zero	46
	.align 32
.LC24:
	.string	"ROXY-DEBUG: Task must be in the loaded state to set priority, task_id=%d\n"
	.zero	54
	.text
	.p2align 4
	.globl	roxy_task_set_priority
	.type	roxy_task_set_priority, @function
roxy_task_set_priority:
.LASANPC85:
.LFB85:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	%edi, %edx
	cmpl	$127, %edi
	ja	.L325
	movl	%edi, %eax
	leaq	roxy_tasks(%rip), %rcx
	movl	%esi, %r8d
	imulq	$552, %rax, %rdi
	addq	%rcx, %rdi
	movq	%rdi, %rsi
	shrq	$3, %rsi
	movzbl	2147450880(%rsi), %esi
	testb	%sil, %sil
	je	.L324
	cmpb	$3, %sil
	jle	.L344
.L324:
	imulq	$552, %rax, %rdi
	addq	%rcx, %rdi
	movl	(%rdi), %esi
	testl	%esi, %esi
	je	.L325
	cmpl	$1, %esi
	jne	.L345
	addq	$4, %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %esi
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%sil, %dl
	jl	.L327
	testb	%sil, %sil
	jne	.L346
.L327:
	imulq	$552, %rax, %rax
	movl	%r8d, 4(%rcx,%rax)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L325:
	.cfi_restore_state
	leaq	.LC23(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L323:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L345:
	.cfi_restore_state
	leaq	.LC24(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L323
.L344:
	call	__asan_report_load4@PLT
.L346:
	call	__asan_report_store4@PLT
	.cfi_endproc
.LFE85:
	.size	roxy_task_set_priority, .-roxy_task_set_priority
	.section	.rodata
	.align 32
.LC25:
	.string	"ROXY-DEBUG: Failed to lock the critical section mutex (section_id=%d)\n"
	.zero	57
	.text
	.p2align 4
	.globl	roxy_critical_section_enter
	.type	roxy_critical_section_enter, @function
roxy_critical_section_enter:
.LASANPC86:
.LFB86:
	.cfi_startproc
	endbr64
	movl	$2, %eax
	cmpl	$15, %edi
	ja	.L353
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
	jne	.L356
.L347:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L353:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L356:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC25(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L347
	.cfi_endproc
.LFE86:
	.size	roxy_critical_section_enter, .-roxy_critical_section_enter
	.section	.rodata
	.align 32
.LC26:
	.string	"ROXY-DEBUG: Failed to unlock the critical section mutex (section_id=%d)\n"
	.zero	55
	.text
	.p2align 4
	.globl	roxy_critical_section_leave
	.type	roxy_critical_section_leave, @function
roxy_critical_section_leave:
.LASANPC87:
.LFB87:
	.cfi_startproc
	endbr64
	movl	$2, %eax
	cmpl	$15, %edi
	ja	.L363
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
	jne	.L366
.L357:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L363:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L366:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC26(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L357
	.cfi_endproc
.LFE87:
	.size	roxy_critical_section_leave, .-roxy_critical_section_leave
	.section	.rodata
	.align 32
.LC27:
	.string	"ROXY-DEBUG: Failed to join the thread: thread_id=%lu, error_code=%d\n"
	.zero	59
	.text
	.p2align 4
	.globl	roxy_loop
	.type	roxy_loop, @function
roxy_loop:
.LASANPC88:
.LFB88:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	%edi, %edx
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
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
	ja	.L371
	movl	%edi, %r12d
	leaq	roxy_tasks(%rip), %r13
	imulq	$552, %r12, %rdi
	addq	%r13, %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L370
	cmpb	$3, %al
	jle	.L404
.L370:
	imulq	$552, %r12, %rax
	movl	0(%r13,%rax), %ecx
	testl	%ecx, %ecx
	je	.L371
	leaq	40(%r13,%rax), %rbp
	xorl	%r14d, %r14d
	leaq	roxy_threads(%rip), %rbx
	jmp	.L377
	.p2align 4,,10
	.p2align 3
.L373:
	addl	$1, %r14d
	addq	$4, %rbp
	cmpl	$128, %r14d
	je	.L405
.L377:
	movq	%rbp, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbp, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L372
	testb	%dl, %dl
	jne	.L406
.L372:
	movl	0(%rbp), %eax
	cmpl	$-1, %eax
	je	.L373
	leaq	(%rax,%rax,2), %rax
	leaq	(%rbx,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L407
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movl	%eax, %ecx
	testl	%eax, %eax
	je	.L373
	imulq	$138, %r12, %rax
	movslq	%r14d, %r14
	leaq	8(%rax,%r14), %rax
	leaq	8(%r13,%rax,4), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L375
	testb	%dl, %dl
	jne	.L408
.L375:
	imulq	$138, %r12, %r12
	leaq	8(%r12,%r14), %rax
	movl	8(%r13,%rax,4), %eax
	leaq	(%rax,%rax,2), %rax
	leaq	(%rbx,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L409
	movq	(%rdi), %rdx
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
.L371:
	.cfi_restore_state
	leaq	.LC23(%rip), %rsi
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
.L405:
	.cfi_restore_state
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L406:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	__asan_report_load4@PLT
.L407:
	call	__asan_report_load8@PLT
.L408:
	call	__asan_report_load4@PLT
.L409:
	call	__asan_report_load8@PLT
.L404:
	call	__asan_report_load4@PLT
	.cfi_endproc
.LFE88:
	.size	roxy_loop, .-roxy_loop
	.section	.rodata.str1.1
.LC28:
	.string	"1 32 64 15 mqueue_attr:455"
	.section	.rodata
	.align 32
.LC29:
	.string	"ROXY-DEBUG: Failed to start the message queue (mqueue_id=%d)\n"
	.zero	34
	.align 32
.LC30:
	.string	"ROXY-DEBUG: The message queue (mqueue_id=%d), has been initialized before\n"
	.zero	53
	.align 32
.LC31:
	.string	"/%x"
	.zero	60
	.align 32
.LC32:
	.string	"ROXY-DEBUG: Failed to create message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n"
	.zero	37
	.align 32
.LC33:
	.string	"ROXY-DEBUG: Failed to close message queue (mqueue_id=%d, channel_name=%s)\n"
	.zero	53
	.text
	.p2align 4
	.globl	roxy_mqueue_create
	.type	roxy_mqueue_create, @function
roxy_mqueue_create:
.LASANPC89:
.LFB89:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%esi, %r9d
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %rbp
	movl	%edx, (%rsp)
	movq	%rbp, %r15
	testl	%eax, %eax
	jne	.L446
.L410:
	leaq	.LC28(%rip), %rax
	movq	%rbp, %r14
	movq	$1102416563, 0(%rbp)
	leaq	160(%rbp), %rbx
	movq	%rax, 8(%rbp)
	shrq	$3, %r14
	leaq	.LASANPC89(%rip), %rax
	movq	%rax, 16(%rbp)
	movl	$-235802127, 2147450880(%r14)
	movl	$-202116109, 2147450892(%r14)
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	cmpl	$127, %r13d
	ja	.L447
	movl	%r13d, %r10d
	leaq	roxy_mqueues(%rip), %r11
	leaq	(%r10,%r10,4), %r12
	salq	$4, %r12
	addq	%r11, %r12
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L416
	jle	.L448
.L416:
	cmpb	$0, (%r12)
	jne	.L449
	leaq	.LC31(%rip), %rcx
	movq	%r12, %rdi
	xorl	%eax, %eax
	movl	%r13d, %r8d
	movl	$11, %edx
	movl	$1, %esi
	movq	%r10, 8(%rsp)
	movl	%r9d, 4(%rsp)
	call	__sprintf_chk@PLT
	leaq	-120(%rbx), %rdi
	movl	4(%rsp), %r9d
	movq	8(%rsp), %r10
	movq	%rdi, %rax
	leaq	-128(%rbx), %rcx
	leaq	roxy_mqueues(%rip), %r11
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L450
	leaq	-112(%rbx), %rdi
	movq	%r9, -120(%rbx)
	movl	(%rsp), %eax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L451
	movq	%rcx, %rsi
	movq	%rax, -112(%rbx)
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L452
	leaq	-104(%rbx), %rdi
	movq	$0, -128(%rbx)
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L453
	leaq	(%r10,%r10,4), %rdx
	movq	$-1, -104(%rbx)
	salq	$4, %rdx
	leaq	16(%r11,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %r8d
	leaq	63(%rdi), %rax
	movq	%rax, %r9
	andl	$7, %eax
	shrq	$3, %r9
	movzbl	2147450880(%r9), %r9d
	cmpb	%al, %r9b
	setle	%r10b
	testb	%r9b, %r9b
	setne	%al
	testb	%al, %r10b
	jne	.L430
	testb	%r8b, %r8b
	setne	%r9b
	setle	%al
	testb	%al, %r9b
	jne	.L430
	leaq	-65(%rbx), %rax
	movzbl	2147450880(%rsi), %esi
	movq	%rax, %rdi
	andl	$7, %eax
	shrq	$3, %rdi
	movzbl	2147450880(%rdi), %edi
	cmpb	%al, %dil
	setle	%r8b
	testb	%dil, %dil
	setne	%al
	testb	%al, %r8b
	jne	.L431
	testb	%sil, %sil
	setne	%dil
	setle	%al
	testb	%al, %dil
	jne	.L431
	movdqa	-128(%rbx), %xmm1
	movdqa	-112(%rbx), %xmm2
	movq	%r12, %rdi
	leaq	16+roxy_mqueues(%rip), %rax
	movdqa	-96(%rbx), %xmm3
	movdqa	-80(%rbx), %xmm4
	addq	%rdx, %rax
	movl	$524480, %esi
	movaps	%xmm1, (%rax)
	movl	$420, %edx
	movaps	%xmm2, 16(%rax)
	movaps	%xmm3, 32(%rax)
	movaps	%xmm4, 48(%rax)
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %edi
	cmpl	$-1, %eax
	je	.L454
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L455
.L413:
	cmpq	%rbp, %r15
	jne	.L456
	movl	$0, 2147450880(%r14)
	movl	$0, 2147450892(%r14)
.L412:
	movq	168(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L457
	addq	$184, %rsp
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
.L449:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC30(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L447:
	movl	%r13d, %edx
	leaq	.LC29(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L454:
	call	__errno_location@PLT
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rax, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L427
	testb	%cl, %cl
	je	.L427
	movq	%rax, %rdi
	call	__asan_report_load4@PLT
	.p2align 4,,10
	.p2align 3
.L427:
	movl	(%rax), %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC32(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L413
	.p2align 4,,10
	.p2align 3
.L455:
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC33(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L413
.L448:
	movq	%r12, %rdi
	call	__asan_report_load1@PLT
.L456:
	movdqa	.LC6(%rip), %xmm0
	movq	$1172321806, 0(%rbp)
	movups	%xmm0, 2147450880(%r14)
	movq	120(%rbp), %rdx
	movb	$0, (%rdx)
	jmp	.L412
.L446:
	movl	$128, %edi
	movl	%esi, 4(%rsp)
	call	__asan_stack_malloc_1@PLT
	movl	4(%rsp), %r9d
	testq	%rax, %rax
	cmovne	%rax, %rbp
	jmp	.L410
.L457:
	call	__stack_chk_fail@PLT
.L451:
	call	__asan_report_store8@PLT
.L453:
	call	__asan_report_store8@PLT
.L450:
	call	__asan_report_store8@PLT
.L431:
	movl	$64, %esi
	movq	%rcx, %rdi
	call	__asan_report_load_n@PLT
.L430:
	movl	$64, %esi
	call	__asan_report_store_n@PLT
.L452:
	movq	%rcx, %rdi
	call	__asan_report_store8@PLT
	.cfi_endproc
.LFE89:
	.size	roxy_mqueue_create, .-roxy_mqueue_create
	.section	.rodata
	.align 32
.LC34:
	.string	"ROXY-DEBUG: The message queue (mqueue_id=%d), has not been initialized before\n"
	.zero	49
	.align 32
.LC35:
	.string	"ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n"
	.zero	39
	.align 32
.LC36:
	.string	"ROXY-DEBUG: Failed to transmit data on message queue (mqueue_id=%d, channel_name=%s) error_code=%d\n"
	.zero	60
	.text
	.p2align 4
	.globl	roxy_mqueue_send
	.type	roxy_mqueue_send, @function
roxy_mqueue_send:
.LASANPC90:
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
	ja	.L462
	movl	%edi, %eax
	movq	%rsi, %rbp
	movl	%edx, %ebx
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L461
	jle	.L481
.L461:
	cmpb	$0, (%r12)
	je	.L462
	movl	$524289, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
	cmpl	$-1, %eax
	je	.L482
	xorl	%ecx, %ecx
	movl	%ebx, %edx
	movq	%rbp, %rsi
	movl	%eax, %edi
	call	mq_send@PLT
	testl	%eax, %eax
	jne	.L483
	movl	%r14d, %edi
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L484
.L458:
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
.L462:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC34(%rip), %rsi
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
.L482:
	.cfi_restore_state
	call	__errno_location@PLT
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rax, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L464
	testb	%cl, %cl
	je	.L464
	movq	%rax, %rdi
	call	__asan_report_load4@PLT
	.p2align 4,,10
	.p2align 3
.L464:
	movl	(%rax), %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC35(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L458
	.p2align 4,,10
	.p2align 3
.L483:
	movl	%eax, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC36(%rip), %rsi
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
.L481:
	.cfi_restore_state
	movq	%r12, %rdi
	call	__asan_report_load1@PLT
	.p2align 4,,10
	.p2align 3
.L484:
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC33(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L458
	.cfi_endproc
.LFE90:
	.size	roxy_mqueue_send, .-roxy_mqueue_send
	.section	.rodata
	.align 32
.LC37:
	.string	"ROXY-DEBUG: Invalid blocking option at roxy_mqueue_receive"
	.zero	37
	.align 32
.LC38:
	.string	"ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s)\n"
	.zero	54
	.text
	.p2align 4
	.globl	roxy_mqueue_receive
	.type	roxy_mqueue_receive, @function
roxy_mqueue_receive:
.LASANPC91:
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
	ja	.L489
	movl	%edi, %eax
	movq	%rsi, %rbp
	movl	%edx, %ebx
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L488
	jle	.L503
.L488:
	cmpb	$0, (%r12)
	je	.L489
	cmpl	$1, %ecx
	je	.L504
	testl	%ecx, %ecx
	jne	.L492
	movl	$526336, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
.L491:
	cmpl	$-1, %r14d
	je	.L505
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
	jne	.L506
.L485:
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
.L489:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC34(%rip), %rsi
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
.L492:
	.cfi_restore_state
	leaq	.LC37(%rip), %rdi
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
.L504:
	.cfi_restore_state
	movl	$524288, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
	jmp	.L491
	.p2align 4,,10
	.p2align 3
.L505:
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC38(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L485
	.p2align 4,,10
	.p2align 3
.L506:
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC33(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L485
.L503:
	movq	%r12, %rdi
	call	__asan_report_load1@PLT
	.cfi_endproc
.LFE91:
	.size	roxy_mqueue_receive, .-roxy_mqueue_receive
	.section	.rodata.str1.1
.LC39:
	.string	"1 32 64 11 mqueue_attr"
	.section	.rodata
	.align 32
.LC40:
	.string	"ROXY-DEBUG: Failed to obtain the attribute of message queue (mqueue_id=%d, channel_name=%s)\n"
	.zero	35
	.text
	.p2align 4
	.globl	roxy_mqueue_get_pending
	.type	roxy_mqueue_get_pending, @function
roxy_mqueue_get_pending:
.LASANPC92:
.LFB92:
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %rbx
	movq	%rbx, 8(%rsp)
	testl	%eax, %eax
	jne	.L526
.L507:
	leaq	.LC39(%rip), %rax
	movq	%rbx, %r15
	movq	$1102416563, (%rbx)
	leaq	160(%rbx), %rbp
	movq	%rax, 8(%rbx)
	shrq	$3, %r15
	leaq	.LASANPC92(%rip), %rax
	movq	%rax, 16(%rbx)
	movl	$-235802127, 2147450880(%r15)
	movl	$-202116109, 2147450892(%r15)
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	cmpl	$127, %r13d
	ja	.L514
	movl	%r13d, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L513
	jle	.L527
.L513:
	cmpb	$0, (%r12)
	je	.L514
	movl	$524288, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
	cmpl	$-1, %eax
	je	.L528
	leaq	-128(%rbp), %rsi
	movl	%eax, %edi
	call	mq_getattr@PLT
	testl	%eax, %eax
	jne	.L529
	leaq	-104(%rbp), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L530
	movl	-104(%rbp), %r14d
.L510:
	cmpq	%rbx, 8(%rsp)
	jne	.L531
	movl	$0, 2147450880(%r15)
	movl	$0, 2147450892(%r15)
.L509:
	movq	168(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L532
	addq	$184, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r14d, %eax
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
.L527:
	.cfi_restore_state
	movq	%r12, %rdi
	call	__asan_report_load1@PLT
	.p2align 4,,10
	.p2align 3
.L514:
	movl	%r13d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$-1, %r14d
	leaq	.LC34(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L510
.L528:
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC38(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	jmp	.L510
.L529:
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC40(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movl	$-1, %r14d
	call	__printf_chk@PLT
	jmp	.L510
.L526:
	movl	$128, %edi
	call	__asan_stack_malloc_1@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L507
.L531:
	movdqa	.LC6(%rip), %xmm0
	movq	$1172321806, (%rbx)
	movups	%xmm0, 2147450880(%r15)
	movq	120(%rbx), %rax
	movb	$0, (%rax)
	jmp	.L509
.L530:
	call	__asan_report_load8@PLT
.L532:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE92:
	.size	roxy_mqueue_get_pending, .-roxy_mqueue_get_pending
	.globl	__asan_stack_malloc_0
	.section	.rodata.str1.1
.LC41:
	.string	"1 32 8 16 channel_name:614"
	.text
	.p2align 4
	.globl	roxy_mqueue_flush
	.type	roxy_mqueue_flush, @function
roxy_mqueue_flush:
.LASANPC93:
.LFB93:
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
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	movq	%rbx, %r13
	testl	%eax, %eax
	jne	.L540
.L533:
	movq	%rbx, %rbp
	leaq	32(%rbx), %r14
	movl	%r12d, %r8d
	movl	$8, %edx
	leaq	.LC41(%rip), %rax
	shrq	$3, %rbp
	movq	%r14, %rdi
	movl	$1, %esi
	movq	%rax, 8(%rbx)
	leaq	.LASANPC93(%rip), %rax
	leaq	.LC31(%rip), %rcx
	movq	$1102416563, (%rbx)
	movq	%rax, 16(%rbx)
	movl	$-235802127, 2147450880(%rbp)
	movl	$-202116352, 2147450884(%rbp)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movq	%r14, %rdi
	call	mq_unlink@PLT
	testl	%eax, %eax
	jne	.L541
	movq	%r14, %rcx
	movl	%r12d, %edx
	leaq	.LC9(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
.L536:
	cmpq	%rbx, %r13
	jne	.L542
	movq	$0, 2147450880(%rbp)
.L535:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L543
	addq	$96, %rsp
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
.L541:
	.cfi_restore_state
	movl	%eax, %r8d
	movq	%r14, %rcx
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC8(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L536
.L540:
	movl	$64, %edi
	call	__asan_stack_malloc_0@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L533
.L542:
	movabsq	$-723401728380766731, %rdx
	movq	$1172321806, (%rbx)
	movq	%rdx, 2147450880(%rbp)
	movq	56(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L535
.L543:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE93:
	.size	roxy_mqueue_flush, .-roxy_mqueue_flush
	.section	.rodata
	.align 32
.LC42:
	.string	"ROXY-DEBUG: Invalid event (event_id=%d)\n"
	.zero	55
	.text
	.p2align 4
	.globl	roxy_event_send
	.type	roxy_event_send, @function
roxy_event_send:
.LASANPC94:
.LFB94:
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
	ja	.L555
	movl	%edi, %ebx
	leaq	roxy_events(%rip), %r12
	leaq	(%rbx,%rbx,2), %rbp
	salq	$5, %rbp
	leaq	(%r12,%rbp), %r13
	movq	%r13, %rdi
	call	pthread_mutex_lock@PLT
	leaq	88(%r12,%rbp), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L547
	cmpb	$3, %al
	jle	.L556
.L547:
	leaq	(%rbx,%rbx,2), %rax
	leaq	40(%r12,%rbp), %rdi
	salq	$5, %rax
	movl	$0, 88(%r12,%rax)
	call	pthread_cond_broadcast@PLT
	movq	%r13, %rdi
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
.L555:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC42(%rip), %rsi
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
.L556:
	.cfi_restore_state
	call	__asan_report_store4@PLT
	.cfi_endproc
.LFE94:
	.size	roxy_event_send, .-roxy_event_send
	.p2align 4
	.globl	roxy_event_receive
	.type	roxy_event_receive, @function
roxy_event_receive:
.LASANPC95:
.LFB95:
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
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	cmpl	$1023, %edi
	ja	.L577
	movl	%edi, %ebx
	leaq	roxy_events(%rip), %r14
	leaq	(%rbx,%rbx,2), %r13
	salq	$5, %r13
	leaq	(%r14,%r13), %rbp
	leaq	88(%r14,%r13), %r12
	movq	%rbp, %rdi
	call	pthread_mutex_lock@PLT
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L560
	cmpb	$3, %al
	jle	.L578
.L560:
	leaq	(%rbx,%rbx,2), %rbx
	leaq	40(%r14,%r13), %r13
	salq	$5, %rbx
	addq	%r14, %rbx
	movl	$1, 88(%rbx)
	.p2align 4,,10
	.p2align 3
.L562:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pthread_cond_wait@PLT
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L561
	cmpb	$3, %al
	jle	.L579
.L561:
	cmpl	$1, 88(%rbx)
	je	.L562
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
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
.L577:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC42(%rip), %rsi
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
.L578:
	.cfi_restore_state
	movq	%r12, %rdi
	call	__asan_report_store4@PLT
.L579:
	movq	%r12, %rdi
	call	__asan_report_load4@PLT
	.cfi_endproc
.LFE95:
	.size	roxy_event_receive, .-roxy_event_receive
	.p2align 4
	.globl	roxy_signal_handler
	.type	roxy_signal_handler, @function
roxy_signal_handler:
.LASANPC96:
.LFB96:
	.cfi_startproc
	endbr64
	movslq	%edi, %rdi
	leaq	roxy_interrupts(%rip), %rax
	leaq	(%rax,%rdi,8), %r8
	movq	%r8, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L586
	movq	(%rax,%rdi,8), %rdx
	testq	%rdx, %rdx
	je	.L580
	xorl	%eax, %eax
	jmp	*%rdx
	.p2align 4,,10
	.p2align 3
.L580:
	ret
.L586:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
	.cfi_endproc
.LFE96:
	.size	roxy_signal_handler, .-roxy_signal_handler
	.globl	__asan_stack_malloc_2
	.section	.rodata.str1.1
.LC43:
	.string	"1 32 152 17 signal_action:722"
	.section	.rodata
	.align 32
.LC44:
	.string	"ROXY-DEBUG: Interrupt signal out of bound (signal_id=%d)\n"
	.zero	38
	.align 32
.LC45:
	.string	"ROXY-DEBUG: Error setting up signal handler at signal_id=%d\n"
	.zero	35
	.text
	.p2align 4
	.globl	roxy_interrupt_catch
	.type	roxy_interrupt_catch, @function
roxy_interrupt_catch:
.LASANPC97:
.LFB97:
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
	subq	$312, %rsp
	.cfi_def_cfa_offset 368
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %rbx
	movq	%rbx, %r14
	testl	%eax, %eax
	jne	.L598
.L587:
	leaq	.LC43(%rip), %rax
	movq	%rbx, %rbp
	leaq	32(%rbx), %rdi
	movq	$1102416563, (%rbx)
	movq	%rax, 8(%rbx)
	shrq	$3, %rbp
	leaq	.LASANPC97(%rip), %rax
	leaq	288(%rbx), %r13
	movq	%rax, 16(%rbx)
	movl	$-235802127, 2147450880(%rbp)
	movl	$-218103808, 2147450900(%rbp)
	movl	$-202116109, 2147450904(%rbp)
	movl	$-202116109, 2147450908(%rbp)
	movq	%fs:40, %rax
	movq	%rax, 296(%rsp)
	xorl	%eax, %eax
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L599
	leaq	40(%rbx), %r15
	movq	%rsi, -256(%r13)
	movq	%r15, %rdi
	call	sigemptyset@PLT
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	sigaddset@PLT
	cmpl	$63, %r12d
	ja	.L600
.L592:
	leaq	-256(%r13), %rsi
	xorl	%edx, %edx
	movl	%r12d, %edi
	call	sigaction@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L601
.L590:
	cmpq	%rbx, %r14
	jne	.L602
	movl	$0, 2147450880(%rbp)
	movq	$0, 2147450900(%rbp)
	movl	$0, 2147450908(%rbp)
.L589:
	movq	296(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L603
	addq	$312, %rsp
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
.L600:
	.cfi_restore_state
	movl	%r12d, %edx
	leaq	.LC44(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L592
	.p2align 4,,10
	.p2align 3
.L601:
	movl	%r12d, %edx
	leaq	.LC45(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L590
.L598:
	movl	$256, %edi
	movq	%rsi, 8(%rsp)
	call	__asan_stack_malloc_2@PLT
	movq	8(%rsp), %rsi
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L587
.L599:
	call	__asan_report_store8@PLT
.L602:
	movdqa	.LC6(%rip), %xmm0
	movq	$1172321806, (%rbx)
	movups	%xmm0, 2147450880(%rbp)
	movups	%xmm0, 2147450896(%rbp)
	movq	248(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L589
.L603:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE97:
	.size	roxy_interrupt_catch, .-roxy_interrupt_catch
	.bss
	.align 32
	.type	roxy_interrupts, @object
	.size	roxy_interrupts, 512
roxy_interrupts:
	.zero	544
	.align 32
	.type	roxy_events, @object
	.size	roxy_events, 98304
roxy_events:
	.zero	98336
	.align 32
	.type	roxy_mqueues, @object
	.size	roxy_mqueues, 10240
roxy_mqueues:
	.zero	10272
	.align 32
	.type	roxy_critical_sections, @object
	.size	roxy_critical_sections, 640
roxy_critical_sections:
	.zero	672
	.align 32
	.type	roxy_threads, @object
	.size	roxy_threads, 24576
roxy_threads:
	.zero	24608
	.align 32
	.type	roxy_tasks, @object
	.size	roxy_tasks, 70656
roxy_tasks:
	.zero	70688
	.section	.rodata.str1.1
.LC46:
	.string	"src/core.c"
	.section	.data.rel.local,"aw"
	.align 16
	.type	.LASANLOC1, @object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.quad	.LC46
	.long	10
	.long	14
	.align 16
	.type	.LASANLOC2, @object
	.size	.LASANLOC2, 16
.LASANLOC2:
	.quad	.LC46
	.long	9
	.long	26
	.align 16
	.type	.LASANLOC3, @object
	.size	.LASANLOC3, 16
.LASANLOC3:
	.quad	.LC46
	.long	8
	.long	27
	.align 16
	.type	.LASANLOC4, @object
	.size	.LASANLOC4, 16
.LASANLOC4:
	.quad	.LC46
	.long	7
	.long	24
	.align 16
	.type	.LASANLOC5, @object
	.size	.LASANLOC5, 16
.LASANLOC5:
	.quad	.LC46
	.long	6
	.long	27
	.align 16
	.type	.LASANLOC6, @object
	.size	.LASANLOC6, 16
.LASANLOC6:
	.quad	.LC46
	.long	5
	.long	25
	.section	.rodata.str1.1
.LC47:
	.string	"roxy_interrupts"
.LC48:
	.string	"roxy_events"
.LC49:
	.string	"roxy_mqueues"
.LC50:
	.string	"roxy_critical_sections"
.LC51:
	.string	"roxy_threads"
.LC52:
	.string	"roxy_tasks"
.LC53:
	.string	"*.LC35"
.LC54:
	.string	"*.LC16"
.LC55:
	.string	"*.LC5"
.LC56:
	.string	"*.LC44"
.LC57:
	.string	"*.LC7"
.LC58:
	.string	"*.LC15"
.LC59:
	.string	"*.LC34"
.LC60:
	.string	"*.LC42"
.LC61:
	.string	"*.LC26"
.LC62:
	.string	"*.LC12"
.LC63:
	.string	"*.LC1"
.LC64:
	.string	"*.LC37"
.LC65:
	.string	"*.LC13"
.LC66:
	.string	"*.LC32"
.LC67:
	.string	"*.LC18"
.LC68:
	.string	"*.LC19"
.LC69:
	.string	"*.LC30"
.LC70:
	.string	"*.LC40"
.LC71:
	.string	"*.LC38"
.LC72:
	.string	"*.LC9"
.LC73:
	.string	"*.LC33"
.LC74:
	.string	"*.LC25"
.LC75:
	.string	"*.LC27"
.LC76:
	.string	"*.LC4"
.LC77:
	.string	"*.LC14"
.LC78:
	.string	"*.LC22"
.LC79:
	.string	"*.LC23"
.LC80:
	.string	"*.LC3"
.LC81:
	.string	"*.LC29"
.LC82:
	.string	"*.LC8"
.LC83:
	.string	"*.LC36"
.LC84:
	.string	"*.LC17"
.LC85:
	.string	"*.LC31"
.LC86:
	.string	"*.LC21"
.LC87:
	.string	"*.LC10"
.LC88:
	.string	"*.LC24"
.LC89:
	.string	"*.LC45"
	.section	.data.rel.local
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 2752
.LASAN0:
	.quad	roxy_interrupts
	.quad	512
	.quad	544
	.quad	.LC47
	.quad	.LC46
	.quad	0
	.quad	.LASANLOC1
	.quad	0
	.quad	roxy_events
	.quad	98304
	.quad	98336
	.quad	.LC48
	.quad	.LC46
	.quad	0
	.quad	.LASANLOC2
	.quad	0
	.quad	roxy_mqueues
	.quad	10240
	.quad	10272
	.quad	.LC49
	.quad	.LC46
	.quad	0
	.quad	.LASANLOC3
	.quad	0
	.quad	roxy_critical_sections
	.quad	640
	.quad	672
	.quad	.LC50
	.quad	.LC46
	.quad	0
	.quad	.LASANLOC4
	.quad	0
	.quad	roxy_threads
	.quad	24576
	.quad	24608
	.quad	.LC51
	.quad	.LC46
	.quad	0
	.quad	.LASANLOC5
	.quad	0
	.quad	roxy_tasks
	.quad	70656
	.quad	70688
	.quad	.LC52
	.quad	.LC46
	.quad	0
	.quad	.LASANLOC6
	.quad	0
	.quad	.LC35
	.quad	89
	.quad	128
	.quad	.LC53
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC16
	.quad	42
	.quad	96
	.quad	.LC54
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC5
	.quad	42
	.quad	96
	.quad	.LC55
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC44
	.quad	58
	.quad	96
	.quad	.LC56
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC7
	.quad	2
	.quad	64
	.quad	.LC57
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC15
	.quad	40
	.quad	96
	.quad	.LC58
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC34
	.quad	79
	.quad	128
	.quad	.LC59
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC42
	.quad	41
	.quad	96
	.quad	.LC60
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC26
	.quad	73
	.quad	128
	.quad	.LC61
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC12
	.quad	51
	.quad	96
	.quad	.LC62
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC1
	.quad	66
	.quad	128
	.quad	.LC63
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC37
	.quad	59
	.quad	96
	.quad	.LC64
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC13
	.quad	55
	.quad	96
	.quad	.LC65
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC32
	.quad	91
	.quad	128
	.quad	.LC66
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC18
	.quad	43
	.quad	96
	.quad	.LC67
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC19
	.quad	42
	.quad	96
	.quad	.LC68
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC30
	.quad	75
	.quad	128
	.quad	.LC69
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC40
	.quad	93
	.quad	128
	.quad	.LC70
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC38
	.quad	74
	.quad	128
	.quad	.LC71
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC9
	.quad	74
	.quad	128
	.quad	.LC72
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC33
	.quad	75
	.quad	128
	.quad	.LC73
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC25
	.quad	71
	.quad	128
	.quad	.LC74
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC27
	.quad	69
	.quad	128
	.quad	.LC75
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC4
	.quad	45
	.quad	96
	.quad	.LC76
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC14
	.quad	43
	.quad	96
	.quad	.LC77
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC22
	.quad	67
	.quad	128
	.quad	.LC78
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC23
	.quad	50
	.quad	96
	.quad	.LC79
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC3
	.quad	1
	.quad	64
	.quad	.LC80
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC29
	.quad	62
	.quad	96
	.quad	.LC81
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC8
	.quad	88
	.quad	128
	.quad	.LC82
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC36
	.quad	100
	.quad	160
	.quad	.LC83
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC17
	.quad	41
	.quad	96
	.quad	.LC84
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC31
	.quad	4
	.quad	64
	.quad	.LC85
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC21
	.quad	32
	.quad	64
	.quad	.LC86
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC10
	.quad	57
	.quad	96
	.quad	.LC87
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC24
	.quad	74
	.quad	128
	.quad	.LC88
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC45
	.quad	61
	.quad	96
	.quad	.LC89
	.quad	.LC46
	.quad	0
	.quad	0
	.quad	0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00099_0, @function
_sub_D_00099_0:
.LFB98:
	.cfi_startproc
	endbr64
	movl	$43, %esi
	leaq	.LASAN0(%rip), %rdi
	jmp	__asan_unregister_globals@PLT
	.cfi_endproc
.LFE98:
	.size	_sub_D_00099_0, .-_sub_D_00099_0
	.section	.fini_array.00099,"aw"
	.align 8
	.quad	_sub_D_00099_0
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_sub_I_00099_1, @function
_sub_I_00099_1:
.LFB99:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__asan_init@PLT
	call	__asan_version_mismatch_check_v8@PLT
	movl	$43, %esi
	leaq	.LASAN0(%rip), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__asan_register_globals@PLT
	.cfi_endproc
.LFE99:
	.size	_sub_I_00099_1, .-_sub_I_00099_1
	.section	.init_array.00099,"aw"
	.align 8
	.quad	_sub_I_00099_1
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.quad	-723401728380766731
	.quad	-723401728380766731
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
