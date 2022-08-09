##### ARRAY DE NUMEROS Y VAMOS A SUMAR TODOS LOS ELEMENTOS #########
	.data
tira: 	.asciiz "en este ejercicio vamos a sumar los elementos del vector de 5 posiciones\n"
array:	.word 1,2,3,4,5
suma:	.space 4


	.text
main: 	
	li $v0, 4
	la $a0, tira
	syscall
	
##### apuntamos con puntero a la base
	la $t0, array
##### puntero movil
	la $t1, array
##### for (int i=0, i<5, i++) siendo nuestro contador el registro t5
	li $t5, 0
	li $t3, 0
	li $t4, 0
##### CONDICION FOR
for: 	bgt $t5, 5, endfor
##### $t3 va a ser el que coja la variable y t4 el acumulador
	lw $t3, 0($t1)
	add $t4, $t4, $t3
##### sumamos uno mas al contador
	addi $t5, $t5, 1
##### apuntamos 4 posiciones mas
	addi $t1,$t1,4
##### saltamos
	j for
##### final del for
endfor:
##### cargamos el acumulador
	sw $t4, suma
#####  imprimimos nuestro valor
	li $v0, 1
	lw $a0, suma
	syscall



	
##### cerrramos el programa correctamente
	li $v0, 17
	li $a0, 0
	syscall
