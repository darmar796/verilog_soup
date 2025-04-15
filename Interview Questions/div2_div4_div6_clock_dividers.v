// Given an input clock signal, generate three output clock signals with 2x, 4x, and 6x the period of the input clock.

// When resetn is active, then all clocks are reset to 0. 
// When resetn becomes inactive again, all clocks should undergo
// their posedge transition and start an entirely new clock period.
// Specifically this means that if resetn became active in the middle
// of an output clock's period, when resetn becomes inactive the output
// clock should start an entirely new period instead of continuing from where the interrupted period left off.

module model (
  input clk,
  input resetn,
  output logic div2,
  output logic div4,
  output logic div6
);

reg count2; // either 0 or 1
reg [1:0] count4; // 0, 1, 2, 3
reg [2:0] count6; // 0, 1, 2, 3, 4, 5  (handle overflow at 5)

assign div2 = count2; // hold high for 1 cycle, then hold low
assign div4 = (count4 > 0 && count4 < 3 ) ? 1 : 0; // 1,2 are high, 3,0 are low
assign div6 = (count6 > 0 && count6 < 4 ) ? 1 : 0; // 1,2,3 are high, 4,5,0 are low


always @ (posedge clk) begin

  if (~resetn) begin
    count2 <= 0; // reset all clocks
    count4 <= 0;
    count6 <= 0;
  end
  
  else begin
    count2 <= count2 + 1;  // increment count each clock cycle (e.g. alternate bw 1 and 0)
    count4 <= count4 + 1; // increment count each clock cycle (e.g. 0->1->2->3->0->etc)
    count6 <= count6==5 ? 0 : count6 + 1; // hold high for 3 cycles, then hold low for 3 cycles. Only need 6 iterations so overflowing after 5. (e.g. 0->1->2->3->4->5->0->etc)
  end

end


endmodule
