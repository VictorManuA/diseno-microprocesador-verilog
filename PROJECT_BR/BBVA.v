module BBVA(
    input  [19:0] instruccion,
	input  [31:0] DW,
    output [31:0] DD,
    output        ZF
);
// Separar Sel[19:16], WE[15], AR1[14:10], AR2[9:5] y AW[4:0].
wire [3:0] Sel = instruccion[19:16];
wire WE = instruccion[15];
wire [4:0] AR1 = instruccion[14:10];
wire [4:0] AR2 = instruccion[9:5];
wire [4:0] AW = instruccion[4:0];
// Declarar tres cables de datos de 32 bits.
wire [31:0] c1, c2, c3;
// Instanciar BR y MIPSALU.
BR  a (.WE(WE), .AR1(AR1), .AR2(AR2), .AW(AW), .DW(c3), .DR1(c1), .DR2(c2));
ALU b (.ALUctl(Sel), .A(c1), .B(c2), .ALUOut(c3), .Zero(ZF));
assign DD = c3;
endmodule
