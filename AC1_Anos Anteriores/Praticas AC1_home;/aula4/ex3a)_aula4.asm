#Exerc�cio3a)_Aula4_home;
#L� uma string da consola com um m�ximo de 20 caracteres, converte os caracteres correspondentes a letras min�sculas em mai�sculas,
#e escreve a string alterada no ecr�;

#Imprime um � depois das convers�es e ignora os carcteres num�ricos;
#Quando inserido 1n� d� um espa�o entre a convers�o e o �; caso aumentem os n�meros, aumentam os espa�os.

 			.data
str:			.space 20
str1: 			.asciiz "Introduza uma string (comp<20): "
str2:			.asciiz "String convertida: "

 			.text
 			.globl main
 			
main:
 		#$t0=p; $t1=*p;
 			#print_str(str1)
 			li $v0,4
 			la $a0,str1
 			syscall
 			
 			#read_string(str,20)
 			li $v0,8
 			la $a0,str
 			la $a1,20
 			syscall
 			
 			la $t0,str		#p=str;
 			
while:
 			lb $t1,0($t0)		#$t1=*p;
 			beqz $t1,end		#while(*p==0)
 			
 			sub $t1,$t1,'a'		#*p = *p - 'a'
 			add $t1,$t1,'A'		#*p = *p - 'a' + 'A'
 			
 			sb $t1, 0($t0)		#sb:The least significant byte of $t is stored at the specified address.
 			addiu $t0,$t0,1		#p++;
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