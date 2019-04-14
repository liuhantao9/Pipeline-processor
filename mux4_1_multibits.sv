module mux4_1_multibits #(parameter WIDTH = 64)(out, i00, i01, i10, i11, control);
	output logic [WIDTH-1:0] out;
	input logic [WIDTH-1:0] i00, i01, i10, i11;
	input logic [1:0] control;

	initial assert(WIDTH > 0);
	
	genvar i;
	generate
	for (i = 0; i < WIDTH; i++) begin: eamux
		mux4_1 multi_mux(.out(out[i]), .i00(i00[i]), .i01(i01[i]), .i10(i10[i]), 
							  .i11(i11[i]), .sel0(control[0]), .sel1(control[1]));
	end
	endgenerate	
	
	endmodule