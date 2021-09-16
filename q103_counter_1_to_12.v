module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    /*always @(posedge clk) begin
        if (reset == 1'b1) begin
            //c_load = 1'b1;
            //c_d = 4'b0001;
        	//c_enable = 1'b0; 
        end
        else if (reset == 1'b0 & Q == 4'b1100 & enable == 1'b1) begin
            //c_load = 1'b1;
            //c_d = 4'b0001; 
        	//c_enable = 1'b0; 
        end
        else if (reset == 1'b0 & enable == 1) begin
            //c_load = 1'b0;
            //c_enable = 1'b1;
        end
        else begin
            c_load = 1'b0;
            c_enable = 1'b0;
        end
    end*/
            
    assign c_load = (reset | (~reset)&(Q==4'b1100)&enable );
    assign c_d = (reset | (~reset)&(Q==4'b1100)&enable ) ? 4'b0001 : 4'b0000;
    assign c_enable = enable;
        
    count4 the_counter (clk, c_enable, c_load, c_d, Q );

endmodule



/*module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    always @(posedge clk) begin
        if (reset == 1'b1) begin
            c_load = 1'b1;
            c_d = 4'b0001;
        	c_enable = 1'b0; 
        end
        else if (reset == 1'b0 & Q == 4'b1100 & enable == 1) begin
            c_load = 1'b1;
            c_d = 4'b0001; 
        	c_enable = 1'b0; 
        end
        else if (reset == 1'b0 & enable == 1) begin
            c_load = 1'b0;
            c_enable = 1'b1;
        end
        else begin
            c_load = 1'b0;
            c_enable = 1'b0;
        end
    end
            
        
    count4 the_counter (clk, c_enable, c_load, c_d, Q );

endmodule*/

/*module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    wire [3:0] Q_tmp;
    assign c_enable = enable;
    assign c_d = c_load ? 1 : 0;
    always @(posedge clk) begin
        if(reset) begin
            Q <= 1;
            Q_tmp <= 1;
        end
        else begin
            if(enable) begin
                if(Q == 12) begin
                    Q <= 1;
                    Q_tmp <= 1;
                end
                else begin
                    Q <= Q + 1;
                    Q_tmp <= Q_tmp + 1;
                end
            end
        end
    end
    
    always @(*) begin
        if(reset || (Q == 12 && c_enable)) begin
            c_load <= 1;
        end
        else begin
            c_load <= 0;
        end
    end

    count4 the_counter (clk, c_enable, c_load, c_d, Q_tmp);

endmodule*/
