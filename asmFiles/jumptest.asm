ori $10,$0,0x1000
j fork
ori $5,$0,23
sw $5, 0($10)
fork:
ori $4,$0,23
sw $4, 4($10)
jal func
ori $9, $2,4
sw $9, 12($10)
halt
func:
ori $2,$4,23
sw $2, 8($10)
jr $31
ori $7, $0,24
sw $7,16($10)
