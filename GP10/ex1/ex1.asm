.data
val1: .float 0.0
val2: .float 2.59375
.text
.globl main
main:
	# res = $f4
	# val = $t0
	l.s $f8, val1
	
do:
	# val = read_int();
	li $v0, 5
	syscall
	or $t0, $v0, $0
	
	# res = (float)val * 2.59375;
	mtc1 $t0, $f4
	cvt.s.w $f4, $f4
	l.s $f6, val2
	mul.s $f4, $f4, $f6
	
	# print_float( res );
	li $v0, 2
	mov.s $f12, $f4
	syscall
	
	# while(res != 0.0);
	c.eq.s $f4, $f8
	bc1f do
	
enddowhile:
	li $v0, 0 # return 0;
	jr $ra
	
	