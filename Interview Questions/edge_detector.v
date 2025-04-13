// Build a circuit that pulses dout one cycle after the rising edge of din.
// A pulse is defined as writing a single-cycle 1 as shown in the examples below. 
// When resetn is asserted, the value of din should be treated as 0.

// Bonus - can you enhance your design to pulse dout on the same cycle as the rising edge?
// Note that this enhancement will not pass our test suite, but is still a useful exercise.

module model (
  input clk,
  input resetn,
  input din,
  output dout
);

reg pulse;  // track pulse value
reg previous_din; // track previous data in value

always @ (posedge clk)
  if (~resetn) begin  // synchronous active low reset
    pulse <= 0;  // reset pulse to 0
    previous_din <= 0; // reset tracking of previous data in value
  end
  else if (din > previous_din) begin  // e.g. rise edge occured 0->1 transition
    pulse <= 1;  // pulse is high
    previous_din <= din; // update previous_din with new din
  end
  else begin  // e.g. rise-edge did not occur 1->1, 0->0, or 1-0 transition 
    pulse <= 0; // pulse is low
    previous_din <= din; // update previous_din with new din
  end

assign dout = pulse; // final output // pulse dout one cycle after the rising edge of din
// assign dout = (din && (~previous_din)) ? 1 : 0; // Bonus Question: pulse dout on the same cycle as the rising edge

endmodule