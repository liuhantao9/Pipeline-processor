module MemWR(clk,Mem_RegWE,Wr_RegWE,Mem_Rd,Wr_Rd,Mem_data,Wr_data);
	input logic Mem_RegWE;
	input logic [4:0] Mem_Rd;
	input logic [63:0] Mem_data;	
	output logic Wr_RegWE;
	output logic [4:0] Wr_Rd;
	output logic [63:0] Wr_data;	
	input logic clk;
	
	D_FF RegWERecord(.q(Wr_RegWE), .d(Mem_RegWE), .reset(0), .clk);
	Mult_D_FF#(5) RdRecord (.q(Wr_Rd), .d(Mem_Rd), .reset(0), .clk);	
	Mult_D_FF#(64) dataRecord (.q(Wr_data), .d(Mem_data), .reset(0), .clk);	
endmodule