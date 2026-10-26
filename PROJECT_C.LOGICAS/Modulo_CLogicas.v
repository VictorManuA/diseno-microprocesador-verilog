module compuertas_logcas (
    input A,  
    input B,
    output AND,
    output OR,
    output NOT,
    output NAND,
    output NOR,
    output XOR,
    output XNOR
);

assign AND= A & B; 
assign OR= A | B; 
assign NOT= ~A; 
assign NAND= ~(A & B); 
assign NOR= ~(A | B); 
assign XOR= A ^ B; 
assign XNOR= ~(A ^ B);
    
endmodule
