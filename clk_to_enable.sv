module clk_to_enable(e_out, e_in, clk);
	output logic e_out;
	input logic e_in;
	input logic clk;
	
	always_ff @(posedge clk) begin 
	e_out <= e_in;
	end
	
	endmodule

module clk_to_enable_testbench();
	logic e_out;
	logic e_in;
	logic clk;
	clk_to_enable dut (.e_out,.e_in,.clk);
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin
		e_in <= 0;							@(posedge clk);
		e_in <= 1; 							@(posedge clk);
												@(posedge clk);
												@(posedge clk);
												@(posedge clk);
	end
endmodule	