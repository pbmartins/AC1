#Exercício2a)_Aula4_home;
#Lê uma string do teclado, conta o número de caracteres numéricos e imprime esse resultado!
#Com ponteiros!

#Funciona!
#Dúvida em relação ao unsigned!

		.data
str:		.space 20
		
str1:		.asciiz "Introduza uma string (comp<20): "
str2:		.asciiz "Número de caracteres numéricos da string: "

		.text
		.globl main
		
main:
		#$t0=num; $t1=p; $t2=*p(char);
		
		#print_str(str1)
		li $v0,4
		la $a0,str1
		syscall
		
		#read_str(str,20)
		li $v0,8
		la $a0,str
		la $a1,20
		syscall
		
		li $t0,0		#num=0;
		la $t1,str		#p=str;
		
while:
		lb $t2,0($t1)		#$t2=*p;		equivalente a str + i = str[i];
		beqz $t2,end		#while(*p==0)
		
		bltu $t2,'0',if		#*p<'0'
		bgtu $t2,'9',if		#*p>'9'
		
		addi $t0,$t0,1		#num++;
		
if:
		addiu $t1,$t1,1		#p++;
		j while
			
end:
		#print_str(str2)
		li $v0,4
		la $a0,str2
		syscall
		
		#print_int10(num=$t0)
		li $v0,1
		move $a0,$t0
		syscall
		
		jr $ra
