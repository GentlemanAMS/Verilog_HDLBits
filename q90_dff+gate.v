module top_module (
    input clk,
    input in, 
    output out);
    wire temp = in ^ out;
    always @(posedge clk)
        out <= temp;
endmodule