.data
x: .double 2.5
.text
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $a0, 4
	l.d $f12, x
	jal xtoy
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra