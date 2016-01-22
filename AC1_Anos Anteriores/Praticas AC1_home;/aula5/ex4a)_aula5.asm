#Exercício4a)_Aula5_home;
#Bubble-sort com ponteiros;
#Apenas a parte do código com a ordenação;
#Falta ler e imprimir valores;

#Confirmar linha 35!


			.data
			.eqv SIZE,4
			.eqv LAST_IDX,3
			
lista:			.word 0:SIZE
			.align 2
			
str:			.asciiz "Introduza um número: "
str1: 			.asciiz "Conteúdo do array ordenado: "

			.text
			.globl main
			
main:
		#$t0=p; $t1=pultimo; $t2=aux; $t3=*p; $t4=*(p+1);
		#$t5=houveTroca;
		
			la $t0,lista			#p=lista;
			add $t1,$t0,12			#pultimo=lista+(SIZE-1); SIZE-1: 3 * 4 = 12
			
do:
			li $t5,0			#houveTroca=false;
			
			bge $t0,$t1,do_while
			
			lw $t3,0($t0)			#$t3=*p;
			lw $t4,4($t0)			#$t4=*(p+1); FUNCIONA???
			ble $t3,$t4,end_for		#*p<=*(p+1)
			move $t2,$t3			#aux=*p;
			move $t3,$t4			#*p=*(p+1);
			move $t4,$t2			#*(p+1)=aux;
			
			li $t5,1			#houveTroca=true;
end_for:
			addi $t0,$t0,4			#p++;
			j do
			
do_while:
			bnez $t5,do
			
end:
			jr $ra
			