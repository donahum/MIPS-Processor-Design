`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface control_unit_if;
  // import types
  import cpu_types_pkg::*;

  logic     [1:0] RdOrRtOr31;
  logic	    regWEN,extType,immorRt;
  logic     [1:0] pcmode;
  logic     [1:0] memOp;
  logic	    iREN,dREN,dWEN,halt;
  opcode_t       op;
  funct_t  	funct_op;
  aluop_t    alu_op;

  // control unit ports
  modport cu (
    input   op, funct_op,
    output  RdOrRtOr31, regWEN, pcmode, extType, immorRt, memOp, iREN, dREN, dWEN, alu_op, halt
  );
  // control unit tb
  modport tb (
    input   RdOrRtOr31, regWEN, pcmode, extType, immorRt, memOp, iREN, dREN, dWEN, alu_op, halt,
    output  op, funct_op
  );
endinterface

`endif //CONTROL_UNIT_IF_VH