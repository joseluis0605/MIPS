######## EJERCICIO  BOOLEANOS

###### A = (B<C)

	.data
A:	.space 1
B:	.space 4
C:	.space 4

frase:	.asciiz "introduce el numero:\n"
resultado:	.asciiz "el resultado es:\n"

	.text
main:
	li $v0, 4
	la $a0, frase
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, frase
	syscall
	
	li $v0, 5
	syscall

	move $t1, $v0
	
	slt $t3, $t0, $t1
	sb $t3, A
	
	li $v0, 4
	la $a0, resultado
	syscall
	
	li $v0, 1
	lb $a0, A
	syscall
	
	li $v0, 17
	la $a0, 0
	syscall