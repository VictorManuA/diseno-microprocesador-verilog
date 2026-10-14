module ROM (
    input [5:0] DIR_ROM,
    output [31:0] DOUT_ROM
);
reg [31:0] mem [0:63];
assign DOUT_ROM = mem [DIR_ROM];    
initial begin
    $readmemb("memrom",mem);
end
endmodule