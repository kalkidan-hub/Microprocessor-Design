// introduction to clock and register usage...
module Dflop
    (
        in_1, in_2,clk,reset,out_1, out_2
    );
    input in_1,in_2,clk,reset;
    output out_1,out_2;
    reg out_1;
    reg out_2;
    wire inter =  in_1 & in_2;

   /*
    always @(posedge clk or negedge clk)
    begin
        if ($rose(clk)) begin
            out_1 <= inter;
        end
        else if($fell(clk)) begin
            out_1 <= 1'b0;
        end
    end
    */ //no multiple edge sensetivity... cool

    // use reset signal.
    always @(posedge clk or posedge reset)
    begin
        if(reset)begin
            out_1 <= 1'b0;
        end
        else if(~reset)begin
            out_2 <= 2'b11;
        end
        else begin
            out_1 <= inter;
        end
    end
endmodule