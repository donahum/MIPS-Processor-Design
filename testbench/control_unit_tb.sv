// mapped needs this
`include "control_unit_if.vh"
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module control_unit_tb;

  import cpu_types_pkg::*;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  control_unit_if cuif ();
  // test program
  test PROG (CLK, nRST, cuif);
  // DUT
`ifndef MAPPED
  control_unit DUT(CLK, nRST, cuif);
`else
  control_unit DUT(
    .\cuif.lui (cuif.lui),
    .\cuif.jump (cuif.jump),
    .\cuif.bne (cuif.bne),
    .\cuif.beq (cuif.beq),
    .\cuif.rf_write (cuif.rf_write),
    .\cuif.alu_src (cuif.alu_src),
    .\cuif.reg_dst (cuif.reg_dst),
    .\cuif.memtoreg (cuif.memtoreg),
    .\cuif.halt (cuif.halt),
    .\cuif.jal (cuif.jal),
    .\cuif.jr (cuif.jr),
    .\cuif.alu_op (cuif.alu_op),
    .\cuif.lw (cuif.lw),
    .\cuif.sw (cuif.sw)
  );
`endif

endmodule

program test (
  input logic CLK,
  output logic nRST, control_unit_if.tb tbcf
);
  parameter PERIOD = 10;

  import cpu_types_pkg::*;

  //opcode_t op;
  //funct_t funct;
  logic [5:0] opcode;
  opcode_t op;

  assign opcode = op;

  initial begin
	$monitor("@%00g CLK = %b nRST = %b", $time, CLK, nRST);

	#(PERIOD);
	nRST = 1'b0;
	#(PERIOD);
	nRST = 1'b1;

  op = J;
	tbcf.imemload = {opcode, '0};
	#(PERIOD);

  op = JAL;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = BEQ;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = BNE;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = ADDI;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);
	
  op = ADDIU;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = SLTI;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = SLTIU;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = ANDI;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = ORI;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = XORI;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = LUI;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = LW;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = SW;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = HALT;
  tbcf.imemload = {opcode, '0};
  #(PERIOD);

  op = RTYPE;
  tbcf.imemload = {opcode, '0, SLLV};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, SRLV};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, JR};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, ADD};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, ADDU};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, SUB};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, SUBU};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, AND};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, OR};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, XOR};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, NOR};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, SLT};
  #(PERIOD);

  tbcf.imemload = {opcode, '0, SLTU};
  #(PERIOD);

  end
endprogram
