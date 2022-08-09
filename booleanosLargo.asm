##### EJERCICIO BOOLEANOS 2
	.data
x:	.space 4 ## t0
y: 	.space 4 ## t1
zb:	.space 1 ## s4
xb:	.space 1 ## t2
yb:	.space 1 ## t3
frase: 	.asciiz "introduce numero:\n"
resultado:	.asciiz "el resultado es:\n"

	.text
main:
### metemos vamor a los naturales
##valor x
	li $v0, 4
	la $a0, frase
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
##valor y
	li $v0, 4
	la $a0, frase
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
## x > y y se almacena en $s0
	slt $s0, $t1, $t0
	
if: 	beq $s0, 0, end

##introducimos el xb y el yb
	li $v0, 4
	la $a0, frase
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	
	li $v0, 4
	la $a0, frase
	syscall
	
	li $v0, 5
	syscall
	
	move $t3, $v0
	
	
## hacemos el not almacena en s1 y despues el OR

	not $s1, $t2
	or $s3, $s1, $t3
	
ifsegundaparte:
	beqz $s3, end
		
andfinal: 
	and $s5, $s3,$s0
	sb $s5, zb
	
##imprimimos
	li $v0, 1
	lb $a0, zb
	syscall
		
	j cerrar
											
##imprimir 0 como resultado								
end:	
	li $s4, 0
	sb $s4, zb
	
	li $v0, 1
	lb $a0, zb
	syscall
	
cerrar:
	li $v0, 17
	la $a0, 0
	syscall
	
	
	
	