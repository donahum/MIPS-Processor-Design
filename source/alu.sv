
`include "cpu_types_pkg.vh"
`include "alu_if.vh"

module register_file
import cpu_types_pkg::*;
(
  alu_if.rf rfif
);
logic [32:0] out = '{default:'0};
assign rfif.portOut = out[31:0];
always_comb
begin
	casez(rfif.aluop)
		ALU_SLL: out = rfif.portA << rfif.portB;
		ALU_SRL: out = rfif.portA >> rfif.portB;
		ALU_ADD: out = rfif.portA + rfif.portB;
		ALU_SUB: out = rfif.portA - rfif.portB;
		ALU_AND: out = rfif.portA & rfif.portB;
		ALU_OR: out = rfif.portA | rfif.portB;
		ALU_XOR: out = rfif.portA ^ rfif.portB;
		ALU_NOR: out = ~(rfif.portA | rfif.portB);
		ALU_SLT: out = signed(rfif.portA) < signed(rfif.portB);
		ALU_SLTU: out = rfif.portA < rfif.portB;
	endcase
end
assign rfif.zero = (rfif.portOut == 0);
assign rfif.overflow = (out[32]==1);
assign rfif.negative = (out[31]==1);

endmodule
