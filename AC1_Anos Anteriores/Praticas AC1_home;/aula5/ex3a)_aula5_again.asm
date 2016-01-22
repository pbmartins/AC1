#Exercício3a)_Aula5_home_again;
#Ordena por ordem crescente os elementos de um array de números inteiros (bubble-sort)
#Diminuí o tamanho do array para facilitar a execução;

#Erros!!!
#Imprime apenas o primeiro número!!!


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
		#$t0=i; $t1=p; $t2=lista; $t3=lista[i+1]; $t4=aux;
		#$t5=houveTroca;
		
			li $t0,0		#i=0;
			la $t1,lista		#p=lista;
			
lervalores:
			bge $t0,SIZE,end_lervalores
			
			#print_str(str)
			li $v0,4
			la $a0,str
			syscall
			
			#read_int()
			li $v0,5
			syscall
			
			sw $v0,0($t1)		#$v0=value=*p;
			
			addiu $t1,$t1,4		#p++;
			addi $t0,$t0,1		#i++;
			
			j lervalores
			
end_lervalores:
			li $t0,0		#i=0;
			la $t1,lista		#p=lista;
			
do:
			li $t5,0		#houveTroca=false;
			li $t0,0
			la $t1,lista
			
for:
			bge $t0,LAST_IDX,end_for		#i>=SIZE-1
			
			lw $t2,0($t1)		#$t2=lista[i];
			lw $t3,4($t1)		#$t3=lista[i+1]
			
			ble $t0,LAST_IDX,end_if
			
			move $t4,$t2		#aux=lista[i];
			move $t2,$t3		#lista[i]=lista[i+1];
			move $t3,$t4		#lista[i+1]=aux;
			
			li $t5,1		#houveTroca=true;
			
end_if:
			addi $t0,$t0,1		#i++;
			j for
			
end_for:
			bnez $t5,do
			
imprimevalores:
			#print_str(str1)
			li $v0,4
			la $a0,str1
			syscall
			
			bge $t0,SIZE,end_imprimevalores
			sll $t4,$t0,2			#$t4=i*4;
			addu $t6,$t4,$t1		#$t6=lista[i]=i+&list[i]
			lw $a0,0($t6)
			
			#print_int10($a0)
			li $v0,1
			syscall
			
			#para que serve isto???
			la $a0,0x20
			li $v0,11
			syscall
			
			addi $t0,$t0,1			#i=0;
			j imprimevalores
			
end_imprimevalores:
			jr $ra