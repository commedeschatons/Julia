// $Id: $
// File name:   julia_worker.sv
// Created:     4/24/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: Julia worker that connects all the sub-modules together

module julia_worker
  #(
    FRACTIONAL = 11,
    INTEGRAL = 11,
    WIDTH = 22,
    ITERATIONS = 256,
    PIXELBITS = 6
    )
   (
    input 		     clk,
    input 		     n_rst,
    input [9:0] 	     x,
    input [9:0] 	     y,
    input 		     JW_start,
    input 		     MC_done,
    input signed [WIDTH-1:0] c_real_in,
    input signed [WIDTH-1:0] c_imag_in,
    output 		     JW_ready,
    output 		     JW_done,
    output reg [31:0] 	     color,
    output reg [31:0] 	     address
   );

   reg [PIXELBITS-1:0] 	     pixel_size;
   reg [31:0] 		     offset;
   reg [7:0] 		     iteration_in;

   reg [WIDTH-1:0] 	    z_real_out;
   reg [WIDTH-1:0] 	    z_imag_out;
   reg [WIDTH-1:0] 	    size_squared_out;
   reg 			    convert_start;
   reg 			    convert_done;
   reg 	      calc_start;
   reg 	      calc_done;
   reg [WIDTH-1:0] z_real_in;
   reg [WIDTH-1:0] z_imag_in;
   
   reg [7:0] 	   pixel;

   always_comb begin
      pixel_size = 6'd32;
      offset = 32'h08000000; //starting address in the sdram
      iteration_in = 0;
   end

   wcu WCU
     (
      .clk(clk),
      .n_rst(n_rst),
      .JW_start(JW_start),
      .MC_done(MC_done),
      .JW_ready(JW_ready),
      .JW_done(JW_done),
      .calc_start(calc_start),
      .calc_done(calc_done),
      .convert_start(convert_start),
      .convert_done(convert_done)
      );
   
   addr_calculator ADDR_CALCULATOR
     (
      .x(x),
      .y(y),
      .pixel_size(pixel_size),
      .offset(offset),
      .address(address)
      );

   real2imag REAL2IMAG
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x),
      .y(y),
      .convert_start(convert_start),
      .convert_done(convert_done),
      .z_real_out(z_real_in),
      .z_imag_out(z_imag_in)
      );

   pixel_calculator PIXEL_CALCULATOR
     (
      .clk(clk),
      .n_rst(n_rst),
      .calc_start(calc_start),
      .calc_done(calc_done),
      .z_real_in(z_real_in),
      .z_imag_in(z_imag_in),
      .c_imag_in(c_imag_in),
      .c_real_in(c_real_in),
      .z_real_out(z_real_out),
      .z_imag_out(z_imag_out),
      .iteration_in(iteration_in),
      .size_squared_out(size_squared_out),
      .pixel(pixel)
      );

   pixel2color PIXEL2COLOR
     (
      .pixel(pixel),
      .color(color)
      );
   
endmodule
