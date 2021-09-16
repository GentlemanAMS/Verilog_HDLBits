module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 

    always @(posedge areset or posedge clk) begin
        if (areset == 1'b1) begin
            q <= 4'd0; end
        else if (load == 1'b1) begin
            q <= data; end
        else if (ena == 1'b1) begin
            q <= {1'b0,q[3:1]}; end        
    
    end
endmodule
