.data
array: .double 1.0, 2.0, 0.5, 7.2
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, array
	li $a1, 4
	jal average
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra