#Exercício3d)_Aula4_home;
#Lé uma string da consola com um máximo de 20 caracteres, converte os caracteres correspondentes a letras maiúsculas em minúsculas,
#e escreve a string alterada no ecrã;

#Imprime um * no final das conversões e quando existem números na string imprime outras letras;

 			.data
str:			.space 20
str1: 			.asciiz "Introduza uma string (comp<20): "
str2:			.asciiz "String convertida: "

 			.text
 			.globl main
 			
main:			
		#$t0=p; $t1=*p;
		
			#print_Str(str1)
			li $v0,4
			la $a0,str1
			syscall
			
			#read_str(str,20)
			li $v0,8
			la $a0,str
			la $a1,20
			syscall
			
			la $t0,str			#p=str;
			
while:
			lb $t1,0($t0)			#$t1=*p;
			beqz $t1,end			#while(*p==0)
			
			sub $t1,$t1,'A'			#*p = *p - 'A'
			add $t1,$t1,'a'			#*p = *p - 'A' + 'a'
			
			sb $t1,0($t0)			#???
			addiu $t0,$t0,1			#p++;
			j while
			
end:
			#print_str(str2)
			li $v0,4
			la $a0,str2
			syscall
			
			#print_str(str)
			li $v0,4
			la $a0,str
			syscall
			
			jr $ra
			