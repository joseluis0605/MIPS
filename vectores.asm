	.data
# Cadena de 10 caracteres con cuatro ocupados m�s el car�cter nulo
t:	.asciiz	"Hola"	# Contenido �legible� de la tira
	.space	5	# Hueco de relleno al tama�o m�ximo
# Longitud de la cadena
	.align	2
lon:	.space	4

	.text
##################################################################################
#                                                                                #
# C�LCULO DE LA LONGITUD DE UNA TIRA DE CARACTERES                               #
#                                                                                #
##################################################################################
#
# C�DIGO EN C
#
##########################################
#
# char t[10];
# int lon;
# 
# lon = 0;
# while (t[lon] != '\0')
#    lon = lon+1;
#
##########################################
# lon: mantenemos una copia en el registro $s0, y luego lo copiamos en memoria
# temporales: $t0 ... $t2
##########################################
#    lon = 0;
	li	$s0,0
#    while (t[lon] != '\0')
while:
#         Poner puntero al comienzo del vector
	la	$t0,t
#         Poner puntero al elemento i-�simo
	addu	$t1,$t0,$s0
#         Leer elemento i-�simo
	lbu	$t2,0($t1)
#         Si el car�cter le�do es el nulo, salir
	beqz	$t2,fin
#     Cuerpo del bucle
cuerpo_while:
#      lon = lon+1;
	addiu	$s0,$s0,1
# Saltar al comienzo del bucle
	b	while
fin:
	sw	$s0,lon
# Fin del programa
	li	$v0,17
	li	$a0,0
	syscall
