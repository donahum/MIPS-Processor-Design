onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hazard_unit_tb/CLK
add wave -noupdate /hazard_unit_tb/nRST
add wave -noupdate /hazard_unit_tb/PROG/#ublk#502948#48/testName
add wave -noupdate -expand -group Inputs -radix unsigned /hazard_unit_tb/huif/execute_write_reg
add wave -noupdate -expand -group Inputs -radix unsigned /hazard_unit_tb/huif/mem_write_reg
add wave -noupdate -expand -group Inputs -radix unsigned /hazard_unit_tb/huif/read_reg1
add wave -noupdate -expand -group Inputs -radix unsigned /hazard_unit_tb/huif/read_reg2
add wave -noupdate -expand -group Inputs /hazard_unit_tb/huif/execute_regWEN
add wave -noupdate -expand -group Inputs /hazard_unit_tb/huif/mem_regWEN
add wave -noupdate -expand -group Inputs /hazard_unit_tb/huif/branchorjump
add wave -noupdate -expand -group Inputs /hazard_unit_tb/huif/branchorjump_wb
add wave -noupdate -expand -group Outputs /hazard_unit_tb/huif/disable_fetch
add wave -noupdate -expand -group Outputs /hazard_unit_tb/huif/flush2
add wave -noupdate -expand -group Outputs /hazard_unit_tb/huif/flush3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 184
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
WaveRestoreZoom {0 ns} {89 ns}
