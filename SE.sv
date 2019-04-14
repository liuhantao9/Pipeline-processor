module SE #(parameter WIDTH = 9) (SE_out,in);
	input logic [WIDTH-1:0] in;
	output logic [63:0] SE_out;
	
	
	initial assert(WIDTH > 0 && WIDTH <= 64);
	
	genvar i;
	generate
	for (i = WIDTH-1; i < 64; i++) begin: ease
		assign SE_out[i] = in[WIDTH-1];
	end
	endgenerate
	assign SE_out[WIDTH-2:0] = in[WIDTH-2:0];
endmodule