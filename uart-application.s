	.arch armv8-a
	.file	"uart-application.c"
	.text
	.global	__asan_stack_malloc_3
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"3 32 16 9 buffer:26 64 60 16 terminal_setting 160 256 10 message:26"
	.global	__asan_stack_free_3
	.text
	.align	2
	.p2align 4,,11
	.global	reading_task
	.type	reading_task, %function
reading_task:
.LASANPC25:
.LFB25:
	.cfi_startproc
	sub	sp, sp, #608
	.cfi_def_cfa_offset 608
	adrp	x0, :got:__asan_option_detect_stack_use_after_return
	stp	x29, x30, [sp]
	.cfi_offset 29, -608
	.cfi_offset 30, -600
	mov	x29, sp
	ldr	x0, [x0, #:got_lo12:__asan_option_detect_stack_use_after_return]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -592
	.cfi_offset 20, -584
	add	x20, sp, 128
	stp	x21, x22, [sp, 32]
	ldr	w0, [x0]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 21, -576
	.cfi_offset 22, -568
	.cfi_offset 23, -560
	.cfi_offset 24, -552
	.cfi_offset 25, -544
	.cfi_offset 26, -536
	.cfi_offset 27, -528
	.cfi_offset 28, -520
	cbnz	w0, .L30
.L1:
	lsr	x3, x20, 3
	add	x21, x20, 160
	adrp	x1, .LASANPC25
	mov	x4, 35507
	add	x1, x1, :lo12:.LASANPC25
	mov	x19, 68719476736
	movk	x4, 0x41b5, lsl 16
	add	x0, x3, x19
	adrp	x2, .LC0
	add	x2, x2, :lo12:.LC0
	stp	x4, x2, [x20]
	add	x28, x20, 64
	mov	w4, -235802127
	str	x1, [x20, 16]
	add	x1, x20, 480
	str	x1, [sp, 120]
	lsr	x1, x21, 3
	str	x1, [sp, 104]
	mov	w2, 62194
	str	w4, [x3, x19]
	movk	w2, 0xf2f2, lsl 16
	mov	w4, -219021312
	mov	w3, 67108864
	mov	w1, -202116109
	add	x24, x19, x28, lsr 3
	str	w4, [x0, 4]
	stp	w3, w2, [x0, 12]
	stp	w1, w1, [x0, 52]
	b	.L5
	.p2align 2,,3
.L6:
	mov	w0, -117901064
	stp	w0, w0, [x24]
.L5:
	adrp	x0, .LANCHOR0
	add	x20, x0, :lo12:.LANCHOR0
	mov	x0, x20
	mov	w1, 258
	bl	open
	mov	w22, w0
	tbnz	w0, #31, .L6
	mov	w1, 67108864
	stp	wzr, w1, [x24]
	mov	x1, x28
	bl	tcgetattr
	cbnz	w0, .L31
	mov	w1, 13
	mov	x0, x28
	bl	cfsetispeed
	mov	x2, x28
	mov	w0, w22
	mov	w1, 0
	bl	tcsetattr
	cbnz	w0, .L32
	ldr	x1, [sp, 104]
	ldrsb	w1, [x1, x19]
	cmp	w1, 0
	ccmp	w0, w1, 1, ne
	bge	.L33
	ldr	x0, [sp, 120]
	sub	x1, x0, #4096
	sub	x23, x0, #448
	sub	x25, x0, #447
	str	x1, [sp, 112]
	strb	wzr, [x1, 3776]
	.p2align 3,,7
.L17:
	mov	x1, x23
	mov	w0, w22
	mov	x2, 16
	bl	read
	mov	x20, x0
	cmp	w0, 0
	ble	.L12
	bl	__ctype_b_loc
	lsr	x2, x0, 3
	ldrsb	w2, [x2, x19]
	cbnz	w2, .L34
	sub	w20, w20, #1
	mov	x27, x23
	add	x20, x20, x25
	ldr	x26, [x0]
	b	.L16
	.p2align 2,,3
.L37:
	mov	x1, x27
	mov	x2, 1
	mov	x0, x21
	add	x27, x27, x2
	bl	strncat
	cmp	x27, x20
	beq	.L17
.L16:
	lsr	x1, x27, 3
	and	w0, w27, 7
	ldrsb	w1, [x1, x19]
	cmp	w1, 0
	ccmp	w0, w1, 1, ne
	bge	.L35
	ldrb	w1, [x27]
	lsl	x1, x1, 1
	add	x0, x26, x1
	and	x2, x0, 7
	lsr	x4, x0, 3
	add	w2, w2, 1
	ldrsb	w4, [x4, x19]
	cmp	w4, 0
	ccmp	w2, w4, 1, ne
	bge	.L36
	ldrh	w0, [x26, x1]
	tbz	x0, 1, .L37
.L12:
	ldr	x0, [sp, 104]
	mov	w1, 0
	ldrsb	w0, [x0, x19]
	cmp	w0, 0
	ccmp	w1, w0, 1, ne
	bge	.L38
	ldr	x0, [sp, 112]
	ldrb	w0, [x0, 3776]
	cbnz	w0, .L39
.L19:
	mov	w0, w22
	bl	close
	mov	w0, -117901064
	stp	w0, w0, [x24]
	b	.L5
.L31:
	bl	__errno_location
	lsr	x3, x0, 3
	and	x2, x0, 7
	add	w2, w2, 3
	ldrsb	w3, [x3, x19]
	cmp	w3, 0
	ccmp	w2, w3, 1, ne
	bge	.L40
	ldr	w22, [x0]
	mov	w0, w22
	bl	strerror
	mov	w1, w22
	mov	x2, x0
	add	x0, x20, 64
	bl	printf
	b	.L6
.L32:
	bl	__errno_location
	lsr	x3, x0, 3
	and	x2, x0, 7
	add	w2, w2, 3
	ldrsb	w3, [x3, x19]
	cmp	w3, 0
	ccmp	w2, w3, 1, ne
	bge	.L41
	ldr	w22, [x0]
	mov	w0, w22
	bl	strerror
	mov	w1, w22
	mov	x2, x0
	add	x0, x20, 128
	bl	printf
	b	.L6
	.p2align 2,,3
.L39:
	adrp	x0, .LANCHOR0
	add	x0, x0, :lo12:.LANCHOR0
	mov	x1, x21
	add	x0, x0, 192
	bl	printf
	b	.L19
.L36:
	bl	__asan_report_load2
.L35:
	mov	x0, x27
	bl	__asan_report_load1
.L34:
	bl	__asan_report_load8
.L38:
	mov	x0, x21
	bl	__asan_report_load1
.L33:
	mov	x0, x21
	bl	__asan_report_store1
.L30:
	mov	x0, 480
	bl	__asan_stack_malloc_3
	cmp	x0, 0
	csel	x20, x20, x0, eq
	b	.L1
.L41:
	bl	__asan_report_load4
.L40:
	bl	__asan_report_load4
	.cfi_endproc
.LFE25:
	.size	reading_task, .-reading_task
	.align	2
	.p2align 4,,11
	.global	idle_task
	.type	idle_task, %function
idle_task:
.LASANPC26:
.LFB26:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	adrp	x19, .LANCHOR0
	add	x19, x19, :lo12:.LANCHOR0
	add	x19, x19, 256
	.p2align 3,,7
.L43:
	mov	x0, x19
	bl	puts
	mov	w1, 1
	mov	w0, 10
	bl	roxy_task_wait
	b	.L43
	.cfi_endproc
.LFE26:
	.size	idle_task, .-idle_task
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LASANPC27:
.LFB27:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
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
	adrp	x4, reading_task
	add	x4, x4, :lo12:reading_task
	mov	x5, 0
	mov	x3, 0
	mov	x2, 0
	mov	w1, 10
	mov	w0, 101
	bl	roxy_task_create
	mov	w1, 1
	mov	w0, 101
	bl	roxy_task_start
	mov	w0, 100
	bl	roxy_loop
	bl	roxy_clean
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE27:
	.size	main, .-main
	.section	.rodata.str1.8
	.align	3
.LC6:
	.string	"*.LC3"
	.align	3
.LC7:
	.string	"src/uart-application.c"
	.align	3
.LC8:
	.string	"*.LC1"
	.align	3
.LC9:
	.string	"*.LC4"
	.align	3
.LC10:
	.string	"*.LC2"
	.align	3
.LC11:
	.string	"*.LC5"
	.section	.text.exit,"ax",@progbits
	.align	2
	.p2align 4,,11
	.type	_sub_D_00099_0, %function
_sub_D_00099_0:
.LFB28:
	.cfi_startproc
	adrp	x0, .LANCHOR1
	mov	x1, 5
	add	x0, x0, :lo12:.LANCHOR1
	b	__asan_unregister_globals
	.cfi_endproc
.LFE28:
	.size	_sub_D_00099_0, .-_sub_D_00099_0
	.section	.fini_array.00099,"aw"
	.align	3
	.xword	_sub_D_00099_0
	.section	.text.startup
	.align	2
	.p2align 4,,11
	.type	_sub_I_00099_1, %function
_sub_I_00099_1:
.LFB29:
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
	adrp	x0, .LANCHOR1
	mov	x1, 5
	add	x0, x0, :lo12:.LANCHOR1
	b	__asan_register_globals
	.cfi_endproc
.LFE29:
	.size	_sub_I_00099_1, .-_sub_I_00099_1
	.section	.init_array.00099,"aw"
	.align	3
	.xword	_sub_I_00099_1
	.section	.rodata
	.align	5
	.set	.LANCHOR0,. + 0
.LC1:
	.string	"/dev/ttyS0"
	.zero	53
.LC2:
	.string	"Error %i from tcgetattr: %s\n"
	.zero	35
.LC3:
	.string	"Error %i from tcsetattr: %s\n"
	.zero	35
.LC4:
	.string	"Received Message:(%s)\n"
	.zero	41
.LC5:
	.string	"program running"
	.zero	48
	.section	.data.rel.local,"aw"
	.align	3
	.set	.LANCHOR1,. + 0
	.type	.LASAN0, %object
	.size	.LASAN0, 320
.LASAN0:
	.xword	.LC3
	.xword	29
	.xword	64
	.xword	.LC6
	.xword	.LC7
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC1
	.xword	11
	.xword	64
	.xword	.LC8
	.xword	.LC7
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC4
	.xword	23
	.xword	64
	.xword	.LC9
	.xword	.LC7
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC2
	.xword	29
	.xword	64
	.xword	.LC10
	.xword	.LC7
	.xword	0
	.xword	0
	.xword	0
	.xword	.LC5
	.xword	16
	.xword	64
	.xword	.LC11
	.xword	.LC7
	.xword	0
	.xword	0
	.xword	0
	.zero	32
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
