// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/4/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: flex_stp_sr

module flex_stp_sr
  #(
    NUM_BITS = 4,
    SHIFT_MSB = 1
    )
   (
    input wire 		      clk, n_rst, shift_enable, serial_in,
    output reg [NUM_BITS-1:0] parallel_out
    );
   
   reg [NUM_BITS-1:0] 	      temp_reg;
   
   always_ff @ (posedge clk, negedge n_rst) begin
      if(!n_rst) begin
	 parallel_out <= '1;
      end else begin
	 parallel_out <= temp_reg;
      end
   end

   always_comb begin
      temp_reg = parallel_out;
      if(shift_enable == 1) begin
	 if(SHIFT_MSB == 1) begin
	    temp_reg = {parallel_out[NUM_BITS-2:0],serial_in};
	 end else begin
	    temp_reg = {serial_in,parallel_out[NUM_BITS-1:1]};
	 end
      end	 
   end

endmodule
