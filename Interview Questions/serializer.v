module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  input din_en,
  output logic dout
);

reg [DATA_WIDTH-1:0] buffer;
assign dout = buffer[0];

always @ (posedge clk) begin
  if (~resetn) begin // synchrounous active low reset
     buffer <= 16'd0; // flush buffer with 0 data
  end
  else begin
    if (din_en) begin // load state
      buffer <= din; // load new din
    end
    else begin  // e.g. din < dout  // the value was smaller than the current 2nd largest value
      buffer <= buffer >> 1;  // shift right with 0 pad
    end
  end
end

endmodule