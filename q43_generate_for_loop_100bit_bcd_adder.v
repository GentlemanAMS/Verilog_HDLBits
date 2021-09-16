module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	genvar i;
    reg [100:0] cin_temp;
   
    generate
        assign cin_temp[0] = cin;
        for (i = 0; i < 100; i=i+1) begin : asdasdsasda
            bcd_fadd instances (.a(a[4*i+3:4*i]), .b(b[4*i+3:4*i]), .cin(cin_temp[i]), .cout(cin_temp[i+1]), .sum(sum[4*i+3:4*i]) );
        end
	    assign cout = cin_temp[100];

    endgenerate
endmodule
