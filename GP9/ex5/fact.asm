.text
.globl fact
fact:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	or $s0, $a0, $0
	
	ble $s0, 12, endif # if(n > 12)
	li $v0, 10 # exit(1); // Overflow
	li $a0, 1
	syscall 
	
endif:
	blt $s0, 1, endif2
	addi $a0, $a0, -1 # fact(n-1)
	jal fact
	mulu $v0, $v0, $s0 # n * fact(n-1)
	j return
	
endif2:
	li $v0, 1 # return 1;
	
return:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra
