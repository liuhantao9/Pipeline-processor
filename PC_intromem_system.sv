module PC_intromem_system(instruction,clk,reset,pc_out,PC_Src,pc_branch_address);
	output logic [31:0] instruction;
	logic [63:0] pcPlus4;
	logic [63:0] pc_in;
	output logic [63:0] pc_out;
	input logic clk,reset,PC_Src;
	input logic [63:0] pc_branch_address;	
	
	pc program_counter (.pc_out,.pc_in,.reset,.clk);
	
	mux2_1_multibits pcinput (.out(pc_in), .in0(pcPlus4), .in1(pc_branch_address), .control(PC_Src));
	
	adder regular_add (.A(pc_out), .B(4), .result(pcPlus4));
	
	instructmem to_instructmem (.address(pc_out), .instruction, .clk);
	
endmodule


`timescale 1ns/10ps
`define INSTRUCT_MEM_SIZE		1024
module PC_intromem_system_testbench();

	parameter ClockDelay = 5000;

	logic clk,reset;
	logic [31:0] instruction;
	
	PC_intromem_system dut (.instruction,.clk,.reset);
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	integer i;
	initial begin
		// Read every location, including just past the end of the memory.
			reset <= 1; @(posedge clk);
		for (i=0; i <= `INSTRUCT_MEM_SIZE; i = i + 4) begin
			reset <= 0;
			@(posedge clk); 
		end
		$stop;
		
	end
endmodule