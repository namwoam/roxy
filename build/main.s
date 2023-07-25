	.file	"main.c"
	.text
	.globl	__asan_stack_malloc_0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"1 32 8 10 rawtime:16"
	.section	.rodata
	.align 32
.LC2:
	.string	"roxy idle on cpu:%d %s"
	.zero	41
	.text
	.p2align 4
	.globl	idle_task
	.type	idle_task, @function
idle_task:
.LASANPC67:
.LFB67:
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
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	testl	%eax, %eax
	jne	.L9
.L1:
	leaq	.LC1(%rip), %rax
	movq	$1102416563, (%rbx)
	leaq	.LC2(%rip), %rbp
	movq	%rax, 8(%rbx)
	leaq	.LASANPC67(%rip), %rax
	movq	%rax, 16(%rbx)
	movq	%rbx, %rax
	addq	$32, %rbx
	shrq	$3, %rax
	movq	%rbx, %r13
	movl	$-235802127, 2147450880(%rax)
	shrq	$3, %r13
	movl	$-202116352, 2147450884(%rax)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movb	$0, 2147450880(%r13)
	movq	%rbx, %rdi
	call	time@PLT
	movq	%rbx, %rdi
	call	localtime@PLT
	movq	%rax, %rdi
	call	asctime@PLT
	movq	%rax, %r12
	xorl	%eax, %eax
	call	sched_getcpu@PLT
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$1, %esi
	movl	$10, %edi
	call	roxy_task_wait@PLT
	movb	$-8, 2147450880(%r13)
	jmp	.L5
.L9:
	movl	$64, %edi
	call	__asan_stack_malloc_0@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L1
	.cfi_endproc
.LFE67:
	.size	idle_task, .-idle_task
	.globl	__asan_stack_malloc_5
	.section	.rodata.str1.1
.LC3:
	.string	"1 32 1280 15 random_names:57"
	.globl	__asan_stack_free_5
	.section	.rodata
	.align 32
.LC4:
	.string	"Sender: sending name->%s \n"
	.zero	37
	.align 32
.LC0:
	.string	"anakin"
	.zero	249
	.string	"yoda"
	.zero	251
	.string	"ahsoka"
	.zero	249
	.string	"jabba"
	.zero	250
	.string	"luke"
	.zero	251
	.text
	.p2align 4
	.globl	send_task
	.type	send_task, @function
send_task:
.LASANPC70:
.LFB70:
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
	subq	$1472, %rsp
	.cfi_def_cfa_offset 1504
	movl	__asan_option_detect_stack_use_after_return(%rip), %eax
	movq	%rsp, %rbx
	testl	%eax, %eax
	jne	.L20
