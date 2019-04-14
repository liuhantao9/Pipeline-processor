module alu(A, B, cntrl, result, negative, zero, overflow, carry_out);
	output logic negative, zero, overflow, carry_out;
	output logic [63:0] result;
	input logic [63:0] A, B;
	input logic [2:0] cntrl;
	logic [7:0] mux_in;
	logic carry_pass[63:0];
	logic [15:0] zero_comp1;
	logic [4:0] zero_comp2;
	
	
	single_alu zero_bit (.out(result[0]), .carryout(carry_pass[0]), 
								.carryin(cntrl[0]), .a_in(A[0]), .b_in(B[0]), .control(cntrl));
	genvar i;
	generate
	for (i = 1; i < 64; i++) begin: eachalu
		single_alu bits (.out(result[i]), .carryout(carry_pass[i]), 
							  .carryin(carry_pass[i-1]), .a_in(A[i]), .b_in(B[i]), .control(cntrl));
	end
	endgenerate
	
	assign carry_out = carry_pass[63];
	assign negative = result[63];
	xor overflow_flag (overflow,carry_out,carry_pass[62]); 
	genvar j,k;
	generate 
	for (i = 0; i < 16; i++) begin: eachnor
		nor comp1 (zero_comp1[i], result[4*i],result[4*i+1],result[4*i+2],result[4*i+3]);
	end
	for (j = 0; j < 4; j++) begin: eachand
		and comp2 (zero_comp2[j], zero_comp1[4*j], zero_comp1[4*j+1], zero_comp1[4*j+2], zero_comp1[4*j+3]);
	end
	endgenerate
	and zero_flage (zero,zero_comp2[0],zero_comp2[1],zero_comp2[2],zero_comp2[3]);
endmodule