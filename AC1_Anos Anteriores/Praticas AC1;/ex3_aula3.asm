#Exercício 3_Aula3

	.include "tp3_macros.asm"
	.data
str1:	.asciiz "Introduza 2 números (<65536): "
	#.asciiz "Introduza 2 números (<16): "
str2:	.asciiz "O produto é "

	.text
	.globl main
#$t0 = mdor; $t1 = mod; $t2=i; $t4 = res
main:	
	print_str(str1)
	read_int($t0)		#$t0 = mdor
	read_int($t1)		#$t1 = mod
	
	li	$t4,0		#res=0
	li	$t2,0		#i=0
	
	#while((mdor != 0) && (i++ <4))
while_loop:
	beqz	$t0,while_end		#if(mdor == 0)
	#bge	$t2,4,while_end		#if(i>=4)
	bge	$t2,16,while_end	#if(i>=16)
	addi	$t2,$t2,1		#i++
	
	andi	$t3,$t0,0x00000001	#$t3 = mdor & 0x00000001
	beqz	$t3,next_bit		#if($t3 == 0)
	addu	$t4,$t4,$t1		#res = res + mdo (unsigned!)
	
next_bit:
	sll	$t1,$t1,1		#mdo = mdo << 1
	srl	$t0,$t0,1		#mdor = mdor >> 1
	
	j	while_loop
	
while_end:
	print_str(str2)
	print_intu($t4)			#tem de ser unsigned! 
	
exit: 	done
	
	
