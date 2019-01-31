// data path interface
`include "datapath_cache_if.vh"
`include "control_unit_if.vh"
`include "register_file_if.vh"
`include "request_unit_if.vh"
`include "alu_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module datapath (
	input logic CLK, nRST,
	datapath_cache_if.dp dpif
		//input   ihit, imemload, dhit, dmemload,
    	//output  halt, imemREN, imemaddr, dmemREN, dmemWEN, datomic,
    	//       dmemstore, dmemaddr
);
	// import types
	import cpu_types_pkg::*;

	// pc init
	parameter PC_INIT = 0;

	//pc select signals
	word_t pc, npc, npc_latched, pc_select;

	//branch signals
	word_t branch_address;
	logic branch, beq_success, bne_success;
	word_t jump_address;
	//instruction breakdown
	regbits_t rs, rt, rd;
	logic [15:0] imm;
	//MUX signals
	word_t memtoregMUX, luiMUX, jumpMUX, branchMUX;
	word_t ext_imm;

	//control unit routing
	control_unit_if cuif();
	control_unit CU (CLK, nRST, cuif);
	assign cuif.imemload = dpif.imemload;

	//register file routing
	register_file_if regif();
	register_file RF (CLK, nRST, regif);
	alu_if aluif();
	alu ALU (aluif);
	//assign regif.WEN = cuif.rf_write && (dpif.dhit || dpif.ihit);
	assign regif.rsel1 = rs;
	assign regif.rsel2 = rt;
	//memtoreg parameters
		//parameter ALU_TO_REG = 0;
		//parameter MEM_TO_REG = 1;
	assign memtoregMUX = cuif.memtoreg ? dpif.dmemload : aluif.output_port;
	assign regif.wdat = cuif.jal ? npc_latched : memtoregMUX;
	
	//alu routing
	
	assign aluif.aluop = cuif.alu_op;
	assign aluif.port_a = regif.rdat1;
	//assign ext_imm = imm [15] ? {16'hFFFF, imm [15:0]} : {16'h0000, imm [15:0]};
	assign luiMUX = cuif.lui ? {imm, 16'b0} : ext_imm;
	//alu_src parameters
		//parameter FROM_IMM = 0;
		//parameter FROM_RF = 1;
	assign aluif.port_b = cuif.alu_src ? regif.rdat2 : luiMUX;

	//request unit routing
	request_unit_if reqif();
	request_unit RU (CLK, nRST, reqif);
	assign reqif.dhit = dpif.dhit;
	assign reqif.ihit = dpif.ihit;
	assign reqif.memWrRq = cuif.sw;
	assign reqif.memRdRq = cuif.lw;

	//datapath to cache routing
	assign dpif.imemREN = reqif.imemREN;
	assign dpif.dmemREN = reqif.dmemREN;
	assign dpif.dmemWEN = reqif.dmemWEN;
	assign dpif.halt = cuif.halt;
	assign dpif.imemaddr = pc;
	assign dpif.dmemstore = regif.rdat2;
	assign dpif.dmemaddr = aluif.output_port;

	//instruction dataflow
	assign rs = dpif.imemload [25:21];
	assign rt = dpif.imemload [20:16];
	assign rd = dpif.imemload [15:11];
	assign imm = dpif.imemload [15:0];
	//shamt, funct

	//pc dataflow
	assign npc = pc + 4;
	assign branch_address = npc + (imm << 2);
	assign beq_success = cuif.beq && aluif.zero;
	assign bne_success = cuif.bne && ~aluif.zero;
	assign branch = beq_success || bne_success;
	assign branchMUX = branch ? branch_address : npc;
	assign jump_address = {npc [31:28], dpif.imemload [25:0], 2'b00};
	assign jumpMUX = cuif.jump ? jump_address : branchMUX;
	assign pc_select = cuif.jr ? regif.rdat1 : jumpMUX;

	always_ff @(posedge CLK, negedge nRST) begin
		if(~nRST) begin 
			pc <= '0;
			npc_latched <= '0;
		end else if(/*~dpif.dhit &&*/ dpif.ihit) begin
			pc <= pc_select;
			npc_latched <= npc;
		end
	end

	always_comb begin
		if(cuif.jal) begin
			regif.wsel = 'h1F;
		//reg_dst parameters
			//parameter IS_RTYPE = 0;
			//parameter IS_ITYPE = 1;
		end else if(cuif.reg_dst) begin
			regif.wsel = rt;
		end else begin
			regif.wsel = rd;
		end

		if(cuif.rf_write) begin
			if(cuif.lw) begin
				if(dpif.dhit) begin
					regif.WEN = 1;
				end else begin
					regif.WEN = 0;
				end
			end else begin
				regif.WEN = 1;
			end
		end else begin
			regif.WEN = 0;
		end

		if(cuif.sign_extend) begin
			ext_imm = imm [15] ? {16'hFFFF, imm [15:0]} : {16'h0000, imm [15:0]};
		end else begin
			ext_imm = {16'h0000, imm [15:0]};
		end
	end

endmodule
