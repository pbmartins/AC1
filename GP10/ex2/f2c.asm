.data
val1: .double 5
val2: .double 9
val3: .double -32
.text 
.globl f2c
f2c:
	l.d $f4, val1
	l.d $f6, val2
	div.d $f4, $f4, $f6
	l.d $f8, val3
	add.d $f0, $f12, $f8 # (°F - 32)
	mul.d $f0, $f0, $f4 # 5 / 9 * (°F - 32)
	jr $ra