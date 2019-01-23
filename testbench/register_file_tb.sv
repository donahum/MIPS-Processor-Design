/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "register_file_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module register_file_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  register_file_if rfif ();
  // test program
  test PROG (.CLK,.nRST,.rfif);
  // DUT
`ifndef MAPPED
  register_file DUT(CLK, nRST, rfif);
`else
  register_file DUT(
    .\rfif.rdat2 (rfif.rdat2),
    .\rfif.rdat1 (rfif.rdat1),
    .\rfif.wdat (rfif.wdat),
    .\rfif.rsel2 (rfif.rsel2),
    .\rfif.rsel1 (rfif.rsel1),
    .\rfif.wsel (rfif.wsel),
    .\rfif.WEN (rfif.WEN),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

endmodule

program test( input logic CLK, output logic nRST, register_file_if rfif) ;
initial
begin
      nRST = 0;
      @(posedge CLK);
      nRST = 1;
      rfif.wsel=4;
      rfif.wdat=432;
      rfif.WEN = 1;
      @(posedge CLK);
      @(posedge CLK);
      rfif.WEN = 0;
      rfif.rsel1 = 4;
      rfif.rsel2 = 6;
      @(posedge CLK);
      @(posedge CLK);
      assert (rfif.rdat1==432) $display("ohh mercer"); else $error("errrrrorrrr!");
      assert (rfif.rdat2==0) $display(":)"); else $error("whaaaaaat it was there 5 minutes ago");
      nRST = 0;
      @(posedge CLK);
      nRST = 1;
      @(posedge CLK);
      rfif.wsel = 0;
      rfif.wdat = 24;
      rfif.WEN=1;
      @(posedge CLK);
      @(posedge CLK);
      rfif.WEN=0;
      rfif.rsel1=0;
      rfif.rsel2=4;
      @(posedge CLK);
      @(posedge CLK);

      $finish;
end
endprogram
