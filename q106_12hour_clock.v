module bcd_oneDigit (
    input clk,
    input reset,
    input enable,
    output reg [3:0] q);
    
    always @(posedge clk) begin
        if (reset == 1'b1) q <= 4'b0000;
        else if (q == 4'b1001 & enable == 1'b1) q<= 4'b0000;
        else if (enable == 1'b1) q <= q + 1'b1;
        else q <= q;
    end
endmodule


module bcd_twoDigit (
    input clk,
    input reset,
    input enable,
    output reg [7:0] q);
    
    wire enable1;
    assign enable1 = (q[3:0] == 4'b1001) ? 1'b1 : 1'b0;
    bcd_oneDigit MSD(.clk(clk), .reset(reset), .enable(enable1 & enable), .q(q[7:4]));
    bcd_oneDigit LSD(.clk(clk), .reset(reset), .enable(enable), .q(q[3:0]));
endmodule

module bcd_twoDigit_hour (
    input clk,
    input enable,
    input reset,
    output reg [7:0] q);
    
    always @(posedge clk) begin
        if (reset == 1'b1) q <= {4'b0001, 4'b0010};
        else if (enable == 1'b1) begin
            if (q == {4'b0000, 4'b1001}) q <= {4'b0001, 4'b0000};
            else if (q == {4'b0001, 4'b0010}) q <= {4'b0000, 4'b0001};
            else q <= {q[7:4], q[3:0] + 1'b1};
        end
        else q <= q;
    end 
endmodule


module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    wire enable3, enable2, enable1, reset3, reset2, reset1; 
    
    bcd_twoDigit_hour hours  (.clk(clk), .reset(reset1), .enable(enable1), .q(hh));
    bcd_twoDigit minutes(.clk(clk), .reset(reset2), .enable(enable2), .q(mm));
    bcd_twoDigit seconds(.clk(clk), .reset(reset3), .enable(enable3), .q(ss));
    
    assign enable3 = ena;
    assign enable2 = (ss[7:4]==4'b0101 & ss[3:0]==4'b1001 & enable3) ? 1'b1 : 1'b0;
    assign enable1 = (mm[7:4]==4'b0101 & mm[3:0]==4'b1001 & enable2) ? 1'b1 : 1'b0;
    
    assign reset3 = reset | (ss[7:4]==4'b0101 & ss[3:0]==4'b1001 & enable3);
    assign reset2 = reset | (mm[7:4]==4'b0101 & mm[3:0]==4'b1001 & enable2);
    assign reset1 = reset;
    
    always @(posedge clk) begin
        if (pm == 1'b0 & enable1 & hh[7:4] == 4'b0001 & hh[3:0] == 4'b0001 & reset == 1'b0)      pm <= 1'b1;
        else if ((pm == 1'b1 & enable1 & hh[7:4] == 4'b0001 & hh[3:0] == 4'b0001) | reset == 1'b1)  pm <= 1'b0;
    end
    
			
    
    
endmodule
