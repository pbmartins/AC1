#Exercício3a)_Aula5_home;
#Ordena por ordem crescente os elementos de um array de números inteiros (bubble-sort)
#Diminuí o tamanho do array para facilitar a execução;

#Por acabar!

			.data
			.eqv SIZE,4
			.eqv LAST_IDX,3			#SIZE-1
			
lista:			.space 16			#SIZE=4, logo space = 4 * 4 = 16;
			.align 2
			
str:			.asciiz "Introduza um número: "
str1:			.asciiz "\nConteúdo do b-sorted array:\n"

			.text
			.globl main
		
main:	
		#$t0=i; $t2=byte_i; $t3=byte_i_next;
		#$t4=aux; $t5=houveTroca;
		#$t6=p; $t7=*p;
		#$v0=value; $v1=value_i_next;
		
			li $t0,0				#i=0
			la $t6,lista				#$t6=p=lista;

for_lp1:	
			#código para ler valores do teclado (usando índices);
			#como fazer com ponteiros?
			
			bge $t0,SIZE,bubble_sort		#i>=SIZE	
				
			#print_str(str)
			li $v0,4
			la $a0,str
			syscall
			
			#read_int			#$v0=decimal value
			li $v0,5
			syscall
			
			sll $t2,$t0,2			#$t3=int_byte_idx=4*i
			sw $v0,lista($t2)		#lista[i]=read_int();
		
			addi $t0,$t0,1			#i++
			b for_lp1
			
bubble_sort:
			li $t5,0			#houveTroca=false;
			li $t0,0			#i=0;
				
do:

			bge $t0,LAST_IDX,do_while
			
			sll $t2,$t0,2			#$t6=i*4;
			lw $v0,lista($t2)		#$v0 = lista[i];
			addi $t3,$t2,4			#$t3=4*(i+1);
			lw $v1,lista($t3)		#$v1=lista[i+1];
						
			ble $v0,$v1,do_while2		#lista[i]<=lista[i+1];
			move $t4,$v0			#aux=lista[i];
			sw $v1,lista($t2)		#lista[i]=lista[i+1];
			sw $t4,lista($t3)		#listaa[i+1]=aux;
			
			li $t5,1			#houveTroca=true;
					
do_while2:
			addi $t0,$t0,1			#i++;
			j do
					
do_while:
			#código para imprimir os valores ordenados no ecrã (ponteiros);
			#como fazer com índices?
			bnez $t5,bubble_sort
	
			bgeu $t0,SIZE,end			#(i>=SIZE(4))
			
			lw $t7,0($t6)			#$t7 = *p;
			
			#print_str(str1)
			li $v0,4
			la $a0,str1
			syscall
			
			#print_int10(*p=$t7)
			li $v0,1
			move $a0,$t7
			syscall
			
			addiu $t6,$t6,4			#p++; (como são inteiros, são lidos de 4 em 4 bits);
			addi $t0,$t0,1			#i++;
			j do_while

end:
			jr $ra		

			
