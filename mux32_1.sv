module mux32_1(out, in, control);
 output logic out;
 input logic [31:0]in;
 input logic [4:0] control;

 logic [1:0]temp_out;
	
	mux16_1 m_out1(.out(temp_out[1]), .in(in[31:16]), .control(control[3:0]));
	mux16_1 m_out0(.out(temp_out[0]), .in(in[15:0]), .control(control[3:0]));
	mux2_1 m_out_final(.out, .i0(temp_out[0]), .i1(temp_out[1]), .sel(control[4]));
endmodule

module mux32_1_testbench();
 logic out;
 logic [31:0]in;
 logic [4:0] control;

 mux32_1 dut (.out, .in, .control);

 integer i;
 initial begin
 for(i=0; i<2^6; i+=300) begin
 {in,control} = i; #10;
 end
 end
endmodule 