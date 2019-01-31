// interface include
`include "request_unit_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module request_unit (
	input CLK, nRST,
	request_unit_if.ru ruif
);
  	// type import
	import cpu_types_pkg::*;

	always_ff @(posedge CLK, negedge nRST) begin
		if(~nRST) begin
			ruif.dmemREN <= 0;
			ruif.dmemWEN <= 0;
			ruif.imemREN <= 1;
		end else if(ruif.dhit) begin
			ruif.dmemREN <= 0;
			ruif.dmemWEN <= 0;
			ruif.imemREN <= 1;
		end else if(ruif.ihit) begin
			ruif.dmemREN <= ruif.memRdRq;
			ruif.dmemWEN <= ruif.memWrRq;	
			ruif.imemREN <= 1;	//always need new instructions
		end
	end

endmodule