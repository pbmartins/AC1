.data
str: .asciiz "AC1"
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a1, str
	addi $a0, $a1, 20
	jal strcpy
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra