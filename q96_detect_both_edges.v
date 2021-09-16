module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] temp;
    always @(posedge clk) begin
        temp <= in;
        anyedge <= in & ~temp | temp & ~in;
    end
endmodule