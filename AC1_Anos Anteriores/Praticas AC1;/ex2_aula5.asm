#Ana Madalena_ex2_aula5
#funciona!!!
		
		.include "tp3_macros.asm"
		.data
		
lista:		.word 8,-4,3,5,124,-15,87,9,27,15
		.align 2

str1:		.asciiz "\nConteúdo do array:\n"
str2:		.asciiz " , "

		.text
		.globl main
		
main:		
		#$t0=p; $t1=i; $t2=*p
		li $t1,0		#$t1=i=0;
		la $t0,lista		#$t0 = p = lista;
		
		print_str(str1)
		
while:		
		bge $t1,10,end		#while(i<size){
		lw $t2,0($t0)		#$t0 = p = lista = $t2 = *p;
		
		print_int($t2)		#print_int10(*p);
		print_str(str2)		#print_str(",");
		
		addiu $t0,$t0,4		#p++
		addiu $t1,$t1,1		#i++
		j while			#}
		
end:		done
		
			
