module dff (input clk, input d, output q);
    always @(posedge clk)
        q <= d;
endmodule

module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
	genvar i;
    generate
        for (i=0; i<8;i++) begin: sasdas
            dff dffinstance(.clk(clk), .q(q[i]), .d(d[i]));
        end
    endgenerate
endmodule