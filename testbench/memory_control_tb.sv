//Michael Donahue
//Lab 3 Memory Control TB

// mapped needs this
`include "cache_control_if.vh"
`include "cpu_types_pkg.vh"
`include "cpu_ram_if.vh"
`include "caches_if.vh"

import cpu_types_pkg::*;

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module memory_control_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface

  caches_if cif0 ();
  caches_if cif1 ();

  cache_control_if ccif (cif0, cif1);
  //cache_control_if ccif ();
  cpu_ram_if rif ();

  assign ccif.ramstate = rif.ramstate;
  assign ccif.ramload = rif.ramload;
  assign rif.ramaddr = ccif.ramaddr;
  assign rif.ramstore = ccif.ramstore;
  assign rif.ramREN = ccif.ramREN;
  assign rif.ramWEN = ccif.ramWEN;

  // test program
  test PROG (CLK, nRST, ccif);
  // DUT
`ifndef MAPPED
  memory_control DUT(CLK, nRST, ccif);
`else
  memory_control DUT(
    .\ccif.iREN (ccif.iREN),
    .\ccif.dREN (ccif.dREN),
    .\ccif.dWEN (ccif.dWEN),
    .\ccif.dstore (ccif.dstore),
    .\ccif.iaddr (ccif.iaddr),
    .\ccif.daddr (ccif.daddr),
    .\ccif.ramload (ccif.ramload),
    .\ccif.ramstate (ccif.ramstate),
    .\ccif.ccwrite (ccif.ccwrite),
    .\ccif.cctrans (ccif.cctrans),
    .\ccif.iwait (ccif.iwait),
    .\ccif.dwait (ccif.dwait),
    .\ccif.iload (ccif.iload),
    .\ccif.dload (ccif.dload),
    .\ccif.ramstore (ccif.ramstore),
    .\ccif.ramaddr (ccif.ramaddr),
    .\ccif.ramWEN (ccif.ramWEN),
    .\ccif.ramREN (ccif.ramREN),
    .\ccif.ccwait (ccif.ccwait),
    .\ccif.ccinv (ccif.ccinv),
    .\ccif.ccsnoopaddr (ccif.ccsnoopaddr),
    .\nRST (nRST),
    .\CLK (CLK)
  );

`endif

`ifndef MAPPED
	 ram DUT2 (CLK, nRST, rif);
`endif	 


endmodule

program test (
  input logic CLK,
  output logic nRST, cache_control_if.cc ccif
);
  parameter PERIOD = 10;
  initial begin
	//$monitor("@%00g CLK = %b nRST = %b", $time, CLK, nRST);

	#(PERIOD);
	nRST = 1'b0;
	cif0.iREN = 0;
	cif0.dREN = 0;
	cif0.dWEN = 0;
	cif0.dstore = '0;
	cif0.iaddr = '0;
	cif0.daddr = '0;
	#(PERIOD);
	nRST = 1'b1;

	//memory_control_tb.cif0.iREN = 1;
	//memory_control_tb.cif0.iaddr = 
	cif0.iREN = 0;
	cif0.dREN = 0;
	cif0.dWEN = 0;
	cif0.dstore = '0;
	cif0.iaddr = '0;
	cif0.daddr = '0;
	//ccif.ramstate = '0;

	//load in some instructions
	/*for(int unsigned i = 0; i < 4; i++)
	begin

	end*/

	cif0.iREN = 1;
	cif0.dWEN = 1;
	cif0.dREN = 1;
	cif0.daddr = '1;
	cif0.dstore = '1;
	#(PERIOD);
	#(PERIOD);
	#(PERIOD);
	#(PERIOD);

	cif0.dWEN = 0;

	#(PERIOD);
	#(PERIOD);
	#(PERIOD);
	#(PERIOD);

	cif0.dWEN = 1;
	cif0.daddr = 'h00000100;
	cif0.dstore = 'h0000beef;

	#(PERIOD);
	#(PERIOD);
	#(PERIOD);
	#(PERIOD);

	cif0.dWEN = 0;

	#(PERIOD);
	#(PERIOD);
	#(PERIOD);
	#(PERIOD);

	cif0.dREN = 0;
	cif0.iREN = 0;

	#(PERIOD);
	#(PERIOD);
	#(PERIOD);
	#(PERIOD);

    dump_memory();
    $finish;
  end

  task automatic dump_memory();
    string filename = "memcpu.hex";
    int memfd;

    cif0.iaddr = '0;
    cif0.daddr = '0;
    cif0.dstore = '0;
    cif0.dWEN = 0;
    cif0.dREN = 0;
    cif0.iREN = 0;

    memfd = $fopen(filename,"w");
    if (memfd)
      $display("Starting memory dump.");
    else
      begin $display("Failed to open %s.",filename); $finish; end

    for (int unsigned i = 0; memfd && i < 16384; i++)
    begin
      int chksum = 0;
      bit [7:0][7:0] values;
      string ihex;

      cif0.iaddr = i << 2;
      cif0.iREN = 1;
      repeat (4) @(posedge CLK);
      //@(negedge cif0.iwait)
      if (cif0.iload === 0)
        continue;
      values = {8'h04,16'(i),8'h00,cif0.iload};
      foreach (values[j])
        chksum += values[j];
      chksum = 16'h100 - chksum;
      ihex = $sformatf(":04%h00%h%h",16'(i),cif0.iload,8'(chksum));
      $fdisplay(memfd,"%s",ihex.toupper());
    end //for
    if (memfd)
    begin
      cif0.iREN = 0;
      $fdisplay(memfd,":00000001FF");
      $fclose(memfd);
      $display("Finished memory dump.");
    end
  endtask
endprogram
