module fulladder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;
    assign sum = a ^ b ^ cin;
    assign cout = a & b | cin & (a ^ b);
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    reg [100:0] cin_temp;
	genvar i;
    generate
        assign cin_temp[0] = cin;
        for (i = 0; i < 100; i++) begin : asdasda
            fulladder instances (.a(a[i]), .b(b[i]), .cin(cin_temp[i]), .sum(sum[i]), .cout(cout[i]) );
            assign cin_temp[i+1] = cout[i];
        end
    endgenerate
endmodule
