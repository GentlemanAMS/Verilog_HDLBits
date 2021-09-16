module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~c | d | ~a) & (c | ~d | ~b) & (c | ~a | ~b) & (a | b | ~c | ~d);
endmodule