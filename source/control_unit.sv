
// interface include
`include "control_unit_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module control_unit (
  control_unit_if.cu cuif
);
  // type import
  import cpu_types_pkg::*;


always_comb begin
	cuif.iREN = 1;
	cuif.halt = 0;

					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_SLL; // shift left logical

	casez(cuif.op)
		RTYPE: begin
			casez(cuif.funct_op)
				SLLV: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_SLL; // shift left logical
				end
				SRLV: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_SRL; // shift right logical
				end
				JR: begin
					cuif.RdOrRtOr31 = 0;   // DON'T CARE but Rd
					cuif.regWEN = 0;       // don't Write to reg file
					cuif.pcmode = 1;       // npc = rs
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // DON'T CARE but Rt
					cuif.memOp = 0;        // DON'T CARE but ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_SLL; // DON'T CARE but shift left logical
				end
				ADD: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_ADD; // add
				end
				ADDU: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_ADD; // add
				end
				SUB: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_SUB; // subtract
				end
				SUBU: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_SUB; // subtract
				end
				AND: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_AND; // and
				end
				OR: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_OR; // or
				end
				XOR: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_XOR; // xor
				end
				NOR: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_NOR; // nor
				end
				SLT: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_SLT; // Set less than
				end
				SLTU: begin
					cuif.RdOrRtOr31 = 0;   // Rd
					cuif.regWEN = 1;       // Write to reg file
					cuif.pcmode = 0;       // npc = pc + 4
					cuif.extType = 0;      // DON'T CARE about ext
					cuif.immorRt = 0;      // Rt
					cuif.memOp = 0;        // ALU output
					cuif.dREN = 0;         // not reading from memmory
					cuif.dWEN = 0;         // not writing to memmory
					cuif.alu_op = ALU_SLTU;// set less than unsigned
				end
			endcase
		end
		J: begin
			cuif.RdOrRtOr31 = 0;   // Rd
			cuif.regWEN = 0;       // don't Write to reg file
			cuif.pcmode = 2;       // npc = jump address 
			cuif.extType = 0;      // DON'T CARE about ext
			cuif.immorRt = 0;      // Rt
			cuif.memOp = 0;        // ALU output
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_SRL; // shift right logical			
		end
		JAL: begin
			cuif.RdOrRtOr31 = 1;   // 31
			cuif.regWEN = 1;       // Write to reg file
			cuif.pcmode = 2;       // npc = jump address 
			cuif.extType = 0;      // DON'T CARE about ext
			cuif.immorRt = 0;      // Rt
			cuif.memOp = 1;        // pc+4 output
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_SRL; // shift right logical
		end
		BEQ: begin
			cuif.RdOrRtOr31 = 0;   // Rd
			cuif.regWEN = 0;       // don't Write to reg file
			cuif.pcmode = 3;       // npc = branch mode 
			cuif.extType = 0;      // DON'T CARE about ext
			cuif.immorRt = 0;      // Rt
			cuif.memOp = 0;        // ALU output
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_SUB; // subtract to get the zero flag set or unset
		end
		BNE: begin
			cuif.RdOrRtOr31 = 0;   // Rd
			cuif.regWEN = 0;       // don't Write to reg file
			cuif.pcmode = 3;       // npc = branch mode 
			cuif.extType = 0;      // DON'T CARE about ext
			cuif.immorRt = 0;      // Rt
			cuif.memOp = 0;        // ALU output
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_SUB; // subtract to get the zero flag set or unset
		end
		ADDI: begin
			cuif.RdOrRtOr31 = 2;   // Rt
			cuif.regWEN = 1;       // Write to reg file
			cuif.pcmode = 0;       // npc = pc+4 
			cuif.extType = 0;      // sign extend
			cuif.immorRt = 1;      // immediate
			cuif.memOp = 0;        // ALU output
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_ADD; // add immediat
		end
		ADDIU: begin
			cuif.RdOrRtOr31 = 2;   // Rt
			cuif.regWEN = 1;       // Write to reg file
			cuif.pcmode = 0;       // npc = pc+4 
			cuif.extType = 0;      // sign extend
			cuif.immorRt = 1;      // immediate
			cuif.memOp = 0;        // ALU output
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_ADD; // add immediat
		end
		SLTI: begin
			cuif.RdOrRtOr31 = 2;   // Rt
			cuif.regWEN = 1;       // Write to reg file
			cuif.pcmode = 0;       // npc = pc+4 
			cuif.extType = 0;      // sign extend
			cuif.immorRt = 1;      // immediate
			cuif.memOp = 0;        // ALU output
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_SLT; // set less than immediat
		end
		SLTIU: begin
			cuif.RdOrRtOr31 = 2;   // Rt
			cuif.regWEN = 1;       // Write to reg file
			cuif.pcmode = 0;       // npc = pc+4 
			cuif.extType = 0;      // sign extend
			cuif.immorRt = 1;      // immediate
			cuif.memOp = 0;        // ALU output
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_SLTU; // set less than immediat
		end
		ANDI: begin
			cuif.RdOrRtOr31 = 2;   // Rt
			cuif.regWEN = 1;       // Write to reg file
			cuif.pcmode = 0;       // npc = pc+4 
			cuif.extType = 1;      // zero extend
			cuif.immorRt = 1;      // immediate
			cuif.memOp = 0;        // ALU output
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_AND; // and immediat
		end
		ORI: begin
			cuif.RdOrRtOr31 = 2;   // Rt
			cuif.regWEN = 1;       // Write to reg file
			cuif.pcmode = 0;       // npc = pc+4 
			cuif.extType = 1;      // zero extend
			cuif.immorRt = 1;      // immediate
			cuif.memOp = 0;        // ALU output
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_OR; // or immediat
		end
		XORI: begin
			cuif.RdOrRtOr31 = 2;   // Rt
			cuif.regWEN = 1;       // Write to reg file
			cuif.pcmode = 0;       // npc = pc+4 
			cuif.extType = 1;      // zero extend
			cuif.immorRt = 1;      // immediate
			cuif.memOp = 0;        // ALU output
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_XOR; // xor immediat
		end
		LUI: begin
			cuif.RdOrRtOr31 = 2;   // Rt
			cuif.regWEN = 1;       // Write to reg file
			cuif.pcmode = 0;       // npc = pc+4 
			cuif.extType = 1;      // zero extend
			cuif.immorRt = 1;      // immediate
			cuif.memOp = 2;        // immediat 16 appended with zeroes into reg file
			cuif.dREN = 0;         // not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_AND; // DON'T CARE
		end
		LW: begin
			cuif.RdOrRtOr31 = 2;   // Rt
			cuif.regWEN = 1;       // Write to reg file
			cuif.pcmode = 0;       // npc = pc+4 
			cuif.extType = 0;      // sign extend
			cuif.immorRt = 1;      // immediate
			cuif.memOp = 3;        // memmory input into reg file
			cuif.dREN = 1;         //  reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_ADD; // add immediat to get address of data
		end
		SW: begin
			cuif.RdOrRtOr31 = 2;   // Rt
			cuif.regWEN = 0;       // don't Write to reg file
			cuif.pcmode = 0;       // npc = pc+4 
			cuif.extType = 0;      // sign extend
			cuif.immorRt = 1;      // immediate
			cuif.memOp = 3;        // DONT CARE memmory input into reg file
			cuif.dREN = 0;         //  not reading from memmory
			cuif.dWEN = 1;         // writing to memmory
			cuif.alu_op = ALU_ADD; // add immediat to get address 
		end

//		LL: begin
//		end
//		SC: begin
//		end
		HALT: begin
			cuif.RdOrRtOr31 = 2;   // Rt
			cuif.regWEN = 0;       // don't Write to reg file
			cuif.pcmode = 0;       // npc = pc+4 
			cuif.extType = 0;      // sign extend
			cuif.immorRt = 1;      // immediate
			cuif.memOp = 3;        // DONT CARE memmory input into reg file
			cuif.dREN = 0;         //  not reading from memmory
			cuif.dWEN = 0;         // not writing to memmory
			cuif.alu_op = ALU_ADD; // add immediat to get address 

			cuif.iREN = 0;
			cuif.halt = 1;
		end
	endcase
end




endmodule