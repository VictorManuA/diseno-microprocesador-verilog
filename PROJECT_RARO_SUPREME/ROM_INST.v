module ROM_INST (
    input [3:0] SELECTOR,
    output [22:0] DOUT_ROM_INST
);
reg [22:0] mem [0:15];
assign DOUT_ROM_INST = mem [SELECTOR];    
initial begin
    $readmemb("mem_instrucciones",mem);
end
endmodule








