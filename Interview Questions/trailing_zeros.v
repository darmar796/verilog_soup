// Count Trailing Zeros Example
// Find the number of trailing 0s in the binary representation of the input (din).
// If the input value is all 0s, the number of trailing 0s is the data width (DATA_WIDTH)

module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);

integer i;
reg  [$clog2(DATA_WIDTH):0] idx;
reg [DATA_WIDTH-1:0] din_adj;

// isolate 1st occuring 1 by itself
// the index/bit position of this 1st occuring 1 is the count
// handle corner cases, when din=0 result is DATA_WIDTH, when din[0]=1 result is 0
assign dout = (din_adj == 0) ? DATA_WIDTH : (din_adj == 1) ? 0 : idx;

always @ (din) begin
  idx = 32'b0; // initialized idx to 0

  /* 
  ~din: This inverts all the bits in the din, flipping 0s to 1s and 1s to 0s.
  ~din + 1: Adding 1 to the inverted din has the effect of clearing all the bits
   to the left of the least significant high bit and setting the LSB to 1.
  din & (~din + 1): The bitwise AND operation between the original value 
  and this modified value isolates the LSB. 
  */
  // basically find the negative value (e.g. 2's complement)
  // bitwise and the original value with 2's complement value
  din_adj = din & (~din + 1);  // this will isolate 1st occuring 1 (LSB)

  for (i = 0; i < DATA_WIDTH; i = i + 1) begin
    idx = idx + ((din_adj[i]) ? i : 0);  // identify index of 1st occuring 1
  end
end

endmodule
