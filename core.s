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
	add	x23, x0, 4
	lsr	x24, x23, 3
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	mov	x26, 68719476736
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	mov	x19, x0
	ldrsb	w0, [x24, x26]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	and	x22, x23, 7
	add	w1, w22, 3
	str	x27, [sp, 80]
	.cfi_offset 27, -16
	cmp	w0, 0
	ccmp	w1, w0, 1, ne
	bge	.L26
	ldr	w20, [x19, 4]
	bl	gettid
	adrp	x21, roxy_threads
	add	x1, x21, :lo12:roxy_threads
	ubfiz	x2, x20, 1, 32
	add	x20, x2, x20, uxtw
	add	x20, x1, x20, lsl 3
	add	x2, x20, 12
	and	x1, x2, 7
	lsr	x3, x2, 3
	add	w1, w1, 3
	ldrsb	w3, [x3, x26]
	cmp	w3, 0
	ccmp	w1, w3, 1, ne
	bge	.L27
	lsr	x27, x19, 3
	str	w0, [x20, 12]
	and	x25, x19, 7
	add	w1, w25, 3
	ldrsb	w0, [x27, x26]
	cmp	w0, 0
	ccmp	w1, w0, 1, ne
	bge	.L28
	ldr	w1, [x19]
	adrp	x20, roxy_tasks
	add	x0, x20, :lo12:roxy_tasks
	add	x1, x1, x1, lsl 3
	add	x1, x0, x1, lsl 3
	add	x0, x1, 8
	lsr	x2, x0, 3
	ldrsb	w2, [x2, x26]
	cbnz	w2, .L29
	ldr	x0, [x1, 8]
	cbz	x0, .L6
	blr	x0
.L6:
	mov	x26, 68719476736
	add	w25, w25, 3
	ldrsb	w0, [x27, x26]
	cmp	w0, 0
	ccmp	w25, w0, 1, ne
	bge	.L30
	ldr	w1, [x19]
	add	x2, x20, :lo12:roxy_tasks
	add	x3, x1, x1, lsl 3
	lsl	x3, x3, 3
	add	x0, x3, 16
	add	x0, x0, x2
	lsr	x4, x0, 3
	ldrsb	w4, [x4, x26]
	cbnz	w4, .L31
	add	x2, x2, x3
	ldr	x0, [x2, 16]
	cbz	x0, .L9
	blr	x0
	ldrsb	w0, [x27, x26]
	cmp	w0, 0
	ccmp	w25, w0, 1, ne
	bge	.L32
	ldr	w1, [x19]
.L9:
	add	x1, x1, x1, lsl 3
	add	x20, x20, :lo12:roxy_tasks
	mov	x2, 68719476736
	lsl	x1, x1, 3
	add	x0, x1, 32
	add	x0, x0, x20
	lsr	x3, x0, 3
	ldrsb	w2, [x3, x2]
	cbnz	w2, .L33
	add	x20, x20, x1
	ldr	x0, [x20, 32]
	cbz	x0, .L12
	blr	x0
.L12:
	mov	x1, 68719476736
	add	w22, w22, 3
	ldrsb	w0, [x24, x1]
	cmp	w0, 0
	ccmp	w22, w0, 1, ne
	bge	.L34
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
	bge	.L35
	mov	w1, 2
	mov	x0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	str	w1, [x21, 8]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
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
.L26:
	.cfi_restore_state
	mov	x0, x23
	bl	__asan_report_load4
.L35:
	bl	__asan_report_store4
.L34:
	mov	x0, x23
	bl	__asan_report_load4
.L33:
	bl	__asan_report_load8
.L31:
	bl	__asan_report_load8
.L30:
	mov	x0, x19
	bl	__asan_report_load4
.L29:
	bl	__asan_report_load8
.L28:
	mov	x0, x19
	bl	__asan_report_load4
.L27:
	mov	x0, x2
	bl	__asan_report_store4
.L32:
	mov	x0, x19
	bl	__asan_report_load4
	.cfi_endproc
.LFE27:
	.size	roxy_thread_runner, .-roxy_thread_runner
	.global	__asan_stack_malloc_2
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"1 48 72 15 default_task:52"
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
	stp	x29, x30, [sp, -240]!
	.cfi_def_cfa_offset 240
	.cfi_offset 29, -240
	.cfi_offset 30, -232
	adrp	x0, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x0, [x0, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -224
	.cfi_offset 20, -216
	add	x20, sp, 80
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -208
	.cfi_offset 22, -200
	mov	x22, x20
	ldr	w0, [x0]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	.cfi_offset 23, -192
	.cfi_offset 24, -184
	.cfi_offset 25, -176
	.cfi_offset 26, -168
	cbnz	w0, .L61
.L36:
	lsr	x21, x20, 3
	mov	x23, 68719476736
	mov	x3, 35507
	add	x1, x21, x23
	movk	x3, 0x41b5, lsl 16
	adrp	x2, .LC1
	adrp	x0, .LASANPC24
	add	x2, x2, :lo12:.LC1
	add	x0, x0, :lo12:.LASANPC24
	stp	x3, x2, [x20]
	mov	w5, -235802127
	str	x0, [x20, 16]
	mov	w4, 61937
	str	w5, [x21, x23]
	mov	w3, -218103808
	mov	w2, -202116109
	str	w4, [x1, 4]
	stp	w3, w2, [x1, 12]
	mov	w0, 8080
	adrp	x19, .LANCHOR0
	bl	srand
	add	x1, x19, :lo12:.LANCHOR0
	adrp	x0, roxy_tasks
	add	x0, x0, :lo12:roxy_tasks
	mov	x3, 9216
	add	x2, x20, 48
	add	x15, x0, x3
	ldp	x10, x11, [x1]
	mov	w14, 0
	ldp	x8, x9, [x1, 16]
	ldp	x6, x7, [x1, 32]
	ldp	x4, x5, [x1, 48]
	ldr	x12, [x1, 64]
	.p2align 3,,7
.L41:
	add	x1, x0, 71
	and	w13, w1, 7
	lsr	x3, x0, 3
	lsr	x1, x1, 3
	stp	x10, x11, [x2]
	ldrsb	w3, [x3, x23]
	ldrsb	w1, [x1, x23]
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
	cbnz	w1, .L62
	add	x0, x0, 72
	stp	x10, x11, [x0, -72]
	stp	x8, x9, [x0, -56]
	stp	x6, x7, [x0, -40]
	stp	x4, x5, [x0, -24]
	str	x12, [x0, -8]
	cmp	x0, x15
	bne	.L41
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
.L44:
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x4]
	cmp	w1, 0
	ccmp	w7, w1, 1, ne
	bge	.L63
	mov	x1, x0
	str	wzr, [x1], 4
	lsr	x3, x1, 3
	and	x2, x1, 7
	add	w2, w2, 3
	ldrsb	w3, [x3, x4]
	cmp	w3, 0
	ccmp	w2, w3, 1, ne
	bge	.L64
	add	x0, x0, 24
	str	w6, [x0, -20]
	cmp	x0, x5
	bne	.L44
	adrp	x23, .LANCHOR1
	add	x24, x23, :lo12:.LANCHOR1
	add	x25, x24, 768
	.p2align 3,,7
.L45:
	mov	x0, x24
	mov	x1, 0
	add	x24, x24, 48
	bl	pthread_mutex_init
	cmp	x24, x25
	bne	.L45
	add	x24, x19, :lo12:.LANCHOR0
	adrp	x0, roxy_mqueues
	add	x19, x0, :lo12:roxy_mqueues
	mov	x1, 10240
	add	x24, x24, 96
	add	x25, x19, x1
	.p2align 3,,7
