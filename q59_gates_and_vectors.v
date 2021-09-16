module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    integer i;
    always @(*) begin
        for (i = 0; i < $bits(in)-1; i=i+1) 
            out_both[i] = in[i] & in[i+1];
        for (i = 1; i < $bits(in); i=i+1) 
            out_any[i] = in[i] | in[i-1];
        for (i = 0; i < $bits(in)-1; i=i+1) 
            out_different[i] = in[i] ^ in[i+1];
        out_different[3] = in[3] ^ in[0]; 
    end
endmodule