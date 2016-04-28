// $Id: $
// File name:   tb_julia_wrapper.sv
// Created:     4/28/2016
// Author:      Kenji Inoue
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: julia wrapper test bench
`timescale 1ns / 100ps

module tb_julia_wrapper
();

localparam CLK_PERIOD = 2.5;
localparam CHECK_DELAY =1;

reg tb_clk;
logic tb_n_rst = 1;

// Clock generation block
always
begin
	tb_clk = 1'b0;
	#(CLK_PERIOD/2.0);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2.0);
end

module julia_wrapper
(
.clk,
.n_rst,
.start_sig,
.wr_done,
.[21:0] a,
.[21:0] b,
.[31:0] wr_addr,
.[31:0] wr_data,
.wr_ready,
);

initial begin
end

endmodule
