// $Id: $
// File name:   tb_disp_controller
// Created:     4/27/2016
// Author:      Kenji Inoue
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: 
`timescale 1ns / 10ps
module tb_disp_controller();
localparam	CLK_PERIOD	= 2.5;
logic clk;

always
	begin
		clk = 1'b0;
		#(CLK_PERIOD/2.0);
		clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

logic [15:0] mc_disp_done = '1;
logic [15:0] disp_jw_start = '0;
logic [15:0] jw_mc_done = '0;
logic [15:0] mc_jw_busy = '0;

logic n_rst = 1;

logic jw;
logic start = 0;

disp_controller DISPATCH
(
.wr_clk(clk),
.wr_n_rst(n_rst),

.wr_start_calc(start),

.wr_done0(mc_disp_done[0]),
.wr_done1(mc_disp_done[1]),
.wr_done2(mc_disp_done[2]),
.wr_done3(mc_disp_done[3]),
.wr_done4(mc_disp_done[4]),
.wr_done5(mc_disp_done[5]),
.wr_done6(mc_disp_done[6]),
.wr_done7(mc_disp_done[7]),
.wr_done8(mc_disp_done[8]),
.wr_done9(mc_disp_done[9]),
.wr_done10(mc_disp_done[10]),
.wr_done11(mc_disp_done[11]),
.wr_done12(mc_disp_done[12]),
.wr_done13(mc_disp_done[13]),
.wr_done14(mc_disp_done[14]),
.wr_done15(mc_disp_done[15]),

.worker_to_assign(worker),
.jw_begin(jw),

.wr_start0(disp_jw_start[0]),
.wr_start1(disp_jw_start[1]),
.wr_start2(disp_jw_start[2]),
.wr_start3(disp_jw_start[3]),
.wr_start4(disp_jw_start[4]),
.wr_start5(disp_jw_start[5]),
.wr_start6(disp_jw_start[6]),
.wr_start7(disp_jw_start[7]),
.wr_start8(disp_jw_start[8]),
.wr_start9(disp_jw_start[9]),
.wr_start10(disp_jw_start[10]),
.wr_start11(disp_jw_start[11]),
.wr_start12(disp_jw_start[12]),
.wr_start13(disp_jw_start[13]),
.wr_start14(disp_jw_start[14]),
.wr_start15(disp_jw_start[15])

);


initial
begin
	@(negedge clk);
	n_rst = 1;
	@(negedge clk);
	n_rst = 0;
	@(negedge clk);
	n_rst = 1;
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	start = 1;
	@(negedge clk);
	start = 0;
	@(negedge clk);
	@(negedge clk);
	mc_disp_done = 16'b0111111111111111;
	@(negedge clk);
	@(negedge clk);
	mc_disp_done = 16'b0011111111111111;
	#(CLK_PERIOD * 10);
	
end

endmodule
