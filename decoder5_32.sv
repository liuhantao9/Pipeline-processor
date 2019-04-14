module decoder5_32(out, in, RegWrite);
	output logic [31:0] out;
	input logic [4:0] in;
	input logic RegWrite;
	logic [1:0] temp;

	decoder1_2 out1 (.out(temp[1:0]), .in(in[4]), .RegWrite);	
	
	genvar i;
	generate
	for(i=0; i < 2; i++) begin : eachd416
	decoder4_16 outfinal (.out(out[31-16*i:16-16*i]), .in(in[3:0]), .RegWrite(temp[1-i]));
	end
	endgenerate 	

	endmodule
	
module decoder5_32_testbench();
	logic [31:0] out;
	logic [4:0] in;
	logic RegWrite;
	integer i;

	decoder5_32 dut (.out, .in, .RegWrite);

	initial begin
	RegWrite = 0;
	in = 3'b000; #10;
	in = 3'b001; #10;
	in = 3'b010; #10;
	in = 3'b011; #10;
	RegWrite = 1; #100;
	in = 3'b100; #10;
	in = 3'b101; #10;
	in = 3'b110; #10;
	in = 3'b111; #10;	
	RegWrite = 0;
	in = 3'b000; #10;
	for (i = 0; i < 50; i++) begin
		in++; #10;
	end
	end
endmodule 		