`timescale 1ns/1ns
module BBVA_TB();

reg [19:0]instruccion;
wire [31:0]DD;
wire ZF;

BBVA BBVA_TB(.DD(DD),.instruccion(instruccion),.ZF(ZF));

initial
begin
	instruccion=20'b00101000100001100000; #100;
	$stop;
end 
endmodule
