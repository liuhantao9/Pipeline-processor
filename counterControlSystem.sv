module flagStoredSystem(UncondBr,BrTaken,in_19, in_26,instruction,zero_flag,carry_out,overflow,negative,clk,
									 Reg_instruction,Ex_instruction,CBZ_zeroFlag);
	output logic UncondBr, BrTaken;
	output logic [18:0] in_19;
	output logic [25:0] in_26;	
	input logic [31:0] instruction,Reg_instruction,Ex_instruction;
	input logic zero_flag, negative,carry_out,overflow,CBZ_zeroFlag;
	input logic clk;
	logic stored_zero, stored_negative,stored_carry_out,stored_overflow;


//	always_comb begin
//		if (Reg_instruction[31:26] == 6'b000101) begin // B
//			BrTaken = 1;
//			UncondBr = 1;
//			in_19 = 19'bx;
//			in_26 = (Reg_instruction[25:0] - 1);
//		end else if (instruction[31:24] == 8'h54 && instruction[4:0] == 5'h0B) begin // B.LT
//			BrTaken = stored_negative;
//			UncondBr = 0;		
//			in_19 = Reg_instruction[23:5];
//			in_26 = 26'bx;
//		end else if (Reg_instruction[31:24] == 8'hB4) begin // CBZ
//			BrTaken = CBZ_zeroFlag;// 
//			UncondBr = 0;		
//			in_19 = (Reg_instruction[23:5]-1);
//			in_26 = 26'bx;		
//		end else begin
//			UncondBr = 0;
//			BrTaken = 0;
//			in_19 = 19'bx;
//			in_26 = 26'bx;
//		end 			
//	end	

	always_ff @(posedge clk) begin
		if (Ex_instruction[31:21] == 11'h758 || Ex_instruction[31:21] == 11'h558) begin // set flag for ADDS and SUBS
			stored_zero <= zero_flag;
			stored_negative <= negative;
			stored_carry_out <= carry_out;
			stored_overflow <= overflow;
		end
	end
endmodule 