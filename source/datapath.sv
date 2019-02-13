/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"
//alu, hazard unit and reg file if
`include "alu_if.vh"
`include "register_file_if.vh"
`include "hazard_unit_if.vh"
//latches if
`include "ifid_if.vh"
`include "idex_if.vh"
`include "exmem_if.vh"
`include "memwb_if.vh"
// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);
  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;

  word_t pc,pc4,pcb,pcj,pcjr,npc;
  j_t jinstr;
  i_t iinstr;
  r_t rinstr;
  word_t eximm;
  logic disable_fetch,flush2,flush3,flush4;
  
  register_file_if rfif();
  alu_if auif();
  control_unit_if cuif();
  ifid_if ifidif();
  idex_if idexif();
  exmem_if exmemif();
  memwb_if memwbif();
  hazard_unit_if huif();




  register_file     RF(CLK,nRST,rfif); 
  alu               ALU(auif);
  control_unit      CU(cuif);
  ifid FD (CLK, nRST, dpif.ihit, disable_fetch , ifidif);
  idex DE (.CLK(CLK), .nRST(nRST), .ihit(dpif.ihit) , .flush2(flush2) , .idexif(idexif) );
  exmem EM (CLK, nRST, dpif.ihit, flush3 , dpif.dhit , exmemif);
  memwb MW (CLK, nRST, dpif.ihit  , memwbif);
  hazard_unit HU(huif);

// instruction cover for convenience
assign jinstr = dpif.imemload;
assign iinstr = dpif.imemload;
assign rinstr = dpif.imemload;

// fetch/decode latch inputs
assign ifidif.instruction = dpif.imemload;
assign ifidif.pc_src = npc; 

// decode/execute latch inputs 
assign idexif.op_in  = ifidif.opcode; // just passing it on not using it
assign idexif.funct_op_in  = ifidif.funct; // just passing it on not using it
assign idexif.RdOrRtOr31_in  = cuif.RdOrRtOr31;
assign idexif.regWEN_in  = cuif.regWEN;
assign idexif.pcmode_in  = cuif.pcmode;
assign idexif.extType_in  = cuif.extType;
assign idexif.immorRt_in  = cuif.immorRt;
assign idexif.memOp_in  = cuif.memOp;
assign idexif.iREN_in  = cuif.iREN;
assign idexif.dREN_in  = cuif.dREN;
assign idexif.dWEN_in  = cuif.dWEN;
assign idexif.alu_op_in  = cuif.alu_op;
assign idexif.halt_in  = cuif.halt;
assign idexif.rs_in  = ifidif.rs;
assign idexif.rt_in  = ifidif.rt;
assign idexif.rd_in  = ifidif.rd;
assign idexif.rdat1_in  = rfif.rdat1;
assign idexif.rdat2_in  = rfif.rdat2;
assign idexif.pc_in  = ifidif.pc_pass;
assign idexif.imm_in  = ifidif.imm;
assign idexif.jaddr_in  = ifidif.jaddress;

// execute/mem latch inputs
assign exmemif.op_in  = idexif.op_out; 
assign exmemif.funct_op_in  = idexif.funct_op_out; 
assign exmemif.RdOrRtOr31_in  = idexif.RdOrRtOr31_out;
assign exmemif.regWEN_in  = idexif.regWEN_out;
assign exmemif.pcmode_in  = idexif.pcmode_out;
assign exmemif.extType_in  = idexif.extType_out;
assign exmemif.immorRt_in  = idexif.immorRt_out;
assign exmemif.memOp_in  = idexif.memOp_out;
assign exmemif.iREN_in  = idexif.iREN_out;
assign exmemif.dREN_in  = idexif.dREN_out;
assign exmemif.dWEN_in  = idexif.dWEN_out;
assign exmemif.alu_op_in  = idexif.alu_op_out;
assign exmemif.halt_in  = idexif.halt_out;
assign exmemif.rs_in  = idexif.rs_out;
assign exmemif.rt_in  = idexif.rt_out;
assign exmemif.rd_in  = idexif.rd_out;
assign exmemif.rdat1_in  = idexif.rdat1_out;
assign exmemif.rdat2_in  = idexif.rdat2_out;
assign exmemif.pc_in  = idexif.pc_out;
assign exmemif.imm_in  = idexif.imm_out;
assign exmemif.jaddr_in  = idexif.jaddr_out;
assign exmemif.aluresult_in = auif.portOut;
assign exmemif.zero_in = auif.zero;
assign exmemif.dload_in = dpif.dmemload;

// mem/wb latch inputs
assign memwbif.op_in  = exmemif.op_out; 
assign memwbif.funct_op_in  = exmemif.funct_op_out; 
assign memwbif.RdOrRtOr31_in  = exmemif.RdOrRtOr31_out;
assign memwbif.regWEN_in  = exmemif.regWEN_out;
assign memwbif.pcmode_in  = exmemif.pcmode_out;
assign memwbif.extType_in  = exmemif.extType_out;
assign memwbif.immorRt_in  = exmemif.immorRt_out;
assign memwbif.memOp_in  = exmemif.memOp_out;
assign memwbif.iREN_in  = exmemif.iREN_out;
assign memwbif.dREN_in  = exmemif.dREN_out;
assign memwbif.dWEN_in  = exmemif.dWEN_out;
assign memwbif.alu_op_in  = exmemif.alu_op_out;
assign memwbif.halt_in  = exmemif.halt_out;
assign memwbif.rs_in  = exmemif.rs_out;
assign memwbif.rt_in  = exmemif.rt_out;
assign memwbif.rd_in  = exmemif.rd_out;
assign memwbif.rdat1_in  = exmemif.rdat1_out;
assign memwbif.rdat2_in  = exmemif.rdat2_out;
assign memwbif.pc_in  = exmemif.pc_out;
assign memwbif.imm_in  = exmemif.imm_out;
assign memwbif.jaddr_in  = exmemif.jaddr_out;
assign memwbif.aluresult_in = exmemif.aluresult_out;
assign memwbif.zero_in = exmemif.zero_out;
assign memwbif.dload_in = exmemif.dload_out;

assign memwbif.branchorjump_in = huif.branchorjump;

///assign (datapath)outputs
assign dpif.imemREN = memwbif.iREN_out;
assign dpif.dmemREN = exmemif.dREN_out;
assign dpif.dmemWEN = exmemif.dWEN_out;
assign dpif.imemaddr = pc;
assign dpif.dmemstore = exmemif.rdat1_out;
assign dpif.dmemaddr = exmemif.aluresult_out;
assign dpif.halt = memwbif.halt_out;

//assign control unit inputs
assign cuif.op = ifidif.opcode;
assign cuif.funct_op = ifidif.funct;

//assign hazard unit inputs ahd outputs
assign huif.execute_regWEN = idexif.regWEN_out;
assign huif.mem_regWEN = exmemif.regWEN_out;
assign huif.read_reg1 = ifidif.rt;
assign huif.read_reg2 = ifidif.rs;
assign huif.branchorjump_wb = memwbif.branchorjump_out;

always_comb begin
		// find execute write register
	if (idexif.RdOrRtOr31_out==2) begin // Rt
		huif.execute_write_reg = idexif.rt_out;
	end else if (idexif.RdOrRtOr31_out==0) begin //Rd
		huif.execute_write_reg = idexif.rd_out;
	end else begin // 31 for jal
		huif.execute_write_reg = 31;
	end
		// find mem write register
	if (exmemif.RdOrRtOr31_out==2) begin // Rt
		huif.mem_write_reg = exmemif.rt_out;
	end else if (exmemif.RdOrRtOr31_out==0) begin //Rd
		huif.mem_write_reg = exmemif.rd_out;
	end else begin // 31 for jal
		huif.mem_write_reg = 31;
	end
end

assign disable_fetch = huif.disable_fetch;
assign flush2 = huif.flush2;
assign flush3 = huif.flush3;


// Request unit
//always_ff @(posedge CLK or negedge nRST) begin
//	if (nRST==0) begin
//		dpif.dmemREN <=0;
//		dpif.dmemWEN <=0;
//	end else begin
//		if (dpif.dhit==1) begin
//			dpif.dmemREN <=0;
//			dpif.dmemWEN <=0;
//		end else if (dpif.ihit ==0) begin
//			dpif.dmemREN <=dpif.dmemREN;
//			dpif.dmemWEN <=dpif.dmemWEN;
//		end else begin   			// get from control unit dREN and dWEN
//			dpif.dmemREN <=cuif.dREN;
//			dpif.dmemWEN <=cuif.dWEN;
//		end
//	end
//end
//
//
//always_ff @(posedge CLK or negedge nRST)  begin
//	if (nRST==0) begin
//		dpif.imemREN <= 1;
//	end else begin
//		dpif.imemREN <= cuif.iREN;
//	end
//end
//


//  Halt latched
//always_ff @(posedge CLK or negedge nRST)  begin
//	if (nRST==0) begin
//		dpif.halt <= 0;
//	end else if (cuif.halt) begin
//		dpif.halt <= cuif.halt;
//	end else begin
//		dpif.halt <= dpif.halt;
//	end
//end
//





//  PC Register
always_ff @(posedge CLK or negedge nRST)  begin
	if (nRST==0) begin
		pc <= PC_INIT;
	end else if (dpif.ihit && !memwbif.halt_out && !disable_fetch) begin
		pc <= npc;
	end else begin
		pc <= pc;
	end
end

//  PC mux (decide what npc is based on control unit input)
always_comb begin
	huif.branchorjump=1;
	if(exmemif.pcmode_out == 1) begin // pcmode== jr
		npc = pcjr;
	end else if ( (exmemif.pcmode_out == 3) && (exmemif.zero_out && exmemif.op_out==BEQ || !exmemif.zero_out && exmemif.op_out==BNE)  ) begin // pcmode== branch
		npc = pcb;
	end else if (exmemif.pcmode_out == 2) begin // pcmode== jump or jal
		npc = pcj;
	end else begin //pcmode== +4
		npc = pc4;
		huif.branchorjump = 0;
	end
end

// PC +4 adder, branch adder, and jump shifter/concatinater
always_comb begin
	pc4 = pc+4;
	if (exmemif.imm_out[15]==0) pcb = exmemif.pc_out+{ {14{1'b0}}, exmemif.imm_out, 2'b00}; else pcb = exmemif.pc_out+{ {14{1'b1}}, exmemif.imm_out, 2'b00};
	pcj = {exmemif.pc_out[31:28],exmemif.jaddr_out,2'b00};
end
// assign the jr input pc to rs(output rb of reg file)
assign pcjr = exmemif.rdat2_out;


// assign register select for reg file to rs and rt
assign rfif.rsel1 = ifidif.rt;
assign rfif.rsel2 = ifidif.rs;


// assign register write select based on control unit input
always_comb begin
	if (memwbif.RdOrRtOr31_out==2) begin // Rt
		rfif.wsel = memwbif.rt_out;
	end else if (memwbif.RdOrRtOr31_out==0) begin //Rd
		rfif.wsel = memwbif.rd_out;
	end else begin // 31 for jal
		rfif.wsel = 31;
	end
end

// assign write data into the register file based on control unit input
always_comb begin
	if(memwbif.memOp_out==0) begin // alu_output
		rfif.wdat = memwbif.aluresult_out;
	end else if(memwbif.memOp_out==1) begin // pc+4
		rfif.wdat = memwbif.pc_out;
	end else if(memwbif.memOp_out==2) begin // imm16 appended with zeroes
		rfif.wdat = {memwbif.imm_out,16'd0};
	end else begin // data in from memmory
		rfif.wdat = memwbif.dload_out;
	end
end

// assign register file WEN from control unit
assign rfif.WEN=memwbif.regWEN_out ; // && (rinstr.opcode!=LW && dpif.ihit || dpif.dmemREN==1);

// genereate extended immediate 16 based on control unit input
always_comb begin
	if (idexif.extType_out==0) begin // sign extension
		if(idexif.imm_out[15]==1) eximm={{16{1'b1}},idexif.imm_out}; else eximm={{16{1'b0}},idexif.imm_out};
	end else begin // zero extension
		eximm={{16{1'b0}},idexif.imm_out};
	end
end


// assign first alu input to rs(second reg file output)
assign auif.portA = idexif.rdat2_out;


// decide what to pass to second alu input
always_comb begin
	if (idexif.immorRt_out==0) begin // rt
		auif.portB = idexif.rdat1_out;
	end else begin //extended imm
		auif.portB = eximm;
	end
end

//decide what to use for aluop
assign auif.aluop = idexif.alu_op_out;




endmodule
