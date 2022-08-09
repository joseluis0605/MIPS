######## INTRODUCIR 5 NUMEROS EN UN ARRAY Y LOS VAMOS A SUMAR
	.data
suma:	.space 4
array:	.space 20
tira:	.asciiz "introduce el valor: "


	
	.text
main:

#### for (int i=0;i<5;i++)

#### ponemos puntero a la baase t0
	la $t0, array
	
#### inicializamos contador t5
	li $t5, 0

forintroducir:
####condicion
	bge $t5, 5, endintroducir
	
#### cuerpo imprimir + introducir + imprimir
	li $v0,4
	la $a0, tira
	syscall
	
	li $v0, 5
	syscall
	
	sw $v0, 0($t0)
	


#### sumamos
	addi $t0, $t0, 4
	addi $t5, $t5, 1
	
#### saltamos
	j forintroducir
	
endintroducir:


#### for (int i=0;i<5;i++)
	la $t0, array
	li $t5,0
	li $t3,0
forsuma:  bge $t5, 5, endforsuma

#### cuerpo del for
	lw $t4, 0($t0)
	add $t3,$t3,$t4
	
#### ampliamos
	addi $t0, $t0, 4
	addi $t5, $t5, 1

	j forsuma
endforsuma:

	sw $t3, suma
	
#### imprimimos resultado
	li $v0, 1
	lw $a0, suma
	syscall

#### cerramos el programa
	li $v0, 17
	li $a0, 0
	syscall
