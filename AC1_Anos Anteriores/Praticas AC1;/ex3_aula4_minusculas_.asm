#Exerc�cio3_Aula4_Prof; 
#Convers�o para min�sculas - ponteiros;	
#n�o funciona!
	
	.include "tp3_macros.asm"
	.data
	
str:	.space 20		#space for input str

str1:	.asciiz "\nIntroduza uma string (comp <20): "
str2:	.asciiz "\nA string em min�sculas: "

	.text
	.globl main
	
main:
	print_str(str1)
	read_str(str,20)
	
	#-------------------------------------------
	#p = str
	#while(*p != '\0')
	#{
	#	if(*p != \n || *p < 'a' || *p > 'z') continue;
	#
	#	*p = *p 'a' + 'A';
	#	p++;
	#}
	#--------------------------------------------
	
	#converter str para mai�sculas
	#
	
	la $t0,str
	
w_lp1:
	lb $t1,0($t0)
	blt $t1,'A',next
	bgt $t1,'Z',next
	addiu $t1,$t1,0x20
	sb $t1,0($t0)
	
next:
	addiu $t0,$t0,1
	j w_lp1
	
ex_lp1:
	print_str(str2)
	print_str(str)
	
exit:	done
	
