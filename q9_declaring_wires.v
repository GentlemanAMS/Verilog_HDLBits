`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire temp1, temp2;
    assign temp1 = a & b;
    assign temp2 = c & d;
    assign out = temp1 | temp2;
    assign out_n = ~out;
endmodule