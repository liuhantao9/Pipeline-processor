onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /single_alu_testbench/a_in
add wave -noupdate /single_alu_testbench/b_in
add wave -noupdate /single_alu_testbench/carryin
add wave -noupdate /single_alu_testbench/control
add wave -noupdate /single_alu_testbench/carryout
add wave -noupdate /single_alu_testbench/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5079 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 341
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {894 ps} {6870 ps}
