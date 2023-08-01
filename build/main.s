	.file	"main.c"
	.text
	.p2align 4
	.globl	SCIO_VHF_task
	.type	SCIO_VHF_task, @function
SCIO_VHF_task:
.LASANPC71:
.LFB71:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.p2align 4,,10
	.p2align 3
.L2:
	movl	$10, %edi
	call	roxy_event_receive@PLT
	addl	$1, scio(%rip)
	jmp	.L2
	.cfi_endproc
.LFE71:
	.size	SCIO_VHF_task, .-SCIO_VHF_task
	.p2align 4
	.globl	TC_VHF_task
	.type	TC_VHF_task, @function
TC_VHF_task:
.LASANPC72:
.LFB72:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$12, %edi
	call	roxy_event_receive@PLT
	addl	$1, tc(%rip)
	jmp	.L6
	.cfi_endproc
.LFE72:
	.size	TC_VHF_task, .-TC_VHF_task
	.p2align 4
	.globl	TM_VHF_task
	.type	TM_VHF_task, @function
TM_VHF_task:
.LASANPC73:
.LFB73:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.p2align 4,,10
	.p2align 3
.L9:
	movl	$13, %edi
	call	roxy_event_receive@PLT
	addl	$1, tm(%rip)
	jmp	.L9
	.cfi_endproc
.LFE73:
	.size	TM_VHF_task, .-TM_VHF_task
	.p2align 4
	.globl	GCQ_VHF_task
	.type	GCQ_VHF_task, @function
GCQ_VHF_task:
.LASANPC74:
.LFB74:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.p2align 4,,10
	.p2align 3
.L12:
	movl	$14, %edi
	call	roxy_event_receive@PLT
	addl	$1, gcq(%rip)
	jmp	.L12
	.cfi_endproc
.LFE74:
	.size	GCQ_VHF_task, .-GCQ_VHF_task
	.p2align 4
	.globl	MPQ_VHF_task
	.type	MPQ_VHF_task, @function
MPQ_VHF_task:
.LASANPC75:
.LFB75:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.p2align 4,,10
	.p2align 3
.L15:
	movl	$15, %edi
	call	roxy_event_receive@PLT
	addl	$1, mpq(%rip)
	jmp	.L15
	.cfi_endproc
.LFE75:
	.size	MPQ_VHF_task, .-MPQ_VHF_task
	.p2align 4
	.globl	SYS_VHF_task
	.type	SYS_VHF_task, @function
SYS_VHF_task:
.LASANPC76:
.LFB76:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.p2align 4,,10
	.p2align 3
.L18:
	movl	$16, %edi
	call	roxy_event_receive@PLT
	movl	$104, %edi
	call	roxy_event_receive@PLT
	addl	$1, sys(%rip)
	jmp	.L18
	.cfi_endproc
.LFE76:
	.size	SYS_VHF_task, .-SYS_VHF_task
	.p2align 4
	.globl	DHS_VHF_task
	.type	DHS_VHF_task, @function
DHS_VHF_task:
.LASANPC80:
.LFB80:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.p2align 4,,10
	.p2align 3
.L21:
	xorl	%edi, %edi
	call	roxy_critical_section_enter@PLT
	xorl	%edi, %edi
	movl	$0, work_done(%rip)
	call	roxy_critical_section_leave@PLT
	movl	$11, %edi
	call	roxy_event_receive@PLT
	xorl	%esi, %esi
	movl	$10000000, %edi
	call	roxy_task_wait@PLT
	movl	$101, %edi
	call	roxy_event_send@PLT
	movl	$102, %edi
	call	roxy_event_send@PLT
	movl	$103, %edi
	call	roxy_event_send@PLT
	movl	$104, %edi
	call	roxy_event_receive@PLT
	addl	$1, dhs(%rip)
	jmp	.L21
	.cfi_endproc
.LFE80:
	.size	DHS_VHF_task, .-DHS_VHF_task
	.p2align 4
	.globl	timer_simulator
	.type	timer_simulator, @function
timer_simulator:
.LASANPC81:
.LFB81:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1000, %ebx
	.p2align 4,,10
	.p2align 3
