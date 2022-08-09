#########PRACTICA CON BUCLE WHILE

	.data
acumulador:	.word 0
incremento:	.word 1
frase: 		.asciiz "el resultado final es: \n"
fraseayuda:	.asciiz "hemos incrementado el resultado\n"

	.text
main:
	lw $t0, acumulador
	lw $t1, incremento
	
while:
	bge $t1, 10, endwhile
	
	addu $t0, $t0, $t1
	addi $t1, $t1, 1
	
	li $v0, 4
	la $a0, fraseayuda
	syscall
	
	j while

endwhile:
	sw $t0, acumulador

	li $v0, 4
	la $a0, frase
	syscall
	
	li $v0, 1
	lw $a0, acumulador
	syscall
	
	li $v0, 17
	la $a0, 0
	syscall
	
	