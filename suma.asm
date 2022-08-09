

	.data
sumando1: 	.space 4
sumando2: 	.space 4
resultado: 	.space 4

frase1:		.asciiz "introduce el sumando 1"
frase2: 	.asciiz "introduce el sumando 2	"
frase3:		.asciiz "el resultado es: "

	.text 
main:	li $v0,4
	la $a0, frase1
	syscall  	
	
	li $v0, 4
	la $a0, frase2
	syscall 
	
	lw $s0, sumando1
	lw $s1, sumando2
	add $s3, $s0, $s1
	
	
	
	
	
	
	
