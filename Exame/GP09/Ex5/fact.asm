.text
.globl fact
fact:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	bleu $a0, 12, return
	li $v0, 10
	syscall # exit
	
return:
	bgtu $a0, 1, else
	li $v0, 1
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
else:
	addiu $a0, $a0, -1
	jal fact
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	mulu $v0, $v0, $a0
	addi $sp, $sp, 8
	jr $ra