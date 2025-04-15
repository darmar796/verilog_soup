// As the circuit counts, output fizz should be asserted if the current counter value is evenly divisible by FIZZ. 
// buzz should output 1 when the current counter value is divisible by BUZZ.
// Finally, output fizzbuzz should be 1 when counter is evenly divisible by both FIZZ and BUZZ. 

module model #(parameter
    FIZZ=3,
    BUZZ=5,
    MAX_CYCLES=100
) (
    input clk,
    input resetn,
    output logic fizz,
    output logic buzz,
    output logic fizzbuzz
);

reg [$clog2(MAX_CYCLES):0] counter;  // counter


assign fizz = (counter % FIZZ) == 0 ? 1 : 0;  // fizz detector
assign buzz = (counter % BUZZ) == 0 ? 1 : 0;  // buzz detector 
assign fizzbuzz = (((counter % FIZZ)== 0) && ((counter % BUZZ) == 0)) ? 1 : 0; // fizz and buzz detector

always @ (posedge clk) begin
    if (~resetn) begin
        counter <= 0;  // reset counter
    end
    else begin
        counter <= (counter == (MAX_CYCLES - 1)) ? 0 : (counter + 1); // counter with MAX_CYCLES overflow
    end
end

endmodule
