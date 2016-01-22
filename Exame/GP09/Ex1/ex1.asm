.data
str: .asciiz "Aulas de AC1"
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str
	jal strlen
	or $a0, $v0, $0
	li $v0, 1
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra