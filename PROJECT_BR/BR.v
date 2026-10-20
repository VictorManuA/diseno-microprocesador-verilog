module banco_registros (
    input wire WE,         
    input wire [4:0] AR1, 
    input wire [4:0] AR2,  
    input wire [4:0] AW,    
    input wire [31:0] DW,  
    output wire [31:0] DR1, 
    output wire [31:0] DR2  
);
    reg [31:0] registros [0:31];

//NOSE SI LO UTILIZAREMOS
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            registros[i] = 32'd0;
        end
    end
    assign DR1 = (AR1 == 5'd0) ? 32'd0 : registros[AR1];
    assign DR2 = (AR2 == 5'd0) ? 32'd0 : registros[AR2];
    always @(*) begin
        if (WE == 1'b1 && AW != 5'd0) begin
            registros[AW] = DW;
        end
    end
    
endmodule