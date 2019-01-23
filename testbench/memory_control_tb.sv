/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "cpu_types_pkg.vh"
`include "cache_control_if.vh"
`include "caches_if.vh"
`include "cpu_ram_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

import cpu_types_pkg::*;
module memory_control_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  cpu_ram_if r0();
  caches_if c0(),c1();
  cache_control_if rfif(c0,c1);
// assignment
assign  r0.ramstore = rfif.ramstore;
assign  r0.ramaddr = rfif.ramaddr;
assign  r0.ramWEN = rfif.ramWEN;
assign  r0.ramREN = rfif.ramREN;

assign  rfif.ramload = r0.ramload;
assign  rfif.ramstate = r0.ramstate;

  // test program
  test PROG (.CLK,.nRST,.c0);
  // DUT
`ifndef MAPPED
  ram DUT0(CLK,nRST,r0);
  memory_control DUT(CLK, nRST, rfif);
`else
  ram DUT0(
    .\r0.ramaddr(r0.ramaddr),
    .\r0.ramstore(r0.ramstore),
    .\r0.ramREN(r0.ramREN),
    .\r0.ramWEN(r0.ramWEN),
    .\r0.ramstate(r0.ramstate),
    .\r0.ramload(r0.ramload),
    .\nRST (nRST),
    .\CLK (CLK));
  memory_control DUT(
    .\rfif.iREN (rfif.iREN),
    .\rfif.dREN (rfif.dREN),
    .\rfif.dWEN (rfif.dWEN),
    .\rfif.dstore (rfif.dstore),
    .\rfif.iaddr (rfif.iaddr),
    .\rfif.daddr (rfif.daddr),
    .\rfif.ramload (rfif.ramload),
    .\rfif.ramstate (rfif.ramstate),
    .\rfif.ccwrite (rfif.ccwrite),
    .\rfif.cctrans (rfif.cctrans),
    .\rfif.iwait (rfif.iwait),
    .\rfif.dwait (rfif.dwait),
    .\rfif.iload (rfif.iload),
    .\rfif.dload (rfif.dload),
    .\rfif.ramstore (rfif.ramstore),
    .\rfif.ramaddr (rfif.ramaddr),
    .\rfif.ramWEN (rfif.ramWEN),
    .\rfif.ramREN (rfif.ramREN),
    .\rfif.ccwait (rfif.ccwait),
    .\rfif.ccinv (rfif.ccinv),
    .\rfif.ccsnoopaddr (rfif.ccsnoopaddr),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

endmodule

program test( input logic CLK, output logic nRST, caches_if c0) ;
initial
begin
      nRST = 0;
      @(posedge CLK);
      nRST = 1;
      c0.dREN=0;
      c0.iREN=0;
      c0.dWEN=0;
      @(posedge CLK);
      nRST = 0;
      @(posedge CLK);
      nRST = 1;
      @(posedge CLK);
	for (int i = 0; i<45;i+=4) 		// read first 11 words
	begin
		c0.daddr=i;
		c0.dREN=1;
		@(negedge c0.dwait)
		$display("word number(%0d),the address %x contains: %x",i/4,i,c0.dload);
	end
	c0.dREN=0;

	for (int i = 48; i<600;i+=4)		// write to second 11 words
	begin
		c0.daddr=i;
		c0.dstore = i*16;
		  c0.dWEN=1;
		@(negedge c0.dwait)
		$display("word written(%0d),the address %x now should contain: %x",i/4,i,i*16);
		 // c0.dWEN=0;
      		repeat (2) @(posedge CLK);
	end
        c0.dWEN=0;


	for (int i = 48; i<600;i+=4)// read second 11 words
	begin
		c0.iaddr=i;
		c0.iREN=1;
		@(negedge c0.iwait)
		$display("word number(%0d),the address %x contains: %x",i/4,i,c0.dload);
	end
	c0.iREN=0;
	for (int i = 800; i< 268435456*4;i*=2)		// write to last 11 words
	begin
		c0.daddr=i;
		c0.dstore = i*16;
		  c0.dWEN=1;
		@(negedge c0.dwait)
		$display("word written(%0d),the address %x now should contain: %x",i/4,i,i*16);
		 // c0.dWEN=0;
      		repeat (2) @(posedge CLK);
	end
        c0.dWEN=0;

     		dump_memory();
      $finish;
end
  task automatic dump_memory();
    string filename = "memcpu.hex";
    int memfd;

    //syif.tbCTRL = 1;
    c0.daddr = 0;
    c0.dWEN = 0;
    c0.dREN = 0;

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

      c0.daddr = i << 2;
      c0.dREN = 1;
      repeat (4) @(posedge CLK);
      if (c0.dload === 0)
        continue;
      values = {8'h04,16'(i),8'h00,c0.dload};
      foreach (values[j])
        chksum += values[j];
      chksum = 16'h100 - chksum;
      ihex = $sformatf(":04%h00%h%h",16'(i),c0.dload,8'(chksum));
      $fdisplay(memfd,"%s",ihex.toupper());
    end //for
    if (memfd)
    begin
      //syif.tbCTRL = 0;
      c0.dREN = 0;
      $fdisplay(memfd,":00000001FF");
      $fclose(memfd);
      $display("Finished memory dump.");
    end
  endtask


endprogram
