// $Id: $
// File name:   julia_wrapper.sv
// Created:     4/27/2016
// Author:      Kenji Inoue
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: wrapper file for all custom module parts.
module julia_wrapper
  (
   input wire 		     clk,
   input wire 		     n_rst,

   input logic 		     start_sig,
   input logic 		     wait_request,
   input logic signed [21:0] a,
   input logic signed [21:0] b,

   output logic [31:0] 	     wr_addr,
   output logic [31:0] 	     wr_data,
   output logic 	     wr_enable

   );

logic [15:0] dp_jw_start;  	//dispatcher->julia worker start
logic [15:0] jw_dp_ready;	//julia worker->dispatcher ready
	
logic [15:0] jw_mc_done;	//julia worker->memory controller done
logic [15:0] mc_jw_done;	//memory controller->julia worker done

//register to keep x and y values to
logic [9:0] x_reg [15:0];
logic [9:0] y_reg [15:0];
logic [31:0] color_reg [15:0];
logic [31:0] addr_reg [15:0];
logic [16*32 - 1:0] addr_1D;
logic [16*32 - 1:0] color_1D;

//assign addr_reg_out = addr_reg;
//assign jwmcdone = jw_mc_done;
//always @(posedge disp_jw_start)

   always_comb begin
      addr_1D = {addr_reg[15] ,addr_reg[14],addr_reg[13],addr_reg[12],addr_reg[11],addr_reg[10],addr_reg[9],addr_reg[8],addr_reg[7],addr_reg[6],addr_reg[5],addr_reg[4],addr_reg[3],addr_reg[2],addr_reg[1],addr_reg[0]};
      color_1D = {color_reg[15] ,color_reg[14],color_reg[13],color_reg[12],color_reg[11],color_reg[10],color_reg[9],color_reg[8],color_reg[7],color_reg[6],color_reg[5],color_reg[4],color_reg[3],color_reg[2],color_reg[1],color_reg[0]};
   end
   
   mem MEM
     (
      .clk(clk),
      .n_rst(n_rst),
      .wait_request(wait_request),//input
      .cataddresses(addr_1D),
      .catpixels(color_1D),
      .done(jw_mc_done),
      .free(mc_jw_done),
      .write_address(wr_addr),
      .write_data(wr_data),
      .write_enable(wr_enable)
      );

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
      .x(x_reg[0]),
      .y(y_reg[0]),
      .JW_start(dp_jw_start[0]),
      .MC_done(mc_jw_done[0]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[0]),
      .JW_done(jw_mc_done[0]),
      .color(color_reg[0]),
      .address(addr_reg[0])
      );

   julia_worker JW1
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[1]),
      .y(y_reg[1]),
      .JW_start(dp_jw_start[1]),
      .MC_done(mc_jw_done[1]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[1]),
      .JW_done(jw_mc_done[1]),
      .color(color_reg[1]),
      .address(addr_reg[1])
      );

   julia_worker JW2
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[2]),
      .y(y_reg[2]),
      .JW_start(dp_jw_start[2]),
      .MC_done(mc_jw_done[2]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[2]),
      .JW_done(jw_mc_done[2]),
      .color(color_reg[2]),
      .address(addr_reg[2])
      );

   julia_worker JW3
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[3]),
      .y(y_reg[3]),
      .JW_start(dp_jw_start[3]),
      .MC_done(mc_jw_done[3]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[3]),
      .JW_done(jw_mc_done[3]),
      .color(color_reg[3]),
      .address(addr_reg[3])
      );

   julia_worker JW4
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[4]),
      .y(y_reg[4]),
      .JW_start(dp_jw_start[4]),
      .MC_done(mc_jw_done[4]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[4]),
      .JW_done(jw_mc_done[4]),
      .color(color_reg[4]),
      .address(addr_reg[4])
      );

   julia_worker JW5
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[5]),
      .y(y_reg[5]),
      .JW_start(dp_jw_start[5]),
      .MC_done(mc_jw_done[5]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[5]),
      .JW_done(jw_mc_done[5]),
      .color(color_reg[5]),
      .address(addr_reg[5])
      );

   julia_worker JW6
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[6]),
      .y(y_reg[6]),
      .JW_start(dp_jw_start[6]),
      .MC_done(mc_jw_done[6]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[6]),
      .JW_done(jw_mc_done[6]),
      .color(color_reg[6]),
      .address(addr_reg[6])
      );

   julia_worker JW7
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[7]),
      .y(y_reg[7]),
      .JW_start(dp_jw_start[7]),
      .MC_done(mc_jw_done[7]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[7]),
      .JW_done(jw_mc_done[7]),
      .color(color_reg[7]),
      .address(addr_reg[7])
      );

   julia_worker JW8
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[8]),
      .y(y_reg[8]),
      .JW_start(dp_jw_start[8]),
      .MC_done(mc_jw_done[8]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[8]),
      .JW_done(jw_mc_done[8]),
      .color(color_reg[8]),
      .address(addr_reg[8])
      );

   julia_worker JW9
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[9]),
      .y(y_reg[9]),
      .JW_start(dp_jw_start[9]),
      .MC_done(mc_jw_done[9]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[9]),
      .JW_done(jw_mc_done[9]),
      .color(color_reg[9]),
      .address(addr_reg[9])
      );

   julia_worker JW10
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[10]),
      .y(y_reg[10]),
      .JW_start(dp_jw_start[10]),
      .MC_done(mc_jw_done[10]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[10]),
      .JW_done(jw_mc_done[10]),
      .color(color_reg[10]),
      .address(addr_reg[10])
      );

   julia_worker JW11
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[11]),
      .y(y_reg[11]),
      .JW_start(dp_jw_start[11]),
      .MC_done(mc_jw_done[11]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[11]),
      .JW_done(jw_mc_done[11]),
      .color(color_reg[11]),
      .address(addr_reg[11])
      );

   julia_worker JW12
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[12]),
      .y(y_reg[12]),
      .JW_start(dp_jw_start[12]),
      .MC_done(mc_jw_done[12]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[12]),
      .JW_done(jw_mc_done[12]),
      .color(color_reg[12]),
      .address(addr_reg[12])
      );

   julia_worker JW13
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[13]),
      .y(y_reg[13]),
      .JW_start(dp_jw_start[13]),
      .MC_done(mc_jw_done[13]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[13]),
      .JW_done(jw_mc_done[13]),
      .color(color_reg[13]),
      .address(addr_reg[13])
      );

   julia_worker JW14
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[14]),
      .y(y_reg[14]),
      .JW_start(dp_jw_start[14]),
      .MC_done(mc_jw_done[14]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[14]),
      .JW_done(jw_mc_done[14]),
      .color(color_reg[14]),
      .address(addr_reg[14])
      );

   julia_worker JW15
     (
      .clk(clk),
      .n_rst(n_rst),
      .x(x_reg[15]),
      .y(y_reg[15]),
      .JW_start(dp_jw_start[15]),
      .MC_done(mc_jw_done[15]),
      .c_real_in(a),
      .c_imag_in(b),
      .JW_ready(jw_dp_ready[15]),
      .JW_done(jw_mc_done[15]),
      .color(color_reg[15]),
      .address(addr_reg[15])
      );
endmodule
