	.arch armv8-a
	.file	"timer-application.c"
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.type	_sub_I_00099_0, %function
_sub_I_00099_0:
.LFB27:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	bl	__asan_init
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	b	__asan_version_mismatch_check_v8
	.cfi_endproc
.LFE27:
	.size	_sub_I_00099_0, .-_sub_I_00099_0
	.section	.init_array.00099,"aw"
	.align	3
	.xword	_sub_I_00099_0
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