.L46:
	mov	x0, x19
	mov	x1, x24
	add	x19, x19, 80
	mov	x2, 1
	bl	memcpy
	cmp	x19, x25
	bne	.L46
	adrp	x24, roxy_events
	add	x24, x24, :lo12:roxy_events
	mov	x0, 13408
	adrp	x19, roxy_events+96
	add	x24, x24, x0
	add	x19, x19, :lo12:roxy_events+96
	mov	x26, 68719476736
	mov	w25, 3
	.p2align 3,,7
.L48:
	mov	x1, 0
	sub	x0, x19, #96
	bl	pthread_mutex_init
	sub	x0, x19, #48
	mov	x1, 0
	bl	pthread_cond_init
	lsr	x0, x19, 3
	ldrsb	w0, [x0, x26]
	cmp	w0, 0
	ccmp	w25, w0, 1, ne
	bge	.L65
	str	wzr, [x19], 104
	cmp	x19, x24
	bne	.L48
	add	x2, x23, :lo12:.LANCHOR1
	mov	x19, 68719476736
	add	x0, x2, 800
	add	x2, x2, 1312
	.p2align 3,,7
.L50:
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x19]
	cbnz	w1, .L66
	str	xzr, [x0], 8
	cmp	x0, x2
	bne	.L50
	mov	w0, 2
	bl	sched_get_priority_max
	mov	w23, w0
	mov	w0, 2
	bl	sched_get_priority_min
	sub	w23, w23, w0
	cmp	w23, 63
	cset	w23, le
	cmp	x22, x20
	bne	.L67
	add	x0, x21, x19
	str	xzr, [x21, x19]
	str	xzr, [x0, 12]
.L38:
	mov	w0, w23
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 240
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
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
.L62:
	.cfi_restore_state
	mov	x1, 72
	bl	__asan_report_store_n
.L65:
	mov	x0, x19
	bl	__asan_report_store4
.L64:
	mov	x0, x1
	bl	__asan_report_store4
.L63:
	bl	__asan_report_store4
.L66:
	bl	__asan_report_store8
.L61:
	mov	x0, 160
	bl	__asan_stack_malloc_2
	cmp	x0, 0
	csel	x20, x20, x0, eq
	b	.L36
.L67:
	mov	x0, 13838
	mov	x2, x22
	movk	x0, 0x45e0, lsl 16
	str	x0, [x20]
	mov	x1, 160
	mov	x0, x20
	bl	__asan_stack_free_2
	b	.L38
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
	mov	x0, 10240
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	adrp	x19, roxy_mqueues
	add	x19, x19, :lo12:roxy_mqueues
	str	x23, [sp, 48]
	.cfi_offset 23, -16
	adrp	x23, .LANCHOR0
	add	x23, x23, :lo12:.LANCHOR0
	mov	w20, 0
	add	x23, x23, 96
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	add	x22, x19, x0
	mov	x21, 68719476736
	b	.L72
	.p2align 2,,3
.L70:
	add	x19, x19, 80
	cmp	x19, x22
	beq	.L68
.L72:
	lsr	x0, x19, 3
	ldrsb	w0, [x0, x21]
	cmp	w0, 0
	ccmp	w20, w0, 1, ne
	bge	.L78
	ldrb	w0, [x19]
	cbz	w0, .L70
	mov	x0, x19
	bl	mq_unlink
	cbnz	w0, .L79
	mov	x0, x19
	mov	x1, x23
	mov	x2, 1
	add	x19, x19, 80
	bl	memcpy
	cmp	x19, x22
	bne	.L72
.L68:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L79:
	.cfi_restore_state
	mov	w0, 2
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L78:
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
	cmp	w0, 127
	bhi	.L93
	ubfiz	x7, x0, 3, 32
	adrp	x6, roxy_tasks
	add	x0, x7, x0, uxtw
	add	x7, x6, :lo12:roxy_tasks
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x9, 68719476736
	lsl	x6, x0, 3
	add	x8, x6, x7
	mov	x29, sp
	mov	w10, 3
	lsr	x0, x8, 3
	ldrsb	w0, [x0, x9]
	cmp	w0, 0
	ccmp	w10, w0, 1, ne
	bge	.L94
	ldr	w0, [x7, x6]
	cbz	w0, .L95
	mov	w0, 2
	ldp	x29, x30, [sp], 16
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L95:
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
	bge	.L96
	add	x10, x8, 8
	str	w1, [x8, 4]
	lsr	x1, x10, 3
	ldrsb	w1, [x1, x9]
	cbnz	w1, .L97
	add	x1, x6, 16
	str	x2, [x8, 8]
	add	x1, x1, x7
	lsr	x2, x1, 3
	ldrsb	w2, [x2, x9]
	cbnz	w2, .L98
	add	x6, x6, 32
	add	x6, x6, x7
	lsr	x2, x6, 3
	ldrsb	w2, [x2, x9]
	str	x3, [x8, 16]
	cbnz	w2, .L99
	add	x1, x1, 8
	lsr	x2, x1, 3
	ldrsb	w2, [x2, x9]
	str	x4, [x8, 32]
	cbnz	w2, .L100
	str	x5, [x8, 24]
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L93:
	mov	w0, 2
	ret
.L94:
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x0, x8
	bl	__asan_report_load4
.L96:
	mov	x0, x11
	bl	__asan_report_store4
.L97:
	mov	x0, x10
	bl	__asan_report_store8
.L98:
	mov	x0, x1
	bl	__asan_report_store8
.L99:
	mov	x0, x6
	bl	__asan_report_store8
.L100:
	mov	x0, x1
	bl	__asan_report_store8
	.cfi_endproc
.LFE26:
	.size	roxy_task_create, .-roxy_task_create
	.global	__asan_stack_malloc_3
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"3 48 4 15 scheduler_param 64 64 11 thread_attr 160 128 10 cpuset:219"
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
	stp	w1, w0, [sp, 96]
	stp	x19, x20, [sp, 16]
	ldr	w0, [x2]
	stp	x25, x26, [sp, 64]
	.cfi_offset 19, -496
	.cfi_offset 20, -488
	.cfi_offset 25, -448
	.cfi_offset 26, -440
	add	x25, sp, 192
	str	x25, [sp, 160]
	cbnz	w0, .L149
