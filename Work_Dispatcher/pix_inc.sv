// $Id: $
// File name:   pix_inc.sv
// Created:     4/22/2016
// Author:      Alan Moretton
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: The wrapper file to manage both x and y values

module pix_inc
#(
	parameter NUM_X_BITS = 4,
	parameter NUM_Y_BITS = 4
)

(
	input wire wr_clk, //wr = wrapper variable
	input wire wr_n_rst,
	input wire wr_counter_enable,
	input wire [NUM_X_BITS-1:0] x_max,
	input wire [NUM_Y_BITS-1:0] y_max,
	input wire wr_clear,

	output reg [NUM_X_BITS-1:0] x_value,
	output reg [NUM_Y_BITS-1:0] y_value,
	output reg done
);

reg x_count_out;
reg x_flag;

flex_x XCNT
(
	.clk(wr_clk),
	.n_rst(wr_n_rst),
	.clear(wr_clear),
	.count_enable(wr_counter_enable),
	.rollover_val(x_max),

	.count_out(x_value),
	.rollover_flag(x_flag)
);

flex_y YCNT
(
	.clk(wr_clk),
	.n_rst(wr_n_rst),
	.clear(wr_clear),
	.count_enable(x_flag),
	.rollover_val(y_max),

	.count_out(y_value),
	.rollover_flag(done)
);

endmodule

