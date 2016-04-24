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
    ITERATIONS = 256,
    WIDTH = 20,
    FRACTIONAL = 10,
    INTEGRAL = 10
   )
   (
    input clk,
    input n_rst,
    input calc_start,
    input signed [WIDTH-1:0] z_real_in,
    input signed [WIDTH-1:0] z_imag_in,
    input signed [WIDTH-1:0] c_real_in,
    input signed [WIDTH-1:0] c_imag_in,
    input unsigned [7:0] iteration_in,
    output  signed [WIDTH-1:0] z_real_out,
    output  signed [WIDTH-1:0] z_imag_out,
    output  signed [WIDTH-1:0] size_squared_out,
    output  unsigned [7:0] pixel,
    output reg calc_done
    );

   reg        unsigned [7:0] iteration_old;
   reg        signed [WIDTH-1:0] z_real_old;
   reg        signed [WIDTH-1:0] z_imag_old;
   reg signed [WIDTH-1:0] 	 c_real_old;
   reg signed [WIDTH-1:0] 	 c_imag_old;
   
   
   wire       unsigned [7:0] iteration_old_wire;
   wire       signed [WIDTH-1:0] z_real_old_wire;
   wire       signed [WIDTH-1:0] z_imag_old_wire;
   
   reg       unsigned [7:0] iteration_old_next;
   reg       signed [WIDTH-1:0] z_real_old_next;
   reg       signed [WIDTH-1:0] z_imag_old_next;

   reg 	   enable;
   reg 	   enable_next;
   
   assign iteration_old_wire = iteration_old;
   assign z_real_old_wire = z_real_old;
   assign z_imag_old_wire = z_imag_old;
   
   always_ff @(posedge clk, negedge n_rst) begin
      if(!n_rst) begin
	 iteration_old <= 0;
	 z_real_old <= 0;
	 z_imag_old <= 0;
	 enable <= 0;
      end else begin
	 iteration_old <= iteration_old_next;
	 z_real_old <= z_real_old_next;
	 z_imag_old <= z_imag_old_next;
	 enable <= enable_next;
      end
   end

   //#(WIDTH,FRACTIONAL,INTEGRAL)
   z_calculator #(WIDTH,FRACTIONAL,INTEGRAL) Z_CALCULATOR
     (
      .z_real_in(z_real_old_wire),
      .z_imag_in(z_imag_old_wire),
      .c_real_in(c_real_old),
      .c_imag_in(c_imag_old),
      .z_real_out(z_real_out),
      .z_imag_out(z_imag_out),
      .size_squared_out(size_squared_out),
      .iteration_in(iteration_old_wire),
      .iteration_out(pixel)
      );
/*
   assign iteration_old_next = (enable) ? ( (pixel == ITERATIONS) ? iteration_old : (pixel == iteration_old ? iteration_old : pixel) ) : iteration_in;
   assign z_real_old_next = (enable) ? ( (pixel == ITERATIONS) ? z_real_old : (pixel == iteration_old ? z_real_old : z_real_out) ) : z_real_in;
   assign z_imag_old_next = (enable) ? ( (pixel == ITERATIONS) ? z_imag_old : (pixel == iteration_old ? z_imag_old : z_imag_out) ) : z_imag_in;   
*/
   always_comb begin
      if(calc_start == 1) begin //if task received
	 calc_done = 0;
	 if(enable == 1) begin  //if this is second iteration
	    if(pixel == ITERATIONS) begin //update input = input
	       iteration_old_next = iteration_old;
	       z_real_old_next = z_real_old;
	       z_imag_old_next = z_imag_old;
	       calc_done = 1;
	    end else if(pixel == iteration_old) begin //update input = input
	       iteration_old_next = iteration_old;
	       z_real_old_next = z_real_old;
	       z_imag_old_next = z_imag_old;
	       calc_done = 1;
	    end else begin //update input = output
	       iteration_old_next = pixel;
	       z_real_old_next = z_real_out;
	       z_imag_old_next = z_imag_out;
	    end
	 end else begin // if (enable != 1)
	    enable_next = 1;
	    iteration_old_next = iteration_in;
	    z_real_old_next = z_real_in;
	    z_imag_old_next = z_imag_in;
	    c_real_old = c_real_in;
	    c_imag_old = c_imag_in;
	 end
      end else begin
	 calc_done = 1;
	 iteration_old_next = 0;
	 z_real_old_next = 0;
	 z_imag_old_next = 0;
	 c_real_old = 0;
	 c_imag_old = 0;
	 enable_next = 0;
      end
   end

endmodule
