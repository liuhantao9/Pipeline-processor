module EXMEM(clk, Ex_MemWE, Ex_Mem2Reg, Ex_RegWE,Ex_data, Ex_Rd,Ex_ReadData2,Ex_xfer_size,
				 Ex_LDURB_control,
			    Mem_MemWE, Mem_Mem2Reg, Mem_RegWE,Mem_data,Mem_Rd,Mem_ReadData2,Mem_xfer_size,
				 Mem_LDURB_control);
	input logic Ex_MemWE, Ex_Mem2Reg, Ex_RegWE,Ex_LDURB_control;
	input logic [3:0] Ex_xfer_size;
	input logic [4:0] Ex_Rd;
	input logic [63:0] Ex_data,Ex_ReadData2;
	output logic Mem_MemWE, Mem_Mem2Reg, Mem_RegWE,Mem_LDURB_control;
	output logic [4:0] Mem_Rd;	
	output logic [3:0] Mem_xfer_size;	
	output logic [63:0] Mem_data,Mem_ReadData2;
	input logic clk;
	
	
	D_FF MemWERecord(.q(Mem_MemWE), .d(Ex_MemWE), .reset(0), .clk);
	D_FF Mem2RegRecord(.q(Mem_Mem2Reg), .d(Ex_Mem2Reg), .reset(0), .clk);
	D_FF RegWERecord(.q(Mem_RegWE), .d(Ex_RegWE), .reset(0), .clk);
	D_FF LDURBRecord(.q(Mem_LDURB_control), .d(Ex_LDURB_control), .reset(0), .clk);
	Mult_D_FF#(4) xfersizeRecord (.q(Mem_xfer_size), .d(Ex_xfer_size), .reset(0), .clk);
	Mult_D_FF#(5) RdRecord (.q(Mem_Rd), .d(Ex_Rd), .reset(0), .clk);	
	Mult_D_FF#(64) dataRecord (.q(Mem_data), .d(Ex_data), .reset(0), .clk);
	Mult_D_FF#(64) memDataRecord (.q(Mem_ReadData2), .d(Ex_ReadData2), .reset(0), .clk);		
endmodule