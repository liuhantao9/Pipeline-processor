onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /SE_to_shifter_testbench/in_19
add wave -noupdate -radix decimal /SE_to_shifter_testbench/in_26
add wave -noupdate /SE_to_shifter_testbench/UncondBr
add wave -noupdate -radix decimal /SE_to_shifter_testbench/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {118 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 40
configure wave -valuecolwidth 429
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
WaveRestoreZoom {0 ps} {161 ps}
