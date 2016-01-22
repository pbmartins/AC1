.text
.globl print_int_ac1
print_int_ac1:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	divu $t0, $a0, $a1
	beq $t0, 0, else
	or $a0, $t0, $0
	jal print_int_ac1
	
else:
	lw $a0, 4($sp)
	rem $a0, $a0, $a1
	jal toascii
	or $a0, $v0, $0
	li $v0, 11
	syscall
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
	
# char toascii(char v)
toascii:
	addi $v0, $a0, '0'
	ble $v0, '9', elsetoascii
	addi $v0, $v0, 7
			
elsetoascii:
	jr $ra