.L101:
	lsr	x6, x25, 3
	mov	x3, 68719476736
	mov	x4, 35507
	add	x0, x6, x3
	str	x6, [sp, 168]
	movk	x4, 0x41b5, lsl 16
	adrp	x2, .LC3
	adrp	x1, .LASANPC28
	add	x2, x2, :lo12:.LC3
	add	x1, x1, :lo12:.LASANPC28
	stp	x4, x2, [x25]
	mov	w5, -235802127
	mov	w4, 61937
	str	x1, [x25, 16]
	movk	w4, 0xf204, lsl 16
	str	w5, [x6, x3]
	mov	w2, 62194
	str	w4, [x0, 4]
	add	x4, x25, 320
	str	x4, [sp, 112]
	movk	w2, 0xf2f2, lsl 16
	mov	w1, -202116109
	str	w2, [x0, 16]
	str	w1, [x0, 36]
	ldr	w0, [sp, 100]
	cmp	w0, 128
	bhi	.L138
	uxtw	x1, w0
	str	x1, [sp, 176]
	add	x0, x1, x0, uxtw 3
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
	bge	.L150
	ldr	w0, [x1, x2]
	cmp	w0, 0
	ldr	w0, [sp, 96]
	ccmp	w0, 8, 2, ne
	bhi	.L138
	add	x0, x1, x2
	add	x0, x0, 40
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x3]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L151
	ldr	x0, [sp, 152]
	ldr	w0, [x0, 40]
	cmn	w0, #1
	bne	.L138
	add	x0, x1, x2
	add	x0, x0, 44
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x3]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L152
	ldr	x0, [sp, 152]
	ldr	w0, [x0, 44]
	cmn	w0, #1
	bne	.L138
	add	x0, x1, x2
	add	x0, x0, 48
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x3]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L153
	ldr	x0, [sp, 152]
	ldr	w0, [x0, 48]
	cmn	w0, #1
	bne	.L138
	add	x0, x1, x2
	add	x0, x0, 52
	and	x1, x0, 7
	lsr	x2, x0, 3
	add	w1, w1, 3
	ldrsb	w2, [x2, x3]
	cmp	w2, 0
	ccmp	w1, w2, 1, ne
	bge	.L154
	ldr	x0, [sp, 176]
	adrp	x1, roxy_tasks
	add	x1, x1, :lo12:roxy_tasks
	add	x0, x0, x0, lsl 3
	lsl	x2, x0, 3
	add	x3, x1, x2
	ldr	w0, [x3, 52]
	cmn	w0, #1
	bne	.L138
	add	x0, x3, 56
	mov	x19, 68719476736
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x19]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L155
	ldr	w0, [x3, 56]
	cmn	w0, #1
	bne	.L138
	add	x0, x1, x2
	add	x0, x0, 60
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x19]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L156
	ldr	w0, [x3, 60]
	cmn	w0, #1
	bne	.L138
	add	x0, x1, x2
	add	x0, x0, 64
	and	x4, x0, 7
	lsr	x5, x0, 3
	add	w4, w4, 3
	ldrsb	w5, [x5, x19]
	cmp	w5, 0
	ccmp	w4, w5, 1, ne
	bge	.L157
	ldr	w0, [x3, 64]
	cmn	w0, #1
	bne	.L138
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
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -424
	.cfi_offset 27, -432
	add	w1, w1, 3
	ldrsb	w2, [x2, x19]
	cmp	w2, 0
	ccmp	w1, w2, 1, ne
	bge	.L158
	ldr	w0, [x3, 68]
	cmn	w0, #1
	bne	.L139
	add	x20, x25, 160
	add	x0, x25, 168
	mov	x2, 120
	mov	w1, 0
	str	x20, [sp, 144]
	bl	memset
	lsr	x0, x20, 3
	ldrsb	w0, [x0, x19]
	cbnz	w0, .L159
	mov	x0, 3
	str	x0, [x25, 160]
	ldr	w0, [sp, 96]
	cbz	w0, .L116
	ldr	w4, [sp, 100]
	mov	w24, 72
	ldr	x0, [sp, 176]
	mov	x1, 40
	adrp	x3, roxy_tasks
	add	x3, x3, :lo12:roxy_tasks
	umaddl	x24, w4, w24, x1
	add	x23, x25, 64
	add	x0, x0, x0, lsl 3
	add	x27, x25, 48
	add	x24, x24, x3
	mov	w28, 0
	lsl	x0, x0, 3
	stp	x3, x0, [sp, 120]
	add	x0, x3, x0
	str	x0, [sp, 136]
	.p2align 3,,7
.L128:
	lsr	x1, x23, 3
	mov	x20, 68719476736
	add	x3, x1, x20
	lsr	x19, x27, 3
	mov	w2, 4
	mov	x0, x23
	str	wzr, [x1, x20]
	str	wzr, [x3, 4]
	strb	w2, [x19, x20]
	bl	pthread_attr_init
	cbnz	w0, .L139
	mov	x0, x23
	mov	x1, 131072
	bl	pthread_attr_setstacksize
	cbnz	w0, .L139
	mov	x0, x23
	mov	w1, 2
	bl	pthread_attr_setschedpolicy
	cbnz	w0, .L139
	ldr	x0, [sp, 136]
	add	x0, x0, 4
	and	x1, x0, 7
	lsr	x2, x0, 3
	add	w1, w1, 3
	ldrsb	w2, [x2, x20]
	cmp	w2, 0
	ccmp	w1, w2, 1, ne
	bge	.L160
	ldp	x0, x2, [sp, 120]
	mov	w22, 3
	ldrsb	w1, [x19, x20]
	cmp	w1, 0
	ccmp	w22, w1, 1, ne
	add	x0, x0, x2
	ldr	w3, [x0, 4]
	bge	.L161
	ldr	x0, [sp, 112]
	mov	x1, x27
	sub	x2, x0, #16384
	mov	x0, x23
	str	w3, [x2, 16112]
	bl	pthread_attr_setschedparam
	cbnz	w0, .L139
	mov	x0, x23
	mov	w1, 1
	bl	pthread_attr_setinheritsched
	cbnz	w0, .L139
	adrp	x21, roxy_threads
	mov	w19, 100
	add	x21, x21, :lo12:roxy_threads
	b	.L127
	.p2align 2,,3
.L121:
	subs	w19, w19, #1
	beq	.L126
.L127:
	bl	rand
	negs	w4, w0
	and	w4, w4, 1023
	and	w0, w0, 1023
	csneg	w26, w0, w4, mi
	sbfiz	x1, x26, 1, 32
	add	x1, x1, x26, sxtw
	lsl	x1, x1, 3
	add	x5, x1, x21
	add	x0, x5, 8
	lsr	x2, x0, 3
	ldrsb	w2, [x2, x20]
	cmp	w2, 0
	ccmp	w22, w2, 1, ne
	bge	.L162
	ldr	w0, [x5, 8]
	cbnz	w0, .L121
	add	x0, x1, 16
	mov	w1, 1
	add	x0, x0, x21
	str	w1, [x5, 8]
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x20]
	cmp	w1, 0
	ccmp	w22, w1, 1, ne
	bge	.L163
	add	x0, x0, 4
	ldr	w1, [sp, 100]
	lsr	x2, x0, 3
	ldrsb	w2, [x2, x20]
	str	w1, [x5, 16]
	and	x1, x0, 7
	cmp	w2, 0
	add	w1, w1, 3
	ccmp	w1, w2, 1, ne
	bge	.L164
	mov	w0, 24
	str	w26, [x5, 20]
	adrp	x2, roxy_thread_runner
	mov	x1, x23
	smull	x0, w26, w0
	add	x2, x2, :lo12:roxy_thread_runner
	str	x5, [sp, 104]
	add	x3, x0, 16
	add	x0, x21, x0
	add	x3, x21, x3
	bl	pthread_create
	cbnz	w0, .L139
	ldr	x5, [sp, 104]
	lsr	x0, x5, 3
	ldrsb	w0, [x0, x20]
	cbnz	w0, .L165
	ldr	x0, [x5]
	mov	x1, 128
	ldr	x2, [sp, 144]
	bl	pthread_setaffinity_np
	lsr	x1, x24, 3
	and	x0, x24, 7
	add	w0, w0, 3
	ldrsb	w1, [x1, x20]
	cmp	w1, 0
	ccmp	w0, w1, 1, ne
	bge	.L166
	str	w26, [x24]
.L126:
	lsr	x3, x23, 3
	mov	x0, 68719476736
	add	x4, x3, x0
	lsr	x1, x27, 3
	mov	w2, -117901064
	add	w28, w28, 1
	str	w2, [x3, x0]
	mov	w3, -8
	str	w2, [x4, 4]
	add	x24, x24, 4
	strb	w3, [x1, x0]
	ldr	w0, [sp, 96]
	cmp	w0, w28
	bne	.L128
.L116:
	ldr	x2, [sp, 184]
	mov	x0, 68719476736
	mov	w1, 3
	ldrsb	w0, [x2, x0]
	cmp	w0, 0
	ccmp	w1, w0, 1, ne
	bge	.L167
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
	ldp	x27, x28, [sp, 80]
	.cfi_restore 28
	.cfi_restore 27
	str	w2, [x1, x0]
	b	.L104
	.p2align 2,,3
