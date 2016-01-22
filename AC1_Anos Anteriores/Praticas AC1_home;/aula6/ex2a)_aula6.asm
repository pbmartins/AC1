#Exercício2a)_Aula6_home
#Define 3 strings e imprime-as (ponteiros);

#Punciona!

			.data
			.eqv SIZE,3
			
array:			.word str1, str2, str3
			.align 2
			
str1: 			.asciiz "Array"
str2:			.asciiz "de"
str3: 			.asciiz "ponteiros"

			.text
			.globl main
			
main:
		#$t0=p; $t1=pultimo; $a0=*p
			la $t0,array			#p=array
			add $t1,$t0,12			#pultimo = array + SIZE(3*4bits)
			
for:
			bge $t0,$t1,end			#p>=pultimo
			
			lw $a0,0($t0)			#$a0=*p
			
			#print_str(*p)
			li $v0,4
			#la $a0,$t2
			syscall
			
			#print_char(''\n')
			li $a0,'\n'
			li $v0,11
			syscall
			
			addi $t0,$t0,4			#p++;
			j for
			
end:
			jr $ra
