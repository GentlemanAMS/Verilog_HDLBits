module top_module (
    input clk,
    input reset,
    output [3:0] q);
	
    always @(posedge clk) begin
        if (reset == 1'b1) q <= 4'b0001;
        else if (q == 4'b1010) q <= 4'b0001;
        else q <= q + 1;
    end
    
endmodule