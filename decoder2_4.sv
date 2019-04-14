module decoder2_4 (out, in, RegWrite);
	output logic [3:0] out;
	input logic [1:0] in;
	input logic RegWrite;
	logic [1:0] temp;
	
	decoder1_2 out1 (.out(temp[1:0]), .in(in[1]), .RegWrite);
	decoder1_2 out2 (.out(out[3:2]), .in(in[0]), .RegWrite(temp[1]));
	decoder1_2 finalout (.out(out[1:0]), .in(in[0]), .RegWrite(temp[0]));

	endmodule

module decoder2_4_testbench();
	logic [3:0] out;
	logic [1:0] in;
	logic RegWrite;

	decoder2_4 dut (.out, .in, .RegWrite);

	initial begin
	{in,RegWrite} = 3'b000; #10;
	{in,RegWrite} = 3'b001; #10;
	{in,RegWrite} = 3'b010; #10;
	{in,RegWrite} = 3'b011; #10;
	{in,RegWrite} = 3'b100; #10;
	{in,RegWrite} = 3'b101; #10;
	{in,RegWrite} = 3'b110; #10;
	{in,RegWrite} = 3'b111; #10;	
	
	end
endmodule 	