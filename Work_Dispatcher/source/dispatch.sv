// $Id: $
// File name:   dispatch.sv
// Created:     4/27/2016
// Author:      Kenji Inoue
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: work dispatcher kenji
module dispatch
(
input logic clk,
input logic n_rst,
input logic start,
input logic [15:0] jw_dp_ready,

output logic [15:0] dp_jw_start,
output reg [15:0] [9:0] x_reg,
output reg [15:0] [9:0] y_reg
);

typedef enum bit [2:0] {IDLE,SEARCH,REST,REST2,ASSIGN,DONE} stateType;
stateType state,nextstate;

reg [9:0] x;
reg [15:0][9:0] x_nxt;
reg [9:0] y;
reg [15:0][9:0] y_nxt;
reg [15:0] mask;
reg inc;

logic [9:0] xmax = 10'd639;
logic [9:0] ymax = 10'd479;

reg done;


pix_inc XYCNT
(
.wr_clk(clk),
.wr_n_rst(n_rst),
.wr_counter_enable(inc),
.x_max(xmax),
.y_max(ymax),
.x_value(x),
.y_value(y),
.done(done)
);

always_ff @ (negedge n_rst, posedge clk)
	begin
		if(n_rst == 1'b0) begin
			state <= IDLE;
			x_reg <= '0;
			y_reg <= '0;
			dp_jw_start <= '0;
		end else begin
			state <= nextstate;
			x_reg <= x_nxt;
			y_reg <= y_nxt;
			dp_jw_start <= mask;
		end
	end

always_comb
begin
nextstate = state;
case(state)
	IDLE: begin
	x_nxt = '0;
	y_nxt = '0;
	mask = '0;
	if(start==1) 
		nextstate = SEARCH;
	end

	SEARCH: begin
		if (jw_dp_ready[0] == 1) begin
			x_nxt[0] = x;
			y_nxt[0] = y;
			nextstate = REST;
			mask = 16'b0000000000000001;
		end else if (jw_dp_ready[1] == 1) begin
			x_nxt[1] = x;
			y_nxt[1] = y;
			nextstate = REST;
			mask = 16'b0000000000000010;
		end else if (jw_dp_ready[2] == 1) begin
			x_nxt[2] = x;
			y_nxt[2] = y;
			nextstate = REST;
			mask = 16'b0000000000000100;
		end else if (jw_dp_ready[3] == 1) begin
			x_nxt[3] = x;
			y_nxt[3] = y;
			nextstate = REST;
			mask = 16'b0000000000001000;
		end else if (jw_dp_ready[4] == 1) begin
			x_nxt[4] = x;
			y_nxt[4] = y;
			nextstate = REST;
			mask = 16'b0000000000010000;
		end else if (jw_dp_ready[5] == 1) begin
			x_nxt[5] = x;
			y_nxt[5] = y;
			nextstate = REST;
			mask = 16'b0000000000100000;
		end else if (jw_dp_ready[6] == 1) begin
			x_nxt[6] = x;
			y_nxt[6] = y;
			nextstate = REST;
			mask = 16'b0000000001000000;
		end else if (jw_dp_ready[7] == 1) begin
			x_nxt[7] = x;
			y_nxt[7] = y;
			nextstate = REST;
			mask = 16'b0000000010000000;
		end else if (jw_dp_ready[8] == 1) begin
			x_nxt[8] = x;
			y_nxt[8] = y;
			nextstate = REST;
			mask = 16'b0000000100000000;
		end else if (jw_dp_ready[9] == 1) begin
			x_nxt[9] = x;
			y_nxt[9] = y;
			nextstate = REST;
			mask = 16'b0000001000000000;
		end else if (jw_dp_ready[10] == 1) begin
			x_nxt[10] = x;
			y_nxt[10] = y;
			nextstate = REST;
			mask = 16'b0000010000000000;
		end else if (jw_dp_ready[11] == 1) begin
			x_nxt[11] = x;
			y_nxt[11] = y;
			nextstate = REST;
			mask = 16'b0000100000000000;
		end else if (jw_dp_ready[12] == 1) begin
			x_nxt[12] = x;
			y_nxt[12] = y;
			nextstate = REST;
			mask = 16'b0001000000000000;
		end else if (jw_dp_ready[13] == 1) begin
			x_nxt[13] = x;
			y_nxt[13] = y;
			nextstate = REST;
			mask = 16'b0010000000000000;
		end else if (jw_dp_ready[14] == 1) begin
			x_nxt[14] = x;
			y_nxt[14] = y;
			nextstate = REST;
			mask = 16'b0100000000000000;
		end else if (jw_dp_ready[15] == 1) begin
			x_nxt[15] = x;
			y_nxt[15] = y;
			nextstate = REST;
			mask = 16'b1000000000000000;
		end
	end
	REST: begin
		nextstate = ASSIGN;
	end
	//REST2: begin
	//	nextstate = ASSIGN;
	//end
	ASSIGN: begin
		mask = '0;
		nextstate = SEARCH;
		inc = 1;
	end
	DONE: begin
	end
	default: begin
		x_nxt = x_reg;
		y_nxt = y_reg;
		inc = 0;
		nextstate = state;
		mask = '0;
	end
endcase
end
endmodule