.L138:
	mov	w19, 2
.L104:
	ldr	x0, [sp, 160]
	cmp	x0, x25
	bne	.L168
	ldr	x1, [sp, 168]
	mov	x0, 68719476736
	add	x0, x1, x0
	stp	xzr, xzr, [x0]
	str	wzr, [x0, 16]
	str	wzr, [x0, 36]
.L103:
	mov	w0, w19
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x25, x26, [sp, 64]
	add	sp, sp, 512
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L139:
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
	mov	w19, 2
	ldp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldp	x27, x28, [sp, 80]
	.cfi_restore 28
	.cfi_restore 27
	b	.L104
.L162:
	.cfi_restore_state
	bl	__asan_report_load4
.L167:
	ldr	x0, [sp, 152]
	bl	__asan_report_store4
.L149:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 27
	.cfi_restore 28
	mov	x0, 320
	bl	__asan_stack_malloc_3
	cmp	x0, 0
	csel	x25, x25, x0, eq
	b	.L101
.L168:
	mov	x0, 13838
	mov	x1, 320
	movk	x0, 0x45e0, lsl 16
	str	x0, [x25]
	mov	x0, x25
	ldr	x2, [sp, 160]
	bl	__asan_stack_free_3
	b	.L103
.L151:
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -424
	.cfi_offset 27, -432
	bl	__asan_report_load4
.L152:
	.cfi_restore_state
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -424
	.cfi_offset 27, -432
	bl	__asan_report_load4
.L153:
	.cfi_restore_state
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -424
	.cfi_offset 27, -432
	bl	__asan_report_load4
.L154:
	.cfi_restore_state
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -424
	.cfi_offset 27, -432
	bl	__asan_report_load4
.L155:
	.cfi_restore_state
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -424
	.cfi_offset 27, -432
	bl	__asan_report_load4
.L156:
	.cfi_restore_state
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -424
	.cfi_offset 27, -432
	bl	__asan_report_load4
.L164:
	bl	__asan_report_store4
.L165:
	mov	x0, x5
	bl	__asan_report_load8
.L166:
	mov	x0, x24
	bl	__asan_report_store4
.L150:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 27
	.cfi_restore 28
	ldr	x0, [sp, 152]
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -424
	.cfi_offset 27, -432
	bl	__asan_report_load4
.L160:
	bl	__asan_report_load4
.L161:
	mov	x0, x27
	bl	__asan_report_store4
.L163:
	bl	__asan_report_store4
.L159:
	ldr	x0, [sp, 144]
	bl	__asan_report_store8
.L157:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 27
	.cfi_restore 28
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -472
	.cfi_offset 21, -480
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -456
	.cfi_offset 23, -464
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -424
	.cfi_offset 27, -432
	bl	__asan_report_load4
.L158:
	bl	__asan_report_load4
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
.LC4:
	.string	"2 32 16 7 req:318 64 16 7 rem:318"
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
	cbnz	w0, .L187
.L170:
	mov	x2, x19
	lsr	x21, x19, 3
	mov	x0, 35507
	mov	x3, 68719476736
	movk	x0, 0x41b5, lsl 16
	add	x5, x21, x3
	str	x0, [x2], 96
	adrp	x4, .LC4
	adrp	x0, .LASANPC30
	add	x4, x4, :lo12:.LC4
	add	x0, x0, :lo12:.LASANPC30
	stp	x4, x0, [x19, 8]
	mov	w6, -235802127
	str	w6, [x21, x3]
	mov	w4, -219021312
	mov	w0, -202178560
	stp	w4, w0, [x5, 4]
	cbnz	w1, .L174
	add	x4, x19, 40
	uxtw	x0, w20
	add	x1, x19, 32
	lsr	x5, x4, 3
	ldrsb	w5, [x5, x3]
	cbnz	w5, .L188
	lsr	x4, x1, 3
	str	x0, [x2, -56]
	ldrsb	w0, [x4, x3]
	cbnz	w0, .L189
	sub	x1, x2, #32
	sub	x0, x2, #64
	str	xzr, [x2, -64]
	bl	nanosleep
	mov	w1, w0
	mov	w0, 0
	cmn	w1, #1
	beq	.L178
.L173:
	cmp	x22, x19
	bne	.L190
	mov	x1, 68719476736
	add	x2, x21, x1
	str	xzr, [x21, x1]
	str	wzr, [x2, 8]
.L172:
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
.L174:
	.cfi_restore_state
	cmp	w1, 1
	bne	.L178
	add	x0, x19, 40
	add	x1, x19, 32
	lsr	x4, x0, 3
	ldrsb	w4, [x4, x3]
	cbnz	w4, .L191
	lsr	x4, x1, 3
	uxtw	x0, w20
	ldrsb	w3, [x4, x3]
	str	xzr, [x2, -56]
	cbnz	w3, .L192
	sub	x1, x2, #32
	str	x0, [x2, -64]
	sub	x0, x2, #64
	bl	nanosleep
	mov	w1, w0
	mov	w0, 0
	cmn	w1, #1
	bne	.L173
	.p2align 3,,7
.L178:
	mov	w0, 2
	b	.L173
.L188:
	mov	x0, x4
	bl	__asan_report_store8
.L187:
	mov	x0, 96
	str	w1, [sp, 60]
	bl	__asan_stack_malloc_1
	cmp	x0, 0
	ldr	w1, [sp, 60]
	csel	x19, x19, x0, eq
	b	.L170
.L190:
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
	b	.L172
.L191:
	bl	__asan_report_store8
.L192:
	mov	x0, x1
	bl	__asan_report_store8
.L189:
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
	cmp	w0, 127
	bhi	.L198
	ubfiz	x3, x0, 3, 32
	adrp	x2, roxy_tasks
	add	x0, x3, x0, uxtw
	add	x2, x2, :lo12:roxy_tasks
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x5, 68719476736
	lsl	x0, x0, 3
	add	x4, x0, x2
	mov	x29, sp
	mov	w6, 3
	lsr	x3, x4, 3
	ldrsb	w3, [x3, x5]
	cmp	w3, 0
	ccmp	w6, w3, 1, ne
	bge	.L202
	ldr	w0, [x2, x0]
	cmp	w0, 1
	beq	.L203
	mov	w0, 2
	ldp	x29, x30, [sp], 16
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L203:
	.cfi_restore_state
	add	x0, x4, 4
	and	x2, x0, 7
	lsr	x3, x0, 3
	add	w2, w2, 3
	ldrsb	w3, [x3, x5]
	cmp	w3, 0
	ccmp	w2, w3, 1, ne
	bge	.L204
	str	w1, [x4, 4]
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L198:
	mov	w0, 2
	ret
.L202:
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x0, x4
	bl	__asan_report_load4
.L204:
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
	bhi	.L211
	adrp	x1, .LANCHOR1
	add	x1, x1, :lo12:.LANCHOR1
	mov	w2, 48
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	umaddl	x0, w0, w2, x1
	mov	x29, sp
	bl	pthread_mutex_lock
	mov	w1, w0
	mov	w0, 0
	cbz	w1, .L205
	mov	w0, 2
.L205:
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L211:
	mov	w0, 2
	ret
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
	bhi	.L221
	adrp	x1, .LANCHOR1
	add	x1, x1, :lo12:.LANCHOR1
	mov	w2, 48
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	umaddl	x0, w0, w2, x1
	mov	x29, sp
	bl	pthread_mutex_unlock
	mov	w1, w0
	mov	w0, 0
	cbz	w1, .L215
	mov	w0, 2
