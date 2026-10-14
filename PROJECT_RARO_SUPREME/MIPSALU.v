module MIPSALU (
    input [3:0] SELEC_ALU,
    input [31:0] B_ALU,
    input [31:0] A_ALU,
    output reg [31:0] OUT_ALU,
    output ZERO_ALU
);
    assign ZERO_ALU = (OUT_ALU==0);
    always @(SELEC_ALU, A_ALU, B_ALU) begin
        case (SELEC_ALU)
            0:OUT_ALU <= A_ALU & B_ALU; 
            1:OUT_ALU <= A_ALU | B_ALU; 
            2:OUT_ALU <= A_ALU + B_ALU; 
            6:OUT_ALU <= A_ALU - B_ALU; 
            7:OUT_ALU <= ($signed(A_ALU) < $signed(B_ALU)) ? 1 : 0;
            12:OUT_ALU <= ~(A_ALU|B_ALU); 
            default: OUT_ALU <= 0; 
        endcase
    end
endmodule
