##############ejemplo if-else video

	.data
x: 	.word  0 ####REGISTRO t0
y:	.space  4 ####REGISTRO t1
resultadox:	.space 4
resultadoy: 	.space 4
tira: 	.asciiz "el resultado es: "
frase: 	.asciiz "introduce el numero x\n"
frase2: .asciiz "introduce el numero y\n"

	.text
main:	li $v0, 4
	la $a0, frase
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, frase2
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
if: 	bge $t1, $t0, else

	addi $t0, $t0, 2
	sw $t0, x
	j endif
	
else:	addi $t0, $t0, -2
	sw $t0, x
	
endif:

final:	li $v0, 4
	la $a0, tira
	syscall
	
	li $v0, 1
	lw $a0, x
	syscall
	
	li $v0, 1
	lw $a0, y
	syscall
	
cerramos:	li $v0, 17
		la $a0, 0
		syscall
	
	
	
	