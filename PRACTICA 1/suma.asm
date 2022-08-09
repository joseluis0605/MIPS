####### SUMA DE DOS NUMEROS PEDIDOS AL USUARIO Y MOSTRADOS POR PANTALL

	.data
sumando1:	.space	4
sumando2:	.space	4
resultado:	.space 	4
tira:	.asciiz	"introduce el sumando: "
tira2:	.asciiz "el resultado es: "

	.text
main: 	
	li $v0, 4
	la $a0, tira
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, tira
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	add $t4, $t1, $t0
	
	sw $t4, resultado
	
	li $v0, 4
	la $a0, tira2
	syscall
	
	li $v0, 1
	lw $a0, resultado
	syscall
	
	
	
	
	
##### Cerramos el sistema con return 0
	li $v0, 17
	li $a0, 0
	syscall
	