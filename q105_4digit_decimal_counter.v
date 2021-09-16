module bcd_oneDigit (
    input clk,
    input reset,
    input enable,
    output reg [3:0] q);
    
    always @(posedge clk) begin
        if (reset == 1'b1) q <= 4'b0000;
        else if (q == 4'b1001 & enable == 1'b1) q<= 4'b0000;
        else if (enable == 1'b1) q <= q + 1;
        else q <= q;
    end
endmodule


module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena[1] = (q[3:0] == 4'b1001) ? 1'b1 : 1'b0;
    assign ena[2] = (q[7:4] == 4'b1001 & q[3:0] == 4'b1001) ? 1'b1 : 1'b0;
    assign ena[3] = (q[11:8] == 4'b1001 & q[7:4] == 4'b1001 & q[3:0] == 4'b1001) ? 1'b1 : 1'b0;

    bcd_oneDigit instance1 (.clk(clk), .reset(reset), .enable(1'b1), .q(q[3:0]));
    bcd_oneDigit instance2 (.clk(clk), .reset(reset), .enable(ena[1]), .q(q[7:4]));
    bcd_oneDigit instance3 (.clk(clk), .reset(reset), .enable(ena[2]), .q(q[11:8]));
    bcd_oneDigit instance4 (.clk(clk), .reset(reset), .enable(ena[3]), .q(q[15:12]));

   
endmodule