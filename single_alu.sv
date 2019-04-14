module single_alu(out, carryout, carryin, a_in, b_in, control);
	output logic out, carryout;
	input logic carryin, a_in, b_in;
	input logic [2:0] control;
	logic [7:0] mux_in;
	logic b_mod;
	
	mux2_1 add_subtr_control (.out(b_mod), .i0(b_in), .i1(~b_in), .sel(control[0]));
	add_subtr_unit ad_sub_unit(.out(mux_in[2]), .carryout, .carryin, .a_in, .b_in(b_mod)); 
	
	assign mux_in[3] = mux_in[2];
	assign mux_in[0] = b_in;
	and ab_and (mux_in[4], a_in, b_in);
	or ab_or (mux_in[5], a_in, b_in);
	xor ab_xor (mux_in[6], a_in, b_in);
		
	mux8_1 alu_connect (.out, .in(mux_in), .control);	
endmodule

module single_alu_testbench();
	logic out,carryout;
	logic carryin, a_in, b_in;
	logic [2:0] control;
	
	single_alu dut (.out,.carryout, .carryin, .a_in, .b_in, .control);	
	
	integer i, j;
	initial begin 
	for (j = 0; j < 8; j++) begin
		control = j; #100;
		for (i = 0; i < 8; i++) begin
			{a_in,b_in,carryin} = i; #100;
		end
	end		
	end	
endmodule