/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "alu_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module alu_tb;

  parameter PERIOD = 10;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;


  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  alu_if rfif ();
  // test program
  test PROG (.rfif);
  // DUT
`ifndef MAPPED
  alu DUT(rfif);
`else
  alu DUT(
    .\rfif.zero (rfif.zero),
    .\rfif.overflow (rfif.overflow),
    .\rfif.negative (rfif.negative),
    .\rfif.portOut (rfif.portOut),
    .\rfif.portA (rfif.portA),
    .\rfif.portB (rfif.portB),
    .\rfif.aluop (rfif.aluop)
  );
`endif

endmodule

program test(alu_if rfif) ;
initial
begin
	rfif.portA = 32'b00001111000000111100000011110011;
	rfif.portB = 32'b00000000000000000000000000000001;
	rfif.aluop = ALU_SLL;
@(posedge CLK);
	if (rfif.portOut==rfif.portA<<rfif.portB) $display("shift left works");
@(posedge CLK);
	rfif.portA = 32'b00001111000000111100000011110010;
	rfif.portB = 32'b00000000000000000000000000000001;
	rfif.aluop = ALU_SRL;
@(posedge CLK);
	if (rfif.portOut==rfif.portA>>rfif.portB) $display("shift right works");
@(posedge CLK);
	rfif.portA = 32'd43;
	rfif.portB = 32'd20;
	rfif.aluop = ALU_ADD;
@(posedge CLK);
	if (rfif.portOut==rfif.portA+rfif.portB) $display("Add works");
@(posedge CLK);
	rfif.portA = 32'd43;
	rfif.portB = 32'd20;
	rfif.aluop = ALU_SUB;
@(posedge CLK);
	if (rfif.portOut==rfif.portA-rfif.portB) $display("Sub works");
@(posedge CLK);
	rfif.portA = 32'b00001111000000111100000011110010;
	rfif.portB = 32'b00000010000000010000000000000011;
	rfif.aluop = ALU_AND;
@(posedge CLK);
	if (rfif.portOut== rfif.portA & rfif.portB) $display("And works");
@(posedge CLK);
	rfif.portA = 32'b00001111000000111100000011110010;
	rfif.portB = 32'b00000000000100000100000000001001;
	rfif.aluop = ALU_OR;
@(posedge CLK);
	if (rfif.portOut==rfif.portA | rfif.portB) $display("Or works");
@(posedge CLK);
	rfif.portA = 32'b00001111000000111100000011110010;
	rfif.portB = 32'b00000100001001001000000000100101;
	rfif.aluop = ALU_XOR;
@(posedge CLK);
	if (rfif.portOut==rfif.portA^rfif.portB) $display("XOr works");
@(posedge CLK);
	rfif.portA = 32'b00001111000000111100000011110010;
	rfif.portB = 32'b00100001000000000000100000000001;
	rfif.aluop = ALU_NOR;
@(posedge CLK);
	if (rfif.portOut==~(rfif.portA|rfif.portB)) $display("Nor works");
@(posedge CLK);
	rfif.portA = 32'd54;
	rfif.portB = 32'd23;
	rfif.aluop = ALU_SLT;
@(posedge CLK);
	if (rfif.portOut==rfif.portA<rfif.portB) $display("Slt works");
@(posedge CLK);
@(posedge CLK);
	rfif.portA = 32'd54;
	rfif.portB = 32'd23;
	rfif.aluop = ALU_SLTU;
@(posedge CLK);
	if (rfif.portOut==rfif.portA<rfif.portB) $display("SltU works");
@(posedge CLK);

      $finish;
end
endprogram
