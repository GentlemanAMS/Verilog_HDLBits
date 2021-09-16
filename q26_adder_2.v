module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
	wire temp1, temp2;
    add16 instance1 (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(temp1));
    add16 instance2 (.a(a[31:16]), .b(b[31:16]), .cin(temp1), .sum(sum[31:16]), .cout(temp2));
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
	assign sum = a ^ b ^ cin;
    assign cout = a & b | cin & (a ^ b);
endmodule