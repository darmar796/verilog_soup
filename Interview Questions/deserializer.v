// deserializer
// serial data in, parallel data out
// when in reset

module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input din,
  output logic [DATA_WIDTH-1:0] dout
);

reg [DATA_WIDTH-1:0] buffer; //buffer to hold the din
assign dout = buffer; // output is buffer

always @ (posedge clk) begin
  if (~resetn) begin // synchrounous active low reset
     buffer <= 16'd0; // flush buffer with 0 data
  end
  else begin
    buffer <= {buffer[DATA_WIDTH-1:0], din}; // shift in new din
  end
end
endmodule