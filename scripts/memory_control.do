onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /memory_control_tb/CLK
add wave -noupdate /memory_control_tb/nRST
add wave -noupdate -expand -group rif /memory_control_tb/rif/ramREN
add wave -noupdate -expand -group rif /memory_control_tb/rif/ramWEN
add wave -noupdate -expand -group rif /memory_control_tb/rif/ramaddr
add wave -noupdate -expand -group rif /memory_control_tb/rif/ramstore
add wave -noupdate -expand -group rif /memory_control_tb/rif/ramload
add wave -noupdate -expand -group rif /memory_control_tb/rif/ramstate
add wave -noupdate -expand -group rif /memory_control_tb/rif/memREN
add wave -noupdate -expand -group rif /memory_control_tb/rif/memWEN
add wave -noupdate -expand -group rif /memory_control_tb/rif/memaddr
add wave -noupdate -expand -group rif /memory_control_tb/rif/memstore
add wave -noupdate -expand -group cif /memory_control_tb/cif0/iwait
add wave -noupdate -expand -group cif /memory_control_tb/cif0/dwait
add wave -noupdate -expand -group cif /memory_control_tb/cif0/iREN
add wave -noupdate -expand -group cif /memory_control_tb/cif0/dREN
add wave -noupdate -expand -group cif /memory_control_tb/cif0/dWEN
add wave -noupdate -expand -group cif /memory_control_tb/cif0/iload
add wave -noupdate -expand -group cif /memory_control_tb/cif0/dload
add wave -noupdate -expand -group cif /memory_control_tb/cif0/dstore
add wave -noupdate -expand -group cif /memory_control_tb/cif0/iaddr
add wave -noupdate -expand -group cif /memory_control_tb/cif0/daddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {411612 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 161
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
WaveRestoreZoom {0 ps} {950 ns}
