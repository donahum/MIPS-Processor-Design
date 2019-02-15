`ifndef MEMWB_IF_VH
`define MEMWB_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface memwb_if;
    // import types
    import cpu_types_pkg::*;

  logic     [1:0] RdOrRtOr31_in;
  logic	    regWEN_in,extType_in,immorRt_in;
  logic     [1:0] pcmode_in;
  logic     [1:0] memOp_in;
  logic	    iREN_in,dREN_in,dWEN_in,halt_in;
  opcode_t       op_in;
  funct_t  	funct_op_in;
  aluop_t    alu_op_in;
  regbits_t     rs_in, rt_in, rd_in;
  word_t	rdat1_in,rdat2_in,pc_in;
  logic [15:0] imm_in;
  logic [25:0] jaddr_in;
  word_t aluresult_in;
  logic zero_in;
  word_t dload_in;
  logic branchorjump_in;


  logic     [1:0] RdOrRtOr31_out;
  logic	    regWEN_out,extType_out,immorRt_out;
  logic     [1:0] pcmode_out;
  logic     [1:0] memOp_out;
  logic	    iREN_out,dREN_out,dWEN_out,halt_out;
  opcode_t       op_out;
  funct_t  	funct_op_out;
  aluop_t    alu_op_out;
  regbits_t rs_out, rt_out, rd_out;
  word_t	rdat1_out,rdat2_out,pc_out;
  logic [15:0] imm_out;
  logic [25:0] jaddr_out;
  word_t aluresult_out;
  logic zero_out;
  word_t dload_out;
  logic branchorjump_out;

    modport mem (
        input   op_in, funct_op_in, RdOrRtOr31_in, regWEN_in, pcmode_in, extType_in, immorRt_in, memOp_in, iREN_in, dREN_in, dWEN_in, alu_op_in, halt_in,rs_in, rt_in, rd_in,rdat1_in,rdat2_in,pc_in,imm_in,jaddr_in,aluresult_in,zero_in,dload_in,branchorjump_in,
        output   op_out, funct_op_out, RdOrRtOr31_out, regWEN_out, pcmode_out, extType_out, immorRt_out, memOp_out, iREN_out, dREN_out, dWEN_out, alu_op_out, halt_out,rs_out, rt_out, rd_out,rdat1_out,rdat2_out,pc_out,imm_out,jaddr_out,aluresult_out,zero_out,dload_out,branchorjump_out

    );
  
    modport wb (
	input   op_out, funct_op_out, RdOrRtOr31_out, regWEN_out, pcmode_out, extType_out, immorRt_out, memOp_out, iREN_out, dREN_out, dWEN_out, alu_op_out, halt_out,rs_out, rt_out, rd_out,rdat1_out,rdat2_out,pc_out,imm_out,jaddr_out,aluresult_out,zero_out,dload_out,branchorjump_out,
        output op_in, funct_op_in, RdOrRtOr31_in, regWEN_in, pcmode_in, extType_in, immorRt_in, memOp_in, iREN_in, dREN_in, dWEN_in, alu_op_in, halt_in,rs_in, rt_in, rd_in,rdat1_in,rdat2_in,pc_in,imm_in,jaddr_in,aluresult_in,zero_in,dload_in,branchorjump_in
    );

endinterface
`endif