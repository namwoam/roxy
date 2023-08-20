	.file	"core.c"
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
	jne	.L68
.L2:
	movl	4(%rbp), %ebx
	leaq	roxy_threads(%rip), %r13
	call	gettid@PLT
	movl	%ebx, %edx
	leaq	(%rdx,%rdx,2), %rcx
	leaq	12(%r13,%rcx,8), %rdi
	movq	%rdi, %rcx
	shrq	$3, %rcx
	movzbl	2147450880(%rcx), %esi
	movq	%rdi, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%sil, %cl
	jl	.L3
	testb	%sil, %sil
	jne	.L69
.L3:
	leaq	(%rdx,%rdx,2), %rdx
	movl	%eax, 12(%r13,%rdx,8)
	movq	%rbp, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbp, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L4
	testb	%dl, %dl
	jne	.L70
.L4:
	movl	0(%rbp), %eax
	leaq	roxy_tasks(%rip), %rbx
	leaq	(%rax,%rax,8), %rax
	leaq	(%rbx,%rax,8), %rax
	leaq	8(%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L71
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.L6
	xorl	%eax, %eax
	call	*%rdx
.L6:
	movq	%rbp, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rbp, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L7
	testb	%dl, %dl
	jne	.L72
.L7:
	movl	0(%rbp), %eax
	leaq	(%rax,%rax,8), %rdx
	salq	$3, %rdx
	leaq	16(%rbx,%rdx), %rdi
	movq	%rdi, %rcx
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L73
	movq	16(%rbx,%rdx), %rdx
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
	jne	.L74
.L10:
	movl	0(%rbp), %eax
.L9:
	leaq	(%rax,%rax,8), %rax
	salq	$3, %rax
	leaq	32(%rbx,%rax), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L75
	movq	32(%rbx,%rax), %rdx
	testq	%rdx, %rdx
	je	.L12
	xorl	%eax, %eax
	call	*%rdx
.L12:
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%r12, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L13
	testb	%dl, %dl
	jne	.L76
.L13:
	movl	4(%rbp), %eax
	leaq	(%rax,%rax,2), %rdx
	leaq	8(%r13,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L14
	cmpb	$3, %dl
	jle	.L77
.L14:
	leaq	(%rax,%rax,2), %rax
	movl	$2, 8(%r13,%rax,8)
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
.L72:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	__asan_report_load4@PLT
.L70:
	movq	%rbp, %rdi
	call	__asan_report_load4@PLT
.L69:
	call	__asan_report_store4@PLT
.L68:
	movq	%r12, %rdi
	call	__asan_report_load4@PLT
.L77:
	call	__asan_report_store4@PLT
.L76:
	movq	%r12, %rdi
	call	__asan_report_load4@PLT
.L74:
	movq	%rbp, %rdi
	call	__asan_report_load4@PLT
.L73:
	call	__asan_report_load8@PLT
.L71:
	call	__asan_report_load8@PLT
.L75:
	call	__asan_report_load8@PLT
	.cfi_endproc
.LFE81:
	.size	roxy_thread_runner, .-roxy_thread_runner
	.section	.rodata
	.align 32
.LC0:
	.string	""
	.zero	63
	.text
	.p2align 4
	.globl	roxy_init
	.type	roxy_init, @function
roxy_init:
.LASANPC78:
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
	leaq	roxy_tasks(%rip), %rdi
	leaq	9216(%rdi), %rdx
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L79
	cmpb	$3, %al
	jle	.L188
.L79:
	leaq	4(%rdi), %r8
	movl	$0, (%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L80
	testb	%cl, %cl
	jne	.L189
.L80:
	leaq	8(%rdi), %r8
	movl	$-1, 4(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L190
	leaq	16(%rdi), %r8
	movq	$0, 8(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L191
	leaq	24(%rdi), %r8
	movq	$0, 16(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L192
	leaq	32(%rdi), %r8
	movq	$0, 24(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L193
	leaq	40(%rdi), %r8
	movq	$0, 32(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L85
	cmpb	$3, %al
	jle	.L194
.L85:
	leaq	44(%rdi), %r8
	movl	$-1, 40(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L86
	testb	%cl, %cl
	jne	.L195
.L86:
	leaq	48(%rdi), %r8
	movl	$-1, 44(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L87
	cmpb	$3, %al
	jle	.L196
.L87:
	leaq	52(%rdi), %r8
	movl	$-1, 48(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L88
	testb	%cl, %cl
	jne	.L197
.L88:
	leaq	56(%rdi), %r8
	movl	$-1, 52(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L89
	cmpb	$3, %al
	jle	.L198
.L89:
	leaq	60(%rdi), %r8
	movl	$-1, 56(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L90
	testb	%cl, %cl
	jne	.L199
.L90:
	leaq	64(%rdi), %r8
	movl	$-1, 60(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L91
	cmpb	$3, %al
	jle	.L200
.L91:
	leaq	68(%rdi), %r8
	movl	$-1, 64(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L92
	testb	%cl, %cl
	jne	.L201
.L92:
	movl	$-1, 68(%rdi)
	addq	$72, %rdi
	cmpq	%rdx, %rdi
	jne	.L93
	leaq	8+roxy_threads(%rip), %rdi
	leaq	24576(%rdi), %rcx
	.p2align 4,,10
	.p2align 3
.L96:
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L94
	cmpb	$3, %al
	jle	.L202
.L94:
	leaq	4(%rdi), %r8
	movl	$0, (%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L95
	testb	%dl, %dl
	jne	.L203
.L95:
	movl	$-1, 4(%rdi)
	addq	$24, %rdi
	cmpq	%rcx, %rdi
	jne	.L96
	leaq	roxy_critical_sections(%rip), %rbx
	leaq	640(%rbx), %rbp
	.p2align 4,,10
	.p2align 3
.L97:
	movq	%rbx, %rdi
	xorl	%esi, %esi
	addq	$40, %rbx
	call	pthread_mutex_init@PLT
	cmpq	%rbp, %rbx
	jne	.L97
	leaq	roxy_mqueues(%rip), %rcx
	leaq	.LC0(%rip), %rbx
	leaq	10240(%rcx), %rbp
	.p2align 4,,10
	.p2align 3
.L98:
	movq	%rcx, %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	memcpy@PLT
	movq	%rax, %rcx
	addq	$80, %rcx
	cmpq	%rbp, %rcx
	jne	.L98
	leaq	88+roxy_events(%rip), %rbp
	leaq	12288(%rbp), %rbx
	.p2align 4,,10
	.p2align 3
.L100:
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
	je	.L99
	cmpb	$3, %al
	jle	.L204
.L99:
	movl	$0, 0(%rbp)
	addq	$96, %rbp
	cmpq	%rbx, %rbp
	jne	.L100
	leaq	roxy_interrupts(%rip), %rdi
	leaq	512(%rdi), %rdx
	.p2align 4,,10
	.p2align 3
.L102:
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L205
	movq	$0, (%rdi)
	addq	$8, %rdi
	cmpq	%rdx, %rdi
	jne	.L102
	movl	$2, %edi
	call	sched_get_priority_max@PLT
	movl	$2, %edi
	movl	%eax, %ebx
	call	sched_get_priority_min@PLT
	subl	%eax, %ebx
	xorl	%eax, %eax
	cmpl	$63, %ebx
	setle	%al
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L188:
	.cfi_restore_state
	call	__asan_report_store4@PLT
.L204:
	movq	%rbp, %rdi
	call	__asan_report_store4@PLT
.L203:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L202:
	call	__asan_report_store4@PLT
.L201:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L200:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L199:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L198:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L197:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L196:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L195:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L194:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L193:
	movq	%r8, %rdi
	call	__asan_report_store8@PLT
.L192:
	movq	%r8, %rdi
	call	__asan_report_store8@PLT
.L191:
	movq	%r8, %rdi
	call	__asan_report_store8@PLT
.L190:
	movq	%r8, %rdi
	call	__asan_report_store8@PLT
.L189:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L205:
	call	__asan_report_store8@PLT
	.cfi_endproc
.LFE78:
	.size	roxy_init, .-roxy_init
	.p2align 4
	.globl	roxy_clean
	.type	roxy_clean, @function
roxy_clean:
.LASANPC79:
.LFB79:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	roxy_mqueues(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	10240(%rbp), %rbx
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L208:
	addq	$80, %rbp
	cmpq	%rbx, %rbp
	je	.L206
.L210:
	movq	%rbp, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L207
	jle	.L219
.L207:
	cmpb	$0, 0(%rbp)
	je	.L208
	movq	%rbp, %rdi
	call	mq_unlink@PLT
	testl	%eax, %eax
	jne	.L220
	movq	%rbp, %rdi
	movl	$1, %edx
	movq	%r12, %rsi
	addq	$80, %rbp
	call	memcpy@PLT
	cmpq	%rbx, %rbp
	jne	.L210
.L206:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L220:
	.cfi_restore_state
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$2, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L219:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	__asan_report_load1@PLT
	.cfi_endproc
.LFE79:
	.size	roxy_clean, .-roxy_clean
	.p2align 4
	.globl	roxy_task_create
	.type	roxy_task_create, @function
roxy_task_create:
.LASANPC80:
.LFB80:
	.cfi_startproc
	endbr64
	movl	%edi, %eax
	cmpl	$127, %eax
	ja	.L246
	leaq	(%rax,%rax,8), %rdi
	movq	%rdx, %r11
	leaq	roxy_tasks(%rip), %rdx
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	(%rdx,%rdi,8), %r10
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%r10, %rdi
	shrq	$3, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movzbl	2147450880(%rdi), %edi
	testb	%dil, %dil
	je	.L224
	cmpb	$3, %dil
	jle	.L247
.L224:
	leaq	(%rax,%rax,8), %rdi
	leaq	(%rdx,%rdi,8), %rdi
	movl	(%rdi), %r10d
	testl	%r10d, %r10d
	je	.L248
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$2, %r10d
	movl	%r10d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L248:
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
	jl	.L226
	testb	%bpl, %bpl
	jne	.L249
.L226:
	leaq	(%rax,%rax,8), %rbx
	salq	$3, %rbx
	leaq	(%rdx,%rbx), %rax
	leaq	8(%rax), %rdi
	movl	%esi, 4(%rax)
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L250
	leaq	16(%rdx,%rbx), %rdi
	movq	%r11, 8(%rax)
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L251
	leaq	32(%rdx,%rbx), %r11
	movq	%rcx, 16(%rax)
	movq	%r11, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L252
	addq	$8, %rdi
	movq	%r8, 32(%rax)
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L253
	movq	%r9, 24(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	%r10d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L246:
	.cfi_restore 3
	.cfi_restore 6
	movl	$2, %eax
	ret
.L247:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	movq	%r10, %rdi
	call	__asan_report_load4@PLT
.L249:
	call	__asan_report_store4@PLT
.L250:
	call	__asan_report_store8@PLT
.L251:
	call	__asan_report_store8@PLT
.L252:
	movq	%r11, %rdi
	call	__asan_report_store8@PLT
.L253:
	call	__asan_report_store8@PLT
	.cfi_endproc
.LFE80:
	.size	roxy_task_create, .-roxy_task_create
	.globl	__asan_stack_malloc_3
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"3 48 4 15 scheduler_param 64 56 11 thread_attr 160 128 10 cpuset:219"
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
	subq	$440, %rsp
	.cfi_def_cfa_offset 496
	movl	__asan_option_detect_stack_use_after_return(%rip), %r10d
	leaq	80(%rsp), %rax
	movl	%edi, 16(%rsp)
	movq	%rax, 24(%rsp)
	movq	%rax, 56(%rsp)
	testl	%r10d, %r10d
	jne	.L396
.L254:
	movq	24(%rsp), %rax
	leaq	352(%rax), %rcx
	movq	%rcx, 8(%rsp)
	leaq	.LC1(%rip), %rcx
	movq	%rcx, 8(%rax)
	leaq	.LASANPC82(%rip), %rcx
	movq	$1102416563, (%rax)
	movq	%rcx, 16(%rax)
	shrq	$3, %rax
	movq	%rax, 48(%rsp)
	movl	$-235802127, 2147450880(%rax)
	movl	$-234556943, 2147450884(%rax)
	movl	$-234881024, 2147450892(%rax)
	movl	$-218959118, 2147450896(%rax)
	movl	$-202116109, 2147450916(%rax)
	movq	%fs:40, %rax
	movq	%rax, 424(%rsp)
	movl	16(%rsp), %eax
	cmpl	$128, %eax
	ja	.L293
	movl	%eax, %r13d
	leaq	roxy_tasks(%rip), %rcx
	leaq	0(%r13,%r13,8), %rax
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 64(%rsp)
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L259
	cmpb	$3, %al
	jle	.L397
.L259:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rcx
	salq	$3, %rax
	movl	(%rcx,%rax), %r9d
	testl	%r9d, %r9d
	je	.L293
	cmpl	$8, %ebx
	ja	.L293
	leaq	40(%rcx,%rax), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L260
	testb	%dl, %dl
	jne	.L398
.L260:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rcx
	cmpl	$-1, 40(%rcx,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L293
	leaq	44(%rcx,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L261
	testb	%dl, %dl
	jne	.L399
.L261:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rcx
	cmpl	$-1, 44(%rcx,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L293
	leaq	48(%rcx,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L262
	testb	%dl, %dl
	jne	.L400
.L262:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rcx
	cmpl	$-1, 48(%rcx,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L293
	leaq	52(%rcx,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L263
	testb	%dl, %dl
	jne	.L401
.L263:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rsi
	cmpl	$-1, 52(%rsi,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L293
	leaq	56(%rsi,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L264
	testb	%dl, %dl
	jne	.L402
.L264:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rcx
	cmpl	$-1, 56(%rcx,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L293
	leaq	60(%rcx,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L265
	testb	%dl, %dl
	jne	.L403
.L265:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rsi
	cmpl	$-1, 60(%rsi,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L293
	leaq	64(%rsi,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L266
	testb	%dl, %dl
	jne	.L404
.L266:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rcx
	cmpl	$-1, 64(%rcx,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L293
	leaq	68(%rcx,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L267
	testb	%dl, %dl
	jne	.L405
.L267:
	leaq	0(%r13,%r13,8), %rbp
	leaq	roxy_tasks(%rip), %rax
	leaq	0(,%rbp,8), %r12
	addq	%r12, %rax
	cmpl	$-1, 68(%rax)
	movq	%rax, %r15
	jne	.L293
	movq	8(%rsp), %rax
	xorl	%esi, %esi
	movl	$120, %edx
	leaq	-192(%rax), %r14
	leaq	-184(%rax), %rdi
	movq	%r14, 40(%rsp)
	call	memset@PLT
	movq	%r14, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L406
	movq	8(%rsp), %rsi
	movq	$3, -192(%rsi)
	testl	%ebx, %ebx
	je	.L269
	leaq	roxy_tasks(%rip), %rax
	movq	%r13, 72(%rsp)
	leaq	-304(%rsi), %r14
	movq	%r15, %r13
	leaq	40(%rax,%r12), %r12
	leal	-1(%rbx), %eax
	leaq	(%rax,%rbp,2), %rdx
	leaq	44+roxy_tasks(%rip), %rax
	leaq	(%rax,%rdx,4), %rax
	leaq	-288(%rsi), %rbp
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L281:
	movq	%rbp, %rdx
	movq	%r14, %rax
	xorl	%r8d, %r8d
	movq	%rbp, %rdi
	shrq	$3, %rdx
	shrq	$3, %rax
	movl	$0, 2147450880(%rdx)
	movw	%r8w, 2147450884(%rdx)
	movb	$0, 2147450886(%rdx)
	movb	$4, 2147450880(%rax)
	call	pthread_attr_init@PLT
	testl	%eax, %eax
	jne	.L293
	movl	$75, %edi
	call	__sysconf@PLT
	movq	%rbp, %rdi
	movq	%rax, %rsi
	call	pthread_attr_setstacksize@PLT
	testl	%eax, %eax
	jne	.L293
	movl	$2, %esi
	movq	%rbp, %rdi
	call	pthread_attr_setschedpolicy@PLT
	testl	%eax, %eax
	jne	.L293
	leaq	4(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L271
	testb	%dl, %dl
	jne	.L407
.L271:
	movq	%r14, %rax
	movl	4(%r13), %edx
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L272
	cmpb	$3, %al
	jle	.L408
.L272:
	movq	8(%rsp), %rax
	movq	%r14, %rsi
	movq	%rbp, %rdi
	movl	%edx, -304(%rax)
	call	pthread_attr_setschedparam@PLT
	testl	%eax, %eax
	jne	.L293
	movl	$1, %esi
	movq	%rbp, %rdi
	call	pthread_attr_setinheritsched@PLT
	testl	%eax, %eax
	jne	.L293
	movl	$100, %ebx
	leaq	roxy_threads(%rip), %r15
	jmp	.L280
	.p2align 4,,10
	.p2align 3
.L274:
	subl	$1, %ebx
	je	.L279
.L280:
	call	rand@PLT
	cltd
	shrl	$22, %edx
	addl	%edx, %eax
	andl	$1023, %eax
	subl	%edx, %eax
	movslq	%eax, %rcx
	leaq	(%rcx,%rcx,2), %rdx
	leaq	8(%r15,%rdx,8), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L273
	cmpb	$3, %dl
	jle	.L409
.L273:
	leaq	(%rcx,%rcx,2), %rdx
	salq	$3, %rdx
	leaq	(%r15,%rdx), %rsi
	movl	8(%rsi), %edi
	testl	%edi, %edi
	jne	.L274
	leaq	16(%r15,%rdx), %rdi
	movl	%eax, %r8d
	movl	$1, 8(%rsi)
	movq	%rcx, %rax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L275
	cmpb	$3, %dl
	jle	.L410
.L275:
	leaq	(%rax,%rax,2), %rdx
	movl	16(%rsp), %ebx
	salq	$3, %rdx
	leaq	20(%r15,%rdx), %rdi
	movl	%ebx, 16(%r15,%rdx)
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %esi
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%sil, %dl
	jl	.L276
	testb	%sil, %sil
	jne	.L411
.L276:
	leaq	(%rax,%rax,2), %rax
	leaq	roxy_thread_runner(%rip), %rdx
	movq	%rbp, %rsi
	movl	%r8d, 20(%rsp)
	salq	$3, %rax
	leaq	(%r15,%rax), %rbx
	leaq	16(%r15,%rax), %rcx
	movl	%r8d, 20(%rbx)
	movq	%rbx, %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	jne	.L293
	movq	%rbx, %rax
	movl	20(%rsp), %r8d
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L412
	movq	40(%rsp), %rdx
	movq	(%rbx), %rdi
	movl	$128, %esi
	movl	%r8d, 20(%rsp)
	call	pthread_setaffinity_np@PLT
	movq	%r12, %rax
	movl	20(%rsp), %r8d
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%r12, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L278
	testb	%dl, %dl
	jne	.L413
.L278:
	movl	%r8d, (%r12)
.L279:
	movq	%rbp, %rdx
	movl	$-1800, %eax
	addq	$4, %r12
	shrq	$3, %rdx
	movw	%ax, 2147450884(%rdx)
	movq	%r14, %rax
	shrq	$3, %rax
	movb	$-8, 2147450886(%rdx)
	movl	$-117901064, 2147450880(%rdx)
	movb	$-8, 2147450880(%rax)
	cmpq	32(%rsp), %r12
	jne	.L281
	movq	72(%rsp), %r13
.L269:
	movq	64(%rsp), %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L282
	cmpb	$3, %al
	jg	.L282
	movq	64(%rsp), %rdi
	call	__asan_report_store4@PLT
	.p2align 4,,10
	.p2align 3
.L293:
	movl	$2, %eax
.L257:
	movq	24(%rsp), %rcx
	cmpq	%rcx, 56(%rsp)
	jne	.L414
	movq	48(%rsp), %rbx
	pxor	%xmm0, %xmm0
	movl	$0, 2147450896(%rbx)
	movl	$0, 2147450916(%rbx)
	movups	%xmm0, 2147450880(%rbx)
.L256:
	movq	424(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L415
	addq	$440, %rsp
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
.L282:
	.cfi_restore_state
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rbx
	movl	$2, (%rbx,%rax,8)
	xorl	%eax, %eax
	jmp	.L257
.L409:
	call	__asan_report_load4@PLT
.L405:
	call	__asan_report_load4@PLT
.L412:
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.L410:
	call	__asan_report_store4@PLT
.L404:
	call	__asan_report_load4@PLT
.L403:
	call	__asan_report_load4@PLT
.L402:
	call	__asan_report_load4@PLT
.L414:
	movq	$1172321806, (%rcx)
	movdqa	.LC2(%rip), %xmm0
	movq	%rcx, %rsi
	movabsq	$-723401728380766731, %rcx
	movq	48(%rsp), %rbx
	movq	%rcx, 2147450912(%rbx)
	movups	%xmm0, 2147450880(%rbx)
	movups	%xmm0, 2147450896(%rbx)
	movq	504(%rsi), %rdx
	movb	$0, (%rdx)
	jmp	.L256
.L415:
	call	__stack_chk_fail@PLT
.L397:
	movq	64(%rsp), %rdi
	call	__asan_report_load4@PLT
.L401:
	call	__asan_report_load4@PLT
.L411:
	call	__asan_report_store4@PLT
.L398:
	call	__asan_report_load4@PLT
.L399:
	call	__asan_report_load4@PLT
.L400:
	call	__asan_report_load4@PLT
.L407:
	call	__asan_report_load4@PLT
.L408:
	movq	%r14, %rdi
	call	__asan_report_store4@PLT
.L406:
	movq	40(%rsp), %rdi
	call	__asan_report_store8@PLT
.L413:
	movq	%r12, %rdi
	call	__asan_report_store4@PLT
.L396:
	movl	$320, %edi
	call	__asan_stack_malloc_3@PLT
	testq	%rax, %rax
	cmove	24(%rsp), %rax
	movq	%rax, 24(%rsp)
	jmp	.L254
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
.LC3:
	.string	"2 32 16 7 req:318 64 16 7 rem:318"
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
	jne	.L429
.L417:
	movq	%rbx, %rbp
	leaq	.LC3(%rip), %rdx
	leaq	.LASANPC84(%rip), %rdi
	movq	$1102416563, (%rbx)
	shrq	$3, %rbp
	movq	%rdi, 16(%rbx)
	leaq	128(%rbx), %rax
	movl	%r12d, %edi
	movq	%rdx, 8(%rbx)
	movl	$-235802127, 2147450880(%rbp)
	movl	$-219021312, 2147450884(%rbp)
	movl	$-202178560, 2147450888(%rbp)
	movq	%fs:40, %rdx
	movq	%rdx, 136(%rsp)
	xorl	%edx, %edx
	testl	%esi, %esi
	je	.L422
	cmpl	$1, %esi
	jne	.L427
	movl	%r12d, %edx
	xorl	%edi, %edi
.L422:
	leaq	-88(%rax), %r9
	leaq	-96(%rax), %r8
	movq	%r9, %rcx
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L430
	movq	%r8, %rcx
	movq	%rdi, -88(%rax)
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L431
	leaq	-64(%rax), %rsi
	movq	%r8, %rdi
	movq	%rdx, -96(%rax)
	call	nanosleep@PLT
	cmpl	$-1, %eax
	sete	%al
	movzbl	%al, %eax
	addl	%eax, %eax
.L420:
	cmpq	%rbx, %r13
	jne	.L432
	movq	$0, 2147450880(%rbp)
	movl	$0, 2147450888(%rbp)
.L419:
	movq	136(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L433
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
.L427:
	.cfi_restore_state
	movl	$2, %eax
	jmp	.L420
.L432:
	movabsq	$-723401728380766731, %rdx
	movq	$1172321806, (%rbx)
	movq	%rdx, 2147450880(%rbp)
	movl	$-168430091, 2147450888(%rbp)
	movq	120(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L419
.L429:
	movl	$96, %edi
	movl	%esi, 12(%rsp)
	call	__asan_stack_malloc_1@PLT
	movl	12(%rsp), %esi
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L417
.L433:
	call	__stack_chk_fail@PLT
.L431:
	movq	%r8, %rdi
	call	__asan_report_store8@PLT
.L430:
	movq	%r9, %rdi
	call	__asan_report_store8@PLT
	.cfi_endproc
.LFE84:
	.size	roxy_task_wait, .-roxy_task_wait
	.p2align 4
	.globl	roxy_task_set_priority
	.type	roxy_task_set_priority, @function
roxy_task_set_priority:
.LASANPC85:
.LFB85:
	.cfi_startproc
	endbr64
	cmpl	$127, %edi
	ja	.L451
	movl	%edi, %edi
	leaq	roxy_tasks(%rip), %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	(%rdi,%rdi,8), %rdx
	leaq	(%rax,%rdx,8), %r8
	movq	%r8, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L436
	cmpb	$3, %dl
	jle	.L455
.L436:
	leaq	(%rdi,%rdi,8), %rdx
	leaq	(%rax,%rdx,8), %rdx
	cmpl	$1, (%rdx)
	je	.L456
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L456:
	.cfi_restore_state
	addq	$4, %rdx
	movq	%rdx, %rcx
	shrq	$3, %rcx
	movzbl	2147450880(%rcx), %r8d
	movq	%rdx, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%r8b, %cl
	jl	.L437
	testb	%r8b, %r8b
	jne	.L457
.L437:
	leaq	(%rdi,%rdi,8), %rdx
	movl	%esi, 4(%rax,%rdx,8)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L451:
	movl	$2, %eax
	ret
.L455:
	.cfi_def_cfa_offset 16
	movq	%r8, %rdi
	call	__asan_report_load4@PLT
.L457:
	movq	%rdx, %rdi
	call	__asan_report_store4@PLT
	.cfi_endproc
.LFE85:
	.size	roxy_task_set_priority, .-roxy_task_set_priority
	.p2align 4
	.globl	roxy_critical_section_enter
	.type	roxy_critical_section_enter, @function
roxy_critical_section_enter:
.LASANPC86:
.LFB86:
	.cfi_startproc
	endbr64
	cmpl	$15, %edi
	ja	.L461
	movl	%edi, %edi
	leaq	roxy_critical_sections(%rip), %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	(%rdi,%rdi,4), %rdx
	leaq	(%rax,%rdx,8), %rdi
	call	pthread_mutex_lock@PLT
	testl	%eax, %eax
	setne	%al
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	addl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L461:
	movl	$2, %eax
	ret
	.cfi_endproc
.LFE86:
	.size	roxy_critical_section_enter, .-roxy_critical_section_enter
	.p2align 4
	.globl	roxy_critical_section_leave
	.type	roxy_critical_section_leave, @function
roxy_critical_section_leave:
.LASANPC87:
.LFB87:
	.cfi_startproc
	endbr64
	cmpl	$15, %edi
	ja	.L469
	movl	%edi, %edi
	leaq	roxy_critical_sections(%rip), %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	(%rdi,%rdi,4), %rdx
	leaq	(%rax,%rdx,8), %rdi
	call	pthread_mutex_unlock@PLT
	testl	%eax, %eax
	setne	%al
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	addl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L469:
	movl	$2, %eax
	ret
	.cfi_endproc
.LFE87:
	.size	roxy_critical_section_leave, .-roxy_critical_section_leave
	.p2align 4
	.globl	roxy_loop
	.type	roxy_loop, @function
roxy_loop:
.LASANPC88:
.LFB88:
	.cfi_startproc
	endbr64
	cmpl	$127, %edi
	ja	.L582
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	roxy_tasks(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	leaq	(%rbx,%rbx,8), %rax
	leaq	0(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L476
	cmpb	$3, %al
	jle	.L586
.L476:
	leaq	(%rbx,%rbx,8), %rax
	salq	$3, %rax
	movl	0(%rbp,%rax), %edx
	testl	%edx, %edx
	je	.L475
	leaq	40(%rbp,%rax), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L477
	testb	%dl, %dl
	jne	.L587
.L477:
	leaq	(%rbx,%rbx,8), %rax
	movl	40(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L588
.L478:
	leaq	(%rbx,%rbx,8), %rax
	leaq	44(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L480
	testb	%dl, %dl
	jne	.L589
.L480:
	leaq	(%rbx,%rbx,8), %rax
	movl	44(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L590
.L481:
	leaq	(%rbx,%rbx,8), %rax
	leaq	48(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L483
	testb	%dl, %dl
	jne	.L591
.L483:
	leaq	(%rbx,%rbx,8), %rax
	movl	48(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L592
.L484:
	leaq	(%rbx,%rbx,8), %rax
	leaq	52(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L486
	testb	%dl, %dl
	jne	.L593
.L486:
	leaq	(%rbx,%rbx,8), %rax
	movl	52(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L594
.L487:
	leaq	(%rbx,%rbx,8), %rax
	leaq	56(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L489
	testb	%dl, %dl
	jne	.L595
.L489:
	leaq	(%rbx,%rbx,8), %rax
	movl	56(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L596
.L490:
	leaq	(%rbx,%rbx,8), %rax
	leaq	60(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L492
	testb	%dl, %dl
	jne	.L597
.L492:
	leaq	(%rbx,%rbx,8), %rax
	movl	60(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L598
.L493:
	leaq	(%rbx,%rbx,8), %rax
	leaq	64(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L495
	testb	%dl, %dl
	jne	.L599
.L495:
	leaq	(%rbx,%rbx,8), %rax
	movl	64(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L600
.L496:
	leaq	(%rbx,%rbx,8), %rax
	leaq	68(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L498
	testb	%dl, %dl
	jne	.L601
.L498:
	leaq	(%rbx,%rbx,8), %rax
	movl	68(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L499
.L502:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L588:
	.cfi_restore_state
	leaq	(%rax,%rax,2), %rdx
	leaq	roxy_threads(%rip), %rax
	leaq	(%rax,%rdx,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L602
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L478
.L475:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$2, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L590:
	.cfi_restore_state
	leaq	(%rax,%rax,2), %rdx
	leaq	roxy_threads(%rip), %rax
	leaq	(%rax,%rdx,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L603
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L481
	jmp	.L475
	.p2align 4,,10
	.p2align 3
.L592:
	leaq	(%rax,%rax,2), %rdx
	leaq	roxy_threads(%rip), %rax
	leaq	(%rax,%rdx,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L604
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L484
	jmp	.L475
	.p2align 4,,10
	.p2align 3
.L594:
	leaq	(%rax,%rax,2), %rdx
	leaq	roxy_threads(%rip), %rax
	leaq	(%rax,%rdx,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L605
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L487
	jmp	.L475
	.p2align 4,,10
	.p2align 3
.L596:
	leaq	(%rax,%rax,2), %rdx
	leaq	roxy_threads(%rip), %rax
	leaq	(%rax,%rdx,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L606
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L490
	jmp	.L475
	.p2align 4,,10
	.p2align 3
.L598:
	leaq	(%rax,%rax,2), %rdx
	leaq	roxy_threads(%rip), %rax
	leaq	(%rax,%rdx,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L607
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L493
	jmp	.L475
	.p2align 4,,10
	.p2align 3
.L600:
	leaq	(%rax,%rax,2), %rdx
	leaq	roxy_threads(%rip), %rax
	leaq	(%rax,%rdx,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L608
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L496
	jmp	.L475
	.p2align 4,,10
	.p2align 3
.L499:
	leaq	(%rax,%rax,2), %rdx
	leaq	roxy_threads(%rip), %rax
	leaq	(%rax,%rdx,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L609
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L502
	jmp	.L475
	.p2align 4,,10
	.p2align 3
.L582:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	movl	$2, %eax
	ret
.L601:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	call	__asan_report_load4@PLT
.L586:
	call	__asan_report_load4@PLT
.L587:
	call	__asan_report_load4@PLT
.L589:
	call	__asan_report_load4@PLT
.L591:
	call	__asan_report_load4@PLT
.L593:
	call	__asan_report_load4@PLT
.L595:
	call	__asan_report_load4@PLT
.L597:
	call	__asan_report_load4@PLT
.L599:
	call	__asan_report_load4@PLT
.L605:
	call	__asan_report_load8@PLT
.L606:
	call	__asan_report_load8@PLT
.L607:
	call	__asan_report_load8@PLT
.L608:
	call	__asan_report_load8@PLT
.L603:
	call	__asan_report_load8@PLT
.L604:
	call	__asan_report_load8@PLT
.L609:
	call	__asan_report_load8@PLT
.L602:
	call	__asan_report_load8@PLT
	.cfi_endproc
.LFE88:
	.size	roxy_loop, .-roxy_loop
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"1 32 64 15 mqueue_attr:475"
	.section	.rodata
	.align 32
.LC5:
	.string	"/%x"
	.zero	60
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
	movl	%edi, %r8d
	movl	%esi, %r9d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r14d
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %rbx
	movq	%rbx, %r15
	testl	%eax, %eax
	jne	.L639
.L610:
	leaq	.LC4(%rip), %rax
	movq	%rbx, %r13
	movq	$1102416563, (%rbx)
	leaq	160(%rbx), %rbp
	movq	%rax, 8(%rbx)
	shrq	$3, %r13
	leaq	.LASANPC89(%rip), %rax
	movq	%rax, 16(%rbx)
	movl	$-235802127, 2147450880(%r13)
	movl	$-202116109, 2147450892(%r13)
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	cmpl	$127, %r8d
	ja	.L617
	movl	%r8d, %r10d
	leaq	roxy_mqueues(%rip), %r11
	leaq	(%r10,%r10,4), %r12
	salq	$4, %r12
	addq	%r11, %r12
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L616
	jle	.L640
.L616:
	cmpb	$0, (%r12)
	movq	%r10, 8(%rsp)
	movl	%r9d, 4(%rsp)
	jne	.L617
	movq	%r12, %rdi
	xorl	%eax, %eax
	movl	$11, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rcx
	call	__sprintf_chk@PLT
	leaq	-120(%rbp), %rdi
	movl	4(%rsp), %r9d
	movq	8(%rsp), %r10
	movq	%rdi, %rax
	leaq	-128(%rbp), %rcx
	leaq	roxy_mqueues(%rip), %r11
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L641
	leaq	-112(%rbp), %rdi
	movq	%r9, -120(%rbp)
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L642
	movq	%rcx, %rsi
	movq	%r14, -112(%rbp)
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L643
	leaq	-104(%rbp), %rdi
	movq	$0, -128(%rbp)
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L644
	leaq	(%r10,%r10,4), %rdx
	movq	$-1, -104(%rbp)
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
	jne	.L627
	testb	%r8b, %r8b
	setne	%r9b
	setle	%al
	testb	%al, %r9b
	jne	.L627
	leaq	-65(%rbp), %rax
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
	jne	.L628
	testb	%sil, %sil
	setne	%dil
	setle	%al
	testb	%al, %dil
	jne	.L628
	movdqa	-128(%rbp), %xmm1
	movdqa	-112(%rbp), %xmm2
	movq	%r12, %rdi
	leaq	16+roxy_mqueues(%rip), %rax
	movdqa	-96(%rbp), %xmm3
	movdqa	-80(%rbp), %xmm4
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
	je	.L617
	call	mq_close@PLT
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %eax
	jmp	.L613
	.p2align 4,,10
	.p2align 3
.L617:
	movl	$2, %eax
.L613:
	cmpq	%rbx, %r15
	jne	.L645
	movl	$0, 2147450880(%r13)
	movl	$0, 2147450892(%r13)
.L612:
	movq	168(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L646
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
.L640:
	.cfi_restore_state
	movq	%r12, %rdi
	call	__asan_report_load1@PLT
.L645:
	movdqa	.LC2(%rip), %xmm0
	movq	$1172321806, (%rbx)
	movups	%xmm0, 2147450880(%r13)
	movq	120(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L612
.L639:
	movl	%edi, 4(%rsp)
	movl	$128, %edi
	movl	%esi, 8(%rsp)
	call	__asan_stack_malloc_1@PLT
	movl	8(%rsp), %r9d
	movl	4(%rsp), %r8d
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L610
.L646:
	call	__stack_chk_fail@PLT
.L627:
	movl	$64, %esi
	call	__asan_report_store_n@PLT
.L641:
	call	__asan_report_store8@PLT
.L644:
	call	__asan_report_store8@PLT
.L643:
	movq	%rcx, %rdi
	call	__asan_report_store8@PLT
.L642:
	call	__asan_report_store8@PLT
.L628:
	movl	$64, %esi
	movq	%rcx, %rdi
	call	__asan_report_load_n@PLT
	.cfi_endproc
.LFE89:
	.size	roxy_mqueue_create, .-roxy_mqueue_create
	.p2align 4
	.globl	roxy_mqueue_send
	.type	roxy_mqueue_send, @function
roxy_mqueue_send:
.LASANPC90:
.LFB90:
	.cfi_startproc
	endbr64
	cmpl	$127, %edi
	ja	.L664
	movl	%edi, %edi
	leaq	roxy_mqueues(%rip), %rax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	(%rdi,%rdi,4), %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	salq	$4, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edx, %ebx
	addq	%rax, %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L650
	jle	.L665
.L650:
	cmpb	$0, (%rdi)
	je	.L651
	movl	$524289, %esi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r12d
	cmpl	$-1, %eax
	je	.L651
	xorl	%ecx, %ecx
	movl	%ebx, %edx
	movq	%rbp, %rsi
	movl	%eax, %edi
	call	mq_send@PLT
	testl	%eax, %eax
	jne	.L651
	movl	%r12d, %edi
	call	mq_close@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L651:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 24
	movl	$2, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L664:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	movl	$2, %eax
	ret
.L665:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	call	__asan_report_load1@PLT
	.cfi_endproc
.LFE90:
	.size	roxy_mqueue_send, .-roxy_mqueue_send
	.globl	__asan_stack_malloc_0
	.section	.rodata.str1.1
.LC6:
	.string	"1 32 4 10 error_code"
	.text
	.p2align 4
	.globl	roxy_mqueue_receive
	.type	roxy_mqueue_receive, @function
roxy_mqueue_receive:
.LASANPC91:
.LFB91:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%ecx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %rbx
	movq	%rbx, %r12
	testl	%eax, %eax
	jne	.L689
.L666:
	leaq	.LC6(%rip), %rax
	movq	%rbx, %r14
	movq	$1102416563, (%rbx)
	leaq	96(%rbx), %rcx
	movq	%rax, 8(%rbx)
	shrq	$3, %r14
	leaq	.LASANPC91(%rip), %rax
	movq	%rax, 16(%rbx)
	movl	$-235802127, 2147450880(%r14)
	movl	$-202116348, 2147450884(%r14)
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	cmpl	$127, %ebp
	ja	.L688
	leaq	0(%rbp,%rbp,4), %rdi
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %rdi
	addq	%rax, %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L672
	jle	.L690
.L672:
	cmpb	$0, (%rdi)
	je	.L688
	movl	%edx, 12(%rsp)
	movq	%rcx, (%rsp)
	cmpl	$1, %r13d
	je	.L691
	testl	%r13d, %r13d
	jne	.L688
	movl	$526336, %esi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	12(%rsp), %edx
	movq	(%rsp), %rcx
	movl	%eax, %ebp
.L675:
	cmpl	$-1, %ebp
	je	.L688
	movl	%ebp, %edi
	subq	$64, %rcx
	movq	%r15, %rsi
	call	mq_receive@PLT
	movl	%ebp, %edi
	cmpl	$-1, %eax
	je	.L692
	call	mq_close@PLT
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %eax
	jmp	.L669
	.p2align 4,,10
	.p2align 3
.L692:
	call	mq_close@PLT
	.p2align 4,,10
	.p2align 3
.L688:
	movl	$2, %eax
.L669:
	cmpq	%rbx, %r12
	jne	.L693
	movq	$0, 2147450880(%r14)
.L668:
	movq	104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L694
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
.L691:
	.cfi_restore_state
	movl	$524288, %esi
	xorl	%eax, %eax
	call	mq_open@PLT
	movq	(%rsp), %rcx
	movl	12(%rsp), %edx
	movl	%eax, %ebp
	jmp	.L675
.L690:
	call	__asan_report_load1@PLT
.L693:
	movabsq	$-723401728380766731, %rsi
	movq	$1172321806, (%rbx)
	movq	%rsi, 2147450880(%r14)
	movq	56(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L668
.L689:
	movl	$64, %edi
	movl	%edx, (%rsp)
	call	__asan_stack_malloc_0@PLT
	movl	(%rsp), %edx
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L666
.L694:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE91:
	.size	roxy_mqueue_receive, .-roxy_mqueue_receive
	.section	.rodata.str1.1
.LC7:
	.string	"1 32 64 11 mqueue_attr"
	.text
	.p2align 4
	.globl	roxy_mqueue_get_pending
	.type	roxy_mqueue_get_pending, @function
roxy_mqueue_get_pending:
.LASANPC92:
.LFB92:
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
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$160, %rsp
	.cfi_def_cfa_offset 208
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	movq	%rbx, %r12
	testl	%eax, %eax
	jne	.L715
.L695:
	leaq	.LC7(%rip), %rax
	movq	%rbx, %r13
	movq	$1102416563, (%rbx)
	leaq	160(%rbx), %r14
	movq	%rax, 8(%rbx)
	shrq	$3, %r13
	leaq	.LASANPC92(%rip), %rax
	movq	%rax, 16(%rbx)
	movl	$-235802127, 2147450880(%r13)
	movl	$-202116109, 2147450892(%r13)
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	cmpl	$127, %ebp
	ja	.L702
	leaq	0(%rbp,%rbp,4), %rdi
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %rdi
	addq	%rax, %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L701
	jle	.L716
.L701:
	cmpb	$0, (%rdi)
	je	.L702
	movl	$524288, %esi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %edi
	cmpl	$-1, %eax
	je	.L702
	leaq	-128(%r14), %rsi
	call	mq_getattr@PLT
	testl	%eax, %eax
	jne	.L702
	leaq	-104(%r14), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L717
	movl	-104(%r14), %eax
.L698:
	cmpq	%rbx, %r12
	jne	.L718
	movl	$0, 2147450880(%r13)
	movl	$0, 2147450892(%r13)
.L697:
	movq	152(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L719
	addq	$160, %rsp
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
.L702:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L698
.L716:
	call	__asan_report_load1@PLT
.L718:
	movdqa	.LC2(%rip), %xmm0
	movq	$1172321806, (%rbx)
	movups	%xmm0, 2147450880(%r13)
	movq	120(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L697
.L717:
	call	__asan_report_load8@PLT
.L715:
	movl	$128, %edi
	call	__asan_stack_malloc_1@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L695
.L719:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE92:
	.size	roxy_mqueue_get_pending, .-roxy_mqueue_get_pending
	.section	.rodata.str1.1
.LC8:
	.string	"1 32 8 16 channel_name:644"
	.text
	.p2align 4
	.globl	roxy_mqueue_flush
	.type	roxy_mqueue_flush, @function
roxy_mqueue_flush:
.LASANPC93:
.LFB93:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%edi, %r8d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$120, %rsp
	.cfi_def_cfa_offset 160
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %rbx
	movq	%rbx, %r13
	testl	%eax, %eax
	jne	.L727
.L720:
	leaq	.LC8(%rip), %rax
	movq	%rbx, %rbp
	leaq	32(%rbx), %r12
	movl	$8, %edx
	movq	%rax, 8(%rbx)
	shrq	$3, %rbp
	movq	%r12, %rdi
	movl	$1, %esi
	leaq	.LASANPC93(%rip), %rax
	movq	$1102416563, (%rbx)
	leaq	.LC5(%rip), %rcx
	movq	%rax, 16(%rbx)
	movl	$-235802127, 2147450880(%rbp)
	movl	$-202116352, 2147450884(%rbp)
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movq	%r12, %rdi
	call	mq_unlink@PLT
	testl	%eax, %eax
	je	.L723
	movl	$2, %eax
.L723:
	cmpq	%rbx, %r13
	jne	.L728
	movq	$0, 2147450880(%rbp)
.L722:
	movq	104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L729
	addq	$120, %rsp
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
.L727:
	.cfi_restore_state
	movl	%edi, 12(%rsp)
	movl	$64, %edi
	call	__asan_stack_malloc_0@PLT
	movl	12(%rsp), %r8d
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L720
.L728:
	movabsq	$-723401728380766731, %rsi
	movq	$1172321806, (%rbx)
	movq	%rsi, 2147450880(%rbp)
	movq	56(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L722
.L729:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE93:
	.size	roxy_mqueue_flush, .-roxy_mqueue_flush
	.p2align 4
	.globl	roxy_event_send
	.type	roxy_event_send, @function
roxy_event_send:
.LASANPC94:
.LFB94:
	.cfi_startproc
	endbr64
	cmpl	$127, %edi
	ja	.L733
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	roxy_events(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%edi, %ebx
	leaq	(%rbx,%rbx,2), %rbp
	salq	$5, %rbp
	leaq	(%r12,%rbp), %r13
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%r13, %rdi
	call	pthread_mutex_lock@PLT
	leaq	88(%r12,%rbp), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L732
	cmpb	$3, %al
	jle	.L744
.L732:
	leaq	(%rbx,%rbx,2), %rax
	leaq	40(%r12,%rbp), %rdi
	salq	$5, %rax
	movl	$0, 88(%r12,%rax)
	call	pthread_cond_broadcast@PLT
	movq	%r13, %rdi
	call	pthread_mutex_unlock@PLT
	addq	$8, %rsp
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
.L733:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	movl	$2, %eax
	ret
.L744:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
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
	cmpl	$127, %edi
	ja	.L750
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	roxy_events(%rip), %r14
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
	movl	%edi, %ebx
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
	je	.L747
	cmpb	$3, %al
	jle	.L768
.L747:
	leaq	(%rbx,%rbx,2), %rbx
	leaq	40(%r14,%r13), %r13
	salq	$5, %rbx
	addq	%r14, %rbx
	movl	$1, 88(%rbx)
	.p2align 4,,10
	.p2align 3
.L749:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pthread_cond_wait@PLT
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L748
	cmpb	$3, %al
	jle	.L769
.L748:
	cmpl	$1, 88(%rbx)
	je	.L749
	movq	%rbp, %rdi
	call	pthread_mutex_unlock@PLT
	popq	%rbx
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
.L750:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	movl	$2, %eax
	ret
.L768:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
	movq	%r12, %rdi
	call	__asan_report_store4@PLT
.L769:
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
	jne	.L776
	movq	(%rax,%rdi,8), %rdx
	testq	%rdx, %rdx
	je	.L770
	xorl	%eax, %eax
	jmp	*%rdx
	.p2align 4,,10
	.p2align 3
.L770:
	ret
.L776:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
	.cfi_endproc
.LFE96:
	.size	roxy_signal_handler, .-roxy_signal_handler
	.globl	__asan_stack_malloc_2
	.section	.rodata.str1.1
.LC9:
	.string	"1 32 152 17 signal_action:752"
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
	movq	%rbx, %r13
	testl	%eax, %eax
	jne	.L784
.L777:
	leaq	.LC9(%rip), %rcx
	movq	%rbx, %rbp
	leaq	32(%rbx), %r14
	movq	$1102416563, (%rbx)
	movq	%rcx, 8(%rbx)
	shrq	$3, %rbp
	leaq	.LASANPC97(%rip), %rcx
	leaq	288(%rbx), %rax
	movq	%rcx, 16(%rbx)
	movl	$-235802127, 2147450880(%rbp)
	movl	$-218103808, 2147450900(%rbp)
	movl	$-202116109, 2147450904(%rbp)
	movl	$-202116109, 2147450908(%rbp)
	movq	%fs:40, %rdx
	movq	%rdx, 296(%rsp)
	xorl	%edx, %edx
	movq	%r14, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L785
	leaq	40(%rbx), %r15
	movq	%rsi, -256(%rax)
	movq	%r15, %rdi
	call	sigemptyset@PLT
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	sigaddset@PLT
	xorl	%edx, %edx
	movq	%r14, %rsi
	movl	%r12d, %edi
	call	sigaction@PLT
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	addl	%eax, %eax
	cmpq	%rbx, %r13
	jne	.L786
	movl	$0, 2147450880(%rbp)
	movq	$0, 2147450900(%rbp)
	movl	$0, 2147450908(%rbp)
.L779:
	movq	296(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L787
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
.L784:
	.cfi_restore_state
	movl	$256, %edi
	movq	%rsi, 8(%rsp)
	call	__asan_stack_malloc_2@PLT
	movq	8(%rsp), %rsi
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L777
.L786:
	movdqa	.LC2(%rip), %xmm0
	movq	$1172321806, (%rbx)
	movups	%xmm0, 2147450880(%rbp)
	movups	%xmm0, 2147450896(%rbp)
	movq	248(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L779
.L785:
	movq	%r14, %rdi
	call	__asan_report_store8@PLT
.L787:
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
	.size	roxy_events, 12288
roxy_events:
	.zero	12320
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
	.size	roxy_tasks, 9216
roxy_tasks:
	.zero	9248
	.section	.rodata.str1.1
.LC10:
	.string	"src/core.c"
	.section	.data.rel.local,"aw"
	.align 16
	.type	.LASANLOC1, @object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.quad	.LC10
	.long	30
	.long	14
	.align 16
	.type	.LASANLOC2, @object
	.size	.LASANLOC2, 16
.LASANLOC2:
	.quad	.LC10
	.long	29
	.long	26
	.align 16
	.type	.LASANLOC3, @object
	.size	.LASANLOC3, 16
.LASANLOC3:
	.quad	.LC10
	.long	28
	.long	27
	.align 16
	.type	.LASANLOC4, @object
	.size	.LASANLOC4, 16
.LASANLOC4:
	.quad	.LC10
	.long	27
	.long	24
	.align 16
	.type	.LASANLOC5, @object
	.size	.LASANLOC5, 16
.LASANLOC5:
	.quad	.LC10
	.long	26
	.long	27
	.align 16
	.type	.LASANLOC6, @object
	.size	.LASANLOC6, 16
.LASANLOC6:
	.quad	.LC10
	.long	25
	.long	25
	.section	.rodata.str1.1
.LC11:
	.string	"roxy_interrupts"
.LC12:
	.string	"roxy_events"
.LC13:
	.string	"roxy_mqueues"
.LC14:
	.string	"roxy_critical_sections"
.LC15:
	.string	"roxy_threads"
.LC16:
	.string	"roxy_tasks"
.LC17:
	.string	"*.LC0"
.LC18:
	.string	"*.LC5"
	.section	.data.rel.local
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 512
.LASAN0:
	.quad	roxy_interrupts
	.quad	512
	.quad	544
	.quad	.LC11
	.quad	.LC10
	.quad	0
	.quad	.LASANLOC1
	.quad	0
	.quad	roxy_events
	.quad	12288
	.quad	12320
	.quad	.LC12
	.quad	.LC10
	.quad	0
	.quad	.LASANLOC2
	.quad	0
	.quad	roxy_mqueues
	.quad	10240
	.quad	10272
	.quad	.LC13
	.quad	.LC10
	.quad	0
	.quad	.LASANLOC3
	.quad	0
	.quad	roxy_critical_sections
	.quad	640
	.quad	672
	.quad	.LC14
	.quad	.LC10
	.quad	0
	.quad	.LASANLOC4
	.quad	0
	.quad	roxy_threads
	.quad	24576
	.quad	24608
	.quad	.LC15
	.quad	.LC10
	.quad	0
	.quad	.LASANLOC5
	.quad	0
	.quad	roxy_tasks
	.quad	9216
	.quad	9248
	.quad	.LC16
	.quad	.LC10
	.quad	0
	.quad	.LASANLOC6
	.quad	0
	.quad	.LC0
	.quad	1
	.quad	64
	.quad	.LC17
	.quad	.LC10
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC5
	.quad	4
	.quad	64
	.quad	.LC18
	.quad	.LC10
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
	movl	$8, %esi
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
	movl	$8, %esi
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
.LC2:
	.quad	-723401728380766731
	.quad	-723401728380766731
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
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
