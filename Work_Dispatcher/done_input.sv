// $Id: $
// File name:   done_input.sv
// Created:     4/26/2016
// Author:      Alan Moretton
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: takes in all done values from workers and creates one 16 bit value

module done_input
(
	input wire clk, //wr = wrapper variable
	input wire n_rst,

	input wire done0,
	input wire done1,
	input wire done2,
	input wire done3,
	input wire done4,
	input wire done5,
	input wire done6,
	input wire done7,
	input wire done8,
	input wire done9,
	input wire done10,
	input wire done11,
	input wire done12,
	input wire done13,
	input wire done14,
	input wire done15,
	
	output reg [15:0] workers_done
);

	assign workers_done = {done15, done14, done13, done12, done11, done10, done9, done8, done7, done6, done5, done4, done3, done2, done1, done0};

endmodule
