// $Id: $
// File name:   tb_done_output.sv
// Created:     4/26/2016
// Author:      Alan Moretton
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: test bench for done_output
`timescale 1ns / 100ps

module tb_done_output ();

	// Define parameters
	// basic test bench parameters
	localparam CLK_PERIOD = 2.5;
	//localparam NUM_CNT_BITS = 4;
//	localparam NUM_X_BITS = 4;
//	localparam NUM_Y_BITS = 4;

	// Shared Test Variables
	reg tb_clk;
	logic tb_n_rst;
	logic [3:0] tb_worker_select;

	logic wr_done0; //actually start values... just didn't rename them.
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

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	done_output OUTPUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.worker_select(tb_worker_select),

		.start0(wr_done0),
		.start1(wr_done1),
		.start2(wr_done2),
		.start3(wr_done3),
		.start4(wr_done4),
		.start5(wr_done5),
		.start6(wr_done6),
		.start7(wr_done7),
		.start8(wr_done8),
		.start9(wr_done9),
		.start10(wr_done10),
		.start11(wr_done11),
		.start12(wr_done12),
		.start13(wr_done13),
		.start14(wr_done14),
		.start15(wr_done15)
	);

	initial begin
		#(CLK_PERIOD/2.0);
		tb_n_rst = 0;
		//tb_clear = 0;
		//tb_enable = 0;

		#(CLK_PERIOD/2.0);
		//tb_enable = 1'b1;
		tb_worker_select = 4'b0011;

		#(CLK_PERIOD*4);
		//tb_clear = 1;
		#(CLK_PERIOD*4);
		tb_worker_select = 4'b1100;

		//tb_clear = 0;
		#(CLK_PERIOD*4);
		//tb_enable = 1;
		tb_worker_select = 4'b1010;

		#(CLK_PERIOD*4);
		//tb_clear = 1;
	end
endmodule
