// Ones counter
// Given an input binary value, output the number of bits that are equal to 1.

module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);

integer i; // used in for loop to solve this for any DATA_WIDTH

always @ (din) begin

  dout = 0; // initialize count

  for (i = 0; i < DATA_WIDTH; i = i + 1) begin
    dout = dout + din[i];  // note that when bit is 1, count will increase by 1
  end
end

endmodule
