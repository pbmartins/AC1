.data
val: .double 92
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	l.d $f12, val # double ft = 92;
	jal f2c # f2c(ft)
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	