.L215:
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L221:
	mov	w0, 2
	ret
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
	cmp	w0, 127
	bhi	.L282
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x2, 68719476736
	mov	w5, 3
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	uxtw	x19, w0
	add	x0, x19, x0, uxtw 3
	adrp	x20, roxy_tasks
	add	x1, x20, :lo12:roxy_tasks
	lsl	x0, x0, 3
	add	x4, x0, x1
	lsr	x3, x4, 3
	ldrsb	w3, [x3, x2]
	cmp	w3, 0
	ccmp	w5, w3, 1, ne
	bge	.L292
	ldr	w3, [x1, x0]
	cbz	w3, .L226
	add	x0, x1, x0
	add	x0, x0, 40
	and	x1, x0, 7
	lsr	x3, x0, 3
	add	w1, w1, 3
	ldrsb	w3, [x3, x2]
	cmp	w3, 0
	ccmp	w1, w3, 1, ne
	bge	.L293
	ldr	w0, [x4, 40]
	cmn	w0, #1
	bne	.L294
.L229:
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
	bge	.L295
	add	x1, x2, x1
	ldr	w0, [x1, 44]
	cmn	w0, #1
	bne	.L296
.L232:
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
	bge	.L297
	add	x1, x2, x1
	ldr	w0, [x1, 48]
	cmn	w0, #1
	bne	.L298
.L235:
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
	bge	.L299
	add	x1, x2, x1
	ldr	w0, [x1, 52]
	cmn	w0, #1
	bne	.L300
.L238:
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
	bge	.L301
	add	x1, x2, x1
	ldr	w0, [x1, 56]
	cmn	w0, #1
	bne	.L302
.L241:
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
	bge	.L303
	add	x1, x2, x1
	ldr	w0, [x1, 60]
	cmn	w0, #1
	bne	.L304
.L244:
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
	bge	.L305
	add	x1, x2, x1
	ldr	w0, [x1, 64]
	cmn	w0, #1
	bne	.L306
.L247:
	add	x19, x19, x19, lsl 3
	add	x20, x20, :lo12:roxy_tasks
	mov	x3, 68719476736
	lsl	x19, x19, 3
	add	x0, x20, x19
	add	x0, x0, 68
	and	x1, x0, 7
	lsr	x2, x0, 3
	add	w1, w1, 3
	ldrsb	w2, [x2, x3]
	cmp	w2, 0
	ccmp	w1, w2, 1, ne
	bge	.L307
	add	x20, x20, x19
	ldr	w0, [x20, 68]
	cmn	w0, #1
	bne	.L250
.L253:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L294:
	.cfi_restore_state
	ubfiz	x3, x0, 1, 32
	adrp	x1, roxy_threads
	add	x0, x3, x0, uxtw
	add	x1, x1, :lo12:roxy_threads
	lsl	x0, x0, 3
	add	x3, x0, x1
	lsr	x4, x3, 3
	ldrsb	w2, [x4, x2]
	cbnz	w2, .L308
	ldr	x0, [x1, x0]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L229
	.p2align 3,,7
.L226:
	mov	w0, 2
.L310:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L296:
	.cfi_restore_state
	ubfiz	x2, x0, 1, 32
	adrp	x1, roxy_threads
	add	x0, x2, x0, uxtw
	add	x1, x1, :lo12:roxy_threads
	lsl	x0, x0, 3
	add	x2, x0, x1
	lsr	x3, x2, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L309
	ldr	x0, [x1, x0]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L232
	mov	w0, 2
	b	.L310
	.p2align 2,,3
.L298:
	ubfiz	x1, x0, 1, 32
	adrp	x2, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x2, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L311
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L235
	mov	w0, 2
	b	.L310
	.p2align 2,,3
.L300:
	ubfiz	x1, x0, 1, 32
	adrp	x2, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x2, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L312
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L238
	mov	w0, 2
	b	.L310
	.p2align 2,,3
.L302:
	ubfiz	x1, x0, 1, 32
	adrp	x2, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x2, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L313
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L241
	mov	w0, 2
	b	.L310
	.p2align 2,,3
.L304:
	ubfiz	x1, x0, 1, 32
	adrp	x2, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x2, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L314
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L244
	mov	w0, 2
	b	.L310
	.p2align 2,,3
.L306:
	ubfiz	x1, x0, 1, 32
	adrp	x2, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x2, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x5]
	cbnz	w3, .L315
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L247
	mov	w0, 2
	b	.L310
	.p2align 2,,3
.L250:
	ubfiz	x1, x0, 1, 32
	adrp	x2, roxy_threads
	add	x0, x1, x0, uxtw
	add	x2, x2, :lo12:roxy_threads
	lsl	x1, x0, 3
	add	x0, x1, x2
	lsr	x4, x0, 3
	ldrsb	w3, [x4, x3]
	cbnz	w3, .L316
	ldr	x0, [x2, x1]
	mov	x1, 0
	bl	pthread_join
	cbz	w0, .L253
	mov	w0, 2
	b	.L310
	.p2align 2,,3
.L282:
	.cfi_def_cfa_offset 0
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	mov	w0, 2
	ret
.L295:
	.cfi_def_cfa_offset 32
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	bl	__asan_report_load4
.L305:
	bl	__asan_report_load4
.L297:
	bl	__asan_report_load4
.L299:
	bl	__asan_report_load4
.L301:
	bl	__asan_report_load4
.L303:
	bl	__asan_report_load4
.L307:
	bl	__asan_report_load4
.L292:
	mov	x0, x4
	bl	__asan_report_load4
.L293:
	bl	__asan_report_load4
.L312:
	bl	__asan_report_load8
.L313:
	bl	__asan_report_load8
.L314:
	bl	__asan_report_load8
.L315:
	bl	__asan_report_load8
.L309:
	mov	x0, x2
	bl	__asan_report_load8
.L311:
	bl	__asan_report_load8
.L308:
	mov	x0, x3
	bl	__asan_report_load8
.L316:
	bl	__asan_report_load8
	.cfi_endproc
.LFE34:
	.size	roxy_loop, .-roxy_loop
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"1 32 64 15 mqueue_attr:475"
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
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -208
	.cfi_offset 20, -200
	mov	w20, w0
	stp	x21, x22, [sp, 32]
	add	x19, sp, 96
	ldr	w0, [x3]
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -192
	.cfi_offset 22, -184
	.cfi_offset 23, -176
	.cfi_offset 24, -168
	mov	x24, x19
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -160
	.cfi_offset 26, -152
	uxtw	x26, w1
	uxtw	x25, w2
	cbnz	w0, .L342
