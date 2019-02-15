// mapped needs this
`include "cpu_types_pkg.vh"
`include "hazard_unit_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

import cpu_types_pkg::*;
module hazard_unit_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  hazard_unit_if huif();

  // test program
  test PROG (.CLK, .nRST, .huif);
  // DUT
`ifndef MAPPED
  hazard_unit DUT(huif);
`else
  hazard_unit DUT(
    //inputs
    .\huif.execute_write_reg(huif.execute_write_reg),
    .\huif.mem_write_reg(huif.mem_write_reg),
    .\huif.execute_regWEN(huif.execute_regWEN),
    .\huif.mem_regWEN(huif.mem_regWEN),
    .\huif.branchorjump(huif.branchorjump),
    .\huif.read_reg1(huif.read_reg1),
    .\huif.read_reg2(huif.read_reg2),
    .\huif.branchorjump_wb(huif.branchorjump_wb),
    //outputs
    .\huif.disable_fetch(huif.disable_fetch),
    .\huif.flush2(huif.flush2),
    .\huif.flush3(huif.flush3)
  );
`endif

endmodule

program test( input logic CLK, output logic nRST, hazard_unit_if huif) ;
initial begin
    string testName;
    nRST = 1;
    @(posedge CLK);

    //reset conditions
    testName = "RESET";
    nRST = 0;
    huif.execute_write_reg = '0;
    huif.mem_write_reg = '0;
    huif.execute_regWEN = 0;
    huif.mem_regWEN = 0;
    huif.branchorjump = 0;
    huif.read_reg1 = '0;
    huif.read_reg2 = '0;
    huif.branchorjump_wb = 0;
    @(posedge CLK);

    //branch flushing test
    testName = "BRANCH";
    nRST = 1;
    huif.branchorjump = 1;
    @(posedge CLK);
    huif.branchorjump_wb = 1;
    @(posedge CLK);
    huif.branchorjump = 0;
    @(posedge CLK);

    //Independent DEC to EX
    testName = "INDEPENDENT";
    huif.branchorjump_wb = 0;
    huif.execute_write_reg = 3;
    huif.read_reg1 = 1;
    huif.read_reg2 = 2;
    huif.execute_regWEN = 1;
    @(posedge CLK);

    //DEC to EX dependency
    testName = "DEC TO EX";
    huif.execute_write_reg = 2;
    @(posedge CLK);

    //Independent DEC to MEM
    testName = "INDEPENDENT";
    huif.execute_write_reg = 3;
    huif.execute_regWEN = 0;

    huif.mem_write_reg = 3;
    huif.mem_regWEN = 1;
    @(posedge CLK);

    //DEC to MEM dependency
    testName = "DEC TO MEM";
    huif.mem_write_reg = 2;
    @(posedge CLK);

    $finish;
end

endprogram
