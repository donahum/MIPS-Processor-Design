`include "register_file_if.vh"
`include "cpu_types_pkg.vh"

module register_file(input logic CLK, nRST, register_file_if.rf rfif);

	import cpu_types_pkg::*;

	word_t [31:0] regs;

	always_ff @(posedge CLK) begin
		if (!nRST) begin
			regs = '{default: '0};
		end else begin
			if (rfif.WEN && (rfif.wsel != 'b0)) begin
				regs[rfif.wsel] = rfif.wdat;
			end
		end
	end

	always_comb begin
		rfif.rdat1 = regs[rfif.rsel1];
		rfif.rdat2 = regs[rfif.rsel2];
	end

endmodule
