	.file	"fsw-application.c"
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
.L6:
	movl	$14, %edi
	call	roxy_event_receive@PLT
	addl	$1, gcq(%rip)
	jmp	.L6
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
.L9:
	movl	$15, %edi
	call	roxy_event_receive@PLT
	addl	$1, mpq(%rip)
	jmp	.L9
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
.L12:
	movl	$16, %edi
	call	roxy_event_receive@PLT
	movl	$104, %edi
	call	roxy_event_receive@PLT
	addl	$1, sys(%rip)
	jmp	.L12
	.cfi_endproc
.LFE76:
	.size	SYS_VHF_task, .-SYS_VHF_task
	.globl	__asan_stack_malloc_3
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"1 32 256 18 message_buffer:128"
	.section	.rodata
	.align 32
.LC1:
	.string	"%s"
	.zero	61
	.text
	.p2align 4
	.globl	TC_VHF_task
	.type	TC_VHF_task, @function
TC_VHF_task:
.LASANPC72:
.LFB72:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$392, %rsp
	.cfi_def_cfa_offset 416
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	testl	%eax, %eax
	jne	.L22
.L14:
	leaq	.LC0(%rip), %rax
	movq	$1102416563, (%rbx)
	leaq	.LC1(%rip), %rbp
	movq	%rax, 8(%rbx)
	leaq	.LASANPC72(%rip), %rax
	movq	%rax, 16(%rbx)
	movq	%rbx, %rax
	addq	$32, %rbx
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-202116109, 2147450916(%rax)
	movl	$-202116109, 2147450920(%rax)
	movq	%fs:40, %rax
	movq	%rax, 376(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L19:
	movl	$12, %edi
	call	roxy_event_receive@PLT
	xorl	%ecx, %ecx
	movl	$256, %edx
	movq	%rbx, %rsi
	movl	$101, %edi
	call	roxy_mqueue_receive@PLT
	testl	%eax, %eax
	jne	.L18
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
.L18:
	addl	$1, tc(%rip)
	jmp	.L19
.L22:
	movl	$352, %edi
	call	__asan_stack_malloc_3@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L14
	.cfi_endproc
.LFE72:
	.size	TC_VHF_task, .-TC_VHF_task
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"1 32 256 18 message_buffer:146"
	.section	.rodata
	.align 32
.LC3:
	.string	"Hello from TM: %d\n"
	.zero	45
	.text
	.p2align 4
	.globl	TM_VHF_task
	.type	TM_VHF_task, @function
TM_VHF_task:
.LASANPC73:
.LFB73:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$392, %rsp
	.cfi_def_cfa_offset 416
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	testl	%eax, %eax
	jne	.L30
.L23:
	leaq	.LC2(%rip), %rax
	movq	$1102416563, (%rbx)
	leaq	.LC3(%rip), %rbp
	movq	%rax, 8(%rbx)
	leaq	.LASANPC73(%rip), %rax
	movq	%rax, 16(%rbx)
	movq	%rbx, %rax
	addq	$32, %rbx
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-202116109, 2147450916(%rax)
	movl	$-202116109, 2147450920(%rax)
	movq	%fs:40, %rax
	movq	%rax, 376(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L27:
	movl	$13, %edi
	call	roxy_event_receive@PLT
	movq	%rbp, %rcx
	movl	$256, %edx
	movq	%rbx, %rdi
	movl	tm(%rip), %r8d
	movl	$1, %esi
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movl	$256, %edx
	movq	%rbx, %rsi
	movl	$100, %edi
	call	roxy_mqueue_send@PLT
	addl	$1, tm(%rip)
	jmp	.L27
.L30:
	movl	$352, %edi
	call	__asan_stack_malloc_3@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L23
	.cfi_endproc
.LFE73:
	.size	TM_VHF_task, .-TM_VHF_task
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
.L32:
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
	jmp	.L32
	.cfi_endproc
.LFE80:
	.size	DHS_VHF_task, .-DHS_VHF_task
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"1 32 256 18 message_buffer:274"
	.section	.rodata
	.align 32
.LC5:
	.string	"a"
	.zero	62
	.align 32
.LC6:
	.string	"file-system-experiment.txt"
	.zero	37
	.align 32
.LC7:
	.string	"Failed to open file, exiting"
	.zero	35
	.text
	.p2align 4
	.globl	writer_task
	.type	writer_task, @function
writer_task:
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
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$392, %rsp
	.cfi_def_cfa_offset 432
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	testl	%eax, %eax
	jne	.L42
.L34:
	leaq	.LC4(%rip), %rax
	movq	$1102416563, (%rbx)
	leaq	.LC5(%rip), %r13
	movq	%rax, 8(%rbx)
	leaq	.LASANPC81(%rip), %rax
	leaq	.LC6(%rip), %r12
	movq	%rax, 16(%rbx)
	movq	%rbx, %rax
	addq	$32, %rbx
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-202116109, 2147450916(%rax)
	movl	$-202116109, 2147450920(%rax)
	movq	%fs:40, %rax
	movq	%rax, 376(%rsp)
	xorl	%eax, %eax
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L38:
	movq	%rbx, %rdi
	call	strlen@PLT
	movq	%rbx, %rdi
	movq	%rbp, %rcx
	movl	$1, %esi
	movq	%rax, %rdx
	call	fwrite@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
.L39:
	movl	$1, %ecx
	movl	$256, %edx
	movq	%rbx, %rsi
	movl	$100, %edi
	call	roxy_mqueue_receive@PLT
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L38
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
.L42:
	movl	$352, %edi
	call	__asan_stack_malloc_3@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L34
	.cfi_endproc
.LFE81:
	.size	writer_task, .-writer_task
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"1 32 256 18 message_buffer:292"
	.section	.rodata
	.align 32
.LC9:
	.string	"r"
	.zero	62
	.align 32
.LC10:
	.string	"filesize:%d bytes\n"
	.zero	45
	.text
	.p2align 4
	.globl	reader_task
	.type	reader_task, @function
reader_task:
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
	subq	$392, %rsp
	.cfi_def_cfa_offset 448
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	testl	%eax, %eax
	jne	.L51
.L43:
	leaq	.LC8(%rip), %rax
	movq	$1102416563, (%rbx)
	leaq	384(%rbx), %r14
	movq	%rax, 8(%rbx)
	leaq	.LASANPC82(%rip), %rax
	leaq	.LC9(%rip), %r12
	movq	%rax, 16(%rbx)
	shrq	$3, %rbx
	leaq	.LC10(%rip), %r13
	movl	$-235802127, 2147450880(%rbx)
	movl	$-202116109, 2147450916(%rbx)
	movl	$-202116109, 2147450920(%rbx)
	leaq	.LC6(%rip), %rbx
	movq	%fs:40, %rax
	movq	%rax, 376(%rsp)
	xorl	%eax, %eax
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L47:
	movl	$2, %edx
	xorl	%esi, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	movq	%rbp, %rdi
	call	ftell@PLT
	movq	%rbp, %rdi
	leaq	-352(%r14), %rbp
	movq	%rax, %r15
	call	fclose@PLT
	movl	%r15d, %r8d
	movq	%r13, %rcx
	movl	$256, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	call	__sprintf_chk@PLT
	movq	%rbp, %rsi
	movl	$101, %edi
	movl	$256, %edx
	call	roxy_mqueue_send@PLT
	movl	$1, %esi
	movl	$1, %edi
	call	roxy_task_wait@PLT
.L48:
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L47
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
.L51:
	movl	$352, %edi
	call	__asan_stack_malloc_3@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L43
	.cfi_endproc
.LFE82:
	.size	reader_task, .-reader_task
	.p2align 4
	.globl	timer_simulator
	.type	timer_simulator, @function
timer_simulator:
.LASANPC83:
.LFB83:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1000, %ebx
	.p2align 4,,10
	.p2align 3
.L53:
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
	jne	.L53
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE83:
	.size	timer_simulator, .-timer_simulator
	.section	.rodata
	.align 32
.LC11:
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
.L59:
	movl	$17, %edi
	call	roxy_event_receive@PLT
	movl	$101, %edi
	call	roxy_event_receive@PLT
	xorl	%edi, %edi
	call	roxy_critical_section_enter@PLT
	movl	work_done(%rip), %eax
	cmpl	$3, %eax
	ja	.L61
	addl	$1, %eax
	movl	%eax, work_done(%rip)
	cmpl	$3, %eax
	je	.L62
.L58:
	xorl	%edi, %edi
	call	roxy_critical_section_leave@PLT
	addl	$1, aocs(%rip)
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L61:
	movl	$1, %edi
	leaq	.LC11(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
.L62:
	movl	$104, %edi
	call	roxy_event_send@PLT
	jmp	.L58
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
.L66:
	movl	$18, %edi
	call	roxy_event_receive@PLT
	movl	$102, %edi
	call	roxy_event_receive@PLT
	xorl	%edi, %edi
	call	roxy_critical_section_enter@PLT
	movl	work_done(%rip), %eax
	cmpl	$3, %eax
	ja	.L68
	addl	$1, %eax
	movl	%eax, work_done(%rip)
	cmpl	$3, %eax
	je	.L69
.L65:
	xorl	%edi, %edi
	call	roxy_critical_section_leave@PLT
	addl	$1, pf(%rip)
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L68:
	movl	$1, %edi
	leaq	.LC11(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
.L69:
	movl	$104, %edi
	call	roxy_event_send@PLT
	jmp	.L65
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
.L73:
	movl	$19, %edi
	call	roxy_event_receive@PLT
	movl	$103, %edi
	call	roxy_event_receive@PLT
	xorl	%edi, %edi
	call	roxy_critical_section_enter@PLT
	movl	work_done(%rip), %eax
	cmpl	$3, %eax
	ja	.L75
	addl	$1, %eax
	movl	%eax, work_done(%rip)
	cmpl	$3, %eax
	je	.L76
.L72:
	xorl	%edi, %edi
	call	roxy_critical_section_leave@PLT
	addl	$1, pl(%rip)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L75:
	movl	$1, %edi
	leaq	.LC11(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
.L76:
	movl	$104, %edi
	call	roxy_event_send@PLT
	jmp	.L72
	.cfi_endproc
.LFE79:
	.size	PL_VHF_task, .-PL_VHF_task
	.globl	__asan_stack_malloc_0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC12:
	.string	"1 32 16 7 time:63"
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
	jne	.L85
.L77:
	leaq	.LC12(%rip), %rax
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
	jne	.L86
	imulq	$1000, -64(%r14), %rsi
	leaq	40(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L87
	movabsq	$2361183241434822607, %rdx
	movq	-56(%r14), %rcx
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%rdx
	sarq	$7, %rdx
	subq	%rcx, %rdx
	leaq	(%rdx,%rsi), %rax
	cmpq	%rbx, %rbp
	jne	.L88
	movq	$0, 2147450880(%r12)
.L79:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L89
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
.L85:
	.cfi_restore_state
	movl	$64, %edi
	call	__asan_stack_malloc_0@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L77
.L88:
	movabsq	$-723401728380766731, %rsi
	movq	$1172321806, (%rbx)
	movq	%rsi, 2147450880(%r12)
	movq	56(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L79
.L87:
	call	__asan_report_load8@PLT
.L86:
	movq	%r13, %rdi
	call	__asan_report_load8@PLT
.L89:
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
	ja	.L94
	addl	$1, %eax
	movl	%eax, work_done(%rip)
	cmpl	$3, %eax
	je	.L95
	xorl	%edi, %edi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	roxy_critical_section_leave@PLT
	.p2align 4,,10
	.p2align 3
.L94:
	.cfi_restore_state
	movl	$1, %edi
	leaq	.LC11(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
	.p2align 4,,10
	.p2align 3
.L95:
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
.LC13:
	.string	"seq=%d, scio=%d, dhs=%d, tc=%d, tm=%d, gcq=%d, mpq=%d\n"
	.zero	41
	.align 32
.LC14:
	.string	"sys=%d, aocs=%d, pf=%d, pl=%d\n"
	.zero	33
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LASANPC84:
.LFB84:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	roxy_init@PLT
	movl	$100, %edi
	call	roxy_mqueue_flush@PLT
	movl	$256, %edx
	movl	$512, %esi
	movl	$100, %edi
	call	roxy_mqueue_create@PLT
	movl	$101, %edi
	call	roxy_mqueue_flush@PLT
	movl	$256, %edx
	movl	$512, %esi
	movl	$101, %edi
	call	roxy_mqueue_create@PLT
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
	movl	$10, %esi
	xorl	%edx, %edx
	leaq	SYS_VHF_task(%rip), %rcx
	movl	$106, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	AOCS_VHF_task(%rip), %rcx
	movl	$10, %esi
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
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	writer_task(%rip), %rcx
	movl	$20, %esi
	movl	$111, %edi
	call	roxy_task_create@PLT
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	leaq	reader_task(%rip), %rcx
	movl	$20, %esi
	movl	$112, %edi
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
	movl	$1, %esi
	movl	$111, %edi
	call	roxy_task_start@PLT
	movl	$1, %esi
	movl	$112, %edi
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
	leaq	.LC13(%rip), %rsi
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
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	movl	sys(%rip), %edx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE84:
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
.LC15:
	.string	"src/fsw-application.c"
	.section	.data.rel.local,"aw"
	.align 16
	.type	.LASANLOC1, @object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.quad	.LC15
	.long	59
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
	.quad	.LC15
	.long	59
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
	.quad	.LC15
	.long	59
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
	.quad	.LC15
	.long	59
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
	.quad	.LC15
	.long	59
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
	.quad	.LC15
	.long	59
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
	.quad	.LC15
	.long	59
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
	.quad	.LC15
	.long	59
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
	.quad	.LC15
	.long	59
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
	.quad	.LC15
	.long	59
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
	.quad	.LC15
	.long	59
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
	.quad	.LC15
	.long	57
	.long	5
	.section	.rodata.str1.1
.LC16:
	.string	"pl"
.LC17:
	.string	"pf"
.LC18:
	.string	"aocs"
.LC19:
	.string	"sys"
.LC20:
	.string	"mpq"
.LC21:
	.string	"gcq"
.LC22:
	.string	"tm"
.LC23:
	.string	"tc"
.LC24:
	.string	"dhs"
.LC25:
	.string	"scio"
.LC26:
	.string	"seq"
.LC27:
	.string	"work_done"
.LC28:
	.string	"*.LC11"
.LC29:
	.string	"*.LC13"
.LC30:
	.string	"*.LC5"
.LC31:
	.string	"*.LC1"
.LC32:
	.string	"*.LC9"
.LC33:
	.string	"*.LC6"
.LC34:
	.string	"*.LC3"
.LC35:
	.string	"*.LC14"
.LC36:
	.string	"*.LC7"
.LC37:
	.string	"*.LC10"
	.section	.data.rel.local
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 1408
.LASAN0:
	.quad	pl
	.quad	4
	.quad	64
	.quad	.LC16
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC1
	.quad	__odr_asan.pl
	.quad	pf
	.quad	4
	.quad	64
	.quad	.LC17
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC2
	.quad	__odr_asan.pf
	.quad	aocs
	.quad	4
	.quad	64
	.quad	.LC18
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC3
	.quad	__odr_asan.aocs
	.quad	sys
	.quad	4
	.quad	64
	.quad	.LC19
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC4
	.quad	__odr_asan.sys
	.quad	mpq
	.quad	4
	.quad	64
	.quad	.LC20
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC5
	.quad	__odr_asan.mpq
	.quad	gcq
	.quad	4
	.quad	64
	.quad	.LC21
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC6
	.quad	__odr_asan.gcq
	.quad	tm
	.quad	4
	.quad	64
	.quad	.LC22
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC7
	.quad	__odr_asan.tm
	.quad	tc
	.quad	4
	.quad	64
	.quad	.LC23
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC8
	.quad	__odr_asan.tc
	.quad	dhs
	.quad	4
	.quad	64
	.quad	.LC24
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC9
	.quad	__odr_asan.dhs
	.quad	scio
	.quad	4
	.quad	64
	.quad	.LC25
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC10
	.quad	__odr_asan.scio
	.quad	seq
	.quad	4
	.quad	64
	.quad	.LC26
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC11
	.quad	__odr_asan.seq
	.quad	work_done
	.quad	4
	.quad	64
	.quad	.LC27
	.quad	.LC15
	.quad	0
	.quad	.LASANLOC12
	.quad	__odr_asan.work_done
	.quad	.LC11
	.quad	42
	.quad	96
	.quad	.LC28
	.quad	.LC15
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC13
	.quad	55
	.quad	96
	.quad	.LC29
	.quad	.LC15
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC5
	.quad	2
	.quad	64
	.quad	.LC30
	.quad	.LC15
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC1
	.quad	3
	.quad	64
	.quad	.LC31
	.quad	.LC15
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC9
	.quad	2
	.quad	64
	.quad	.LC32
	.quad	.LC15
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC6
	.quad	27
	.quad	64
	.quad	.LC33
	.quad	.LC15
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC3
	.quad	19
	.quad	64
	.quad	.LC34
	.quad	.LC15
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC14
	.quad	31
	.quad	64
	.quad	.LC35
	.quad	.LC15
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC7
	.quad	29
	.quad	64
	.quad	.LC36
	.quad	.LC15
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC10
	.quad	19
	.quad	64
	.quad	.LC37
	.quad	.LC15
	.quad	0
	.quad	0
	.quad	0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00099_0, @function
_sub_D_00099_0:
.LFB86:
	.cfi_startproc
	endbr64
	movl	$22, %esi
	leaq	.LASAN0(%rip), %rdi
	jmp	__asan_unregister_globals@PLT
	.cfi_endproc
.LFE86:
	.size	_sub_D_00099_0, .-_sub_D_00099_0
	.section	.fini_array.00099,"aw"
	.align 8
	.quad	_sub_D_00099_0
	.section	.text.startup
	.p2align 4
	.type	_sub_I_00099_1, @function
_sub_I_00099_1:
.LFB87:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__asan_init@PLT
	call	__asan_version_mismatch_check_v8@PLT
	movl	$22, %esi
	leaq	.LASAN0(%rip), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__asan_register_globals@PLT
	.cfi_endproc
.LFE87:
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
