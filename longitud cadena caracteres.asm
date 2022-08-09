#### CALCULAMOS LA LONGITUD DE UNA CADENA DE CARACTERES####

	.data
cadena: 	.asciiz "HOLA"
		.space 7
lon: 		.space 4


	.text

	li $s0, 0 # contador es 0 y se almacena en s0
	
while: 
	la $t0, cadena #t0 va a apuntar siempre a la primera posicion del vector
	addu $t1, $t0, $s0
	lb $t2, 0($t1)
	beqz $t2, end
	addiu $s0,$s0, 1
	
	j while
end:
	
	sw $s0, lon
	
##cerramos el return 0
	li $v0, 17
	li $a0, 0
	syscall