// interface include
`include "idex_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module idex (
	input logic CLK, nRST, ihit,flush2,
	idex_if.dec idexif
);
  	// type import
	import cpu_types_pkg::*;

	always_ff @(posedge CLK, negedge nRST) begin
		if( ~nRST ) begin
			idexif.op_out <= RTYPE;
			idexif.funct_op_out <= ADD;
			idexif.RdOrRtOr31_out <= 0;
			idexif.regWEN_out <= 0;
			idexif.pcmode_out <= 0;
			idexif.extType_out <= 0;
			idexif.immorRt_out <= 0;
			idexif.memOp_out <= 0;
			idexif.iREN_out <= 1;
			idexif.dREN_out <= 0;
			idexif.dWEN_out <= 0;
			idexif.alu_op_out <= ALU_ADD;
			idexif.halt_out <= 0;
			idexif.rs_out <= 0;
			idexif.rt_out <= '0;
			idexif.rd_out <= '0;
			idexif.rdat1_out <= '0;
			idexif.rdat2_out <= '0;
			idexif.pc_out <= 0;
			idexif.imm_out <= 0;
			idexif.jaddr_out <= 0;
		end else if(flush2 && ihit) begin
			idexif.op_out <= RTYPE;
			idexif.funct_op_out <= ADD;
			idexif.RdOrRtOr31_out <= 0;
			idexif.regWEN_out <= 0;
			idexif.pcmode_out <= 0;
			idexif.extType_out <= 0;
			idexif.immorRt_out <= 0;
			idexif.memOp_out <= 0;
			idexif.iREN_out <= 1;
			idexif.dREN_out <= 0;
			idexif.dWEN_out <= 0;
			idexif.alu_op_out <= ALU_ADD;
			idexif.halt_out <= 0;
			idexif.rs_out <= 0;
			idexif.rt_out <= '0;
			idexif.rd_out <= '0;
			idexif.rdat1_out <= '0;
			idexif.rdat2_out <= '0;
			idexif.pc_out <= 0;
			idexif.imm_out <= 0;
			idexif.jaddr_out <= 0;
		end else if(ihit) begin


			idexif.op_out <= idexif.op_in;
			idexif.funct_op_out <= idexif.funct_op_in;
			idexif.RdOrRtOr31_out <= idexif.RdOrRtOr31_in;
			idexif.regWEN_out <= idexif.regWEN_in;
			idexif.pcmode_out <= idexif.pcmode_in;
			idexif.extType_out <= idexif.extType_in;
			idexif.immorRt_out <= idexif.immorRt_in;
			idexif.memOp_out <= idexif.memOp_in;
			idexif.iREN_out <= idexif.iREN_in;
			idexif.dREN_out <= idexif.dREN_in;
			idexif.dWEN_out <= idexif.dWEN_in;
			idexif.alu_op_out <= idexif.alu_op_in;
			idexif.halt_out <= idexif.halt_in;
			idexif.rs_out <= idexif.rs_in;
			idexif.rt_out <= idexif.rt_in;
			idexif.rd_out <= idexif.rd_in;
			idexif.rdat1_out <= idexif.rdat1_in;
			idexif.rdat2_out <= idexif.rdat2_in;
			idexif.pc_out <= idexif.pc_in;
			idexif.imm_out <= idexif.imm_in;
			idexif.jaddr_out <= idexif.jaddr_in;


		end
	end

endmodule