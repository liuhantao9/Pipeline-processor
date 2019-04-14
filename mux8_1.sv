module mux8_1(out, in, control);
  output logic out;
  input logic [7:0] in;
  input logic [2:0] control;
  logic upbit, downbit;

 mux4_1 m1(.out(upbit), .i00(in[4]), .i01(in[5]), .i10(in[6]), .i11(in[7]), .sel0(control[0]), .sel1(control[1]));
 mux4_1 m0(.out(downbit), .i00(in[0]), .i01(in[1]), .i10(in[2]), .i11(in[3]), .sel0(control[0]), .sel1(control[1]));
 mux2_1 m (.out, .i0(downbit), .i1(upbit), .sel(control[2]));
endmodule

module mux8_1_testbench();
  logic out;
  logic [7:0] in;
  logic [2:0] control;

 mux8_1 dut (.out, .in, .control);

 integer i, j;
 initial begin
 for(i=0; i<8; i++) begin
	control = i; #10;
	for(j = 1; j < 256; j *= 2) begin
		in = j; #10;
		end
 end
 end
endmodule 