module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    always @(posedge areset or posedge clk) 
        q <= areset ? 0: d;
endmodule