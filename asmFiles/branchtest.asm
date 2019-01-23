org 0x0000
ori $10,$0,0x1000
addiu $5,$0,54
addiu $3,$0,35
sw $5,0($10)
sw $3,4($10)
bne $3,$5, labool
addiu $5,$0,33
sw $5,0($10)
labool:
addiu $3,$0,54
sw $3,4($10)
beq $3,$5,good
addu $21,$5,$3
sw $21, 8($10)
good:
halt
