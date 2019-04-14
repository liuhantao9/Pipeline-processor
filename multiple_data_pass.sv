module multiple_data_pass(out, in, enable, clk, reset);
	output logic [63:0] out;
	input logic [63:0]in;
	input logic clk,reset;
	input logic enable;
	
	genvar i;//multiple_data_pass
	generate
	for(i=0; i < 64; i++) begin : each_data_set
		single_data_pass data_set(.out(out[i]), .in(in[i]), .enable, .clk, .reset);
	end
	endgenerate 	

	endmodule

module multiple_data_pass_testbench();
	logic [63:0]out;
	logic [63:0]in;
	logic clk;
	logic enable, reset;
	multiple_data_pass dut (.out, .in, .enable, .reset, .clk);
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin
												@(posedge clk);
		reset <= 1; enable <= 0;		@(posedge clk);
		reset <= 0; 						@(posedge clk);
		in[63:32] <= 550; 					@(posedge clk);
		enable <= 1;in[63:0] <= 11970;						@(posedge clk);
		enable <= 0;										@(posedge clk);
		in <= 1;				 				repeat(10)@(posedge clk);
												@(posedge clk);
												@(posedge clk);
												@(posedge clk);
		enable <= 0; 						@(posedge clk);
		in[31:0] <= 970;						@(posedge clk);
												@(posedge clk);
												@(posedge clk);
												@(posedge clk);
		enable <= 1; 						repeat(10)@(posedge clk);	
												@(posedge clk);
		enable <= 0; 						@(posedge clk);
												@(posedge clk);
		reset <= 1; 						@(posedge clk);
		reset <= 1; 						@(posedge clk);		
	$stop; // End the simulation.
	end
endmodule		