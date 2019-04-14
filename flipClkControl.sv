module flipClkControl(flpClkSignal,Reg_Rn,Reg_Rm,Wr_Rd,Wr_RegWE);
	
	input logic Wr_RegWE;
	input logic [4:0] Reg_Rn,Reg_Rm,Wr_Rd;
	output logic flpClkSignal;


	always_comb begin
		flpClkSignal = 0;
		if (Wr_RegWE == 1) begin	
			if(Wr_Rd == Reg_Rn) begin
				flpClkSignal = 1;
			end
			if(Wr_Rd == Reg_Rm) begin
				flpClkSignal = 1;
			end
		end
	end
endmodule