module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] btemp;
    wire temp1, temp2;
    assign btemp = b ^ ({32{sub}});
    add16 instance1 (.a(a[15:0]), .b(btemp[15:0]), .sum(sum[15:0]), .cin(sub), .cout(temp1));
    add16 instance2 (.a(a[31:16]), .b(btemp[31:16]), .sum(sum[31:16]), .cin(temp1), .cout(temp2));

endmodule
