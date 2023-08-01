	.file	"main.c"
	.text
	.globl	__asan_stack_malloc_1
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"3 32 16 4 time 64 16 4 time 96 16 4 time"
	.section	.rodata
	.align 32
.LC1:
	.string	"SCIO received the VHF event at:%ld\n"
	.zero	60
	.align 32
.LC2:
	.string	"SCIO executing phase 1 at:%ld\n"
	.zero	33
	.align 32
.LC3:
	.string	"SCIO exit at:%ld\n"
	.zero	46
	.text
	.p2align 4
	.globl	SCIO_VHF_task
	.type	SCIO_VHF_task, @function
SCIO_VHF_task:
.LASANPC71:
.LFB71:
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	__asan_option_detect_stack_use_after_return(%rip), %r10d
	leaq	16(%rsp), %r15
	testl	%r10d, %r10d
	jne	.L15
.L1:
	leaq	.LC0(%rip), %rax
	movq	$1102416563, (%r15)
	leaq	32(%r15), %r12
	movabsq	$2361183241434822607, %rbp
	movq	%rax, 8(%r15)
	leaq	.LASANPC71(%rip), %rax
	leaq	160(%r15), %rbx
	movq	%rax, 16(%r15)
	movq	%r15, %rax
	leaq	.LC1(%rip), %r13
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-219021312, 2147450884(%rax)
	movl	$-219021312, 2147450888(%rax)
	movl	$-202178560, 2147450892(%rax)
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	leaq	40(%r15), %rax
	movq	%rax, 8(%rsp)
	shrq	$3, %rax
	movq	%rax, (%rsp)
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L5:
	movq	(%rsp), %rax
	imulq	$1000, -128(%rbx), %rdi
	cmpb	$0, 2147450880(%rax)
	jne	.L16
	movq	-120(%rbx), %rsi
	leaq	-96(%rbx), %r15
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	movq	%r13, %rsi
	addq	%rdi, %rdx
	movl	$-1800, %edi
	movw	%di, 2147450880(%r14)
	movl	$1, %edi
	movq	%r15, %r14
	shrq	$3, %r14
	call	__printf_chk@PLT
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r8w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L17
	imulq	$1000, -96(%rbx), %rdi
	leaq	-88(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L18
	movq	-88(%rbx), %rsi
	movl	$-1800, %ecx
	leaq	-64(%rbx), %r15
	movw	%cx, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC2(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	movw	%si, 2147450880(%r14)
	xorl	%esi, %esi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L19
	imulq	$1000, -64(%rbx), %rdi
	leaq	-56(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L20
	movq	-56(%rbx), %rsi
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	movl	$-1800, %eax
	movw	%ax, 2147450880(%r14)
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC3(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
.L11:
	movl	$100, %edi
	movq	%r12, %r14
	call	roxy_event_receive@PLT
	shrq	$3, %r14
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	movw	%r9w, 2147450880(%r14)
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	je	.L5
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.L16:
	movq	8(%rsp), %rdi
	call	__asan_report_load8@PLT
.L17:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L18:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L19:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L20:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L15:
	movl	$128, %edi
	call	__asan_stack_malloc_1@PLT
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L1
	.cfi_endproc
.LFE71:
	.size	SCIO_VHF_task, .-SCIO_VHF_task
	.section	.rodata
	.align 32
.LC4:
	.string	"TC received the VHF event at:%ld\n"
	.zero	62
	.align 32
.LC5:
	.string	"TC executing phase 1 at:%ld\n"
	.zero	35
	.align 32
.LC6:
	.string	"TC exit at:%ld\n"
	.zero	48
	.text
	.p2align 4
	.globl	TC_VHF_task
	.type	TC_VHF_task, @function
TC_VHF_task:
.LASANPC72:
.LFB72:
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	__asan_option_detect_stack_use_after_return(%rip), %r10d
	leaq	16(%rsp), %r15
	testl	%r10d, %r10d
	jne	.L34
.L21:
	leaq	.LC0(%rip), %rax
	movq	$1102416563, (%r15)
	leaq	32(%r15), %r12
	movabsq	$2361183241434822607, %rbp
	movq	%rax, 8(%r15)
	leaq	.LASANPC72(%rip), %rax
	leaq	160(%r15), %rbx
	movq	%rax, 16(%r15)
	movq	%r15, %rax
	leaq	.LC4(%rip), %r13
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-219021312, 2147450884(%rax)
	movl	$-219021312, 2147450888(%rax)
	movl	$-202178560, 2147450892(%rax)
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	leaq	40(%r15), %rax
	movq	%rax, 8(%rsp)
	shrq	$3, %rax
	movq	%rax, (%rsp)
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L25:
	movq	(%rsp), %rax
	imulq	$1000, -128(%rbx), %rdi
	cmpb	$0, 2147450880(%rax)
	jne	.L35
	movq	-120(%rbx), %rsi
	leaq	-96(%rbx), %r15
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	movq	%r13, %rsi
	addq	%rdi, %rdx
	movl	$-1800, %edi
	movw	%di, 2147450880(%r14)
	movl	$1, %edi
	movq	%r15, %r14
	shrq	$3, %r14
	call	__printf_chk@PLT
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r8w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L36
	imulq	$1000, -96(%rbx), %rdi
	leaq	-88(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L37
	movq	-88(%rbx), %rsi
	movl	$-1800, %ecx
	leaq	-64(%rbx), %r15
	movw	%cx, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC5(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	movw	%si, 2147450880(%r14)
	xorl	%esi, %esi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L38
	imulq	$1000, -64(%rbx), %rdi
	leaq	-56(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L39
	movq	-56(%rbx), %rsi
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	movl	$-1800, %eax
	movw	%ax, 2147450880(%r14)
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC6(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
.L31:
	movl	$100, %edi
	movq	%r12, %r14
	call	roxy_event_receive@PLT
	shrq	$3, %r14
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	movw	%r9w, 2147450880(%r14)
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	je	.L25
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.L35:
	movq	8(%rsp), %rdi
	call	__asan_report_load8@PLT
.L36:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L37:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L38:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L39:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L34:
	movl	$128, %edi
	call	__asan_stack_malloc_1@PLT
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L21
	.cfi_endproc
.LFE72:
	.size	TC_VHF_task, .-TC_VHF_task
	.section	.rodata
	.align 32
.LC7:
	.string	"TM received the VHF event at:%ld\n"
	.zero	62
	.align 32
.LC8:
	.string	"TM executing phase 1 at:%ld\n"
	.zero	35
	.align 32
.LC9:
	.string	"TM exit at:%ld\n"
	.zero	48
	.text
	.p2align 4
	.globl	TM_VHF_task
	.type	TM_VHF_task, @function
TM_VHF_task:
.LASANPC73:
.LFB73:
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	__asan_option_detect_stack_use_after_return(%rip), %r10d
	leaq	16(%rsp), %r15
	testl	%r10d, %r10d
	jne	.L53
.L40:
	leaq	.LC0(%rip), %rax
	movq	$1102416563, (%r15)
	leaq	32(%r15), %r12
	movabsq	$2361183241434822607, %rbp
	movq	%rax, 8(%r15)
	leaq	.LASANPC73(%rip), %rax
	leaq	160(%r15), %rbx
	movq	%rax, 16(%r15)
	movq	%r15, %rax
	leaq	.LC7(%rip), %r13
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-219021312, 2147450884(%rax)
	movl	$-219021312, 2147450888(%rax)
	movl	$-202178560, 2147450892(%rax)
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	leaq	40(%r15), %rax
	movq	%rax, 8(%rsp)
	shrq	$3, %rax
	movq	%rax, (%rsp)
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L44:
	movq	(%rsp), %rax
	imulq	$1000, -128(%rbx), %rdi
	cmpb	$0, 2147450880(%rax)
	jne	.L54
	movq	-120(%rbx), %rsi
	leaq	-96(%rbx), %r15
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	movq	%r13, %rsi
	addq	%rdi, %rdx
	movl	$-1800, %edi
	movw	%di, 2147450880(%r14)
	movl	$1, %edi
	movq	%r15, %r14
	shrq	$3, %r14
	call	__printf_chk@PLT
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r8w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L55
	imulq	$1000, -96(%rbx), %rdi
	leaq	-88(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L56
	movq	-88(%rbx), %rsi
	movl	$-1800, %ecx
	leaq	-64(%rbx), %r15
	movw	%cx, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC8(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	movw	%si, 2147450880(%r14)
	xorl	%esi, %esi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L57
	imulq	$1000, -64(%rbx), %rdi
	leaq	-56(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L58
	movq	-56(%rbx), %rsi
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	movl	$-1800, %eax
	movw	%ax, 2147450880(%r14)
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC9(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
.L50:
	movl	$100, %edi
	movq	%r12, %r14
	call	roxy_event_receive@PLT
	shrq	$3, %r14
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	movw	%r9w, 2147450880(%r14)
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	je	.L44
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.L54:
	movq	8(%rsp), %rdi
	call	__asan_report_load8@PLT
.L55:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L56:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L57:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L58:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L53:
	movl	$128, %edi
	call	__asan_stack_malloc_1@PLT
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L40
	.cfi_endproc
.LFE73:
	.size	TM_VHF_task, .-TM_VHF_task
	.section	.rodata
	.align 32
.LC10:
	.string	"GCQ received the VHF event at:%ld\n"
	.zero	61
	.align 32
.LC11:
	.string	"GCQ executing phase 1 at:%ld\n"
	.zero	34
	.align 32
.LC12:
	.string	"GCQ exit at:%ld\n"
	.zero	47
	.text
	.p2align 4
	.globl	GCQ_VHF_task
	.type	GCQ_VHF_task, @function
GCQ_VHF_task:
.LASANPC74:
.LFB74:
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	__asan_option_detect_stack_use_after_return(%rip), %r10d
	leaq	16(%rsp), %r15
	testl	%r10d, %r10d
	jne	.L72
.L59:
	leaq	.LC0(%rip), %rax
	movq	$1102416563, (%r15)
	leaq	32(%r15), %r12
	movabsq	$2361183241434822607, %rbp
	movq	%rax, 8(%r15)
	leaq	.LASANPC74(%rip), %rax
	leaq	160(%r15), %rbx
	movq	%rax, 16(%r15)
	movq	%r15, %rax
	leaq	.LC10(%rip), %r13
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-219021312, 2147450884(%rax)
	movl	$-219021312, 2147450888(%rax)
	movl	$-202178560, 2147450892(%rax)
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	leaq	40(%r15), %rax
	movq	%rax, 8(%rsp)
	shrq	$3, %rax
	movq	%rax, (%rsp)
	jmp	.L69
	.p2align 4,,10
	.p2align 3
.L63:
	movq	(%rsp), %rax
	imulq	$1000, -128(%rbx), %rdi
	cmpb	$0, 2147450880(%rax)
	jne	.L73
	movq	-120(%rbx), %rsi
	leaq	-96(%rbx), %r15
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	movq	%r13, %rsi
	addq	%rdi, %rdx
	movl	$-1800, %edi
	movw	%di, 2147450880(%r14)
	movl	$1, %edi
	movq	%r15, %r14
	shrq	$3, %r14
	call	__printf_chk@PLT
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r8w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L74
	imulq	$1000, -96(%rbx), %rdi
	leaq	-88(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L75
	movq	-88(%rbx), %rsi
	movl	$-1800, %ecx
	leaq	-64(%rbx), %r15
	movw	%cx, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC11(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	movw	%si, 2147450880(%r14)
	xorl	%esi, %esi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L76
	imulq	$1000, -64(%rbx), %rdi
	leaq	-56(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L77
	movq	-56(%rbx), %rsi
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	movl	$-1800, %eax
	movw	%ax, 2147450880(%r14)
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC12(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
.L69:
	movl	$100, %edi
	movq	%r12, %r14
	call	roxy_event_receive@PLT
	shrq	$3, %r14
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	movw	%r9w, 2147450880(%r14)
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	je	.L63
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.L73:
	movq	8(%rsp), %rdi
	call	__asan_report_load8@PLT
.L74:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L75:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L76:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L77:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L72:
	movl	$128, %edi
	call	__asan_stack_malloc_1@PLT
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L59
	.cfi_endproc
.LFE74:
	.size	GCQ_VHF_task, .-GCQ_VHF_task
	.section	.rodata
	.align 32
.LC13:
	.string	"MPQ received the VHF event at:%ld\n"
	.zero	61
	.align 32
.LC14:
	.string	"MPQ executing phase 1 at:%ld\n"
	.zero	34
	.align 32
.LC15:
	.string	"MPQ exit at:%ld\n"
	.zero	47
	.text
	.p2align 4
	.globl	MPQ_VHF_task
	.type	MPQ_VHF_task, @function
MPQ_VHF_task:
.LASANPC75:
.LFB75:
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
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movl	__asan_option_detect_stack_use_after_return(%rip), %r10d
	leaq	16(%rsp), %r15
	testl	%r10d, %r10d
	jne	.L91
.L78:
	leaq	.LC0(%rip), %rax
	movq	$1102416563, (%r15)
	leaq	32(%r15), %r12
	movabsq	$2361183241434822607, %rbp
	movq	%rax, 8(%r15)
	leaq	.LASANPC75(%rip), %rax
	leaq	160(%r15), %rbx
	movq	%rax, 16(%r15)
	movq	%r15, %rax
	leaq	.LC13(%rip), %r13
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-219021312, 2147450884(%rax)
	movl	$-219021312, 2147450888(%rax)
	movl	$-202178560, 2147450892(%rax)
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	leaq	40(%r15), %rax
	movq	%rax, 8(%rsp)
	shrq	$3, %rax
	movq	%rax, (%rsp)
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L82:
	movq	(%rsp), %rax
	imulq	$1000, -128(%rbx), %rdi
	cmpb	$0, 2147450880(%rax)
	jne	.L92
	movq	-120(%rbx), %rsi
	leaq	-96(%rbx), %r15
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	movq	%r13, %rsi
	addq	%rdi, %rdx
	movl	$-1800, %edi
	movw	%di, 2147450880(%r14)
	movl	$1, %edi
	movq	%r15, %r14
	shrq	$3, %r14
	call	__printf_chk@PLT
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r8w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L93
	imulq	$1000, -96(%rbx), %rdi
	leaq	-88(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L94
	movq	-88(%rbx), %rsi
	movl	$-1800, %ecx
	leaq	-64(%rbx), %r15
	movw	%cx, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC14(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	movw	%si, 2147450880(%r14)
	xorl	%esi, %esi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L95
	imulq	$1000, -64(%rbx), %rdi
	leaq	-56(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L96
	movq	-56(%rbx), %rsi
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	movl	$-1800, %eax
	movw	%ax, 2147450880(%r14)
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC15(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
.L88:
	movl	$100, %edi
	movq	%r12, %r14
	call	roxy_event_receive@PLT
	shrq	$3, %r14
	xorl	%r9d, %r9d
	xorl	%esi, %esi
	movw	%r9w, 2147450880(%r14)
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	je	.L82
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.L92:
	movq	8(%rsp), %rdi
	call	__asan_report_load8@PLT
.L93:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L94:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L95:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L96:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L91:
	movl	$128, %edi
	call	__asan_stack_malloc_1@PLT
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L78
	.cfi_endproc
.LFE75:
	.size	MPQ_VHF_task, .-MPQ_VHF_task
	.globl	__asan_stack_malloc_2
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"5 32 16 4 time 64 16 4 time 96 16 4 time 128 16 4 time 160 16 4 time"
	.section	.rodata
	.align 32
.LC17:
	.string	"SYS received the VHF event at:%ld\n"
	.zero	61
	.align 32
.LC18:
	.string	"SYS executing phase 1 at:%ld\n"
	.zero	34
	.align 32
.LC19:
	.string	"SYS received the END_APP_SW event at:%ld\n"
	.zero	54
	.align 32
.LC20:
	.string	"SYS executing phase 2 at:%ld\n"
	.zero	34
	.align 32
.LC21:
	.string	"SYS exit at:%ld\n"
	.zero	47
	.text
	.p2align 4
	.globl	SYS_VHF_task
	.type	SYS_VHF_task, @function
SYS_VHF_task:
.LASANPC76:
.LFB76:
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
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %r15
	testl	%eax, %eax
	jne	.L114
.L97:
	leaq	.LC16(%rip), %rax
	movq	$1102416563, (%r15)
	leaq	32(%r15), %r12
	movabsq	$2361183241434822607, %rbp
	movq	%rax, 8(%r15)
	leaq	.LASANPC76(%rip), %rax
	leaq	224(%r15), %rbx
	movq	%rax, 16(%r15)
	movq	%r15, %rax
	leaq	.LC17(%rip), %r13
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-219021312, 2147450884(%rax)
	movl	$-219021312, 2147450888(%rax)
	movl	$-219021312, 2147450892(%rax)
	movl	$-219021312, 2147450896(%rax)
	movl	$-202178560, 2147450900(%rax)
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	40(%r15), %rax
	movq	%rax, 8(%rsp)
	shrq	$3, %rax
	movq	%rax, (%rsp)
	jmp	.L111
	.p2align 4,,10
	.p2align 3
.L101:
	imulq	$1000, -192(%rbx), %rdi
	movq	(%rsp), %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L115
	movq	-184(%rbx), %rsi
	movl	$-1800, %r11d
	leaq	-160(%rbx), %r15
	movw	%r11w, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	movq	%r13, %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	xorl	%esi, %esi
	movq	%r15, %rdi
	movw	%ax, 2147450880(%r14)
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L116
	leaq	-152(%rbx), %r8
	imulq	$1000, -160(%rbx), %rdi
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L117
	movq	-152(%rbx), %rsi
	movl	$-1800, %r9d
	leaq	-128(%rbx), %r15
	movw	%r9w, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC18(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$104, %edi
	call	roxy_event_receive@PLT
	xorl	%r10d, %r10d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r10w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L118
	imulq	$1000, -128(%rbx), %rdi
	leaq	-120(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L119
	movq	-120(%rbx), %rsi
	leaq	-96(%rbx), %r15
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC19(%rip), %rsi
	addq	%rdi, %rdx
	movl	$-1800, %edi
	movw	%di, 2147450880(%r14)
	movl	$1, %edi
	movq	%r15, %r14
	shrq	$3, %r14
	call	__printf_chk@PLT
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r8w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L120
	imulq	$1000, -96(%rbx), %rdi
	leaq	-88(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L121
	movq	-88(%rbx), %rsi
	movl	$-1800, %ecx
	leaq	-64(%rbx), %r15
	movw	%cx, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC20(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	movw	%si, 2147450880(%r14)
	xorl	%esi, %esi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L122
	imulq	$1000, -64(%rbx), %rsi
	leaq	-56(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L123
	movq	-56(%rbx), %rcx
	movq	%r15, %rdi
	shrq	$3, %rdi
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%rbp
	movl	$-1800, %eax
	movw	%ax, 2147450880(%rdi)
	movl	$1, %edi
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC21(%rip), %rsi
	call	__printf_chk@PLT
.L111:
	movl	$100, %edi
	movq	%r12, %r14
	call	roxy_event_receive@PLT
	shrq	$3, %r14
	xorl	%eax, %eax
	xorl	%esi, %esi
	movw	%ax, 2147450880(%r14)
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	je	.L101
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.L115:
	movq	8(%rsp), %rdi
	call	__asan_report_load8@PLT
.L116:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L117:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L118:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L119:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L120:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L121:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L122:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L123:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L114:
	movl	$192, %edi
	call	__asan_stack_malloc_2@PLT
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L97
	.cfi_endproc
.LFE76:
	.size	SYS_VHF_task, .-SYS_VHF_task
	.globl	__asan_stack_malloc_3
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"11 32 16 4 time 64 16 4 time 96 16 4 time 128 16 4 time 160 16 4 time 192 16 4 time 224 16 4 time 256 16 4 time 288 16 4 time 320 16 4 time 352 16 4 time"
	.section	.rodata
	.align 32
.LC23:
	.string	"DHS received the VHF event at:%ld\n"
	.zero	61
	.align 32
.LC24:
	.string	"DHS executing phase 1 at:%ld\n"
	.zero	34
	.align 32
.LC25:
	.string	"DHS executing phase 2 at:%ld\n"
	.zero	34
	.align 32
.LC26:
	.string	"DHS send the AOCS_ACQ event at:%ld\n"
	.zero	60
	.align 32
.LC27:
	.string	"DHS executing phase 3 at:%ld\n"
	.zero	34
	.align 32
.LC28:
	.string	"DHS send the PF_ACQ event at:%ld\n"
	.zero	62
	.align 32
.LC29:
	.string	"DHS executing phase 4 at:%ld\n"
	.zero	34
	.align 32
.LC30:
	.string	"DHS send the PL_ACQ event at:%ld\n"
	.zero	62
	.align 32
.LC31:
	.string	"DHS received the END_APP_SW event at:%ld\n"
	.zero	54
	.align 32
.LC32:
	.string	"DHS executing phase 5 at:%ld\n"
	.zero	34
	.align 32
.LC33:
	.string	"DHS exit at:%ld\n"
	.zero	47
	.text
	.p2align 4
	.globl	DHS_VHF_task
	.type	DHS_VHF_task, @function
DHS_VHF_task:
.LASANPC80:
.LFB80:
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
	subq	$440, %rsp
	.cfi_def_cfa_offset 496
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %rbp
	movq	%rbp, 8(%rsp)
	testl	%eax, %eax
	jne	.L152
.L124:
	leaq	.LC22(%rip), %rax
	movq	%rbp, %r12
	leaq	32(%rbp), %r13
	xorl	%edi, %edi
	movq	%rax, 8(%rbp)
	shrq	$3, %r12
	leaq	.LASANPC80(%rip), %rax
	leaq	416(%rbp), %rbx
	movq	$1102416563, 0(%rbp)
	movq	%rax, 16(%rbp)
	movl	$-235802127, 2147450880(%r12)
	movl	$-219021312, 2147450884(%r12)
	movl	$-219021312, 2147450888(%r12)
	movl	$-219021312, 2147450892(%r12)
	movl	$-219021312, 2147450896(%r12)
	movl	$-219021312, 2147450900(%r12)
	movl	$-219021312, 2147450904(%r12)
	movl	$-219021312, 2147450908(%r12)
	movl	$-219021312, 2147450912(%r12)
	movl	$-219021312, 2147450916(%r12)
	movl	$-219021312, 2147450920(%r12)
	movl	$-202178560, 2147450924(%r12)
	movq	%fs:40, %rax
	movq	%rax, 424(%rsp)
	xorl	%eax, %eax
	call	roxy_critical_section_enter@PLT
	xorl	%edi, %edi
	movl	$0, work_done(%rip)
	call	roxy_critical_section_leave@PLT
	movl	$100, %edi
	call	roxy_event_receive@PLT
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r13, %rdi
	call	gettimeofday@PLT
	movq	%r13, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L153
	imulq	$1000, -384(%rbx), %r8
	leaq	40(%rbp), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L154
	movq	-376(%rbx), %rcx
	leaq	64(%rbp), %r14
	movl	$1, %edi
	movabsq	$2361183241434822607, %r13
	movq	%r14, %r15
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%r13
	movl	$-1800, %eax
	shrq	$3, %r15
	movw	%ax, 2147450880(%rsi)
	leaq	.LC23(%rip), %rsi
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%r8, %rdx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	xorl	%esi, %esi
	movq	%r14, %rdi
	movw	%ax, 2147450880(%r15)
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r15)
	jne	.L155
	imulq	$1000, -352(%rbx), %rsi
	leaq	72(%rbp), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L156
	movq	-344(%rbx), %rcx
	movl	$-1800, %r11d
	leaq	96(%rbp), %r14
	movl	$1, %edi
	movw	%r11w, 2147450880(%r15)
	movq	%r14, %r15
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%r13
	xorl	%eax, %eax
	shrq	$3, %r15
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC24(%rip), %rsi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	xorl	%esi, %esi
	movq	%r14, %rdi
	movw	%ax, 2147450880(%r15)
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r15)
	jne	.L157
	imulq	$1000, -320(%rbx), %rsi
	leaq	104(%rbp), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L158
	movq	-312(%rbx), %rcx
	movl	$-1800, %r9d
	movl	$1, %edi
	leaq	128(%rbp), %r14
	movw	%r9w, 2147450880(%r15)
	movq	%r14, %r15
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%r13
	xorl	%eax, %eax
	shrq	$3, %r15
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC25(%rip), %rsi
	call	__printf_chk@PLT
	xorl	%r10d, %r10d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r10w, 2147450880(%r15)
	movq	%r14, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r15)
	jne	.L159
	leaq	136(%rbp), %rdi
	imulq	$1000, -288(%rbx), %rsi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L160
	movq	-280(%rbx), %rcx
	movl	$-1800, %edi
	movw	%di, 2147450880(%r15)
	movl	$1, %edi
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%r13
	xorl	%eax, %eax
	leaq	160(%rbp), %r13
	movq	%r13, %r15
	shrq	$3, %r15
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC26(%rip), %rsi
	call	__printf_chk@PLT
	movl	$101, %edi
	call	roxy_event_send@PLT
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r8w, 2147450880(%r15)
	movq	%r13, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r15)
	jne	.L161
	leaq	168(%rbp), %rdi
	imulq	$1000, -256(%rbx), %rsi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L162
	movq	-248(%rbx), %rcx
	leaq	-224(%rbx), %r14
	movl	$1, %edi
	movabsq	$2361183241434822607, %r13
	movq	%r14, %r15
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%r13
	leaq	-256(%rbx), %rax
	shrq	$3, %r15
	shrq	$3, %rax
	sarq	$7, %rdx
	subq	%rcx, %rdx
	movl	$-1800, %ecx
	movw	%cx, 2147450880(%rax)
	addq	%rsi, %rdx
	xorl	%eax, %eax
	leaq	.LC27(%rip), %rsi
	call	__printf_chk@PLT
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r14, %rdi
	movw	%si, 2147450880(%r15)
	xorl	%esi, %esi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r15)
	jne	.L163
	leaq	-216(%rbx), %rdi
	imulq	$1000, -224(%rbx), %rsi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L164
	movq	-216(%rbx), %rcx
	movl	$1, %edi
	leaq	-192(%rbx), %r14
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%r13
	movl	$-1800, %eax
	movw	%ax, 2147450880(%r15)
	xorl	%eax, %eax
	movq	%r14, %r15
	shrq	$3, %r15
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC28(%rip), %rsi
	call	__printf_chk@PLT
	movl	$102, %edi
	call	roxy_event_send@PLT
	xorl	%eax, %eax
	xorl	%esi, %esi
	movq	%r14, %rdi
	movw	%ax, 2147450880(%r15)
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r15)
	jne	.L165
	leaq	-184(%rbx), %rdi
	imulq	$1000, -192(%rbx), %rsi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L166
	movq	-184(%rbx), %rcx
	movl	$-1800, %r11d
	movl	$1, %edi
	leaq	-160(%rbx), %r14
	movw	%r11w, 2147450880(%r15)
	movq	%r14, %r15
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%r13
	xorl	%eax, %eax
	shrq	$3, %r15
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC29(%rip), %rsi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	xorl	%esi, %esi
	movq	%r14, %rdi
	movw	%ax, 2147450880(%r15)
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r15)
	jne	.L167
	leaq	-152(%rbx), %rdi
	imulq	$1000, -160(%rbx), %rsi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L168
	movq	-152(%rbx), %rcx
	movl	$-1800, %r9d
	movl	$1, %edi
	leaq	-128(%rbx), %r14
	movw	%r9w, 2147450880(%r15)
	movq	%r14, %r15
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%r13
	xorl	%eax, %eax
	shrq	$3, %r15
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC30(%rip), %rsi
	call	__printf_chk@PLT
	movl	$103, %edi
	call	roxy_event_send@PLT
	movl	$104, %edi
	call	roxy_event_receive@PLT
	xorl	%r10d, %r10d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r10w, 2147450880(%r15)
	movq	%r14, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r15)
	jne	.L169
	imulq	$1000, -128(%rbx), %rsi
	leaq	-120(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L170
	movq	-120(%rbx), %rcx
	movl	$-1800, %edi
	movw	%di, 2147450880(%r15)
	leaq	-96(%rbx), %r15
	movl	$1, %edi
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%r13
	xorl	%eax, %eax
	movq	%r15, %r13
	shrq	$3, %r13
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC31(%rip), %rsi
	call	__printf_chk@PLT
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r8w, 2147450880(%r13)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r13)
	jne	.L171
	imulq	$1000, -96(%rbx), %rsi
	leaq	-88(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L172
	movq	-88(%rbx), %rcx
	shrq	$3, %r15
	leaq	-64(%rbx), %r14
	movabsq	$2361183241434822607, %r13
	movl	$1, %edi
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%r13
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rcx, %rdx
	movl	$-1800, %ecx
	movw	%cx, 2147450880(%r15)
	addq	%rsi, %rdx
	movq	%r14, %r15
	leaq	.LC32(%rip), %rsi
	shrq	$3, %r15
	call	__printf_chk@PLT
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r14, %rdi
	movw	%si, 2147450880(%r15)
	xorl	%esi, %esi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r15)
	jne	.L173
	imulq	$1000, -64(%rbx), %rsi
	leaq	-56(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L174
	movq	-56(%rbx), %rcx
	movl	$1, %edi
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%r13
	movl	$-1800, %eax
	movw	%ax, 2147450880(%r15)
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC33(%rip), %rsi
	call	__printf_chk@PLT
	cmpq	%rbp, 8(%rsp)
	jne	.L175
	pxor	%xmm0, %xmm0
	movups	%xmm0, 2147450880(%r12)
	movups	%xmm0, 2147450896(%r12)
	movups	%xmm0, 2147450912(%r12)
.L126:
	movq	424(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L176
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
.L152:
	.cfi_restore_state
	movl	$384, %edi
	call	__asan_stack_malloc_3@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbp
	jmp	.L124
.L175:
	movdqa	.LC34(%rip), %xmm0
	movq	$1172321806, 0(%rbp)
	movups	%xmm0, 2147450880(%r12)
	movups	%xmm0, 2147450896(%r12)
	movups	%xmm0, 2147450912(%r12)
	movq	504(%rbp), %rax
	movb	$0, (%rax)
	jmp	.L126
.L174:
	call	__asan_report_load8@PLT
.L173:
	movq	%r14, %rdi
	call	__asan_report_load8@PLT
.L172:
	call	__asan_report_load8@PLT
.L171:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L170:
	call	__asan_report_load8@PLT
.L169:
	movq	%r14, %rdi
	call	__asan_report_load8@PLT
.L168:
	call	__asan_report_load8@PLT
.L167:
	movq	%r14, %rdi
	call	__asan_report_load8@PLT
.L166:
	call	__asan_report_load8@PLT
.L165:
	movq	%r14, %rdi
	call	__asan_report_load8@PLT
.L164:
	call	__asan_report_load8@PLT
.L163:
	movq	%r14, %rdi
	call	__asan_report_load8@PLT
.L162:
	call	__asan_report_load8@PLT
.L161:
	movq	%r13, %rdi
	call	__asan_report_load8@PLT
.L160:
	call	__asan_report_load8@PLT
.L159:
	movq	%r14, %rdi
	call	__asan_report_load8@PLT
.L158:
	call	__asan_report_load8@PLT
.L157:
	movq	%r14, %rdi
	call	__asan_report_load8@PLT
.L156:
	call	__asan_report_load8@PLT
.L155:
	movq	%r14, %rdi
	call	__asan_report_load8@PLT
.L154:
	call	__asan_report_load8@PLT
.L153:
	movq	%r13, %rdi
	call	__asan_report_load8@PLT
.L176:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE80:
	.size	DHS_VHF_task, .-DHS_VHF_task
	.globl	__asan_stack_malloc_0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC35:
	.string	"1 32 16 4 time"
	.section	.rodata
	.align 32
.LC36:
	.string	"SEQ send the VHF event at:%ld\n"
	.zero	33
	.text
	.p2align 4
	.globl	timer_simulator
	.type	timer_simulator, @function
timer_simulator:
.LASANPC81:
.LFB81:
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
	movl	__asan_option_detect_stack_use_after_return(%rip), %ecx
	leaq	16(%rsp), %r15
	testl	%ecx, %ecx
	jne	.L186
.L177:
	movq	$1102416563, (%r15)
	leaq	.LC35(%rip), %rax
	leaq	96(%r15), %rbx
	movabsq	$2361183241434822607, %r13
	movq	%rax, 8(%r15)
	leaq	.LASANPC81(%rip), %rax
	leaq	32(%r15), %rbp
	movq	%rax, 16(%r15)
	movq	%r15, %rax
	leaq	.LC36(%rip), %r12
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-202178560, 2147450884(%rax)
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	leaq	40(%r15), %rax
	movq	%rax, %r14
	movq	%rax, 8(%rsp)
	shrq	$3, %r14
	jmp	.L183
	.p2align 4,,10
	.p2align 3
.L181:
	imulq	$1000, -64(%rbx), %rdi
	cmpb	$0, 2147450880(%r14)
	jne	.L187
	movq	-56(%rbx), %rsi
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%r13
	movl	$-1800, %eax
	movw	%ax, 2147450880(%r15)
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	movq	%r12, %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$100, %edi
	call	roxy_event_send@PLT
	xorl	%esi, %esi
	movl	$125000000, %edi
	call	roxy_task_wait@PLT
.L183:
	movq	%rbp, %r15
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%eax, %eax
	shrq	$3, %r15
	movq	%rbp, %rdi
	movw	%dx, 2147450880(%r15)
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r15)
	je	.L181
	movq	%rbp, %rdi
	call	__asan_report_load8@PLT
.L187:
	movq	8(%rsp), %rdi
	call	__asan_report_load8@PLT
.L186:
	movl	$64, %edi
	call	__asan_stack_malloc_0@PLT
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L177
	.cfi_endproc
.LFE81:
	.size	timer_simulator, .-timer_simulator
	.section	.rodata.str1.1
.LC37:
	.string	"1 32 16 7 time:27"
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
	jne	.L196
.L188:
	leaq	.LC37(%rip), %rax
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
	jne	.L197
	imulq	$1000, -64(%r14), %rsi
	leaq	40(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L198
	movabsq	$2361183241434822607, %rdx
	movq	-56(%r14), %rcx
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%rdx
	sarq	$7, %rdx
	subq	%rcx, %rdx
	leaq	(%rdx,%rsi), %rax
	cmpq	%rbx, %rbp
	jne	.L199
	movq	$0, 2147450880(%r12)
.L190:
	movq	88(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L200
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
.L196:
	.cfi_restore_state
	movl	$64, %edi
	call	__asan_stack_malloc_0@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L188
.L199:
	movabsq	$-723401728380766731, %rsi
	movq	$1172321806, (%rbx)
	movq	%rsi, 2147450880(%r12)
	movq	56(%rbx), %rdx
	movb	$0, (%rdx)
	jmp	.L190
.L198:
	call	__asan_report_load8@PLT
.L197:
	movq	%r13, %rdi
	call	__asan_report_load8@PLT
.L200:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE67:
	.size	get_timestamp, .-get_timestamp
	.section	.rodata
	.align 32
.LC38:
	.string	"Vital error: custom gate lock malfunction"
	.zero	54
	.align 32
.LC39:
	.string	"Gate lock send the END_APP_SW event at:%ld\n"
	.zero	52
	.align 32
.LC40:
	.string	"current work_done=%d\n"
	.zero	42
	.text
	.p2align 4
	.globl	unlock_gate_lock
	.type	unlock_gate_lock, @function
unlock_gate_lock:
.LASANPC68:
.LFB68:
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
	movl	__asan_option_detect_stack_use_after_return(%rip), %edx
	movq	%rsp, %rbx
	movq	%rbx, %r12
	testl	%edx, %edx
	jne	.L212
.L201:
	leaq	.LC35(%rip), %rax
	movq	%rbx, %rbp
	leaq	96(%rbx), %r13
	xorl	%edi, %edi
	movq	%rax, 8(%rbx)
	shrq	$3, %rbp
	leaq	.LASANPC68(%rip), %rax
	movq	$1102416563, (%rbx)
	movq	%rax, 16(%rbx)
	movl	$-235802127, 2147450880(%rbp)
	movl	$-202178560, 2147450884(%rbp)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	call	roxy_critical_section_enter@PLT
	movl	work_done(%rip), %edx
	cmpl	$3, %edx
	ja	.L213
	addl	$1, %edx
	movl	%edx, work_done(%rip)
	cmpl	$3, %edx
	je	.L214
	leaq	.LC40(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L209:
	xorl	%edi, %edi
	call	roxy_critical_section_leave@PLT
	cmpq	%rbx, %r12
	jne	.L215
	movq	$0, 2147450880(%rbp)
.L203:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L216
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
.L214:
	.cfi_restore_state
	leaq	32(%rbx), %r14
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r14, %rdi
	call	gettimeofday@PLT
	movq	%r14, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L217
	imulq	$1000, -64(%r13), %r8
	leaq	40(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L218
	movq	-56(%r13), %rcx
	movl	$1, %edi
	movabsq	$2361183241434822607, %rdx
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%rdx
	movl	$-1800, %eax
	movw	%ax, 2147450880(%rsi)
	leaq	.LC39(%rip), %rsi
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%r8, %rdx
	call	__printf_chk@PLT
	movl	$104, %edi
	call	roxy_event_send@PLT
	jmp	.L209
	.p2align 4,,10
	.p2align 3
.L213:
	movl	$1, %edi
	leaq	.LC38(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
.L212:
	movl	$64, %edi
	call	__asan_stack_malloc_0@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L201
.L215:
	movabsq	$-723401728380766731, %rax
	movq	$1172321806, (%rbx)
	movq	%rax, 2147450880(%rbp)
	movq	56(%rbx), %rax
	movb	$0, (%rax)
	jmp	.L203
.L216:
	call	__stack_chk_fail@PLT
.L217:
	movq	%r14, %rdi
	call	__asan_report_load8@PLT
.L218:
	call	__asan_report_load8@PLT
	.cfi_endproc
.LFE68:
	.size	unlock_gate_lock, .-unlock_gate_lock
	.section	.rodata
	.align 32
.LC41:
	.string	"AOCS received the VHF event at:%ld\n"
	.zero	60
	.align 32
.LC42:
	.string	"AOCS executing phase 1 at:%ld\n"
	.zero	33
	.align 32
.LC43:
	.string	"AOCS received the AOCS_ACQ event at:%ld\n"
	.zero	55
	.align 32
.LC44:
	.string	"AOCS executing phase 2 at:%ld\n"
	.zero	33
	.align 32
.LC45:
	.string	"AOCS exit at:%ld\n"
	.zero	46
	.text
	.p2align 4
	.globl	AOCS_VHF_task
	.type	AOCS_VHF_task, @function
AOCS_VHF_task:
.LASANPC77:
.LFB77:
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
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %r15
	testl	%eax, %eax
	jne	.L236
.L219:
	leaq	.LC16(%rip), %rax
	movq	$1102416563, (%r15)
	leaq	32(%r15), %r12
	movabsq	$2361183241434822607, %rbp
	movq	%rax, 8(%r15)
	leaq	.LASANPC77(%rip), %rax
	leaq	224(%r15), %rbx
	movq	%rax, 16(%r15)
	movq	%r15, %rax
	leaq	.LC41(%rip), %r13
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-219021312, 2147450884(%rax)
	movl	$-219021312, 2147450888(%rax)
	movl	$-219021312, 2147450892(%rax)
	movl	$-219021312, 2147450896(%rax)
	movl	$-202178560, 2147450900(%rax)
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	40(%r15), %rax
	movq	%rax, 8(%rsp)
	shrq	$3, %rax
	movq	%rax, (%rsp)
	jmp	.L233
	.p2align 4,,10
	.p2align 3
.L223:
	imulq	$1000, -192(%rbx), %rdi
	movq	(%rsp), %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L237
	movq	-184(%rbx), %rsi
	movl	$-1800, %r11d
	leaq	-160(%rbx), %r15
	movw	%r11w, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	movq	%r13, %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	xorl	%esi, %esi
	movq	%r15, %rdi
	movw	%ax, 2147450880(%r14)
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L238
	leaq	-152(%rbx), %r8
	imulq	$1000, -160(%rbx), %rdi
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L239
	movq	-152(%rbx), %rsi
	movl	$-1800, %r9d
	leaq	-128(%rbx), %r15
	movw	%r9w, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC42(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$101, %edi
	call	roxy_event_receive@PLT
	xorl	%r10d, %r10d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r10w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L240
	imulq	$1000, -128(%rbx), %rdi
	leaq	-120(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L241
	movq	-120(%rbx), %rsi
	leaq	-96(%rbx), %r15
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC43(%rip), %rsi
	addq	%rdi, %rdx
	movl	$-1800, %edi
	movw	%di, 2147450880(%r14)
	movl	$1, %edi
	movq	%r15, %r14
	shrq	$3, %r14
	call	__printf_chk@PLT
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r8w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L242
	imulq	$1000, -96(%rbx), %rdi
	leaq	-88(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L243
	movq	-88(%rbx), %rsi
	movl	$-1800, %ecx
	leaq	-64(%rbx), %r15
	movw	%cx, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC44(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	call	unlock_gate_lock
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	movw	%si, 2147450880(%r14)
	xorl	%esi, %esi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L244
	imulq	$1000, -64(%rbx), %rsi
	leaq	-56(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L245
	movq	-56(%rbx), %rcx
	movq	%r15, %rdi
	shrq	$3, %rdi
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%rbp
	movl	$-1800, %eax
	movw	%ax, 2147450880(%rdi)
	movl	$1, %edi
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC45(%rip), %rsi
	call	__printf_chk@PLT
.L233:
	movl	$100, %edi
	movq	%r12, %r14
	call	roxy_event_receive@PLT
	shrq	$3, %r14
	xorl	%eax, %eax
	xorl	%esi, %esi
	movw	%ax, 2147450880(%r14)
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	je	.L223
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.L237:
	movq	8(%rsp), %rdi
	call	__asan_report_load8@PLT
.L238:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L239:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L240:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L241:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L242:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L243:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L244:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L245:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L236:
	movl	$192, %edi
	call	__asan_stack_malloc_2@PLT
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L219
	.cfi_endproc
.LFE77:
	.size	AOCS_VHF_task, .-AOCS_VHF_task
	.section	.rodata
	.align 32
.LC46:
	.string	"PF received the VHF event at:%ld\n"
	.zero	62
	.align 32
.LC47:
	.string	"PF executing phase 1 at:%ld\n"
	.zero	35
	.align 32
.LC48:
	.string	"PF received the PF_ACQ event at:%ld\n"
	.zero	59
	.align 32
.LC49:
	.string	"PF executing phase 2 at:%ld\n"
	.zero	35
	.align 32
.LC50:
	.string	"PF exit at:%ld\n"
	.zero	48
	.text
	.p2align 4
	.globl	PF_VHF_task
	.type	PF_VHF_task, @function
PF_VHF_task:
.LASANPC78:
.LFB78:
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
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %r15
	testl	%eax, %eax
	jne	.L263
.L246:
	leaq	.LC16(%rip), %rax
	movq	$1102416563, (%r15)
	leaq	32(%r15), %r12
	movabsq	$2361183241434822607, %rbp
	movq	%rax, 8(%r15)
	leaq	.LASANPC78(%rip), %rax
	leaq	224(%r15), %rbx
	movq	%rax, 16(%r15)
	movq	%r15, %rax
	leaq	.LC46(%rip), %r13
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-219021312, 2147450884(%rax)
	movl	$-219021312, 2147450888(%rax)
	movl	$-219021312, 2147450892(%rax)
	movl	$-219021312, 2147450896(%rax)
	movl	$-202178560, 2147450900(%rax)
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	40(%r15), %rax
	movq	%rax, 8(%rsp)
	shrq	$3, %rax
	movq	%rax, (%rsp)
	jmp	.L260
	.p2align 4,,10
	.p2align 3
.L250:
	imulq	$1000, -192(%rbx), %rdi
	movq	(%rsp), %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L264
	movq	-184(%rbx), %rsi
	movl	$-1800, %r11d
	leaq	-160(%rbx), %r15
	movw	%r11w, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	movq	%r13, %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	xorl	%esi, %esi
	movq	%r15, %rdi
	movw	%ax, 2147450880(%r14)
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L265
	leaq	-152(%rbx), %r8
	imulq	$1000, -160(%rbx), %rdi
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L266
	movq	-152(%rbx), %rsi
	movl	$-1800, %r9d
	leaq	-128(%rbx), %r15
	movw	%r9w, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC47(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$102, %edi
	call	roxy_event_receive@PLT
	xorl	%r10d, %r10d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r10w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L267
	imulq	$1000, -128(%rbx), %rdi
	leaq	-120(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L268
	movq	-120(%rbx), %rsi
	leaq	-96(%rbx), %r15
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC48(%rip), %rsi
	addq	%rdi, %rdx
	movl	$-1800, %edi
	movw	%di, 2147450880(%r14)
	movl	$1, %edi
	movq	%r15, %r14
	shrq	$3, %r14
	call	__printf_chk@PLT
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r8w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L269
	imulq	$1000, -96(%rbx), %rdi
	leaq	-88(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L270
	movq	-88(%rbx), %rsi
	movl	$-1800, %ecx
	leaq	-64(%rbx), %r15
	movw	%cx, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC49(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	call	unlock_gate_lock
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	movw	%si, 2147450880(%r14)
	xorl	%esi, %esi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L271
	imulq	$1000, -64(%rbx), %rsi
	leaq	-56(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L272
	movq	-56(%rbx), %rcx
	movq	%r15, %rdi
	shrq	$3, %rdi
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%rbp
	movl	$-1800, %eax
	movw	%ax, 2147450880(%rdi)
	movl	$1, %edi
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC50(%rip), %rsi
	call	__printf_chk@PLT
.L260:
	movl	$100, %edi
	movq	%r12, %r14
	call	roxy_event_receive@PLT
	shrq	$3, %r14
	xorl	%eax, %eax
	xorl	%esi, %esi
	movw	%ax, 2147450880(%r14)
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	je	.L250
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.L264:
	movq	8(%rsp), %rdi
	call	__asan_report_load8@PLT
.L265:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L266:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L267:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L268:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L269:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L270:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L271:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L272:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L263:
	movl	$192, %edi
	call	__asan_stack_malloc_2@PLT
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L246
	.cfi_endproc
.LFE78:
	.size	PF_VHF_task, .-PF_VHF_task
	.section	.rodata
	.align 32
.LC51:
	.string	"PL received the VHF event at:%ld\n"
	.zero	62
	.align 32
.LC52:
	.string	"PL executing phase 1 at:%ld\n"
	.zero	35
	.align 32
.LC53:
	.string	"PL received the PL_ACQ event at:%ld\n"
	.zero	59
	.align 32
.LC54:
	.string	"PL executing phase 2 at:%ld\n"
	.zero	35
	.align 32
.LC55:
	.string	"PL exit at:%ld\n"
	.zero	48
	.text
	.p2align 4
	.globl	PL_VHF_task
	.type	PL_VHF_task, @function
PL_VHF_task:
.LASANPC79:
.LFB79:
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
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	leaq	16(%rsp), %r15
	testl	%eax, %eax
	jne	.L290
.L273:
	leaq	.LC16(%rip), %rax
	movq	$1102416563, (%r15)
	leaq	32(%r15), %r12
	movabsq	$2361183241434822607, %rbp
	movq	%rax, 8(%r15)
	leaq	.LASANPC79(%rip), %rax
	leaq	224(%r15), %rbx
	movq	%rax, 16(%r15)
	movq	%r15, %rax
	leaq	.LC51(%rip), %r13
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-219021312, 2147450884(%rax)
	movl	$-219021312, 2147450888(%rax)
	movl	$-219021312, 2147450892(%rax)
	movl	$-219021312, 2147450896(%rax)
	movl	$-202178560, 2147450900(%rax)
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	leaq	40(%r15), %rax
	movq	%rax, 8(%rsp)
	shrq	$3, %rax
	movq	%rax, (%rsp)
	jmp	.L287
	.p2align 4,,10
	.p2align 3
.L277:
	imulq	$1000, -192(%rbx), %rdi
	movq	(%rsp), %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L291
	movq	-184(%rbx), %rsi
	movl	$-1800, %r11d
	leaq	-160(%rbx), %r15
	movw	%r11w, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	movq	%r13, %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	xorl	%esi, %esi
	movq	%r15, %rdi
	movw	%ax, 2147450880(%r14)
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L292
	leaq	-152(%rbx), %r8
	imulq	$1000, -160(%rbx), %rdi
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L293
	movq	-152(%rbx), %rsi
	movl	$-1800, %r9d
	leaq	-128(%rbx), %r15
	movw	%r9w, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC52(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$103, %edi
	call	roxy_event_receive@PLT
	xorl	%r10d, %r10d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r10w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L294
	imulq	$1000, -128(%rbx), %rdi
	leaq	-120(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L295
	movq	-120(%rbx), %rsi
	leaq	-96(%rbx), %r15
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC53(%rip), %rsi
	addq	%rdi, %rdx
	movl	$-1800, %edi
	movw	%di, 2147450880(%r14)
	movl	$1, %edi
	movq	%r15, %r14
	shrq	$3, %r14
	call	__printf_chk@PLT
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	movw	%r8w, 2147450880(%r14)
	movq	%r15, %rdi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L296
	imulq	$1000, -96(%rbx), %rdi
	leaq	-88(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L297
	movq	-88(%rbx), %rsi
	movl	$-1800, %ecx
	leaq	-64(%rbx), %r15
	movw	%cx, 2147450880(%r14)
	movq	%r15, %r14
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%rbp
	xorl	%eax, %eax
	shrq	$3, %r14
	sarq	$7, %rdx
	subq	%rsi, %rdx
	leaq	.LC54(%rip), %rsi
	addq	%rdi, %rdx
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	call	unlock_gate_lock
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	movw	%si, 2147450880(%r14)
	xorl	%esi, %esi
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	jne	.L298
	imulq	$1000, -64(%rbx), %rsi
	leaq	-56(%rbx), %r8
	movq	%r8, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L299
	movq	-56(%rbx), %rcx
	movq	%r15, %rdi
	shrq	$3, %rdi
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%rbp
	movl	$-1800, %eax
	movw	%ax, 2147450880(%rdi)
	movl	$1, %edi
	xorl	%eax, %eax
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%rsi, %rdx
	leaq	.LC55(%rip), %rsi
	call	__printf_chk@PLT
.L287:
	movl	$100, %edi
	movq	%r12, %r14
	call	roxy_event_receive@PLT
	shrq	$3, %r14
	xorl	%eax, %eax
	xorl	%esi, %esi
	movw	%ax, 2147450880(%r14)
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	gettimeofday@PLT
	cmpb	$0, 2147450880(%r14)
	je	.L277
	movq	%r12, %rdi
	call	__asan_report_load8@PLT
.L291:
	movq	8(%rsp), %rdi
	call	__asan_report_load8@PLT
.L292:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L293:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L294:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L295:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L296:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L297:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L298:
	movq	%r15, %rdi
	call	__asan_report_load8@PLT
.L299:
	movq	%r8, %rdi
	call	__asan_report_load8@PLT
.L290:
	movl	$192, %edi
	call	__asan_stack_malloc_2@PLT
	testq	%rax, %rax
	cmovne	%rax, %r15
	jmp	.L273
	.cfi_endproc
.LFE79:
	.size	PL_VHF_task, .-PL_VHF_task
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
	movl	__asan_option_detect_stack_use_after_return(%rip), %edx
	movq	%rsp, %rbx
	movq	%rbx, %r12
	testl	%edx, %edx
	jne	.L310
.L302:
	leaq	.LC35(%rip), %rax
	movq	%rbx, %rbp
	leaq	32(%rbx), %r13
	xorl	%esi, %esi
	movq	%rax, 8(%rbx)
	shrq	$3, %rbp
	movq	%r13, %rdi
	leaq	96(%rbx), %r14
	leaq	.LASANPC70(%rip), %rax
	movq	$1102416563, (%rbx)
	movq	%rax, 16(%rbx)
	movl	$-235802127, 2147450880(%rbp)
	movl	$-202178560, 2147450884(%rbp)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	call	gettimeofday@PLT
	movq	%r13, %rsi
	shrq	$3, %rsi
	cmpb	$0, 2147450880(%rsi)
	jne	.L311
	imulq	$1000, -64(%r14), %r8
	leaq	40(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L312
	movq	-56(%r14), %rcx
	movl	$1, %edi
	movabsq	$2361183241434822607, %rdx
	movq	%rcx, %rax
	sarq	$63, %rcx
	imulq	%rdx
	movl	$-1800, %eax
	movw	%ax, 2147450880(%rsi)
	xorl	%eax, %eax
	leaq	.LC36(%rip), %rsi
	sarq	$7, %rdx
	subq	%rcx, %rdx
	addq	%r8, %rdx
	call	__printf_chk@PLT
	movl	$100, %edi
	call	roxy_event_send@PLT
	cmpq	%rbx, %r12
	jne	.L313
	movq	$0, 2147450880(%rbp)
.L304:
	movq	88(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L314
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
.L310:
	.cfi_restore_state
	movl	$64, %edi
	call	__asan_stack_malloc_0@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L302
.L313:
	movabsq	$-723401728380766731, %rax
	movq	$1172321806, (%rbx)
	movq	%rax, 2147450880(%rbp)
	movq	56(%rbx), %rax
	movb	$0, (%rax)
	jmp	.L304
.L312:
	call	__asan_report_load8@PLT
.L311:
	movq	%r13, %rdi
	call	__asan_report_load8@PLT
.L314:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE70:
	.size	SEQ_interrupt_handler, .-SEQ_interrupt_handler
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
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE82:
	.size	main, .-main
	.globl	work_done
	.bss
	.align 32
	.type	work_done, @object
	.size	work_done, 4
work_done:
	.zero	64
	.globl	__odr_asan.work_done
	.type	__odr_asan.work_done, @object
	.size	__odr_asan.work_done, 1
__odr_asan.work_done:
	.zero	1
	.section	.rodata.str1.1
.LC56:
	.string	"src/main.c"
	.section	.data.rel.local,"aw"
	.align 16
	.type	.LASANLOC1, @object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.quad	.LC56
	.long	23
	.long	5
	.section	.rodata.str1.1
.LC57:
	.string	"work_done"
.LC58:
	.string	"*.LC20"
.LC59:
	.string	"*.LC46"
.LC60:
	.string	"*.LC51"
.LC61:
	.string	"*.LC39"
.LC62:
	.string	"*.LC9"
.LC63:
	.string	"*.LC2"
.LC64:
	.string	"*.LC18"
.LC65:
	.string	"*.LC48"
.LC66:
	.string	"*.LC44"
.LC67:
	.string	"*.LC3"
.LC68:
	.string	"*.LC10"
.LC69:
	.string	"*.LC26"
.LC70:
	.string	"*.LC55"
.LC71:
	.string	"*.LC28"
.LC72:
	.string	"*.LC4"
.LC73:
	.string	"*.LC42"
.LC74:
	.string	"*.LC15"
.LC75:
	.string	"*.LC36"
.LC76:
	.string	"*.LC40"
.LC77:
	.string	"*.LC38"
.LC78:
	.string	"*.LC14"
.LC79:
	.string	"*.LC30"
.LC80:
	.string	"*.LC17"
.LC81:
	.string	"*.LC6"
.LC82:
	.string	"*.LC49"
.LC83:
	.string	"*.LC45"
.LC84:
	.string	"*.LC31"
.LC85:
	.string	"*.LC25"
.LC86:
	.string	"*.LC47"
.LC87:
	.string	"*.LC5"
.LC88:
	.string	"*.LC8"
.LC89:
	.string	"*.LC23"
.LC90:
	.string	"*.LC7"
.LC91:
	.string	"*.LC1"
.LC92:
	.string	"*.LC32"
.LC93:
	.string	"*.LC43"
.LC94:
	.string	"*.LC21"
.LC95:
	.string	"*.LC53"
.LC96:
	.string	"*.LC11"
.LC97:
	.string	"*.LC27"
.LC98:
	.string	"*.LC13"
.LC99:
	.string	"*.LC52"
.LC100:
	.string	"*.LC54"
.LC101:
	.string	"*.LC12"
.LC102:
	.string	"*.LC29"
.LC103:
	.string	"*.LC24"
.LC104:
	.string	"*.LC50"
.LC105:
	.string	"*.LC33"
.LC106:
	.string	"*.LC41"
.LC107:
	.string	"*.LC19"
	.section	.data.rel.local
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 3264
.LASAN0:
	.quad	work_done
	.quad	4
	.quad	64
	.quad	.LC57
	.quad	.LC56
	.quad	0
	.quad	.LASANLOC1
	.quad	__odr_asan.work_done
	.quad	.LC20
	.quad	30
	.quad	64
	.quad	.LC58
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC46
	.quad	34
	.quad	96
	.quad	.LC59
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC51
	.quad	34
	.quad	96
	.quad	.LC60
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC39
	.quad	44
	.quad	96
	.quad	.LC61
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC9
	.quad	16
	.quad	64
	.quad	.LC62
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC2
	.quad	31
	.quad	64
	.quad	.LC63
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC18
	.quad	30
	.quad	64
	.quad	.LC64
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC48
	.quad	37
	.quad	96
	.quad	.LC65
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC44
	.quad	31
	.quad	64
	.quad	.LC66
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC3
	.quad	18
	.quad	64
	.quad	.LC67
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC10
	.quad	35
	.quad	96
	.quad	.LC68
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC26
	.quad	36
	.quad	96
	.quad	.LC69
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC55
	.quad	16
	.quad	64
	.quad	.LC70
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC28
	.quad	34
	.quad	96
	.quad	.LC71
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC4
	.quad	34
	.quad	96
	.quad	.LC72
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC42
	.quad	31
	.quad	64
	.quad	.LC73
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC15
	.quad	17
	.quad	64
	.quad	.LC74
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC36
	.quad	31
	.quad	64
	.quad	.LC75
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC40
	.quad	22
	.quad	64
	.quad	.LC76
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC38
	.quad	42
	.quad	96
	.quad	.LC77
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC14
	.quad	30
	.quad	64
	.quad	.LC78
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC30
	.quad	34
	.quad	96
	.quad	.LC79
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC17
	.quad	35
	.quad	96
	.quad	.LC80
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC6
	.quad	16
	.quad	64
	.quad	.LC81
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC49
	.quad	29
	.quad	64
	.quad	.LC82
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC45
	.quad	18
	.quad	64
	.quad	.LC83
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC31
	.quad	42
	.quad	96
	.quad	.LC84
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC25
	.quad	30
	.quad	64
	.quad	.LC85
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC47
	.quad	29
	.quad	64
	.quad	.LC86
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC5
	.quad	29
	.quad	64
	.quad	.LC87
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC8
	.quad	29
	.quad	64
	.quad	.LC88
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC23
	.quad	35
	.quad	96
	.quad	.LC89
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC7
	.quad	34
	.quad	96
	.quad	.LC90
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC1
	.quad	36
	.quad	96
	.quad	.LC91
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC32
	.quad	30
	.quad	64
	.quad	.LC92
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC43
	.quad	41
	.quad	96
	.quad	.LC93
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC21
	.quad	17
	.quad	64
	.quad	.LC94
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC53
	.quad	37
	.quad	96
	.quad	.LC95
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC11
	.quad	30
	.quad	64
	.quad	.LC96
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC27
	.quad	30
	.quad	64
	.quad	.LC97
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC13
	.quad	35
	.quad	96
	.quad	.LC98
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC52
	.quad	29
	.quad	64
	.quad	.LC99
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC54
	.quad	29
	.quad	64
	.quad	.LC100
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC12
	.quad	17
	.quad	64
	.quad	.LC101
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC29
	.quad	30
	.quad	64
	.quad	.LC102
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC24
	.quad	30
	.quad	64
	.quad	.LC103
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC50
	.quad	16
	.quad	64
	.quad	.LC104
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC33
	.quad	17
	.quad	64
	.quad	.LC105
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC41
	.quad	36
	.quad	96
	.quad	.LC106
	.quad	.LC56
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC19
	.quad	42
	.quad	96
	.quad	.LC107
	.quad	.LC56
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
	movl	$51, %esi
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
	movl	$51, %esi
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC34:
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
