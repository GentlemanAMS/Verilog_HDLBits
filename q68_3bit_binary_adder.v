module bit1fulladder (input a, input b, input cin, output cout, output sum);
    assign sum = a ^ b ^ cin;
    assign cout = a & b | cin & (a ^ b);
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    reg [3:0] cout_temp;
    
    assign cout_temp[0] = cin;
    genvar i;
    
    generate
        for (i = 0; i < $bits(a); i = i+1) begin: assasdasd
            bit1fulladder instance1 (.a(a[i]), .b(b[i]), .cin(cout_temp[i]), .sum(sum[i]), .cout(cout_temp[i+1]));
        end
	    assign cout = cout_temp[3:1];        
    endgenerate
endmodule