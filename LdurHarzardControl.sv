 module LdurHarzardControl(Mem_RegWE_mod,Mem_RegWE,Mem_Mem2Reg,mem_to_register);
	input logic Mem_Mem2Reg,Mem_RegWE;
	input logic [63:0] mem_to_register;
	output logic Mem_RegWE_mod;

	always_comb begin
		if (Mem_Mem2Reg == 1 && mem_to_register == 64'bX) begin // no data in the memory
			Mem_RegWE_mod = 0;
		end else begin
			Mem_RegWE_mod = Mem_RegWE;
		end
	end
endmodule	