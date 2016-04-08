// $Id: $
// File name:   find_done.sv
// Created:     4/7/2016
// Author:      Kenji Inoue
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: finds the next free worker to dispatch work to
module find_done(input wire [15:0] done, input wire clk,output reg [4:0] worker_num);
	always_comb begin
		if (done[0]==1'b1)
			worker_num=4'd0;
		else if (done[1]==1'b1)
			worker_num=4'd1;
		else if (done[2]==1'b1)
			worker_num=4'd2;
		else if (done[3]==1'b1)
			worker_num=4'd3;
		else if (done[4]==1'b1)
			worker_num=4'd4;
		else if (done[5]==1'b1)
			worker_num=4'd5;
		else if (done[6]==1'b1)
			worker_num=4'd6;
		else if (done[7]==1'b1)
			worker_num=4'd7;
		else if (done[8]==1'b1)
			worker_num=4'd8;
		else if (done[9]==1'b1)
			worker_num=4'd9;
		else if (done[10]==1'b1)
			worker_num=4'd10;
		else if (done[11]==1'b1)
			worker_num=4'd11;
		else if (done[12]==1'b1)
			worker_num=4'd12;
		else if (done[13]==1'b1)
			worker_num=4'd13;
		else if (done[14]==1'b1)
			worker_num=4'd14;
		else if (done[15]==1'b1)
			worker_num=4'd15;
		else
			worker_num=5'b10000;
	end

endmodule
