module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] temp1, temp2;
    always @(posedge clk) begin
        //temp1 <= {32{reset}};
    	temp2 <= in;
    end
    
    always @(posedge clk)
        out <= (~{32{reset}}) & (out | (temp2 & ~in));
        
        //out <= (~temp1) & (out | (temp2 & ~in));
        
endmodule