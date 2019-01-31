 #------------------------------------------------------------------
 #  Branch Tests
 #  Michael Donahue
 #------------------------------------------------------------------

  org 0x0000

  initial:
    ori $2, $zero, 0x3
    ori $3, $zero, 0x3

  equalTest:
    nop
    beq $2, $3, equalSuccess

  equalFail:
    nop

  equalSuccess:

  notEqualTest:
    ori $3, $zero, 0x2
    bne $2, $3, notEqualSuccess

  notEqualFail:
    nop

  notEqualSuccess:
    nop
    beq $2, $3, equalFail  #should not branch
    nop
    ori $3, $zero, 0x3
    bne $2, $3, notEqualFail  #should not branch
    nop
    halt  #that's all



