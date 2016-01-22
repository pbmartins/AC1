.text
.globl print_int_ac1
print_int_ac1:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	
	div $t0, $a0, $a1
	beq $t0, $0, endif # if(num / base)
	or $a0, $t0, $0
	# $a1 = $a1 = base
	jal print_int_ac1 # print_int_ac1( num / base, base );
	
endif:
	lw $a0, 4($sp) # print_char( toascii(num % base) );
	lw $a1, 8($sp)
	rem $a0, $a0, $a1
	jal toascii
	or $a0, $v0, $0
	li $v0, 11
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 12
	jr $ra
	
toascii:
	addi $v0, $a0, '0' # v += '0';
	ble $v0, '9', endifascii # if( v > '9' )
	addi $v0, $v0, '7' # v+=7; //'A'-'9'-1
	
endifascii:
	# return v;
	jr $ra