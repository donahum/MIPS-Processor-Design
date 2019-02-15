org 0x0000
ori $10,$0,0x1000
ori $5,$0,54
ori $3,$0,35
sw $5,0($10)
sw $3,4($10)
bne $3,$5, labool
ori $5,$0,33
sw $5,0($10)
labool:
ori $3,$0,54
sw $3,4($10)
beq $3,$5,good
ori $21,$5,0x0230
sw $21, 8($10)
good:
halt
