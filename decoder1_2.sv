module decoder1_2(out, in, RegWrite);
	output logic [1:0] out;
	input logic in, RegWrite;
	logic temp;
	
	and out1 (out[1], RegWrite, in);
	not invertIn (temp, in);
	and out0 (out[0], RegWrite, temp);

endmodule

module decoder1_2_testbench();
	logic [1:0] out;
	logic in, RegWrite;

	decoder1_2 dut (.out, .in, .RegWrite);

	initial begin
	{in,RegWrite} = 2'b00; #10;
	{in,RegWrite} = 2'b01; #10;
	{in,RegWrite} = 2'b10; #10;
	{in,RegWrite} = 2'b11; #10;
	
	end
endmodule 