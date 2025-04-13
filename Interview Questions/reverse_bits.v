// Reverse the bits of an input value's binary representation.
module model #(parameter
  DATA_WIDTH=32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

integer i; // used in for loop to solve this for any DATA_WIDTH

always @ (din) begin
  for (i = 0; i < DATA_WIDTH; i = i + 1) begin
    dout[i] = din[DATA_WIDTH-1-i]; // reversal e.g. dout[0] = din[31], dout[1] = din[30]...dout[31]=d[0]
  end

end

endmodule