.data
str: .asciiz "\nIntroduza o numero de discos: "
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	ble $v0, 0, end
	or $a0, $v0, $0
	li $a1, 1
	li $a2, 3
	li $a3, 2
	jal tohanoi
	
end:
	li $v0, 0
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra