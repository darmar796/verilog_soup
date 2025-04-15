// Given a stream of input bits, pulse a 1 on the output (dout) 
// whenever a b1010 sequence is detected on the input (din).

// When the reset-low signal (resetn) goes active, 
// all previously seen bits on the input are no longer considered when searching for b1010.

module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

reg [3:0] buffer; // holds last 4-bits of din

assign dout = (buffer == 4'b1010) ? 1 : 0; // dout high if 1010 in the buffer

always @ (posedge clk) begin
  if (~resetn) begin
    buffer <= 0;  // reset buffer
  end
  else begin 
    buffer <= {buffer, din}; // add new din value into the buffer
  end
end

endmodule
