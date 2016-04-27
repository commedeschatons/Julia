// $Id: $
// File name:   tb_flex_x.sv
// Created:     4/26/2016
// Author:      Alan Moretton
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: test bench for the x value.

`timescale 1ns / 10ps

module tb_flex_x ();

	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 2.5;
	localparam NUM_CNT_BITS = 4;
	// Shared Test Variables
	reg tb_clk;
	logic tb_n_rst;
	logic tb_clear;
	logic tb_enable;
	logic [NUM_CNT_BITS-1:0] tb_rollover_val;
	logic [NUM_CNT_BITS-1:0] tb_count_out;
	logic tb_rolloverflg;
	
	
	
	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	flex_x DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.clear(tb_clear),
		.count_enable(tb_enable),
		.rollover_val(tb_rollover_val),

		.count_out(tb_count_out),
		.rollover_flag(tb_rolloverflg)
	);
	initial begin
		#(CLK_PERIOD/2.0);
		tb_n_rst = 0;
		tb_clear = 0;
		tb_enable = 0;
		#(CLK_PERIOD/2.0);
		tb_rollover_val = 3'b100;
		#(CLK_PERIOD);
		tb_n_rst=1;
		#(CLK_PERIOD);
		tb_enable=1;
		#(CLK_PERIOD);
		tb_clear = 1;
		#(CLK_PERIOD);
		tb_clear = 0;
		#(CLK_PERIOD*4);
		tb_enable = 0;
		#(CLK_PERIOD);
		tb_clear = 1;
		
	end
endmodule
