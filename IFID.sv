module IFID(clk, instruction, pc_in, pcToReg, instruToControl);
	input logic [63:0] pc_in;
	input logic [31:0] instruction;
	input logic clk;
	output logic [63:0] pcToReg;
	output logic [31:0] instruToControl;
	
	Mult_D_FF#(32) store_instru  (.q(instruToControl), .d(instruction), .reset(0), .clk);
	Mult_D_FF#(64) store_pc  (.q(pcToReg), .d(pc_in), .reset(0), .clk);	
						
		
endmodule