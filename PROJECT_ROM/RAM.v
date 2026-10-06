module RAM (
    input [31:0] DataIN,
    input [5:0] DIR,
    input write,
    output reg [31:0] DataOUT
);

reg [31:0] mem [0:63];
    

always @(*)begin
     if (write==1) 
    begin
        mem[DIR] <= DataIN;
    end
    else 
    begin
        DataOUT = mem[DIR];
    end
end

initial begin
    $readmemb("DATA_RAM",mem);
end
endmodule


