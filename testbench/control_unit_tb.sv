
// mapped needs this
`include "control_unit_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns


import cpu_types_pkg::*;

module control_unit_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  control_unit_if cuif ();
  // test program
  test PROG (.CLK,.nRST,.cuif);
  // DUT
`ifndef MAPPED
  control_unit DUT(cuif);
`else
  control_unit DUT(
    .\cuif.op (cuif.op),
    .\cuif.funct_op (cuif.funct_op),


    .\cuif.RdOrRtOr31 (cuif.RdOrRtOr31),
    .\cuif.regWEN (cuif.regWEN),
    .\cuif.pcmode (cuif.pcmode),
    .\cuif.extType (cuif.extType),
    .\cuif.immorRt (cuif.immorRt),
    .\cuif.memOp (cuif.memOp),
    .\cuif.iREN (cuif.iREN),
    .\cuif.dREN (cuif.dREN),
    .\cuif.dWEN (cuif.dWEN),
    .\cuif.alu_op (cuif.alu_op),
    .\cuif.halt (cuif.halt)
  );
`endif

endmodule

program test( input logic CLK, output logic nRST, control_unit_if cuif) ;
initial
begin
      @(posedge CLK);
	cuif.op = RTYPE;
	cuif.funct_op = SLLV;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SLL && cuif.halt == 0 && cuif.iREN == 1)
	$display("1RTYPE:SLLV test succeded");
	cuif.funct_op = SRLV;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SRL && cuif.halt == 0 && cuif.iREN == 1)
	$display("2RTYPE:SRLV test succeded");
	cuif.funct_op = JR;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 0 && cuif.pcmode == 1 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SLL && cuif.halt == 0 && cuif.iREN == 1)
	$display("3RTYPE:JR test succeded");
	cuif.funct_op = ADD;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_ADD && cuif.halt == 0 && cuif.iREN == 1)
	$display("4RTYPE:ADD test succeded");
	cuif.funct_op = ADDU;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_ADD && cuif.halt == 0 && cuif.iREN == 1)
	$display("5RTYPE:ADDU test succeded");
	cuif.funct_op = SUB;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SUB && cuif.halt == 0 && cuif.iREN == 1)
	$display("6RTYPE:SUB test succeded");
	cuif.funct_op = SUBU;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SUB && cuif.halt == 0 && cuif.iREN == 1)
	$display("7RTYPE:SUBU test succeded");
	cuif.funct_op = AND;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_AND && cuif.halt == 0 && cuif.iREN == 1)
	$display("8RTYPE:AND test succeded");
	cuif.funct_op = OR;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_OR && cuif.halt == 0 && cuif.iREN == 1)
	$display("9RTYPE:OR test succeded");
	cuif.funct_op = XOR;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_XOR && cuif.halt == 0 && cuif.iREN == 1)
	$display("aRTYPE:XOR test succeded");
	cuif.funct_op = NOR;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_NOR && cuif.halt == 0 && cuif.iREN == 1)
	$display("bRTYPE:NOR test succeded");
	cuif.funct_op = SLT;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SLT && cuif.halt == 0 && cuif.iREN == 1)
	$display("cRTYPE:SLT test succeded");
	cuif.funct_op = SLTU;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SLTU && cuif.halt == 0 && cuif.iREN == 1)
	$display("dRTYPE:SLTU test succeded");
	



	cuif.op = J;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 0 && cuif.pcmode == 2 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SRL && cuif.halt == 0 && cuif.iREN == 1)
	$display("eJ instr test succeded");
	cuif.op = JAL;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==1 && cuif.regWEN == 1 && cuif.pcmode == 2 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 1 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SRL && cuif.halt == 0 && cuif.iREN == 1)
	$display("fJAL instr test succeded");
	cuif.op = BEQ;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 0 && cuif.pcmode == 3 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SUB && cuif.halt == 0 && cuif.iREN == 1)
	$display("gBEQ instr test succeded");
	cuif.op = BNE;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 0 && cuif.pcmode == 3 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SUB && cuif.halt == 0 && cuif.iREN == 1)
	$display("hBNE instr test succeded");
	cuif.op = ADDI;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==2 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 1 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_ADD && cuif.halt == 0 && cuif.iREN == 1)
	$display("iADDI instr test succeded");
	cuif.op = ADDIU;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==2 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 1 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_ADD && cuif.halt == 0 && cuif.iREN == 1)
	$display("jADDIU instr test succeded");
	cuif.op = SLTI;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==2 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 1 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SLT && cuif.halt == 0 && cuif.iREN == 1)
	$display("kSLTI instr test succeded");
	cuif.op = SLTIU;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==2 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 1 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SLTU && cuif.halt == 0 && cuif.iREN == 1)
	$display("lSLTIU instr test succeded");
	cuif.op = ANDI;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==2 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 1 && cuif.immorRt == 1 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_AND && cuif.halt == 0 && cuif.iREN == 1)
	$display("mANDI instr test succeded");
	cuif.op = ORI;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==2 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 1 && cuif.immorRt == 1 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_OR && cuif.halt == 0 && cuif.iREN == 1)
	$display("nORI instr test succeded");
	cuif.op = XORI;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==2 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 1 && cuif.immorRt == 1 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_XOR && cuif.halt == 0 && cuif.iREN == 1)
	$display("oXORI instr test succeded");
	cuif.op = LUI;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==2 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 1 && cuif.immorRt == 1 && cuif.memOp == 2 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_AND && cuif.halt == 0 && cuif.iREN == 1)
	$display("pLUI instr test succeded");
	cuif.op = LW;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==2 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 1 && cuif.memOp == 3 && cuif.dREN == 1 && cuif.dWEN == 0 && cuif.alu_op == ALU_ADD && cuif.halt == 0 && cuif.iREN == 1)
	$display("qLW instr test succeded");
	cuif.op = SW;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==2 && cuif.regWEN == 0 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 1 && cuif.memOp == 3 && cuif.dREN == 0 && cuif.dWEN == 1 && cuif.alu_op == ALU_ADD && cuif.halt == 0 && cuif.iREN == 1)
	$display("rSW instr test succeded");
	cuif.op = HALT;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==2 && cuif.regWEN == 0 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 1 && cuif.memOp == 3 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_ADD && cuif.halt == 1 && cuif.iREN == 0)
	$display("sHALT instr test succeded");
      @(posedge CLK);
	cuif.op = RTYPE;
	cuif.funct_op = SLLV;
      @(posedge CLK);
	assert(cuif.RdOrRtOr31==0 && cuif.regWEN == 1 && cuif.pcmode == 0 && cuif.extType == 0 && cuif.immorRt == 0 && cuif.memOp == 0 && cuif.dREN == 0 && cuif.dWEN == 0 && cuif.alu_op == ALU_SLL && cuif.halt == 0 && cuif.iREN == 1)
	$display("1RTYPE:SLLV test succeded");

      $finish;
end
endprogram