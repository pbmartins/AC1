#Exemplo1_Slides_Aula7_2012/2013

#int i;
#static int array[size];
#
#for(int i=0; i<size; i++)
#{
#	array[i] = 0;
#}

#Supondo que queriamos guardar 3 espaços!

	.data
array:	.space 12 		#(size=3, space=3*4=12)
	.align 2
	
	.text
	.globl main
	
main:
	#$t0=i; $t1=temp; $t2=&(array[0]); $a0=size (vamos considerar um valor neste caso);
	
	la $t2,array		#$t2 = &(array[0]);
	li $t0,0		#i = 0;
	
loop:
	bge $t0,3,endIf		#while(i<size){
	
	sll $t1,$t0,2		#temp = i * 4;
	addu $t1,$t2,$t1	#temp = &(array[i]);
	sw $0,0($t1)		#array[i] = 0;
	addi $t0,$t0,1		#i = i + 1;
	
	j loop			#}
	
endIf:
	jr $ra
	