.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $a0, 2
	addiu $a1, $0, 5
	jal xtoy
	or $a0, $v0, $0
	li $v0, 1
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra