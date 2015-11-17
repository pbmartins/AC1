.text
.globl strrev
strrev:
        addiu $sp, $sp, -16 # save on stack
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $a0, 8($sp) # save str ($a0) on stack
        sw $ra, 12($sp) # save $ra on stack

        or $s0, $a0, $0 # char *p1 = str;
        or $s1, $a0, $0 # char *p2 = str;

while:
        lb $t0, 0($s1) # $t0 = *p2
        beq $t0, '\0', endwhile

        addiu $s1, $s1, 1 # p2++
        j while

endwhile:
        addiu $s1, $s1, -1 # p2--

while2:
        bge $s0, $s1, endwhile2
        or $a0, $s0, $0 # $a0 = $s0
        or $a1, $s1, $0 # $a1 = $s1
        jal exchange # exchange(p1, p2);
        #or $s0, $a0, $0 # $s0 = $a0
        #or $s1, $a1, $0 # $s1 = $a1    
        addiu $s0, $s0, 1 # p1++
        addiu $s1, $s1, -1 # p2--

        j while2

endwhile2:
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $a0, 8($sp)
        lw $ra, 12($sp)
        addiu $sp, $sp, 16

        or $v0, $a0, $0 # $v0 = $a0 => return str;
        jr $ra

exchange:
        lb $t0, 0($a0) # char aux = *c1;
        lb $t1, 0($a1)
        sb $t1, 0($a0) # *c1 = *c2;
        sb $t0, 0($a1) # *c2 = aux;

        jr $ra
