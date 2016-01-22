.data
str1: .asciiz "\n"
str2: .asciiz " - Mover disco de topo de "
str3: .asciiz " para "
.text
.globl print_msg
print_msg:
	addi $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	
	or $s0, $a0, $0
	or $s1, $a1, $0
	or $s2, $a2, $0
	
	li $v0, 4
	la $a0, str1
	syscall
	
	or $a0, $s2, $0
	li $a1, 10
	jal print_int_ac1
	
	li $v0, 4
	la $a0, str2
	syscall
	
	or $a0, $s0, $0
	li $a1, 10
	jal print_int_ac1
	
	li $v0, 4
	la $a0, str3
	syscall
	
	or $a0, $s1, $0
	li $a1, 10
	jal print_int_ac1
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	jr $ra