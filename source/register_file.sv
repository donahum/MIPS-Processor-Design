
`include "cpu_types_pkg.vh"
`include "register_file_if.vh"

module register_file
import cpu_types_pkg::*;
(
  input logic CLK, nRST,
  register_file_if.rf rfif
);

word_t [31:0]regfile='{default:'0};
word_t read1,read2;
assign  read1=regfile[rfif.rsel1];
assign  read2=regfile[rfif.rsel2];
  always_ff @(posedge CLK or negedge nRST)
  begin
    if (!nRST)
    begin
      rfif.rdat1 <= '0;
      rfif.rdat2 <= '0;
      regfile ='{default:'0};
    end
    else
    begin
      rfif.rdat1 <= read1;
      rfif.rdat2 <= read2;
      if (rfif.WEN && rfif.wsel!=0)
      begin
        regfile[rfif.wsel] <= rfif.wdat;
      end
    end
  end
endmodule
