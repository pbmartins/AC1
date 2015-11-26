.text
.globl itoa, toascii
itoa:
	addi $sp, $sp, -20
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $ra, 16($sp)
	
	or $s0, $a0, $0
	or $s1, $a1, $0
	or $s2, $a2, $0
	or $s3, $s2, $0 # char *p = s;
	
dowhile:
	#lb $t1, 0($t0)
	remu $t0, $s0, $s1 # digit = n % b;
	divu $s0, $s0, $s1 # n = n / b;
	or $a0, $t0, $0
	jal toascii
	
	sb $v0, 0($s3) # *p = toascii( digit );
	addiu $s3, $s3, 1 # p++;
	
	bgt $s0, 0, dowhile # while( n > 0 );
	
enddowhile:
	li $t1, '\0'
	sb $t1, 0($s3) # *p = '\0';
	or $a0, $s2, $0
	jal strrev # strrev( s );
	
	or $v0, $v0, $0 # return s;
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	
	jr $ra
	
toascii:
	or $v0, $a0, $0
	addi $v0, $v0, '0' # v += '0';
	ble $v0, '9', endif
	addi $v0, $v0, 7 # v+=7; //'A'-'9'-1
	
endif:
	# return v;
	jr $ra