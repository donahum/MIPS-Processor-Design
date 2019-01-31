`ifndef REQUEST_UNIT_IF_VH
`define REQUEST_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface request_unit_if;
  // import types
  import cpu_types_pkg::*;

  logic dhit, ihit, memWrRq, memRdRq, dmemREN, dmemWEN, imemREN;

  modport ru (
    input   dhit, ihit, memWrRq, memRdRq,
    output  dmemREN, dmemWEN, imemREN
  );
  
  modport tb (
    input  dmemREN, dmemWEN, imemREN,
    output   dhit, ihit, memWrRq, memRdRq
  );
endinterface

`endif