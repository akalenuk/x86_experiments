def head():
	return """
	.file	"fun.c"
	.text
	"""

def fun():
	return """
	.globl	fun
	.type	fun, @function
fun:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	addl	$1, %eax
	popl	%ebp
	ret
	"""

def tail():
	return """
	.size	fun, .-fun
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
	"""

print head() + fun() + tail()
