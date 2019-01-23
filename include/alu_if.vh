/*
  Eric Villasenor
  evillase@gmail.com

  register file interface
*/
`ifndef ALU_IF_VH
`define ALU_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface alu_if;
  // import types
  import cpu_types_pkg::*;

  logic     zero, overflow, negative;
  aluop_t   aluop;
  word_t    portA, portB, portOut;

  // alu  ports
  modport rf (
    input   portA,portB,aluop,
    output  negative,portOut,overflow,zero
  );
  // alu tb
  modport tb (
     input  negative,portOut,overflow,zero,
     output   portA,portB,aluop
  );
endinterface

`endif //REGISTER_FILE_IF_VH
