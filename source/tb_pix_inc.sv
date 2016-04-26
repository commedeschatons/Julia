// $Id: $
// File name:   tb_pix_inc.sv
// Created:     4/22/2016
// Author:      Alan Moretton
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: test bench for the flex counter wrapper

`timescale 1ns / 100ps

module tb_pix_inc ();

	// Define parameters
	// basic test bench parameters
	localparam CLK_PERIOD = 2.5;
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

	pix_inc XY_CNT
	(
		.wr_clk(wr_clk), //wr = wrapper variable
		.wr_n_rst(wr_n_rst),
		.wr_counter_enable(wr_start_calc),
		.x_max(), //Preset?
		.y_max(), //Preset?
	
		.x_value(wr_x_value),
		.y_value(wr_y_value),
		.done(wr_finished_screen)
	);
	
	initial begin
		#(CLK_PERIOD/2.0);
		tb_n_rst = 0;
		tb_clear = 0;
		tb_enable = 0;
		#(CLK_PERIOD/2.0);
		tb_rollover_val = 2'b10;
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

