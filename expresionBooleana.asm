####### EXPRESION BOOLEANA
#### C = (A < 15 && A >= 5) || (B > A && A >= 10)####
#### EVALUACION PEREZOSA

	.data
a:	.space 4
b:	.space 4
c:	.space 1


	.text
main:

	
	li $v0, 5
	syscall
	
	sw $v0, a
	
	
	li $v0, 5
	syscall
	
	sw $v0, b
	
	

#### C = (A < 15 && A >= 5) || (B > A && A >= 10)####


### A < 15
	lw $t0, a
	lw $t1, b
	slti $s0, $t0, 15
	beqz $s0, segundoOR
### A >= 5 
	sgeu $s1, $t0, 5
	beqz $s1, segundoOR
### hacemos AND y lo ponemos en t5	
	and $t5, $s1, $s0
	beq $t5, 1, finBUENO
	
segundoOR:

#### B > A
	
	sgt $t5, $t1, $t0
	beqz $t5, finFAKE
	
#### A >= 10 
	sge $s0, $t0, 10
	beqz $s0, finFAKE
##### AND
	and $t5, $t5, $s0
	beq $t5, 1, finFAKE

finFAKE:

	sb $t5, c
	j cerrar
finBUENO:
	

	sb $t5, c
### imprimimos
	li $v0, 1
	lb $a0, c
	syscall

#### cerramos
cerrar:
	li $v0, 17
	li $a0, 0
	syscall
	
	






	