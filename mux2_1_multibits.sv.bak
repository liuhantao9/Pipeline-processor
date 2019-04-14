module mux2_1_multibits #(parameter WIDTH = 64)(out, in0, in1, control);
	output logic [WIDTH-1:0] out;
	input logic [WIDTH-1:0] in0, in1;
	input logic control;

	initial assert(WIDTH > 0);
	
	genvar i;
	generate
	for (i = 0; i < WIDTH; i++) begin: eamux
		mux2_1 multi_mux(.out(out[i]), .i0(in0[i]), .i1(in1[i]), .sel(control));
	end
	endgenerate	
	
	endmodule