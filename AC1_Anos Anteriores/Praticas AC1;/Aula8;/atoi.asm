#Exercício1b)_Aula8

#Funciona!

			.data
str:			.asciiz "3127, o ano do fim das PPP"
			.text
			.globl atoi
			
#main:
#			subu $sp,$sp,4
#			sw $ra,0($sp)

#			la $a0,str
#			jal atoi
						
#			move $a0,$v0
			#print_int
#			li $v0,1
#			syscall
			
#			lw $ra,0($sp)
#			addiu $sp,$sp,4
#			jr $ra

atoi:		
		#$t1=res; $t0=*s; $a0=s; $t2=digit; 
		
			li $t1,0			#res=0;
			
while:			
			lb $t0,0($a0)			#$t0=*s;
			blt $t0,'0',end_while
			bgt $t0,'9',end_while
			
			subu $t2,$t0,'0'		#digit=*s++ - '0';
			addiu $a0,$a0,1			#*s++;
			
			mulu $t1,$t1,10			#res = res * 10;
			addu $t1,$t1,$t2		#res = res * 10 + digit;
			

			j while
			
end_while:
			move $v0,$t1			#$v0=res; retorna res
			jr $ra
