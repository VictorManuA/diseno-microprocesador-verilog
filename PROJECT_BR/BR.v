module BR (
    input  WE,         
    input  [4:0] AR1, 
    input  [4:0] AR2,  
    input  [4:0] AW,    
    input  [31:0] DW,  
    output  [31:0] DR1, 
    output  [31:0] DR2  
);
    reg [31:0] registros [0:31];
    
    assign DR1 = registros[AR1];
    assign DR2 = registros[AR2];
    always @(*) begin
        if (WE == 1'b1) begin
            registros[AW] = DW;
        end
    end

initial begin
    $readmemb("data.txt",registros);
end

endmodule