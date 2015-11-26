.data
array: .word 7692, 23, 5, 234 # int array[] = {7692, 23, 5, 234}

.text
.globl main
main:
	or $t0, $0, $0 # int i = 0
	ori $t1, $0, 12 # int ultimo = 3 * 4
	or $t3, $0, $0 # int soma = 0
	la $t2, array # p = array
	
whileloop:
	ble $t0, $t1, loopbody # while( i <= ultimo )
	j endloop
	
loopbody:
	add $t4, $t2, $t0 # &p = &array[i]
	lw $t5, 0($t4)
	add $t3, $t3, $t5 # soma = soma + (*p)
	addiu $t0, $t0, 4 # i++
	j whileloop

endloop:
	# print_int10(soma)
	or $a0, $0, $t3
	ori $v0, $0, 1
	syscall
	
	jr $ra