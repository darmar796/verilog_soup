// This a simple router module
// Takes a data input din and routes it to 1 out of 4 data outputs based on input address
// If din_en signal is 0, no data is send, e.g. assume 0 data is sent

module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  input  din_en,
  input  [1:0] addr,
  output logic [DATA_WIDTH-1:0] dout0,
  output logic [DATA_WIDTH-1:0] dout1,
  output logic [DATA_WIDTH-1:0] dout2,
  output logic [DATA_WIDTH-1:0] dout3
);

always @ (din_en, addr, din) begin
  case({din_en,addr})
    3'b100: begin
      dout0 = din;
      dout1 = 32'b0;  // no input assume that means 0 data driven
      dout2 = 32'b0;
      dout3 = 32'b0;
    end
    3'b101: begin
      dout0 = 32'b0;
      dout1 = din;
      dout2 = 32'b0;
      dout3 = 32'b0;
    end
    3'b110: begin
      dout0 = 32'b0;
      dout1 = 32'b0;
      dout2 = din;
      dout3 = 32'b0;
    end
    3'b111: begin
      dout0 = 32'b0;
      dout1 = 32'b0;
      dout2 = 32'b0;
      dout3 = din;
    end
    default: begin
      dout0 = 32'b0;
      dout1 = 32'b0;
      dout2 = 32'b0;
      dout3 = 32'b0;
    end
  endcase
end

endmodule