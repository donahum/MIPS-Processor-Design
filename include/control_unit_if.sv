/*
  Eric Villasenor
  evillase@gmail.com

  register file interface
*/
`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface register_file_if;
  // import types
  import cpu_types_pkg::*;

  logic     lui, jump, bne, beq, rf_write, alu_src, reg_dst, memtoreg, halt, jal, jr;
  aluop_t   alu_op;
  word_t    imemload;

  // register file ports
  modport rf (
    input   WEN, wsel, rsel1, rsel2, wdat,
    output  rdat1, rdat2
  );
  // register file tb
  modport tb (
    input   rdat1, rdat2,
    output  WEN, wsel, rsel1, rsel2, wdat
  );
endinterface

`endif //REGISTER_FILE_IF_VH