// $Id: $
// File name:   adder
// Created:     3/31/2016
// Author:      Kenji Inoue
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: 
module adder#(parameter NUM_BITS = 4)
(
	input wire [NUM_BITS-1:0] add1,
	input wire [NUM_BITS-1:0] add2,
	output wire [NUM_BITS:0] sum
);
assign sum = add1+add2;
endmodule
