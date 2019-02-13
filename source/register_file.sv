
`include "cpu_types_pkg.vh"
`include "register_file_if.vh"

module register_file
import cpu_types_pkg::*;
(
  input logic CLK, nRST,
  register_file_if.rf rfif
);

word_t [31:0]regfile='{default:'0};
assign  rfif.rdat1=regfile[rfif.rsel1];
assign  rfif.rdat2=regfile[rfif.rsel2];
  always_ff @(negedge CLK or negedge nRST)
  begin
    if (!nRST)
    begin
      regfile ='{default:'0};
    end
    else
    begin
      if (rfif.WEN && rfif.wsel!=0)
      begin
        regfile[rfif.wsel] <= rfif.wdat;
      end
    end
  end
endmodule
