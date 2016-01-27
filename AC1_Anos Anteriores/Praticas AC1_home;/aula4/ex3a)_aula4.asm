#Exercício3a)_Aula4_home;
#Lé uma string da consola com um máximo de 20 caracteres, converte os caracteres correspondentes a letras minúsculas em maiúsculas,
#e escreve a string alterada no ecrã;

#Imprime um ê depois das conversões e ignora os carcteres numéricos;
#Quando inserido 1nº dá um espaço entre a conversão e o ê; caso aumentem os números, aumentam os espaços.

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