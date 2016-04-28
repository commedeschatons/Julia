// $Id: $
// File name:   julia_wrapper.sv
// Created:     4/27/2016
// Author:      Kenji Inoue
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: wrapper file for all custom module parts.
module julia_wrapper
(
input wire clk,
input wire n_rst,

input logic start_sig,
input logic wr_done,
input logic [21:0] a,
input logic [21:0] b,

output logic [31:0] wr_addr,
output logic [31:0] wr_data,
output logic wr_ready,
);


logic [15:0] dp_jw_start;  	//dispatcher->julia worker start
logic [15:0] jw_dp_ready;	//julia worker->dispatcher ready
	
logic [15:0] jw_mc_done;	//julia worker->memory controller done
logic [15:0] mc_jw_busy;	//memory controller->julia worker busy
logic [15:0] mc_jw_done;	//memory controller->julia worker done


//register to keep x and y values to
logic [15:0] [9:0] x_reg = '0;
logic [15:0] [9:0] y_reg = '0;
logic [15:0] [31:0] color_reg = '0;
logic [15:0] [31:0] addr_reg = '0;


//always @(posedge disp_jw_start)

dispatch DISPATCH
(
.clk(clk),
.n_rst(n_rst),
.start(start_sig),
.jw_dp_ready(jw_dp_ready),

.dp_jw_start(dp_jw_start),
.x_reg(x_reg),
.y_reg(y_reg)
);

julia_worker JW0
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[0])
.y(y_reg[0]),
.JW_start(dp_jw_start[0]),
.MC_done(mc_jw_done[0]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[0]),
.JW_done(jw_mc_done[0],
.color(color_reg[0]),
.address(addr_reg[0])
);

julia_worker JW1
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[1])
.y(y_reg[1]),
.JW_start(dp_jw_start[1]),
.MC_done(mc_jw_done[1]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[1]),
.JW_done(jw_mc_done[1],
.color(color_reg[1]),
.address(addr_reg[1])
);

julia_worker JW2
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[2])
.y(y_reg[2]),
.JW_start(dp_jw_start[2]),
.MC_done(mc_jw_done[2]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[2]),
.JW_done(jw_mc_done[2],
.color(color_reg[2]),
.address(addr_reg[2])
);

julia_worker JW3
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[3])
.y(y_reg[3]),
.JW_start(dp_jw_start[3]),
.MC_done(mc_jw_done[3]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[3]),
.JW_done(jw_mc_done[3],
.color(color_reg[3]),
.address(addr_reg[3])
);

julia_worker JW4
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[4])
.y(y_reg[4]),
.JW_start(dp_jw_start[4]),
.MC_done(mc_jw_done[4]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[4]),
.JW_done(jw_mc_done[4],
.color(color_reg[4]),
.address(addr_reg[4])
);

julia_worker JW5
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[5])
.y(y_reg[5]),
.JW_start(dp_jw_start[5]),
.MC_done(mc_jw_done[5]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[5]),
.JW_done(jw_mc_done[5],
.color(color_reg[5]),
.address(addr_reg[5])
);

julia_worker JW6
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[6])
.y(y_reg[6]),
.JW_start(dp_jw_start[6]),
.MC_done(mc_jw_done[6]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[6]),
.JW_done(jw_mc_done[6],
.color(color_reg[6]),
.address(addr_reg[6])
);

julia_worker JW7
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[7])
.y(y_reg[7]),
.JW_start(dp_jw_start[7]),
.MC_done(mc_jw_done[7]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[7]),
.JW_done(jw_mc_done[7],
.color(color_reg[7]),
.address(addr_reg[7])
);

julia_worker JW1
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[0])
.y(y_reg[0]),
.JW_start(dp_jw_start[0]),
.MC_done(mc_jw_done[0]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[0]),
.JW_done(jw_mc_done[0],
.color(color_reg[0]),
.address(addr_reg[0])
);

julia_worker JW1
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[0])
.y(y_reg[0]),
.JW_start(dp_jw_start[0]),
.MC_done(mc_jw_done[0]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[0]),
.JW_done(jw_mc_done[0],
.color(color_reg[0]),
.address(addr_reg[0])
);

julia_worker JW1
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[0])
.y(y_reg[0]),
.JW_start(dp_jw_start[0]),
.MC_done(mc_jw_done[0]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[0]),
.JW_done(jw_mc_done[0],
.color(color_reg[0]),
.address(addr_reg[0])
);

julia_worker JW1
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[0])
.y(y_reg[0]),
.JW_start(dp_jw_start[0]),
.MC_done(mc_jw_done[0]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[0]),
.JW_done(jw_mc_done[0],
.color(color_reg[0]),
.address(addr_reg[0])
);

julia_worker JW1
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[0])
.y(y_reg[0]),
.JW_start(dp_jw_start[0]),
.MC_done(mc_jw_done[0]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[0]),
.JW_done(jw_mc_done[0],
.color(color_reg[0]),
.address(addr_reg[0])
);

julia_worker JW1
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[0])
.y(y_reg[0]),
.JW_start(dp_jw_start[0]),
.MC_done(mc_jw_done[0]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[0]),
.JW_done(jw_mc_done[0],
.color(color_reg[0]),
.address(addr_reg[0])
);

julia_worker JW1
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[0])
.y(y_reg[0]),
.JW_start(dp_jw_start[0]),
.MC_done(mc_jw_done[0]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[0]),
.JW_done(jw_mc_done[0],
.color(color_reg[0]),
.address(addr_reg[0])
);

julia_worker JW1
(
.clk(clk),
.n_rst(n_rst),
.x(x_reg[0])
.y(y_reg[0]),
.JW_start(dp_jw_start[0]),
.MC_done(mc_jw_done[0]),
.c_real_in(a),
.c_imag_in(b),
.JW_ready(jw_dp_ready[0]),
.JW_done(jw_mc_done[0],
.color(color_reg[0]),
.address(addr_reg[0])
);
endmodule
