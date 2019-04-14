# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./regfile.sv"
vlog "./processor.sv"
vlog "./instructmem.sv"
vlog "./shifter_left_2.sv"
vlog "./SE.sv"
vlog "./Unsigned_SE.sv"
vlog "./SE_to_shifter.sv"
vlog "./mux2_1.sv"
vlog "./adder.sv"
vlog "./PC_intromem_system.sv"
vlog "./pc.sv"
vlog "./counterControlSystem.sv"
vlog "./mux2_1_multibits.sv"
vlog "./registerAluControlSystem.sv"
vlog "./single_data_pass.sv"
vlog "./datamem.sv"
vlog "./multiple_data_pass.sv"
vlog "./math.sv"
vlog "./IFID.sv"
vlog "./IFEX.sv"
vlog "./EXMEM.sv"
vlog "./MemWR.sv"
vlog "./mux4_1_multibits.sv"
vlog "./Mult_D_FF.sv"
vlog "./forwardingUnit.sv"
vlog "./flipClkControl.sv"
vlog "./branchZero.sv"
vlog "./branchControl.sv"
vlog "./SE_to_shifter.sv"
vlog "./LdurHarzardControl.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work processor_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do processor_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
