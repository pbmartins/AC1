	.text
	.globl main
main:	ori $t0,$0,3		#$t0 = 3;
	ori $t2,$0,8		#$t2 = 8;
	add $t1,$t0,$t0		#$t1 = 3 + 3 = 6;
	sub $t1,$t1,$t2		#st1 = 6 - 8 = -2;
	jr $ra