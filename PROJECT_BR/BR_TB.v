`timescale 1ns/1ns
module BR_TB();

reg [4:0] AR1;
reg [4:0] AR2;
reg [4:0] AW;
reg [31:0] DW;
reg WE;

wire [31:0] DR1;
wire [31:0] DR2;

BR uut(.AR1(AR1), .AR2(AR2), .AW(AW), .WE(WE), .DW(DW), .DR1(DR1), .DR2(DR2));

initial
begin 
	WE =1;
	AW= 5'd5;
	DW =32'H1234_5678;
	AR1= 5'd5;
	AR2 = 5'd0;
	#10;
	
	WE=0;
	AR1=5'd5;
	AR2 =5'd0;
	#10;
	$stop;
end
endmodule