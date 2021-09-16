module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] temp;
    always @(posedge clk)
    	temp <= in;
    
    always @(posedge clk)
        pedge <= in & ~temp;
endmodule
