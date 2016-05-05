// $Id: $
// File name:   z_calculator.sv
// Created:     4/22/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: convert given x and y coordinates to values that range between -1 to 1.(imaginary plane)

module real2imag
  #(
    WIDTH = 22,
    FRACTIONAL = 11,
    INTEGRAL = 11
   )
   (
    input 		      clk, n_rst,
    input 		      unsigned [9:0] x, //has to be 10 bits
    input 		      unsigned [9:0] y,
    input 		      convert_start,
    output 		      convert_done,
    output signed [WIDTH-1:0] z_real_out,
    output signed [WIDTH-1:0] z_imag_out
    );

   //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   //parameter w = 22'd1310720; //decimal 640.0 , maximum width
   //parameter h = 22'd983040;  //decimal 480.0 , maximum height
   
   wire signed [WIDTH - 1:0] x_fixedp;
   wire signed [WIDTH - 1:0] y_fixedp;
   wire signed [WIDTH - 1:0] z_real_inter;
   wire signed [WIDTH - 1:0] z_imag_inter;

   reg 			     clear;
   reg [3:0] 		     count_out;
   reg 			     rollover_flag;
			     
   //reg unsigned [9:0] 		     x_reg;
   //reg unsigned [9:0] 		     y_reg;

//OLD FORMULA(MIGHT BE RIGHT) => [3/w * (x - w/2)]
   //FORMULA =>  (x-w/2) / (0.5 * w * zoom) + moveX => [(2/w) * x - 1]
   //FORMULA =>  (y-h/2) / (0.5 * h * zoom) + moveY => [(2/h) * y - 1]
   //assume zoom=1, moveX=moveY=0
   //3/w = decimal(0.0046875) = 22'b(...1010) = 22'd10
   //w/2 = decimal(320) = 22'd655360
   //2/h = decimal(1/240) = 22'd8
   //2/w = decimal(1/320) = 22'd7
/*
   always_comb begin
      x_reg = x;
      y_reg = y;
   end
  */ 
   //assign x_fixedp[WIDTH-2:FRACTIONAL] = {x_reg};
   //assign y_fixedp[WIDTH-2:FRACTIONAL] = y_reg;
   assign x_fixedp = {1'b0,x,11'b0};
   assign y_fixedp = {1'b0,y,11'b0};   

   assign z_real_out = z_real_inter - 22'd2048;
   assign z_imag_out = z_imag_inter - 22'd2048;
   
   //#(FRACTIONAL,INTEGRAL)
   fixed_multiplication Mreal(.a(22'd7), .b(x_fixedp), .result(z_real_inter));
   fixed_multiplication Mimag(.a(22'd8), .b(y_fixedp), .result(z_imag_inter));

   flex_counter FLEX_COUNTER
     (
      .clk(clk),
      .n_rst(n_rst),
      .clear(clear),
      .count_enable(convert_start),
      .rollover_val(4'd3),
      .count_out(count_out),
      .rollover_flag(rollover_flag)
      );

   assign convert_done = (rollover_flag == 1'b1 && count_out == 4'b0011) ? 1'b1 : 1'b0;
   
endmodule
