	.arch armv8-a
	.file	"timer-application.c"
	.text
	.align	2
	.p2align 4,,11
	.global	timer_handler
	.type	timer_handler, %function
timer_handler:
.LASANPC28:
.LFB28:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	x29, sp
	bl	puts
	adrp	x0, .LANCHOR1
	add	x3, x0, :lo12:.LANCHOR1
	ldr	x0, [x0, #:lo12:.LANCHOR1]
	ldr	w2, [x3, 64]
	cmp	w2, 0
	and	w1, w2, 1
	add	w2, w2, 1
	str	w2, [x3, 64]
	csneg	w1, w1, w1, ge
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	b	gpiod_line_set_value
	.cfi_endproc
.LFE28:
	.size	timer_handler, .-timer_handler
	.align	2
	.p2align 4,,11
	.global	idle_task
	.type	idle_task, %function
idle_task:
.LASANPC29:
.LFB29:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	adrp	x20, .LANCHOR0
	add	x20, x20, :lo12:.LANCHOR0
	add	x20, x20, 64
	mov	w19, 7200
	.p2align 3,,7
.L5:
	mov	x0, x20
	bl	puts
	mov	w1, 1
	mov	w0, w1
	bl	roxy_task_wait
	subs	w19, w19, #1
	bne	.L5
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE29:
	.size	idle_task, .-idle_task
	.global	__asan_stack_malloc_1
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC2:
	.string	"1 32 32 15 timer_config:10"
	.text
	.align	2
	.p2align 4,,11
	.global	timer_useconds
	.type	timer_useconds, %function
timer_useconds:
.LASANPC27:
.LFB27:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	adrp	x1, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x1, [x1, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	mov	x21, x0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	add	x19, sp, 64
	ldr	w0, [x1]
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	mov	x23, x19
	cbnz	w0, .L20
.L8:
	lsr	x22, x19, 3
	mov	x20, 68719476736
	add	x0, x19, 40
	add	x24, x22, x20
	mov	x3, 35507
	adrp	x2, .LC2
	movk	x3, 0x41b5, lsl 16
	add	x2, x2, :lo12:.LC2
	adrp	x1, .LASANPC27
	add	x1, x1, :lo12:.LASANPC27
	stp	x3, x2, [x19]
	lsr	x2, x0, 3
	mov	w3, -235802127
	str	x1, [x19, 16]
	mov	w1, -202116109
	str	w3, [x22, x20]
	str	w1, [x24, 8]
	add	x1, x19, 32
	ldrsb	w2, [x2, x20]
	cbnz	w2, .L21
	lsr	x0, x1, 3
	ldrsb	w0, [x0, x20]
	str	x21, [x1, 8]
	cbnz	w0, .L22
	add	x0, x19, 56
	lsr	x2, x0, 3
	ldrsb	w2, [x2, x20]
	str	xzr, [x1]
	cbnz	w2, .L23
	add	x0, x19, 48
	lsr	x2, x0, 3
	ldrsb	w2, [x2, x20]
	str	x21, [x1, 24]
	cbnz	w2, .L24
	mov	x2, 0
	mov	w0, 0
	str	xzr, [x1, 16]
	bl	setitimer
	cmp	x23, x19
	bne	.L25
	str	wzr, [x22, x20]
	str	wzr, [x24, 8]
.L10:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 160
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
.L20:
	.cfi_restore_state
	mov	x0, 96
	bl	__asan_stack_malloc_1
	cmp	x0, 0
	csel	x19, x19, x0, eq
	b	.L8
.L25:
	mov	x1, 13838
	mov	w0, 62965
	movk	x1, 0x45e0, lsl 16
	str	x1, [x19]
	bfi	w0, w0, 16, 16
	mov	w1, 62965
	str	w0, [x22, x20]
	movk	w1, 0xf5f5, lsl 16
	stp	w0, w1, [x24, 4]
	ldr	x0, [x19, 120]
	strb	wzr, [x0]
	b	.L10
.L24:
	bl	__asan_report_store8
.L23:
	bl	__asan_report_store8
.L22:
	mov	x0, x1
	bl	__asan_report_store8
.L21:
	bl	__asan_report_store8
	.cfi_endproc
.LFE27:
	.size	timer_useconds, .-timer_useconds
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"1 32 32 12 timer_config"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LASANPC30:
.LFB30:
	.cfi_startproc
	stp	x29, x30, [sp, -176]!
	.cfi_def_cfa_offset 176
	.cfi_offset 29, -176
	.cfi_offset 30, -168
	adrp	x0, :got:__asan_option_detect_stack_use_after_return
	mov	x29, sp
	ldr	x0, [x0, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -160
	.cfi_offset 20, -152
	add	x19, sp, 80
	stp	x21, x22, [sp, 32]
	ldr	w0, [x0]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	.cfi_offset 21, -144
	.cfi_offset 22, -136
	.cfi_offset 23, -128
	.cfi_offset 24, -120
	.cfi_offset 25, -112
	.cfi_offset 26, -104
	mov	x25, x19
	cbnz	w0, .L38
.L26:
	lsr	x22, x19, 3
	mov	x20, 68719476736
	mov	x2, 35507
	add	x24, x22, x20
	movk	x2, 0x41b5, lsl 16
	adrp	x1, .LC3
	adrp	x0, .LASANPC30
	add	x1, x1, :lo12:.LC3
	add	x0, x0, :lo12:.LASANPC30
	stp	x2, x1, [x19]
	mov	w2, -235802127
	str	x0, [x19, 16]
	mov	w1, -202116109
	str	w2, [x22, x20]
	adrp	x23, .LANCHOR1
	str	w1, [x24, 8]
	add	x26, x23, :lo12:.LANCHOR1
	adrp	x21, .LANCHOR0
	add	x21, x21, :lo12:.LANCHOR0
	bl	roxy_init
	adrp	x4, idle_task
	add	x4, x4, :lo12:idle_task
	mov	x5, 0
	mov	x3, 0
	mov	x2, 0
	mov	w1, 10
	mov	w0, 100
	bl	roxy_task_create
	mov	w1, 1
	mov	w0, 100
	bl	roxy_task_start
	adrp	x1, timer_handler
	add	x1, x1, :lo12:timer_handler
	mov	w0, 14
	bl	roxy_interrupt_catch
	add	x0, x21, 128
	bl	gpiod_chip_open_by_name
	str	x0, [x26, 128]
	mov	w1, 21
	bl	gpiod_chip_get_line
	add	x1, x21, 192
	mov	w2, 0
	str	x0, [x23, #:lo12:.LANCHOR1]
	bl	gpiod_line_request_output
	add	x0, x19, 40
	add	x1, x19, 32
	lsr	x2, x0, 3
	ldrsb	w2, [x2, x20]
	cbnz	w2, .L39
	lsr	x21, x1, 3
	mov	x2, 59464
	movk	x2, 0x1, lsl 16
	ldrsb	w0, [x21, x20]
	str	x2, [x1, 8]
	cbnz	w0, .L40
	add	x0, x19, 56
	lsr	x3, x0, 3
	ldrsb	w3, [x3, x20]
	str	xzr, [x1]
	cbnz	w3, .L41
	add	x0, x19, 48
	str	x2, [x1, 24]
	lsr	x2, x0, 3
	ldrsb	w2, [x2, x20]
	cbnz	w2, .L42
	mov	x2, 0
	mov	w0, 0
	str	xzr, [x1, 16]
	bl	setitimer
	mov	w0, -117901064
	str	w0, [x21, x20]
	mov	w0, 100
	bl	roxy_loop
	ldr	x0, [x23, #:lo12:.LANCHOR1]
	bl	gpiod_line_release
	ldr	x0, [x26, 128]
	bl	gpiod_chip_close
	bl	roxy_clean
	cmp	x25, x19
	bne	.L43
	str	xzr, [x22, x20]
	str	wzr, [x24, 8]
.L28:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 176
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
.L38:
	.cfi_restore_state
	mov	x0, 96
	bl	__asan_stack_malloc_1
	cmp	x0, 0
	csel	x19, x19, x0, eq
	b	.L26
.L43:
	mov	x1, 13838
	mov	w0, 62965
	movk	x1, 0x45e0, lsl 16
	str	x1, [x19]
	bfi	w0, w0, 16, 16
	mov	w1, 62965
	str	w0, [x22, x20]
	movk	w1, 0xf5f5, lsl 16
	stp	w0, w1, [x24, 4]
	ldr	x0, [x19, 120]
	strb	wzr, [x0]
	b	.L28
.L42:
	bl	__asan_report_store8
.L41:
	bl	__asan_report_store8
.L40:
	mov	x0, x1
	bl	__asan_report_store8
.L39:
	bl	__asan_report_store8
	.cfi_endproc
.LFE30:
	.size	main, .-main
	.global	lineRed
	.global	chip
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"src/timer-application.c"
	.global	__odr_asan.lineRed
	.global	__odr_asan.chip
	.align	3
.LC7:
	.string	"led_signal"
	.align	3
.LC8:
	.string	"lineRed"
	.align	3
.LC9:
	.string	"chip"
	.align	3
.LC10:
	.string	"*.LC5"
	.align	3
.LC11:
	.string	"*.LC0"
	.align	3
.LC12:
	.string	"*.LC1"
	.align	3
.LC13:
	.string	"*.LC4"
	.section	.text.exit,"ax",@progbits
	.align	2
	.p2align 4,,11
	.type	_sub_D_00099_0, %function
_sub_D_00099_0:
.LFB31:
	.cfi_startproc
	adrp	x0, .LANCHOR2
	add	x0, x0, :lo12:.LANCHOR2
	add	x0, x0, 48
	mov	x1, 7
	b	__asan_unregister_globals
	.cfi_endproc
.LFE31:
	.size	_sub_D_00099_0, .-_sub_D_00099_0
	.section	.fini_array.00099,"aw"
	.align	3
	.xword	_sub_D_00099_0
	.section	.text.startup
	.align	2
	.p2align 4,,11
	.type	_sub_I_00099_1, %function
_sub_I_00099_1:
.LFB32:
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
	mov	x1, 7
	add	x0, x0, 48
	b	__asan_register_globals
	.cfi_endproc
.LFE32:
	.size	_sub_I_00099_1, .-_sub_I_00099_1
	.section	.init_array.00099,"aw"
	.align	3
	.xword	_sub_I_00099_1
	.section	.rodata
	.align	5
	.set	.LANCHOR0,. + 0
.LC0:
	.string	"VHF signal fired"
	.zero	47
.LC1:
	.string	"program running"
	.zero	48
.LC4:
	.string	"gpiochip0"
	.zero	54
.LC5:
	.string	"roxy"
	.zero	59
	.bss
	.align	5
	.set	.LANCHOR1,. + 0
	.type	lineRed, %object
	.size	lineRed, 8
lineRed:
	.zero	8
	.zero	56
	.type	led_signal.0, %object
	.size	led_signal.0, 4
led_signal.0:
	.zero	4
	.zero	60
	.type	chip, %object
	.size	chip, 8
chip:
	.zero	8
	.zero	56
	.type	__odr_asan.lineRed, %object
	.size	__odr_asan.lineRed, 1
__odr_asan.lineRed:
	.zero	1
	.type	__odr_asan.chip, %object
	.size	__odr_asan.chip, 1
__odr_asan.chip:
	.zero	1
	.section	.data.rel.local,"aw"
	.align	3
	.set	.LANCHOR2,. + 0
	.type	.LASANLOC1, %object
	.size	.LASANLOC1, 16
.LASANLOC1:
	.xword	.LC6
	.word	22
	.word	16
	.type	.LASANLOC2, %object
	.size	.LASANLOC2, 16
.LASANLOC2:
	.xword	.LC6
	.word	6
	.word	20
	.type	.LASANLOC3, %object
	.size	.LASANLOC3, 16
.LASANLOC3:
	.xword	.LC6
	.word	5
	.word	20
	.type	.LASAN0, %object
	.size	.LASAN0, 448
.LASAN0:
	.xword	led_signal.0
	.xword	4
	.xword	64
	.xword	.LC7
	.xword	.LC6
	.xword	0
	.xword	.LASANLOC1
	.xword	0
	.xword	lineRed
	.xword	8
	.xword	64
	.xword	.LC8
	.xword	.LC6
	.xword	0
	.xword	.LASANLOC2
	.xword	__odr_asan.lineRed
	.xword	chip
	.xword	8
	.xword	64
	.xword	.LC9
	.xword	.LC6
	.xword	0
	.xword	.LASANLOC3
	.xword	__odr_asan.chip
	.xword	.LC5
	.xword	5
	.xword	64
	.xword	.LC10
	.xword	.LC6
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC0
	.xword	17
	.xword	64
	.xword	.LC11
	.xword	.LC6
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC1
	.xword	16
	.xword	64
	.xword	.LC12
	.xword	.LC6
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC4
	.xword	10
	.xword	64
	.xword	.LC13
	.xword	.LC6
	.xword	0
	.xword	0
	.xword	0
	.zero	32
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
