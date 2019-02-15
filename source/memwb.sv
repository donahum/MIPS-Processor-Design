// interface include
`include "memwb_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memwb (
	input logic CLK, nRST, ihit,
	memwb_if.mem memwbif
);
  	// type import
	import cpu_types_pkg::*;

	always_ff @(posedge CLK, negedge nRST) begin
		if(~nRST) begin
			memwbif.op_out <= RTYPE;
			memwbif.funct_op_out <= ADD;
			memwbif.RdOrRtOr31_out <= 0;
			memwbif.regWEN_out <= 0;
			memwbif.pcmode_out <= 0;
			memwbif.extType_out <= 0;
			memwbif.immorRt_out <= 0;
			memwbif.memOp_out <= 0;
			memwbif.iREN_out <= 1;
			memwbif.dREN_out <= 0;
			memwbif.dWEN_out <= 0;
			memwbif.alu_op_out <= ALU_ADD;
			memwbif.halt_out <= 0;
			memwbif.rs_out <= 0;
			memwbif.rt_out <= '0;
			memwbif.rd_out <= '0;
			memwbif.rdat1_out <= '0;
			memwbif.rdat2_out <= '0;
			memwbif.pc_out <= 0;
			memwbif.imm_out <= 0;
			memwbif.jaddr_out <= 0;
			memwbif.aluresult_out <= 0;
			memwbif.zero_out <= 0;
			memwbif.dload_out <= 0;
			memwbif.branchorjump_out <= 0;
		end else if(ihit) begin
			memwbif.op_out <= memwbif.op_in;
			memwbif.funct_op_out <= memwbif.funct_op_in;
			memwbif.RdOrRtOr31_out <= memwbif.RdOrRtOr31_in;
			memwbif.regWEN_out <= memwbif.regWEN_in;
			memwbif.pcmode_out <= memwbif.pcmode_in;
			memwbif.extType_out <= memwbif.extType_in;
			memwbif.immorRt_out <= memwbif.immorRt_in;
			memwbif.memOp_out <= memwbif.memOp_in;
			memwbif.iREN_out <= memwbif.iREN_in;
			memwbif.dREN_out <= memwbif.dREN_in;
			memwbif.dWEN_out <= memwbif.dWEN_in;
			memwbif.alu_op_out <= memwbif.alu_op_in;
			memwbif.halt_out <= memwbif.halt_in;
			memwbif.rs_out <= memwbif.rs_in;
			memwbif.rt_out <= memwbif.rt_in;
			memwbif.rd_out <= memwbif.rd_in;
			memwbif.rdat1_out <= memwbif.rdat1_in;
			memwbif.rdat2_out <= memwbif.rdat2_in;
			memwbif.pc_out <= memwbif.pc_in;
			memwbif.imm_out <= memwbif.imm_in;
			memwbif.jaddr_out <= memwbif.jaddr_in;
			memwbif.aluresult_out <= memwbif.aluresult_in;
			memwbif.zero_out <= memwbif.zero_in;
			memwbif.dload_out <= memwbif.dload_in;
			memwbif.branchorjump_out <= memwbif.branchorjump_in;
		end
	end

endmodule