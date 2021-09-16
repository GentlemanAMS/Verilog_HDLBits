module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
	
    always @(posedge clk) begin
        if (load == 1'b1) begin
            q <= data; end
        else if (ena == 1'b1) begin
            if (amount == 2'b00) begin
                q <= {q[62:0], 1'b0}; end
            else if (amount == 2'b01) begin
                q <= {q[55:0], 8'd0}; end
            else if (amount == 2'b10) begin
                q <= {q[63], q[63:1]}; end
            else if (amount == 2'b11) begin
                q <= {{8{q[63]}}, q[63:8]}; end
        end
        else begin
            q <= q; end
    end
    
endmodule