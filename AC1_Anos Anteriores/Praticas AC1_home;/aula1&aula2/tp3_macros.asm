	.macro print_str(%str_label)
		li $v0,4
		la $a0,%str_label
		syscall
	.end_macro
	
	.macro print_int(%sreg)
		li $v0,1
		move $a0,%sreg
		syscall
	.end_macro
	
	.macro print_intu(%sreg)
		li $v0,36
		move $a0,%sreg
		syscall
	.end_macro
	
	.macro print_char_reg(%reg_char)
		li $v0,11
		move $a0, %reg_char
		syscall
	.end_macro
		
	#returns 'int' in '$v0'
	.macro read_int(%rreg)
		li $v0,5
		syscall
		move	%rreg,$v0
	.end_macro
	
	.macro print_char(%char)
		li $v0,11
		li $a0, %char
		syscall
	.end_macro
	
	.macro done
		li $v0,10
		syscall
	.end_macro
