/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 2;

assign ccif.ramstore = ccif.dstore;
assign ccif.iload = ccif.ramload;
assign ccif.dload = ccif.ramload;

always_comb
begin
		ccif.iwait = 1;
		ccif.dwait = 1;
		ccif.ramWEN = 0;
		ccif.ramREN = 0;
	if (ccif.ramstate==ACCESS)
	begin
		if (ccif.dREN || ccif.dWEN) ccif.dwait=0;
		else ccif.iwait=0;
	end 

	if (ccif.dWEN) ccif.ramWEN=1;
	else if(ccif.dREN || ccif.iREN) ccif.ramREN = 1;

	if (ccif.dWEN || ccif.dREN) ccif.ramaddr = ccif.daddr;
	else ccif.ramaddr = ccif.iaddr;
end



endmodule
