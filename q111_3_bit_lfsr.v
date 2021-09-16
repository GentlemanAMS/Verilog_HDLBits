module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    reg clk;
    always @(*) begin
        clk = KEY[0]; end
    
    always @(posedge clk) begin
        LEDR[0] <= KEY[1] ? SW[0] : LEDR[2];
        LEDR[1] <= KEY[1] ? SW[1] : LEDR[0];
        LEDR[2] <= KEY[1] ? SW[2] : (LEDR[1] ^ LEDR[2]); 
    end
       
endmodule
