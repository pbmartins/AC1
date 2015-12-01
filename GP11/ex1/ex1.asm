.data
n: .double 2.5
.text 
.globl main
main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	l.d $f12, n
	li $a0, 4
	jal xtoy
	
	mov.d $f12, $f0
	li $v0, 3
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	