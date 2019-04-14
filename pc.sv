module pc(pc_out,pc_in,reset,clk);
	output logic [63:0] pc_out;
	input logic [63:0] pc_in;
	input logic clk,reset;
	
	genvar i;
	generate
	for (i = 0; i < 64; i++) begin: eapc
		D_FF FF(.q(pc_out[i]), .d(pc_in[i]), .reset, .clk);
	end
	endgenerate
	
endmodule