module SE_to_shifter(in_19,in_26,UncondBr,out);
	input logic [18:0] in_19;
	input logic [25:0] in_26;
	input logic UncondBr;
	output logic [63:0] out;
	logic [63:0] SEout19,SEout26;
	logic [63:0] shifter_in;
	
	SE#(19) se19 (.SE_out(SEout19),.in(in_19));
	SE#(26) se26 (.SE_out(SEout26),.in(in_26));
	mux2_1_multibits muxToAdder(.out(shifter_in), .in0(SEout19), .in1(SEout26), .control(UncondBr));
	shifter_left_2 shifter(.in(shifter_in),.out);
endmodule

module SE_to_shifter_testbench();
	logic [18:0] in_19;
	logic [25:0] in_26;
	logic UncondBr;
	logic [63:0] out;
	
	SE_to_shifter dut(.in_19,.in_26,.UncondBr,.out);
	
	integer i;
	initial begin
	for(i=0; i<10; i++) begin
		UncondBr = 0;
		in_19 = $random(); #10;
		in_26 = $random(); #10;
		UncondBr = 1; #10;
	end
	end	
endmodule





