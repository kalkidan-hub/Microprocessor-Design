module multiplexer
    (
        in_1, in_2,in_3,x,y,out_1
    );
    input in_1,in_2,in_3,x,y;
    output out_1;
    wire in_bt;

    assign in_bt = x|y;
    assign out_1 = in_bt ? 1:0;
endmodule
