// $Id: $
// File name:   sr_9bit.sv
// Created:     2/11/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: sr_9bit.sv

module sr_9bit
  (
   input wire clk,
   input wire n_rst,
   input wire shift_strobe,
   input wire serial_in,
   output wire [7:0] packet_data,
   output wire stop_bit
   );

   reg [8:0]   parallel_out;

   assign stop_bit = parallel_out[8];
   assign packet_data = parallel_out[7:0];
      
   flex_stp_sr #(9,0) flex_stp_sr_9
     (
      .clk(clk),
      .n_rst(n_rst),
      .shift_enable(shift_strobe),
      .serial_in(serial_in),
      .parallel_out(parallel_out)
      );

endmodule
   