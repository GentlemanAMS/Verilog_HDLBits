module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    reg [3:0] q;
    
    always @(posedge clk) begin
        if(resetn == 1'b0) begin
            q <= 4'd0; end
        else begin
            q[3:1] <= q[2:0];
            q[0] <= in; end
    end
    assign out = q[3];
           
            
            
endmodule