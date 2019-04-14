// no DFF between decoder and regwrite
module regfile(ReadData1, ReadData2, WriteData,flpClkSignal,
					ReadRegister1, ReadRegister2, WriteRegister, RegWrite, clk,register_to_multiplexor);
	
	input logic flpClkSignal;
	input logic [4:0] 	ReadRegister1, ReadRegister2, WriteRegister;
	input logic [63:0]	WriteData;
	input logic 			RegWrite, clk;
	output logic [63:0]	ReadData1, ReadData2;
	logic [31:0] register_enable;
	output logic [31:0][63:0] register_to_multiplexor;
	logic Reg,modclk;

	decoder5_32	decoder (.out(register_enable), .in(WriteRegister), .RegWrite);
	
	mux2_1 clkcontrol(.out(modclk), .i0(clk), .i1(!clk), .sel(flpClkSignal));
	
	genvar i;
	generate
	for(i=0; i < 31; i++) begin : eachRegisters
	multiple_data_pass registers (.out(register_to_multiplexor[i]), .in(WriteData), .enable(register_enable[i]),.clk(modclk), .reset(0));
	end
	endgenerate
	
	assign register_to_multiplexor[31] = 64'b0;
	multiplexor multiplexor1 (.out(ReadData1), .in(register_to_multiplexor[31:0]), .control(ReadRegister1));
	multiplexor multiplexor2 (.out(ReadData2), .in(register_to_multiplexor[31:0]), .control(ReadRegister2));
	endmodule

	
	