module branchControl(CBZ_zeroFlag, pcToReg,Reg_instruction, Ex_instruction, PC_Src,pc_branch_address,
							zero_flag,carry_out,overflow,negative,clk);
	input logic CBZ_zeroFlag;
	input logic zero_flag,carry_out,overflow,negative,clk;
	input logic [63:0] pcToReg;
	input logic [31:0] Reg_instruction,Ex_instruction;
	output logic [63:0] pc_branch_address;
	output logic PC_Src;
	logic stored_zero, stored_negative,stored_carry_out,stored_overflow;
	logic [18:0] iin_19;
	logic [25:0] iin_26;
	logic UncondBr;
	logic [63:0] SEout;


	always_comb begin
		if (Reg_instruction[31:26] == 6'b000101) begin // B
			PC_Src = 1;
			iin_19 = 19'bx;
			iin_26 = Reg_instruction[25:0];
			UncondBr = 1;
		end else if (Reg_instruction[31:24] == 8'hB4) begin // CBZ
			PC_Src = CBZ_zeroFlag;		
			iin_19 = Reg_instruction[23:5];
			iin_26 = 26'bx;	
			UncondBr = 0;
		end else if (Reg_instruction[31:24] == 8'h54 && Reg_instruction[4:0] == 5'h0B) begin // B.LT
			if (Ex_instruction[31:21] == 11'h758 || Ex_instruction[31:21] == 11'h558) begin
				PC_Src = negative;	
			end else begin
				PC_Src = stored_negative;	
			end
			iin_19 = Reg_instruction[23:5];
			iin_26 = 26'bx;	
			UncondBr = 0;			
		end else begin
			PC_Src = 0;		
			iin_19 = 19'bx;
			iin_26 = 26'bx;	
			UncondBr = 1'bx;
		end
	end
	
	SE_to_shifter SE_shifter(.in_19(iin_19),.in_26(iin_26),.UncondBr,.out(SEout));
	adder branch_add (.A(pcToReg), .B(SEout), .result(pc_branch_address));	

	always_ff @(posedge clk) begin
		if (Ex_instruction[31:21] == 11'h758 || Ex_instruction[31:21] == 11'h558) begin // set flag for ADDS and SUBS
			stored_zero <= zero_flag;
			stored_negative <= negative;
			stored_carry_out <= carry_out;
			stored_overflow <= overflow;
		end
	end	
endmodule


			