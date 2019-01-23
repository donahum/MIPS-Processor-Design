addiu $3,$0,23
ori $10,$0,0x1000
sw $3, 0($10)
halt
addiu $3,$3,23
sw $3, 0($10)
