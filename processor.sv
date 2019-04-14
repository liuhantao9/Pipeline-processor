module processor(ReadData1, ReadData2, result, negative, zero, overflow, carry_out, 
					  WriteData, clk, reset,ReadRegister1, ReadRegister2, WriteRegister,
				  	  intoReadRegister2,MemWrite,mem_to_register,MemToReg,Movk_control,Imm16,
					  Movz_control,shifter_input,LDURB_control,register_to_multiplexor,
					  Ex_shifter_input,Ex_Movk_control);
	output logic negative, zero, overflow, carry_out;
	output logic [63:0] result;
	logic [63:0] A, B;
	logic [2:0] cntrl;
	output logic [4:0] 	ReadRegister1, ReadRegister2, WriteRegister,intoReadRegister2;
	output logic [63:0]	WriteData;
	input logic 			clk, reset;
	output logic [63:0]	ReadData1, ReadData2;	
	logic [8:0] DAddr9; // input logic for store and load
	logic [11:0] Imm12; // input addi
	logic ALUSrc,ALUSrc2,Reg2Loc; // control input for alu input; Reg2Loc controls input to Ab register port
	logic [63:0] SE_Daddr9,SE_Imm12,SE_Imm16;
	logic [63:0] intermediate, intermediate2,intermediate3; //1 is out for Daddr9, into Imm12 control; 2 is out from Imm12	
	logic [31:0] instruction;
	logic RegWrite;
	output logic MemWrite;
	logic [3:0] xfer_size; // number of bytes to read 
	output logic [63:0] mem_to_register;
	output logic MemToReg;
	output logic [15:0] Imm16;
	output logic [3:0] Movk_control,Ex_Movk_control;
	output logic Movz_control,LDURB_control;
	output logic [5:0] shifter_input,Ex_shifter_input;
	logic [63:0] shift_result, memmux_result, mem_byte_extend, mod_mem_to_reg;
	output logic [31:0][63:0] register_to_multiplexor; // read all registers
	
	
	// all logic for pipeline
	logic [63:0] RnForwardResult,RmForwardResult,pc_branch_address,Ex_pc_branch_address;
	logic [31:0] Reg_instruction,Ex_instruction;
	logic [63:0] current_pc,pcToReg;
	logic Ex_ALUSrc, Ex_ALUSrc2, Ex_MemWE, Ex_Mem2Reg, Ex_RegWE, Ex_Movz_control,	Ex_LDURB_control; // basic control signal at exc phase
	logic [2:0] Ex_ALUOp; // ALUOperation control signal at exc phase
	logic [8:0] Ex_DAddr9; 
	logic [11:0] Ex_Imm12;
	logic Mem_MemWE, Mem_Mem2Reg, Mem_RegWE, Wr_RegWE,	Mem_LDURB_control,Mem_RegWE_mod; // basic control signal at mem phase
	logic [63:0] Reg_ReadData1,Reg_ReadData2,Ex_ReadData1,Ex_ReadData2,Mem_ReadData2,Mem_data,Mem_ultidata,Wr_data;
	logic [4:0] Reg_Rd,Ex_Rd,Mem_Rd,Wr_Rd;
	logic [1:0] RnControl,RmControl;
	logic [63:0] forwardRnData,forwardRmData;
	logic PC_Src,Ex_PC_Src,flpClkSignal,CBZ_zeroFlag; // signal that controls the clk flip
	logic [3:0] Ex_xfer_size,Mem_xfer_size;
	logic [15:0] Ex_Imm16;
	
	
	PC_intromem_system instr_sources(.instruction,.clk,.reset,.pc_out(current_pc),
												.PC_Src,.pc_branch_address);
	
	IFID IFID_register(.clk, .instruction, .pc_in(current_pc), .pcToReg, .instruToControl(Reg_instruction));


	registerAluControlSystem controlsystem(.instruction(Reg_instruction),.Rd(WriteRegister),.Rm(ReadRegister2),
														.Rn(ReadRegister1),.Reg2Loc,.RegWrite,.ALUSrc,.ALUSrc2,.ALUOp(cntrl),
														.DAddr9,.Imm12,.MemWrite,.xfer_size,.MemToReg,.Movk_control,.Imm16,
														.Movz_control,.shifter_input,.LDURB_control);	
																
	
	mux2_1_multibits#(5) b_port(.out(intoReadRegister2), .in0(WriteRegister), .in1(ReadRegister2), .control(Reg2Loc));
	
	
	regfile registers (.ReadData1(Reg_ReadData1), .ReadData2(Reg_ReadData2), .WriteData(Wr_data),
							 .ReadRegister1, .ReadRegister2(intoReadRegister2), .WriteRegister(Wr_Rd), .RegWrite(Wr_RegWE), .clk,
							 .register_to_multiplexor,.flpClkSignal);	
	
	flipClkControl flipclkcontrol(.flpClkSignal,.Reg_Rn(ReadRegister1),.Reg_Rm(intoReadRegister2),.Wr_Rd,.Wr_RegWE);
	
	forwardingUnit forwardControlUnit (.RnControl,.RmControl,.Reg_Rn(ReadRegister1),.Reg_Rm(intoReadRegister2),
												  .Ex_Rd,.Mem_Rd,.Ex_RegWE,.Mem_RegWE);
	
	mux4_1_multibits forwardRn (.out(forwardRnData), .i00(Reg_ReadData1), .i01(result), .i10(memmux_result), .i11(64'bx), .control(RnControl));
	
	mux4_1_multibits forwardRm (.out(forwardRmData), .i00(Reg_ReadData2), .i01(result), .i10(memmux_result), .i11(64'bx), .control(RmControl));
	
	branchZero branchzero(.Reg_ReadData2(forwardRmData), .CBZ_zeroFlag);
	
	branchControl brcontrol(.CBZ_zeroFlag, .pcToReg, .Reg_instruction, .Ex_instruction,.PC_Src,
									.pc_branch_address,.zero_flag(zero),.carry_out,.overflow,.negative,.clk);
	
	IFEX IFEX_register(.clk, .Reg_ALUSrc(ALUSrc),.Reg_ALUSrc2(ALUSrc2), .Reg_ALUOp(cntrl),.Reg_MemWE(MemWrite), 
							 .Reg_Mem2Reg(MemToReg), .DAddr9,.Imm12, .Reg_ReadData1(forwardRnData),.Reg_ReadData2(forwardRmData),
							 .Reg_RegWE(RegWrite),.Reg_Rd(WriteRegister),.Reg_instruction,.Movk_control,.Imm16,
							 .Movz_control,.shifter_input,.LDURB_control,
							 .Ex_ALUSrc, .Ex_ALUSrc2, .Ex_ALUOp, .Ex_MemWE, .Ex_Mem2Reg, 
							 .Ex_RegWE, .Ex_DAddr9, .Ex_Imm12,.Ex_ReadData1,.Ex_ReadData2,.Ex_Rd,.Ex_instruction,
							 .PC_Src, .Ex_PC_Src,.pc_branch_address,.Ex_pc_branch_address,.xfer_size,.Ex_xfer_size,
							 .Ex_Movk_control,.Ex_Imm16, .Ex_Movz_control,.Ex_shifter_input,.Ex_LDURB_control);
							
							
	alu connectDaDb (.A(Ex_ReadData1), .B, .cntrl(Ex_ALUOp), .result,
						  .negative, .zero, .overflow, .carry_out);
						  
	SE#(9) daddr9 (.SE_out(SE_Daddr9),.in(Ex_DAddr9));
	
	Unsigned_SE#(12) daddr12 (.SE_out(SE_Imm12),.in(Ex_Imm12));
	
	Unsigned_SE#(16) imm16 (.SE_out(SE_Imm16),.in(Ex_Imm16));
	
	shifter imm16Shifter (.value(SE_Imm16), .direction(0), .distance(Ex_shifter_input), .result(shift_result));	
		
	mux2_1_multibits toALU1(.out(intermediate), .in0(Ex_ReadData2), .in1(SE_Daddr9), .control(Ex_ALUSrc));
	
	mux2_1_multibits toALU2(.out(intermediate2), .in0(intermediate), .in1(SE_Imm12), .control(Ex_ALUSrc2)); 

	mux2_1_multibits toALU3(.out(intermediate3), .in0(intermediate2), .in1(shift_result), .control(Ex_Movz_control));	// Movz_control
	
	genvar i;
	generate
	for (i = 0; i < 4; i++) begin: eamovk
		mux2_1_multibits#(16) multi_movk_cntrl(.out(B[16*i+15:16*i]), .in0(intermediate3[16*i+15:16*i]),
															.in1(Ex_Imm16), .control(Ex_Movk_control[i]));
	end
	endgenerate	

	EXMEM EXMEM_register(.clk, .Ex_MemWE, .Ex_Mem2Reg, .Ex_RegWE,.Ex_data(result),.Ex_Rd,.Ex_ReadData2,.Ex_xfer_size,
								.Ex_LDURB_control,
								.Mem_MemWE, .Mem_Mem2Reg, .Mem_RegWE,.Mem_data,.Mem_Rd,.Mem_ReadData2,.Mem_xfer_size,
								.Mem_LDURB_control);	
	
	datamem memory (.address(Mem_data), .write_enable(Mem_MemWE), .read_enable(1), .write_data(Mem_ReadData2), 
						 .clk, .xfer_size(Mem_xfer_size), .read_data(mem_to_register));
	
	Unsigned_SE#(8) membyteSE (.SE_out(mem_byte_extend),.in(mem_to_register[7:0]));
	
	mux2_1_multibits memoutbranch(.out(mod_mem_to_reg), .in0(mem_to_register), .in1(mem_byte_extend), .control(Mem_LDURB_control));	
	
	mux2_1_multibits toRegister(.out(memmux_result), .in0(Mem_data), .in1(mod_mem_to_reg), .control(Mem_Mem2Reg));
	
	MemWR MemWR_register(.clk,.Mem_RegWE,.Wr_RegWE,.Mem_Rd,.Wr_Rd,.Mem_data(memmux_result),.Wr_data);
	
endmodule


`timescale 1ns/10ps
module processor_testbench();
	
	parameter ClockDelay = 5000;	
	
	logic negative, zero, overflow, carry_out;
	logic [63:0] result;
	logic [4:0] 	ReadRegister1, ReadRegister2, WriteRegister,intoReadRegister2;
	logic [63:0]	ReadData1, ReadData2;	
	logic [63:0]	WriteData;
	logic 			clk, reset;
	logic MemWrite;
	logic [63:0] mem_to_register;
	logic MemToReg;
	logic [15:0] Imm16;
	logic [3:0] Movk_control;
	logic Movz_control,LDURB_control;
	logic [5:0] shifter_input;	
	logic [31:0][63:0] register_to_multiplexor; // read all registers	
	
	processor dut(.ReadData1, .ReadData2, .result, .negative, .zero, .overflow, .carry_out, 
					  .WriteData, .clk, .reset,.ReadRegister1, .ReadRegister2, .WriteRegister,
					  .intoReadRegister2,.MemWrite,.mem_to_register,.MemToReg,.Movk_control,
					  .Imm16,.Movz_control,.shifter_input,.LDURB_control,.register_to_multiplexor);

	initial $timeformat(-9, 2, " ns", 10);
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	integer i;
	initial begin
			reset <= 1; @(posedge clk);
		for (i=0; i <= 1024; i = i + 4) begin
			reset <= 0;
			@(posedge clk); 
		end
		$stop;
	end	
endmodule