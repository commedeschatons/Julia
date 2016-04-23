// $Id: $
// File name:   fixed_multiplication.sv
// Created:     4/22/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: Multiplies two fixed point values and return result of the same number of bits.(2bits * 2bits = 4bits)

module fixed_multiplication //10bits of fractional values, 10bits of integer values, total of 20 bits
  #(
    FRACTIONAL = 10,
    INTEGRAL = 10
   )
   (
    a, b, result
    );

   parameter width = FRACTIONAL + INTEGRAL;

   input signed [width - 1:0] a; //MSB for sign, the other 19 bits for magnitude
   input signed [width - 1:0] b;
   output signed [width - 1:0] result;

   wire signed [width * 2 - 2:0] ab; //MSB for sign, the other 38 bits for magnitude

   assign ab = a * b;

   //Take the 20 bits sandwiched between the 40 bits result
   assign result = ab[width + FRACTIONAL -1:FRACTIONAL];
   
endmodule

   
