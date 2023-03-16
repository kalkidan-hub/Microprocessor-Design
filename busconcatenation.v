module equalCheck
    (
        x,y,out
    );
    input [3:0] x;
    input [3:0] y;

    output [5:0] out;
    // wire xoring;

    // assign xoring = {
    //     (x[2] ^ x[1]),
    //     (x[1] ^ y[1]),
    //     (x[0] ^ y[0])
    // };
    // assign out = xoring;

    assign out = {
        y[3:2],
        (x[3] & y[1]),
        (x[2] & y[0]),
        x[1:0]
    };


endmodule