.L24:
	movl	$10, %edi
	call	roxy_event_send@PLT
	movl	$11, %edi
	call	roxy_event_send@PLT
	movl	$12, %edi
	call	roxy_event_send@PLT
	movl	$13, %edi
	call	roxy_event_send@PLT
	movl	$14, %edi
	call	roxy_event_send@PLT
	movl	$15, %edi
	call	roxy_event_send@PLT
	movl	$16, %edi
	call	roxy_event_send@PLT
	movl	$17, %edi
	call	roxy_event_send@PLT
	movl	$18, %edi
	call	roxy_event_send@PLT
	movl	$19, %edi
	call	roxy_event_send@PLT
	xorl	%esi, %esi
	movl	$125000000, %edi
	addl	$1, seq(%rip)
	call	roxy_task_wait@PLT
	subl	$1, %ebx
	jne	.L24
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE81:
	.size	timer_simulator, .-timer_simulator
	.section	.rodata
	.align 32
.LC0:
	.string	"Vital error: custom gate lock malfunction"
	.zero	54
	.text
	.p2align 4
	.globl	AOCS_VHF_task
	.type	AOCS_VHF_task, @function
AOCS_VHF_task:
.LASANPC77:
.LFB77:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
.L30:
	movl	$17, %edi
	call	roxy_event_receive@PLT
	movl	$101, %edi
	call	roxy_event_receive@PLT
	xorl	%edi, %edi
	call	roxy_critical_section_enter@PLT
	movl	work_done(%rip), %eax
	cmpl	$3, %eax
	ja	.L32
	addl	$1, %eax
	movl	%eax, work_done(%rip)
	cmpl	$3, %eax
	je	.L33
.L29:
	xorl	%edi, %edi
	call	roxy_critical_section_leave@PLT
	addl	$1, aocs(%rip)
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L32:
	movl	$1, %edi
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
.L33:
	movl	$104, %edi
	call	roxy_event_send@PLT
	jmp	.L29
	.cfi_endproc
.LFE77:
	.size	AOCS_VHF_task, .-AOCS_VHF_task
	.p2align 4
	.globl	PF_VHF_task
	.type	PF_VHF_task, @function
PF_VHF_task:
.LASANPC78:
.LFB78:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
.L37:
	movl	$18, %edi
	call	roxy_event_receive@PLT
	movl	$102, %edi
	call	roxy_event_receive@PLT
	xorl	%edi, %edi
	call	roxy_critical_section_enter@PLT
	movl	work_done(%rip), %eax
	cmpl	$3, %eax
	ja	.L39
	addl	$1, %eax
	movl	%eax, work_done(%rip)
	cmpl	$3, %eax
	je	.L40
.L36:
	xorl	%edi, %edi
	call	roxy_critical_section_leave@PLT
	addl	$1, pf(%rip)
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L39:
	movl	$1, %edi
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
.L40:
	movl	$104, %edi
	call	roxy_event_send@PLT
	jmp	.L36
	.cfi_endproc
.LFE78:
	.size	PF_VHF_task, .-PF_VHF_task
	.p2align 4
	.globl	PL_VHF_task
	.type	PL_VHF_task, @function
PL_VHF_task:
.LASANPC79:
.LFB79:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
.L44:
	movl	$19, %edi
	call	roxy_event_receive@PLT
	movl	$103, %edi
	call	roxy_event_receive@PLT
	xorl	%edi, %edi
	call	roxy_critical_section_enter@PLT
	movl	work_done(%rip), %eax
	cmpl	$3, %eax
	ja	.L46
	addl	$1, %eax
	movl	%eax, work_done(%rip)
	cmpl	$3, %eax
	je	.L47
.L43:
	xorl	%edi, %edi
	call	roxy_critical_section_leave@PLT
	addl	$1, pl(%rip)
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L46:
	movl	$1, %edi
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
.L47:
	movl	$104, %edi
	call	roxy_event_send@PLT
	jmp	.L43
	.cfi_endproc
.LFE79:
	.size	PL_VHF_task, .-PL_VHF_task
	.globl	__asan_stack_malloc_0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"1 32 16 7 time:38"
	.text
	.p2align 4
	.globl	get_timestamp
	.type	get_timestamp, @function
get_timestamp:
.LASANPC67:
.LFB67:
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
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	movq	%rbx, %rbp
	testl	%eax, %eax
	jne	.L56
