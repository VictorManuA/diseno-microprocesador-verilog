`timescale 1ns/1ps

module tb_RARO_SUPREME;
    
    reg [5:0] SELECTOR;
    wire [22:0] instruccion;
    wire [31:0] DD;
    wire ZF;
    integer i;

    SISTEMA_RARO dut (
        .SELECTOR (SELECTOR),
        .DD_R     (DD),
        .ZERO     (ZF)
    );
    assign instruccion = dut.L1;
    initial begin
        $dumpfile("raro_supreme.vcd");
        $dumpvars(0, tb_RARO_SUPREME);
        $display("Sel | instruccion[22:0]       | DD[31:0]  | ZF");
        
        for (i = 0; i < 16; i = i + 1) begin
            SELECTOR = i[5:0];
            #10;
            $display("%2d  | %023b | %08h | %b", SELECTOR, instruccion, DD, ZF);
        end
        $finish;
    end
endmodule
