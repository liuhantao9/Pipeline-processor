module multiplexor(out, in, control);
 output logic [63:0] out;
 input logic [31:0][63:0]in;
 input logic [4:0] control;
 
 logic [63:0][31:0] convertblock;
 
 genvar j,k;
	generate
	for (k=0; k < 64; k++) begin : aloop
		for(j=0; j < 32; j++) begin : bloop
			assign convertblock[63-k][31-j] = in[31-j][63-k];
		end	
	end
	endgenerate 
	
	genvar i;
	generate
	for(i=0; i < 64; i++) begin : eachmulti
			mux32_1	multi1(.out(out[63-i]), .in(convertblock[63-i]),
									 .control(control[4:0]));
	end
	endgenerate 	
endmodule

module multiplexor_testbench();
	logic [63:0] out;  
	logic [31:0][63:0]in;
	logic [4:0] control;
	integer i;

	multiplexor dut (.out, .in, .control);

	initial begin
	control = 5'b11111; #100;
	for (i = 0; i < 32; i++) begin
		in[i] = 64'd550;
	end
	in[20] = 0; 		  #100;
	control = 5'b10100; #100;
	
	end
endmodule