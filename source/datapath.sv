/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"
`include "alu_if.vh"
`include "register_file_if.vh"

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
  
  register_file_if rfif();
  alu_if auif();
  control_unit_if cuif();

  register_file     RF(CLK,nRST,rfif); 
  alu               ALU(auif);
  control_unit      CU(cuif);

// instruction cover for convenience
assign jinstr = dpif.imemload;
assign iinstr = dpif.imemload;
assign rinstr = dpif.imemload;



///assign outputs
//assign dpif.imemREN = cuif.iREN;
assign dpif.imemaddr = pc;
assign dpif.dmemstore = rfif.rdat1;
assign dpif.dmemaddr = auif.portOut;

//assign control unit inputs
assign cuif.op = rinstr.opcode;
assign cuif.funct_op = rinstr.funct;


// Request unit
always_ff @(posedge CLK or negedge nRST) begin
	if (nRST==0) begin
		dpif.dmemREN <=0;
		dpif.dmemWEN <=0;
	end else begin
		if (dpif.dhit==1) begin
			dpif.dmemREN <=0;
			dpif.dmemWEN <=0;
		end else if (dpif.ihit ==0) begin
			dpif.dmemREN <=dpif.dmemREN;
			dpif.dmemWEN <=dpif.dmemWEN;
		end else begin   			// get from control unit dREN and dWEN
			dpif.dmemREN <=cuif.dREN;
			dpif.dmemWEN <=cuif.dWEN;
		end
	end
end

always_ff @(posedge CLK or negedge nRST)  begin
	if (nRST==0) begin
		dpif.imemREN <= 1;
	end else begin
		dpif.imemREN <= cuif.iREN;
	end
end



//  Halt latched
always_ff @(posedge CLK or negedge nRST)  begin
	if (nRST==0) begin
		dpif.halt <= 0;
	end else if (cuif.halt) begin
		dpif.halt <= cuif.halt;
	end else begin
		dpif.halt <= dpif.halt;
	end
end





//  PC Register
always_ff @(posedge CLK or negedge nRST)  begin
	if (nRST==0) begin
		pc <= PC_INIT;
	end else if (dpif.ihit && !dpif.halt) begin
		pc <= npc;
	end else begin
		pc <= pc;
	end
end

//  PC mux (decide what npc is based on control unit input)
always_comb begin
	if(cuif.pcmode == 1) begin // pcmode== jr
		npc = pcjr;
	end else if ( (cuif.pcmode == 3) && (auif.zero && rinstr.opcode==BEQ || !auif.zero && rinstr.opcode==BNE)  ) begin // pcmode== branch
		npc = pcb;
	end else if (cuif.pcmode == 2) begin // pcmode== jump or jal
		npc = pcj;
	end else begin //pcmode== +4
		npc = pc4;
	end
end

// PC +4 adder, branch adder, and jump shifter/concatinater
always_comb begin
	pc4 = pc+4;
	if (iinstr.imm[15]==0) pcb = pc4+{ {14{1'b0}}, iinstr.imm, 2'b00}; else pcb = pc4+{ {14{1'b1}}, iinstr.imm, 2'b00};
	pcj = {pc[31:28],jinstr.addr,2'b00};
end
// assign the jr input pc to rs(output rb of reg file)
assign pcjr = rfif.rdat2;


// assign register select for reg file to rs and rt
assign rfif.rsel1 = rinstr.rt;
assign rfif.rsel2 = rinstr.rs;


// assign register write select based on control unit input
always_comb begin
	if (cuif.RdOrRtOr31==2) begin // Rt
		rfif.wsel = rinstr.rt;
	end else if (cuif.RdOrRtOr31==0) begin //Rd
		rfif.wsel = rinstr.rd;
	end else begin // 31 for jal
		rfif.wsel = 31;
	end
end

// assign write data into the register file based on control unit input
always_comb begin
	if(cuif.memOp==0) begin // alu_output
		rfif.wdat = auif.portOut;
	end else if(cuif.memOp==1) begin // pc+4
		rfif.wdat = pc4;
	end else if(cuif.memOp==2) begin // imm16 appended with zeroes
		rfif.wdat = {iinstr.imm,16'd0};
	end else begin // data in from memmory
		rfif.wdat = dpif.dmemload;
	end
end

// assign register file WEN from control unit
assign rfif.WEN=cuif.regWEN && (rinstr.opcode!=LW && dpif.ihit || dpif.dmemREN==1);

// genereate extended immediate 16 based on control unit input
always_comb begin
	if (cuif.extType==0) begin // sign extension
		if(iinstr.imm[15]==1) eximm={{16{1'b1}},iinstr.imm}; else eximm={{16{1'b0}},iinstr.imm};
	end else begin // zero extension
		eximm={{16{1'b0}},iinstr.imm};
	end
end


// assign first alu input to rs(second reg file output)
assign auif.portA = rfif.rdat2;


// decide what to pass to second alu input
always_comb begin
	if (cuif.immorRt==0) begin // rt
		auif.portB = rfif.rdat1;
	end else begin //extended imm
		auif.portB = eximm;
	end
end

//decide what to use for aluop
assign auif.aluop = cuif.alu_op;




endmodule
