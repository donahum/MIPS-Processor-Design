onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /control_unit_tb/CLK
add wave -noupdate /control_unit_tb/nRST
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/lui
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/jump
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/bne
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/beq
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/rf_write
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/alu_src
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/reg_dst
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/memtoreg
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/halt
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/jal
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/jr
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/lw
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/sw
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/alu_op
add wave -noupdate -expand -group {Control Unit} /control_unit_tb/cuif/imemload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {133 ns} 0}
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
WaveRestoreZoom {0 ns} {1 us}
