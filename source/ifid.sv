// interface include
`include "ifid_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module ifid (
	input logic CLK, nRST, ihit,disable_fetch,
	ifid_if.ft ifidif
);
  	// type import
	import cpu_types_pkg::*;

	always_ff @(posedge CLK, negedge nRST) begin
		if(~nRST) begin
			ifidif.opcode 	<= RTYPE;
			ifidif.rs     	<= '0;
			ifidif.rt     	<= '0;
			ifidif.rd     	<= '0;
			ifidif.funct  	<= ADD;
			ifidif.imm    	<= '0;
			ifidif.pc_pass	<= '0;
			ifidif.jaddress <= '0;
		end else if(ihit && !disable_fetch) begin
			ifidif.opcode 	<= opcode_t'(ifidif.instruction [31:26]);
			ifidif.rs 	  	<= ifidif.instruction [25:21];
			ifidif.rt 	  	<= ifidif.instruction [21:16];
			ifidif.rd  	  	<= ifidif.instruction [15:11];
			ifidif.funct  	<= funct_t'(ifidif.instruction [5:0]);
			ifidif.imm    	<= ifidif.instruction [15:0];
			ifidif.pc_pass	<= ifidif.pc_src;
			ifidif.jaddress <= ifidif.instruction [25:0];
		end
	end

endmodule