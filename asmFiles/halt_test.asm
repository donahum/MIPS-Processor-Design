 #------------------------------------------------------------------
 #  Halt Test
 #  Michael Donahue
 #------------------------------------------------------------------

  org 0x0000

  initial:
    nop

  haltTest:
    nop
    halt
    nop
    j initial
