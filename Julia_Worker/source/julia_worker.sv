// $Id: $
// File name:   julia_worker.sv
// Created:     4/24/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: Julia worker that connects all the sub-modules together

module julia_worker
  (
   input clk,
   input n_rst,
   input [9:0] x,
   input [9:0] y,
   input JW_start,
   input MC_busy,
   output JW_ready,
   output JW_done,
   output [7:0] pixel,
   c_real_in,
   c_imag_in
   );

   parameter FRACTIONAL = 11;
   parameter INTEGRAL = 11;
   parameter WIDTH = 22;
   parameter ITERATIONS = 256;
   parameter PIXELBITS = 4;
   
   reg [PIXELBITS-1:0] pixel_size = 3'd8;
   reg [31:0] 	       offset = 0;
   reg [7:0] 	       iteration_in = 0;

   input signed [WIDTH-1:0] c_real_in;
   input signed [WIDTH-1:0] c_imag_in;
   reg [WIDTH-1:0] 	    z_real_out;
   reg [WIDTH-1:0] 	    z_imag_out;
   reg [WIDTH-1:0] 	    size_squared_out;
   reg 	      calc_start;
   reg 	      calc_done;
   reg [WIDTH-1:0] z_real_in;
   reg [WIDTH-1:0] z_imag_in;
   reg [31:0] 	   address;
   
   wcu WCU
     (
      .clk(clk),
      .n_rst(n_rst),
      .JW_start(JW_start),
      .MC_busy(MC_busy),
      .JW_ready(JW_ready),
      .JW_done(JW_done),
      .calc_start(calc_start),
      .calc_done(calc_done)
      );
   
   addr_calculator #(PIXELBITS) ADDR_CALCULATOR
     (
      .x(x),
      .y(y),
      .pixel_size(pixel_size),
      .offset(offset),
      .address(address)
      );

   real2imag #(WIDTH,FRACTIONAL,INTEGRAL) REAL2IMAG
     (
      .x(x),
      .y(y),
      .z_real_out(z_real_in),
      .z_imag_out(z_imag_in)
      );

   pixel_calculator #(ITERATIONS,WIDTH,FRACTIONAL,INTEGRAL) PIXEL_CALCULATOR
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

endmodule