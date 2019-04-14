onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /processor_testbench/dut/IFID_register/clk
add wave -noupdate /processor_testbench/dut/IFID_register/instruction
add wave -noupdate -radix unsigned /processor_testbench/dut/IFID_register/pc_in
add wave -noupdate -radix unsigned /processor_testbench/dut/IFID_register/pcToReg
add wave -noupdate /processor_testbench/dut/IFID_register/instruToControl
add wave -noupdate /processor_testbench/dut/IFEX_register/Reg_instruction
add wave -noupdate /processor_testbench/dut/IFEX_register/Ex_instruction
add wave -noupdate /processor_testbench/dut/brcontrol/CBZ_zeroFlag
add wave -noupdate /processor_testbench/dut/branchzero/CBZ_zeroFlag
add wave -noupdate /processor_testbench/dut/brcontrol/PC_Src
add wave -noupdate -radix unsigned /processor_testbench/dut/brcontrol/pc_branch_address
add wave -noupdate /processor_testbench/dut/brcontrol/UncondBr
add wave -noupdate -radix decimal /processor_testbench/dut/brcontrol/iin_19
add wave -noupdate -radix decimal /processor_testbench/dut/brcontrol/iin_26
add wave -noupdate -radix decimal /processor_testbench/dut/brcontrol/SE_shifter/se19/in
add wave -noupdate -radix decimal /processor_testbench/dut/brcontrol/SE_shifter/se19/SE_out
add wave -noupdate -radix decimal /processor_testbench/dut/brcontrol/SE_shifter/se26/in
add wave -noupdate -radix decimal /processor_testbench/dut/brcontrol/SE_shifter/se26/SE_out
add wave -noupdate -radix decimal /processor_testbench/dut/brcontrol/branch_add/A
add wave -noupdate -radix decimal /processor_testbench/dut/brcontrol/branch_add/B
add wave -noupdate -radix decimal /processor_testbench/dut/brcontrol/branch_add/result
add wave -noupdate -childformat {{{/processor_testbench/register_to_multiplexor[5]} -radix decimal} {{/processor_testbench/register_to_multiplexor[4]} -radix decimal} {{/processor_testbench/register_to_multiplexor[3]} -radix decimal} {{/processor_testbench/register_to_multiplexor[2]} -radix decimal} {{/processor_testbench/register_to_multiplexor[1]} -radix decimal} {{/processor_testbench/register_to_multiplexor[0]} -radix decimal}} -expand -subitemconfig {{/processor_testbench/register_to_multiplexor[5]} {-radix decimal} {/processor_testbench/register_to_multiplexor[4]} {-radix decimal} {/processor_testbench/register_to_multiplexor[3]} {-radix decimal} {/processor_testbench/register_to_multiplexor[2]} {-radix decimal} {/processor_testbench/register_to_multiplexor[1]} {-radix decimal} {/processor_testbench/register_to_multiplexor[0]} {-radix decimal}} /processor_testbench/register_to_multiplexor
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1258076380 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 397
configure wave -valuecolwidth 110
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
WaveRestoreZoom {1253993386 ps} {1289263506 ps}
