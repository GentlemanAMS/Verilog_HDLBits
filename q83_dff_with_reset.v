module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    wire [7:0] temp;
    always @(posedge clk) begin
        temp = reset ? 1'b0 : d;
        q <= temp;
    end
endmodule