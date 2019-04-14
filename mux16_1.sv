module mux16_1(out, in, control);
 output logic out;
 input logic [15:0]in;
 input logic [3:0] control;

 logic [3:0]temp_out;
 
 	genvar i;
	generate
	for(i=0; i < 4; i++) begin : each_mux
		mux4_1 m(.out(temp_out[3-i]), .i00(in[12-4*i]), .i01(in[13-4*i]), 
					.i10(in[14-4*i]), .i11(in[15-4*i]), .sel0(control[0]), .sel1(control[1]));			
	end
	endgenerate
	
	mux4_1 m_out(.out, .i00(temp_out[0]), .i01(temp_out[1]), 
					.i10(temp_out[2]), .i11(temp_out[3]), .sel0(control[2]), .sel1(control[3]));
	
endmodule

module mux16_1_testbench();
 logic out;
 logic [15:0]in;
 logic [3:0] control;

 mux16_1 dut (.out, .in, .control);

 integer i;
 initial begin
 for(i=0; i<2^6; i++) begin
 {in,control} = i; #10;
 end
 end
endmodule 