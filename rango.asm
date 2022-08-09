.data
inferior: 	.space 4
superior:	.space 4
nPares:		.word 0
nImpares:	.word 0
frase1:		.asciiz "introduce el inferior \n" 
frase2: 	.asciiz "introduce el superior \n" 
frase3: 	.asciiz "el resultado es \n" 
frasePar: 	.asciiz "total numeros pares \n" 
fraseImpar: 	.asciiz "total numeros impares \n" 
.text
main: 		
#pedimos e introducimos el primero
	li $v0, 4
	la $a0, frase1
	syscall 

	li $v0, 5
	syscall

	sw $v0, inferior
#pedimos e introducimos el segundo
	li $v0, 4
	la $a0, frase2
	syscall 

	li $v0, 5
	syscall
	sw $v0,superior 
	
#comprobamos que el inferior es mas pequeno
while:	
#condicion
	lw $s0, inferior
	lw $s1, superior
	blt $s0, $s1, endwhile
	j main
endwhile:
	

#ya lo tenemos bien ordenado

	lw $t0, inferior
	lw $t1, superior
	lw $t5, nPares
	lw $t6, nImpares
	
whileHastaIgualacion:
	bgt $t0, $t1, endWhileHastaIualacion

	rem $t3, $t1, $t0
	
if:
##cuando es igual a 0, osea PAR, sumamos 1 al contador de pares
	bge $t3, 1, else
	
	addi $t5, $t5, 1
	addi $t0, $t0,1
	j whileHastaIgualacion
	
else:
	addi $t6, $t6, 1
	addi $t0, $t0,1
	j whileHastaIgualacion
	
endWhileHastaIualacion:
	
	sw $t5, nPares
	sw $t5, nImpares
	
	li $v0, 4
	la $a0, frasePar
	
	sw $t5, nPares
	
