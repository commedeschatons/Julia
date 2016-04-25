// $Id: $
// File name:   addr_calculator.sv
// Created:     4/22/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: calculates SDRAM address of pixel

module addr_calculator
  #(
    PIXELBITS = 4
   )
   (
    input unsigned [9:0] x,
    input unsigned [9:0] y,
    input unsigned [PIXELBITS - 1:0] pixel_size,
    input unsigned [31:0] offset,
    output reg unsigned [31:0] address
    );

   //[pixel_size(3bits) * [[w+1](10bits) * y(10bits) + x_inter(20bits)] ] + offset(32bits)
   
   reg unsigned [9:0] w = 10'd641; //max_x + 1
   wire unsigned [19:0] mul1;
   wire unsigned [19:0] x_inter;
   wire unsigned [19:0] add1;
   wire unsigned [23:0] mul2;
   
   assign mul1 = w * y;
   assign x_inter = {10'd0,x};
   assign add1 = mul1 + x_inter;
   assign mul2 = add1 * pixel_size;
   always_comb begin
      address = mul2 + offset;
   end
      
endmodule
