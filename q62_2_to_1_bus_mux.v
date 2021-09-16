module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
    assign out = a & ~{100{sel}} | b & {100{sel}};
endmodule
