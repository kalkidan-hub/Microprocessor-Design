module theGate(a,b,c,d,e,y);
    input a,b,c,d,e;
    output y;
    wire w1,w2,w3,w4;
    
    or o1(w1,a,b);
    and a1(w2,c,d);
    not n1(w3,w1);
    or o2(w4,w3,w2);
    and a2(y,w4,e);

endmodule