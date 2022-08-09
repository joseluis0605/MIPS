###### BUCLE DO-WHILE
	.data
acumulador: 	.word 0
incremento:	.word 0
resultado:	.space 4
frasefinal:	.asciiz "el resultado final es:	\n"

	.text
main:
	lw $t0, acumulador
	lw $t1, incremento
do:	
	
ifinterno:	bge $t1, 10, end
	add $t0, $t0, $t1
	addi $t1, $t1, 1
	
while:	ble $t1, 10,do

end:
	sw $t0, acumulador
	
	li $v0, 4
	la $a0, frasefinal
	syscall
	
	li $v0, 1
	lw $a0, acumulador
	syscall
	
	li $v0, 17
	la $a0, 0
	syscall