.data
array: .double 1.0, 3.0, 7.0, 4.9
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, array
	li $a1, 4
	jal max
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra