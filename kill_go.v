// state machine
module kill_go
    (
        go,kill,clk,reset,done
    );
    input go,kill,clk,reset;
    output done;

    reg [1:0] state_reg;
    reg [7:0] cn;
    reg done;

    parameter idle = 2'b00 ;
    parameter active = 2'b01;
    parameter abort = 2'b10;
    parameter finish = 2'b11;


    
    always @(posedge clk or posedge reset)
    begin
        // state machine
        if(reset)begin
            state_reg <= idle;
            cn <= 7'd0;
            done <= 1'b0;
        end
        else  begin
            case (state_reg)
                idle:
                    if(go) state_reg <= active;

                active:
                    if(kill) state_reg <= abort;
                    else if(cn == 7'd100 && ~kill) state_reg <= finish;
                finish:
                    state_reg <= idle;              
                abort:
                    if(~kill) state_reg <= idle;
                default: state_reg <= idle;
            endcase
        end

    // count
   
        if(state_reg == active) begin
            cn = cn + 1;
        end
        else begin
            cn <= 7'd0;
        end
    // done
    
        if(state_reg == finish)begin
            done <= 1'b1;
        end
        else begin
            done <= 1'b0;
        end
    end

endmodule