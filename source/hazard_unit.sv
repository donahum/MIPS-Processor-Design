
// interface include
`include "hazard_unit_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module hazard_unit (
  hazard_unit_if.hu huif
);
  // type import
  import cpu_types_pkg::*;


always_comb begin
	if (huif.branchorjump || huif.branchorjump_wb) begin
		huif.flush2=1;
		huif.flush3=1;
		huif.disable_fetch=0;
	end else if (   ( (huif.execute_write_reg == huif.read_reg1 || huif.execute_write_reg == huif.read_reg2) && huif.execute_regWEN && (huif.execute_write_reg !=0) ) || ((huif.mem_write_reg == huif.read_reg1 || huif.mem_write_reg == huif.read_reg2) && huif.mem_regWEN && (huif.mem_write_reg !=0))  ) begin
		huif.flush2=1;
		huif.flush3=0;
		huif.disable_fetch=1;
	end else begin
		huif.flush2=0;
		huif.flush3=0;
		huif.disable_fetch=0;
	end
end




endmodule