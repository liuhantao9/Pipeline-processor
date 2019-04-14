module SE_26(SE_out,in);
	input logic [25:0] in;
	output logic [63:0] SE_out;
	
	genvar i;
	generate
	for (i = 25; i < 63; i++) begin: ease
		assign SE_out[i] = in[25];
	end
	endgenerate
	assign SE_out[24:0] = in[24:0];
endmodule

