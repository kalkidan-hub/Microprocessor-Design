module adder(input [7:0] a, b, output reg [7:0] sum);

// Declare internal variable
reg [8:0] temp;

// Behavioral modeling
always @(*) begin
   temp = {1'b0, a} + {1'b0, b}; // Pad inputs with a zero
   sum = temp[8:1]; // Extract sum from temp
end

endmodule
