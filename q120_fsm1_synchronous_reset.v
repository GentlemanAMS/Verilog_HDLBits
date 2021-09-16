// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
	parameter A = 1'b1, B = 1'b0; 
    reg present_state, next_state;

    assign out = (present_state == B) ? 1'b1: 1'b0;
    
    always @(posedge clk) begin
        if (reset) begin
            present_state <= B; end
        else begin
            present_state <= next_state; end
    end
    
    always @(*) begin
        if (present_state == B & in == 1'b1) next_state = B;
        else if (present_state == B & in == 1'b0) next_state = A;
        else if (present_state == A & in == 1'b1) next_state = A;
        else if (present_state == A & in == 1'b0) next_state = B;
    end
    
    
endmodule