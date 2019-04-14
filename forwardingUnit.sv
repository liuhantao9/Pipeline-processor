module forwardingUnit(RnControl,RmControl,Reg_Rn,Reg_Rm,Ex_Rd,Mem_Rd,Ex_RegWE,Mem_RegWE);
	
	// control bits for two forward multiplexors
	output logic [1:0] RnControl,RmControl;
	// take RegWrite signals from excution and memory phase resepctively
	input logic Ex_RegWE,Mem_RegWE;
	// gain using registers from instructions
	input logic [4:0] Reg_Rn,Reg_Rm;
	// take the write registers from the previous two cycles
	input logic [4:0] Mem_Rd,Ex_Rd;


	always_comb begin
		RnControl = 2'b00;
		RmControl = 2'b00;
		if (Mem_RegWE == 1 && Mem_Rd != 5'b11111) begin	
			if(Mem_Rd == Reg_Rn) begin
				RnControl = 2'b10;
			end
			if(Mem_Rd == Reg_Rm) begin
				RmControl = 2'b10;
			end
		end
		if (Ex_RegWE == 1 && Ex_Rd != 5'b11111) begin
			// forward from execution phase to reg
			if(Ex_Rd == Reg_Rn) begin
				RnControl = 2'b01;
			end
			if(Ex_Rd == Reg_Rm) begin
				RmControl = 2'b01;
			end
		end
	end

endmodule 