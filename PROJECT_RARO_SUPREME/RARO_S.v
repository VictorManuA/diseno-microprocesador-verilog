module RARO_S (
    input [5:0] DIR_OR,
    input [5:0] DIR_AR,
    input [31:0] DATA_R,
    input WRITE_R,
    input [3:0] OP_R,
    output [31:0] RESULTADO_R,
    output ZERO_R
);
wire [31:0] C1, C2;
ROM rom (
    .DIR_ROM(DIR_OR),
    .DOUT_ROM(C1));
RAM ram (
    .DIR_RAM(DIR_AR),
    .DATA_RAM(DATA_R),
    .WRITE_RAM(WRITE_R),
    .DOUT_RAM(C2)
);
MIPSALU alu (
    .A_ALU(C1),
    .B_ALU(C2),
    .SELEC_ALU(OP_R),
    .OUT_ALU(RESULTADO_R),
    .ZERO_ALU(ZERO_R)
);
endmodule