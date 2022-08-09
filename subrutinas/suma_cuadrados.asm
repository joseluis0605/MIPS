#################################################
# ESTRUCTURA DE COMPUTADORES
# Curso 2016/2017
#################################################
# Declaracion de variables y tiras de caracteres
#################################################
         .data
# int n,s;
n:       .space  4
s:       .space  4
# Tiras de caracteres utilizadas en printf
tira1:   .asciiz "Introduzca el valor de n: "
tira2:   .asciiz "El valor de la suma de los cuadrados es: "
tira3:   .asciiz "\n"

#################################################
# Implementacion del programa principal
#################################################
         .text
# Reservar marco de pila
         addi    $sp,$sp,-16
# printf("Introduzca el valor de n: ");
         li      $v0,4
         la      $a0,tira1
         syscall
# scanf("%d",&n);
         li      $v0,5
         syscall
         sw      $v0,n
# s = sumar(n);
    # Copiar argumentos en registros
         lw      $a0,n
    # Llamar a la subrutina
         jal     sumar
    # Recoger valor de retorno y ponerlo en la variable s
         sw      $v0,s 
# printf("El valor de la suma de los cuadrados es: %d\n",s);
         li      $v0,4
         la      $a0,tira2
         syscall
         li      $v0,1
         lw      $a0,s
         syscall
         li      $v0,4
         la      $a0,tira3
         syscall
# Eliminar marco de pila
         addi    $sp,$sp,16
# return 0;
         li      $v0,17
         li      $a0,0
         syscall
# Fin del programa

#################################################
# Implementacion de la subrutina
#################################################
# int sumar (int num) {
#################################################
# int i, ac;
   # Asignacion de variables
      # $s0: i
      # $s1: ac
# Comienza subrutina
# Guardar registros salvados en pila
sumar:   addi    $sp,$sp,-8
         sw      $s0,0($sp)
         sw      $s1,4($sp)
# Cuerpo de la subrutina
body_sumar:
# ac = 0;
         li      $s1,0
# for (i = 1; i <= num; i++)
for:
         li      $s0,1
cond_for:
         bgt     $s0,$a0,end_for
# ac = ac+i*i;
         mul     $t0,$s0,$s0
         addu    $s1,$s1,$t0
inc_for:
         addiu   $s0,$s0,1
# Fin del for
         b       cond_for
end_for:
# return ac;
         move    $v0,$s1
# END; {de la funcion}
   # Restaurar registros salvados en pila
end_sumar:
         lw      $s0,0($sp)
         lw      $s1,4($sp)
         addi    $sp,$sp,8
   # Retornar
ret_sumar:
         jr      $ra 
# Fin de la subrutina
