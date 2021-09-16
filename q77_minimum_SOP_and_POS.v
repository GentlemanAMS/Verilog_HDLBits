module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    assign out_pos = (c) & (d | ~b) & (d | ~a);
    assign out_sop = (c & d) | (~a & ~b & c);
endmodule