.data
array: .word 7692, 23, 5, 234 # int array[] = {7692, 23, 5, 234}

.text
.globl main
main:
	or $t3, $0, $0 # int soma = 0
	la $t0, array # p = array
	addiu $t1, $t0, 12 # pultimo = array + 3 (*4)
	
whileloop:
	ble $t0, $t1, loopbody # while( p <= pultimo )
	j endloop
	
loopbody:
	lw $t2, 0($t0) # $t2 = *p
	addu $t3, $t3, $t2 # soma = soma + (*p)
	addiu $t0, $t0, 4 # p++
	j whileloop

endloop:
	# print_int10(soma)
	or $a0, $0, $t3
	ori $v0, $0, 1
	syscall
	
	jr $ra