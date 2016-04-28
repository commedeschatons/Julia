// $Id: $
// File name:   tb_done_input.sv
// Created:     4/26/2016
// Author:      Alan Moretton
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: test bench for done_input
`timescale 1ns / 100ps

module tb_done_input ();

	// Define parameters
	// basic test bench parameters
	localparam CLK_PERIOD = 2.5;
	//localparam NUM_CNT_BITS = 4;
//	localparam NUM_X_BITS = 4;
//	localparam NUM_Y_BITS = 4;

	// Shared Test Variables
	reg tb_clk;
	logic tb_n_rst;
	logic tb_clear;
	logic tb_enable;

	logic wr_done0;
	logic wr_done1;
	logic wr_done2;
	logic wr_done3;
	logic wr_done4;
	logic wr_done5;
	logic wr_done6;
	logic wr_done7;
	logic wr_done8;
	logic wr_done9;
	logic wr_done10;
	logic wr_done11;
	logic wr_done12;
	logic wr_done13;
	logic wr_done14;
	logic wr_done15;

	logic [15:0] wr_workers_done;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	done_input INPUT
	(
		.clk(wr_clk), //wr = wrapper variable
		.n_rst(wr_n_rst),
		.done0(wr_done0),
		.done1(wr_done1),
		.done2(wr_done2),
		.done3(wr_done3),
		.done4(wr_done4),
		.done5(wr_done5),
		.done6(wr_done6),
		.done7(wr_done7),
		.done8(wr_done8),
		.done9(wr_done9),
		.done10(wr_done10),
		.done11(wr_done11),
		.done12(wr_done12),
		.done13(wr_done13),
		.done14(wr_done14),
		.done15(wr_done15),
	
		.workers_done(wr_workers_done)
	);

	initial begin
		#(CLK_PERIOD/2.0);
		tb_n_rst = 0;
		tb_clear = 0;
		tb_enable = 0;

		#(CLK_PERIOD/2.0);
		tb_enable = 1'b1;

		wr_done0 = 1;
		wr_done1 = 1;
		wr_done2 = 1;
		wr_done3 = 1;
		wr_done4 = 1;
		wr_done5 = 1;
		wr_done6 = 1;
		wr_done7 = 1;
		wr_done8 = 1;
		wr_done9 = 1;
		wr_done10 = 1;
		wr_done11 = 1;
		wr_done12 = 1;
		wr_done13 = 1;
		wr_done14 = 1;
		wr_done15 = 1;

		#(CLK_PERIOD*4);
		tb_n_rst=1;
		#(CLK_PERIOD*4);
		tb_enable=1;

		wr_done0 = 1;
		wr_done1 = 1;
		wr_done2 = 1;
		wr_done3 = 0;
		wr_done4 = 1;
		wr_done5 = 1;
		wr_done6 = 1;
		wr_done7 = 1;
		wr_done8 = 0;
		wr_done9 = 1;
		wr_done10 = 1;
		wr_done11 = 0;
		wr_done12 = 1;
		wr_done13 = 1;
		wr_done14 = 1;
		wr_done15 = 1;

		#(CLK_PERIOD*4);
		tb_clear = 1;
		#(CLK_PERIOD*4);
		tb_clear = 0;
		#(CLK_PERIOD*4);
		tb_enable = 1;

		wr_done15 = 0;

		#(CLK_PERIOD*4);
		tb_clear = 1;
		
	end
endmodule
