module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire t1, t2, t3, t4;
    assign t1 = p2a & p2b;
    assign t2 = p2c & p2d;
    assign t3 = p1a & p1b & p1c;
    assign t4 = p1d & p1e & p1f;
    assign p2y = t1 | t2;
    assign p1y = t3 | t4;

endmodule