.L48:
	leaq	.LC1(%rip), %rax
	movq	%rbx, %r12
	leaq	32(%rbx), %r13
	xorl	%esi, %esi
	movq	%rax, 8(%rbx)
	shrq	$3, %r12
	movq	%r13, %rdi
	leaq	96(%rbx), %r14
	leaq	.LASANPC67(%rip), %rax
	movq	$1102416563, (%rbx)
	movq	%rax, 16(%rbx)
	movl	$-235802127, 2147450880(%r12)
	movl	$-202178560, 2147450884(%r12)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	call	gettimeofday@PLT
	movq	%r13, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L57
	imulq	$1000, -64(%r14), %rsi
	leaq	40(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L58
	movabsq	$2361183241434822607, %rdx
	movq	-56(%r14), %rcx
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%rdx
	sarq	$7, %rdx
	subq	%rcx, %rdx
	leaq	(%rdx,%rsi), %rax
	cmpq	%rbx, %rbp
	jne	.L59
	movq	$0, 2147450880(%r12)
.L50:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L60
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
.L56:
	.cfi_restore_state
	movl	$64, %edi
	call	__asan_stack_malloc_0@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L48
.L59:
	movabsq	$-723401728380766731, %rsi
	movq	$1172321806, (%rbx)
	movq	%rsi, 2147450880(%r12)
	movq	56(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L50
.L58:
	call	__asan_report_load8@PLT
.L57:
	movq	%r13, %rdi
	call	__asan_report_load8@PLT
.L60:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE67:
	.size	get_timestamp, .-get_timestamp
	.p2align 4
	.globl	unlock_gate_lock
	.type	unlock_gate_lock, @function
unlock_gate_lock:
.LASANPC68:
.LFB68:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%edi, %edi
	call	roxy_critical_section_enter@PLT
	movl	work_done(%rip), %eax
	cmpl	$3, %eax
	ja	.L65
	addl	$1, %eax
	movl	%eax, work_done(%rip)
	cmpl	$3, %eax
	je	.L66
	xorl	%edi, %edi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	roxy_critical_section_leave@PLT
	.p2align 4,,10
	.p2align 3
.L65:
	.cfi_restore_state
	movl	$1, %edi
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
	.p2align 4,,10
	.p2align 3
.L66:
	movl	$104, %edi
	call	roxy_event_send@PLT
	xorl	%edi, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	roxy_critical_section_leave@PLT
	.cfi_endproc
.LFE68:
	.size	unlock_gate_lock, .-unlock_gate_lock
	.p2align 4
	.globl	reset_gate_lock
	.type	reset_gate_lock, @function
reset_gate_lock:
.LASANPC69:
.LFB69:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%edi, %edi
	call	roxy_critical_section_enter@PLT
	xorl	%edi, %edi
	movl	$0, work_done(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	roxy_critical_section_leave@PLT
	.cfi_endproc
.LFE69:
	.size	reset_gate_lock, .-reset_gate_lock
	.p2align 4
	.globl	SEQ_interrupt_handler
	.type	SEQ_interrupt_handler, @function
SEQ_interrupt_handler:
.LASANPC70:
.LFB70:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$10, %edi
	call	roxy_event_send@PLT
	movl	$11, %edi
	call	roxy_event_send@PLT
	movl	$12, %edi
	call	roxy_event_send@PLT
	movl	$13, %edi
	call	roxy_event_send@PLT
	movl	$14, %edi
	call	roxy_event_send@PLT
	movl	$15, %edi
	call	roxy_event_send@PLT
	movl	$16, %edi
	call	roxy_event_send@PLT
	movl	$17, %edi
	call	roxy_event_send@PLT
	movl	$18, %edi
	call	roxy_event_send@PLT
	movl	$19, %edi
	call	roxy_event_send@PLT
	addl	$1, seq(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE70:
	.size	SEQ_interrupt_handler, .-SEQ_interrupt_handler
	.section	.rodata
	.align 32
.LC2:
	.string	"seq=%d, scio=%d, dhs=%d, tc=%d, tm=%d, gcq=%d, mpq=%d\n"
	.zero	41
	.align 32
.LC3:
	.string	"sys=%d, aocs=%d, pf=%d, pl=%d\n"
	.zero	33
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LASANPC82:
.LFB82:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	roxy_init@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	SCIO_VHF_task(%rip), %rcx
	movl	$10, %esi
	movl	$100, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	DHS_VHF_task(%rip), %rcx
	movl	$10, %esi
	movl	$101, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	TC_VHF_task(%rip), %rcx
	movl	$10, %esi
	movl	$102, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	TM_VHF_task(%rip), %rcx
	movl	$10, %esi
	movl	$103, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	GCQ_VHF_task(%rip), %rcx
	movl	$10, %esi
	movl	$104, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	MPQ_VHF_task(%rip), %rcx
	movl	$10, %esi
	movl	$105, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	SYS_VHF_task(%rip), %rcx
	movl	$10, %esi
	movl	$106, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$10, %esi
	xorl	%edx, %edx
	leaq	AOCS_VHF_task(%rip), %rcx
	movl	$107, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	PF_VHF_task(%rip), %rcx
	movl	$10, %esi
	movl	$108, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	PL_VHF_task(%rip), %rcx
	movl	$10, %esi
	movl	$109, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	timer_simulator(%rip), %rcx
	movl	$20, %esi
	movl	$110, %edi
	call	roxy_task_create@PLT
	movl	$1, %esi
	movl	$100, %edi
	call	roxy_task_start@PLT
	movl	$1, %esi
	movl	$101, %edi
	call	roxy_task_start@PLT
	movl	$1, %esi
	movl	$102, %edi
	call	roxy_task_start@PLT
	movl	$1, %esi
	movl	$103, %edi
	call	roxy_task_start@PLT
	movl	$1, %esi
	movl	$104, %edi
	call	roxy_task_start@PLT
	movl	$1, %esi
	movl	$105, %edi
	call	roxy_task_start@PLT
	movl	$1, %esi
	movl	$106, %edi
	call	roxy_task_start@PLT
	movl	$1, %esi
	movl	$107, %edi
	call	roxy_task_start@PLT
	movl	$1, %esi
	movl	$108, %edi
	call	roxy_task_start@PLT
	movl	$1, %esi
	movl	$109, %edi
	call	roxy_task_start@PLT
	movl	$1, %esi
	movl	$110, %edi
	call	roxy_task_start@PLT
	movl	$110, %edi
	call	roxy_loop@PLT
	call	roxy_clean@PLT
	movl	mpq(%rip), %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	tc(%rip), %r9d
	movl	dhs(%rip), %r8d
	movl	scio(%rip), %ecx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	pushq	%rax
	.cfi_def_cfa_offset 32
	movl	gcq(%rip), %eax
	movl	seq(%rip), %edx
	pushq	%rax
	.cfi_def_cfa_offset 40
	movl	tm(%rip), %eax
	pushq	%rax
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	pl(%rip), %r9d
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	movl	pf(%rip), %r8d
	movl	aocs(%rip), %ecx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	movl	sys(%rip), %edx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE82:
	.size	main, .-main
	.globl	pl
	.bss
	.align 32
	.type	pl, @object
	.size	pl, 4
pl:
	.zero	64
	.globl	pf
	.align 32
	.type	pf, @object
	.size	pf, 4
pf:
	.zero	64
	.globl	aocs
	.align 32
	.type	aocs, @object
	.size	aocs, 4
aocs:
	.zero	64
	.globl	sys
	.align 32
	.type	sys, @object
	.size	sys, 4
sys:
	.zero	64
	.globl	mpq
	.align 32
	.type	mpq, @object
	.size	mpq, 4
mpq:
	.zero	64
	.globl	gcq
	.align 32
	.type	gcq, @object
	.size	gcq, 4
gcq:
	.zero	64
	.globl	tm
	.align 32
	.type	tm, @object
	.size	tm, 4
tm:
	.zero	64
	.globl	tc
	.align 32
	.type	tc, @object
	.size	tc, 4
tc:
	.zero	64
	.globl	dhs
	.align 32
	.type	dhs, @object
	.size	dhs, 4
dhs:
	.zero	64
	.globl	scio
	.align 32
	.type	scio, @object
	.size	scio, 4
scio:
	.zero	64
	.globl	seq
	.align 32
	.type	seq, @object
	.size	seq, 4
seq:
	.zero	64
	.globl	work_done
	.align 32
	.type	work_done, @object
	.size	work_done, 4
work_done:
	.zero	64
	.globl	__odr_asan.pl
	.type	__odr_asan.pl, @object
	.size	__odr_asan.pl, 1
__odr_asan.pl:
	.zero	1
	.section	.rodata.str1.1
.LC4:
	.string	"src/main.c"
	.section	.data.rel.local,"aw"
	.align 16
	.type	.LASANLOC1, @object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.quad	.LC4
	.long	34
	.long	94
	.globl	__odr_asan.pf
	.bss
	.type	__odr_asan.pf, @object
	.size	__odr_asan.pf, 1
__odr_asan.pf:
	.zero	1
	.section	.data.rel.local
	.align 16
	.type	.LASANLOC2, @object
	.size	.LASANLOC2, 16
.LASANLOC2:
	.quad	.LC4
	.long	34
	.long	86
	.globl	__odr_asan.aocs
	.bss
	.type	__odr_asan.aocs, @object
	.size	__odr_asan.aocs, 1
__odr_asan.aocs:
	.zero	1
	.section	.data.rel.local
	.align 16
	.type	.LASANLOC3, @object
	.size	.LASANLOC3, 16
.LASANLOC3:
	.quad	.LC4
	.long	34
	.long	76
	.globl	__odr_asan.sys
	.bss
	.type	__odr_asan.sys, @object
	.size	__odr_asan.sys, 1
__odr_asan.sys:
	.zero	1
	.section	.data.rel.local
	.align 16
	.type	.LASANLOC4, @object
	.size	.LASANLOC4, 16
.LASANLOC4:
	.quad	.LC4
	.long	34
	.long	67
	.globl	__odr_asan.mpq
	.bss
	.type	__odr_asan.mpq, @object
	.size	__odr_asan.mpq, 1
__odr_asan.mpq:
	.zero	1
	.section	.data.rel.local
	.align 16
	.type	.LASANLOC5, @object
	.size	.LASANLOC5, 16
.LASANLOC5:
	.quad	.LC4
	.long	34
	.long	58
	.globl	__odr_asan.gcq
	.bss
	.type	__odr_asan.gcq, @object
	.size	__odr_asan.gcq, 1
__odr_asan.gcq:
	.zero	1
	.section	.data.rel.local
	.align 16
	.type	.LASANLOC6, @object
	.size	.LASANLOC6, 16
.LASANLOC6:
	.quad	.LC4
	.long	34
	.long	49
	.globl	__odr_asan.tm
	.bss
	.type	__odr_asan.tm, @object
	.size	__odr_asan.tm, 1
__odr_asan.tm:
	.zero	1
	.section	.data.rel.local
	.align 16
	.type	.LASANLOC7, @object
	.size	.LASANLOC7, 16
.LASANLOC7:
	.quad	.LC4
	.long	34
	.long	41
	.globl	__odr_asan.tc
	.bss
	.type	__odr_asan.tc, @object
	.size	__odr_asan.tc, 1
__odr_asan.tc:
	.zero	1
	.section	.data.rel.local
	.align 16
	.type	.LASANLOC8, @object
	.size	.LASANLOC8, 16
.LASANLOC8:
	.quad	.LC4
	.long	34
	.long	33
	.globl	__odr_asan.dhs
	.bss
	.type	__odr_asan.dhs, @object
	.size	__odr_asan.dhs, 1
__odr_asan.dhs:
	.zero	1
	.section	.data.rel.local
	.align 16
	.type	.LASANLOC9, @object
	.size	.LASANLOC9, 16
.LASANLOC9:
	.quad	.LC4
	.long	34
	.long	24
	.globl	__odr_asan.scio
	.bss
	.type	__odr_asan.scio, @object
	.size	__odr_asan.scio, 1
__odr_asan.scio:
	.zero	1
	.section	.data.rel.local
	.align 16
	.type	.LASANLOC10, @object
	.size	.LASANLOC10, 16
.LASANLOC10:
	.quad	.LC4
	.long	34
	.long	14
	.globl	__odr_asan.seq
	.bss
	.type	__odr_asan.seq, @object
	.size	__odr_asan.seq, 1
__odr_asan.seq:
	.zero	1
	.section	.data.rel.local
	.align 16
	.type	.LASANLOC11, @object
	.size	.LASANLOC11, 16
.LASANLOC11:
	.quad	.LC4
	.long	34
	.long	5
	.globl	__odr_asan.work_done
	.bss
	.type	__odr_asan.work_done, @object
	.size	__odr_asan.work_done, 1
__odr_asan.work_done:
	.zero	1
	.section	.data.rel.local
	.align 16
	.type	.LASANLOC12, @object
	.size	.LASANLOC12, 16
.LASANLOC12:
	.quad	.LC4
	.long	32
	.long	5
	.section	.rodata.str1.1
.LC5:
	.string	"pl"
.LC6:
	.string	"pf"
.LC7:
	.string	"aocs"
.LC8:
	.string	"sys"
.LC9:
	.string	"mpq"
.LC10:
	.string	"gcq"
.LC11:
	.string	"tm"
.LC12:
	.string	"tc"
.LC13:
	.string	"dhs"
.LC14:
	.string	"scio"
.LC15:
	.string	"seq"
.LC16:
	.string	"work_done"
.LC17:
	.string	"*.LC2"
.LC18:
	.string	"*.LC0"
.LC19:
	.string	"*.LC3"
	.section	.data.rel.local
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 960
.LASAN0:
	.quad	pl
	.quad	4
	.quad	64
	.quad	.LC5
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC1
	.quad	__odr_asan.pl
	.quad	pf
	.quad	4
	.quad	64
	.quad	.LC6
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC2
	.quad	__odr_asan.pf
	.quad	aocs
	.quad	4
	.quad	64
	.quad	.LC7
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC3
	.quad	__odr_asan.aocs
	.quad	sys
	.quad	4
	.quad	64
	.quad	.LC8
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC4
	.quad	__odr_asan.sys
	.quad	mpq
	.quad	4
	.quad	64
	.quad	.LC9
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC5
	.quad	__odr_asan.mpq
	.quad	gcq
	.quad	4
	.quad	64
	.quad	.LC10
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC6
	.quad	__odr_asan.gcq
	.quad	tm
	.quad	4
	.quad	64
	.quad	.LC11
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC7
	.quad	__odr_asan.tm
	.quad	tc
	.quad	4
	.quad	64
	.quad	.LC12
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC8
	.quad	__odr_asan.tc
	.quad	dhs
	.quad	4
	.quad	64
	.quad	.LC13
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC9
	.quad	__odr_asan.dhs
	.quad	scio
	.quad	4
	.quad	64
	.quad	.LC14
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC10
	.quad	__odr_asan.scio
	.quad	seq
	.quad	4
	.quad	64
	.quad	.LC15
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC11
	.quad	__odr_asan.seq
	.quad	work_done
	.quad	4
	.quad	64
	.quad	.LC16
	.quad	.LC4
	.quad	0
	.quad	.LASANLOC12
	.quad	__odr_asan.work_done
	.quad	.LC2
	.quad	55
	.quad	96
	.quad	.LC17
	.quad	.LC4
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC0
	.quad	42
	.quad	96
	.quad	.LC18
	.quad	.LC4
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC3
	.quad	31
	.quad	64
	.quad	.LC19
	.quad	.LC4
	.quad	0
	.quad	0
	.quad	0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00099_0, @function
_sub_D_00099_0:
.LFB84:
	.cfi_startproc
	endbr64
	movl	$15, %esi
	leaq	.LASAN0(%rip), %rdi
	jmp	__asan_unregister_globals@PLT
	.cfi_endproc
.LFE84:
	.size	_sub_D_00099_0, .-_sub_D_00099_0
	.section	.fini_array.00099,"aw"
	.align 8
	.quad	_sub_D_00099_0
	.section	.text.startup
	.p2align 4
	.type	_sub_I_00099_1, @function
_sub_I_00099_1:
.LFB85:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__asan_init@PLT
	call	__asan_version_mismatch_check_v8@PLT
	movl	$15, %esi
	leaq	.LASAN0(%rip), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__asan_register_globals@PLT
	.cfi_endproc
.LFE85:
	.size	_sub_I_00099_1, .-_sub_I_00099_1
	.section	.init_array.00099,"aw"
	.align 8
	.quad	_sub_I_00099_1
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
