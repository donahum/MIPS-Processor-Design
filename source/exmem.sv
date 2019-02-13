// interface include
`include "exmem_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module exmem (
	input logic CLK, nRST, ihit,flush3,dhit,
	exmem_if.ex exmemif
);
  	// type import
	import cpu_types_pkg::*;

	always_ff @(posedge CLK, negedge nRST) begin
		
		if(~nRST) begin
			exmemif.op_out <= RTYPE;
			exmemif.funct_op_out <= ADD;
			exmemif.RdOrRtOr31_out <= 0;
			exmemif.regWEN_out <= 0;
			exmemif.pcmode_out <= 0;
			exmemif.extType_out <= 0;
			exmemif.immorRt_out <= 0;
			exmemif.memOp_out <= 0;
			exmemif.iREN_out <= 1;
			exmemif.dREN_out <= 0;
			exmemif.dWEN_out <= 0;
			exmemif.alu_op_out <= ALU_ADD;
			exmemif.halt_out <= 0;
			exmemif.rs_out <= 0;
			exmemif.rt_out <= '0;
			exmemif.rd_out <= '0;
			exmemif.rdat1_out <= '0;
			exmemif.rdat2_out <= '0;
			exmemif.pc_out <= 0;
			exmemif.imm_out <= 0;
			exmemif.jaddr_out <= 0;
			exmemif.aluresult_out <= 0;
			exmemif.zero_out <= 0;
		end else if (flush3 && ihit) begin
			exmemif.op_out <= RTYPE;
			exmemif.funct_op_out <= ADD;
			exmemif.RdOrRtOr31_out <= 0;
			exmemif.regWEN_out <= 0;
			exmemif.pcmode_out <= 0;
			exmemif.extType_out <= 0;
			exmemif.immorRt_out <= 0;
			exmemif.memOp_out <= 0;
			exmemif.iREN_out <= 1;
			exmemif.dREN_out <= 0;
			exmemif.dWEN_out <= 0;
			exmemif.alu_op_out <= ALU_ADD;
			exmemif.halt_out <= 0;
			exmemif.rs_out <= 0;
			exmemif.rt_out <= '0;
			exmemif.rd_out <= '0;
			exmemif.rdat1_out <= '0;
			exmemif.rdat2_out <= '0;
			exmemif.pc_out <= 0;
			exmemif.imm_out <= 0;
			exmemif.jaddr_out <= 0;
			exmemif.aluresult_out <= 0;
			exmemif.zero_out <= 0;
		end else if (dhit) begin 
			exmemif.dREN_out<=0; 
			exmemif.dWEN_out<=0;
			exmemif.dload_out<= exmemif.dload_in;  
		end else if(ihit) begin
			exmemif.op_out <= exmemif.op_in;
			exmemif.funct_op_out <= exmemif.funct_op_in;
			exmemif.RdOrRtOr31_out <= exmemif.RdOrRtOr31_in;
			exmemif.regWEN_out <= exmemif.regWEN_in;
			exmemif.pcmode_out <= exmemif.pcmode_in;
			exmemif.extType_out <= exmemif.extType_in;
			exmemif.immorRt_out <= exmemif.immorRt_in;
			exmemif.memOp_out <= exmemif.memOp_in;
			exmemif.iREN_out <= exmemif.iREN_in;
			exmemif.dREN_out <= exmemif.dREN_in;
			exmemif.dWEN_out <= exmemif.dWEN_in;
			exmemif.alu_op_out <= exmemif.alu_op_in;
			exmemif.halt_out <= exmemif.halt_in;
			exmemif.rs_out <= exmemif.rs_in;
			exmemif.rt_out <= exmemif.rt_in;
			exmemif.rd_out <= exmemif.rd_in;
			exmemif.rdat1_out <= exmemif.rdat1_in;
			exmemif.rdat2_out <= exmemif.rdat2_in;
			exmemif.pc_out <= exmemif.pc_in;
			exmemif.imm_out <= exmemif.imm_in;
			exmemif.jaddr_out <= exmemif.jaddr_in;
			exmemif.aluresult_out <= exmemif.aluresult_in;
			exmemif.zero_out <= exmemif.zero_in;

		end
	end

endmodule