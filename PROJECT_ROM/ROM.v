module ROM (
    input [5:0] DIR_ROM,
    output [31:0] DATA_ROM
);
reg [31:0] mem [0:63];
assign DATA_ROM = mem [DIR_ROM];    

initial begin
    $readmemb("DATA_ROM",mem);
end
endmodule

