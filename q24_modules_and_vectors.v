module mux4to1v(in1, in2, in3, in4, sel, out);
    input wire [7:0] in1, in2, in3, in4;
    input wire [1:0] sel;
    output wire [7:0] out;
    always @(*) begin
        case (sel)
            2'b00: out = in1;
            2'b01: out = in2;
            2'b10: out = in3;
            2'b11: out = in4;
        endcase
    end
endmodule

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] temp1, temp2, temp3;
    my_dff8 instance1(.clk(clk), .d(d), .q(temp1));
    my_dff8 instance2(.clk(clk), .d(temp1), .q(temp2));
    my_dff8 instance3(.clk(clk), .d(temp2), .q(temp3));
    mux4to1v instance4(.in1(d), .in2(temp1), .in3(temp2), .in4(temp3), .sel(sel), .out(q));
endmodule