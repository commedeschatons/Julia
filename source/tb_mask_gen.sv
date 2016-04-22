// $Id: $
// File name:   tb_eop_detect.sv
// Created:     2/25/2016
// Author:      Dimitri James
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: 

`timescale 1ns/10ps

module tb_mask_gen ();

	
	
	localparam CLOCK_PER = 2.5;
	localparam CHECK_DELAY = 1;
	localparam NB = 8;

	reg clk;
	reg n_rst;
	reg se;
	reg [NB-1:0] mask;
	


	
	mask_gen #(NB) mg (
		.clk(clk),
		.n_rst(n_rst),
		.shift_enable(se),
		.mask(mask)
	);


	// Generate clock.
	always begin 
		clk = 0;
		#(CLOCK_PER / 2);
		clk = 1;
		#(CLOCK_PER / 2);
	end

	initial begin
		se = 1;
		n_rst=0;
		@(negedge clk);
		//lets try some more clk periods, see wrap around
		n_rst = 1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		//12 clk periods
		//lemme see that pause tho
		@(negedge clk);
		se = 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(negedge clk);
		se = 1;
		@(posedge clk);
		@(posedge clk);
		
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
	
	end
	
endmodule
