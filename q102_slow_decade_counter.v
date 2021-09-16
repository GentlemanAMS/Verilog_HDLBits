module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @(posedge clk) begin
        if (reset == 1'b1) q <= 4'b0000;
        else if (slowena == 1'b1 & q == 4'b1001) q <= 4'b0000;
        else if (slowena == 1'b1) q <= q + 1;
        else q <= q;
    end
endmodule