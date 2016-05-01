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
	input wire [3:0] worker_select,

	output reg start0,
	output reg start1,
	output reg start2,
	output reg start3,
	output reg start4,
	output reg start5,
	output reg start6,
	output reg start7,
	output reg start8,
	output reg start9,
	output reg start10,
	output reg start11,
	output reg start12,
	output reg start13,
	output reg start14,
	output reg start15
);

always_comb
begin
	start0 = 0;
	start1 = 0;
	start2 = 0;
	start3 = 0;
	start4 = 0;
	start5 = 0;
	start6 = 0;
	start7 = 0;
	start8 = 0;
	start9 = 0;
	start10 = 0;
	start11 = 0;
	start12 = 0;
	start13 = 0;
	start14 = 0;
	start15 = 0;

	if(worker_select == 4'b0000)
		start0 = 1;
	else if(worker_select == 4'b0001)
		start1 = 1;
	else if(worker_select == 4'b0010)
		start2 = 1;
	else if(worker_select == 4'b0011)
		start3 = 1;
	else if(worker_select == 4'b0100)
		start4 = 1;
	else if(worker_select == 4'b0101)
		start5 = 1;
	else if(worker_select == 4'b0110)
		start6 = 1;
	else if(worker_select == 4'b0111)
		start7 = 1;
	else if(worker_select == 4'b1000)
		start8 = 1;
	else if(worker_select == 4'b1001)
		start9 = 1;
	else if(worker_select == 4'b1010)
		start10 = 1;
	else if(worker_select == 4'b1011)
		start11 = 1;
	else if(worker_select == 4'b1100)
		start12 = 1;
	else if(worker_select == 4'b1101)
		start13 = 1;
	else if(worker_select == 4'b1110)
		start14 = 1;
	else if(worker_select == 4'b1111)
		start15 = 1;
end
	
endmodule