.L10:
	leaq	.LC3(%rip), %rax
	movq	$1102416563, (%rbx)
	leaq	32(%rbx), %r8
	movq	%rax, 8(%rbx)
	leaq	.LASANPC70(%rip), %rax
	movq	%rax, 16(%rbx)
	movq	%rbx, %rax
	shrq	$3, %rax
	movl	$-235802127, 2147450880(%rax)
	movl	$-202116109, 2147451044(%rax)
	movl	$-202116109, 2147451048(%rax)
	movl	$-202116109, 2147451052(%rax)
	movl	$-202116109, 2147451056(%rax)
	movq	%fs:40, %rax
	movq	%rax, 1464(%rsp)
	xorl	%eax, %eax
	movq	%r8, %rax
	shrq	$3, %rax
	movzbl	2147450880(%rax), %edx
	leaq	1311(%rbx), %rax
	movq	%rax, %rcx
	andl	$7, %eax
	shrq	$3, %rcx
	movzbl	2147450880(%rcx), %ecx
	cmpb	%al, %cl
	setle	%sil
	testb	%cl, %cl
	setne	%al
	testb	%al, %sil
	jne	.L18
	testb	%dl, %dl
	setne	%cl
	setle	%al
	testb	%al, %cl
	jne	.L18
	leaq	.LC0(%rip), %rsi
	movl	$160, %ecx
	leaq	32(%rbx), %r12
	movq	%r8, %rdi
	rep movsq
	leaq	.LC4(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L16:
	call	rand@PLT
	movq	%rbx, %rsi
	movl	$1, %edi
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$1717986919, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$33, %rdx
	subl	%ecx, %edx
	leal	(%rdx,%rdx,4), %edx
	subl	%edx, %eax
	movslq	%eax, %rbp
	xorl	%eax, %eax
	salq	$8, %rbp
	addq	%r12, %rbp
	movq	%rbp, %rdx
	call	__printf_chk@PLT
	movq	%rbp, %rsi
	movl	$256, %edx
	movl	$100, %edi
	call	roxy_mqueue_send@PLT
	movl	$1, %esi
	movl	$1, %edi
	call	roxy_task_wait@PLT
	jmp	.L16
.L20:
	movl	$1440, %edi
	call	__asan_stack_malloc_5@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L10
.L18:
	movl	$1280, %esi
	movq	%r8, %rdi
	call	__asan_report_store_n@PLT
	.cfi_endproc
.LFE70:
	.size	send_task, .-send_task
	.globl	__asan_stack_malloc_3
	.section	.rodata.str1.1
.LC5:
	.string	"1 32 256 17 receive_buffer:68"
	.section	.rodata
	.align 32
.LC6:
	.string	"Receiver: received->%s \n"
	.zero	39
	.text
	.p2align 4
	.globl	receive_task
	.type	receive_task, @function
receive_task:
.LASANPC71:
.LFB71:
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
	jne	.L31
.L21:
	leaq	.LC5(%rip), %rax
	movq	$1102416563, (%rbx)
	leaq	.LC6(%rip), %rbp
	movq	%rax, 8(%rbx)
	leaq	.LASANPC71(%rip), %rax
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
.L25:
	movl	$1, %ecx
	movl	$256, %edx
	movq	%rbx, %rsi
	movl	$100, %edi
	call	roxy_mqueue_receive@PLT
	cmpl	$2, %eax
	je	.L25
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L25
.L31:
	movl	$352, %edi
	call	__asan_stack_malloc_3@PLT
	testq	%rax, %rax
	cmovne	%rax, %rbx
	jmp	.L21
	.cfi_endproc
.LFE71:
	.size	receive_task, .-receive_task
	.section	.rodata
	.align 32
.LC7:
	.string	"Clock: Clock ticking"
	.zero	43
	.text
	.p2align 4
	.globl	clock_task
	.type	clock_task, @function
clock_task:
.LASANPC72:
.LFB72:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC7(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L33:
	movq	%rbx, %rdi
	call	puts@PLT
	xorl	%edi, %edi
	call	roxy_event_send@PLT
	movl	$1, %esi
	movl	$4, %edi
	call	roxy_task_wait@PLT
	jmp	.L33
	.cfi_endproc
.LFE72:
	.size	clock_task, .-clock_task
	.section	.rodata
	.align 32
.LC8:
	.string	"Display: Clock ticked!"
	.zero	41
	.text
	.p2align 4
	.globl	display_clock
	.type	display_clock, @function
display_clock:
.LASANPC73:
.LFB73:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC8(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L36:
	xorl	%edi, %edi
	call	roxy_event_receive@PLT
	movq	%rbx, %rdi
	call	puts@PLT
	jmp	.L36
	.cfi_endproc
.LFE73:
	.size	display_clock, .-display_clock
	.section	.rodata
	.align 32
.LC9:
	.string	"Peace out!"
	.zero	53
	.text
	.p2align 4
	.globl	exit_handler
	.type	exit_handler, @function
exit_handler:
.LASANPC74:
.LFB74:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	.LC9(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	puts@PLT
	leaq	stdout(%rip), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	cmpb	$0, 2147450880(%rax)
	jne	.L41
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	call	__asan_handle_no_return@PLT
	xorl	%edi, %edi
	call	exit@PLT
.L41:
	call	__asan_report_load8@PLT
	.cfi_endproc
.LFE74:
	.size	exit_handler, .-exit_handler
	.p2align 4
	.globl	fib
	.type	fib, @function
fib:
.LASANPC68:
.LFB68:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edi, %eax
	subl	$1, %edi
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	%edi, 8(%rsp)
	movl	$0, 20(%rsp)
	cmpl	$1, %eax
	jbe	.L85
	cmpl	$1, 8(%rsp)
	jbe	.L86
.L44:
	movl	8(%rsp), %eax
	movl	$0, 24(%rsp)
	subl	$1, %eax
	movl	%eax, 12(%rsp)
	cmpl	$1, 12(%rsp)
	movl	%eax, 36(%rsp)
	je	.L87
.L47:
	movl	12(%rsp), %eax
	movl	$0, 28(%rsp)
	subl	$1, %eax
	movl	%eax, 16(%rsp)
	cmpl	$1, 16(%rsp)
	movl	%eax, 40(%rsp)
	je	.L88
.L50:
	movl	16(%rsp), %eax
	movl	$0, 32(%rsp)
	subl	$1, %eax
	movl	%eax, 48(%rsp)
	movl	%eax, %r11d
.L54:
	cmpl	$1, %r11d
	je	.L89
	leal	-1(%r11), %eax
	xorl	%ecx, %ecx
	movl	%eax, 44(%rsp)
	movl	%eax, %ebp
.L57:
	cmpl	$1, %ebp
	je	.L90
	leal	-1(%rbp), %esi
	xorl	%r12d, %r12d
	movl	%esi, %edx
.L60:
	cmpl	$1, %edx
	je	.L91
	leal	-2(%rdx), %r8d
	xorl	%r15d, %r15d
	movl	%r8d, %r9d
.L63:
	leal	1(%r9), %eax
	movl	%r9d, %ebx
	xorl	%r13d, %r13d
	cmpl	$1, %eax
	jbe	.L92
	movl	%ebx, %r10d
	xorl	%r14d, %r14d
	cmpl	$1, %ebx
	je	.L93
	.p2align 4,,10
	.p2align 3
.L65:
	leal	-1(%r10), %edi
	movl	%r8d, 76(%rsp)
	movl	%esi, 72(%rsp)
	movl	%r9d, 68(%rsp)
	movl	%edx, 64(%rsp)
	movl	%r11d, 60(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%r10d, 52(%rsp)
	call	fib
	movl	52(%rsp), %r10d
	movl	56(%rsp), %ecx
	addl	%eax, %r14d
	movl	60(%rsp), %r11d
	movl	64(%rsp), %edx
	subl	$2, %r10d
	movl	68(%rsp), %r9d
	movl	72(%rsp), %esi
	cmpl	$1, %r10d
	movl	76(%rsp), %r8d
	ja	.L65
	addl	$1, %r14d
	leal	-2(%rbx), %eax
	subl	$1, %ebx
	addl	%r14d, %r13d
	cmpl	$1, %ebx
	jbe	.L94
.L77:
	movl	%eax, %ebx
	xorl	%r14d, %r14d
	movl	%ebx, %r10d
	cmpl	$1, %ebx
	jne	.L65
.L93:
	movl	$1, %r14d
	leal	-2(%rbx), %eax
	subl	$1, %ebx
	addl	%r14d, %r13d
	cmpl	$1, %ebx
	ja	.L77
.L94:
	addl	$1, %r13d
	leal	-2(%r9), %eax
	addl	%r13d, %r15d
	cmpl	$1, %r9d
	ja	.L75
.L97:
	addl	$1, %r15d
	subl	$1, %edx
	addl	%r15d, %r12d
	cmpl	$1, %edx
	ja	.L73
.L96:
	addl	$1, %r12d
.L61:
	addl	%r12d, %ecx
	subl	$2, %ebp
	cmpl	$1, %esi
	ja	.L57
	addl	$1, %ecx
.L58:
	addl	%ecx, 32(%rsp)
	subl	$2, %r11d
	cmpl	$1, 44(%rsp)
	ja	.L54
	movl	32(%rsp), %eax
	addl	$1, %eax
.L55:
	addl	%eax, 28(%rsp)
	movl	16(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 48(%rsp)
	jbe	.L95
	movl	%eax, 16(%rsp)
	cmpl	$1, 16(%rsp)
	jne	.L50
.L88:
	movl	$0, 48(%rsp)
	movl	$1, %eax
	jmp	.L55
.L91:
	movl	$1, %r15d
	subl	$1, %edx
	movl	$-1, %r8d
	addl	%r15d, %r12d
	cmpl	$1, %edx
	jbe	.L96
.L73:
	movl	%r8d, %edx
	jmp	.L60
	.p2align 4,,10
	.p2align 3
.L92:
	movl	$1, %r13d
	leal	-2(%r9), %eax
	addl	%r13d, %r15d
	cmpl	$1, %r9d
	jbe	.L97
.L75:
	movl	%eax, %r9d
	jmp	.L63
.L90:
	movl	$1, %r12d
	xorl	%esi, %esi
	jmp	.L61
.L89:
	movl	$0, 44(%rsp)
	movl	$1, %ecx
	jmp	.L58
.L95:
	movl	28(%rsp), %eax
	addl	$1, %eax
.L52:
	addl	%eax, 24(%rsp)
	movl	12(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 40(%rsp)
	jbe	.L98
	movl	%eax, 12(%rsp)
	cmpl	$1, 12(%rsp)
	jne	.L47
.L87:
	movl	$0, 40(%rsp)
	movl	$1, %eax
	jmp	.L52
.L98:
	movl	24(%rsp), %eax
	addl	$1, %eax
.L49:
	addl	%eax, 20(%rsp)
	movl	8(%rsp), %eax
	subl	$2, %eax
	cmpl	$1, 36(%rsp)
	jbe	.L99
	movl	%eax, 8(%rsp)
	cmpl	$1, 8(%rsp)
	ja	.L44
.L86:
	movl	8(%rsp), %edi
	movl	$1, %eax
	subl	$1, %edi
	movl	%edi, 36(%rsp)
	jmp	.L49
.L99:
	movl	20(%rsp), %eax
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	addl	$1, %eax
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L85:
	.cfi_restore_state
	addq	$88, %rsp
	.cfi_def_cfa_offset 56
	movl	$1, %eax
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
.LFE68:
	.size	fib, .-fib
	.section	.rodata
	.align 32
.LC10:
	.string	"fib(%d)=%d\n"
	.zero	52
	.text
	.p2align 4
	.globl	compute_task
	.type	compute_task, @function
compute_task:
.LASANPC69:
.LFB69:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC10(%rip), %r14
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
.L103:
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L101:
	movl	%r13d, %edx
	leal	1(%r12), %ecx
	movq	%r14, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addl	$1, %r13d
	call	__printf_chk@PLT
	movl	$1, %esi
	movl	$1, %edi
	call	roxy_task_wait@PLT
	cmpl	$30, %r13d
	je	.L103
	cmpl	$1, %r13d
	je	.L109
	movl	%r13d, %ebp
	xorl	%r12d, %r12d
	xorl	%r15d, %r15d
	leal	-1(%rbp), %ebx
	cmpl	$1, %ebx
	je	.L114
	.p2align 4,,10
	.p2align 3
.L104:
	leal	-1(%rbx), %edi
	subl	$2, %ebx
	call	fib
	addl	%eax, %r15d
	cmpl	$1, %ebx
	jg	.L104
	addl	$1, %r15d
.L107:
	subl	$2, %ebp
	addl	%r15d, %r12d
	cmpl	$1, %ebp
	jle	.L101
	leal	-1(%rbp), %ebx
	xorl	%r15d, %r15d
	cmpl	$1, %ebx
	jne	.L104
.L114:
	movl	$1, %r15d
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L109:
	xorl	%r12d, %r12d
	jmp	.L101
	.cfi_endproc
.LFE69:
	.size	compute_task, .-compute_task
	.section	.rodata
	.align 32
.LC11:
	.string	"Failed at init"
	.zero	49
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LASANPC75:
.LFB75:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	roxy_init@PLT
	testl	%eax, %eax
	jne	.L121
	movl	$100, %edi
	call	roxy_mqueue_flush@PLT
	movl	$256, %edx
	movl	$512, %esi
	movl	$100, %edi
	call	roxy_mqueue_create@PLT
	testl	%eax, %eax
	je	.L122
.L117:
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L122:
	.cfi_restore_state
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$10, %esi
	leaq	idle_task(%rip), %rcx
	movl	$100, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	jne	.L117
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$11, %esi
	leaq	compute_task(%rip), %rcx
	movl	$101, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	jne	.L117
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$10, %esi
	leaq	send_task(%rip), %rcx
	movl	$102, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	jne	.L117
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$10, %esi
	leaq	receive_task(%rip), %rcx
	movl	$103, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	jne	.L117
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$10, %esi
	leaq	clock_task(%rip), %rcx
	movl	$104, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	jne	.L117
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$10, %esi
	leaq	display_clock(%rip), %rcx
	movl	$105, %edi
	call	roxy_task_create@PLT
	testl	%eax, %eax
	jne	.L117
	movl	$5, %esi
	movl	$100, %edi
	call	roxy_task_start@PLT
	testl	%eax, %eax
	jne	.L117
	movl	$2, %esi
	movl	$101, %edi
	call	roxy_task_start@PLT
	testl	%eax, %eax
	jne	.L117
	movl	$2, %esi
	movl	$102, %edi
	call	roxy_task_start@PLT
	testl	%eax, %eax
	jne	.L117
	movl	$2, %esi
	movl	$103, %edi
	call	roxy_task_start@PLT
	testl	%eax, %eax
	jne	.L117
	movl	$1, %esi
	movl	$104, %edi
	call	roxy_task_start@PLT
	testl	%eax, %eax
	jne	.L117
	movl	$1, %esi
	movl	$105, %edi
	call	roxy_task_start@PLT
	testl	%eax, %eax
	jne	.L117
	leaq	exit_handler(%rip), %rsi
	movl	$2, %edi
	call	roxy_interrupt_catch@PLT
	testl	%eax, %eax
	jne	.L117
	movl	$100, %edi
	call	roxy_loop@PLT
	testl	%eax, %eax
	jne	.L117
	call	roxy_clean@PLT
	jmp	.L117
.L121:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	jmp	.L117
	.cfi_endproc
.LFE75:
	.size	main, .-main
	.section	.rodata.str1.1
.LC12:
	.string	"*.LC6"
.LC13:
	.string	"src/main.c"
.LC14:
	.string	"*.LC10"
.LC15:
	.string	"*.LC11"
.LC16:
	.string	"*.LC2"
.LC17:
	.string	"*.LC7"
.LC18:
	.string	"*.LC9"
.LC19:
	.string	"*.LC8"
.LC20:
	.string	"*.LC4"
	.section	.data.rel.local,"aw"
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 512
.LASAN0:
	.quad	.LC6
	.quad	25
	.quad	64
	.quad	.LC12
	.quad	.LC13
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC10
	.quad	12
	.quad	64
	.quad	.LC14
	.quad	.LC13
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC11
	.quad	15
	.quad	64
	.quad	.LC15
	.quad	.LC13
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC2
	.quad	23
	.quad	64
	.quad	.LC16
	.quad	.LC13
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC7
	.quad	21
	.quad	64
	.quad	.LC17
	.quad	.LC13
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC9
	.quad	11
	.quad	64
	.quad	.LC18
	.quad	.LC13
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC8
	.quad	23
	.quad	64
	.quad	.LC19
	.quad	.LC13
	.quad	0
	.quad	0
	.quad	0
	.quad	.LC4
	.quad	27
	.quad	64
	.quad	.LC20
	.quad	.LC13
	.quad	0
	.quad	0
	.quad	0
	.section	.text.exit,"ax",@progbits
	.p2align 4
	.type	_sub_D_00099_0, @function
_sub_D_00099_0:
.LFB77:
	.cfi_startproc
	endbr64
	movl	$8, %esi
	leaq	.LASAN0(%rip), %rdi
	jmp	__asan_unregister_globals@PLT
	.cfi_endproc
.LFE77:
	.size	_sub_D_00099_0, .-_sub_D_00099_0
	.section	.fini_array.00099,"aw"
	.align 8
	.quad	_sub_D_00099_0
	.section	.text.startup
	.p2align 4
	.type	_sub_I_00099_1, @function
_sub_I_00099_1:
.LFB78:
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
.LFE78:
	.size	_sub_I_00099_1, .-_sub_I_00099_1
	.section	.init_array.00099,"aw"
	.align 8
	.quad	_sub_I_00099_1
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
