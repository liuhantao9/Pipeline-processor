onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /PC_intromem_system_testbench/clk
add wave -noupdate /PC_intromem_system_testbench/in_19
add wave -noupdate /PC_intromem_system_testbench/in_26
add wave -noupdate /PC_intromem_system_testbench/UncondBr
add wave -noupdate /PC_intromem_system_testbench/BrTaken
add wave -noupdate /PC_intromem_system_testbench/instruction
add wave -noupdate /PC_intromem_system_testbench/dut/to_instructmem/address
add wave -noupdate /PC_intromem_system_testbench/dut/to_instructmem/instruction
add wave -noupdate /PC_intromem_system_testbench/dut/to_instructmem/clk
add wave -noupdate /PC_intromem_system_testbench/dut/to_instructmem/i
add wave -noupdate -radix decimal /PC_intromem_system_testbench/dut/program_counter/pc_out
add wave -noupdate -radix decimal /PC_intromem_system_testbench/dut/program_counter/pc_in
add wave -noupdate /PC_intromem_system_testbench/dut/program_counter/clk
add wave -noupdate /PC_intromem_system_testbench/dut/program_counter/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49675181 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 424
configure wave -valuecolwidth 184
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
WaveRestoreZoom {0 ps} {78546226 ps}
