// $Id: $
// File name:   pixel2color.sv
// Created:     4/22/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: convert number of iterations to RGB value

module pixel2color
   (
    input unsigned [7:0] pixel, //has to be 10 bits
    output wire unsigned [31:0] color
    );

   reg [7:0]   red;
   reg [7:0]   green;
   reg [7:0]   blue;

   //format of 00BBGGRR
   assign color = {8'b0,red,green,blue};

   always_comb begin
      if(pixel == 8'b11111111) begin
	 red = 0;
	 green = 0;
	 blue = 0;
      end else if(pixel == 8'b0) begin
	 red = 8'hFF;
	 green = 8'hFF;
	 blue = 8'hFF;
      end else if(pixel < 16) begin //red
	 red = 8'hFF;
	 green = 8'h00;
	 blue = 8'h00;
      end else if(pixel < 32) begin
	 red = 8'hFF;
	 green = 8'h33;
	 blue = 8'h00;
      end else if(pixel < 48) begin //orange
	 red = 8'hFF;
	 green = 8'h66;
	 blue = 8'h00;
      end else if(pixel < 64) begin
	 red = 8'hFF;
	 green = 8'h99;
	 blue = 8'h00;
      end else if(pixel < 80) begin //yellow
	 red = 8'hFF;
	 green = 8'hFF;
	 blue = 8'h00;
      end else if(pixel < 96) begin
	 red = 8'hCC;
	 green = 8'hFF;
	 blue = 8'h00;
      end else if(pixel < 112) begin //green
	 red = 8'h00;
	 green = 8'hFF;
	 blue = 8'h00;
      end else if(pixel < 128) begin
	 red = 8'h00;
	 green = 8'hFF;
	 blue = 8'h99;
      end else if(pixel < 144) begin //blue
	 red = 8'h00;
	 green = 8'hCC;
	 blue = 8'hFF;
      end else if(pixel < 160) begin
	 red = 8'h00;
	 green = 8'h00;
	 blue = 8'hFF;
      end else if(pixel < 176) begin //dian
	 red = 8'h66;
	 green = 8'h66;
	 blue = 8'hFF;
      end else if(pixel < 192) begin
	 red = 8'hCC;
	 green = 8'h66;
	 blue = 8'hFF;
      end else if(pixel < 208) begin // dark pink
	 red = 8'hCC;
	 green = 8'h00;
	 blue = 8'h99;
      end else if(pixel < 224) begin
	 red = 8'h99;
	 green = 8'h00;
	 blue = 8'h99;
      end else if(pixel < 240) begin //purple
	 red = 8'h66;
	 green = 8'h00;
	 blue = 8'h99;
      end else begin
	 red = 8'h33;
	 green = 8'h00;
	 blue = 8'h33;
      end

      
   end

endmodule
