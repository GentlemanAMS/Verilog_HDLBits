module top_module (
    input clk,
    input d,
    output q
);
    reg temp1, temp2;
    
    always @(posedge clk)
        temp1 <= d;
    always @(negedge clk)
        temp2 <= d;
    
    always @(*)
        q = (clk & temp1) | (~clk & temp2);
    
endmodule
