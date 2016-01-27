		.data
s_intr_2_nbrs:	.asciiz "Introduza 2 números\n"
s_sum_is:	.asciiz "A soma dos dois números é: "
		#
		.text
		.globl main
main:		li $v0,4	#print_str
		la $a0,s_intr_2_nbrs
		syscall
		#
		li $v0,5	#read_int
		syscall
		ori $t0,$v0,0	#$t0 = int_1
		#
		li $v0,5	#read_int
		syscall	
		ori $t1,$v0,0	#$t1 = int_2
		#
		li $v0,4	#print_str
		la $a0,s_sum_is
		syscall
		#
		add $a0,$t0,$t1		#$a0 = $t0 + $t1
		
		#print_int10()
		li $v0,1
		syscall
		#
		li $v0, 10
		syscall
