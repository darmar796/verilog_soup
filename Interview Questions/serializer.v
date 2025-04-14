// serializer
// parallel data in, serial data out
// din_en loads a new value from din
// loaded value is shifted starting from lsb
// when done shifting the dout is 0
// when in reset, loaded value is set to 0

module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  input din_en,
  output logic dout
);

reg [DATA_WIDTH-1:0] buffer; //buffer to hold the din
assign dout = buffer[0]; // output is lsb

always @ (posedge clk) begin
  if (~resetn) begin // synchrounous active low reset
     buffer <= 16'd0; // flush buffer with 0 data
  end
  else begin
    if (din_en) begin // load state
      buffer <= din; // load new din
    end
    else begin  // shift state
      buffer <= buffer >> 1;  // bit-shift right with 0 pad, update buffer
    end
  end
end

endmodule