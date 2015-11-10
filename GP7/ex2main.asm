.data
str: .asciiz "String de teste"

.text
.globl mainex2
mainex2:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, str
	jal strrev
	or $a0, $v0, $0
	li $v0, 4
	syscall
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
