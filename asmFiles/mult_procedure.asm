#---------------------------------------
# 2.) Multiplication Procedure
#---------------------------------------

# set the address where you want this
# code segment
  org 0x0000

  ori   $2, $0, 9
  ori   $3, $0, 7
  ori   $4, $0, 5
  ori   $5, $0, 0

  ori $15, $0, 0x200

  lw $15, 0($15)

  addi  $15, $15, -4
  sw	$2, 0($15)				#first stack ref

  addi  $15, $15, -4
  sw	$3, 0($15)				#second stack ref

  addi  $15, $15, -4
  sw  $4, 0($15)        #third stack ref

  addi  $15, $15, -4
  sw	$5, 0($15)				#accumulator

  initial:

    lw $5, 0($15)       #accumulator
    addi $15, $15, 4

    lw $4, 0($15)       #operand 3
    addi $15, $15, 4

    lw $3, 0($15)       #operand 2
    addi $15, $15, 4

  first_mult:

    add $5, $5, $4      #add result to accumulator
    addi $3, $3, -1     #decrement multiplier
    beq $3, $0, mult_check    #if zero, exit
    j first_mult

  mult_check:

    ori $14, $15, 0
    ori $16, $0, 0xFFFC
    ori $6, $5, 0
    ori $5, $0, 0
    beq $15, $16, done    #branch to done if nothing left

  mult:

  	lw $2, 0($15)
  	addi $15, $15, 4

    add $5, $5, $6      #add result to accumulator
    addi $2, $2, -1     #decrement multiplier

    beq $2, $0, mult_check

    addi  $15, $15, -4  #put operand back on stack for next iteration
    sw  $2, 0($15)

    j mult

  done:
    ori $5, $6, 0
    addi  $15, $15, -4  #put operand back on stack for next iteration
    sw  $5, 0($15)
  	halt

stackpointer:
  org 0x200  
  cfw 0xFFFC
