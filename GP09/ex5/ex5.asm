.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $a0, 5
	jal fact
	
	or $a0, $v0, $0
	li $v0, 1
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra