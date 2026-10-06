module RAMSNDROM(
    input [5:0] DROM,
    input [5:0] DRAM,
    input WRITE,
    input [31:0] DATAIN,
    input [3:0] OP,
    output [31:0] RESULT,
    output ZERO
);

wire [31:0] C1, C2;

ROM romin (
    .DIR_ROM(DROM),
    .DATA_ROM(C1));
RAM ramin (
    .DIR(DRAM),
    .DataIN(DATAIN),
    .write(WRITE),
    .DataOUT(C2)
);
ALU alumin (
    .A(C1),
    .B(C2),
    .SELEC(OP),
    .OUT_ALU(RESULT),
    .zero(ZERO)
);

endmodule
