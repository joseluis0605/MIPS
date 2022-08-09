.data


dividendo:	.space 4
divisor:	.space 4
cociente:	.space 4
resto:		.space 4



frase1:		.asciiz 
frase2:		.asciiz 
solucion:	.asciiz 
sresto:		.asciiz 
serror:		.asciiz 

		
		.text
main:
	li 	$v0,4 
	la	$a0,frase1 
	syscall  	
	

	li	$v0,5 
	syscall
	
	sw 	$v0,dividendo
	lw	$s1,dividendo

	li 	$v0,4 
	la	$a0,frase2
	syscall

	li	$v0,5
	syscall
	sw	$v0,divisor
	lw	$s2,divisor				
	
	
	beq	$s2,0,error
	
	div	$s1,$s2 
	
	mflo	$s1 
	sw	$s1,cociente
	
  	mfhi	$s2, 
	sw	$s2,resto
		

	li	$v0,4
	la	$a0,solucion
	syscall
	
	li	$v0,1
	lw	$a0,cociente
	syscall
	
	li	$v0,4
	la	$a0,sresto
	syscall
	
	li	$v0,1
	lw	$a0,resto
	syscall

error:
	bne	$s2,0,end
	
	li	$v0,4
	la	$a0,serror
	syscall

