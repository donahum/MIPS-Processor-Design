/*
  Eric Villasenor
  evillase@gmail.com

  register file interface
*/
`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface control_unit_if;
  // import types
  import cpu_types_pkg::*;

  logic     lui, jump, bne, beq, rf_write, alu_src, reg_dst, memtoreg, halt, jal, jr, lw, sw, sign_extend;
  aluop_t   alu_op;
  word_t    imemload;

  modport cu (
    input   imemload,
    output  lui, jump, bne, beq, rf_write, alu_src, reg_dst, memtoreg, halt, jal, jr, alu_op, lw, sw, sign_extend
  );
  
  modport tb (
    input  lui, jump, bne, beq, rf_write, alu_src, reg_dst, memtoreg, halt, jal, jr, alu_op, lw, sw, sign_extend,
    output   imemload
  );
endinterface

`endif //REGISTER_FILE_IF_VH