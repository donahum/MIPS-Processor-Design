onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/DUT/CPUCLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -expand -group instruction /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -expand -group instruction -radix unsigned /system_tb/DUT/CPU/DP/rs
add wave -noupdate -expand -group instruction -radix unsigned /system_tb/DUT/CPU/DP/rt
add wave -noupdate -expand -group instruction -radix unsigned -childformat {{{/system_tb/DUT/CPU/DP/rd[4]} -radix decimal} {{/system_tb/DUT/CPU/DP/rd[3]} -radix decimal} {{/system_tb/DUT/CPU/DP/rd[2]} -radix decimal} {{/system_tb/DUT/CPU/DP/rd[1]} -radix decimal} {{/system_tb/DUT/CPU/DP/rd[0]} -radix decimal}} -subitemconfig {{/system_tb/DUT/CPU/DP/rd[4]} {-height 17 -radix decimal} {/system_tb/DUT/CPU/DP/rd[3]} {-height 17 -radix decimal} {/system_tb/DUT/CPU/DP/rd[2]} {-height 17 -radix decimal} {/system_tb/DUT/CPU/DP/rd[1]} {-height 17 -radix decimal} {/system_tb/DUT/CPU/DP/rd[0]} {-height 17 -radix decimal}} /system_tb/DUT/CPU/DP/rd
add wave -noupdate -expand -group instruction /system_tb/DUT/CPU/DP/imm
add wave -noupdate -expand -group addressing /system_tb/DUT/CPU/DP/pc
add wave -noupdate -expand -group addressing /system_tb/DUT/CPU/DP/npc
add wave -noupdate -expand -group addressing /system_tb/DUT/CPU/DP/pc_select
add wave -noupdate -expand -group addressing /system_tb/DUT/CPU/DP/branch_address
add wave -noupdate -expand -group addressing /system_tb/DUT/CPU/DP/branchMUX
add wave -noupdate -expand -group addressing /system_tb/DUT/CPU/DP/branch
add wave -noupdate -expand -group addressing /system_tb/DUT/CPU/DP/beq_success
add wave -noupdate -expand -group addressing /system_tb/DUT/CPU/DP/bne_success
add wave -noupdate -expand -group addressing /system_tb/DUT/CPU/DP/jump_address
add wave -noupdate -expand -group addressing /system_tb/DUT/CPU/DP/jumpMUX
add wave -noupdate /system_tb/DUT/CPU/DP/ext_imm
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -expand -group dpif /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/lui
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/jump
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/bne
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/beq
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/rf_write
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/alu_src
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/reg_dst
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/memtoreg
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/jal
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/jr
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/lw
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/sw
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/alu_op
add wave -noupdate -group {control unit} /system_tb/DUT/CPU/DP/cuif/imemload
add wave -noupdate -group {reg file} /system_tb/DUT/CPU/DP/regif/WEN
add wave -noupdate -group {reg file} /system_tb/DUT/CPU/DP/RF/regs
add wave -noupdate -group {reg file} -radix unsigned /system_tb/DUT/CPU/DP/regif/wsel
add wave -noupdate -group {reg file} -radix unsigned /system_tb/DUT/CPU/DP/regif/rsel1
add wave -noupdate -group {reg file} -radix unsigned /system_tb/DUT/CPU/DP/regif/rsel2
add wave -noupdate -group {reg file} /system_tb/DUT/CPU/DP/memtoregMUX
add wave -noupdate -group {reg file} /system_tb/DUT/CPU/DP/regif/wdat
add wave -noupdate -group {reg file} /system_tb/DUT/CPU/DP/regif/rdat1
add wave -noupdate -group {reg file} /system_tb/DUT/CPU/DP/regif/rdat2
add wave -noupdate -expand -group alu /system_tb/DUT/CPU/DP/aluif/zero
add wave -noupdate -expand -group alu /system_tb/DUT/CPU/DP/aluif/overflow
add wave -noupdate -expand -group alu /system_tb/DUT/CPU/DP/aluif/negative
add wave -noupdate -expand -group alu /system_tb/DUT/CPU/DP/aluif/aluop
add wave -noupdate -expand -group alu /system_tb/DUT/CPU/DP/aluif/port_a
add wave -noupdate -expand -group alu /system_tb/DUT/CPU/DP/luiMUX
add wave -noupdate -expand -group alu /system_tb/DUT/CPU/DP/aluif/port_b
add wave -noupdate -expand -group alu /system_tb/DUT/CPU/DP/aluif/output_port
add wave -noupdate -expand -group {request unit} /system_tb/DUT/CPU/DP/reqif/ihit
add wave -noupdate -expand -group {request unit} /system_tb/DUT/CPU/DP/reqif/imemREN
add wave -noupdate -expand -group {request unit} /system_tb/DUT/CPU/DP/reqif/dhit
add wave -noupdate -expand -group {request unit} /system_tb/DUT/CPU/DP/reqif/dmemREN
add wave -noupdate -expand -group {request unit} /system_tb/DUT/CPU/DP/reqif/dmemWEN
add wave -noupdate -expand -group {request unit} /system_tb/DUT/CPU/DP/reqif/memWrRq
add wave -noupdate -expand -group {request unit} /system_tb/DUT/CPU/DP/reqif/memRdRq
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/iwait
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/dwait
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/iREN
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/dREN
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/dWEN
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/iload
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/dload
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/dstore
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/iaddr
add wave -noupdate -expand -group {memory control} -expand /system_tb/DUT/CPU/CC/ccif/daddr
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/ramWEN
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/ramREN
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/ramstate
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/ramaddr
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/ramstore
add wave -noupdate -expand -group {memory control} /system_tb/DUT/CPU/CC/ccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {93951 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {504 ns}
