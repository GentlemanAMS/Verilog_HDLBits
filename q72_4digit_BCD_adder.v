module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    reg [4:0] cout_temp;
    assign cout_temp[0] = cin;
    genvar i;
    generate
        for (i=0;i<$bits(a)/4;i=i+1) begin: asadasad
            bcd_fadd instance1(.a(a[4*i+3-:4]), .b(b[4*i+3-:4]), .cin(cout_temp[i]), .sum(sum[4*i+3-:4]), .cout(cout_temp[i+1]));
        end
    endgenerate
    assign cout = cout_temp[4];
        
endmodule