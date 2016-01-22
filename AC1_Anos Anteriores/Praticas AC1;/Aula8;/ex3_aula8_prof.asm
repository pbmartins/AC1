#Exercício3_Aula8_prof
#

			.include "tp3_macros.asm"
			.data
			
str: 			.asciiz "\nOperação desconhecida!"
str1:			.asciiz "\nNúmero de argumentos errado!"

			.text
			.globl main
			
main:
			#
			
			addiu $sp,$sp,-24
			sw $ra,0($sp)			
			sw $s0,4($sp)			#$s0=val1;
			sw $s1,8($sp)			#$s1=op;
			sw $s2,12($sp)			#$s2=val2;
			sw $s3,16($sp)			#$s3=res;
			sw $s4,20($sp)			#$a4=save $a1=argv
			
			bne $a0,3,ex_bad_args		#if(argc != 3)
			
			move $s4,$a1			#save argv!
			lw $a0,0($s4)			#$a0=argv[0]
			jal atoi			
			move $s0,$v0			#val1=atoi(argv[0])
				
			lw $a0,4($s4)			#$a0=argv[1]
			lb $s1,0($a0)			#op=argv[1][0]
			
			lw $a0,8($s4)			#$a0=argv[2]
			jal atoi
			move $s2,$v0			#val2=atoi(argv[2])
			
			bne $s1,'x',chk_op_div		#if(op |= 'x') 
			
			mulu $s3,$s0,$s2		#res=val1*val2
			li $v0,0			#exit_code=0
			b chk_ex_code
			
chk_op_div:
			bne $s1,'/',chk_op_rem		#if(op!='/')
			
			divu $s3,$s0,$s2		#res=val1/val2	
			li $v0,0			#exit_code=0
			b chk_ex_code
			
chk_op_rem:
			bne $s1,'%',not_val_op		#if(po!='%')
			
			divu $s0,$s2			
			mfhi $s3			#res=val1%val2
			li $v0,0			#exit_code=0
			b chk_ex_code
			
not_val_op:
			print_str(str)			
			li $v0,1			#exit_code=1
			
chk_ex_code:
			bnez $v0,ex_do			#if(exit_code!=0)
			
			move $a0,$s0			
			li $a1,10
			jal print_int_ac1		#print_int_ac1(val1,10)
			print_char_reg($s1)		#print_char(op)
			move $a0,$a2
			li $a1,10
			jal print_int_ac1		#print_int_ac1(val2,10)
			print_char('=')			#print_char('=')
			move $a0,$s3
			li $a1,10
			jal print_int_ac1		#print_int_ac1(res,10)
			
			li $v0,0			#exit_code=0
			b ex_do
			
ex_bad_args:
			print_str(str1)
			li $v0,2
			
ex_do:
			lw $ra,0($sp)			
			lw $s0,4($sp)			#restaura $s0
			lw $s1,8($sp)			#restaura $s1
			lw $s2,12($sp)			#restaura $s2
			lw $s3,16($sp)			#restaura $s3
			lw $s4,20($sp)			#restaura $s4
			
			addiu $sp,$sp,24
			
			jr $ra