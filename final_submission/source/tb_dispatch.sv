// $Id: $
// File name:   tb_dispatch.sv
// Created:     4/28/2016
// Author:      Alan Moretton
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: test bench for the dispatch

`timescale 1ns / 100ps

module tb_dispatch ();

	// Define parameters
	// basic test bench parameters
	localparam CLK_PERIOD = 2.5;
	localparam CHECK_DELAY =1;
	//localparam NUM_CNT_BITS = 4;
	//localparam NUM_X_BITS = 4;
	//localparam NUM_Y_BITS = 4;

	// Shared Test Variables
	reg tb_clk;
	logic tb_n_rst = 1;
	logic tb_start = 0;
	logic [15:0] tb_jw_dp_ready;

	logic [15:0] tb_dp_jw_start;
	logic [9:0] tb_x_reg [15:0];
	logic [9:0] tb_y_reg [15:0];

	//genvar i;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	dispatch DISP
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.start(tb_start),
		.jw_dp_ready(tb_jw_dp_ready),
		
		.dp_jw_start(tb_dp_jw_start),
		.x_reg(tb_x_reg),
		.y_reg(tb_y_reg),
		.incr(inc)
	);

	initial begin
		tb_n_rst =1;

      		@(posedge tb_clk);
      		#(CHECK_DELAY);
      		tb_n_rst =0;

      		@(posedge tb_clk);
      		#(CHECK_DELAY);
      		tb_n_rst =1;      
		tb_start = 0;
		tb_jw_dp_ready = '1;

      		@(posedge tb_clk);
      		tb_start = 1;
		@(posedge tb_clk);
		tb_start = 0;
		@(posedge tb_clk);
		//@(posedge tb_clk);
		#(CHECK_DELAY);
		if (tb_dp_jw_start[0] == 1) begin
			$info("start[0] asserted");
			tb_jw_dp_ready[0] = 0;
		end
		
		@(posedge tb_clk);
		@(posedge tb_clk);
      		@(posedge tb_clk);
		#(CHECK_DELAY);
		if (tb_dp_jw_start[1] == 1) begin
			$info("start[1] asserted");
			tb_jw_dp_ready[1] = 0;
		end
		@(posedge tb_clk);
      		@(posedge tb_clk);
      		@(posedge tb_clk);
		#(CHECK_DELAY);
		if (tb_dp_jw_start[2] == 1) begin
			$info("start[2] asserted");
			tb_jw_dp_ready[2] = 0;
		end
      		#(CHECK_DELAY);
		//tb_jw_dp_ready[14] = 1;
		

      		@(posedge tb_clk);
      		#(CHECK_DELAY);
		tb_jw_dp_ready[1] = 0;
		//tb_jw_dp_ready[13] = 1;
	
   	end

   	/*&generate
   		for(i = 0; i < 101; i = i+1) begin      
	 		initial begin
	    			@(posedge tb_clk);
	    			#(CHECK_DELAY);
	 		end
   	   	end
	endgenerate	*/	
endmodule
