module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

	
    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        if (state == B & in == 1'b1) next_state = B;
        else if (state == B & in == 1'b0) next_state = A;
        else if (state == A & in == 1'b0) next_state = B;
        else if (state == A & in == 1'b1) next_state = A;
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (areset == 1'b1) begin
            state <= B; end
        else begin
            state <= next_state; end
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == B) ? 1'b1 : 1'b0;
    
        

endmodule