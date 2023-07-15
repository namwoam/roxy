	.arch armv8-a
	.file	"core.c"
	.text
	.align	2
	.p2align 4,,11
	.global	roxy_thread_runner
	.type	roxy_thread_runner, %function
roxy_thread_runner:
.LASANPC27:
.LFB27:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	add	x24, x0, 4
	lsr	x23, x24, 3
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	mov	x25, 68719476736
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	mov	x19, x0
	ldrsb	w0, [x23, x25]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	and	x22, x24, 7
	add	w26, w22, 3
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -16
	.cfi_offset 28, -8
	cmp	w0, 0
	ccmp	w26, w0, 1, ne
	bge	.L29
	ldr	w20, [x19, 4]
	bl	gettid
	adrp	x21, roxy_threads
	add	x4, x21, :lo12:roxy_threads
	ubfiz	x1, x20, 1, 32
	add	x20, x1, x20, uxtw
	add	x20, x4, x20, lsl 3
	add	x2, x20, 12
	and	x1, x2, 7
	lsr	x3, x2, 3
	add	w1, w1, 3
	ldrsb	w3, [x3, x25]
	cmp	w3, 0
	ccmp	w1, w3, 1, ne
	bge	.L30
	ldrsb	w1, [x23, x25]
	str	w0, [x20, 12]
	cmp	w1, 0
	ccmp	w26, w1, 1, ne
	bge	.L31
	ldr	w1, [x19, 4]
	ubfiz	x2, x1, 1, 32
	add	x2, x2, x1, uxtw
	lsl	x2, x2, 3
	add	x0, x2, x4
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x25]
	cbnz	w3, .L32
	add	x5, x0, 12
	ldr	x2, [x4, x2]
	lsr	x6, x5, 3
	and	x3, x5, 7
	add	w3, w3, 3
	ldrsb	w4, [x6, x25]
	cmp	w4, 0
	ccmp	w3, w4, 1, ne
	bge	.L33
	ldr	w3, [x0, 12]
	lsr	x27, x19, 3
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	and	x26, x19, 7
	add	w28, w26, 3
	bl	printf
	ldrsb	w0, [x27, x25]
	cmp	w0, 0
	ccmp	w28, w0, 1, ne
	bge	.L34
	ldr	w1, [x19]
	adrp	x20, roxy_tasks
	add	x0, x20, :lo12:roxy_tasks
	add	x2, x1, x1, lsl 3
	add	x2, x0, x2, lsl 3
	add	x0, x2, 8
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x25]
	cbnz	w3, .L35
	ldr	x0, [x2, 8]
	cbz	x0, .L9
	blr	x0
	ldrsb	w0, [x27, x25]
	cmp	w0, 0
	ccmp	w28, w0, 1, ne
	bge	.L36
	ldr	w1, [x19]
.L9:
	add	x2, x1, x1, lsl 3
	add	x3, x20, :lo12:roxy_tasks
	mov	x25, 68719476736
	lsl	x2, x2, 3
	add	x0, x2, 16
	add	x0, x0, x3
	lsr	x4, x0, 3
	ldrsb	w4, [x4, x25]
	cbnz	w4, .L37
	add	x2, x3, x2
	ldr	x0, [x2, 16]
	cbz	x0, .L12
	blr	x0
	add	w26, w26, 3
	ldrsb	w0, [x27, x25]
	cmp	w0, 0
	ccmp	w26, w0, 1, ne
	bge	.L38
	ldr	w1, [x19]
.L12:
	add	x1, x1, x1, lsl 3
	add	x20, x20, :lo12:roxy_tasks
	mov	x2, 68719476736
	lsl	x1, x1, 3
	add	x0, x1, 32
	add	x0, x0, x20
	lsr	x3, x0, 3
	ldrsb	w2, [x3, x2]
	cbnz	w2, .L39
	add	x20, x20, x1
	ldr	x0, [x20, 32]
	cbz	x0, .L15
	blr	x0
.L15:
	mov	x1, 68719476736
	add	w22, w22, 3
	ldrsb	w0, [x23, x1]
	cmp	w0, 0
	ccmp	w22, w0, 1, ne
	bge	.L40
	ldr	w0, [x19, 4]
	add	x21, x21, :lo12:roxy_threads
	mov	w2, 3
	add	x0, x0, x0, lsl 1
	add	x21, x21, x0, lsl 3
	add	x0, x21, 8
	lsr	x3, x0, 3
	ldrsb	w1, [x3, x1]
	cmp	w1, 0
	ccmp	w2, w1, 1, ne
	bge	.L41
	mov	w1, 2
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	str	w1, [x21, 8]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L29:
	.cfi_restore_state
	mov	x0, x24
	bl	__asan_report_load4
.L41:
	bl	__asan_report_store4
.L40:
	mov	x0, x24
	bl	__asan_report_load4
.L39:
	bl	__asan_report_load8
.L37:
	bl	__asan_report_load8
.L35:
	bl	__asan_report_load8
.L34:
	mov	x0, x19
	bl	__asan_report_load4
.L33:
	mov	x0, x5
	bl	__asan_report_load4
.L32:
	bl	__asan_report_load8
.L31:
	mov	x0, x24
	bl	__asan_report_load4
.L30:
	mov	x0, x2
	bl	__asan_report_store4
.L38:
	mov	x0, x19
	bl	__asan_report_load4
.L36:
	mov	x0, x19
	bl	__asan_report_load4
	.cfi_endproc
.LFE27:
	.size	roxy_thread_runner, .-roxy_thread_runner
	.global	__asan_stack_malloc_2
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC2:
	.string	"1 48 72 15 default_task:32"
	.global	__asan_stack_free_2
	.text
	.align	2
	.p2align 4,,11
	.global	roxy_init
	.type	roxy_init, %function
roxy_init:
.LASANPC24:
.LFB24:
	.cfi_startproc
	stp	x29, x30, [sp, -256]!
	.cfi_def_cfa_offset 256
	.cfi_offset 29, -256
	.cfi_offset 30, -248
	adrp	x0, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x0, [x0, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -240
	.cfi_offset 20, -232
	add	x20, sp, 96
	stp	x21, x22, [sp, 32]
	ldr	w0, [x0]
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -224
	.cfi_offset 22, -216
	.cfi_offset 23, -208
	.cfi_offset 24, -200
	mov	x23, x20
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	.cfi_offset 25, -192
	.cfi_offset 26, -184
	.cfi_offset 27, -176
	cbnz	w0, .L67
.L42:
	lsr	x22, x20, 3
	mov	x19, 68719476736
	mov	x3, 35507
	add	x1, x22, x19
	movk	x3, 0x41b5, lsl 16
	adrp	x2, .LC2
	adrp	x0, .LASANPC24
	add	x2, x2, :lo12:.LC2
	add	x0, x0, :lo12:.LASANPC24
	stp	x3, x2, [x20]
	mov	w5, -235802127
	str	x0, [x20, 16]
	mov	w4, 61937
	str	w5, [x22, x19]
	mov	w3, -218103808
	mov	w2, -202116109
	str	w4, [x1, 4]
	stp	w3, w2, [x1, 12]
	mov	w0, 8080
	adrp	x21, .LANCHOR0
	bl	srand
	add	x1, x21, :lo12:.LANCHOR0
	adrp	x0, roxy_tasks
	add	x0, x0, :lo12:roxy_tasks
	mov	x3, 9216
	add	x2, x20, 48
	add	x15, x0, x3
	ldp	x10, x11, [x1, 128]!
	mov	w14, 0
	ldp	x8, x9, [x1, 16]
	ldp	x6, x7, [x1, 32]
	ldp	x4, x5, [x1, 48]
	ldr	x12, [x1, 64]
	.p2align 3,,7
.L47:
	add	x1, x0, 71
	and	w13, w1, 7
	lsr	x3, x0, 3
	lsr	x1, x1, 3
	stp	x10, x11, [x2]
	ldrsb	w3, [x3, x19]
	ldrsb	w1, [x1, x19]
	stp	x8, x9, [x2, 16]
	cmp	w1, 0
	ccmp	w13, w1, 1, ne
	stp	x6, x7, [x2, 32]
	cset	w1, ge
	cmp	w3, 0
	stp	x4, x5, [x2, 48]
	ccmp	w14, w3, 1, ne
	str	x12, [x2, 64]
	cset	w3, ge
	orr	w1, w1, w3
	cbnz	w1, .L68
	add	x0, x0, 72
	stp	x10, x11, [x0, -72]
	stp	x8, x9, [x0, -56]
	stp	x6, x7, [x0, -40]
	stp	x4, x5, [x0, -24]
	str	x12, [x0, -8]
	cmp	x0, x15
	bne	.L47
	adrp	x5, roxy_threads
	add	x5, x5, :lo12:roxy_threads
	mov	x2, 24584
	adrp	x0, roxy_threads+8
	add	x5, x5, x2
	add	x0, x0, :lo12:roxy_threads+8
	mov	x4, 68719476736
	mov	w7, 3
	mov	w6, -1
	.p2align 3,,7
.L50:
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x4]
	cmp	w1, 0
	ccmp	w7, w1, 1, ne
	bge	.L69
	mov	x1, x0
	str	wzr, [x1], 4
	lsr	x3, x1, 3
	and	x2, x1, 7
	add	w2, w2, 3
	ldrsb	w3, [x3, x4]
	cmp	w3, 0
	ccmp	w2, w3, 1, ne
	bge	.L70
	add	x0, x0, 24
	str	w6, [x0, -20]
	cmp	x0, x5
	bne	.L50
	adrp	x24, .LANCHOR1
	add	x19, x24, :lo12:.LANCHOR1
	add	x25, x19, 768
	.p2align 3,,7
.L51:
	mov	x0, x19
	mov	x1, 0
	add	x19, x19, 48
	bl	pthread_mutex_init
	cmp	x19, x25
	bne	.L51
	add	x25, x21, :lo12:.LANCHOR0
	adrp	x19, roxy_mqueues
	add	x19, x19, :lo12:roxy_mqueues
	mov	x1, 10240
	add	x25, x25, 224
	add	x26, x19, x1
	.p2align 3,,7
.L52:
	mov	x0, x19
	mov	x1, x25
	add	x19, x19, 80
	mov	x2, 1
	bl	memcpy
	cmp	x19, x26
	bne	.L52
	adrp	x25, roxy_events
	add	x25, x25, :lo12:roxy_events
	mov	x0, 13408
	adrp	x19, roxy_events+96
	add	x25, x25, x0
	add	x19, x19, :lo12:roxy_events+96
	mov	x27, 68719476736
	mov	w26, 3
	.p2align 3,,7
.L54:
	mov	x1, 0
	sub	x0, x19, #96
	bl	pthread_mutex_init
	sub	x0, x19, #48
	mov	x1, 0
	bl	pthread_cond_init
	lsr	x0, x19, 3
	ldrsb	w0, [x0, x27]
	cmp	w0, 0
	ccmp	w26, w0, 1, ne
	bge	.L71
	str	wzr, [x19], 104
	cmp	x19, x25
	bne	.L54
	add	x2, x24, :lo12:.LANCHOR1
	mov	x19, 68719476736
	add	x0, x2, 800
	add	x2, x2, 1312
	.p2align 3,,7
