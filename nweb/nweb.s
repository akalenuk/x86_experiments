	.file	"nweb.c"
	.globl	extensions
	.section	.rodata
.LC0:
	.string	"gif"
.LC1:
	.string	"image/gif"
.LC2:
	.string	"jpg"
.LC3:
	.string	"image/jpeg"
.LC4:
	.string	"jpeg"
.LC5:
	.string	"png"
.LC6:
	.string	"image/png"
.LC7:
	.string	"zip"
.LC8:
	.string	"image/zip"
.LC9:
	.string	"gz"
.LC10:
	.string	"image/gz"
.LC11:
	.string	"tar"
.LC12:
	.string	"image/tar"
.LC13:
	.string	"htm"
.LC14:
	.string	"text/html"
.LC15:
	.string	"html"
	.data
	.align 32
	.type	extensions, @object
	.size	extensions, 80
extensions:
	.long	.LC0
	.long	.LC1
	.long	.LC2
	.long	.LC3
	.long	.LC4
	.long	.LC3
	.long	.LC5
	.long	.LC6
	.long	.LC7
	.long	.LC8
	.long	.LC9
	.long	.LC10
	.long	.LC11
	.long	.LC12
	.long	.LC13
	.long	.LC14
	.long	.LC15
	.long	.LC14
	.long	0
	.long	0
	.section	.rodata
	.align 4
.LC16:
	.string	"ERROR: %s:%s Errno=%d exiting pid=%d"
	.align 4
.LC17:
	.string	"<HTML><BODY><H1>nweb Web Server Sorry: %s %s</H1></BODY></HTML>\r\n"
.LC18:
	.string	"SORRY: %s:%s"
.LC19:
	.string	" INFO: %s:%s:%d"
.LC20:
	.string	"nweb.log"
.LC21:
	.string	"\n"
	.text
	.globl	write_log
	.type	write_log, @function
