.data
val1: .double 32.0
val2: .double 5.0
val3: .double 9.0
.text
.globl f2c
f2c:
	l.d $f4, val1
	l.d $f6, val2
	l.d $f8, val3
	div.d $f6, $f6, $f8 # $f6 = 5 / 9
	sub.d $f0, $f12, $f4 # F - 32
	mul.d $f0, $f0, $f6 # 5 / 9 * (F - 32)
	jr $ra