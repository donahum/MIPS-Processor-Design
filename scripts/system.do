onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -expand -group fetch/decode /system_tb/DUT/CPU/DP/ifidif/instruction
add wave -noupdate -expand -group fetch/decode /system_tb/DUT/CPU/DP/ifidif/pc_src
add wave -noupdate -expand -group fetch/decode /system_tb/DUT/CPU/DP/ifidif/pc_pass
add wave -noupdate -expand -group fetch/decode /system_tb/DUT/CPU/DP/ifidif/opcode
add wave -noupdate -expand -group fetch/decode /system_tb/DUT/CPU/DP/ifidif/rs
add wave -noupdate -expand -group fetch/decode /system_tb/DUT/CPU/DP/ifidif/rt
add wave -noupdate -expand -group fetch/decode /system_tb/DUT/CPU/DP/ifidif/rd
add wave -noupdate -expand -group fetch/decode /system_tb/DUT/CPU/DP/ifidif/funct
add wave -noupdate -expand -group fetch/decode /system_tb/DUT/CPU/DP/ifidif/imm
add wave -noupdate -expand -group fetch/decode /system_tb/DUT/CPU/DP/ifidif/jaddress
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/RdOrRtOr31_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/regWEN_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/extType_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/immorRt_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/pcmode_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/memOp_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/iREN_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/dREN_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/dWEN_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/halt_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/op_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/funct_op_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/alu_op_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/rs_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/rt_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/rd_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/rdat1_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/rdat2_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/pc_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/imm_out
add wave -noupdate -group decode/execute /system_tb/DUT/CPU/DP/idexif/jaddr_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/RdOrRtOr31_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/regWEN_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/extType_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/immorRt_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/pcmode_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/memOp_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/iREN_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/dREN_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/dWEN_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/halt_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/op_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/funct_op_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/alu_op_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/rs_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/rt_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/rd_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/rdat1_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/rdat2_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/pc_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/imm_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/jaddr_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/aluresult_out
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/EM/exmemif/zero_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/RdOrRtOr31_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/regWEN_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/extType_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/immorRt_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/pcmode_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/memOp_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/iREN_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/dREN_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/dWEN_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/halt_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/op_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/funct_op_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/alu_op_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/rs_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/rt_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/rd_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/rdat1_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/rdat2_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/pc_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/imm_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/jaddr_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/aluresult_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/zero_out
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/MW/memwbif/dload_out
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/RF/rfif/WEN
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/RF/rfif/wsel
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/RF/rfif/rsel1
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/RF/rfif/rsel2
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/RF/rfif/wdat
add wave -noupdate -group rfif -expand /system_tb/DUT/CPU/DP/RF/regfile
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/RF/rfif/rdat1
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/RF/rfif/rdat2
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/RdOrRtOr31
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/regWEN
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/extType
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/immorRt
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/pcmode
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/memOp
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/iREN
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/dREN
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/dWEN
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/op
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/funct_op
add wave -noupdate -group {control unit if} /system_tb/DUT/CPU/DP/cuif/alu_op
add wave -noupdate -expand -group {cache if} /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -expand -group {cache if} /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -expand -group {cache if} /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -expand -group {cache if} /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -expand -group {cache if} /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -expand -group {cache if} /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -expand -group {cache if} /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -expand -group {cache if} /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -expand -group {cache if} /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -expand -group {cache if} /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -expand -group {cache if} /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -expand -group {Hazard unit} /system_tb/DUT/CPU/DP/huif/execute_write_reg
add wave -noupdate -expand -group {Hazard unit} /system_tb/DUT/CPU/DP/huif/mem_write_reg
add wave -noupdate -expand -group {Hazard unit} /system_tb/DUT/CPU/DP/huif/read_reg1
add wave -noupdate -expand -group {Hazard unit} /system_tb/DUT/CPU/DP/huif/read_reg2
add wave -noupdate -expand -group {Hazard unit} /system_tb/DUT/CPU/DP/huif/execute_regWEN
add wave -noupdate -expand -group {Hazard unit} /system_tb/DUT/CPU/DP/huif/mem_regWEN
add wave -noupdate -expand -group {Hazard unit} /system_tb/DUT/CPU/DP/huif/branchorjump
add wave -noupdate -expand -group {Hazard unit} /system_tb/DUT/CPU/DP/huif/disable_fetch
add wave -noupdate -expand -group {Hazard unit} /system_tb/DUT/CPU/DP/huif/flush2
add wave -noupdate -expand -group {Hazard unit} /system_tb/DUT/CPU/DP/huif/flush3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {39733 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 214
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {794653 ps}
