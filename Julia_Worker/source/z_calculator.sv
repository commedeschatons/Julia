// $Id: $
// File name:   z_calculator.sv
// Created:     4/22/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: Given z val and c val, calculates the new z value

module z_calculator
  #(
    WIDTH = 20,
    FRACTIONAL = 10,
    INTEGRAL = 10
   )
   (
    input signed [WIDTH-1:0] z_real_in,
    input signed [WIDTH-1:0] z_imag_in,
    input signed [WIDTH-1:0] c_real_in,
    input signed [WIDTH-1:0] c_imag_in,
    input unsigned [7:0] iteration_in,
    output signed [WIDTH-1:0] z_real_out,
    output signed [WIDTH-1:0] z_imag_out,
    output signed [WIDTH-1:0] size_squared_out,
    output unsigned [7:0] iteration_out
    );

   wire signed [WIDTH - 1:0] z_real_squared;
   wire signed [WIDTH - 1:0] z_imag_squared;
   wire signed [WIDTH - 1:0] z_real_squared_new;
   wire signed [WIDTH - 1:0] z_imag_squared_new;
   wire signed [WIDTH - 1:0] z_real_imag;

   //#(FRACTIONAL,INTEGRAL)
   fixed_multiplication #(FRACTIONAL,INTEGRAL) M1(.a(z_real_in), .b(z_real_in), .result(z_real_squared));
   fixed_multiplication #(FRACTIONAL,INTEGRAL) M2(.a(z_imag_in), .b(z_imag_in), .result(z_imag_squared));
   fixed_multiplication #(FRACTIONAL,INTEGRAL) M3(.a(z_real_in), .b(z_imag_in), .result(z_real_imag));
   fixed_multiplication #(FRACTIONAL,INTEGRAL) M4(.a(z_real_out), .b(z_real_out), .result(z_real_squared_new));
   fixed_multiplication #(FRACTIONAL,INTEGRAL) M5(.a(z_imag_out), .b(z_imag_out), .result(z_imag_squared_new));   

   //Znew = (Zold)^2 + C
   //Z_new_real = (Z_old_real)^2 - (Z_old_imag)^2 + C_real
   //Z_new_imag = 2 * Z_old_real * Z_old_imag + C_imag

   assign z_real_out = z_real_squared - z_imag_squared + c_real_in;
   assign z_imag_out = (2 * z_real_imag) + c_imag_in;
   assign size_squared_out = z_real_squared_new + z_imag_squared_new;
   //13'h1000 <==> 13'binary 100|0000000000 (lhs is integral, rhs is fractional part). We want it to be greater than distance of 4
   assign iteration_out = (size_squared_out >= 13'h1000) ? iteration_in : iteration_in + 1;
   
endmodule
