// Fibonacci Generator
// outputs sequence 1,1,2,3,5,8,13,etc

module model #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);

reg [DATA_WIDTH-1:0] sum; // sum accumulator
reg [DATA_WIDTH-1:0] prev_sum; 
assign out = prev_sum; // output is previus sum, 
// use prev_sum because sequence is: 1,1,2,3,5...
// if sum is used the output will be wrong 1,2,3,5, etc

always @ (posedge clk) begin
  if (~resetn) begin // synchrounous active low reset
    sum <= 32'd1; // restart from 1
    prev_sum <= 32'd1;
  end
  else begin
    prev_sum <= sum; // update previus sum
    sum <= sum + prev_sum; // update new sum
  end
end
endmodule