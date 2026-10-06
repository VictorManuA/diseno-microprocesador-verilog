module ALU (
    input [3:0] SELEC,
    input [31:0] B,
    input [31:0] A,
    output reg [31:0] OUT_ALU,
    output zero
);
    assign zero = (OUT_ALU==0);
    always @(SELEC, A, B) begin
        case (SELEC)
            0:OUT_ALU <= A & B; 
            1:OUT_ALU <= A | B; 
            2:OUT_ALU <= A + B; 
            6:OUT_ALU <= A - B; 
            7:OUT_ALU <= A < B ? 1 : 0; 
            12:OUT_ALU <= ~(A|B); 
            default: OUT_ALU <= 0; 
        endcase
    end

endmodule
