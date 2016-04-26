// $Id: $
// File name:   tb_mealy.sv
// Created:     2/10/2016
// Author:      Kenji Inoue
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: tb for mealy
`timescale 1ns / 10ps
module tb_custom_master_slave ();
	localparam	CLK_PERIOD	= 2.5;
	logic tb_clk;
	logic tb_n_rst;
	logic tb_slave_write; 
	logic tb_slave_chipselect;
        logic [2:0]  tb_slave_address;
        logic [31:0] tb_slave_data;
   
	integer i;

	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	custom_master_slave MSTSLV(
		     .clk(tb_clk), 
		     .reset_n(tb_n_rst), 
		     .slave_write(tb_slave_write), 
		     .slave_chipselect(tb_slave_chipselect),
		     .slave_address(tb_slave_address),
		     .slave_writedata(tb_slave_data)
	);
	initial
	begin
		tb_n_rst = 1;
		
		@(negedge tb_clk);
		tb_n_rst = 0;
		@(negedge tb_clk);
		tb_n_rst = 1;
		@(negedge tb_clk);
		@(negedge tb_clk);
		tb_slave_write = 1;
		tb_slave_chipselect = 1;
		tb_slave_address = 0;
		tb_slave_data = 32'hDEADBEEF;
		@(negedge tb_clk);
		tb_slave_write = 0;
		tb_slave_data = 32'hBAADBEEF;
		tb_slave_address = 3'd1;
		@(negedge tb_clk);
		tb_slave_write = 1;
		@(negedge tb_clk);
		tb_slave_write = 0;
		tb_slave_data = 32'hCA11AB1E;
		tb_slave_address = 3'd2;
		@(negedge tb_clk);
		tb_slave_write = 1;
		@(negedge tb_clk);
		tb_slave_write = 0;
		tb_slave_data = 32'hF01DAB1E;
		tb_slave_address = 3'd3;
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		tb_slave_write = 1;
		@(negedge tb_clk);
		tb_slave_write = 0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		
	end

endmodule

		//
