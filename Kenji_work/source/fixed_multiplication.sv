// $Id: $
// File name:   fixed_multiplication.sv
// Created:     4/22/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: Multiplies two fixed point values and return result of the same number of bits.(2bits * 2bits = 4bits)

module fixed_multiplication //11bits of fractional values, 11bits of integer values, total of 22 bits
  #(
    WIDTH = 22,
    FRACTIONAL = 11,
    INTEGRAL = 11
   )
   (
    input signed [WIDTH-1:0] a,//MSB for sign, the other 21 bits for magnitude
    input signed [WIDTH-1:0] b,
    output signed [WIDTH-1:0] result//22 bits
    );

   reg signed [WIDTH * 2 - 2:0] ab; //MSB for sign, the other 42 bits for magnitude
   always_comb begin
      ab = a *b;
   end
//   assign ab = a * b;

   //Take the 22 bits sandwiched between the 4 bits result
   assign result = ab[WIDTH + FRACTIONAL -1:FRACTIONAL];
   
endmodule

   