.L56:
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x19]
	cbnz	w1, .L72
	str	xzr, [x0], 8
	cmp	x0, x2
	bne	.L56
	mov	w0, 2
	bl	sched_get_priority_max
	mov	w24, w0
	add	x21, x21, :lo12:.LANCHOR0
	mov	w0, 2
	bl	sched_get_priority_min
	sub	w24, w24, w0
	add	x0, x21, 288
	mov	w1, w24
	bl	printf
	add	x0, x21, 384
	mov	w1, 64
	bl	printf
	cmp	w24, 63
	cset	w21, le
	cmp	x23, x20
	bne	.L73
	add	x0, x22, x19
	str	xzr, [x22, x19]
	str	xzr, [x0, 12]
.L44:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 256
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L68:
	.cfi_restore_state
	mov	x1, 72
	bl	__asan_report_store_n
.L71:
	mov	x0, x19
	bl	__asan_report_store4
.L70:
	mov	x0, x1
	bl	__asan_report_store4
.L69:
	bl	__asan_report_store4
.L72:
	bl	__asan_report_store8
.L67:
	mov	x0, 160
	bl	__asan_stack_malloc_2
	cmp	x0, 0
	csel	x20, x20, x0, eq
	b	.L42
.L73:
	mov	x0, 13838
	mov	x2, x23
	movk	x0, 0x45e0, lsl 16
	str	x0, [x20]
	mov	x1, 160
	mov	x0, x20
	bl	__asan_stack_free_2
	b	.L44
	.cfi_endproc
.LFE24:
	.size	roxy_init, .-roxy_init
	.align	2
	.p2align 4,,11
	.global	roxy_clean
	.type	roxy_clean, %function
roxy_clean:
.LASANPC25:
.LFB25:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	adrp	x22, .LANCHOR0
	add	x22, x22, :lo12:.LANCHOR0
	mov	w21, 0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	adrp	x19, roxy_mqueues
	mov	w20, 0
	add	x19, x19, :lo12:roxy_mqueues
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -16
	.cfi_offset 24, -8
	add	x23, x22, 608
	mov	x24, 68719476736
	b	.L78
	.p2align 2,,3
.L76:
	add	w20, w20, 1
	add	x19, x19, 80
	cmp	w20, 128
	beq	.L74
.L78:
	lsr	x0, x19, 3
	ldrsb	w0, [x0, x24]
	cmp	w0, 0
	ccmp	w21, w0, 1, ne
	bge	.L84
	ldrb	w0, [x19]
	cbz	w0, .L76
	mov	x0, x19
	bl	mq_unlink
	cbnz	w0, .L85
	mov	x2, x19
	mov	w1, w20
	mov	x0, x23
	bl	printf
	mov	x0, x19
	add	x1, x22, 224
	mov	x2, 1
	add	w20, w20, 1
	bl	memcpy
	add	x19, x19, 80
	cmp	w20, 128
	bne	.L78
.L74:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L85:
	.cfi_restore_state
	adrp	x4, .LANCHOR0
	add	x4, x4, :lo12:.LANCHOR0
	mov	w3, w0
	mov	x2, x19
	mov	w1, w20
	add	x0, x4, 480
	bl	printf
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L84:
	.cfi_restore_state
	mov	x0, x19
	bl	__asan_report_load1
	.cfi_endproc
.LFE25:
	.size	roxy_clean, .-roxy_clean
	.align	2
	.p2align 4,,11
	.global	roxy_task_create
	.type	roxy_task_create, %function
roxy_task_create:
.LASANPC26:
.LFB26:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	cmp	w0, 127
	bhi	.L87
	ubfiz	x7, x0, 3, 32
	adrp	x6, roxy_tasks
	add	x0, x7, x0, uxtw
	add	x7, x6, :lo12:roxy_tasks
	mov	x9, 68719476736
	mov	w10, 3
	lsl	x6, x0, 3
	add	x8, x6, x7
	lsr	x0, x8, 3
	ldrsb	w0, [x0, x9]
	cmp	w0, 0
	ccmp	w10, w0, 1, ne
	bge	.L96
	ldr	w0, [x7, x6]
	cbz	w0, .L97
.L87:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 736
	bl	puts
	mov	w0, 2
	ldp	x29, x30, [sp], 16
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L97:
	.cfi_restore_state
	add	x11, x8, 4
	mov	w12, 1
	str	w12, [x7, x6]
	and	x10, x11, 7
	lsr	x12, x11, 3
	add	w10, w10, 3
	ldrsb	w12, [x12, x9]
	cmp	w12, 0
	ccmp	w10, w12, 1, ne
	bge	.L98
	add	x10, x8, 8
	str	w1, [x8, 4]
	lsr	x1, x10, 3
	ldrsb	w1, [x1, x9]
	cbnz	w1, .L99
	add	x1, x6, 16
	str	x2, [x8, 8]
	add	x1, x1, x7
	lsr	x2, x1, 3
	ldrsb	w2, [x2, x9]
	cbnz	w2, .L100
	add	x6, x6, 32
	add	x6, x6, x7
	lsr	x2, x6, 3
	ldrsb	w2, [x2, x9]
	str	x3, [x8, 16]
	cbnz	w2, .L101
	add	x1, x1, 8
	lsr	x2, x1, 3
	ldrsb	w2, [x2, x9]
	str	x4, [x8, 32]
	cbnz	w2, .L102
	str	x5, [x8, 24]
	ldp	x29, x30, [sp], 16
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
.L96:
	.cfi_restore_state
	mov	x0, x8
	bl	__asan_report_load4
.L98:
	mov	x0, x11
	bl	__asan_report_store4
.L99:
	mov	x0, x10
	bl	__asan_report_store8
.L100:
	mov	x0, x1
	bl	__asan_report_store8
.L101:
	mov	x0, x6
	bl	__asan_report_store8
.L102:
	mov	x0, x1
	bl	__asan_report_store8
	.cfi_endproc
.LFE26:
	.size	roxy_task_create, .-roxy_task_create
	.global	__asan_stack_malloc_3
	.section	.rodata.str1.8
	.align	3
.LC9:
	.string	"3 48 4 15 scheduler_param 64 64 11 thread_attr 160 128 10 cpuset:199"
	.global	__asan_stack_free_3
	.text
	.align	2
	.p2align 4,,11
	.global	roxy_task_start
	.type	roxy_task_start, %function
roxy_task_start:
.LASANPC28:
.LFB28:
	.cfi_startproc
	sub	sp, sp, #512
	.cfi_def_cfa_offset 512
	adrp	x2, :got:__asan_option_detect_stack_use_after_return
	stp	x29, x30, [sp]
	.cfi_offset 29, -512
	.cfi_offset 30, -504
	mov	x29, sp
	ldr	x2, [x2, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -448
	.cfi_offset 26, -440
	mov	w25, w0
	stp	x19, x20, [sp, 16]
	ldr	w0, [x2]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -496
	.cfi_offset 20, -488
	.cfi_offset 27, -432
	.cfi_offset 28, -424
	add	x27, sp, 192
	str	w1, [sp, 104]
	str	x27, [sp, 160]
	cbnz	w0, .L151
.L103:
	lsr	x6, x27, 3
	mov	x3, 68719476736
	mov	x4, 35507
	add	x0, x6, x3
	str	x6, [sp, 168]
	movk	x4, 0x41b5, lsl 16
	adrp	x2, .LC9
	adrp	x1, .LASANPC28
	add	x2, x2, :lo12:.LC9
	add	x1, x1, :lo12:.LASANPC28
	stp	x4, x2, [x27]
	mov	w5, -235802127
	mov	w4, 61937
	str	x1, [x27, 16]
	movk	w4, 0xf204, lsl 16
	str	w5, [x6, x3]
	mov	w2, 62194
	str	w4, [x0, 4]
	add	x4, x27, 320
	str	x4, [sp, 112]
	movk	w2, 0xf2f2, lsl 16
	mov	w1, -202116109
	str	w2, [x0, 16]
	str	w1, [x0, 36]
	cmp	w25, 128
	bhi	.L107
	uxtw	x0, w25
	str	x0, [sp, 176]
	add	x0, x0, x25, uxtw 3
	adrp	x1, roxy_tasks
	add	x1, x1, :lo12:roxy_tasks
	mov	w4, 3
	lsl	x2, x0, 3
	add	x0, x2, x1
	str	x0, [sp, 152]
	lsr	x0, x0, 3
	str	x0, [sp, 184]
	ldrsb	w0, [x0, x3]
	cmp	w0, 0
	ccmp	w4, w0, 1, ne
	bge	.L152
	ldr	w0, [x1, x2]
	cmp	w0, 0
	ldr	w0, [sp, 104]
	ccmp	w0, 8, 2, ne
	bhi	.L107
	add	x0, x1, x2
	add	x0, x0, 40
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x3]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L153
	ldr	x0, [sp, 152]
	ldr	w0, [x0, 40]
	cmn	w0, #1
	bne	.L112
	add	x0, x1, x2
	add	x0, x0, 44
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x3]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L154
	ldr	x0, [sp, 152]
	ldr	w0, [x0, 44]
	cmn	w0, #1
	bne	.L112
	add	x0, x1, x2
	add	x0, x0, 48
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x3]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L155
	ldr	x0, [sp, 152]
	ldr	w0, [x0, 48]
	cmn	w0, #1
	bne	.L112
	add	x0, x1, x2
	add	x0, x0, 52
	and	x1, x0, 7
	lsr	x2, x0, 3
	add	w1, w1, 3
	ldrsb	w2, [x2, x3]
	cmp	w2, 0
	ccmp	w1, w2, 1, ne
	bge	.L156
	ldr	x0, [sp, 176]
	adrp	x1, roxy_tasks
	add	x1, x1, :lo12:roxy_tasks
	add	x0, x0, x0, lsl 3
	lsl	x2, x0, 3
	add	x3, x1, x2
	ldr	w0, [x3, 52]
	cmn	w0, #1
	bne	.L112
	add	x0, x3, 56
	mov	x19, 68719476736
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x19]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L157
	ldr	w0, [x3, 56]
	cmn	w0, #1
	bne	.L112
	add	x0, x1, x2
	add	x0, x0, 60
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x19]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L158
	ldr	w0, [x3, 60]
	cmn	w0, #1
	bne	.L112
	add	x0, x1, x2
	add	x0, x0, 64
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x19]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L159
	ldr	w0, [x3, 64]
	cmn	w0, #1
	bne	.L112
	add	x0, x1, x2
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	add	x0, x0, 68
	and	x1, x0, 7
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	lsr	x2, x0, 3
	add	w1, w1, 3
	ldrsb	w2, [x2, x19]
	cmp	w2, 0
	ccmp	w1, w2, 1, ne
	bge	.L160
	ldr	w0, [x3, 68]
	cmn	w0, #1
	bne	.L161
	add	x20, x27, 160
	add	x0, x27, 168
	mov	x2, 120
	mov	w1, 0
	str	x20, [sp, 144]
	bl	memset
	lsr	x0, x20, 3
	ldrsb	w0, [x0, x19]
	cbnz	w0, .L162
	mov	x0, 3
	str	x0, [x27, 160]
	ldr	w0, [sp, 104]
	cbz	w0, .L122
	ldr	x0, [sp, 176]
	mov	w24, 72
	mov	x1, 40
	adrp	x3, roxy_tasks
	add	x3, x3, :lo12:roxy_tasks
	add	x23, x27, 64
	umaddl	x24, w25, w24, x1
	add	x0, x0, x0, lsl 3
	add	x26, x27, 48
	mov	w28, 0
	lsl	x0, x0, 3
	add	x24, x24, x3
	stp	x3, x0, [sp, 120]
	add	x0, x3, x0
	str	x0, [sp, 136]
	.p2align 3,,7
.L139:
	lsr	x1, x23, 3
	mov	x20, 68719476736
	add	x3, x1, x20
	lsr	x19, x26, 3
	mov	w2, 4
	mov	x0, x23
	str	wzr, [x1, x20]
	str	wzr, [x3, 4]
	strb	w2, [x19, x20]
	bl	pthread_attr_init
	cbnz	w0, .L163
	mov	x0, x23
	mov	x1, 131072
	bl	pthread_attr_setstacksize
	cbnz	w0, .L164
	mov	x0, x23
	mov	w1, 2
	bl	pthread_attr_setschedpolicy
	cbnz	w0, .L165
	ldr	x0, [sp, 136]
	add	x0, x0, 4
	and	x1, x0, 7
	lsr	x2, x0, 3
	add	w1, w1, 3
	ldrsb	w2, [x2, x20]
	cmp	w2, 0
	ccmp	w1, w2, 1, ne
	bge	.L166
	ldp	x0, x2, [sp, 120]
	mov	w22, 3
	ldrsb	w1, [x19, x20]
	cmp	w1, 0
	ccmp	w22, w1, 1, ne
	add	x0, x0, x2
	ldr	w3, [x0, 4]
	bge	.L167
	ldr	x0, [sp, 112]
	mov	x1, x26
	sub	x2, x0, #16384
	mov	x0, x23
	str	w3, [x2, 16112]
	bl	pthread_attr_setschedparam
	cbnz	w0, .L168
	mov	x0, x23
	mov	w1, 1
	bl	pthread_attr_setinheritsched
	cbnz	w0, .L169
	adrp	x21, roxy_threads
	mov	w19, 100
	add	x21, x21, :lo12:roxy_threads
	b	.L130
	.p2align 2,,3
.L132:
	subs	w19, w19, #1
	beq	.L138
.L130:
	bl	rand
	negs	w4, w0
	and	w4, w4, 1023
	and	w0, w0, 1023
	csneg	w4, w0, w4, mi
	sbfiz	x1, x4, 1, 32
	add	x1, x1, x4, sxtw
	lsl	x1, x1, 3
	add	x5, x1, x21
	add	x0, x5, 8
	lsr	x2, x0, 3
	ldrsb	w2, [x2, x20]
	cmp	w2, 0
	ccmp	w22, w2, 1, ne
	bge	.L170
	ldr	w0, [x5, 8]
	cbnz	w0, .L132
	add	x0, x1, 16
	mov	w1, 1
	add	x0, x0, x21
	str	w1, [x5, 8]
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x20]
	cmp	w1, 0
	ccmp	w22, w1, 1, ne
	bge	.L171
	add	x0, x0, 4
	and	x1, x0, 7
	lsr	x2, x0, 3
	add	w1, w1, 3
	ldrsb	w2, [x2, x20]
	str	w25, [x5, 16]
	cmp	w2, 0
	ccmp	w1, w2, 1, ne
	bge	.L172
	mov	w0, 24
	str	w4, [x5, 20]
	mov	x1, x23
	adrp	x2, roxy_thread_runner
	smull	x0, w4, w0
	add	x2, x2, :lo12:roxy_thread_runner
	str	x5, [sp, 96]
	add	x3, x0, 16
	add	x0, x21, x0
	add	x3, x21, x3
	str	w4, [sp, 108]
	bl	pthread_create
	ldr	w4, [sp, 108]
	ldr	x5, [sp, 96]
	cbnz	w0, .L173
	lsr	x0, x5, 3
	ldrsb	w0, [x0, x20]
	cbnz	w0, .L174
	ldr	x0, [x5]
	mov	x1, 128
	ldr	x2, [sp, 144]
	str	w4, [sp, 96]
	bl	pthread_setaffinity_np
	lsr	x1, x24, 3
	and	x0, x24, 7
	add	w0, w0, 3
	ldr	w4, [sp, 96]
	ldrsb	w1, [x1, x20]
	cmp	w1, 0
	ccmp	w0, w1, 1, ne
	bge	.L175
	str	w4, [x24]
.L138:
	lsr	x3, x23, 3
	mov	x0, 68719476736
	add	x4, x3, x0
	lsr	x1, x26, 3
	mov	w2, -117901064
	add	w28, w28, 1
	str	w2, [x3, x0]
	mov	w3, -8
	str	w2, [x4, 4]
	add	x24, x24, 4
	strb	w3, [x1, x0]
	ldr	w0, [sp, 104]
	cmp	w0, w28
	bne	.L139
.L122:
	ldr	x2, [sp, 184]
	mov	x0, 68719476736
	mov	w1, 3
	ldrsb	w0, [x2, x0]
	cmp	w0, 0
	ccmp	w1, w0, 1, ne
	bge	.L176
	ldr	x0, [sp, 176]
	adrp	x1, roxy_tasks
	add	x1, x1, :lo12:roxy_tasks
	mov	w2, 2
	mov	w19, 0
	add	x0, x0, x0, lsl 3
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	lsl	x0, x0, 3
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	str	w2, [x1, x0]
	b	.L106
	.p2align 2,,3
.L107:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w25
	add	x0, x0, 832
	mov	w19, 2
	bl	printf
.L106:
	ldr	x0, [sp, 160]
	cmp	x0, x27
	bne	.L177
	ldr	x1, [sp, 168]
	mov	x0, 68719476736
	add	x0, x1, x0
	stp	xzr, xzr, [x0]
	str	wzr, [x0, 16]
	str	wzr, [x0, 36]
.L105:
	mov	w0, w19
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	add	sp, sp, 512
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L161:
	.cfi_def_cfa_offset 512
	.cfi_offset 19, -496
	.cfi_offset 20, -488
	.cfi_offset 21, -480
	.cfi_offset 22, -472
	.cfi_offset 23, -464
	.cfi_offset 24, -456
	.cfi_offset 25, -448
	.cfi_offset 26, -440
	.cfi_offset 27, -432
	.cfi_offset 28, -424
	.cfi_offset 29, -512
	.cfi_offset 30, -504
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
.L112:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w25
	mov	w19, 2
	add	x0, x0, 928
	bl	printf
	b	.L106
.L165:
	.cfi_offset 21, -480
	.cfi_offset 22, -472
	.cfi_offset 23, -464
	.cfi_offset 24, -456
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 1216
	bl	puts
.L124:
	mov	w19, 2
	ldp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	b	.L106
.L164:
	.cfi_restore_state
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 1120
	bl	puts
	b	.L124
.L163:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 1024
	bl	puts
	b	.L124
.L169:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 1408
	bl	puts
	b	.L124
.L168:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 1312
	bl	puts
	b	.L124
.L173:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 1504
	bl	puts
	b	.L124
.L170:
	bl	__asan_report_load4
.L176:
	ldr	x0, [sp, 152]
	bl	__asan_report_store4
	.p2align 2,,3
.L166:
	bl	__asan_report_load4
.L160:
	bl	__asan_report_load4
.L151:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	mov	x0, 320
	bl	__asan_stack_malloc_3
	cmp	x0, 0
	csel	x27, x27, x0, eq
	b	.L103
.L153:
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	bl	__asan_report_load4
.L152:
	.cfi_restore_state
	ldr	x0, [sp, 152]
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	bl	__asan_report_load4
.L155:
	.cfi_restore_state
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	bl	__asan_report_load4
.L171:
	bl	__asan_report_store4
.L172:
	bl	__asan_report_store4
.L174:
	mov	x0, x5
	bl	__asan_report_load8
.L167:
	mov	x0, x26
	bl	__asan_report_store4
.L156:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	bl	__asan_report_load4
.L157:
	.cfi_restore_state
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	bl	__asan_report_load4
.L158:
	.cfi_restore_state
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	bl	__asan_report_load4
.L159:
	.cfi_restore_state
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	bl	__asan_report_load4
.L177:
	.cfi_restore_state
	mov	x0, 13838
	mov	x1, 320
	movk	x0, 0x45e0, lsl 16
	str	x0, [x27]
	mov	x0, x27
	ldr	x2, [sp, 160]
	bl	__asan_stack_free_3
	b	.L105
.L154:
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	bl	__asan_report_load4
.L175:
	mov	x0, x24
	bl	__asan_report_store4
.L162:
	ldr	x0, [sp, 144]
	bl	__asan_report_store8
	.cfi_endproc
.LFE28:
	.size	roxy_task_start, .-roxy_task_start
	.align	2
	.p2align 4,,11
	.global	roxy_task_suspend
	.type	roxy_task_suspend, %function
roxy_task_suspend:
.LASANPC29:
.LFB29:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE29:
	.size	roxy_task_suspend, .-roxy_task_suspend
	.global	__asan_stack_malloc_1
	.section	.rodata.str1.8
	.align	3
.LC18:
	.string	"2 32 16 7 req:298 64 16 7 rem:298"
	.text
	.align	2
	.p2align 4,,11
	.global	roxy_task_wait
	.type	roxy_task_wait, %function
roxy_task_wait:
.LASANPC30:
.LFB30:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	adrp	x2, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x2, [x2, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	mov	w20, w0
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	add	x19, sp, 64
	ldr	w0, [x2]
	mov	x22, x19
	cbnz	w0, .L196
.L179:
	mov	x2, x19
	lsr	x21, x19, 3
	mov	x0, 35507
	mov	x3, 68719476736
	movk	x0, 0x41b5, lsl 16
	add	x5, x21, x3
	str	x0, [x2], 96
	adrp	x4, .LC18
	adrp	x0, .LASANPC30
	add	x4, x4, :lo12:.LC18
	add	x0, x0, :lo12:.LASANPC30
	stp	x4, x0, [x19, 8]
	mov	w6, -235802127
	str	w6, [x21, x3]
	mov	w4, -219021312
	mov	w0, -202178560
	stp	w4, w0, [x5, 4]
	cbnz	w1, .L183
	add	x4, x19, 40
	uxtw	x0, w20
	add	x1, x19, 32
	lsr	x5, x4, 3
	ldrsb	w5, [x5, x3]
	cbnz	w5, .L197
	lsr	x4, x1, 3
	str	x0, [x2, -56]
	ldrsb	w0, [x4, x3]
	cbnz	w0, .L198
	str	xzr, [x2, -64]
.L186:
	sub	x1, x2, #32
	sub	x0, x2, #64
	bl	nanosleep
	mov	w1, w0
	mov	w0, 0
	cmn	w1, #1
	beq	.L199
.L182:
	cmp	x22, x19
	bne	.L200
	mov	x1, 68719476736
	add	x2, x21, x1
	str	xzr, [x21, x1]
	str	wzr, [x2, 8]
.L181:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 160
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L183:
	.cfi_restore_state
	cmp	w1, 1
	bne	.L187
	add	x0, x19, 40
	add	x1, x19, 32
	lsr	x4, x0, 3
	ldrsb	w4, [x4, x3]
	cbnz	w4, .L201
	lsr	x4, x1, 3
	uxtw	x0, w20
	ldrsb	w3, [x4, x3]
	str	xzr, [x2, -56]
	cbnz	w3, .L202
	str	x0, [x2, -64]
	b	.L186
	.p2align 2,,3
.L187:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 1600
	bl	puts
	mov	w0, 2
	b	.L182
	.p2align 2,,3
.L199:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 1664
	bl	puts
	mov	w0, 2
	b	.L182
.L197:
	mov	x0, x4
	bl	__asan_report_store8
.L198:
	mov	x0, x1
	bl	__asan_report_store8
.L196:
	mov	x0, 96
	str	w1, [sp, 60]
	bl	__asan_stack_malloc_1
	cmp	x0, 0
	ldr	w1, [sp, 60]
	csel	x19, x19, x0, eq
	b	.L179
.L200:
	mov	x3, 68719476736
	mov	x4, 13838
	add	x2, x21, x3
	movk	x4, 0x45e0, lsl 16
	mov	w1, 62965
	str	x4, [x19]
	bfi	w1, w1, 16, 16
	str	w1, [x21, x3]
	mov	w3, 62965
	movk	w3, 0xf5f5, lsl 16
	stp	w1, w3, [x2, 4]
	ldr	x1, [x19, 120]
	strb	wzr, [x1]
	b	.L181
.L201:
	bl	__asan_report_store8
.L202:
	mov	x0, x1
	bl	__asan_report_store8
	.cfi_endproc
.LFE30:
	.size	roxy_task_wait, .-roxy_task_wait
	.align	2
	.p2align 4,,11
	.global	roxy_task_set_priority
	.type	roxy_task_set_priority, %function
roxy_task_set_priority:
.LASANPC31:
.LFB31:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	cmp	w0, 127
	bhi	.L207
	ubfiz	x2, x0, 3, 32
	adrp	x3, roxy_tasks
	add	x2, x2, x0, uxtw
	add	x3, x3, :lo12:roxy_tasks
	mov	x6, 68719476736
	mov	w7, 3
	lsl	x2, x2, 3
	add	x5, x2, x3
	lsr	x4, x5, 3
	ldrsb	w4, [x4, x6]
	cmp	w4, 0
	ccmp	w7, w4, 1, ne
	bge	.L214
	ldr	w2, [x3, x2]
	cbz	w2, .L207
	cmp	w2, 1
	bne	.L215
	add	x0, x5, 4
	and	x2, x0, 7
	lsr	x3, x0, 3
	add	w2, w2, 3
	ldrsb	w3, [x3, x6]
	cmp	w3, 0
	ccmp	w2, w3, 1, ne
	bge	.L216
	str	w1, [x5, 4]
	ldp	x29, x30, [sp], 16
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L207:
	.cfi_restore_state
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	mov	w1, w0
	add	x0, x2, 1792
	bl	printf
	mov	w0, 2
.L217:
	ldp	x29, x30, [sp], 16
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L215:
	.cfi_restore_state
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	mov	w1, w0
	add	x0, x2, 1888
	bl	printf
	mov	w0, 2
	b	.L217
.L214:
	mov	x0, x5
	bl	__asan_report_load4
.L216:
	bl	__asan_report_store4
	.cfi_endproc
.LFE31:
	.size	roxy_task_set_priority, .-roxy_task_set_priority
	.align	2
	.p2align 4,,11
	.global	roxy_critical_section_enter
	.type	roxy_critical_section_enter, %function
roxy_critical_section_enter:
.LASANPC32:
.LFB32:
	.cfi_startproc
	cmp	w0, 15
	bhi	.L220
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	w1, 48
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	w19, w0
	adrp	x0, .LANCHOR1
	add	x0, x0, :lo12:.LANCHOR1
	umaddl	x0, w19, w1, x0
	bl	pthread_mutex_lock
	mov	w1, w0
	mov	w0, 0
	cbnz	w1, .L227
.L218:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L220:
	mov	w0, 2
	ret
	.p2align 2,,3
.L227:
	.cfi_def_cfa_offset 32
	.cfi_offset 19, -16
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w19
	add	x0, x0, 2016
	bl	printf
	mov	w0, 2
	b	.L218
	.cfi_endproc
.LFE32:
	.size	roxy_critical_section_enter, .-roxy_critical_section_enter
	.align	2
	.p2align 4,,11
	.global	roxy_critical_section_leave
	.type	roxy_critical_section_leave, %function
roxy_critical_section_leave:
.LASANPC33:
.LFB33:
	.cfi_startproc
	cmp	w0, 15
	bhi	.L230
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	w1, 48
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	w19, w0
	adrp	x0, .LANCHOR1
	add	x0, x0, :lo12:.LANCHOR1
	umaddl	x0, w19, w1, x0
	bl	pthread_mutex_unlock
	mov	w1, w0
	mov	w0, 0
	cbnz	w1, .L237
.L228:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L230:
	mov	w0, 2
	ret
	.p2align 2,,3
.L237:
	.cfi_def_cfa_offset 32
	.cfi_offset 19, -16
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w19
	add	x0, x0, 2144
	bl	printf
	mov	w0, 2
	b	.L228
	.cfi_endproc
.LFE33:
	.size	roxy_critical_section_leave, .-roxy_critical_section_leave
	.align	2
	.p2align 4,,11
	.global	roxy_loop
	.type	roxy_loop, %function
roxy_loop:
.LASANPC34:
.LFB34:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	w1, w0
	mov	x29, sp
	cmp	w0, 127
	bhi	.L242
	stp	x19, x20, [sp, 16]
	.cfi_offset 20, -24
	.cfi_offset 19, -32
	uxtw	x19, w0
	add	x0, x19, x1, uxtw 3
	adrp	x20, roxy_tasks
	add	x2, x20, :lo12:roxy_tasks
	lsl	x0, x0, 3
	mov	x3, 68719476736
	add	x5, x0, x2
	mov	w6, 3
	lsr	x4, x5, 3
	ldrsb	w4, [x4, x3]
	cmp	w4, 0
	ccmp	w6, w4, 1, ne
	bge	.L309
	ldr	w4, [x2, x0]
	cbz	w4, .L308
	add	x2, x2, x0
	add	x2, x2, 40
	and	x1, x2, 7
	lsr	x0, x2, 3
	add	w1, w1, 3
	ldrsb	w0, [x0, x3]
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	cmp	w0, 0
	ccmp	w1, w0, 1, ne
	bge	.L310
	ldr	w0, [x5, 40]
	cmn	w0, #1
	bne	.L311
.L244:
	add	x1, x19, x19, lsl 3
	add	x2, x20, :lo12:roxy_tasks
	mov	x5, 68719476736
	lsl	x1, x1, 3
	add	x0, x2, x1
	add	x0, x0, 44
	and	x3, x0, 7
	lsr	x4, x0, 3
	add	w3, w3, 3
	ldrsb	w4, [x4, x5]
	cmp	w4, 0
	ccmp	w3, w4, 1, ne
	bge	.L312
	add	x1, x2, x1
	ldr	w0, [x1, 44]
	cmn	w0, #1
	bne	.L313
.L248:
	add	x1, x19, x19, lsl 3
	add	x2, x20, :lo12:roxy_tasks
	mov	x5, 68719476736
	lsl	x1, x1, 3
	add	x0, x2, x1
	add	x0, x0, 48
	and	x3, x0, 7
	lsr	x4, x0, 3
	add	w3, w3, 3
	ldrsb	w4, [x4, x5]
	cmp	w4, 0
	ccmp	w3, w4, 1, ne
	bge	.L314
	add	x1, x2, x1
	ldr	w0, [x1, 48]
	cmn	w0, #1
	bne	.L315
.L251:
	add	x1, x19, x19, lsl 3
	add	x2, x20, :lo12:roxy_tasks
	mov	x5, 68719476736
	lsl	x1, x1, 3
	add	x0, x2, x1
	add	x0, x0, 52
	and	x3, x0, 7
	lsr	x4, x0, 3
	add	w3, w3, 3
	ldrsb	w4, [x4, x5]
	cmp	w4, 0
	ccmp	w3, w4, 1, ne
	bge	.L316
	add	x1, x2, x1
	ldr	w0, [x1, 52]
	cmn	w0, #1
	bne	.L317
.L254:
	add	x1, x19, x19, lsl 3
	add	x2, x20, :lo12:roxy_tasks
	mov	x5, 68719476736
	lsl	x1, x1, 3
	add	x0, x2, x1
	add	x0, x0, 56
	and	x3, x0, 7
	lsr	x4, x0, 3
	add	w3, w3, 3
	ldrsb	w4, [x4, x5]
	cmp	w4, 0
	ccmp	w3, w4, 1, ne
	bge	.L318
	add	x1, x2, x1
	ldr	w0, [x1, 56]
	cmn	w0, #1
	bne	.L319
.L257:
	add	x1, x19, x19, lsl 3
	add	x2, x20, :lo12:roxy_tasks
	mov	x5, 68719476736
	lsl	x1, x1, 3
	add	x0, x2, x1
	add	x0, x0, 60
	and	x3, x0, 7
	lsr	x4, x0, 3
	add	w3, w3, 3
	ldrsb	w4, [x4, x5]
	cmp	w4, 0
	ccmp	w3, w4, 1, ne
	bge	.L320
	add	x1, x2, x1
	ldr	w0, [x1, 60]
	cmn	w0, #1
	bne	.L321
.L260:
	add	x1, x19, x19, lsl 3
	add	x2, x20, :lo12:roxy_tasks
	mov	x5, 68719476736
	lsl	x1, x1, 3
	add	x0, x2, x1
	add	x0, x0, 64
	and	x3, x0, 7
	lsr	x4, x0, 3
	add	w3, w3, 3
	ldrsb	w4, [x4, x5]
	cmp	w4, 0
	ccmp	w3, w4, 1, ne
	bge	.L322
	add	x1, x2, x1
	ldr	w0, [x1, 64]
	cmn	w0, #1
	bne	.L323
.L263:
	add	x1, x19, x19, lsl 3
	add	x2, x20, :lo12:roxy_tasks
	mov	x5, 68719476736
	lsl	x1, x1, 3
	add	x0, x2, x1
	add	x0, x0, 68
	and	x3, x0, 7
	lsr	x4, x0, 3
	add	w3, w3, 3
	ldrsb	w4, [x4, x5]
	cmp	w4, 0
	ccmp	w3, w4, 1, ne
	bge	.L324
	add	x1, x2, x1
	ldr	w0, [x1, 68]
	cmn	w0, #1
	bne	.L325
.L266:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	.cfi_remember_state
	.cfi_restore 20
	.cfi_restore 19
	ldr	x21, [sp, 32]
	.cfi_restore 21
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L311:
	.cfi_restore_state
	ubfiz	x1, x0, 1, 32
	adrp	x21, roxy_threads
	add	x0, x1, x0, uxtw
	add	x1, x21, :lo12:roxy_threads
	lsl	x0, x0, 3
	add	x2, x0, x1
	lsr	x4, x2, 3
	ldrsb	w3, [x4, x3]
	cbnz	w3, .L326
	ldr	x0, [x1, x0]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L244
	mov	w2, 0
	.p2align 3,,7
.L246:
	add	x19, x19, x19, lsl 3
	add	x20, x20, :lo12:roxy_tasks
	mov	x3, 68719476736
	lsl	x1, x19, 1
	add	x1, x1, x2, sxtw
	add	x1, x1, 8
	add	x20, x20, x1, lsl 2
	add	x2, x20, 8
	and	x1, x2, 7
	lsr	x4, x2, 3
	add	w1, w1, 3
	ldrsb	w4, [x4, x3]
	cmp	w4, 0
	ccmp	w1, w4, 1, ne
	bge	.L327
	ldr	w1, [x20, 8]
	add	x21, x21, :lo12:roxy_threads
	add	x1, x1, x1, lsl 1
	lsl	x1, x1, 3
	add	x2, x1, x21
	lsr	x4, x2, 3
	ldrsb	w3, [x4, x3]
	cbnz	w3, .L328
	ldr	x1, [x21, x1]
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	mov	w2, w0
	add	x0, x3, 2272
	bl	printf
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	.cfi_remember_state
	.cfi_restore 20
	.cfi_restore 19
	ldr	x21, [sp, 32]
	.cfi_restore 21
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L313:
	.cfi_restore_state
	ubfiz	x1, x0, 1, 32
	adrp	x21, roxy_threads
	add	x0, x1, x0, uxtw
	add	x1, x21, :lo12:roxy_threads
	lsl	x0, x0, 3
	add	x2, x0, x1
	lsr	x3, x2, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L329
	ldr	x0, [x1, x0]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L248
	mov	w2, 1
	b	.L246
	.p2align 2,,3
.L315:
	ubfiz	x1, x0, 1, 32
	adrp	x21, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x21, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L330
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L251
	mov	w2, 2
	b	.L246
	.p2align 2,,3
.L317:
	ubfiz	x1, x0, 1, 32
	adrp	x21, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x21, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L331
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L254
	mov	w2, 3
	b	.L246
	.p2align 2,,3
.L319:
	ubfiz	x1, x0, 1, 32
	adrp	x21, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x21, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L332
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L257
	mov	w2, 4
	b	.L246
	.p2align 2,,3
.L321:
	ubfiz	x1, x0, 1, 32
	adrp	x21, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x21, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L333
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L260
	mov	w2, 5
	b	.L246
	.p2align 2,,3
.L323:
	ubfiz	x1, x0, 1, 32
	adrp	x21, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x21, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L334
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L263
	mov	w2, 6
	b	.L246
	.p2align 2,,3
.L325:
	ubfiz	x1, x0, 1, 32
	adrp	x21, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x21, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L335
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	mov	w2, 7
	cbz	w0, .L266
	b	.L246
	.p2align 2,,3
.L308:
	.cfi_restore 21
	ldp	x19, x20, [sp, 16]
	.cfi_restore 20
	.cfi_restore 19
.L242:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 1792
	bl	printf
	mov	w0, 2
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
.L324:
	.cfi_def_cfa_offset 48
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 21, -16
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	bl	__asan_report_load4
.L309:
	.cfi_restore 21
	mov	x0, x5
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	bl	__asan_report_load4
.L312:
	bl	__asan_report_load4
.L314:
	bl	__asan_report_load4
.L320:
	bl	__asan_report_load4
.L322:
	bl	__asan_report_load4
.L316:
	bl	__asan_report_load4
.L318:
	bl	__asan_report_load4
.L310:
	mov	x0, x2
	bl	__asan_report_load4
.L328:
	mov	x0, x2
	bl	__asan_report_load8
.L327:
	mov	x0, x2
	bl	__asan_report_load4
.L332:
	bl	__asan_report_load8
.L333:
	bl	__asan_report_load8
.L331:
	bl	__asan_report_load8
.L334:
	bl	__asan_report_load8
.L330:
	bl	__asan_report_load8
.L329:
	mov	x0, x2
	bl	__asan_report_load8
.L326:
	mov	x0, x2
	bl	__asan_report_load8
.L335:
	bl	__asan_report_load8
	.cfi_endproc
.LFE34:
	.size	roxy_loop, .-roxy_loop
	.section	.rodata.str1.8
	.align	3
.LC26:
	.string	"1 32 64 15 mqueue_attr:455"
	.global	__asan_stack_free_1
	.text
	.align	2
	.p2align 4,,11
	.global	roxy_mqueue_create
	.type	roxy_mqueue_create, %function
roxy_mqueue_create:
.LASANPC35:
.LFB35:
	.cfi_startproc
	stp	x29, x30, [sp, -224]!
	.cfi_def_cfa_offset 224
	.cfi_offset 29, -224
	.cfi_offset 30, -216
	adrp	x3, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x3, [x3, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -192
	.cfi_offset 22, -184
	mov	w22, w0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -208
	.cfi_offset 20, -200
	add	x19, sp, 96
	ldr	w0, [x3]
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -176
	.cfi_offset 24, -168
	mov	x24, x19
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -144
	.cfi_offset 28, -136
	mov	w28, w1
	mov	w27, w2
	cbnz	w0, .L359
.L336:
	lsr	x23, x19, 3
	mov	x20, 68719476736
	mov	x5, 35507
	add	x4, x23, x20
	movk	x5, 0x41b5, lsl 16
	adrp	x3, .LC26
	adrp	x0, .LASANPC35
	add	x3, x3, :lo12:.LC26
	add	x0, x0, :lo12:.LASANPC35
	stp	x5, x3, [x19]
	mov	w5, -235802127
	str	x0, [x19, 16]
	mov	w3, -202116109
	str	w5, [x23, x20]
	str	w3, [x4, 12]
	cmp	w22, 127
	bhi	.L360
	mov	w0, 80
	adrp	x21, roxy_mqueues
	add	x21, x21, :lo12:roxy_mqueues
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -152
	.cfi_offset 25, -160
	umull	x0, w22, w0
	mov	w1, 0
	add	x26, x0, x21
	lsr	x2, x26, 3
	ldrsb	w3, [x2, x20]
	cmp	w3, 0
	ccmp	w1, w3, 1, ne
	bge	.L361
	ldrb	w0, [x0, x21]
	cbnz	w0, .L362
	adrp	x25, .LANCHOR0
	add	x1, x25, :lo12:.LANCHOR0
	add	x1, x1, 2624
	mov	w2, w22
	mov	x0, x26
	bl	sprintf
	add	x0, x19, 40
	uxtw	x1, w28
	add	x3, x19, 32
	lsr	x2, x0, 3
	ldrsb	w2, [x2, x20]
	cbnz	w2, .L363
	add	x0, x19, 48
	str	x1, [x3, 8]
	uxtw	x2, w27
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x20]
	cbnz	w1, .L364
	lsr	x5, x3, 3
	ldrsb	w0, [x5, x20]
	str	x2, [x3, 16]
	cbnz	w0, .L365
	add	x0, x19, 56
	lsr	x1, x0, 3
	ldrsb	w6, [x1, x20]
	str	xzr, [x3]
	cbnz	w6, .L366
	ubfiz	x4, x22, 2, 32
	mov	x0, -1
	add	x4, x4, x22, uxtw
	str	x0, [x3, 24]
	lsl	x4, x4, 4
	add	x0, x4, 16
	add	x0, x0, x21
	add	x1, x0, 63
	and	w7, w1, 7
	lsr	x2, x0, 3
	lsr	x1, x1, 3
	ldrsb	w2, [x2, x20]
	ldrsb	w1, [x1, x20]
	cmp	w1, 0
	ccmp	w7, w1, 1, ne
	cset	w1, ge
	cmp	w2, 0
	ccmp	w6, w2, 1, ne
	cset	w2, ge
	orr	w1, w1, w2
	cbnz	w1, .L367
	add	x0, x19, 95
	ldrsb	w2, [x5, x20]
	and	w5, w0, 7
	lsr	x0, x0, 3
	ldrsb	w0, [x0, x20]
	cmp	w0, 0
	ccmp	w5, w0, 1, ne
	cset	w0, ge
	cmp	w2, 0
	ccmp	w1, w2, 1, ne
	cset	w1, ge
	orr	w0, w0, w1
	cbnz	w0, .L368
	add	x4, x21, x4
	mov	w1, 192
	ldp	x6, x7, [x3]
	add	x8, x4, 16
	stp	x6, x7, [x4, 16]
	mov	x0, x26
	movk	w1, 0x8, lsl 16
	ldp	x10, x11, [x3, 16]
	stp	x10, x11, [x8, 16]
	mov	w2, 420
	ldp	x6, x7, [x3, 32]
	stp	x6, x7, [x8, 32]
	ldp	x4, x5, [x3, 48]
	stp	x4, x5, [x8, 48]
	bl	mq_open
	cmn	w0, #1
	beq	.L369
	mov	w20, 0
	bl	mq_close
	cbnz	w0, .L370
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
.L339:
	cmp	x24, x19
	bne	.L371
	mov	x0, 68719476736
	add	x1, x23, x0
	str	wzr, [x23, x0]
	str	wzr, [x1, 12]
.L338:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 224
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L362:
	.cfi_def_cfa_offset 224
	.cfi_offset 19, -208
	.cfi_offset 20, -200
	.cfi_offset 21, -192
	.cfi_offset 22, -184
	.cfi_offset 23, -176
	.cfi_offset 24, -168
	.cfi_offset 25, -160
	.cfi_offset 26, -152
	.cfi_offset 27, -144
	.cfi_offset 28, -136
	.cfi_offset 29, -224
	.cfi_offset 30, -216
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w22
	add	x0, x0, 2496
	mov	w20, 2
	bl	printf
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
	b	.L339
	.p2align 2,,3
.L360:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w22
	mov	w20, 2
	add	x0, x0, 2400
	bl	printf
	b	.L339
	.p2align 2,,3
.L369:
	.cfi_offset 25, -160
	.cfi_offset 26, -152
	bl	__errno_location
	lsr	x4, x0, 3
	mov	x3, 68719476736
	and	x2, x0, 7
	add	w2, w2, 3
	mov	x1, x0
	ldrsb	w3, [x4, x3]
	cmp	w3, 0
	ccmp	w2, w3, 1, ne
	bge	.L372
	ldr	w3, [x1]
	add	x0, x25, :lo12:.LANCHOR0
	mov	x2, x26
	add	x0, x0, 2688
	mov	w1, w22
	mov	w20, 2
	bl	printf
	ldp	x25, x26, [sp, 64]
	.cfi_remember_state
	.cfi_restore 26
	.cfi_restore 25
	b	.L339
	.p2align 2,,3
.L370:
	.cfi_restore_state
	add	x0, x25, :lo12:.LANCHOR0
	mov	x2, x26
	add	x0, x0, 2816
	mov	w1, w22
	mov	w20, 2
	bl	printf
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
	b	.L339
.L359:
	mov	x0, 128
	bl	__asan_stack_malloc_1
	cmp	x0, 0
	csel	x19, x19, x0, eq
	b	.L336
.L371:
	mov	x0, 13838
	mov	x2, x24
	movk	x0, 0x45e0, lsl 16
	str	x0, [x19]
	mov	x1, 128
	mov	x0, x19
	bl	__asan_stack_free_1
	b	.L338
.L361:
	.cfi_offset 25, -160
	.cfi_offset 26, -152
	mov	x0, x26
	bl	__asan_report_load1
.L368:
	mov	x0, x3
	mov	x1, 64
	bl	__asan_report_load_n
.L367:
	mov	x1, 64
	bl	__asan_report_store_n
.L366:
	bl	__asan_report_store8
.L365:
	mov	x0, x3
	bl	__asan_report_store8
.L364:
	bl	__asan_report_store8
.L363:
	bl	__asan_report_store8
.L372:
	bl	__asan_report_load4
	.cfi_endproc
.LFE35:
	.size	roxy_mqueue_create, .-roxy_mqueue_create
	.align	2
	.p2align 4,,11
	.global	roxy_mqueue_send
	.type	roxy_mqueue_send, %function
roxy_mqueue_send:
.LASANPC36:
.LFB36:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	mov	w19, w0
	cmp	w0, 127
	bhi	.L377
	mov	w3, 80
	adrp	x0, roxy_mqueues
	add	x0, x0, :lo12:roxy_mqueues
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -8
	.cfi_offset 23, -16
	umull	x3, w19, w3
	mov	x20, x1
	mov	x24, 68719476736
	add	x23, x3, x0
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -24
	.cfi_offset 21, -32
	mov	w21, w2
	lsr	x1, x23, 3
	mov	w2, 0
	ldrsb	w1, [x1, x24]
	cmp	w1, 0
	ccmp	w2, w1, 1, ne
	bge	.L389
	ldrb	w0, [x3, x0]
	cbz	w0, .L387
	mov	w1, 1
	mov	x0, x23
	movk	w1, 0x8, lsl 16
	bl	mq_open
	mov	w22, w0
	cmn	w0, #1
	beq	.L390
	uxtw	x2, w21
	mov	x1, x20
	mov	w3, 0
	bl	mq_send
	cbnz	w0, .L391
	mov	w0, w22
	bl	mq_close
	mov	w1, w0
	mov	w0, 0
	cbnz	w1, .L392
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
.L373:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L387:
	.cfi_def_cfa_offset 64
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 23, -16
	.cfi_offset 24, -8
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
.L377:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w19
	add	x0, x0, 2944
	bl	printf
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L390:
	.cfi_def_cfa_offset 64
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 23, -16
	.cfi_offset 24, -8
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	bl	__errno_location
	lsr	x3, x0, 3
	and	x2, x0, 7
	mov	x1, x0
	add	w2, w2, 3
	ldrsb	w3, [x3, x24]
	cmp	w3, 0
	ccmp	w2, w3, 1, ne
	bge	.L393
	ldr	w3, [x1]
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	x2, x23
	add	x0, x0, 3072
	mov	w1, w19
	bl	printf
	mov	w0, 2
	ldp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	b	.L373
	.p2align 2,,3
.L391:
	.cfi_restore_state
	adrp	x4, .LANCHOR0
	add	x4, x4, :lo12:.LANCHOR0
	mov	w3, w0
	mov	x2, x23
	mov	w1, w19
	add	x0, x4, 3200
	bl	printf
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L392:
	.cfi_restore_state
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	x2, x23
	mov	w1, w19
	add	x0, x0, 2816
	bl	printf
	mov	w0, 2
	ldp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	b	.L373
.L389:
	.cfi_restore_state
	mov	x0, x23
	bl	__asan_report_load1
.L393:
	bl	__asan_report_load4
	.cfi_endproc
.LFE36:
	.size	roxy_mqueue_send, .-roxy_mqueue_send
	.align	2
	.p2align 4,,11
	.global	roxy_mqueue_receive
	.type	roxy_mqueue_receive, %function
roxy_mqueue_receive:
.LASANPC37:
.LFB37:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	mov	w19, w0
	cmp	w0, 127
	bhi	.L398
	mov	w4, 80
	adrp	x0, roxy_mqueues
	add	x0, x0, :lo12:roxy_mqueues
	str	x23, [sp, 48]
	.cfi_offset 23, -16
	umull	x4, w19, w4
	mov	x20, x1
	mov	x1, 68719476736
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -24
	.cfi_offset 21, -32
	add	x23, x4, x0
	mov	w21, w2
	mov	w2, 0
	lsr	x5, x23, 3
	ldrsb	w1, [x5, x1]
	cmp	w1, 0
	ccmp	w2, w1, 1, ne
	bge	.L411
	ldrb	w0, [x4, x0]
	cbz	w0, .L409
	cmp	w3, 1
	beq	.L412
	cbnz	w3, .L401
	mov	w1, 2048
	mov	x0, x23
	movk	w1, 0x8, lsl 16
	bl	mq_open
	mov	w22, w0
.L400:
	cmn	w22, #1
	beq	.L413
	mov	x1, x20
	uxtw	x2, w21
	mov	x3, 0
	mov	w0, w22
	bl	mq_receive
	mov	w0, w22
	bl	mq_close
	mov	w1, w0
	mov	w0, 0
	cbnz	w1, .L414
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldr	x23, [sp, 48]
	.cfi_restore 23
.L394:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L409:
	.cfi_def_cfa_offset 64
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 23, -16
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldr	x23, [sp, 48]
	.cfi_restore 23
.L398:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w19
	add	x0, x0, 2944
	bl	printf
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L401:
	.cfi_def_cfa_offset 64
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 23, -16
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	add	x0, x0, 3360
	bl	puts
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_restore 22
	.cfi_restore 21
	ldr	x23, [sp, 48]
	.cfi_restore 23
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L412:
	.cfi_restore_state
	mov	x0, x23
	mov	w1, 524288
	bl	mq_open
	mov	w22, w0
	b	.L400
	.p2align 2,,3
.L413:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	x2, x23
	mov	w1, w19
	add	x0, x0, 3456
	bl	printf
	mov	w0, 2
	ldp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_restore 22
	.cfi_restore 21
	ldr	x23, [sp, 48]
	.cfi_restore 23
	b	.L394
	.p2align 2,,3
.L414:
	.cfi_restore_state
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	x2, x23
	mov	w1, w19
	add	x0, x0, 2816
	bl	printf
	mov	w0, 2
	ldp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_restore 22
	.cfi_restore 21
	ldr	x23, [sp, 48]
	.cfi_restore 23
	b	.L394
.L411:
	.cfi_restore_state
	mov	x0, x23
	bl	__asan_report_load1
	.cfi_endproc
.LFE37:
	.size	roxy_mqueue_receive, .-roxy_mqueue_receive
	.section	.rodata.str1.8
	.align	3
.LC37:
	.string	"1 32 64 11 mqueue_attr"
	.text
	.align	2
	.p2align 4,,11
	.global	roxy_mqueue_get_pending
	.type	roxy_mqueue_get_pending, %function
roxy_mqueue_get_pending:
.LASANPC38:
.LFB38:
	.cfi_startproc
	stp	x29, x30, [sp, -208]!
	.cfi_def_cfa_offset 208
	.cfi_offset 29, -208
	.cfi_offset 30, -200
	adrp	x1, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x1, [x1, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -176
	.cfi_offset 22, -168
	mov	w21, w0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -192
	.cfi_offset 20, -184
	add	x19, sp, 80
	ldr	w0, [x1]
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -160
	.cfi_offset 24, -152
	mov	x23, x19
	cbnz	w0, .L434
.L415:
	lsr	x22, x19, 3
	mov	x24, 68719476736
	mov	x3, 35507
	add	x2, x22, x24
	movk	x3, 0x41b5, lsl 16
	adrp	x1, .LC37
	adrp	x0, .LASANPC38
	add	x1, x1, :lo12:.LC37
	add	x0, x0, :lo12:.LASANPC38
	stp	x3, x1, [x19]
	mov	w3, -235802127
	str	x0, [x19, 16]
	mov	w1, -202116109
	str	w3, [x22, x24]
	str	w1, [x2, 12]
	cmp	w21, 127
	bhi	.L422
	mov	w1, 80
	adrp	x0, roxy_mqueues
	add	x0, x0, :lo12:roxy_mqueues
	str	x25, [sp, 64]
	.cfi_offset 25, -144
	umull	x1, w21, w1
	mov	w3, 0
	add	x25, x1, x0
	lsr	x2, x25, 3
	ldrsb	w2, [x2, x24]
	cmp	w2, 0
	ccmp	w3, w2, 1, ne
	bge	.L435
	ldrb	w0, [x1, x0]
	cbz	w0, .L433
	mov	x0, x25
	mov	w1, 524288
	bl	mq_open
	mov	w20, w0
	cmn	w0, #1
	beq	.L436
	add	x20, x19, 32
	mov	x1, x20
	bl	mq_getattr
	cbnz	w0, .L437
	add	x0, x19, 56
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x24]
	cbnz	w1, .L438
	ldr	w20, [x20, 24]
	ldr	x25, [sp, 64]
	.cfi_restore 25
.L418:
	cmp	x23, x19
	bne	.L439
	mov	x0, 68719476736
	add	x1, x22, x0
	str	wzr, [x22, x0]
	str	wzr, [x1, 12]
.L417:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 208
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L433:
	.cfi_def_cfa_offset 208
	.cfi_offset 19, -192
	.cfi_offset 20, -184
	.cfi_offset 21, -176
	.cfi_offset 22, -168
	.cfi_offset 23, -160
	.cfi_offset 24, -152
	.cfi_offset 25, -144
	.cfi_offset 29, -208
	.cfi_offset 30, -200
	ldr	x25, [sp, 64]
	.cfi_restore 25
.L422:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w21
	mov	w20, -1
	add	x0, x0, 2944
	bl	printf
	b	.L418
.L436:
	.cfi_offset 25, -144
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	x2, x25
	mov	w1, w21
	add	x0, x0, 3456
	bl	printf
	ldr	x25, [sp, 64]
	.cfi_remember_state
	.cfi_restore 25
	b	.L418
.L437:
	.cfi_restore_state
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	x2, x25
	mov	w1, w21
	add	x0, x0, 3584
	mov	w20, -1
	bl	printf
	ldr	x25, [sp, 64]
	.cfi_remember_state
	.cfi_restore 25
	b	.L418
.L438:
	.cfi_restore_state
	bl	__asan_report_load8
.L435:
	mov	x0, x25
	bl	__asan_report_load1
.L434:
	.cfi_restore 25
	mov	x0, 128
	bl	__asan_stack_malloc_1
	cmp	x0, 0
	csel	x19, x19, x0, eq
	b	.L415
.L439:
	mov	x0, 13838
	mov	x2, x23
	movk	x0, 0x45e0, lsl 16
	str	x0, [x19]
	mov	x1, 128
	mov	x0, x19
	bl	__asan_stack_free_1
	b	.L417
	.cfi_endproc
.LFE38:
	.size	roxy_mqueue_get_pending, .-roxy_mqueue_get_pending
	.global	__asan_stack_malloc_0
	.section	.rodata.str1.8
	.align	3
.LC39:
	.string	"1 32 8 16 channel_name:614"
	.text
	.align	2
	.p2align 4,,11
	.global	roxy_mqueue_flush
	.type	roxy_mqueue_flush, %function
roxy_mqueue_flush:
.LASANPC39:
.LFB39:
	.cfi_startproc
	stp	x29, x30, [sp, -128]!
	.cfi_def_cfa_offset 128
	.cfi_offset 29, -128
	.cfi_offset 30, -120
	adrp	x1, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x1, [x1, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -96
	.cfi_offset 22, -88
	mov	w21, w0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -112
	.cfi_offset 20, -104
	add	x19, sp, 64
	ldr	w0, [x1]
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -80
	.cfi_offset 24, -72
	mov	x24, x19
	cbnz	w0, .L449
.L440:
	lsr	x22, x19, 3
	mov	x3, 68719476736
	mov	x2, 35507
	add	x4, x22, x3
	movk	x2, 0x41b5, lsl 16
	adrp	x1, .LC39
	adrp	x0, .LASANPC39
	add	x1, x1, :lo12:.LC39
	add	x0, x0, :lo12:.LASANPC39
	stp	x2, x1, [x19]
	mov	w5, -235802127
	str	x0, [x19, 16]
	adrp	x20, .LANCHOR0
	mov	w0, 62208
	add	x20, x20, :lo12:.LANCHOR0
	str	w5, [x22, x3]
	movk	w0, 0xf3f3, lsl 16
	add	x1, x20, 2624
	mov	w2, w21
	str	w0, [x4, 4]
	add	x23, x19, 32
	mov	x0, x23
	bl	sprintf
	mov	x0, x23
	bl	mq_unlink
	cbnz	w0, .L450
	mov	x2, x23
	mov	w1, w21
	add	x0, x20, 608
	bl	printf
.L443:
	cmp	x24, x19
	bne	.L451
	mov	x1, 68719476736
	str	xzr, [x22, x1]
.L442:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 128
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L450:
	.cfi_restore_state
	mov	w3, w0
	mov	x2, x23
	mov	w1, w21
	add	x0, x20, 480
	bl	printf
	mov	w0, 2
	b	.L443
.L449:
	mov	x0, 64
	bl	__asan_stack_malloc_0
	cmp	x0, 0
	csel	x19, x19, x0, eq
	b	.L440
.L451:
	mov	x2, 68719476736
	mov	x4, 13838
	add	x3, x22, x2
	movk	x4, 0x45e0, lsl 16
	mov	w1, 62965
	str	x4, [x19]
	bfi	w1, w1, 16, 16
	str	w1, [x22, x2]
	str	w1, [x3, 4]
	ldr	x1, [x19, 56]
	strb	wzr, [x1]
	b	.L442
	.cfi_endproc
.LFE39:
	.size	roxy_mqueue_flush, .-roxy_mqueue_flush
	.align	2
	.p2align 4,,11
	.global	roxy_event_send
	.type	roxy_event_send, %function
roxy_event_send:
.LASANPC40:
.LFB40:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	w19, w0
	cmp	w0, 127
	bhi	.L457
	mov	w20, 104
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -8
	.cfi_offset 21, -16
	adrp	x21, roxy_events
	umull	x20, w0, w20
	add	x21, x21, :lo12:roxy_events
	add	x22, x20, x21
	mov	x0, x22
	bl	pthread_mutex_lock
	uxtw	x1, w19
	mov	x3, 68719476736
	add	x19, x1, x19, uxtw 1
	mov	w2, 3
	add	x19, x1, x19, lsl 2
	lsl	x19, x19, 3
	add	x0, x19, 96
	add	x0, x0, x21
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x3]
	cmp	w1, 0
	ccmp	w2, w1, 1, ne
	bge	.L458
	add	x19, x21, x19
	add	x0, x20, 48
	add	x0, x21, x0
	str	wzr, [x19, 96]
	bl	pthread_cond_broadcast
	mov	x0, x22
	bl	pthread_mutex_unlock
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L457:
	.cfi_def_cfa_offset 48
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w19
	add	x0, x0, 3712
	bl	printf
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L458:
	.cfi_def_cfa_offset 48
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	bl	__asan_report_store4
	.cfi_endproc
.LFE40:
	.size	roxy_event_send, .-roxy_event_send
	.align	2
	.p2align 4,,11
	.global	roxy_event_receive
	.type	roxy_event_receive, %function
roxy_event_receive:
.LASANPC41:
.LFB41:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	mov	w19, w0
	cmp	w0, 127
	bhi	.L468
	mov	w20, 104
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -40
	.cfi_offset 21, -48
	adrp	x21, roxy_events
	umull	x20, w0, w20
	str	x25, [sp, 64]
	.cfi_offset 25, -16
	add	x25, x21, :lo12:roxy_events
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -24
	.cfi_offset 23, -32
	add	x24, x20, x25
	mov	x0, x24
	bl	pthread_mutex_lock
	uxtw	x0, w19
	mov	x2, 68719476736
	add	x19, x0, x19, uxtw 1
	mov	w1, 3
	add	x19, x0, x19, lsl 2
	lsl	x19, x19, 3
	add	x23, x19, 96
	add	x23, x23, x25
	lsr	x22, x23, 3
	ldrsb	w0, [x22, x2]
	cmp	w0, 0
	ccmp	w1, w0, 1, ne
	bge	.L469
	add	x0, x25, x19
	add	x20, x20, 48
	add	x20, x20, x25
	mov	w1, 1
	str	w1, [x0, 96]
	.p2align 3,,7
.L464:
	mov	x1, x24
	mov	x0, x20
	bl	pthread_cond_wait
	mov	x0, 68719476736
	mov	w2, 3
	ldrsb	w0, [x22, x0]
	cmp	w0, 0
	ccmp	w2, w0, 1, ne
	bge	.L470
	add	x0, x21, :lo12:roxy_events
	add	x0, x0, x19
	ldr	w0, [x0, 96]
	cmp	w0, 1
	beq	.L464
	mov	x0, x24
	bl	pthread_mutex_unlock
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldr	x25, [sp, 64]
	.cfi_restore 25
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L468:
	.cfi_def_cfa_offset 80
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w19
	add	x0, x0, 3712
	bl	printf
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L470:
	.cfi_def_cfa_offset 80
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	.cfi_offset 25, -16
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x0, x23
	bl	__asan_report_load4
.L469:
	mov	x0, x23
	bl	__asan_report_store4
	.cfi_endproc
.LFE41:
	.size	roxy_event_receive, .-roxy_event_receive
	.align	2
	.p2align 4,,11
	.global	roxy_signal_handler
	.type	roxy_signal_handler, %function
roxy_signal_handler:
.LASANPC42:
.LFB42:
	.cfi_startproc
	adrp	x1, .LANCHOR1
	add	x1, x1, :lo12:.LANCHOR1
	add	x1, x1, 800
	sxtw	x2, w0
	add	x0, x1, x0, sxtw 3
	mov	x3, 68719476736
	lsr	x4, x0, 3
	ldrsb	w3, [x4, x3]
	cbnz	w3, .L477
	ldr	x0, [x1, x2, lsl 3]
	cbz	x0, .L471
	mov	x16, x0
	br	x16
	.p2align 2,,3
.L471:
	ret
.L477:
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	bl	__asan_report_load8
	.cfi_endproc
.LFE42:
	.size	roxy_signal_handler, .-roxy_signal_handler
	.section	.rodata.str1.8
	.align	3
.LC41:
	.string	"1 32 152 17 signal_action:722"
	.text
	.align	2
	.p2align 4,,11
	.global	roxy_interrupt_catch
	.type	roxy_interrupt_catch, %function
roxy_interrupt_catch:
.LASANPC43:
.LFB43:
	.cfi_startproc
	stp	x29, x30, [sp, -336]!
	.cfi_def_cfa_offset 336
	.cfi_offset 29, -336
	.cfi_offset 30, -328
	adrp	x2, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x2, [x2, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -320
	.cfi_offset 20, -312
	mov	w20, w0
	stp	x21, x22, [sp, 32]
	add	x19, sp, 80
	ldr	w0, [x2]
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -304
	.cfi_offset 22, -296
	.cfi_offset 23, -288
	.cfi_offset 24, -280
	mov	x23, x19
	cbnz	w0, .L491
.L478:
	lsr	x22, x19, 3
	mov	x2, 68719476736
	add	x0, x19, 32
	add	x3, x22, x2
	mov	x6, 35507
	adrp	x5, .LC41
	movk	x6, 0x41b5, lsl 16
	add	x5, x5, :lo12:.LC41
	adrp	x4, .LASANPC43
	add	x4, x4, :lo12:.LASANPC43
	stp	x6, x5, [x19]
	mov	w6, -235802127
	lsr	x5, x0, 3
	str	x4, [x19, 16]
	mov	w4, -202116109
	str	w6, [x22, x2]
	mov	w6, -218103808
	stp	w6, w4, [x3, 20]
	add	x24, x19, 256
	str	w4, [x3, 28]
	ldrsb	w2, [x5, x2]
	cbnz	w2, .L492
	add	x21, x19, 40
	str	x1, [x19, 32]
	mov	x0, x21
	bl	sigemptyset
	mov	w1, w20
	mov	x0, x21
	bl	sigaddset
	cmp	w20, 63
	bhi	.L493
	sub	x1, x24, #224
	mov	w0, w20
	mov	x2, 0
	mov	w21, 0
	bl	sigaction
	cbnz	w0, .L494
.L481:
	cmp	x23, x19
	bne	.L495
	mov	x1, 68719476736
	add	x0, x22, x1
	str	wzr, [x22, x1]
	str	xzr, [x0, 20]
	str	wzr, [x0, 28]
.L480:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 336
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L493:
	.cfi_restore_state
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w20
	add	x0, x0, 3808
	bl	printf
	mov	w21, 0
	sub	x1, x24, #224
	mov	w0, w20
	mov	x2, 0
	bl	sigaction
	cbz	w0, .L481
.L494:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	w1, w20
	mov	w21, 2
	add	x0, x0, 3904
	bl	printf
	b	.L481
.L491:
	mov	x0, 256
	str	x1, [sp, 72]
	bl	__asan_stack_malloc_2
	cmp	x0, 0
	csel	x19, x19, x0, eq
	ldr	x1, [sp, 72]
	b	.L478
.L495:
	mov	x0, 13838
	mov	x2, x23
	movk	x0, 0x45e0, lsl 16
	str	x0, [x19]
	mov	x1, 256
	mov	x0, x19
	bl	__asan_stack_free_2
	b	.L480
.L492:
	bl	__asan_report_store8
	.cfi_endproc
.LFE43:
	.size	roxy_interrupt_catch, .-roxy_interrupt_catch
	.section	.rodata.str1.8
	.align	3
.LC44:
	.string	"src/core.c"
	.align	3
.LC45:
	.string	"roxy_interrupts"
	.align	3
.LC46:
	.string	"roxy_events"
	.align	3
.LC47:
	.string	"roxy_mqueues"
	.align	3
.LC48:
	.string	"roxy_critical_sections"
	.align	3
.LC49:
	.string	"roxy_threads"
	.align	3
.LC50:
	.string	"roxy_tasks"
	.align	3
.LC51:
	.string	"*.LC33"
	.align	3
.LC52:
	.string	"*.LC14"
	.align	3
.LC53:
	.string	"*.LC5"
	.align	3
.LC54:
	.string	"*.LC42"
	.align	3
.LC55:
	.string	"*.LC13"
	.align	3
.LC56:
	.string	"*.LC32"
	.align	3
.LC57:
	.string	"*.LC40"
	.align	3
.LC58:
	.string	"*.LC24"
	.align	3
.LC59:
	.string	"*.LC10"
	.align	3
.LC60:
	.string	"*.LC1"
	.align	3
.LC61:
	.string	"*.LC35"
	.align	3
.LC62:
	.string	"*.LC11"
	.align	3
.LC63:
	.string	"*.LC30"
	.align	3
.LC64:
	.string	"*.LC16"
	.align	3
.LC65:
	.string	"*.LC17"
	.align	3
.LC66:
	.string	"*.LC28"
	.align	3
.LC67:
	.string	"*.LC38"
	.align	3
.LC68:
	.string	"*.LC36"
	.align	3
.LC69:
	.string	"*.LC7"
	.align	3
.LC70:
	.string	"*.LC31"
	.align	3
.LC71:
	.string	"*.LC23"
	.align	3
.LC72:
	.string	"*.LC25"
	.align	3
.LC73:
	.string	"*.LC4"
	.align	3
.LC74:
	.string	"*.LC12"
	.align	3
.LC75:
	.string	"*.LC20"
	.align	3
.LC76:
	.string	"*.LC21"
	.align	3
.LC77:
	.string	"*.LC3"
	.align	3
.LC78:
	.string	"*.LC27"
	.align	3
.LC79:
	.string	"*.LC6"
	.align	3
.LC80:
	.string	"*.LC34"
	.align	3
.LC81:
	.string	"*.LC15"
	.align	3
.LC82:
	.string	"*.LC29"
	.align	3
.LC83:
	.string	"*.LC19"
	.align	3
.LC84:
	.string	"*.LC8"
	.align	3
.LC85:
	.string	"*.LC22"
	.align	3
.LC86:
	.string	"*.LC43"
	.section	.text.exit,"ax",@progbits
	.align	2
	.p2align 4,,11
	.type	_sub_D_00099_0, %function
_sub_D_00099_0:
.LFB44:
	.cfi_startproc
	adrp	x0, .LANCHOR2
	add	x0, x0, :lo12:.LANCHOR2
	add	x0, x0, 96
	mov	x1, 42
	b	__asan_unregister_globals
	.cfi_endproc
.LFE44:
	.size	_sub_D_00099_0, .-_sub_D_00099_0
	.section	.fini_array.00099,"aw"
	.align	3
	.xword	_sub_D_00099_0
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.type	_sub_I_00099_1, %function
_sub_I_00099_1:
.LFB45:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	bl	__asan_init
	bl	__asan_version_mismatch_check_v8
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	adrp	x0, .LANCHOR2
	add	x0, x0, :lo12:.LANCHOR2
	mov	x1, 42
	add	x0, x0, 96
	b	__asan_register_globals
	.cfi_endproc
.LFE45:
	.size	_sub_I_00099_1, .-_sub_I_00099_1
	.section	.init_array.00099,"aw"
	.align	3
	.xword	_sub_I_00099_1
	.section	.rodata
	.align	5
	.set	.LANCHOR0,. + 0
.LC1:
	.string	"ROXY-SYSTEM: thread_id:%d pthread_id:%lu running on os thread:%d\n"
	.zero	62
.LC0:
	.word	0
	.word	-1
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.zero	24
.LC3:
	.string	""
	.zero	63
.LC4:
	.string	"ROXY-DEBUG: Priority provided by the os: %d\n"
	.zero	51
.LC5:
	.string	"ROXY-DEBUG: Priority defined by roxy: %d\n"
	.zero	54
.LC6:
	.string	"ROXY-DEBUG: Failed to unlink the mqueue (mqueue_id=%d , channel_name=%s) error_code=%d\n"
	.zero	40
.LC7:
	.string	"ROXY-SYSTEM: Successfully unlink mqueue (mqueue_id=%d , channel_name=%s)\n"
	.zero	54
.LC8:
	.string	"ROXY-DEBUG: task_id out-of-bound or task already existed"
	.zero	39
.LC10:
	.string	"ROXY-DEBUG: Failed to start the task (task_id=%d)\n"
	.zero	45
.LC11:
	.string	"ROXY-DEBUG: The task (task_id=%d) was already started\n"
	.zero	41
.LC12:
	.string	"ROXY-DEBUG: init pthread attributes failed"
	.zero	53
.LC13:
	.string	"ROXY-DEBUG: pthread setstacksize failed"
	.zero	56
.LC14:
	.string	"ROXY-DEBUG: pthread setschedpolicy failed"
	.zero	54
.LC15:
	.string	"ROXY-DEBUG: pthread setschedparam failed"
	.zero	55
.LC16:
	.string	"ROXY-DEBUG: pthread setinheritsched failed"
	.zero	53
.LC17:
	.string	"ROXY-DEBUG: create compute pthread failed"
	.zero	54
.LC19:
	.string	"ROXY-DEBUG: Invalid wait option"
	.zero	32
.LC20:
	.string	"ROXY-DEBUG: Error occurred during wait (might be integer overflow)"
	.zero	61
.LC21:
	.string	"ROXY-DEBUG: Failed to find the task (task_id=%d)\n"
	.zero	46
.LC22:
	.string	"ROXY-DEBUG: Task must be in the loaded state to set priority, task_id=%d\n"
	.zero	54
.LC23:
	.string	"ROXY-DEBUG: Failed to lock the critical section mutex (section_id=%d)\n"
	.zero	57
.LC24:
	.string	"ROXY-DEBUG: Failed to unlock the critical section mutex (section_id=%d)\n"
	.zero	55
.LC25:
	.string	"ROXY-DEBUG: Failed to join the thread: thread_id=%lu, error_code=%d\n"
	.zero	59
.LC27:
	.string	"ROXY-DEBUG: Failed to start the message queue (mqueue_id=%d)\n"
	.zero	34
.LC28:
	.string	"ROXY-DEBUG: The message queue (mqueue_id=%d), has been initialized before\n"
	.zero	53
.LC29:
	.string	"/%x"
	.zero	60
.LC30:
	.string	"ROXY-DEBUG: Failed to create message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n"
	.zero	37
.LC31:
	.string	"ROXY-DEBUG: Failed to close message queue (mqueue_id=%d, channel_name=%s)\n"
	.zero	53
.LC32:
	.string	"ROXY-DEBUG: The message queue (mqueue_id=%d), has not been initialized before\n"
	.zero	49
.LC33:
	.string	"ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s), error_code=%d\n"
	.zero	39
.LC34:
	.string	"ROXY-DEBUG: Failed to transmit data on message queue (mqueue_id=%d, channel_name=%s) error_code=%d\n"
	.zero	60
.LC35:
	.string	"ROXY-DEBUG: Invalid blocking option at roxy_mqueue_receive"
	.zero	37
.LC36:
	.string	"ROXY-DEBUG: Failed to open message queue (mqueue_id=%d, channel_name=%s)\n"
	.zero	54
.LC38:
	.string	"ROXY-DEBUG: Failed to obtain the attribute of message queue (mqueue_id=%d, channel_name=%s)\n"
	.zero	35
.LC40:
	.string	"ROXY-DEBUG: Invalid event (event_id=%d)\n"
	.zero	55
.LC42:
	.string	"ROXY-DEBUG: Interrupt signal out of bound (signal_id=%d)\n"
	.zero	38
.LC43:
	.string	"ROXY-DEBUG: Error setting up signal handler at signal_id=%d\n"
	.zero	35
	.bss
	.align	5
	.set	.LANCHOR1,. + 0
	.type	roxy_critical_sections, %object
	.size	roxy_critical_sections, 768
roxy_critical_sections:
	.zero	768
	.zero	32
	.type	roxy_interrupts, %object
	.size	roxy_interrupts, 512
roxy_interrupts:
	.zero	512
	.zero	32
	.type	roxy_events, %object
	.size	roxy_events, 13312
roxy_events:
	.zero	13312
	.zero	32
	.type	roxy_mqueues, %object
	.size	roxy_mqueues, 10240
roxy_mqueues:
	.zero	10240
	.zero	32
	.type	roxy_threads, %object
	.size	roxy_threads, 24576
roxy_threads:
	.zero	24576
	.zero	32
	.type	roxy_tasks, %object
	.size	roxy_tasks, 9216
roxy_tasks:
	.zero	9216
	.zero	32
	.section	.data.rel.local,"aw"
	.align	3
	.set	.LANCHOR2,. + 0
	.type	.LASANLOC1, %object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.xword	.LC44
	.word	10
	.word	14
	.type	.LASANLOC2, %object
	.size	.LASANLOC2, 16
.LASANLOC2:
	.xword	.LC44
	.word	9
	.word	26
	.type	.LASANLOC3, %object
	.size	.LASANLOC3, 16
.LASANLOC3:
	.xword	.LC44
	.word	8
	.word	27
	.type	.LASANLOC4, %object
	.size	.LASANLOC4, 16
.LASANLOC4:
	.xword	.LC44
	.word	7
	.word	24
	.type	.LASANLOC5, %object
	.size	.LASANLOC5, 16
.LASANLOC5:
	.xword	.LC44
	.word	6
	.word	27
	.type	.LASANLOC6, %object
	.size	.LASANLOC6, 16
.LASANLOC6:
	.xword	.LC44
	.word	5
	.word	25
	.type	.LASAN0, %object
	.size	.LASAN0, 2688
.LASAN0:
	.xword	roxy_interrupts
	.xword	512
	.xword	544
	.xword	.LC45
	.xword	.LC44
	.xword	0
	.xword	.LASANLOC1
	.xword	0
	.xword	roxy_events
	.xword	13312
	.xword	13344
	.xword	.LC46
	.xword	.LC44
	.xword	0
	.xword	.LASANLOC2
	.xword	0
	.xword	roxy_mqueues
	.xword	10240
	.xword	10272
	.xword	.LC47
	.xword	.LC44
	.xword	0
	.xword	.LASANLOC3
	.xword	0
	.xword	roxy_critical_sections
	.xword	768
	.xword	800
	.xword	.LC48
	.xword	.LC44
	.xword	0
	.xword	.LASANLOC4
	.xword	0
	.xword	roxy_threads
	.xword	24576
	.xword	24608
	.xword	.LC49
	.xword	.LC44
	.xword	0
	.xword	.LASANLOC5
	.xword	0
	.xword	roxy_tasks
	.xword	9216
	.xword	9248
	.xword	.LC50
	.xword	.LC44
	.xword	0
	.xword	.LASANLOC6
	.xword	0
	.xword	.LC33
	.xword	89
	.xword	128
	.xword	.LC51
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC14
	.xword	42
	.xword	96
	.xword	.LC52
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC5
	.xword	42
	.xword	96
	.xword	.LC53
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC42
	.xword	58
	.xword	96
	.xword	.LC54
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC13
	.xword	40
	.xword	96
	.xword	.LC55
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC32
	.xword	79
	.xword	128
	.xword	.LC56
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC40
	.xword	41
	.xword	96
	.xword	.LC57
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC24
	.xword	73
	.xword	128
	.xword	.LC58
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC10
	.xword	51
	.xword	96
	.xword	.LC59
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC1
	.xword	66
	.xword	128
	.xword	.LC60
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC35
	.xword	59
	.xword	96
	.xword	.LC61
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC11
	.xword	55
	.xword	96
	.xword	.LC62
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC30
	.xword	91
	.xword	128
	.xword	.LC63
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC16
	.xword	43
	.xword	96
	.xword	.LC64
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC17
	.xword	42
	.xword	96
	.xword	.LC65
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC28
	.xword	75
	.xword	128
	.xword	.LC66
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC38
	.xword	93
	.xword	128
	.xword	.LC67
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC36
	.xword	74
	.xword	128
	.xword	.LC68
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC7
	.xword	74
	.xword	128
	.xword	.LC69
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC31
	.xword	75
	.xword	128
	.xword	.LC70
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC23
	.xword	71
	.xword	128
	.xword	.LC71
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC25
	.xword	69
	.xword	128
	.xword	.LC72
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC4
	.xword	45
	.xword	96
	.xword	.LC73
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC12
	.xword	43
	.xword	96
	.xword	.LC74
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC20
	.xword	67
	.xword	128
	.xword	.LC75
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC21
	.xword	50
	.xword	96
	.xword	.LC76
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC3
	.xword	1
	.xword	64
	.xword	.LC77
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC27
	.xword	62
	.xword	96
	.xword	.LC78
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC6
	.xword	88
	.xword	128
	.xword	.LC79
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC34
	.xword	100
	.xword	160
	.xword	.LC80
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC15
	.xword	41
	.xword	96
	.xword	.LC81
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC29
	.xword	4
	.xword	64
	.xword	.LC82
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC19
	.xword	32
	.xword	64
	.xword	.LC83
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC8
	.xword	57
	.xword	96
	.xword	.LC84
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC22
	.xword	74
	.xword	128
	.xword	.LC85
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC43
	.xword	61
	.xword	96
	.xword	.LC86
	.xword	.LC44
	.xword	0
	.xword	0
	.xword	0
	.zero	32
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
