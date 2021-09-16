module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire temp1, temp2, temp3;
    wire [15:0] sum1, sum2;
    add16 instance1 (.a(a[15:0]), .b(b[15:0]), .sum(sum[15:0]), .cin(1'b0), .cout(temp1));
    add16 instance2 (.a(a[31:16]), .b(b[31:16]), .sum(sum1), .cin(1'b0), .cout(temp2));
    add16 instance3 (.a(a[31:16]), .b(b[31:16]), .sum(sum2), .cin(1'b1), .cout(temp3));
    
    always @(*) begin
        case(temp1)
            1'b0: sum[31:16] = sum1;
            1'b1: sum[31:16] = sum2;
        endcase
    end
endmodule