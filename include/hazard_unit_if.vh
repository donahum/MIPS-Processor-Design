`ifndef HAZARD_UNIT_IF_VH
`define HAZARD_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface hazard_unit_if;
  // import types
  import cpu_types_pkg::*;

  regbits_t     execute_write_reg , mem_write_reg,read_reg1,read_reg2;
  logic	    execute_regWEN,mem_regWEN;
  logic disable_fetch,flush2,flush3;
  logic branchorjump,branchorjump_wb;


  // hazard unit ports
  modport hu (
    input   execute_write_reg, mem_write_reg,execute_regWEN,mem_regWEN,branchorjump,read_reg1,read_reg2,branchorjump_wb,
    output  disable_fetch, flush2, flush3
  );
  // hazard unit tb
  modport tb (
    input   disable_fetch, flush2, flush3,
    output  execute_write_reg, mem_write_reg,execute_regWEN,mem_regWEN,branchorjump,read_reg1,read_reg2,branchorjump_wb
  );
endinterface

`endif //HAZARD_UNIT_IF_VH