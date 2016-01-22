.text
.globl tohanoi
tohanoi:
	addi $sp, $sp, -24
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	sw $s3, 16($sp)
	sw $s4, 20($sp)
	li $s4, 0 # static int count = 0;
	or $s0, $a0, $0 # n
	or $s1, $a1, $0 # p1
	or $s2, $a2, $0 # p2
	or $s3, $a3, $0 # p3
	
	beq $s0, 1, else # if(n != 1)
	addi $a0, $s0, -1 # n - 1
	or $a1, $s1, $0 # p1
	or $a2, $s3, $0 # p3
	or $a3, $s2, $0 # p2
	jal tohanoi
	
	or $a0, $s1, $0 # print_msg(p1, p2, ++count);
	or $a1, $s2, $0
	lw $s4, 20($sp)
	addi $s4, $s4, 1
	sw $s4, 20($sp)
	or $a2, $s4, $0
	jal print_msg
	
	addi $a0, $s0, -1 # tohanoi(n-1, p3, p2, p1);
	or $a1, $s3, $0 # p3
	or $a2, $s2, $0 # p2
	or $a3, $s1, $0 # p1
	jal tohanoi
	j endif
	
else:
	or $a0, $s1, $0 # print_msg(p1, p2, ++count);
	or $a1, $s2, $0
	lw $s4, 20($sp)
	addi $s4, $s4, 1
	sw $s4, 20($sp)
	or $a2, $s4, $0
	jal print_msg

endif:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	addi $sp, $sp, 24
	jr $ra
