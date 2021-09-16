module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  
    
    parameter OFF=1'b0, ON=1'b1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        if (state == OFF & j == 1'b1) next_state = ON;
        else if (state == OFF & j == 1'b0) next_state = OFF;
        else if (state == ON & k == 1'b0) next_state = ON;
        else if (state == ON & k == 1'b1) next_state = OFF;
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (areset == 1'b1) begin
            state <= OFF; end
        else begin
            state <= next_state; end
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == ON) ? 1'b1 : 1'b0;


endmodule