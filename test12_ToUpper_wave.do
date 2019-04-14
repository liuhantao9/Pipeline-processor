onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /processor_testbench/clk
add wave -noupdate -radix unsigned /processor_testbench/dut/instr_sources/pc_in
add wave -noupdate -radix unsigned /processor_testbench/dut/instr_sources/pc_out
add wave -noupdate /processor_testbench/dut/instruction
add wave -noupdate -radix unsigned /processor_testbench/ReadRegister1
add wave -noupdate -radix decimal /processor_testbench/ReadData1
add wave -noupdate -radix unsigned /processor_testbench/ReadRegister2
add wave -noupdate -radix decimal /processor_testbench/ReadData2
add wave -noupdate /processor_testbench/dut/registers/RegWrite
add wave -noupdate -radix unsigned /processor_testbench/WriteRegister
add wave -noupdate -radix decimal /processor_testbench/WriteData
add wave -noupdate /processor_testbench/MemWrite
add wave -noupdate /processor_testbench/dut/memory/write_enable
add wave -noupdate -radix unsigned /processor_testbench/dut/memory/address
add wave -noupdate -radix decimal /processor_testbench/dut/memory/write_data
add wave -noupdate -radix decimal /processor_testbench/dut/memory/read_data
add wave -noupdate /processor_testbench/dut/instr_sources/branch_control/stored_negative
add wave -noupdate /processor_testbench/dut/instr_sources/branch_control/stored_carry_out
add wave -noupdate /processor_testbench/dut/instr_sources/branch_control/stored_overflow
add wave -noupdate /processor_testbench/dut/instr_sources/branch_control/stored_zero
add wave -noupdate -radix binary -childformat {{{/processor_testbench/register_to_multiplexor[31]} -radix decimal} {{/processor_testbench/register_to_multiplexor[30]} -radix binary} {{/processor_testbench/register_to_multiplexor[29]} -radix binary} {{/processor_testbench/register_to_multiplexor[28]} -radix binary} {{/processor_testbench/register_to_multiplexor[27]} -radix binary} {{/processor_testbench/register_to_multiplexor[26]} -radix binary} {{/processor_testbench/register_to_multiplexor[25]} -radix binary} {{/processor_testbench/register_to_multiplexor[24]} -radix binary} {{/processor_testbench/register_to_multiplexor[23]} -radix binary} {{/processor_testbench/register_to_multiplexor[22]} -radix binary} {{/processor_testbench/register_to_multiplexor[21]} -radix binary} {{/processor_testbench/register_to_multiplexor[20]} -radix decimal} {{/processor_testbench/register_to_multiplexor[19]} -radix decimal} {{/processor_testbench/register_to_multiplexor[18]} -radix decimal} {{/processor_testbench/register_to_multiplexor[17]} -radix decimal} {{/processor_testbench/register_to_multiplexor[16]} -radix decimal} {{/processor_testbench/register_to_multiplexor[15]} -radix decimal} {{/processor_testbench/register_to_multiplexor[14]} -radix decimal} {{/processor_testbench/register_to_multiplexor[13]} -radix decimal} {{/processor_testbench/register_to_multiplexor[12]} -radix decimal} {{/processor_testbench/register_to_multiplexor[11]} -radix decimal} {{/processor_testbench/register_to_multiplexor[10]} -radix decimal} {{/processor_testbench/register_to_multiplexor[9]} -radix decimal} {{/processor_testbench/register_to_multiplexor[8]} -radix decimal} {{/processor_testbench/register_to_multiplexor[7]} -radix decimal} {{/processor_testbench/register_to_multiplexor[6]} -radix decimal} {{/processor_testbench/register_to_multiplexor[5]} -radix decimal} {{/processor_testbench/register_to_multiplexor[4]} -radix decimal} {{/processor_testbench/register_to_multiplexor[3]} -radix decimal} {{/processor_testbench/register_to_multiplexor[2]} -radix decimal} {{/processor_testbench/register_to_multiplexor[1]} -radix decimal} {{/processor_testbench/register_to_multiplexor[0]} -radix decimal}} -expand -subitemconfig {{/processor_testbench/register_to_multiplexor[31]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[30]} {-height 15 -radix binary} {/processor_testbench/register_to_multiplexor[29]} {-height 15 -radix binary} {/processor_testbench/register_to_multiplexor[28]} {-height 15 -radix binary} {/processor_testbench/register_to_multiplexor[27]} {-height 15 -radix binary} {/processor_testbench/register_to_multiplexor[26]} {-height 15 -radix binary} {/processor_testbench/register_to_multiplexor[25]} {-height 15 -radix binary} {/processor_testbench/register_to_multiplexor[24]} {-height 15 -radix binary} {/processor_testbench/register_to_multiplexor[23]} {-height 15 -radix binary} {/processor_testbench/register_to_multiplexor[22]} {-height 15 -radix binary} {/processor_testbench/register_to_multiplexor[21]} {-height 15 -radix binary} {/processor_testbench/register_to_multiplexor[20]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[19]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[18]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[17]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[16]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[15]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[14]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[13]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[12]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[11]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[10]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[9]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[8]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[7]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[6]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[5]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[4]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[3]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[2]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[1]} {-height 15 -radix decimal} {/processor_testbench/register_to_multiplexor[0]} {-height 15 -radix decimal}} /processor_testbench/register_to_multiplexor
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2329256352 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 437
configure wave -valuecolwidth 65
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
WaveRestoreZoom {2032102105 ps} {2329256352 ps}
