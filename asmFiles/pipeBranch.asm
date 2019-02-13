ori $5,$0,0xf000
ori $3,$0,0xf000
beq $5,$3,here
ori $2,$0,0x1100
ori $6,$0,0x0011
here:
ori $1,$0,0x1100
ori $4,$0,0x0011
sw $2,0($5)
halt
