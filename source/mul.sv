// $Id: $
// File name:   mul.sv
// Created:     3/31/2016
// Author:      Kenji Inoue
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: muls shit yo
module mul(
input wire [19:0] in1,
//input wire [19:0] in2,
output wire [39:0] out);
assign out = in1 * in1;
endmodule
