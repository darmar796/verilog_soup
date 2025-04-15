// one hot values have a single bit that is 1 
// with all other bits being a 0
// output a 1 if the input din is a one-hot value, 0 otherwise

module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);
  
reg [DATA_WIDTH-1:0] count_ones;

integer i;

always @ (din) begin
  count_ones = 0; // initialize count of 1s to 0
  for (i = 0; i < DATA_WIDTH; i = i + 1) begin
    count_ones = count_ones + din[i];  // count all 1s in din
  end
end

assign onehot = (count_ones == 1) ? 1 : 0;  // one-hot=1 if count is 1, 0 otherwise

endmodule
