module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);
    always @(posedge ar, posedge clk) 
        q = ar ? 1'b0 : d;
endmodule