module adder(A, B, result);
	input logic [63:0] A,B;
	output logic [63:0] result;
	
	alu add(.A, .B, .cntrl(010), .result); //.negative(null), .zero(null), 
			  //.overflow(), .carry_out(null));
endmodule

module adder_testbench();
	logic [63:0] A,B;
	logic [63:0] result;
	
	adder dut(.A, .B, .result);
	
	integer i;
	initial begin
		for(i=0; i<300; i+=10) begin
			A = $random(); #10;
			B = $random(); #10;
		end
	end
endmodule