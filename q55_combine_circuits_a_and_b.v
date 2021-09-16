module IA (input x, input y, output z);
    assign z = (x^y) & x;
endmodule

module IB (input x, input y, output z);
    assign z = (~x & ~y) | (x & y);
endmodule

module top_module (input x, input y, output z);
	wire t1, t2;
    IA instance1(.x(x), .y(y), .z(t1));
    IB instance2(.x(x), .y(y), .z(t2));
    assign z = (t1 & t2) ^ (t1 | t2);
endmodule
