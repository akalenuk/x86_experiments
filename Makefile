all:
	gcc -c main.c
	python gen_asm.py > py_fun.s
	as py_fun.s -o py_fun.o
	gcc -o test main.o py_fun.o
