 #------------------------------------------------------------------
 #  JAL, JR, J Tests
 #  Michael Donahue
 #------------------------------------------------------------------

  org 0x0000

  initial:
    nop
    j linkTest
    nop

  linkTest:
    jal dummyFunction
    j finish

  dummyFunction:
  	nop
  	j dummyFunction2

  dummyFunction2:
  	nop
  	jr $ra

  finish:
  	halt  # that's all
