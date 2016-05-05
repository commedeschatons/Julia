// $Id: $
// File name:   tb_julia_wrapper.sv
// Created:     4/28/2016
// Author:      Kenji Inoue
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: julia wrapper test bench
`timescale 1ns / 100ps

module tb_julia_wrapper();

   localparam CLK_PERIOD = 2.5;
   localparam CHECK_DELAY =1;

   reg tb_clk;
   logic tb_n_rst;

   logic tb_start_sig;
   logic tb_wait_request;
   logic signed [21:0] tb_a;
   logic signed [21:0] tb_b;

   logic [31:0] tb_wr_addr;
   logic [31:0] tb_wr_data;
   logic 	tb_wr_enable;

   // Clock generation block
   always
     begin
	tb_clk = 1'b0;
	#(CLK_PERIOD/2.0);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2.0);
     end

julia_wrapper JULIA_WRAPPER
  (
   .clk(tb_clk),
   .n_rst(tb_n_rst),
   .start_sig(tb_start_sig),
   .wait_request(tb_wait_request),
   .a(tb_a),
   .b(tb_b),
   .wr_addr(tb_wr_addr),
   .wr_data(tb_wr_data),
   .wr_enable(tb_wr_enable)
   );

   initial begin
      tb_a = 22'd512;
      tb_b = 22'd1024;
      tb_wait_request = 1;
      
      tb_n_rst = 1;
      @(posedge tb_clk);
      #(CHECK_DELAY);
      tb_n_rst =0;
      @(posedge tb_clk);
      tb_n_rst =1;      
      #(CHECK_DELAY);

      tb_start_sig = 1;

      @(posedge tb_clk);
      #(CHECK_DELAY);
      tb_start_sig = 0;

      #(CLK_PERIOD * 25);
      tb_wait_request = 0;
      
   end

endmodule
