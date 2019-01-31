#---------------------------------------
# 3.) Count Days
#---------------------------------------

# set the address where you want this
# code segment
  org 0x0000

  ori   $2, $0, 17     #days
  ori   $3, $0, 1     #months
  ori   $4, $0, 2019  #years

  lw $15, stackpointer($0)

  addi  $15, $15, -4
  sw	$2, 0($15)				#days

  

  addi  $15, $15, -4
  sw	$4, 0($15)				#years

  addi $20, $2, 0

  months:

    addi $3, $0, -1

    addi  $15, $15, -4
    sw  $3, 0($15)        #months

    ori $5, $0, 30

    addi  $15, $15, -4    #push const 30
    sw  $5, 0($15)        

  mult_loop:

  	lw $5, 0($15)
  	addi $15, $15, 4

  	lw $3, 0($15)
  	addi $15, $15, 4

    beq $3, $0, done    #if zero, exit

  	add $6, $6, $5			#add result to accumulator
  	addi $3, $3, -1			#decrement multiplier

    addi  $15, $15, -4
  	sw $3, 0($15)       #first stack ref

    addi  $15, $15, -4
    sw  $5, 0($15)       #second stack ref

    j	mult_loop

  years:

    addi $20, $20, $6
    addi $15, $15, 8

    lw $4, 0($15)
    addi $15, $15, 4

    ori $21, $0, 365
    lw

    beq $3, $0, done    #if zero, exit

    add $6, $6, $5      #add result to accumulator
    addi $3, $3, -1     #decrement multiplier

    addi  $15, $15, -4
    sw $3, 0($15)       #first stack ref

    addi  $15, $15, -4
    sw  $5, 0($15)       #second stack ref

  done:
    addi $15, $15, 4

  	halt

stackpointer:
  org 0x200  
  cfw 0xFFFC
