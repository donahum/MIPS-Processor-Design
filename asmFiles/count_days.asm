org 0x0000
ori $29, $0, 0xFFFc

ori $15, $0, 0x0006   #current day
ori $16, $0, 0x0001 # current month
ori $17, $0, 0x07E3 # current year

ori $4, $0, 0x0004  # 4 to deduct of sp

ori $21, $0, 0x07D0 # year 2000
ori $23, $0, 0x0001  # 1 to deduct
ori $24, $0, 0x001E  # 30 to multiply
ori $25, $0, 0x016D  # 365 to multiply


ori $22, $15, 0x0000  #accumulator for result and add current day


subu $16, $16, $23   ## set r(16) to current month -1
sw $16, 0($29)    #push current month -1
subu $29, $29, $4
sw $24, 0($29)     # push 30 to multiply with
subu $29, $29, $4
jal func # call function
addu $22, $22, $20 ## add result to accumulator


subu $17, $17, $21   # calculate current year -2000
sw $17, 0($29)   # push current year-2000
subu $29, $29, $4
sw $25, 0($29)   # push 365 to multiply
subu $29, $29, $4
jal func ## call function (mult)
addu $22, $22, $20  ## add the result to the accumulator


halt

func:
##function
ori $20, $0, 0x0000 #accumalator set up
ori $18, $0, 0x0001 # set 1 to deduct of

lw $26, 4($29)    #pull operation
addu $29, $29, $4

lw $27, 4($29)    #pull operation
addu $29,$29, $4


loop:
beq $26, $0, finish
addu $20, $20, $27
subu $26, $26, $18
j loop


finish:
# result is in register 20
jr $31
