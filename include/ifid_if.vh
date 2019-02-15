`ifndef IFID_IF_VH
`define IFID_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface ifid_if;
  // import types
  import cpu_types_pkg::*;

  word_t instruction, pc_src, pc_pass;
  opcode_t opcode;
  regbits_t rs, rt, rd;
  funct_t funct;
  logic [15:0] imm;
  logic [25:0] jaddress;

  modport ft (
    input   instruction, pc_src,
    output  opcode, rs, rt, rd, funct, imm, pc_pass, jaddress
  );
  
  modport dec (
    input   opcode, rs, rt, rd, funct, imm, pc_pass, jaddress,
    output  instruction, pc_src
  );

endinterface

`endif