.L317:
	lsr	x23, x19, 3
	mov	x21, 68719476736
	mov	x3, 35507
	add	x2, x23, x21
	movk	x3, 0x41b5, lsl 16
	adrp	x1, .LC5
	adrp	x0, .LASANPC35
	add	x1, x1, :lo12:.LC5
	add	x0, x0, :lo12:.LASANPC35
	stp	x3, x1, [x19]
	mov	w3, -235802127
	str	x0, [x19, 16]
	mov	w1, -202116109
	str	w3, [x23, x21]
	str	w1, [x2, 12]
	cmp	w20, 127
	bhi	.L321
	mov	w0, 80
	adrp	x22, roxy_mqueues
	add	x22, x22, :lo12:roxy_mqueues
	str	x27, [sp, 80]
	.cfi_offset 27, -144
	umull	x0, w20, w0
	mov	w2, 0
	add	x27, x0, x22
	lsr	x1, x27, 3
	ldrsb	w1, [x1, x21]
	cmp	w1, 0
	ccmp	w2, w1, 1, ne
	bge	.L343
	ldrb	w0, [x0, x22]
	cbnz	w0, .L340
	adrp	x1, .LANCHOR0
	add	x1, x1, :lo12:.LANCHOR0
	add	x1, x1, 160
	mov	w2, w20
	mov	x0, x27
	bl	sprintf
	add	x0, x19, 40
	add	x3, x19, 32
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x21]
	cbnz	w1, .L344
	add	x0, x19, 48
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x21]
	str	x26, [x3, 8]
	cbnz	w1, .L345
	lsr	x4, x3, 3
	ldrsb	w0, [x4, x21]
	str	x25, [x3, 16]
	cbnz	w0, .L346
	add	x0, x19, 56
	lsr	x1, x0, 3
	ldrsb	w5, [x1, x21]
	str	xzr, [x3]
	cbnz	w5, .L347
	ubfiz	x2, x20, 2, 32
	mov	x0, -1
	add	x20, x2, x20, uxtw
	str	x0, [x3, 24]
	lsl	x20, x20, 4
	add	x0, x20, 16
	add	x0, x0, x22
	add	x1, x0, 63
	and	w6, w1, 7
	lsr	x2, x0, 3
	lsr	x1, x1, 3
	ldrsb	w2, [x2, x21]
	ldrsb	w1, [x1, x21]
	cmp	w1, 0
	ccmp	w6, w1, 1, ne
	cset	w1, ge
	cmp	w2, 0
	ccmp	w5, w2, 1, ne
	cset	w2, ge
	orr	w1, w1, w2
	cbnz	w1, .L348
	add	x0, x19, 95
	ldrsb	w2, [x4, x21]
	and	w4, w0, 7
	lsr	x0, x0, 3
	ldrsb	w0, [x0, x21]
	cmp	w0, 0
	ccmp	w4, w0, 1, ne
	cset	w0, ge
	cmp	w2, 0
	ccmp	w1, w2, 1, ne
	cset	w1, ge
	orr	w0, w0, w1
	cbnz	w0, .L349
	add	x20, x22, x20
	mov	w1, 192
	ldp	x6, x7, [x3]
	mov	x0, x27
	stp	x6, x7, [x20, 16]
	movk	w1, 0x8, lsl 16
	mov	w2, 420
	ldp	x10, x11, [x3, 16]
	stp	x10, x11, [x20, 32]
	ldp	x8, x9, [x3, 32]
	stp	x8, x9, [x20, 48]
	ldp	x6, x7, [x3, 48]
	stp	x6, x7, [x20, 64]
	bl	mq_open
	cmn	w0, #1
	beq	.L340
	bl	mq_close
	mov	w20, 0
	ldr	x27, [sp, 80]
	.cfi_restore 27
	cbz	w0, .L320
	.p2align 3,,7
.L321:
	mov	w20, 2
.L320:
	cmp	x24, x19
	bne	.L350
	mov	x0, 68719476736
	add	x1, x23, x0
	str	wzr, [x23, x0]
	str	wzr, [x1, 12]
.L319:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 224
	.cfi_restore 30
	.cfi_restore 29
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
	.p2align 2,,3
.L340:
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
	.cfi_offset 29, -224
	.cfi_offset 30, -216
	ldr	x27, [sp, 80]
	.cfi_restore 27
	b	.L321
.L342:
	mov	x0, 128
	bl	__asan_stack_malloc_1
	cmp	x0, 0
	csel	x19, x19, x0, eq
	b	.L317
.L350:
	mov	x0, 13838
	mov	x2, x24
	movk	x0, 0x45e0, lsl 16
	str	x0, [x19]
	mov	x1, 128
	mov	x0, x19
	bl	__asan_stack_free_1
	b	.L319
.L343:
	.cfi_offset 27, -144
	mov	x0, x27
	bl	__asan_report_load1
.L349:
	mov	x0, x3
	mov	x1, 64
	bl	__asan_report_load_n
.L348:
	mov	x1, 64
	bl	__asan_report_store_n
.L347:
	bl	__asan_report_store8
.L346:
	mov	x0, x3
	bl	__asan_report_store8
.L345:
	bl	__asan_report_store8
.L344:
	bl	__asan_report_store8
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
	cmp	w0, 127
	bhi	.L364
	mov	w3, 80
	adrp	x4, roxy_mqueues
	add	x4, x4, :lo12:roxy_mqueues
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	umull	x3, w0, w3
	mov	x29, sp
	add	x0, x3, x4
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x19, x1
	lsr	x5, x0, 3
	mov	x1, 68719476736
	mov	w20, w2
	mov	w2, 0
	ldrsb	w1, [x5, x1]
	cmp	w1, 0
	ccmp	w2, w1, 1, ne
	bge	.L371
	ldrb	w1, [x3, x4]
	cbz	w1, .L352
	mov	w1, 1
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	movk	w1, 0x8, lsl 16
	bl	mq_open
	mov	w21, w0
	cmn	w0, #1
	beq	.L369
	uxtw	x2, w20
	mov	x1, x19
	mov	w3, 0
	bl	mq_send
	cbnz	w0, .L369
	mov	w0, w21
	bl	mq_close
	mov	w1, w0
	mov	w0, 0
	ldr	x21, [sp, 32]
	.cfi_restore 21
	cbz	w1, .L351
	.p2align 3,,7
.L352:
	mov	w0, 2
.L351:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L369:
	.cfi_def_cfa_offset 48
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 21, -16
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	ldr	x21, [sp, 32]
	.cfi_restore 21
	b	.L352
	.p2align 2,,3
.L364:
	.cfi_def_cfa_offset 0
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	mov	w0, 2
	ret
.L371:
	.cfi_def_cfa_offset 48
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	bl	__asan_report_load1
	.cfi_endproc
.LFE36:
	.size	roxy_mqueue_send, .-roxy_mqueue_send
	.global	__asan_stack_malloc_0
	.section	.rodata.str1.8
	.align	3
.LC7:
	.string	"1 32 4 10 error_code"
	.text
	.align	2
	.p2align 4,,11
	.global	roxy_mqueue_receive
	.type	roxy_mqueue_receive, %function
roxy_mqueue_receive:
.LASANPC37:
.LFB37:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	adrp	x4, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x4, [x4, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	mov	w19, w0
	stp	x21, x22, [sp, 32]
	add	x20, sp, 96
	ldr	w0, [x4]
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	mov	x22, x20
	mov	x23, x1
	str	x25, [sp, 64]
	.cfi_offset 25, -96
	mov	w24, w2
	cbnz	w0, .L394
.L372:
	mov	x25, x20
	lsr	x21, x20, 3
	mov	x0, 35507
	mov	x5, 68719476736
	movk	x0, 0x41b5, lsl 16
	add	x1, x21, x5
	str	x0, [x25], 64
	adrp	x4, .LC7
	adrp	x0, .LASANPC37
	add	x4, x4, :lo12:.LC7
	add	x0, x0, :lo12:.LASANPC37
	stp	x4, x0, [x20, 8]
	mov	w2, -235802127
	mov	w0, 62212
	str	w2, [x21, x5]
	movk	w0, 0xf3f3, lsl 16
	str	w0, [x1, 4]
	cmp	w19, 127
	bhi	.L376
	mov	w0, 80
	adrp	x4, roxy_mqueues
	add	x4, x4, :lo12:roxy_mqueues
	mov	w2, 0
	umull	x19, w19, w0
	add	x0, x19, x4
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x5]
	cmp	w1, 0
	ccmp	w2, w1, 1, ne
	bge	.L395
	ldrb	w1, [x19, x4]
	cbz	w1, .L376
	cmp	w3, 1
	beq	.L396
	cbnz	w3, .L376
	mov	w1, 2048
	movk	w1, 0x8, lsl 16
	bl	mq_open
	mov	w19, w0
