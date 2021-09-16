module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    genvar i;
    wire [3:0] input_values;
    assign input_values = {KEY[3],LEDR[3:1]};
    generate
        for (i = 0; i < 4; i++) begin: asdasdasdasd
            MUXDFF instance1 (.clk(KEY[0]), 
                              .enable(KEY[1]), 
                              .load(KEY[2]), 
                              .load_data(SW[i]), 
                              .input_data(input_values[i]), 
                              .data(LEDR[i])        );

        end
    endgenerate
    
endmodule

module MUXDFF (
	input clk,
    input enable,
    input load,
    input load_data,
    input input_data,
    output reg data);
	
    wire temp1, temp2;
    assign temp1 = enable ? input_data : data;
    assign temp2 = load ? load_data : temp1;
    always @(posedge clk) begin
        data <= temp2; end
endmodule