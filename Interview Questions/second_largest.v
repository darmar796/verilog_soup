// Given a clocked sequence of unsigned values, 
// output the second-largest value seen so far in the sequence. 
// If only one value is seen, then the output (dout) should equal 0.
// Note that repeated values are treated as separate candidates for being the second largest value.
// When the reset-low signal (resetn) goes low, all previous values seen in the input sequence should
// no longer be considered for the calculation of the second largest value, 
// and the output dout should restart from 0 on the next cycle.

module model #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

reg [DATA_WIDTH-1:0] max_value; // track max value

always @ (posedge clk) begin
  if (~resetn) begin // synchrounous active low reset
     dout <= 32'd0; // reset tracking of 2nd largest e.g. dout
     max_value <= 32'd0; // reset the tracking of max value
  end
  else begin
    if (din < max_value && din >= dout) begin
      dout <= din; // 2nd largest value 
      max_value <= max_value;  // max value unchanged
    end
    else if (din >= max_value) begin
      dout <= max_value; // 2nd largest value (old max value is now 2nd)
      max_value <= din; // update new max value
    end
    else begin  // e.g. din < dout
      dout <= dout;  // unchanged
      max_value <= max_value; // unchanged
    end
  end
end

endmodule