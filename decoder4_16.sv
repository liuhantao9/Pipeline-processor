module decoder4_16(out, in, RegWrite);
	output logic [15:0] out;
	input logic [3:0] in;
	input logic RegWrite;
	logic [3:0] temp;

	decoder2_4 d24 (.out(temp[3:0]), .in(in[3:2]), .RegWrite);	
	
	genvar i;
	generate
	for(i=0; i < 4; i++) begin : eachd24
	decoder2_4 d24 (.out(out[15-4*i:12-4*i]), .in(in[1:0]), .RegWrite(temp[3-i]));
	end
	endgenerate 	

	endmodule

module decoder4_16_testbench();
	logic [15:0] out;
	logic [3:0] in;
	logic RegWrite;

	decoder4_16 dut (.out, .in, .RegWrite);

	initial begin
	RegWrite = 0;
	in = 3'b000; #10;
	in = 3'b001; #10;
	in = 3'b010; #10;
	in = 3'b011; #10;
	in = 3'b100; #10;
	in = 3'b101; #10;
	in = 3'b110; #10;
	in = 3'b111; #10;	
	RegWrite = 1;
	in = 3'b000; #10;
	in = 3'b001; #10;
	in = 3'b010; #10;
	in = 3'b011; #10;
	in = 3'b100; #10;
	in = 3'b101; #10;
	in = 3'b110; #10;
	in = 3'b111; #10;	
	in[3] = 1;
	in[2:0] = 3'b000; #10;
	in[2:0] = 3'b001; #10;
	in[2:0] = 3'b010; #10;
	in[2:0] = 3'b011; #10;
	in[2:0] = 3'b100; #10;
	in[2:0] = 3'b101; #10;
	in[2:0] = 3'b110; #10;
	in[2:0] = 3'b111; #10;
	end
endmodule 	