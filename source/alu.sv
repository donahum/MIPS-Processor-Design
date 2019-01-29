
`include "cpu_types_pkg.vh"
`include "alu_if.vh"

module alu
import cpu_types_pkg::*;
(
  alu_if.rf rfif
);
word_t out = '{default:'0};
assign rfif.portOut = out;
always_comb
begin
	casez(rfif.aluop)
		ALU_SLL: out = rfif.portB << rfif.portA[4:0];  
		ALU_SRL: out = rfif.portB >> rfif.portA[4:0];
		ALU_ADD: out = rfif.portA + rfif.portB;
		ALU_SUB: out = rfif.portA - rfif.portB;
		ALU_AND: out = rfif.portA & rfif.portB;
		ALU_OR: out = rfif.portA | rfif.portB;
		ALU_XOR: out = rfif.portA ^ rfif.portB;
		ALU_NOR: out = ~(rfif.portA | rfif.portB);
		ALU_SLT: out = $signed(rfif.portA) < $signed(rfif.portB);
		ALU_SLTU: out = rfif.portA < rfif.portB;
	endcase
end
assign rfif.zero = (rfif.portOut == 0);
assign rfif.overflow = ((out[31]==1 && rfif.portA[31]==0 && rfif.portB[31]==0)||(out[31]==0 && rfif.portA[31]==1 && rfif.portB[31]==1));
assign rfif.negative = (out[31]==1);

endmodule
