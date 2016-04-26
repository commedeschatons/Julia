// $Id: $
// File name:   disp_controller.sv
// Created:     4/26/2016
// Author:      Alan Moretton
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: The overall wrapper function for the dispatcher

module disp_controller

#(
	parameter NUM_X_BITS = 10,
	parameter NUM_Y_BITS = 10
)

(
	input wire wr_clk, //wr = wrapper variable
	input wire wr_n_rst,

	input wire wr_a,
	input wire wr_b,
	input wire wr_start_calc,
	input wire wr_done0,
	input wire wr_done1,
	input wire wr_done2,
	input wire wr_done3,
	input wire wr_done4,
	input wire wr_done5,
	input wire wr_done6,
	input wire wr_done7,
	input wire wr_done8,
	input wire wr_done9,
	input wire wr_done10,
	input wire wr_done11,
	input wire wr_done12,
	input wire wr_done13,
	input wire wr_done14,
	input wire wr_done15,

	output reg [NUM_X_BITS-1:0] wr_x_value,
	output reg [NUM_Y_BITS-1:0] wr_y_value,
	output reg [(NUM_Y_BITS+NUM_X_BITS-1):0] wr_data,
	output reg [3:0] worker_to_assign,
	output reg jw_begin
);

reg wr_x_max;
reg wr_y_max;
reg [15:0] wr_workers_done;
reg wr_finished_screen; //asserted when y_max is reached (y_rollover == 1)

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

done_input
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

done_output
(
	.wr_clk(wr_clk), //wr = wrapper variable
	.wr_n_rst(wr_n_rst),
	.x_value(wr_x_value),
	.y_value(wr_y_value),
	.worker_select(worker_to_assign),

	.data(wr_data)
);

dispatcher DISP
(
	.clk(wr_clk),
	.n_reset(wr_n_rst),
	.x(wr_x_value),
	.y(wr_y_value),
	.y_rollover(wr_finished_screen),
	.done(wr_workers_done), //list of done workers

	.select_worker(worker_to_assign),
	.start(jw_begin)
);

endmodule

