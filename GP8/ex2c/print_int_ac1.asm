.data
buf: .byte 0:33
.text
.globl print_int_ac1
print_int_ac1:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a2, buf
	jal itoa
	or $a0, $v0, $0
	li $v0, 4
	syscall # print_str(itoi(n, b, p);
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4	
	jr $ra