`include "gate.v"
module gate_tb;
    reg a,b,c,d,e;
    wire y;

    theGate test1(a,b,c,d,e,y);
    initial 
        begin
            $dumpfile("gate_tb.vcd");
            // $dumpvars(0,gate_tb);
            a = 1; b = 1; c = 1; d = 1; e = 1;
            #1
            a = 0; b = 1; c = 1; d = 1; e = 1;
            #1
            a = 1; b = 0; c = 1; d = 1; e = 1;
        end

endmodule