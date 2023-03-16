module startSimple
    (
        in_o, in_tw,in_thr,in_buss,out_o,out_tw
    );
    input in_o,in_tw,in_thr,in_buss;
    output out_o,out_tw;
    wire in_bus;

    assign in_bus = {{in_buss}};
    assign out_o = in_o & in_tw & ~in_bus;
    assign out_tw = in_tw | in_thr | in_bus;

endmodule