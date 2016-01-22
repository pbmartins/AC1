.data
str: .ascii ""
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $a0, 0x23
	li $a1, 2
	la $a2, str
	jal itoa
	or $a0, $v0, $0
	li $v0, 4
	syscall # print_str(itoi(n, b, p);
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	li $v0, 0 # return 0;
	jr $ra