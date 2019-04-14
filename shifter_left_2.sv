module shifter_left_2(in,out);
	input logic [63:0] in;
	output logic [63:0] out;
	
	genvar i;
	generate
	for (i = 0; i < 62; i++) begin: eapc
		assign out[i+2] = in[i];
	end
	endgenerate	
	assign {out[0],out[1]} = 2'b00;
endmodule

module shifter_left_2_testbench();
	logic [63:0] in;
	logic [63:0] out;
	
	shifter_left_2 dut (.in, .out);
	
	integer i;
	initial begin
		for(i=0; i<300; i+=10) begin
			in = $random(); #10;
		end
	end
endmodule