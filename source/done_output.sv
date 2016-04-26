// $Id: $
// File name:   done_output.sv
// Created:     4/26/2016
// Author:      Alan Moretton
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: takes the worker selected and sends the x and y value down that path

module done_output

#(
	parameter NUM_X_BITS = 10,
	parameter NUM_Y_BITS = 10
)

(
	input wire clk, //wr = wrapper variable
	input wire n_rst,
	input reg [NUM_X_BITS-1:0] x_value,
	input reg [NUM_Y_BITS-1:0] y_value,
	input wire [15:0] worker_select,

	output reg [(NUM_Y_BITS+NUM_X_BITS-1):0] data
);
 
	assign data = {x_value, y_value};

	//The only thing I can't get... how to send to correct worker, I have the one to select, but how to send values to it?

endmodule
