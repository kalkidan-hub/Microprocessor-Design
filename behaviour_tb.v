`include "behavior.v"
module adder_tb;

// Inputs
reg [7:0] a;
reg [7:0] b;

// Outputs
wire [7:0] sum;

// Instantiate module
adder ad(
  .a(a),
  .b(b),
  .sum(sum)
);

// Clock generation
reg clk = 0;
always #5 clk = ~clk;

// Test case
initial begin
  // Test input values
  a = 8'b01010101;
  b = 8'b10101010;

  // Wait a few clock cycles for stability
  #10;

  // Check output value
  if (sum !== 8'b11111111) begin
    $display("Test failed! Expected sum to be 8'b11111111 but got %b", sum);
  end else begin
    $display("Test passed!");
  end

  // End simulation
  $finish;
end

endmodule
