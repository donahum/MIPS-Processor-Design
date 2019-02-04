`include "cpu_types_pkg.vh"
`include "control_unit_if.vh"

module control_unit(input logic CLK, nRST, control_unit_if.cu cuif);

	import cpu_types_pkg::*;

	logic [5:0] op;
	logic [5:0] rtype_op;

	assign op = cuif.imemload [31:26];
	assign rtype_op = cuif.imemload [5:0];

	//alu_src parameters
	parameter FROM_IMM = 0;
	parameter FROM_RF = 1;

	//reg_dst parameters
	parameter IS_RTYPE = 0;
	parameter IS_ITYPE = 1;

	//memtoreg parameters
	parameter ALU_TO_REG = 0;
	parameter MEM_TO_REG = 1;

	always_comb begin
		cuif.lui = 0;
		cuif.jump = 0;
		cuif.bne = 0;
		cuif.beq = 0;
		cuif.rf_write = 0;
		cuif.alu_src = FROM_IMM;
		cuif.reg_dst = IS_ITYPE;
		cuif.memtoreg = ALU_TO_REG;
		cuif.halt = 0;
		cuif.jal = 0;
		cuif.jr = 0;
		cuif.alu_op = ALU_ADD;
		cuif.lw = 0;
		cuif.sw = 0;
		cuif.sign_extend = 1;

		casez(op)

			RTYPE: begin
				cuif.reg_dst = IS_RTYPE;
				cuif.alu_src = FROM_RF;
				cuif.rf_write = 1;
				cuif.sign_extend = 0;
				cuif.alu_op = ALU_ADD;

				casez(rtype_op)

					ADDU: begin end

					ADD: begin end

					AND: begin
						cuif.alu_op = ALU_AND;
					end

					JR: begin
						cuif.jr = 1;
						cuif.rf_write = 0;
					end

					NOR: begin
						cuif.alu_op = ALU_NOR;
					end

					OR: begin
						cuif.alu_op = ALU_OR;
					end

					SLT: begin
						cuif.alu_op = ALU_SLT;
					end

					SLTU: begin
						cuif.alu_op = ALU_SLTU;
					end

					SLLV: begin
						cuif.alu_op = ALU_SLL;
					end

					SRLV: begin
						cuif.alu_op = ALU_SRL;
					end

					SUBU: begin
						cuif.alu_op = ALU_SUB;
					end

					SUB: begin
						cuif.alu_op = ALU_SUB;
					end

					XOR: begin
						cuif.alu_op = ALU_XOR;
					end
				endcase
			end

			J: begin
				cuif.jump = 1;
			end

			JAL: begin
				cuif.jump = 1;
				cuif.jal = 1;
				cuif.rf_write = 1;
			end

			BEQ: begin
				cuif.beq = 1;
				cuif.alu_src = FROM_RF;
				cuif.alu_op = ALU_SUB;
			end

			BNE: begin
				cuif.bne = 1;
				cuif.alu_src = FROM_RF;
				cuif.alu_op = ALU_SUB;
			end

			ADDI: begin
				cuif.alu_op = ALU_ADD;
				cuif.rf_write = 1;
			end

			ADDIU: begin
				cuif.alu_op = ALU_ADD;
				cuif.rf_write = 1;
			end

			SLTI: begin
				cuif.alu_op	= ALU_SLT;
				cuif.rf_write = 1;
			end

			SLTIU: begin
				cuif.alu_op	= ALU_SLT;
				cuif.rf_write = 1;
			end

			ANDI: begin
				cuif.alu_op = ALU_AND;
				cuif.rf_write = 1;
				cuif.sign_extend = 0;
			end

			ORI: begin
				cuif.alu_op = ALU_OR;
				cuif.rf_write = 1;
				cuif.sign_extend = 0;
			end

			XORI: begin
				cuif.alu_op = ALU_XOR;
				cuif.rf_write = 1;
				cuif.sign_extend = 0;
			end

			LUI: begin
				cuif.lui = 1;
				cuif.rf_write = 1;
				cuif.sign_extend = 0;
			end

			LW: begin
				cuif.memtoreg = MEM_TO_REG;
				cuif.rf_write = 1;
				cuif.lw = 1;
			end

			SW: begin
				cuif.memtoreg = MEM_TO_REG;
				cuif.sw = 1;
			end

			HALT: begin
				cuif.halt = 1;
			end
		endcase
	end
endmodule