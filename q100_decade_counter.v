module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);	
   
    always @(posedge clk) begin
        if (reset == 1'b1) q <= 4'b0000;
        else if (q == 4'b1001) q <= 4'b0000;
        else q <= q + 1;
    end
endmodule
