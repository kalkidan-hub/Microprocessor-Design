////////////////////////////////////////////////////////////////////////////////////////
// the counter program,, uses start and stop signal to operate -count.
// since we're using 16bit register, it resets to 0 when the limit reaches, which is 5'h10000
// the output will be the value of a count register.
//////////////////////////////////////////////////////////////////////////////////////


module SRCounter
    (
        start, stop,reset, clk, count
    );
    input start, stop, clk, reset;
    output [3:0] count;

    reg cn_enable;
    reg [3:0] count;
    reg stop_d1;

   
    always @(posedge clk or posedge reset)
    begin
        if(reset)begin
            cn_enable <= 1'b0;
            count <= 4'h0;
            stop_d1 <=stop;
        end 
        else begin
            if(start)begin
                cn_enable <= 1'b1;
            end
            else if(stop)begin
                stop_d1 <= stop;
            end
            else if(cn_enable && count == 5'h10000) begin
                count <= 1'b0;
            end
            else if(cn_enable)begin
                count = count + 1;
            end
            
        end
    end

  

endmodule
