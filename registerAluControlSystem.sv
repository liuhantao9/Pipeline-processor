module registerAluControlSystem(instruction,Rd,Rm,Rn,Reg2Loc,RegWrite,ALUSrc,ALUSrc2,
										  ALUOp,DAddr9,Imm12,MemWrite,xfer_size,MemToReg,
										  Movk_control,Imm16,Movz_control,shifter_input,LDURB_control);
	input logic [31:0] instruction;
	output logic [4:0] Rd,Rm,Rn;
	output logic Reg2Loc,RegWrite,ALUSrc,ALUSrc2;
	output logic [2:0] ALUOp;	
	output logic [8:0] DAddr9; // output logic for store and load
	output logic [11:0] Imm12; // output for addi	
	output logic MemWrite;
	output logic [3:0] xfer_size; // number of bytes to read 
	output logic MemToReg;	
	output logic [3:0] Movk_control;
	output logic [15:0] Imm16;
	output logic Movz_control,LDURB_control;
	output logic [5:0] shifter_input;
	
	always_comb begin
		if (instruction[31:22] == 10'h244) begin // ADDI
				DAddr9 = 9'bx;
				Imm12 = instruction[21:10]; 
				Imm16 = 16'bx;
				Rn = instruction[9:5];
				Rd = instruction[4:0];
				Rm = 5'bx;
				Reg2Loc = 1'bx;RegWrite = 1;ALUSrc = 1'bx;ALUSrc2 = 1;
				ALUOp = 3'b010 ; // A + B
				MemWrite = 0;xfer_size = 4'bx;MemToReg = 0;	
				Movk_control = 4'b0000; Movz_control = 0;
				shifter_input = 6'bx;
				LDURB_control = 0;
		end else if (instruction[31:21] == 11'h758) begin // SUBS
				DAddr9 = 9'bx;
				Imm12 = 12'bx; 
				Imm16 = 16'bx;
				Rn = instruction[9:5];
				Rd = instruction[4:0];
				Rm = instruction[20:16];
				Reg2Loc = 1;RegWrite = 1;ALUSrc = 0;ALUSrc2 = 0;
				ALUOp = 3'b011 ; // A - B
				MemWrite = 0;xfer_size = 4'bx;MemToReg = 0;		
				Movk_control = 4'b0000; Movz_control = 0;
				shifter_input = 6'bx;
				LDURB_control = 0;
		end else if (instruction[31:21] == 11'h558) begin // ADDS
				DAddr9 = 9'bx;
				Imm12 = 12'bx; 
				Imm16 = 16'bx;
				Rn = instruction[9:5];
				Rd = instruction[4:0];
				Rm = instruction[20:16];
				Reg2Loc = 1;RegWrite = 1;ALUSrc = 0;ALUSrc2 = 0;
				ALUOp = 3'b010; // A + B
				MemWrite = 0;xfer_size = 4'bx;MemToReg = 0;
				Movk_control = 4'b0000; Movz_control = 0;
				shifter_input = 6'bx;
				LDURB_control = 0;
		end else if (instruction[31:24] == 8'hB4) begin // CBZ
				DAddr9 = 9'bx;
				Imm12 = 12'bx;
				Imm16 = 16'bx;	
				Rn = 5'bx;
				Rd = instruction[4:0];
				Rm = 5'bx;
				Reg2Loc = 0;RegWrite = 0;ALUSrc = 0;ALUSrc2 = 0;
				ALUOp = 3'b000; // B pass
				MemWrite = 0;xfer_size = 4'bx;MemToReg = 1'bx;	
				Movk_control = 4'b0000; Movz_control = 0;
				shifter_input = 6'bx;
				LDURB_control = 0;
		end else if (instruction[31:21] == 11'h7C0) begin // STUR
				DAddr9 = instruction[20:12];
				Imm12 = 12'bx; 
				Imm16 = 16'bx;
				Rn = instruction[9:5];
				Rd = instruction[4:0];
				Rm = 5'bx;
				Reg2Loc = 0;RegWrite = 0;ALUSrc = 1;ALUSrc2 = 0;
				ALUOp = 3'b010; // A + B
				MemWrite = 1;xfer_size = 4'b1000;MemToReg = 1'bx;
				Movk_control = 4'b0000; Movz_control = 0;
				shifter_input = 6'bx;	
				LDURB_control = 0;	
		end else if (instruction[31:21] == 11'h7C2) begin // LDUR
				DAddr9 = instruction[20:12];
				Imm12 = 12'bx; 
				Imm16 = 16'bx;
				Rn = instruction[9:5];
				Rd = instruction[4:0];
				Rm = 5'bx;
				Reg2Loc = 0;RegWrite = 1;ALUSrc = 1;ALUSrc2 = 0;
				ALUOp = 3'b010; // A + B
				MemWrite = 0;xfer_size = 4'b1000;MemToReg = 1'b1;	
				Movk_control = 4'b0000; Movz_control = 0;
				shifter_input = 6'bx;
				LDURB_control = 0;
		end else if (instruction[31:23] == 9'b111100101) begin // MOVK
				DAddr9 = 9'bx;
				Imm12 = 12'bx; 
				Imm16 = instruction[20:5];
				Rn = 5'bx;
				Rd = instruction[4:0];
				Rm = 5'bx;
				Reg2Loc = 0;RegWrite = 1;ALUSrc = 0;ALUSrc2 = 0;
				ALUOp = 3'b000; // B Pass
				MemWrite = 0;xfer_size = 4'b1000;MemToReg = 1'b0;
				if (instruction[22:21] == 2'b00) begin
					Movk_control = 4'b0001;	
				end else if (instruction[22:21] == 2'b01) begin
					Movk_control = 4'b0010;
				end else if (instruction[22:21] == 2'b10) begin
					Movk_control = 4'b0100;	
				end else begin
					Movk_control = 4'b1000;
				end
				Movz_control = 0;
				shifter_input = 6'bx;	
				LDURB_control = 0;			
		end else if (instruction[31:23] == 9'b110100101) begin // MOVZ
				DAddr9 = 9'bx;
				Imm12 = 12'bx; 
				Imm16 = instruction[20:5];
				Rn = 5'bx;
				Rd = instruction[4:0];
				Rm = 5'bx;
				Reg2Loc = 0;RegWrite = 1;ALUSrc = 0;ALUSrc2 = 0;
				ALUOp = 3'b000; // B pass
				MemWrite = 0;xfer_size = 4'b1000;MemToReg = 1'b0;
				Movk_control = 4'b0000;
				if (instruction[22:21] == 2'b00) begin // LSL 0
					shifter_input = 6'b000000;	
				end else if (instruction[22:21] == 2'b01) begin // LSL 16
					shifter_input = 6'b010000;
				end else if (instruction[22:21] == 2'b10) begin // LSL 32
					shifter_input = 6'b100000;	
				end else begin	// LSL 48
					shifter_input = 6'b110000;
				end
				Movz_control = 1;	
				LDURB_control = 0;
		end else if (instruction[31:21] == 11'h1C0) begin // STURB
				DAddr9 = instruction[20:12];
				Imm12 = 12'bx; 
				Imm16 = 16'bx;
				Rn = instruction[9:5];
				Rd = instruction[4:0];
				Rm = 5'bx;
				Reg2Loc = 0;RegWrite = 0;ALUSrc = 1;ALUSrc2 = 0;
				ALUOp = 3'b010; // A + B
				MemWrite = 1;xfer_size = 4'b0001;MemToReg = 1'bx;
				Movk_control = 4'b0000; Movz_control = 0;
				shifter_input = 6'bx;
				LDURB_control = 0;
		end else if (instruction[31:21] == 11'h1C2) begin // LDURB
				DAddr9 = instruction[20:12];
				Imm12 = 12'bx; 
				Imm16 = 16'bx;
				Rn = instruction[9:5];
				Rd = instruction[4:0];
				Rm = 5'bx;
				Reg2Loc = 0;RegWrite = 1;ALUSrc = 1;ALUSrc2 = 0;
				ALUOp = 3'b010; // A + B
				MemWrite = 0;xfer_size = 4'b0001;MemToReg = 1'b1;	
				Movk_control = 4'b0000; Movz_control = 0;
				shifter_input = 6'bx;
				LDURB_control = 1;
		end else begin
				Rd = 5'b11111; Rn = 5'b11111; Rm = 5'b111111;
				Reg2Loc = 1;RegWrite = 0;ALUSrc = 0;ALUSrc2 = 0;
				ALUOp = 3'bx; DAddr9 = 9'bx;Imm12 = 12'bx;	
				MemWrite = 0;xfer_size = 4'bx;MemToReg = 0;
				Imm16 = 16'bx;Movk_control = 4'b0000; Movz_control = 0;
				shifter_input = 6'bx;LDURB_control = 0;
		end 			
		end		
endmodule 