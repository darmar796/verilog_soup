module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] codeIn,
  output logic isThermometer
);

// Thermometer 
// 0s followed by 1s
// 1s followed by 0s
