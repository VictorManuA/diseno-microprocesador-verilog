module RAM (
    input [31:0] DATA_RAM,
    input [5:0] DIR_RAM,
    input WRITE_RAM,
    output reg [31:0] DOUT_RAM
);
reg [31:0] mem [0:63];
always @(*)begin
     if (WRITE_RAM==1) 
    begin
        mem[DIR_RAM] <= DATA_RAM;
    end
    else 
    begin
        assign DOUT_RAM = mem[DIR_RAM];
    end
end
initial begin
    $readmemb("memram",mem);
end
endmodule

