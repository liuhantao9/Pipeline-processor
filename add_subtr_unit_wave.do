onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /add_subtr_unit_testbench/a_in
add wave -noupdate /add_subtr_unit_testbench/b_in
add wave -noupdate /add_subtr_unit_testbench/carryin
add wave -noupdate /add_subtr_unit_testbench/carryout
add wave -noupdate /add_subtr_unit_testbench/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {72 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 167
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
WaveRestoreZoom {0 ps} {123 ps}
