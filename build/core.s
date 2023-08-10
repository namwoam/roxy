	.file	"core.c"
	.text
	.section	.rodata
	.align 32
.LC0:
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
	leaq	.LC0(%rip), %rsi
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
	leaq	(%rax,%rax,8), %rdx
	leaq	0(%r13,%rdx,8), %rdx
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
	leaq	(%rax,%rax,8), %rdx
	salq	$3, %rdx
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
	leaq	(%rax,%rax,8), %rax
	salq	$3, %rax
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
	.section	.rodata
	.align 32
.LC1:
	.string	""
	.zero	63
	.align 32
.LC2:
	.string	"ROXY-DEBUG: Priority provided by the os: %d\n"
	.zero	51
	.align 32
.LC3:
	.string	"ROXY-DEBUG: Priority defined by roxy: %d\n"
	.zero	54
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
.L111:
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L97
	cmpb	$3, %al
	jle	.L206
.L97:
	leaq	4(%rdi), %r8
	movl	$0, (%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L98
	testb	%cl, %cl
	jne	.L207
.L98:
	leaq	8(%rdi), %r8
	movl	$-1, 4(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L208
	leaq	16(%rdi), %r8
	movq	$0, 8(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L209
	leaq	24(%rdi), %r8
	movq	$0, 16(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L210
	leaq	32(%rdi), %r8
	movq	$0, 24(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L211
	leaq	40(%rdi), %r8
	movq	$0, 32(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L103
	cmpb	$3, %al
	jle	.L212
.L103:
	leaq	44(%rdi), %r8
	movl	$-1, 40(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L104
	testb	%cl, %cl
	jne	.L213
.L104:
	leaq	48(%rdi), %r8
	movl	$-1, 44(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L105
	cmpb	$3, %al
	jle	.L214
.L105:
	leaq	52(%rdi), %r8
	movl	$-1, 48(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L106
	testb	%cl, %cl
	jne	.L215
.L106:
	leaq	56(%rdi), %r8
	movl	$-1, 52(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L107
	cmpb	$3, %al
	jle	.L216
.L107:
	leaq	60(%rdi), %r8
	movl	$-1, 56(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L108
	testb	%cl, %cl
	jne	.L217
.L108:
	leaq	64(%rdi), %r8
	movl	$-1, 60(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L109
	cmpb	$3, %al
	jle	.L218
.L109:
	leaq	68(%rdi), %r8
	movl	$-1, 64(%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %ecx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	jl	.L110
	testb	%cl, %cl
	jne	.L219
.L110:
	movl	$-1, 68(%rdi)
	addq	$72, %rdi
	cmpq	%rdx, %rdi
	jne	.L111
	leaq	8+roxy_threads(%rip), %rdi
	leaq	24576(%rdi), %rcx
	.p2align 4,,10
	.p2align 3
.L114:
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L112
	cmpb	$3, %al
	jle	.L220
.L112:
	leaq	4(%rdi), %r8
	movl	$0, (%rdi)
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%r8, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L113
	testb	%dl, %dl
	jne	.L221
.L113:
	movl	$-1, 4(%rdi)
	addq	$24, %rdi
	cmpq	%rcx, %rdi
	jne	.L114
	leaq	roxy_critical_sections(%rip), %rbx
	leaq	640(%rbx), %rbp
	.p2align 4,,10
	.p2align 3
.L115:
	movq	%rbx, %rdi
	xorl	%esi, %esi
	addq	$40, %rbx
	call	pthread_mutex_init@PLT
	cmpq	%rbp, %rbx
	jne	.L115
	leaq	roxy_mqueues(%rip), %rcx
	leaq	.LC1(%rip), %rbx
	leaq	10240(%rcx), %rbp
	.p2align 4,,10
	.p2align 3
.L116:
	movq	%rcx, %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	memcpy@PLT
	movq	%rax, %rcx
	addq	$80, %rcx
	cmpq	%rbp, %rcx
	jne	.L116
	leaq	88+roxy_events(%rip), %rbp
	leaq	12288(%rbp), %rbx
	.p2align 4,,10
	.p2align 3
.L118:
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
	je	.L117
	cmpb	$3, %al
	jle	.L222
.L117:
	movl	$0, 0(%rbp)
	addq	$96, %rbp
	cmpq	%rbx, %rbp
	jne	.L118
	leaq	roxy_interrupts(%rip), %rdi
	leaq	512(%rdi), %rdx
	.p2align 4,,10
	.p2align 3
.L120:
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L223
	movq	$0, (%rdi)
	addq	$8, %rdi
	cmpq	%rdx, %rdi
	jne	.L120
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
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L206:
	.cfi_restore_state
	call	__asan_report_store4@PLT
.L222:
	movq	%rbp, %rdi
	call	__asan_report_store4@PLT
.L221:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L220:
	call	__asan_report_store4@PLT
.L219:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L218:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L217:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L216:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L215:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L214:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L213:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L212:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L211:
	movq	%r8, %rdi
	call	__asan_report_store8@PLT
.L210:
	movq	%r8, %rdi
	call	__asan_report_store8@PLT
.L209:
	movq	%r8, %rdi
	call	__asan_report_store8@PLT
.L208:
	movq	%r8, %rdi
	call	__asan_report_store8@PLT
.L207:
	movq	%r8, %rdi
	call	__asan_report_store4@PLT
.L223:
	call	__asan_report_store8@PLT
	.cfi_endproc
.LFE78:
	.size	roxy_init, .-roxy_init
	.section	.rodata
	.align 32
.LC4:
	.string	"ROXY-DEBUG: Failed to unlink the mqueue (mqueue_id=%d , channel_name=%s) error_code=%d\n"
	.zero	40
	.align 32
.LC5:
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
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	roxy_mqueues(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	.LC5(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	.LC1(%rip), %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	jmp	.L228
	.p2align 4,,10
	.p2align 3
.L226:
	addl	$1, %r13d
	addq	$80, %r12
	cmpl	$128, %r13d
	je	.L224
.L228:
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L225
	jle	.L237
.L225:
	cmpb	$0, (%r12)
	je	.L226
	movq	%r12, %rdi
	call	mq_unlink@PLT
	testl	%eax, %eax
	jne	.L238
	movl	%r13d, %edx
	movq	%rbp, %rsi
	movq	%r12, %rcx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	memcpy@PLT
	jmp	.L226
	.p2align 4,,10
	.p2align 3
.L238:
	movl	%eax, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L224:
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
.L237:
	.cfi_restore_state
	movq	%r12, %rdi
	call	__asan_report_load1@PLT
	.cfi_endproc
.LFE79:
	.size	roxy_clean, .-roxy_clean
	.section	.rodata
	.align 32
.LC6:
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
	ja	.L240
	movq	%rdx, %r11
	movq	%rcx, %rbx
	leaq	roxy_tasks(%rip), %rdx
	leaq	(%rax,%rax,8), %rcx
	leaq	(%rdx,%rcx,8), %rdi
	movq	%rdi, %rcx
	shrq	$3, %rcx
	movzbl	2147450880(%rcx), %ecx
	testb	%cl, %cl
	je	.L241
	cmpb	$3, %cl
	jle	.L261
.L241:
	leaq	(%rax,%rax,8), %rcx
	leaq	(%rdx,%rcx,8), %rdi
	movl	(%rdi), %r10d
	testl	%r10d, %r10d
	je	.L262
.L240:
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
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
.L262:
	.cfi_restore_state
	movl	$1, (%rdi)
	addq	$4, %rdi
	movq	%rdi, %rcx
	shrq	$3, %rcx
	movzbl	2147450880(%rcx), %ebp
	movq	%rdi, %rcx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%bpl, %cl
	jl	.L242
	testb	%bpl, %bpl
	jne	.L263
.L242:
	leaq	(%rax,%rax,8), %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rax
	leaq	8(%rax), %rdi
	movl	%esi, 4(%rax)
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L264
	leaq	16(%rdx,%rcx), %rdi
	movq	%r11, 8(%rax)
	movq	%rdi, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L265
	leaq	32(%rdx,%rcx), %r11
	movq	%rbx, 16(%rax)
	movq	%r11, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L266
	addq	$8, %rdi
	movq	%r8, 32(%rax)
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L267
	movq	%r9, 24(%rax)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r10d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L261:
	.cfi_restore_state
	call	__asan_report_load4@PLT
.L263:
	call	__asan_report_store4@PLT
.L264:
	call	__asan_report_store8@PLT
.L265:
	call	__asan_report_store8@PLT
.L266:
	movq	%r11, %rdi
	call	__asan_report_store8@PLT
.L267:
	call	__asan_report_store8@PLT
	.cfi_endproc
.LFE80:
	.size	roxy_task_create, .-roxy_task_create
	.globl	__asan_stack_malloc_3
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"3 48 4 15 scheduler_param 64 56 11 thread_attr 160 128 10 cpuset:219"
	.section	.rodata
	.align 32
.LC8:
	.string	"ROXY-DEBUG: Failed to start the task (task_id=%d)\n"
	.zero	45
	.align 32
.LC9:
	.string	"ROXY-DEBUG: The task (task_id=%d) was already started\n"
	.zero	41
	.align 32
.LC10:
	.string	"ROXY-DEBUG: init pthread attributes failed"
	.zero	53
	.align 32
.LC11:
	.string	"ROXY-DEBUG: pthread setstacksize failed"
	.zero	56
	.align 32
.LC12:
	.string	"ROXY-DEBUG: pthread setschedpolicy failed"
	.zero	54
	.align 32
.LC13:
	.string	"ROXY-DEBUG: pthread setschedparam failed"
	.zero	55
	.align 32
.LC14:
	.string	"ROXY-DEBUG: pthread setinheritsched failed"
	.zero	53
	.align 32
.LC15:
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
	jne	.L411
.L268:
	movq	24(%rsp), %rax
	leaq	352(%rax), %rcx
	movq	%rcx, 8(%rsp)
	leaq	.LC7(%rip), %rcx
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
	ja	.L272
	movl	%eax, %r13d
	leaq	roxy_tasks(%rip), %rcx
	leaq	0(%r13,%r13,8), %rax
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, 64(%rsp)
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L273
	cmpb	$3, %al
	jle	.L412
.L273:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rcx
	salq	$3, %rax
	movl	(%rcx,%rax), %r9d
	testl	%r9d, %r9d
	je	.L272
	cmpl	$8, %ebx
	ja	.L272
	leaq	roxy_tasks(%rip), %rcx
	leaq	40(%rcx,%rax), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L277
	testb	%dl, %dl
	jne	.L413
.L277:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rcx
	cmpl	$-1, 40(%rcx,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L278
	leaq	44(%rcx,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L279
	testb	%dl, %dl
	jne	.L414
.L279:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rcx
	cmpl	$-1, 44(%rcx,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L278
	leaq	48(%rcx,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L280
	testb	%dl, %dl
	jne	.L415
.L280:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rsi
	cmpl	$-1, 48(%rsi,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L278
	leaq	52(%rsi,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L281
	testb	%dl, %dl
	jne	.L416
.L281:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rcx
	cmpl	$-1, 52(%rcx,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L278
	leaq	56(%rcx,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L282
	testb	%dl, %dl
	jne	.L417
.L282:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rcx
	cmpl	$-1, 56(%rcx,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L278
	leaq	60(%rcx,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L283
	testb	%dl, %dl
	jne	.L418
.L283:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rsi
	cmpl	$-1, 60(%rsi,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L278
	leaq	64(%rsi,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L284
	testb	%dl, %dl
	jne	.L419
.L284:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rsi
	cmpl	$-1, 64(%rsi,%rax,8)
	leaq	0(,%rax,8), %rdx
	jne	.L278
	leaq	68(%rsi,%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L285
	testb	%dl, %dl
	jne	.L420
.L285:
	leaq	0(%r13,%r13,8), %rbp
	leaq	roxy_tasks(%rip), %rax
	leaq	0(,%rbp,8), %r12
	addq	%r12, %rax
	cmpl	$-1, 68(%rax)
	movq	%rax, %r15
	jne	.L278
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
	jne	.L421
	movq	8(%rsp), %rcx
	movq	$3, -192(%rcx)
	testl	%ebx, %ebx
	je	.L288
	leaq	roxy_tasks(%rip), %rax
	movq	%r13, 72(%rsp)
	leaq	-304(%rcx), %r14
	movq	%r15, %r13
	leaq	40(%rax,%r12), %r12
	leal	-1(%rbx), %eax
	leaq	(%rax,%rbp,2), %rdx
	leaq	44+roxy_tasks(%rip), %rax
	leaq	(%rax,%rdx,4), %rax
	leaq	-288(%rcx), %rbp
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L305:
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
	jne	.L422
	movl	$75, %edi
	call	__sysconf@PLT
	movq	%rbp, %rdi
	movq	%rax, %rsi
	call	pthread_attr_setstacksize@PLT
	testl	%eax, %eax
	jne	.L423
	movl	$2, %esi
	movq	%rbp, %rdi
	call	pthread_attr_setschedpolicy@PLT
	testl	%eax, %eax
	jne	.L424
	leaq	4(%r13), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L293
	testb	%dl, %dl
	jne	.L425
.L293:
	movq	%r14, %rax
	movl	4(%r13), %edx
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L294
	cmpb	$3, %al
	jle	.L426
.L294:
	movq	8(%rsp), %rax
	movq	%r14, %rsi
	movq	%rbp, %rdi
	movl	%edx, -304(%rax)
	call	pthread_attr_setschedparam@PLT
	testl	%eax, %eax
	jne	.L427
	movl	$1, %esi
	movq	%rbp, %rdi
	call	pthread_attr_setinheritsched@PLT
	testl	%eax, %eax
	jne	.L428
	movl	$100, %ebx
	leaq	roxy_threads(%rip), %r15
	jmp	.L296
	.p2align 4,,10
	.p2align 3
.L298:
	subl	$1, %ebx
	je	.L304
.L296:
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
	je	.L297
	cmpb	$3, %dl
	jle	.L429
.L297:
	leaq	(%rcx,%rcx,2), %rdx
	salq	$3, %rdx
	leaq	(%r15,%rdx), %rsi
	movl	8(%rsi), %edi
	testl	%edi, %edi
	jne	.L298
	leaq	16(%r15,%rdx), %rdi
	movl	%eax, %r8d
	movl	$1, 8(%rsi)
	movq	%rcx, %rax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %edx
	testb	%dl, %dl
	je	.L299
	cmpb	$3, %dl
	jle	.L430
.L299:
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
	jl	.L300
	testb	%sil, %sil
	jne	.L431
.L300:
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
	movl	20(%rsp), %r8d
	testl	%eax, %eax
	jne	.L432
	movq	%rbx, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L433
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
	jl	.L303
	testb	%dl, %dl
	jne	.L434
.L303:
	movl	%r8d, (%r12)
.L304:
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
	jne	.L305
	movq	72(%rsp), %r13
.L288:
	movq	64(%rsp), %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L306
	cmpb	$3, %al
	jg	.L306
	movq	64(%rsp), %rdi
	call	__asan_report_store4@PLT
	.p2align 4,,10
	.p2align 3
.L272:
	movl	16(%rsp), %edx
	leaq	.LC8(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
.L271:
	movq	24(%rsp), %rcx
	cmpq	%rcx, 56(%rsp)
	jne	.L435
	movq	48(%rsp), %rbx
	pxor	%xmm0, %xmm0
	movl	$0, 2147450896(%rbx)
	movl	$0, 2147450916(%rbx)
	movups	%xmm0, 2147450880(%rbx)
.L270:
	movq	424(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L436
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
.L278:
	.cfi_restore_state
	movl	16(%rsp), %edx
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L271
.L306:
	leaq	0(%r13,%r13,8), %rax
	leaq	roxy_tasks(%rip), %rbx
	movl	$2, (%rbx,%rax,8)
	xorl	%eax, %eax
	jmp	.L271
.L423:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
.L290:
	movl	$2, %eax
	jmp	.L271
.L422:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L290
.L424:
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	jmp	.L290
.L427:
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	jmp	.L290
.L428:
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L290
.L432:
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	jmp	.L290
.L429:
	call	__asan_report_load4@PLT
.L420:
	call	__asan_report_load4@PLT
.L431:
	call	__asan_report_store4@PLT
.L433:
	movq	%rbx, %rdi
	call	__asan_report_load8@PLT
.L419:
	call	__asan_report_load4@PLT
.L412:
	movq	64(%rsp), %rdi
	call	__asan_report_load4@PLT
.L413:
	call	__asan_report_load4@PLT
.L426:
	movq	%r14, %rdi
	call	__asan_report_store4@PLT
.L421:
	movq	40(%rsp), %rdi
	call	__asan_report_store8@PLT
.L434:
	movq	%r12, %rdi
	call	__asan_report_store4@PLT
.L414:
	call	__asan_report_load4@PLT
.L430:
	call	__asan_report_store4@PLT
.L425:
	call	__asan_report_load4@PLT
.L415:
	call	__asan_report_load4@PLT
.L416:
	call	__asan_report_load4@PLT
.L417:
	call	__asan_report_load4@PLT
.L418:
	call	__asan_report_load4@PLT
.L436:
	call	__stack_chk_fail@PLT
.L411:
	movl	$320, %edi
	call	__asan_stack_malloc_3@PLT
	testq	%rax, %rax
	cmove	24(%rsp), %rax
	movq	%rax, 24(%rsp)
	jmp	.L268
.L435:
	movq	$1172321806, (%rcx)
	movq	48(%rsp), %rbx
	movabsq	$-723401728380766731, %rsi
	movdqa	.LC16(%rip), %xmm0
	movq	%rsi, 2147450912(%rbx)
	movups	%xmm0, 2147450880(%rbx)
	movups	%xmm0, 2147450896(%rbx)
	movq	504(%rcx), %rdx
	movb	$0, (%rdx)
	jmp	.L270
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
.LC17:
	.string	"2 32 16 7 req:318 64 16 7 rem:318"
	.section	.rodata
	.align 32
.LC18:
	.string	"ROXY-DEBUG: Invalid wait option"
	.zero	32
	.align 32
.LC19:
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
	jne	.L451
.L438:
	leaq	.LC17(%rip), %rdx
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
	je	.L443
	cmpl	$1, %esi
	jne	.L444
	movl	%r12d, %edx
	xorl	%edi, %edi
.L443:
	leaq	-88(%rax), %r9
	leaq	-96(%rax), %r8
	movq	%r9, %rcx
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L452
	movq	%r8, %rcx
	movq	%rdi, -88(%rax)
	shrq	$3, %rcx
	cmpb	$0, 2147450880(%rcx)
	jne	.L453
	movq	%r8, %rdi
	leaq	-64(%rax), %rsi
	movq	%rdx, -96(%rax)
	call	nanosleep@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	cmpl	$-1, %r8d
	je	.L454
.L441:
	cmpq	%rbx, %r13
	jne	.L455
	movq	$0, 2147450880(%rbp)
	movl	$0, 2147450888(%rbp)
.L440:
	movq	136(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L456
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
.L444:
	.cfi_restore_state
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L441
	.p2align 4,,10
	.p2align 3
.L454:
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L441
.L455:
	movabsq	$-723401728380766731, %rdi
	movq	$1172321806, (%rbx)
	movq	%rdi, 2147450880(%rbp)
	movl	$-168430091, 2147450888(%rbp)
	movq	120(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L440
.L451:
	movl	$96, %edi
	movl	%esi, 12(%rsp)
	call	__asan_stack_malloc_1@PLT
	movl	12(%rsp), %esi
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L438
.L452:
	movq	%r9, %rdi
	call	__asan_report_store8@PLT
.L453:
	movq	%r8, %rdi
	call	__asan_report_store8@PLT
.L456:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE84:
	.size	roxy_task_wait, .-roxy_task_wait
	.section	.rodata
	.align 32
.LC20:
	.string	"ROXY-DEBUG: Failed to find the task (task_id=%d)\n"
	.zero	46
	.align 32
.LC21:
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
	ja	.L461
	movl	%edi, %eax
	movl	%esi, %r8d
	leaq	roxy_tasks(%rip), %rcx
	leaq	(%rax,%rax,8), %rsi
	leaq	(%rcx,%rsi,8), %rdi
	movq	%rdi, %rsi
	shrq	$3, %rsi
	movzbl	2147450880(%rsi), %esi
	testb	%sil, %sil
	je	.L460
	cmpb	$3, %sil
	jle	.L480
.L460:
	leaq	(%rax,%rax,8), %rsi
	leaq	(%rcx,%rsi,8), %rdi
	movl	(%rdi), %esi
	testl	%esi, %esi
	je	.L461
	cmpl	$1, %esi
	jne	.L481
	addq	$4, %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %esi
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%sil, %dl
	jl	.L463
	testb	%sil, %sil
	jne	.L482
.L463:
	leaq	(%rax,%rax,8), %rax
	movl	%r8d, 4(%rcx,%rax,8)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L461:
	.cfi_restore_state
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L459:
	movl	$2, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L481:
	.cfi_restore_state
	leaq	.LC21(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L459
.L480:
	call	__asan_report_load4@PLT
.L482:
	call	__asan_report_store4@PLT
	.cfi_endproc
.LFE85:
	.size	roxy_task_set_priority, .-roxy_task_set_priority
	.section	.rodata
	.align 32
.LC22:
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
	ja	.L489
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
	jne	.L492
.L483:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L489:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L492:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC22(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L483
	.cfi_endproc
.LFE86:
	.size	roxy_critical_section_enter, .-roxy_critical_section_enter
	.section	.rodata
	.align 32
.LC23:
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
	ja	.L499
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
	jne	.L502
.L493:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L499:
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L502:
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%r12d, %edx
	leaq	.LC23(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L493
	.cfi_endproc
.LFE87:
	.size	roxy_critical_section_leave, .-roxy_critical_section_leave
	.section	.rodata
	.align 32
.LC24:
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
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cmpl	$127, %edi
	ja	.L507
	movl	%edi, %ebx
	leaq	roxy_tasks(%rip), %rbp
	leaq	(%rbx,%rbx,8), %rax
	leaq	0(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L506
	cmpb	$3, %al
	jle	.L630
.L506:
	leaq	(%rbx,%rbx,8), %rax
	salq	$3, %rax
	movl	0(%rbp,%rax), %ecx
	testl	%ecx, %ecx
	je	.L507
	leaq	40(%rbp,%rax), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L508
	testb	%dl, %dl
	jne	.L631
.L508:
	leaq	(%rbx,%rbx,8), %rax
	movl	40(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L632
.L509:
	leaq	(%rbx,%rbx,8), %rax
	leaq	44(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L512
	testb	%dl, %dl
	jne	.L633
.L512:
	leaq	(%rbx,%rbx,8), %rax
	movl	44(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L634
.L513:
	leaq	(%rbx,%rbx,8), %rax
	leaq	48(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L515
	testb	%dl, %dl
	jne	.L635
.L515:
	leaq	(%rbx,%rbx,8), %rax
	movl	48(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L636
.L516:
	leaq	(%rbx,%rbx,8), %rax
	leaq	52(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L518
	testb	%dl, %dl
	jne	.L637
.L518:
	leaq	(%rbx,%rbx,8), %rax
	movl	52(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L638
.L519:
	leaq	(%rbx,%rbx,8), %rax
	leaq	56(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L521
	testb	%dl, %dl
	jne	.L639
.L521:
	leaq	(%rbx,%rbx,8), %rax
	movl	56(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L640
.L522:
	leaq	(%rbx,%rbx,8), %rax
	leaq	60(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L524
	testb	%dl, %dl
	jne	.L641
.L524:
	leaq	(%rbx,%rbx,8), %rax
	movl	60(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L642
.L525:
	leaq	(%rbx,%rbx,8), %rax
	leaq	64(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L527
	testb	%dl, %dl
	jne	.L643
.L527:
	leaq	(%rbx,%rbx,8), %rax
	movl	64(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L644
.L528:
	leaq	(%rbx,%rbx,8), %rax
	leaq	68(%rbp,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	movq	%rdi, %rax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%dl, %al
	jl	.L530
	testb	%dl, %dl
	jne	.L645
.L530:
	leaq	(%rbx,%rbx,8), %rax
	movl	68(%rbp,%rax,8), %eax
	cmpl	$-1, %eax
	jne	.L646
.L531:
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
.L632:
	.cfi_restore_state
	leaq	(%rax,%rax,2), %rax
	leaq	roxy_threads(%rip), %r12
	leaq	(%r12,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L647
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movl	%eax, %ecx
	testl	%eax, %eax
	je	.L509
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L511:
	leaq	(%rbx,%rbx,8), %rdx
	leaq	8(%rax,%rdx,2), %rdx
	leaq	8(%rbp,%rdx,4), %rdi
	movq	%rdi, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %esi
	movq	%rdi, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%sil, %dl
	jl	.L533
	testb	%sil, %sil
	jne	.L648
.L533:
	leaq	(%rbx,%rbx,8), %rdx
	leaq	8(%rax,%rdx,2), %rax
	movl	8(%rbp,%rax,4), %eax
	leaq	(%rax,%rax,2), %rax
	leaq	(%r12,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L649
	movq	(%rdi), %rdx
	leaq	.LC24(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
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
.L634:
	.cfi_restore_state
	leaq	(%rax,%rax,2), %rax
	leaq	roxy_threads(%rip), %r12
	leaq	(%r12,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L650
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movl	%eax, %ecx
	testl	%eax, %eax
	je	.L513
	movl	$1, %eax
	jmp	.L511
	.p2align 4,,10
	.p2align 3
.L636:
	leaq	(%rax,%rax,2), %rax
	leaq	roxy_threads(%rip), %r12
	leaq	(%r12,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L651
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movl	%eax, %ecx
	testl	%eax, %eax
	je	.L516
	movl	$2, %eax
	jmp	.L511
	.p2align 4,,10
	.p2align 3
.L638:
	leaq	(%rax,%rax,2), %rax
	leaq	roxy_threads(%rip), %r12
	leaq	(%r12,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L652
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movl	%eax, %ecx
	testl	%eax, %eax
	je	.L519
	movl	$3, %eax
	jmp	.L511
	.p2align 4,,10
	.p2align 3
.L640:
	leaq	(%rax,%rax,2), %rax
	leaq	roxy_threads(%rip), %r12
	leaq	(%r12,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L653
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movl	%eax, %ecx
	testl	%eax, %eax
	je	.L522
	movl	$4, %eax
	jmp	.L511
	.p2align 4,,10
	.p2align 3
.L642:
	leaq	(%rax,%rax,2), %rax
	leaq	roxy_threads(%rip), %r12
	leaq	(%r12,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L654
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movl	%eax, %ecx
	testl	%eax, %eax
	je	.L525
	movl	$5, %eax
	jmp	.L511
	.p2align 4,,10
	.p2align 3
.L644:
	leaq	(%rax,%rax,2), %rax
	leaq	roxy_threads(%rip), %r12
	leaq	(%r12,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L655
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movl	%eax, %ecx
	testl	%eax, %eax
	je	.L528
	movl	$6, %eax
	jmp	.L511
	.p2align 4,,10
	.p2align 3
.L646:
	leaq	(%rax,%rax,2), %rax
	leaq	roxy_threads(%rip), %r12
	leaq	(%r12,%rax,8), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L656
	movq	(%rdi), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
	movl	%eax, %ecx
	movl	$7, %eax
	testl	%ecx, %ecx
	je	.L531
	jmp	.L511
	.p2align 4,,10
	.p2align 3
.L507:
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
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
.L633:
	.cfi_restore_state
	call	__asan_report_load4@PLT
.L639:
	call	__asan_report_load4@PLT
.L641:
	call	__asan_report_load4@PLT
.L643:
	call	__asan_report_load4@PLT
.L630:
	call	__asan_report_load4@PLT
.L637:
	call	__asan_report_load4@PLT
.L635:
	call	__asan_report_load4@PLT
.L645:
	call	__asan_report_load4@PLT
.L631:
	call	__asan_report_load4@PLT
.L649:
	call	__asan_report_load8@PLT
.L648:
	call	__asan_report_load4@PLT
.L651:
	call	__asan_report_load8@PLT
.L653:
	call	__asan_report_load8@PLT
.L652:
	call	__asan_report_load8@PLT
.L650:
	call	__asan_report_load8@PLT
.L656:
	call	__asan_report_load8@PLT
.L647:
	call	__asan_report_load8@PLT
.L655:
	call	__asan_report_load8@PLT
.L654:
	call	__asan_report_load8@PLT
	.cfi_endproc
.LFE88:
	.size	roxy_loop, .-roxy_loop
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC25:
	.string	"1 32 64 15 mqueue_attr:475"
	.section	.rodata
	.align 32
.LC26:
	.string	"ROXY-DEBUG: Failed to start the message queue (mqueue_id=%d)\n"
	.zero	34
	.align 32
.LC27:
	.string	"ROXY-DEBUG: The message queue (mqueue_id=%d), has been initialized before\n"
	.zero	53
	.align 32
.LC28:
	.string	"/%x"
	.zero	60
	.align 32
.LC29:
	.string	"ROXY-DEBUG: Failed to create message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n"
	.zero	37
	.align 32
.LC30:
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
	jne	.L693
.L657:
	leaq	.LC25(%rip), %rax
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
	ja	.L694
	movl	%r13d, %r10d
	leaq	roxy_mqueues(%rip), %r11
	leaq	(%r10,%r10,4), %r12
	salq	$4, %r12
	addq	%r11, %r12
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L663
	jle	.L695
.L663:
	cmpb	$0, (%r12)
	jne	.L696
	leaq	.LC28(%rip), %rcx
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
	jne	.L697
	leaq	-112(%rbx), %rdi
	movq	%r9, -120(%rbx)
	movl	(%rsp), %eax
	movq	%rdi, %rdx
	shrq	$3, %rdx
	cmpb	$0, 2147450880(%rdx)
	jne	.L698
	movq	%rcx, %rsi
	movq	%rax, -112(%rbx)
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L699
	leaq	-104(%rbx), %rdi
	movq	$0, -128(%rbx)
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L700
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
	jne	.L677
	testb	%r8b, %r8b
	setne	%r9b
	setle	%al
	testb	%al, %r9b
	jne	.L677
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
	jne	.L678
	testb	%sil, %sil
	setne	%dil
	setle	%al
	testb	%al, %dil
	jne	.L678
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
	je	.L701
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L702
.L660:
	cmpq	%rbp, %r15
	jne	.L703
	movl	$0, 2147450880(%r14)
	movl	$0, 2147450892(%r14)
.L659:
	movq	168(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L704
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
.L696:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC27(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L660
	.p2align 4,,10
	.p2align 3
.L694:
	movl	%r13d, %edx
	leaq	.LC26(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L660
	.p2align 4,,10
	.p2align 3
.L701:
	call	__errno_location@PLT
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rax, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L674
	testb	%cl, %cl
	je	.L674
	movq	%rax, %rdi
	call	__asan_report_load4@PLT
	.p2align 4,,10
	.p2align 3
.L674:
	movl	(%rax), %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC29(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L660
	.p2align 4,,10
	.p2align 3
.L702:
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC30(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L660
.L695:
	movq	%r12, %rdi
	call	__asan_report_load1@PLT
.L703:
	movdqa	.LC16(%rip), %xmm0
	movq	$1172321806, 0(%rbp)
	movups	%xmm0, 2147450880(%r14)
	movq	120(%rbp), %rdx
	movb	$0, (%rdx)
	jmp	.L659
.L693:
	movl	$128, %edi
	movl	%esi, 4(%rsp)
	call	__asan_stack_malloc_1@PLT
	movl	4(%rsp), %r9d
	testq	%rax, %rax
	cmovne	%rax, %rbp
	jmp	.L657
.L704:
	call	__stack_chk_fail@PLT
.L698:
	call	__asan_report_store8@PLT
.L700:
	call	__asan_report_store8@PLT
.L697:
	call	__asan_report_store8@PLT
.L678:
	movl	$64, %esi
	movq	%rcx, %rdi
	call	__asan_report_load_n@PLT
.L677:
	movl	$64, %esi
	call	__asan_report_store_n@PLT
.L699:
	movq	%rcx, %rdi
	call	__asan_report_store8@PLT
	.cfi_endproc
.LFE89:
	.size	roxy_mqueue_create, .-roxy_mqueue_create
	.section	.rodata
	.align 32
.LC31:
	.string	"ROXY-DEBUG: The message queue (mqueue_id=%d), has not been initialized before\n"
	.zero	49
	.align 32
.LC32:
	.string	"ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n"
	.zero	39
	.align 32
.LC33:
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
	ja	.L709
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
	je	.L708
	jle	.L728
.L708:
	cmpb	$0, (%r12)
	je	.L709
	movl	$524289, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
	cmpl	$-1, %eax
	je	.L729
	xorl	%ecx, %ecx
	movl	%ebx, %edx
	movq	%rbp, %rsi
	movl	%eax, %edi
	call	mq_send@PLT
	testl	%eax, %eax
	jne	.L730
	movl	%r14d, %edi
	call	mq_close@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L731
.L705:
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
.L709:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC31(%rip), %rsi
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
.L729:
	.cfi_restore_state
	call	__errno_location@PLT
	movq	%rax, %rdx
	shrq	$3, %rdx
	movzbl	2147450880(%rdx), %ecx
	movq	%rax, %rdx
	andl	$7, %edx
	addl	$3, %edx
	cmpb	%cl, %dl
	jl	.L711
	testb	%cl, %cl
	je	.L711
	movq	%rax, %rdi
	call	__asan_report_load4@PLT
	.p2align 4,,10
	.p2align 3
.L711:
	movl	(%rax), %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC32(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L705
	.p2align 4,,10
	.p2align 3
.L730:
	movl	%eax, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC33(%rip), %rsi
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
.L728:
	.cfi_restore_state
	movq	%r12, %rdi
	call	__asan_report_load1@PLT
	.p2align 4,,10
	.p2align 3
.L731:
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC30(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L705
	.cfi_endproc
.LFE90:
	.size	roxy_mqueue_send, .-roxy_mqueue_send
	.section	.rodata
	.align 32
.LC34:
	.string	"ROXY-DEBUG: Invalid blocking option at roxy_mqueue_receive"
	.zero	37
	.align 32
.LC35:
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
	ja	.L736
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
	je	.L735
	jle	.L750
.L735:
	cmpb	$0, (%r12)
	je	.L736
	cmpl	$1, %ecx
	je	.L751
	testl	%ecx, %ecx
	jne	.L739
	movl	$526336, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
.L738:
	cmpl	$-1, %r14d
	je	.L752
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
	jne	.L753
.L732:
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
.L736:
	.cfi_restore_state
	movl	%r13d, %edx
	leaq	.LC31(%rip), %rsi
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
.L739:
	.cfi_restore_state
	leaq	.LC34(%rip), %rdi
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
.L751:
	.cfi_restore_state
	movl	$524288, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
	jmp	.L738
	.p2align 4,,10
	.p2align 3
.L752:
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC35(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L732
	.p2align 4,,10
	.p2align 3
.L753:
	movq	%r12, %rcx
	movl	%r13d, %edx
	movl	$1, %edi
	leaq	.LC30(%rip), %rsi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L732
.L750:
	movq	%r12, %rdi
	call	__asan_report_load1@PLT
	.cfi_endproc
.LFE91:
	.size	roxy_mqueue_receive, .-roxy_mqueue_receive
	.section	.rodata.str1.1
.LC36:
	.string	"1 32 64 11 mqueue_attr"
	.section	.rodata
	.align 32
.LC37:
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
	jne	.L773
.L754:
	leaq	.LC36(%rip), %rax
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
	ja	.L761
	movl	%r13d, %eax
	leaq	(%rax,%rax,4), %r12
	leaq	roxy_mqueues(%rip), %rax
	salq	$4, %r12
	addq	%rax, %r12
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L760
	jle	.L774
.L760:
	cmpb	$0, (%r12)
	je	.L761
	movl	$524288, %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	mq_open@PLT
	movl	%eax, %r14d
	cmpl	$-1, %eax
	je	.L775
	leaq	-128(%rbp), %rsi
	movl	%eax, %edi
	call	mq_getattr@PLT
	testl	%eax, %eax
	jne	.L776
	leaq	-104(%rbp), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L777
	movl	-104(%rbp), %r14d
.L757:
	cmpq	%rbx, 8(%rsp)
	jne	.L778
	movl	$0, 2147450880(%r15)
	movl	$0, 2147450892(%r15)
.L756:
	movq	168(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L779
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
.L774:
	.cfi_restore_state
	movq	%r12, %rdi
	call	__asan_report_load1@PLT
	.p2align 4,,10
	.p2align 3
.L761:
	movl	%r13d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$-1, %r14d
	leaq	.LC31(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L757
.L775:
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC35(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	jmp	.L757
.L776:
	movq	%r12, %rcx
	movl	%r13d, %edx
	leaq	.LC37(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	movl	$-1, %r14d
	call	__printf_chk@PLT
	jmp	.L757
.L773:
	movl	$128, %edi
	call	__asan_stack_malloc_1@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L754
.L778:
	movdqa	.LC16(%rip), %xmm0
	movq	$1172321806, (%rbx)
	movups	%xmm0, 2147450880(%r15)
	movq	120(%rbx), %rax
	movb	$0, (%rax)
	jmp	.L756
.L777:
	call	__asan_report_load8@PLT
.L779:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE92:
	.size	roxy_mqueue_get_pending, .-roxy_mqueue_get_pending
	.globl	__asan_stack_malloc_0
	.section	.rodata.str1.1
.LC38:
	.string	"1 32 8 16 channel_name:634"
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
	jne	.L787
.L780:
	movq	%rbx, %rbp
	leaq	32(%rbx), %r14
	movl	%r12d, %r8d
	movl	$8, %edx
	leaq	.LC38(%rip), %rax
	shrq	$3, %rbp
	movq	%r14, %rdi
	movl	$1, %esi
	movq	%rax, 8(%rbx)
	leaq	.LASANPC93(%rip), %rax
	leaq	.LC28(%rip), %rcx
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
	jne	.L788
	movq	%r14, %rcx
	movl	%r12d, %edx
	leaq	.LC5(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
.L783:
	cmpq	%rbx, %r13
	jne	.L789
	movq	$0, 2147450880(%rbp)
.L782:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L790
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
.L788:
	.cfi_restore_state
	movl	%eax, %r8d
	movq	%r14, %rcx
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L783
.L787:
	movl	$64, %edi
	call	__asan_stack_malloc_0@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L780
.L789:
	movabsq	$-723401728380766731, %rdx
	movq	$1172321806, (%rbx)
	movq	%rdx, 2147450880(%rbp)
	movq	56(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L782
.L790:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE93:
	.size	roxy_mqueue_flush, .-roxy_mqueue_flush
	.section	.rodata
	.align 32
.LC39:
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
	cmpl	$127, %edi
	ja	.L802
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
	je	.L794
	cmpb	$3, %al
	jle	.L803
.L794:
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
.L802:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC39(%rip), %rsi
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
.L803:
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
	cmpl	$127, %edi
	ja	.L824
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
	je	.L807
	cmpb	$3, %al
	jle	.L825
.L807:
	leaq	(%rbx,%rbx,2), %rbx
	leaq	40(%r14,%r13), %r13
	salq	$5, %rbx
	addq	%r14, %rbx
	movl	$1, 88(%rbx)
	.p2align 4,,10
	.p2align 3
.L809:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	pthread_cond_wait@PLT
	movq	%r12, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %eax
	testb	%al, %al
	je	.L808
	cmpb	$3, %al
	jle	.L826
.L808:
	cmpl	$1, 88(%rbx)
	je	.L809
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
.L824:
	.cfi_restore_state
	movl	%edi, %edx
	leaq	.LC39(%rip), %rsi
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
.L825:
	.cfi_restore_state
	movq	%r12, %rdi
	call	__asan_report_store4@PLT
.L826:
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
	jne	.L833
	movq	(%rax,%rdi,8), %rdx
	testq	%rdx, %rdx
	je	.L827
	xorl	%eax, %eax
	jmp	*%rdx
	.p2align 4,,10
	.p2align 3
.L827:
	ret
.L833:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
	.cfi_endproc
.LFE96:
	.size	roxy_signal_handler, .-roxy_signal_handler
	.globl	__asan_stack_malloc_2
	.section	.rodata.str1.1
.LC40:
	.string	"1 32 152 17 signal_action:742"
	.section	.rodata
	.align 32
.LC41:
	.string	"ROXY-DEBUG: Interrupt signal out of bound (signal_id=%d)\n"
	.zero	38
	.align 32
.LC42:
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
	jne	.L845
.L834:
	leaq	.LC40(%rip), %rax
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
	jne	.L846
	leaq	40(%rbx), %r15
	movq	%rsi, -256(%r13)
	movq	%r15, %rdi
	call	sigemptyset@PLT
	movl	%r12d, %esi
	movq	%r15, %rdi
	call	sigaddset@PLT
	cmpl	$63, %r12d
	ja	.L847
.L839:
	leaq	-256(%r13), %rsi
	xorl	%edx, %edx
	movl	%r12d, %edi
	call	sigaction@PLT
	movl	%eax, %r8d
	xorl	%eax, %eax
	testl	%r8d, %r8d
	jne	.L848
.L837:
	cmpq	%rbx, %r14
	jne	.L849
	movl	$0, 2147450880(%rbp)
	movq	$0, 2147450900(%rbp)
	movl	$0, 2147450908(%rbp)
.L836:
	movq	296(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L850
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
.L847:
	.cfi_restore_state
	movl	%r12d, %edx
	leaq	.LC41(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L839
	.p2align 4,,10
	.p2align 3
.L848:
	movl	%r12d, %edx
	leaq	.LC42(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$2, %eax
	jmp	.L837
.L845:
	movl	$256, %edi
	movq	%rsi, 8(%rsp)
	call	__asan_stack_malloc_2@PLT
	movq	8(%rsp), %rsi
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L834
.L846:
	call	__asan_report_store8@PLT
.L849:
	movdqa	.LC16(%rip), %xmm0
	movq	$1172321806, (%rbx)
	movups	%xmm0, 2147450880(%rbp)
	movups	%xmm0, 2147450896(%rbp)
	movq	248(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L836
.L850:
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
.LC43:
	.string	"src/core.c"
	.section	.data.rel.local,"aw"
	.align 16
	.type	.LASANLOC1, @object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.quad	.LC43
	.long	30
	.long	14
	.align 16
	.type	.LASANLOC2, @object
	.size	.LASANLOC2, 16
.LASANLOC2:
	.quad	.LC43
	.long	29
	.long	26
	.align 16
	.type	.LASANLOC3, @object
	.size	.LASANLOC3, 16
.LASANLOC3:
	.quad	.LC43
	.long	28
	.long	27
	.align 16
	.type	.LASANLOC4, @object
	.size	.LASANLOC4, 16
.LASANLOC4:
	.quad	.LC43
	.long	27
	.long	24
	.align 16
	.type	.LASANLOC5, @object
	.size	.LASANLOC5, 16
.LASANLOC5:
	.quad	.LC43
	.long	26
	.long	27
	.align 16
	.type	.LASANLOC6, @object
	.size	.LASANLOC6, 16
.LASANLOC6:
	.quad	.LC43
	.long	25
	.long	25
	.section	.rodata.str1.1
.LC44:
	.string	"roxy_interrupts"
.LC45:
	.string	"roxy_events"
.LC46:
	.string	"roxy_mqueues"
.LC47:
	.string	"roxy_critical_sections"
.LC48:
	.string	"roxy_threads"
.LC49:
	.string	"roxy_tasks"
.LC50:
	.string	"*.LC32"
.LC51:
	.string	"*.LC12"
.LC52:
	.string	"*.LC3"
.LC53:
	.string	"*.LC41"
.LC54:
	.string	"*.LC11"
.LC55:
	.string	"*.LC31"
.LC56:
	.string	"*.LC39"
.LC57:
	.string	"*.LC23"
.LC58:
	.string	"*.LC0"
.LC59:
	.string	"*.LC22"
.LC60:
	.string	"*.LC8"
.LC61:
	.string	"*.LC34"
.LC62:
	.string	"*.LC9"
.LC63:
	.string	"*.LC29"
.LC64:
	.string	"*.LC14"
.LC65:
	.string	"*.LC15"
.LC66:
	.string	"*.LC28"
.LC67:
	.string	"*.LC27"
.LC68:
	.string	"*.LC37"
.LC69:
	.string	"*.LC35"
.LC70:
	.string	"*.LC5"
.LC71:
	.string	"*.LC30"
.LC72:
	.string	"*.LC24"
.LC73:
	.string	"*.LC2"
.LC74:
	.string	"*.LC10"
.LC75:
	.string	"*.LC19"
.LC76:
	.string	"*.LC20"
.LC77:
	.string	"*.LC1"
.LC78:
	.string	"*.LC26"
.LC79:
	.string	"*.LC4"
.LC80:
	.string	"*.LC33"
.LC81:
	.string	"*.LC13"
.LC82:
	.string	"*.LC18"
.LC83:
	.string	"*.LC6"
.LC84:
	.string	"*.LC21"
.LC85:
	.string	"*.LC42"
	.section	.data.rel.local
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 2688
.LASAN0:
	.quad	roxy_interrupts
	.quad	512
	.quad	544
	.quad	.LC44
	.quad	.LC43
	.quad	0
	.quad	.LASANLOC1
	.quad	0
	.quad	roxy_events
	.quad	12288
	.quad	12320
	.quad	.LC45
	.quad	.LC43
	.quad	0
	.quad	.LASANLOC2
	.quad	0
	.quad	roxy_mqueues
	.quad	10240
	.quad	10272
	.quad	.LC46
	.quad	.LC43
	.quad	0
	.quad	.LASANLOC3
	.quad	0
	.quad	roxy_critical_sections
	.quad	640
	.quad	672
	.quad	.LC47
	.quad	.LC43
	.quad	0
	.quad	.LASANLOC4
	.quad	0
	.quad	roxy_threads
	.quad	24576
	.quad	24608
	.quad	.LC48
	.quad	.LC43
	.quad	0
	.quad	.LASANLOC5
	.quad	0
	.quad	roxy_tasks
	.quad	9216
	.quad	9248
	.quad	.LC49
	.quad	.LC43
	.quad	0
	.quad	.LASANLOC6
	.quad	0
	.quad	.LC32
	.quad	89
	.quad	128
	.quad	.LC50
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC12
	.quad	42
	.quad	96
	.quad	.LC51
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC3
	.quad	42
	.quad	96
	.quad	.LC52
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC41
	.quad	58
	.quad	96
	.quad	.LC53
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC11
	.quad	40
	.quad	96
	.quad	.LC54
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC31
	.quad	79
	.quad	128
	.quad	.LC55
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC39
	.quad	41
	.quad	96
	.quad	.LC56
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC23
	.quad	73
	.quad	128
	.quad	.LC57
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC0
	.quad	66
	.quad	128
	.quad	.LC58
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC22
	.quad	71
	.quad	128
	.quad	.LC59
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC8
	.quad	51
	.quad	96
	.quad	.LC60
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC34
	.quad	59
	.quad	96
	.quad	.LC61
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC9
	.quad	55
	.quad	96
	.quad	.LC62
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC29
	.quad	91
	.quad	128
	.quad	.LC63
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC14
	.quad	43
	.quad	96
	.quad	.LC64
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC15
	.quad	42
	.quad	96
	.quad	.LC65
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC28
	.quad	4
	.quad	64
	.quad	.LC66
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC27
	.quad	75
	.quad	128
	.quad	.LC67
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC37
	.quad	93
	.quad	128
	.quad	.LC68
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC35
	.quad	74
	.quad	128
	.quad	.LC69
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC5
	.quad	74
	.quad	128
	.quad	.LC70
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC30
	.quad	75
	.quad	128
	.quad	.LC71
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC24
	.quad	69
	.quad	128
	.quad	.LC72
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC2
	.quad	45
	.quad	96
	.quad	.LC73
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC10
	.quad	43
	.quad	96
	.quad	.LC74
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC19
	.quad	67
	.quad	128
	.quad	.LC75
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC20
	.quad	50
	.quad	96
	.quad	.LC76
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC1
	.quad	1
	.quad	64
	.quad	.LC77
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC26
	.quad	62
	.quad	96
	.quad	.LC78
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC4
	.quad	88
	.quad	128
	.quad	.LC79
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC33
	.quad	100
	.quad	160
	.quad	.LC80
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC13
	.quad	41
	.quad	96
	.quad	.LC81
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC18
	.quad	32
	.quad	64
	.quad	.LC82
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC6
	.quad	57
	.quad	96
	.quad	.LC83
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC21
	.quad	74
	.quad	128
	.quad	.LC84
	.quad	.LC43
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC42
	.quad	61
	.quad	96
	.quad	.LC85
	.quad	.LC43
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
	movl	$42, %esi
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
	movl	$42, %esi
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
.LC16:
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
