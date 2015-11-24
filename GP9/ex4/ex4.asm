.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $a0, 23
	li $a1, 2
	jal print_int_ac1
	
	li $v0, 11
	li $a0, '\n'
	syscall
	
	li $a0, 23
	li $a1, 16
	jal print_int_ac1
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra