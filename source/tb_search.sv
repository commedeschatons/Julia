// $Id: $
// File name:   tb_eop_detect.sv
// Created:     2/25/2016
// Author:      Dimitri James
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: 

`timescale 1ns/10ps

module tb_search ();

	
	
	localparam CLOCK_PER = 2.5;
	localparam CHECK_DELAY = 1;
	localparam NB = 4;

	reg clk;
	reg n_rst;
	reg se;
	reg [NB-1:0] mask;
	reg [NB*32 -1:0] ca = 'habfdebfdddbefaFCDA9879BAC10FFFFAABECD98;
	reg [NB*32 -1:0] cp = 'haabababababababcdefabcedf928302;
	reg [NB-1:0] d = 4'b1000;
	reg found;
	reg [31:0] sas;
	reg [31:0] sds;
	reg rs;


	
	search mg (
		.clk(clk),
		.n_rst(n_rst),
		.cataddresses(ca),
		.catpixels(cp),
		.done(d),
		.sel_data(sds),
		.sel_address(sas),
		.found(found),
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

		n_rst=0;
		rs = 0;
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
		@(negedge clk);
		d[NB-1:0] = 4'b0010; //that shit was freed homy! and it went low
		
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(negedge clk);
		//release search and observe
		rs = 1;
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
