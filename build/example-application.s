	.file	"example-application.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_sub_I_00099_0, @function
_sub_I_00099_0:
.LFB0:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__asan_init@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__asan_version_mismatch_check_v8@PLT
	.cfi_endproc
.LFE0:
	.size	_sub_I_00099_0, .-_sub_I_00099_0
	.section	.init_array.00099,"aw"
	.align 8
	.quad	_sub_I_00099_0
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
