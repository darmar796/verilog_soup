/* Build a module which controls a stopwatch timer.

The timer starts counting when the start button (start) is pressed (pulses) and increases by 1 every clock cycle.
When the stop button (stop) is pressed, the timer stops counting.
When the reset button (reset) is pressed, the count resets to 0 and the timer stops counting.

If count ever reaches MAX, then it restarts from 0 on the next cycle.

stop's functionality takes priority over start's functionality, and reset's functionality takes priority over both stop and start's functionality.
*/

module model #(parameter
  DATA_WIDTH = 16,
  MAX = 99
) (
    input clk,
    input reset, start, stop,
    output logic [DATA_WIDTH-1:0] count
);

reg increment; // counter increment

always @ (posedge clk) begin
  if (reset) begin
    count <= 0; // reset state, counter and increment are 0
    increment <= 0;
  end
  else if (stop && start) begin // stop takes priority over start
    count <= count; // next count is previous count
    increment <= 0; // counter increment is 0
  end
  else if (stop) begin // stop by itself
    count <= count;  // next count is previous count
    increment <= 0;  // counter increment is 0
  end
  else if (start) begin  // start by itself
    count <= ((count==MAX) ? 0 : count+1); // if max count reached, reset to 0, otherwise increment count by 1
    increment <= 1; // set counter increment to 1
  end
  else begin  // when none of the signals are pressed/pulsed
    count <=  ((count==MAX) ? 0 : count + increment); // if max count reached, reset to 0, otherwise increment counter by increment
    increment <= increment; // increment is unchanged 
  end
end

endmodule
