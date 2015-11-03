.data
op: .byte '^', 60, '<', 'a'

.text
.globl main
main:
	la $t4, op
	lb $t1, 0($t4)
	addi $t5, $t4, 0
	lb $t2, 1($t5)
	beq $t1, '^', ifbody
ifbody:
	or $t3, $t1, $t0
	li $t6, 2
	sw $t6, 0($t5)