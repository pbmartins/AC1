		.data
s_intr_2_nbrs:	.asciiz "Introduza 2 números\n"
s_sum_is:	.asciiz "A soma dos dois números é: "
		#
		.macro print_str(%str_label)
			la $a0,%str_label
			li $v0,4
			syscall
		.end_macro
		
		#returns 'int' in '$v0'
		.macro read_int
			li $v0,5
			syscall
		.end_macro
		
		#prints 'int' in '$a0'
		.macro print_int
			li $v0,1
			syscall
		.end_macro
		
		.macro done
			li $v0,10
			syscall
		.end_macro
			
		.text
		.globl main
main:		print_str(s_intr_2_nbrs)
		read_int
		move $t0,$v0	#$t0 = int1
		#
		read_int
		move $t1,$v0	#$t1 = int2
		#
		print_str(s_sum_is)
		add $a0,$t0,$t1		#$a0 = $t0 +$t1
		#
		print_int
		#
		done