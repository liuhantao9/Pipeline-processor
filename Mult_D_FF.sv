module Mult_D_FF #(parameter WIDTH = 64)(q, d, reset, clk);
	output logic [WIDTH-1:0] q;
	input logic [WIDTH-1:0] d;
	input logic reset, clk;

	initial assert(WIDTH > 0);
	
	genvar i;
	generate
	for (i = 0; i < WIDTH; i++) begin: multiDFF
		D_FF multireg (.q(q[i]), .d(d[i]), .reset(0), .clk);
	end
	endgenerate	
	
endmodule