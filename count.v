////////////////////////////////////////////////////////////////////////////////////////
// the counter program,, uses start and stop signal to operate -count.
// since we're using 4bit register, it resets to 0 when the limit reaches, which is 15
// the output will be the signal to a count register, and the stop signal
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

    /*
    // SR flop
    always @(posedge clk or posedge reset)
    begin
       if(reset | stop)begin
        cn_enable <= 1'b0;
       end
       else if(start)begin
        cn_enable <= 1'b1;
       end

    // count
    
        if (reset | count == 4'hF)begin
            count <= 4'h0;
        end
        else if(cn_enable)begin
            count = count + 1;
        end
   
    // stop
    
        if(reset | stop)begin
            stop_d1 <= 1'b1;
        end
        else begin
            stop_d1 <= 1'b0;
        end

    end
    */
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
            else if(cn_enable && count == 4'hF) begin
                count <= 1'b0;
            end
            else if(cn_enable)begin
                count = count + 1;
            end
            
        end
    end

  

endmodule
