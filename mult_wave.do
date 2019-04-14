onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /mult_testbench/A
add wave -noupdate -radix unsigned /mult_testbench/B
add wave -noupdate /mult_testbench/doSigned
add wave -noupdate -radix unsigned /mult_testbench/mult_low
add wave -noupdate -radix unsigned /mult_testbench/mult_high
add wave -noupdate -radix unsigned /mult_testbench/fullVal
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {96 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 214
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
WaveRestoreZoom {28 ps} {104 ps}
