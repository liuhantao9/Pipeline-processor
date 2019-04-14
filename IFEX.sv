module IFEX(clk, Reg_ALUSrc,Reg_ALUSrc2,Reg_ALUOp, Reg_MemWE, Reg_Mem2Reg, 
				Reg_RegWE,DAddr9,Imm12,Reg_ReadData1,Reg_ReadData2,Reg_Rd,Reg_instruction,
				Movk_control,Imm16,Movz_control,shifter_input,LDURB_control,
				Ex_ALUSrc, Ex_ALUSrc2, Ex_ALUOp, Ex_MemWE, Ex_Mem2Reg,
				Ex_RegWE,Ex_DAddr9,Ex_Imm12,Ex_ReadData1,Ex_ReadData2,Ex_Rd, Ex_instruction,
				PC_Src, Ex_PC_Src,pc_branch_address,Ex_pc_branch_address,xfer_size,Ex_xfer_size,
				Ex_Movk_control,Ex_Imm16,Ex_Movz_control,Ex_shifter_input,Ex_LDURB_control);
	input logic Reg_ALUSrc, Reg_ALUSrc2, Reg_MemWE, Reg_Mem2Reg, Reg_RegWE,
					PC_Src,Movz_control,LDURB_control;
	input logic [2:0] Reg_ALUOp;
	input logic [3:0] xfer_size;
	input logic [3:0] Movk_control;	
	input logic [4:0] Reg_Rd;
	input logic [5:0] shifter_input;
	input logic [8:0] DAddr9;
	input logic [11:0] Imm12;
	input logic [15:0] Imm16;
	input logic [63:0] Reg_ReadData1,Reg_ReadData2,pc_branch_address;
	input logic [31:0] Reg_instruction;
	output logic  Ex_ALUSrc, Ex_ALUSrc2, Ex_MemWE, Ex_Mem2Reg, Ex_RegWE, 
					  Ex_PC_Src,Ex_Movz_control,Ex_LDURB_control;
	output logic [2:0] Ex_ALUOp;
	output logic [3:0] Ex_xfer_size;
	output logic [3:0] Ex_Movk_control;
	output logic [4:0] Ex_Rd;
	output logic [5:0] Ex_shifter_input;	
	output logic [8:0] Ex_DAddr9;
	output logic [11:0] Ex_Imm12;	
	output logic [15:0] Ex_Imm16;
	output logic [63:0] Ex_ReadData1,Ex_ReadData2,Ex_pc_branch_address;
	output logic [31:0] Ex_instruction;	
	input logic clk;
	
	
	D_FF ALUSrcRecord(.q(Ex_ALUSrc), .d(Reg_ALUSrc), .reset(0), .clk);
	D_FF ALUSrcRecord2(.q(Ex_ALUSrc2), .d(Reg_ALUSrc2), .reset(0), .clk);
	D_FF PCSrcRecord(.q(Ex_PC_Src), .d(PC_Src), .reset(0), .clk);	
	D_FF MovzRecord(.q(Ex_Movz_control), .d(Movz_control), .reset(0), .clk);
	D_FF LDURBRecord(.q(Ex_LDURB_control), .d(LDURB_control), .reset(0), .clk);	
	Mult_D_FF#(3) ALUOpRecord (.q(Ex_ALUOp), .d(Reg_ALUOp), .reset(0), .clk);
	Mult_D_FF#(4) xfersizeRecord (.q(Ex_xfer_size), .d(xfer_size), .reset(0), .clk);	
	Mult_D_FF#(4) MovkRecord(.q(Ex_Movk_control), .d(Movk_control), .reset(0), .clk);
	D_FF MemWERecord(.q(Ex_MemWE), .d(Reg_MemWE), .reset(0), .clk);
	D_FF Mem2RegRecord(.q(Ex_Mem2Reg), .d(Reg_Mem2Reg), .reset(0), .clk);
	D_FF RegWERecord(.q(Ex_RegWE), .d(Reg_RegWE), .reset(0), .clk);	
	Mult_D_FF#(5) RdOpRecord (.q(Ex_Rd), .d(Reg_Rd), .reset(0), .clk);	
	Mult_D_FF#(6) shiftRecord (.q(Ex_shifter_input), .d(shifter_input), .reset(0), .clk);	
	Mult_D_FF#(9) Daddr9Record (.q(Ex_DAddr9), .d(DAddr9), .reset(0), .clk);
	Mult_D_FF#(12) Imm12Record (.q(Ex_Imm12), .d(Imm12), .reset(0), .clk);
	Mult_D_FF#(16) Imm16Record (.q(Ex_Imm16), .d(Imm16), .reset(0), .clk);	
	Mult_D_FF#(32) instruRecord (.q(Ex_instruction), .d(Reg_instruction), .reset(0), .clk);	
	Mult_D_FF#(64) ReadData1Record (.q(Ex_ReadData1), .d(Reg_ReadData1), .reset(0), .clk);	
	Mult_D_FF#(64) ReadData2Record (.q(Ex_ReadData2), .d(Reg_ReadData2), .reset(0), .clk);	
	Mult_D_FF#(64) PCBranchAdrRecord (.q(Ex_pc_branch_address), .d(pc_branch_address), .reset(0), .clk);	
endmodule
