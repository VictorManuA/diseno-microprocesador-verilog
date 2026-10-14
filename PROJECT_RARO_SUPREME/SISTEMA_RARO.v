module SISTEMA_RARO (
    input wire [5:0] SELECTOR,
    output [31:0] DD_R,
    output ZERO
);
wire [22:0] L1;

RARO_S raro (
    .DIR_OR(L1[22:17]),        
    .DIR_AR(L1[16:11]),        
    .DATA_R({26'b0, L1[9:4]}),
    .WRITE_R(L1[10]),          
    .OP_R(L1[3:0]),        
    .RESULTADO_R(DD_R),         
    .ZERO_R(ZERO)         
);
ROM_INST rom_inst (
    .SELECTOR(SELECTOR),
    .DOUT_ROM_INST(L1)
);
endmodule
