.data
array: .word 10, 20, 30
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, array
	li $a1, 3
	jal soma
	or $a0, $v0, $0
	li $v0, 1
	syscall
	lw $ra, 0($sp)
	addi $sp, $sp, 4