.L379:
	cmn	w19, #1
	beq	.L376
	sub	x3, x25, #32
	uxtw	x2, w24
	mov	x1, x23
	mov	w0, w19
	bl	mq_receive
	cmn	w0, #1
	mov	w0, w19
	beq	.L397
	bl	mq_close
	mov	w1, w0
	mov	w0, 0
	cbz	w1, .L375
	.p2align 3,,7
.L376:
	mov	w0, 2
.L375:
	cmp	x22, x20
	bne	.L398
	mov	x1, 68719476736
	str	xzr, [x21, x1]
.L374:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 160
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L396:
	.cfi_restore_state
	mov	w1, 524288
	bl	mq_open
	mov	w19, w0
	b	.L379
	.p2align 2,,3
.L397:
	bl	mq_close
	mov	w0, 2
	b	.L375
.L394:
	mov	x0, 64
	str	w3, [sp, 92]
	bl	__asan_stack_malloc_0
	cmp	x0, 0
	ldr	w3, [sp, 92]
	csel	x20, x20, x0, eq
	b	.L372
.L398:
	mov	x2, 68719476736
	mov	x4, 13838
	add	x3, x21, x2
	movk	x4, 0x45e0, lsl 16
	mov	w1, 62965
	str	x4, [x20]
	bfi	w1, w1, 16, 16
	str	w1, [x21, x2]
	str	w1, [x3, 4]
	ldr	x1, [x20, 56]
	strb	wzr, [x1]
	b	.L374
.L395:
	bl	__asan_report_load1
	.cfi_endproc
.LFE37:
	.size	roxy_mqueue_receive, .-roxy_mqueue_receive
	.section	.rodata.str1.8
	.align	3
.LC8:
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
	stp	x29, x30, [sp, -192]!
	.cfi_def_cfa_offset 192
	.cfi_offset 29, -192
	.cfi_offset 30, -184
	adrp	x1, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x1, [x1, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -176
	.cfi_offset 20, -168
	mov	w20, w0
	stp	x21, x22, [sp, 32]
	add	x19, sp, 64
	ldr	w0, [x1]
	str	x23, [sp, 48]
	.cfi_offset 21, -160
	.cfi_offset 22, -152
	.cfi_offset 23, -144
	mov	x23, x19
	cbnz	w0, .L418
.L399:
	lsr	x21, x19, 3
	mov	x22, 68719476736
	mov	x3, 35507
	add	x2, x21, x22
	movk	x3, 0x41b5, lsl 16
	adrp	x1, .LC8
	adrp	x0, .LASANPC38
	add	x1, x1, :lo12:.LC8
	add	x0, x0, :lo12:.LASANPC38
	stp	x3, x1, [x19]
	mov	w3, -235802127
	str	x0, [x19, 16]
	mov	w1, -202116109
	str	w3, [x21, x22]
	str	w1, [x2, 12]
	cmp	w20, 127
	bhi	.L406
	mov	w0, 80
	adrp	x1, roxy_mqueues
	add	x1, x1, :lo12:roxy_mqueues
	mov	w3, 0
	umull	x20, w20, w0
	add	x0, x20, x1
	lsr	x2, x0, 3
	ldrsb	w2, [x2, x22]
	cmp	w2, 0
	ccmp	w3, w2, 1, ne
	bge	.L419
	ldrb	w1, [x20, x1]
	cbz	w1, .L406
	mov	w1, 524288
	bl	mq_open
	cmn	w0, #1
	beq	.L406
	add	x20, x19, 32
	mov	x1, x20
	bl	mq_getattr
	cbnz	w0, .L406
	add	x0, x19, 56
	lsr	x1, x0, 3
	ldrsb	w1, [x1, x22]
	cbnz	w1, .L420
	ldr	w20, [x20, 24]
.L402:
	cmp	x23, x19
	bne	.L421
	mov	x0, 68719476736
	add	x1, x21, x0
	str	wzr, [x21, x0]
	str	wzr, [x1, 12]
.L401:
	mov	w0, w20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 192
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L406:
	.cfi_restore_state
	mov	w20, -1
	b	.L402
.L419:
	bl	__asan_report_load1
.L418:
	mov	x0, 128
	bl	__asan_stack_malloc_1
	cmp	x0, 0
	csel	x19, x19, x0, eq
	b	.L399
.L421:
	mov	x0, 13838
	mov	x2, x23
	movk	x0, 0x45e0, lsl 16
	str	x0, [x19]
	mov	x1, 128
	mov	x0, x19
	bl	__asan_stack_free_1
	b	.L401
.L420:
	bl	__asan_report_load8
	.cfi_endproc
.LFE38:
	.size	roxy_mqueue_get_pending, .-roxy_mqueue_get_pending
	.section	.rodata.str1.8
	.align	3
.LC9:
	.string	"1 32 8 16 channel_name:644"
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
	mov	w2, w0
	mov	x29, sp
	ldr	x1, [x1, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -112
	.cfi_offset 20, -104
	add	x19, sp, 64
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -96
	.cfi_offset 22, -88
	mov	x21, x19
	ldr	w0, [x1]
	cbnz	w0, .L431
.L422:
	lsr	x20, x19, 3
	mov	x0, 68719476736
	mov	x6, 35507
	add	x5, x20, x0
	movk	x6, 0x41b5, lsl 16
	adrp	x4, .LC9
	adrp	x3, .LASANPC39
	add	x4, x4, :lo12:.LC9
	add	x3, x3, :lo12:.LASANPC39
	stp	x6, x4, [x19]
	adrp	x1, .LANCHOR0
	str	x3, [x19, 16]
	mov	w4, -235802127
	add	x1, x1, :lo12:.LANCHOR0
	str	w4, [x20, x0]
	mov	w0, 62208
	add	x1, x1, 160
	movk	w0, 0xf3f3, lsl 16
	str	w0, [x5, 4]
	add	x22, x19, 32
	mov	x0, x22
	bl	sprintf
	mov	x0, x22
	bl	mq_unlink
	cbz	w0, .L425
	mov	w0, 2
.L425:
	cmp	x21, x19
	bne	.L432
	mov	x1, 68719476736
	str	xzr, [x20, x1]
.L424:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 128
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L431:
	.cfi_restore_state
	mov	x0, 64
	str	w2, [sp, 60]
	bl	__asan_stack_malloc_0
	cmp	x0, 0
	ldr	w2, [sp, 60]
	csel	x19, x19, x0, eq
	b	.L422
.L432:
	mov	x2, 68719476736
	mov	x4, 13838
	add	x3, x20, x2
	movk	x4, 0x45e0, lsl 16
	mov	w1, 62965
	str	x4, [x19]
	bfi	w1, w1, 16, 16
	str	w1, [x20, x2]
	str	w1, [x3, 4]
	ldr	x1, [x19, 56]
	strb	wzr, [x1]
	b	.L424
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
	cmp	w0, 127
	bhi	.L436
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	w20, 104
	mov	w19, w0
	umull	x20, w0, w20
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	adrp	x21, roxy_events
	add	x21, x21, :lo12:roxy_events
	add	x22, x20, x21
	mov	x0, x22
	bl	pthread_mutex_lock
	uxtw	x0, w19
	mov	x1, 68719476736
	add	x19, x0, x19, uxtw 1
	mov	w2, 3
	add	x19, x0, x19, lsl 2
	lsl	x19, x19, 3
	add	x0, x19, 96
	add	x0, x0, x21
	lsr	x3, x0, 3
	ldrsb	w1, [x3, x1]
	cmp	w1, 0
	ccmp	w2, w1, 1, ne
	bge	.L441
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
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L436:
	mov	w0, 2
	ret
.L441:
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
	cmp	w0, 127
	bhi	.L447
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	mov	w20, 104
	mov	w19, w0
	umull	x20, w0, w20
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	adrp	x22, roxy_events
	str	x25, [sp, 64]
	.cfi_offset 25, -16
	add	x25, x22, :lo12:roxy_events
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -32
	.cfi_offset 24, -24
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
	lsr	x21, x23, 3
	ldrsb	w0, [x21, x2]
	cmp	w0, 0
	ccmp	w1, w0, 1, ne
	bge	.L454
	add	x0, x25, x19
	add	x20, x20, 48
	add	x20, x20, x25
	mov	w1, 1
	str	w1, [x0, 96]
	.p2align 3,,7
.L446:
	mov	x1, x24
	mov	x0, x20
	bl	pthread_cond_wait
	mov	x0, 68719476736
	mov	w2, 3
	ldrsb	w0, [x21, x0]
	cmp	w0, 0
	ccmp	w2, w0, 1, ne
	bge	.L455
	add	x0, x22, :lo12:roxy_events
	add	x0, x0, x19
	ldr	w0, [x0, 96]
	cmp	w0, 1
	beq	.L446
	mov	x0, x24
	bl	pthread_mutex_unlock
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L447:
	mov	w0, 2
	ret
.L455:
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
.L454:
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
	cbnz	w3, .L462
	ldr	x0, [x1, x2, lsl 3]
	cbz	x0, .L456
	mov	x16, x0
	br	x16
	.p2align 2,,3
.L456:
	ret
.L462:
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
.LC10:
	.string	"1 32 152 17 signal_action:752"
	.text
	.align	2
	.p2align 4,,11
	.global	roxy_interrupt_catch
	.type	roxy_interrupt_catch, %function
roxy_interrupt_catch:
.LASANPC43:
.LFB43:
	.cfi_startproc
	stp	x29, x30, [sp, -352]!
	.cfi_def_cfa_offset 352
	.cfi_offset 29, -352
	.cfi_offset 30, -344
	adrp	x2, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x2, [x2, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -320
	.cfi_offset 22, -312
	mov	w21, w0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -336
	.cfi_offset 20, -328
	add	x19, sp, 96
	ldr	w0, [x2]
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -304
	.cfi_offset 24, -296
	mov	x24, x19
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -288
	.cfi_offset 26, -280
	cbnz	w0, .L474
.L463:
	lsr	x25, x19, 3
	mov	x23, 68719476736
	add	x26, x19, 32
	add	x20, x25, x23
	mov	x3, 35507
	adrp	x2, .LC10
	movk	x3, 0x41b5, lsl 16
	add	x2, x2, :lo12:.LC10
	adrp	x0, .LASANPC43
	add	x0, x0, :lo12:.LASANPC43
	stp	x3, x2, [x19]
	mov	w3, -235802127
	lsr	x2, x26, 3
	str	x0, [x19, 16]
	mov	w0, -202116109
	str	w3, [x25, x23]
	mov	w3, -218103808
	stp	w3, w0, [x20, 20]
	str	w0, [x20, 28]
	ldrsb	w0, [x2, x23]
	cbnz	w0, .L475
	add	x22, x19, 40
	str	x1, [x19, 32]
	mov	x0, x22
	bl	sigemptyset
	mov	w1, w21
	mov	x0, x22
	bl	sigaddset
	mov	w0, w21
	mov	x1, x26
	mov	x2, 0
	bl	sigaction
	cmp	w0, 0
	cset	w21, ne
	lsl	w21, w21, 1
	cmp	x24, x19
	bne	.L476
	str	wzr, [x25, x23]
	str	xzr, [x20, 20]
	str	wzr, [x20, 28]
.L465:
	mov	w0, w21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 352
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
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
.L474:
	.cfi_restore_state
	mov	x0, 256
	str	x1, [sp, 88]
	bl	__asan_stack_malloc_2
	cmp	x0, 0
	csel	x19, x19, x0, eq
	ldr	x1, [sp, 88]
	b	.L463
.L476:
	mov	x0, 13838
	mov	x2, x24
	movk	x0, 0x45e0, lsl 16
	str	x0, [x19]
	mov	x1, 256
	mov	x0, x19
	bl	__asan_stack_free_2
	b	.L465
.L475:
	mov	x0, x26
	bl	__asan_report_store8
	.cfi_endproc
.LFE43:
	.size	roxy_interrupt_catch, .-roxy_interrupt_catch
	.section	.rodata.str1.8
	.align	3
.LC11:
	.string	"src/core.c"
	.align	3
.LC12:
	.string	"roxy_interrupts"
	.align	3
.LC13:
	.string	"roxy_events"
	.align	3
.LC14:
	.string	"roxy_mqueues"
	.align	3
.LC15:
	.string	"roxy_critical_sections"
	.align	3
.LC16:
	.string	"roxy_threads"
	.align	3
.LC17:
	.string	"roxy_tasks"
	.align	3
.LC18:
	.string	"*.LC6"
	.align	3
.LC19:
	.string	"*.LC2"
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
	mov	x1, 8
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
	mov	x1, 8
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
.LC2:
	.string	""
	.zero	63
.LC6:
	.string	"/%x"
	.zero	60
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
	.xword	.LC11
	.word	30
	.word	14
	.type	.LASANLOC2, %object
	.size	.LASANLOC2, 16
.LASANLOC2:
	.xword	.LC11
	.word	29
	.word	26
	.type	.LASANLOC3, %object
	.size	.LASANLOC3, 16
.LASANLOC3:
	.xword	.LC11
	.word	28
	.word	27
	.type	.LASANLOC4, %object
	.size	.LASANLOC4, 16
.LASANLOC4:
	.xword	.LC11
	.word	27
	.word	24
	.type	.LASANLOC5, %object
	.size	.LASANLOC5, 16
.LASANLOC5:
	.xword	.LC11
	.word	26
	.word	27
	.type	.LASANLOC6, %object
	.size	.LASANLOC6, 16
.LASANLOC6:
	.xword	.LC11
	.word	25
	.word	25
	.type	.LASAN0, %object
	.size	.LASAN0, 512
.LASAN0:
	.xword	roxy_interrupts
	.xword	512
	.xword	544
	.xword	.LC12
	.xword	.LC11
	.xword	0
	.xword	.LASANLOC1
	.xword	0
	.xword	roxy_events
	.xword	13312
	.xword	13344
	.xword	.LC13
	.xword	.LC11
	.xword	0
	.xword	.LASANLOC2
	.xword	0
	.xword	roxy_mqueues
	.xword	10240
	.xword	10272
	.xword	.LC14
	.xword	.LC11
	.xword	0
	.xword	.LASANLOC3
	.xword	0
	.xword	roxy_critical_sections
	.xword	768
	.xword	800
	.xword	.LC15
	.xword	.LC11
	.xword	0
	.xword	.LASANLOC4
	.xword	0
	.xword	roxy_threads
	.xword	24576
	.xword	24608
	.xword	.LC16
	.xword	.LC11
	.xword	0
	.xword	.LASANLOC5
	.xword	0
	.xword	roxy_tasks
	.xword	9216
	.xword	9248
	.xword	.LC17
	.xword	.LC11
	.xword	0
	.xword	.LASANLOC6
	.xword	0
	.xword	.LC6
	.xword	4
	.xword	64
	.xword	.LC18
	.xword	.LC11
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC2
	.xword	1
	.xword	64
	.xword	.LC19
	.xword	.LC11
	.xword	0
	.xword	0
	.xword	0
	.zero	32
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