write_log:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$16244, %esp
	movl	12(%ebp), %eax
	movl	%eax, -16220(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -16224(%ebp)
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	8(%ebp), %eax
	cmpl	$43, %eax
	je	.L3
	cmpl	$44, %eax
	je	.L4
	cmpl	$42, %eax
	jne	.L2
	call	getpid
	movl	%eax, %ebx
	call	__errno_location
	movl	(%eax), %eax
	movl	%ebx, 20(%esp)
	movl	%eax, 16(%esp)
	movl	-16224(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-16220(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC16, 4(%esp)
	leal	-16204(%ebp), %eax
	movl	%eax, (%esp)
	call	sprintf
	jmp	.L2
.L3:
	movl	-16224(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-16220(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC17, 4(%esp)
	leal	-16204(%ebp), %eax
	movl	%eax, (%esp)
	call	sprintf
	leal	-16204(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
	movl	%eax, 8(%esp)
	leal	-16204(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	write
	movl	-16224(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-16220(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC18, 4(%esp)
	leal	-16204(%ebp), %eax
	movl	%eax, (%esp)
	call	sprintf
	jmp	.L2
.L4:
	movl	20(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-16224(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-16220(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC19, 4(%esp)
	leal	-16204(%ebp), %eax
	movl	%eax, (%esp)
	call	sprintf
	nop
.L2:
	movl	$420, 8(%esp)
	movl	$1089, 4(%esp)
	movl	$.LC20, (%esp)
	call	open
	movl	%eax, -16208(%ebp)
	cmpl	$0, -16208(%ebp)
	js	.L6
	leal	-16204(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
	movl	%eax, 8(%esp)
	leal	-16204(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16208(%ebp), %eax
	movl	%eax, (%esp)
	call	write
	movl	$1, 8(%esp)
	movl	$.LC21, 4(%esp)
	movl	-16208(%ebp), %eax
	movl	%eax, (%esp)
	call	write
	movl	-16208(%ebp), %eax
	movl	%eax, (%esp)
	call	close
.L6:
	cmpl	$42, 8(%ebp)
	je	.L7
	cmpl	$43, 8(%ebp)
	jne	.L1
.L7:
	movl	$3, (%esp)
	call	exit
.L1:
	movl	-12(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L9
	call	__stack_chk_fail
.L9:
	addl	$16244, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	write_log, .-write_log
	.section	.rodata
.LC22:
	.string	""
	.align 4
.LC23:
	.string	"failed to read browser request"
.LC24:
	.string	"request"
.LC25:
	.string	"GET "
.LC26:
	.string	"get "
	.align 4
.LC27:
	.string	"Only simple GET operation supported"
	.align 4
.LC28:
	.string	"Parent directory (..) path names not supported"
.LC29:
	.string	"GET /"
	.string	""
.LC30:
	.string	"get /"
	.string	""
	.align 4
.LC31:
	.string	"file extension type not supported"
.LC32:
	.string	"failed to open file"
.LC33:
	.string	"SEND"
	.align 4
.LC34:
	.string	"HTTP/1.0 200 OK\r\nContent-Type: %s\r\n\r\n"
	.text
	.globl	web
	.type	web, @function
web:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$52, %esp
	movl	$8096, 8(%esp)
	movl	$buffer.3920, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	read
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	je	.L11
	cmpl	$-1, -24(%ebp)
	jne	.L12
.L11:
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$.LC22, 8(%esp)
	movl	$.LC23, 4(%esp)
	movl	$43, (%esp)
	call	write_log
.L12:
	cmpl	$0, -24(%ebp)
	jle	.L13
	cmpl	$8095, -24(%ebp)
	jg	.L13
	movl	-24(%ebp), %eax
	addl	$buffer.3920, %eax
	movb	$0, (%eax)
	jmp	.L14
.L13:
	movb	$0, buffer.3920
.L14:
	movl	$0, -32(%ebp)
	jmp	.L15
.L18:
	movl	-32(%ebp), %eax
	addl	$buffer.3920, %eax
	movzbl	(%eax), %eax
	cmpb	$13, %al
	je	.L16
	movl	-32(%ebp), %eax
	addl	$buffer.3920, %eax
	movzbl	(%eax), %eax
	cmpb	$10, %al
	jne	.L17
.L16:
	movl	-32(%ebp), %eax
	addl	$buffer.3920, %eax
	movb	$42, (%eax)
.L17:
	addl	$1, -32(%ebp)
.L15:
	movl	-32(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jl	.L18
	movl	12(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$buffer.3920, 8(%esp)
	movl	$.LC24, 4(%esp)
	movl	$44, (%esp)
	call	write_log
	movl	$4, 8(%esp)
	movl	$.LC25, 4(%esp)
	movl	$buffer.3920, (%esp)
	call	strncmp
	testl	%eax, %eax
	je	.L19
	movl	$4, 8(%esp)
	movl	$.LC26, 4(%esp)
	movl	$buffer.3920, (%esp)
	call	strncmp
	testl	%eax, %eax
	je	.L19
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$buffer.3920, 8(%esp)
	movl	$.LC27, 4(%esp)
	movl	$43, (%esp)
	call	write_log
.L19:
	movl	$4, -32(%ebp)
	jmp	.L20
.L23:
	movl	-32(%ebp), %eax
	addl	$buffer.3920, %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	jne	.L21
	movl	-32(%ebp), %eax
	addl	$buffer.3920, %eax
	movb	$0, (%eax)
	jmp	.L22
.L21:
	addl	$1, -32(%ebp)
.L20:
	cmpl	$8095, -32(%ebp)
	jle	.L23
.L22:
	movl	$0, -36(%ebp)
	jmp	.L24
.L26:
	movl	-36(%ebp), %eax
	addl	$buffer.3920, %eax
	movzbl	(%eax), %eax
	cmpb	$46, %al
	jne	.L25
	movl	-36(%ebp), %eax
	addl	$1, %eax
	movzbl	buffer.3920(%eax), %eax
	cmpb	$46, %al
	jne	.L25
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$buffer.3920, 8(%esp)
	movl	$.LC28, 4(%esp)
	movl	$43, (%esp)
	call	write_log
.L25:
	addl	$1, -36(%ebp)
.L24:
	movl	-32(%ebp), %eax
	subl	$1, %eax
	cmpl	-36(%ebp), %eax
	jg	.L26
	movl	$6, 8(%esp)
	movl	$.LC29, 4(%esp)
	movl	$buffer.3920, (%esp)
	call	strncmp
	testl	%eax, %eax
	je	.L27
	movl	$6, 8(%esp)
	movl	$.LC30, 4(%esp)
	movl	$buffer.3920, (%esp)
	call	strncmp
	testl	%eax, %eax
	jne	.L28
.L27:
	movl	$542393671, buffer.3920
	movl	$1684957487, buffer.3920+4
	movl	$1747875941, buffer.3920+8
	movl	$7105908, buffer.3920+12
.L28:
	movl	$buffer.3920, (%esp)
	call	strlen
	movl	%eax, -20(%ebp)
	movl	$0, -28(%ebp)
	movl	$0, -32(%ebp)
	jmp	.L29
.L32:
	movl	-32(%ebp), %eax
	movl	extensions(,%eax,8), %eax
	movl	%eax, (%esp)
	call	strlen
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %edx
	movl	-32(%ebp), %eax
	movl	extensions(,%eax,8), %eax
	movl	-16(%ebp), %ecx
	movl	-20(%ebp), %ebx
	subl	%ecx, %ebx
	movl	%ebx, %ecx
	addl	$buffer.3920, %ecx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	strncmp
	testl	%eax, %eax
	jne	.L30
	movl	-32(%ebp), %eax
	movl	extensions+4(,%eax,8), %eax
	movl	%eax, -28(%ebp)
	jmp	.L31
.L30:
	addl	$1, -32(%ebp)
.L29:
	movl	-32(%ebp), %eax
	movl	extensions(,%eax,8), %eax
	testl	%eax, %eax
	jne	.L32
.L31:
	cmpl	$0, -28(%ebp)
	jne	.L33
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$buffer.3920, 8(%esp)
	movl	$.LC31, 4(%esp)
	movl	$43, (%esp)
	call	write_log
.L33:
	movl	$0, 4(%esp)
	movl	$buffer.3920+5, (%esp)
	call	open
	movl	%eax, -12(%ebp)
	cmpl	$-1, -12(%ebp)
	jne	.L34
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$buffer.3920+5, 8(%esp)
	movl	$.LC32, 4(%esp)
	movl	$43, (%esp)
	call	write_log
.L34:
	movl	12(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$buffer.3920+5, 8(%esp)
	movl	$.LC33, 4(%esp)
	movl	$44, (%esp)
	call	write_log
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC34, 4(%esp)
	movl	$buffer.3920, (%esp)
	call	sprintf
	movl	$buffer.3920, (%esp)
	call	strlen
	movl	%eax, 8(%esp)
	movl	$buffer.3920, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	write
	jmp	.L35
.L36:
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$buffer.3920, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	write
.L35:
	movl	$8096, 8(%esp)
	movl	$buffer.3920, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	read
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	jg	.L36
	movl	$1, (%esp)
	call	exit
	.size	web, .-web
	.section	.rodata
.LC35:
	.string	"-?"
	.align 4
.LC36:
	.ascii	"hint: nweb Port-Number Top-Directory\n\n\tnweb is a small "
	.string	"and very safe mini web server\n\tnweb only servers out file/web pages with extensions named below\n\t and only from the named directory or its sub-directories.\n\tThere is no fancy features = safe and secure.\n\n\tExample: nweb 8181 /home/nwebdir &\n\n\tOnly Supports:"
.LC37:
	.string	" %s"
	.align 4
.LC38:
	.string	"\n\tNot Supported: URLs including \"..\", Java, Javascript, CGI\n\tNot Supported: directories / /etc /bin /lib /tmp /usr /dev /sbin \n\tNo warranty given or implied\n\tNigel Griffiths nag@uk.ibm.com"
.LC39:
	.string	"/"
.LC40:
	.string	"/etc"
.LC41:
	.string	"/bin"
.LC42:
	.string	"/lib"
.LC43:
	.string	"/tmp"
.LC44:
	.string	"/usr"
.LC45:
	.string	"/dev"
.LC46:
	.string	"/sbin"
	.align 4
.LC47:
	.string	"ERROR: Bad top directory %s, see nweb -?\n"
	.align 4
.LC48:
	.string	"ERROR: Can't Change to directory %s\n"
.LC49:
	.string	"nweb starting"
.LC50:
	.string	"socket"
.LC51:
	.string	"system call"
	.align 4
.LC52:
	.string	"Invalid port number (try 1->60000)"
.LC53:
	.string	"bind"
.LC54:
	.string	"listen"
.LC55:
	.string	"accept"
.LC56:
	.string	"fork"
	.text
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$48, %esp
	cmpl	$2, 8(%ebp)
	jle	.L38
	cmpl	$3, 8(%ebp)
	jg	.L38
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	$.LC35, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L39
.L38:
	movl	$.LC36, (%esp)
	call	printf
	movl	$0, 24(%esp)
	jmp	.L40
.L41:
	movl	24(%esp), %eax
	movl	extensions(,%eax,8), %eax
	movl	%eax, 4(%esp)
	movl	$.LC37, (%esp)
	call	printf
	addl	$1, 24(%esp)
.L40:
	movl	24(%esp), %eax
	movl	extensions(,%eax,8), %eax
	testl	%eax, %eax
	jne	.L41
	movl	$.LC38, (%esp)
	call	puts
	movl	$0, (%esp)
	call	exit
.L39:
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	$2, 8(%esp)
	movl	$.LC39, 4(%esp)
	movl	%eax, (%esp)
	call	strncmp
	testl	%eax, %eax
	je	.L42
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	$5, 8(%esp)
	movl	$.LC40, 4(%esp)
	movl	%eax, (%esp)
	call	strncmp
	testl	%eax, %eax
	je	.L42
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	$5, 8(%esp)
	movl	$.LC41, 4(%esp)
	movl	%eax, (%esp)
	call	strncmp
	testl	%eax, %eax
	je	.L42
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	$5, 8(%esp)
	movl	$.LC42, 4(%esp)
	movl	%eax, (%esp)
	call	strncmp
	testl	%eax, %eax
	je	.L42
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	$5, 8(%esp)
	movl	$.LC43, 4(%esp)
	movl	%eax, (%esp)
	call	strncmp
	testl	%eax, %eax
	je	.L42
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	$5, 8(%esp)
	movl	$.LC44, 4(%esp)
	movl	%eax, (%esp)
	call	strncmp
	testl	%eax, %eax
	je	.L42
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	$5, 8(%esp)
	movl	$.LC45, 4(%esp)
	movl	%eax, (%esp)
	call	strncmp
	testl	%eax, %eax
	je	.L42
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	$6, 8(%esp)
	movl	$.LC46, 4(%esp)
	movl	%eax, (%esp)
	call	strncmp
	testl	%eax, %eax
	jne	.L43
.L42:
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC47, (%esp)
	call	printf
	movl	$3, (%esp)
	call	exit
.L43:
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	chdir
	cmpl	$-1, %eax
	jne	.L44
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC48, (%esp)
	call	printf
	movl	$4, (%esp)
	call	exit
.L44:
	call	fork
	testl	%eax, %eax
	je	.L45
	movl	$0, %eax
	jmp	.L59
.L45:
	movl	$1, 4(%esp)
	movl	$17, (%esp)
	call	signal
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	signal
	movl	$0, 24(%esp)
	jmp	.L47
.L48:
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	close
	addl	$1, 24(%esp)
.L47:
	cmpl	$31, 24(%esp)
	jle	.L48
	call	setpgrp
	call	getpid
	movl	12(%ebp), %edx
	addl	$4, %edx
	movl	(%edx), %edx
	movl	%eax, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC49, 4(%esp)
	movl	$44, (%esp)
	call	write_log
	movl	$0, 8(%esp)
	movl	$1, 4(%esp)
	movl	$2, (%esp)
	call	socket
	movl	%eax, 32(%esp)
	cmpl	$0, 32(%esp)
	jns	.L49
	movl	$0, 12(%esp)
	movl	$.LC50, 8(%esp)
	movl	$.LC51, 4(%esp)
	movl	$42, (%esp)
	call	write_log
.L49:
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, 36(%esp)
	cmpl	$0, 36(%esp)
	js	.L50
	cmpl	$60000, 36(%esp)
	jle	.L51
.L50:
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	$0, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$.LC52, 4(%esp)
	movl	$42, (%esp)
	call	write_log
.L51:
	movw	$2, serv_addr.3948
	movl	$0, (%esp)
	call	htonl
	movl	%eax, serv_addr.3948+4
	movl	36(%esp), %eax
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	call	htons
	movw	%ax, serv_addr.3948+2
	movl	$16, 8(%esp)
	movl	$serv_addr.3948, 4(%esp)
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	bind
	testl	%eax, %eax
	jns	.L52
	movl	$0, 12(%esp)
	movl	$.LC53, 8(%esp)
	movl	$.LC51, 4(%esp)
	movl	$42, (%esp)
	call	write_log
.L52:
	movl	$64, 4(%esp)
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	listen
	testl	%eax, %eax
	jns	.L53
	movl	$0, 12(%esp)
	movl	$.LC54, 8(%esp)
	movl	$.LC51, 4(%esp)
	movl	$42, (%esp)
	call	write_log
.L53:
	movl	$1, 28(%esp)
.L58:
	movl	$16, 20(%esp)
	leal	20(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$cli_addr.3947, 4(%esp)
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	accept
	movl	%eax, 40(%esp)
	cmpl	$0, 40(%esp)
	jns	.L54
	movl	$0, 12(%esp)
	movl	$.LC55, 8(%esp)
	movl	$.LC51, 4(%esp)
	movl	$42, (%esp)
	call	write_log
.L54:
	call	fork
	movl	%eax, 44(%esp)
	cmpl	$0, 44(%esp)
	jns	.L55
	movl	$0, 12(%esp)
	movl	$.LC56, 8(%esp)
	movl	$.LC51, 4(%esp)
	movl	$42, (%esp)
	call	write_log
	jmp	.L56
.L55:
	cmpl	$0, 44(%esp)
	jne	.L57
	movl	32(%esp), %eax
	movl	%eax, (%esp)
	call	close
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	web
	jmp	.L56
.L57:
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	close
.L56:
	addl	$1, 28(%esp)
	jmp	.L58
.L59:
	leave
	ret
	.size	main, .-main
	.local	buffer.3920
	.comm	buffer.3920,8097,32
	.local	serv_addr.3948
	.comm	serv_addr.3948,16,4
	.local	cli_addr.3947
	.comm	cli_addr.3947,16,4
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
