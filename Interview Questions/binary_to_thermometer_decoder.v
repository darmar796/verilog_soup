// Thermometer (a.k.a. unary) coding is frequently used in digital systems applications to represent a natural number. 
// In a thermometer code, a N-bit binary number is represented by a (2 ** N)-bit digital word, which has m zeros followed by (N - m) ones or vice-versa.
module model (
    input [7:0] din,
    output reg [255:0] dout
);

// (1 << din) -> find most signficant bit 
// ((1 << din) - 1) -> find most signficant bit, subtrack 1 from it
// bitwise or the two results to get all 1s
assign dout = (1 << din) | ((1 << din) - 1);

endmodule
