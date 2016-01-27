#Exercício 2a_Aula3

	.include "tp3_macros.asm"
	.data
str1:	.asciiz "Introduza um número: "
str2: 	.asciiz "O valor em hexadecimal é: 0x"

	.text
	.globl main
main:	
	#$t0=value; $t1=digito; $t2=i; 
	print_str(str1)
	read_int($t0)		#$t0 = valor decimal
	print_str(str2)
	
	li	$t2,8		#i=0;
	
while_loop:

	andi	$t3,$t0,0xF0000000	#$t3 = value & 0xF0000000
	bnez	$t3, do_while_loop	#if($t3 != 0)
	beqz	$t2, do_while_loop	#if(i==0)
	
	sll	$t0,$t0,4		#value = value << 4
	addi	$t2,$t2,-1		#i--
	j	while_loop
	
do_while_loop:

	andi	$t3,$t0,0xF0000000	
	srl	$t1,$t3,28		#digito = $t3 >> 28
	bgt	$t1,9,dig_gt_9		#if(digito>9)
	add	$t4,$t1,'0'		#$t4 = digito + '0'
	j	next_value
	
dig_gt_9:
	add	$t4,$t1,'0'		#$t4 = digito + '0' + 7
	addi	$t4,$t4,7
	
next_value:
	print_char_reg($t4)
	
	sll	$t0,$t0,4		#value = value << 4
	addi	$t2,$t2,-1		#i--
	bnez	$t2,do_while_loop
	
exit:	done
