`timescale 1ns/1ns
module visual_check;
reg [19:0] instruccion; wire [31:0] DD; wire ZF; integer errors;
BBVA uut(.instruccion(instruccion),.DW(32'd0),.DD(DD),.ZF(ZF));
initial begin errors=0;
instruccion=20'b00101000100001100000; #99; if(DD !== 32'h0000001E || ZF !== 1'b0) begin errors=errors+1; $display("FAIL case 0 DD=%h ZF=%b",DD,ZF); end #1;
instruccion=20'b00100000100001100000; #99; if(DD !== 32'h0000001E || ZF !== 1'b0) begin errors=errors+1; $display("FAIL case 1 DD=%h ZF=%b",DD,ZF); end #1;
instruccion=20'b01100000110001000000; #99; if(DD !== 32'h0000000A || ZF !== 1'b0) begin errors=errors+1; $display("FAIL case 2 DD=%h ZF=%b",DD,ZF); end #1;
instruccion=20'b01100000100001000000; #99; if(DD !== 32'h00000000 || ZF !== 1'b1) begin errors=errors+1; $display("FAIL case 3 DD=%h ZF=%b",DD,ZF); end #1;
instruccion=20'b00000000100001100000; #99; if(DD !== 32'h00000000 || ZF !== 1'b1) begin errors=errors+1; $display("FAIL case 4 DD=%h ZF=%b",DD,ZF); end #1;
instruccion=20'b00010000100001100000; #99; if(DD !== 32'h0000001E || ZF !== 1'b0) begin errors=errors+1; $display("FAIL case 5 DD=%h ZF=%b",DD,ZF); end #1;
instruccion=20'b11000000100001100000; #99; if(DD !== 32'hFFFFFFE1 || ZF !== 1'b0) begin errors=errors+1; $display("FAIL case 6 DD=%h ZF=%b",DD,ZF); end #1;
instruccion=20'b01110000100001100000; #99; if(DD !== 32'h00000001 || ZF !== 1'b0) begin errors=errors+1; $display("FAIL case 7 DD=%h ZF=%b",DD,ZF); end #1;
instruccion=20'b01110000110001000000; #99; if(DD !== 32'h00000000 || ZF !== 1'b1) begin errors=errors+1; $display("FAIL case 8 DD=%h ZF=%b",DD,ZF); end #1;
instruccion=20'b01110001100001000000; #99; if(DD !== 32'h00000001 || ZF !== 1'b0) begin errors=errors+1; $display("FAIL case 9 DD=%h ZF=%b",DD,ZF); end #1;
instruccion=20'b00100001100000100000; #99; if(DD !== 32'h00000000 || ZF !== 1'b1) begin errors=errors+1; $display("FAIL case 10 DD=%h ZF=%b",DD,ZF); end #1;
$display("VISUAL_CHECK cases=11 errors=%0d",errors); $stop;
end
endmodule
