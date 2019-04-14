module add_subtr_unit(out, carryout, carryin, a_in, b_in);
	output logic out, carryout;
	input logic carryin, a_in, b_in;

	logic temp_ab,temp_ac,temp_bc;

	xor out_digit (out, carryin, a_in, b_in);
	and ab (temp_ab, a_in, b_in);
	and ac (temp_ac, a_in, carryin);
	and bc (temp_bc, b_in, carryin);	
	or c_out (carryout, temp_ab, temp_ac, temp_bc);
endmodule


module add_subtr_unit_testbench();
	logic out, carryout;
	logic carryin, a_in, b_in;

	logic temp_ab,temp_ac,temp_bc;

	add_subtr_unit	dut(.out, .carryout, .carryin, .a_in, .b_in);
	integer i;
	 initial begin
		for(i=0; i<8; i++) begin
			{a_in,b_in,carryin} = i; #10;
		end
	 end
endmodule
