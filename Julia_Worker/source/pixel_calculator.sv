// $Id: $
// File name:   pixel_calculator.sv
// Created:     4/22/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: 1)determines number of z_calculator module calls
//              2)decode number of iterations into 8 bits pixel value
//              3)

module pixel_calculator
  #(
    ITERATIONS = 16,
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

   reg 	   unsigned [7:0] iteration_old;
   
   genvar i;
   generate
      for(i = 0; i < ITERATIONS; i = i + 1) begin: JULIA_WORKERS

	 iteration_old = iteration_in;

	 //#(WIDTH,FRACTIONAL,INTEGRAL)
	 z_calculator #(WIDTH,FRACTIONAL,INTEGRAL) Z_CALCULATOR
	   (
	    .z_real_in(z_real_in),
	    .z_imag_in(z_imag_in),
	    .c_real_in(c_real_in),
	    .c_imag_in(c_imag_in),
	    .z_real_out(z_real_out),
	    .z_imag_out(z_imag_out),
	    .size_squared_out(size_squared_out),
	    .iteration_in(iteration_in),
	    .iteration_out(iteration_out)
	    );
	 
	 always_comb begin
	    if(iteration_old == iteration_out) begin //bailout exceeded,break the loop
	    end else begin
	       
	    end
	 end
      end
   endgenerate
endmodule
