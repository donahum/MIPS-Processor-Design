/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;   //should be 1 for single cycle?

  always_comb begin
    ccif.ramWEN = 0;
    ccif.ramREN = 0;
    ccif.ramaddr = 0;
    ccif.ramstore = 0;
    ccif.iwait = 1;
    ccif.dwait = 1;

    ccif.dload = ccif.ramload;
    ccif.iload = ccif.ramload;

    if(ccif.dWEN) begin
      ccif.ramREN = 0;
      ccif.ramWEN = 1;
      ccif.ramaddr = ccif.daddr;
      ccif.ramstore = ccif.dstore;
    end else if(ccif.dREN) begin
      ccif.ramREN = 1;
      ccif.ramWEN = 0; 
      ccif.ramaddr = ccif.daddr;
    end else if(ccif.iREN) begin
      ccif.ramREN = 1;
      ccif.ramWEN = 0; 
      ccif.ramaddr = ccif.iaddr;
    end else begin
      ccif.ramREN = 0;
      ccif.ramWEN = 0;
    end

    casez(ccif.ramstate)
      FREE: begin
        ccif.dwait = 1;
        ccif.iwait = 1;
      end
      BUSY: begin
        ccif.dwait = 1;
        ccif.iwait = 1;
      end
      ACCESS: begin
        ccif.dwait = ~(ccif.dREN || ccif.dWEN);   //if no data transactions, move to next instruction
        ccif.iwait =  (ccif.dREN || ccif.dWEN);   //instructions waiting for data
      end
      ERROR: begin
        ccif.dwait = 1;
        ccif.iwait = 1;
      end
    endcase
  end
endmodule
