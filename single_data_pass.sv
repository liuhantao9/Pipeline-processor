module single_data_pass(out, in, enable, clk, reset);
	output logic out;
	input logic in, enable;
	input logic clk,reset;
	logic temp_out,e_out,feedback;
		
	//D_FF enable_mod (.q(e_out), .d(enable), .reset, .clk);
	
	D_FF data_pass (.q(out), .d(temp_out), .reset, .clk);
	
	mux2_1 if_pass (.out(temp_out), .i0(out), .i1(in), .sel(enable));
	


	endmodule
	
module single_data_pass_testbench();
	logic out;
	logic in, enable, reset;
	logic clk;
	single_data_pass dut (.out, .in, .enable, .reset, .clk);
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin
												@(posedge clk);
		 enable <= 0;		@(posedge clk);
		reset <= 0; 						@(posedge clk);
		in <= 0;enable <= 1; 							@(posedge clk);
								@(posedge clk);
												@(posedge clk);
		in <= 1;				 				@(posedge clk);
												@(posedge clk);
												@(posedge clk);
												@(posedge clk);
		enable <= 0; 						@(posedge clk);
		in <= 0;								@(posedge clk);
												@(posedge clk);
												@(posedge clk);
												@(posedge clk);
		enable <= 1; 						@(posedge clk);	
												@(posedge clk);
												@(posedge clk);
												@(posedge clk);
		in <= 1; 							@(posedge clk);
									repeat(5)@(posedge clk);		
	$stop; // End the simulation.
	end
endmodule	