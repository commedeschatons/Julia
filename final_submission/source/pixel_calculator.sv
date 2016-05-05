// $Id: $
// File name:   pixel_calculator.sv
// Created:     4/22/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: 1)determines number of z_calculator module calls
//              2)decode number of iterations into 8 bits pixel value
//              3)receive signal from state machine that initiates calculation
//              4)send signal to state machine informing that calculation is complete

module pixel_calculator
  #(
    ITERATIONS = 256,
    WIDTH = 22,
    FRACTIONAL = 11,
    INTEGRAL = 11
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

   reg 	   second_iter;
   reg 	   second_iter_next;
   reg 	   calc_done_next;

   reg [3:0] count_out;
   reg 	     clear;
   reg 	     rollover_flag;
   
   assign iteration_old_wire = iteration_old;
   assign z_real_old_wire = z_real_old;
   assign z_imag_old_wire = z_imag_old;
   
   always_ff @(posedge clk, negedge n_rst) begin
      if(!n_rst) begin
	 iteration_old <= 0;
	 z_real_old <= 0;
	 z_imag_old <= 0;
	 second_iter <= 0;
	 calc_done <= 0;
      end else begin
	 iteration_old <= iteration_old_next;
	 z_real_old <= z_real_old_next;
	 z_imag_old <= z_imag_old_next;
	 second_iter <= second_iter_next;
	 calc_done <= calc_done_next;
      end
   end

   //#(WIDTH,FRACTIONAL,INTEGRAL)
   z_calculator Z_CALCULATOR
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
   flex_counter FLEX_COUNTER
     (
      .clk(clk),
      .n_rst(n_rst),
      .clear(clear),
      .count_enable(calc_start),
      .rollover_val(4'd7),
      .count_out(count_out),
      .rollover_flag(rollover_flag)
      );

   always_comb begin
      if(calc_start == 1)begin
	 clear = 0;
	 c_real_old = c_real_in;
	 c_imag_old = c_imag_in;

	 if(rollover_flag == 1'b1 && count_out == 4'b0111) begin //this is after 10 cycles aka 1 iteration
	    second_iter_next = 1;
	    if(pixel == 8'b11111111) begin //update input = input
	       iteration_old_next = iteration_old;
	       z_real_old_next = z_real_old;
	       z_imag_old_next = z_imag_old;
	       calc_done_next = 1;
	    end else if(pixel == iteration_old) begin //update input = input
	       iteration_old_next = iteration_old;
	       z_real_old_next = z_real_old;
	       z_imag_old_next = z_imag_old;
	       calc_done_next = 1;
	    end else begin //update input = output
	       iteration_old_next = pixel;
	       z_real_old_next = z_real_out;
	       z_imag_old_next = z_imag_out;
	       calc_done_next = 0;
	    end
	 end else begin //in between iterations
	    calc_done_next = 0;
	    second_iter_next = second_iter;
	    if(calc_done == 1 && second_iter == 1) begin //if bailout reached
	       calc_done_next = 1;
	       iteration_old_next = iteration_old;
	       z_real_old_next = z_real_old;
	       z_imag_old_next = z_imag_old;
	    end else if(calc_done == 0 && second_iter == 1) begin //bailout not reached
	       iteration_old_next = iteration_old;//CHANGED!
	       z_real_old_next = z_real_old;
	       z_imag_old_next = z_imag_old;
	    end else begin //bailout not reached, 1st iteration not reached
	       iteration_old_next = iteration_in;
	       z_real_old_next = z_real_in;
	       z_imag_old_next = z_imag_in;
	    end
	 end
      end else begin //if(calc_start == 0)
	 calc_done_next = 1;
	 clear = 1;
	 iteration_old_next = 0;
	 z_real_old_next = 0;
	 z_imag_old_next = 0;
	 c_real_old = 0;
	 c_imag_old = 0;
	 second_iter_next = 0;
      end
   end
/*
   always_comb begin
      if(calc_start == 1) begin //if task received
	 clear = 0;
	 c_real_old = c_real_in;
	 c_imag_old = c_imag_in;
	 if(second_iter == 1'b1) begin  //if this is second iteration
	    second_iter_next = second_iter;
	    if(rollover_flag == 1'b1) begin
	       if(pixel == 8'b11111111) begin //update input = input
		  iteration_old_next = iteration_old;
		  z_real_old_next = z_real_old;
		  z_imag_old_next = z_imag_old;
		  calc_done_next = 1;
	       end else if(pixel == iteration_old) begin //update input = input
		  iteration_old_next = iteration_old;
		  z_real_old_next = z_real_old;
		  z_imag_old_next = z_imag_old;
		  calc_done_next = 1;
	       end else begin //update input = output
		  iteration_old_next = pixel;
		  z_real_old_next = z_real_out;
		  z_imag_old_next = z_imag_out;
		  calc_done_next = 0;
	       end
	    end else begin
	       calc_done_next = calc_done;
	       iteration_old_next = iteration_old;
	       z_real_old_next = z_real_old;
	       z_imag_old_next = z_imag_old;
	    end
	 end else begin // if (second_iter != 1)
	    if(rollover_flag == 1'b1 && count_out == 4'b1010)begin
	       second_iter_next = 1'b1;
	    end else begin
	       second_iter_next = 1'b0;
	    end
	    calc_done_next = 0;
	    iteration_old_next = iteration_in;
	    z_real_old_next = z_real_in;
	    z_imag_old_next = z_imag_in;
	 end
      end else begin
	 calc_done_next = 1;
	 clear = 1;
	 iteration_old_next = 0;
	 z_real_old_next = 0;
	 z_imag_old_next = 0;
	 c_real_old = 0;
	 c_imag_old = 0;
	 second_iter_next = 0;
      end
   end
*/
endmodule
