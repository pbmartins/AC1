.data
str: .asciiz "String de teste"
.text
.globl main1b
main1b:
	addiu $sp, $sp, -4 # reserve space on stack
	sw $s0, 0($sp) # save $s0 on sp
	or $s0, $ra, $0 # save $ra on $s0
	
	la $a0, str
	jal strlen
	or $a0, $v0, $0
	li $v0, 1
	syscall

	li $v0, 0
	or $ra, $s0, $0
	lw $s0, 0($sp)
	jr $ra
