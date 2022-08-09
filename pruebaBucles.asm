	.data
numero1: .space 4
contador: .word 0
tablaMultiplicar: .space 4
frase1:	.asciiz "introduce el numero"
par: .asciiz "es par"
impar: .asciiz "es impar"
terminar: .asciiz "TERMINAMOS EJEMPLO DE BUCLE\n"
comenzar: .asciiz "EMPEZAMOS CON NUEVO BUCLE\n"
frasecontador: .ascii "total de contador"
	
	.text
main:
	li $v0,4
	la $a0, frase1
	syscall
	
	li $v0, 5
	syscall
	
#vemos si es par o no el numero, en caso de que sea impar le sumamos 1
if:	move $t0,$v0
	div $t3, $t0, 2
	mfhi $t2
	bnez $t2, else
	
	li $v0, 4
	la $a0, par
	syscall
	j fin1
	
else: 	li $v0, 4
	la $a0, impar
	syscall
	
fin1:
	li $v0, 4
	la $a0, terminar
	syscall
##################################################
#INTRODUCIR DATOS SI ES MENOS DE 10 PARA EL WHILE
	li $v0, 4
	la $a0, comenzar
	syscall
	
	li $t0, 0
	li $s0, 0
	
	
	
WHILE: 	bge $t0, 10, ENDWHILE
	
CUERPOWHILE:	li $v0, 4
		la $a0, frase1
		syscall
		
		li $v0, 5
		syscall
		
		move $t0, $v0
		
IFCHICO:	bge $t0,10, ENDIF
		addi $s0, $s0, 1
ENDIF:
		j WHILE
		
ENDWHILE:	sw $s0, contador

		li $v0, 4
		la $a0, frasecontador
		syscall
		
		
		li $v0, 1
		lw $a0, contador
		syscall
cerrar:
	li $v0, 17
	la $a0, 0
	syscall