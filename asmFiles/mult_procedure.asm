org 0x0000
ori $29, $0, 0xFFFc

ori $16, $0, 0x0005 #decide values to push
ori $17, $0, 0x0007 #decide values to push


ori $4, $0, 0x0004  # 4 to deduct of sp

sw $16, 0($29)    #push operation
subu $29, $29, $4


sw $17, 0($29)     # push operation
subu $29, $29, $4


ori $22, $0, 0x0010
sw $22, 0($29)     #push operation
subu $29, $29, $4

redo:
jal proce
sw $20, 0($29)    #push result from function
subu $29, $29, $4

ori $19, $0, 0xFFF8
bne $29, $19, redo
halt

proce:
##function
ori $20, $0, 0x0000 #accumalator set up
ori $18, $0, 0x0001 # set 1 to deduct of

lw $16, 4($29)    #pull operation
addu $29, $29, $4

lw $17, 4($29)    #pull operation
addu $29,$29, $4


loop:
beq $16, $0, finish
addu $20, $20, $17
subu $16, $16, $18
j loop


finish:
# result is in register 20
jr $31
