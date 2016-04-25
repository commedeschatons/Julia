// $Id: $
// File name:   z_calculator.sv
// Created:     4/22/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: Given z val and c val, calculates the new z value

module real2imag
  #(
    WIDTH = 22,
    FRACTIONAL = 11,
    INTEGRAL = 11
   )
   (
    input unsigned [9:0] x, //has to be 10 bits
    input unsigned [9:0] y,
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
   //reg unsigned [9:0] 		     x_reg;
   //reg unsigned [9:0] 		     y_reg;


   //FORMULA =>  1.5 * (x-w/2) / (0.5 * w * zoom) + moveX => [(3/w) * (x - w/2)]
   //FORMULA =>  (y-h/2) / (0.5 * h * zoom) + moveY       => [(2/h) * y - 1    ]
   //assume zoom=1, moveX=moveY=0
   //3/w = decimal(0.0046875) = 22'b(...1010) = 22'd10
   //w/2 = decimal(320) = 22'd655360
   //2/h = decimal(1/240) = 22'd8
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

   assign z_real_inter = x_fixedp - 22'd655360;
   assign z_imag_out = z_imag_inter - 22'd2048;
   
   //#(FRACTIONAL,INTEGRAL)
   fixed_multiplication #(FRACTIONAL,INTEGRAL) Mreal(.a(22'd10), .b(z_real_inter), .result(z_real_out));
   fixed_multiplication #(FRACTIONAL,INTEGRAL) Mimag(.a(22'd8), .b(y_fixedp), .result(z_imag_inter));

endmodule
