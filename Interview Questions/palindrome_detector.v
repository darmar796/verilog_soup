//Given an input (din), output (dout) a 1 if its binary representation is a palindrome and a 0 otherwise.
// A palindrome binary representation means that the binary representation has
//the same sequence of bits whether you read it from left to right or right to left. 
// Leading 0s are considered part of the input binary representation.

module model #(parameter
  DATA_WIDTH=32
) (
  input [DATA_WIDTH-1:0] din,
  output logic dout
);

integer i;

reg [DATA_WIDTH-1:0] buffer; // buffer used for comparison result of all bits

assign dout = &buffer;  // and all bits together to find the answer

always @ (din) begin
  for (i = 0; i < DATA_WIDTH; i = i + 1) begin
    buffer[i] = din[i] == din[DATA_WIDTH-1-i]; // din[0] == din[32], din[1] == din[31], etc...
  end
end

endmodule
