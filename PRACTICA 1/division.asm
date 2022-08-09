#### VAMOS A HACER LA DIVISION 
	.data
dividendo:	.space	4
divisor:	.space	4
resto:		.space 	4
cociente:	.space 4
tira:		.asciiz	"introduce el dividendo: "
tira2:		.asciiz	"introduce el divisor: "
tira3:		.asciiz "el resto es: "
tira4:		.asciiz "el cociente es: "

	.text
main: 	
	li $v0, 4
	la $a0, tira
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, tira2
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
#### T0 DIVIDENDO y T1 DIVISOR

	beqz $t1, ERROR
	
	div $t0, $t1
#### T2 COCIENTE y T3 RESTO
	mflo $t2
	mfhi $t3
	
	sw $t2, cociente
	sw $t3, resto
	
	
	
	li $v0, 4
	la $a0, tira3
	syscall
	
	li $v0, 1
	lw $a0, resto
	syscall
	
	li $v0, 4
	la $a0, tira4
	syscall
	
	li $v0, 1
	lw $a0, cociente
	syscall
	
ERROR: 	
	
##### Cerramos el sistema con return 0
	li $v0, 17
	li $a0, 0
	syscall