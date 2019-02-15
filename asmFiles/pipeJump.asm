ori $3,$0,0xf000
j here
ori $3,$0,0x2000
ori $5,$0,0x1000
here:
ori $4,$0,0xff00
sw $3,0($4)
halt
