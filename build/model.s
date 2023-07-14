	.file	"model.c"
	.text
	.globl	default_thread
	.bss
	.align 32
	.type	default_thread, @object
	.size	default_thread, 72
default_thread:
	.zero	72
	.globl	default_task
	.data
	.align 32
	.type	default_task, @object
	.size	default_task, 72
default_task:
	.long	-1
	.long	-1
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
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
