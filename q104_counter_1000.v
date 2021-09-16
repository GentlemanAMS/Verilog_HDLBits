module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    /*reg [3:0] output1, output2, output3;
    assign c_enable[0] = 1'b1;
    
    bcdcount counter0 (.clk(clk), .reset(reset), .enable(c_enable[0]), .Q(output1));
    always @(posedge clk) begin
        if (output1 == 4'b1001) c_enable[1] = 1'b1;
        else c_enable[1] = 1'b0;
    end
    
    bcdcount counter1 (.clk(clk), .reset(reset), .enable(c_enable[1]), .Q(output2));
    always @(posedge clk) begin
        if (output2 == 4'b1001 & output1 == 4'b1001) c_enable[2] = 1'b1;
        else c_enable[2] = 1'b0;
    end
    
    bcdcount counter2 (.clk(clk), .reset(reset), .enable(c_enable[2]), .Q(output3));
    always @(posedge clk) begin
        if (output3 == 4'b1001 & output2 == 4'b1001 & output1 == 4'b1001) OneHertz <= 1'b1;
        else OneHertz <= 1'b0;
    end*/
    
    reg [3:0] output1, output2, output3;
    bcdcount counter0 (.clk(clk), .reset(reset), .enable(c_enable[0]), .Q(output1));
    bcdcount counter1 (.clk(clk), .reset(reset), .enable(c_enable[1]), .Q(output2));
    bcdcount counter2 (.clk(clk), .reset(reset), .enable(c_enable[2]), .Q(output3));
    
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (output1 == 4'b1001) ? 1'b1 : 1'b0;
    assign c_enable[2] = (output2 == 4'b1001 & output1 == 4'b1001) ? 1'b1 : 1'b0;
    assign OneHertz = (output3 == 4'b1001 & output2 == 4'b1001 & output1 == 4'b1001) ? 1'b1 : 1'b0;
    
endmodule