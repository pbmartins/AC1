#Exercício2b)_Aula8
			.include "tp3_macros.asm"
			.data
str:			.space 20			
			#.align 2
			.text
			.globl main
			
main:
			#static char str[20];
			#print_str(itoa(2413,10,str));
			addiu $sp,$sp,-4		#reserva espaço para a stack		
			sw $ra,0($sp)			#guarda $ra
			
			li $a0,2413			#pode ser usado qualquer inteiro
			li $a1,10			#base 10
			la $a2,str
			jal itoa
			
			move $a0,$v0
			print_str_simple
			
			lw $ra,0($sp)			#restore $ra
			addiu $sp,$sp,4			#liberta espaço na stack
			li $v0,0			#retorna 0
			jr $ra
			
			
toascii:
			#entrada: $a0=char; saída: $v0=v; 
			addiu $v0,$a0,'0'		#v += '0'
			ble $v0,'9',toa_exit
			addiu $v0,$v0,7			#v += 7
			
toa_exit:
			jr $ra
			
itoa:
			#unsigned int n;
			#unsigned int b;
			#char *s;
			
			#$a0=n; $a1=b; $a2=s; $0=res;
			
			addiu $sp,$sp,-12		#reserva espaço para $ra
			sw $ra,0($sp)			#guarda $ra
			sw $s0,4($sp)			#guarda $s0
			sw $s1,8($sp)			#guarda $s1
			
			move $s1,$a2			#$s2=p=a save initial ptr
			move $s0,$a0			#$s1=n
			
dw_lp:
			#divu $t1,$t0: Divide unsigned $t1 by $t0
			#then set LO to quotient and HI to reminder
			
			divu $s0,$a1			#n/b and n%b
			mflo $s0			#$s1=quot=n=n/b
			mfhi $a0			#$a0=rem=digit=n%b
			
			jal toascii			#$v0 = toascii(digit)
			
			#para ascii não usar $a1 nor $a2
			
			sb $v0,0($a2)			#*p=toascii(digit)
			addiu $a2,$a2,1			#p++
			bnez $s0,dw_lp			#while(n>0)
			sb $zero,0($a2)			#*p='\0'
			
			move $a0,$s1			#restore s
			jal strrev			#strrev(s)
			
			#return to main's caller!
			
			move $v0,$s1			#return s
			
			lw $ra,0($sp)			#restore $ra
			lw $s0,4($sp)			#restore $s0
			lw $s1,8($sp)			#restore $s1
			
			addiu $sp,$sp,12		#liberta espaço na stack	
			jr $ra
			
			
			
