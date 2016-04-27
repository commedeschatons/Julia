`timescale 1ns / 100ps

module tb_wcu ();

    // Define parameters
	// basic test bench parameters
   localparam	CLK_PERIOD	= 2.5;
   localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay

   reg tb_clk;
   reg tb_n_rst;
   reg tb_calc_start;
   reg tb_calc_done;
   reg tb_JW_start;
   reg tb_MC_busy;
   reg tb_JW_ready;
   reg tb_JW_done;
   reg tb_convert_start;
   reg tb_convert_done;

   integer testcase;

   wcu DUT
      (
       .clk(tb_clk),
       .n_rst(tb_n_rst),
       .calc_start(tb_calc_start),
       .calc_done(tb_calc_done),
       .JW_start(tb_JW_start),
       .MC_busy(tb_MC_busy),
       .JW_ready(tb_JW_ready),
       .JW_done(tb_JW_done),
       .convert_done(tb_convert_done),
       .convert_start(tb_convert_start)
       );

   // Clock generation block
   always
     begin
	tb_clk = 1'b0;
	#(CLK_PERIOD/2.0);
	tb_clk = 1'b1;
	#(CLK_PERIOD/2.0);
     end
   
   initial
     begin
	testcase = 1;
	tb_JW_start = 0;
	tb_MC_busy = 1;
	tb_calc_done = 0;

	tb_n_rst = 0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	tb_n_rst = 1;
	@(posedge tb_clk);
	#(CHECK_DELAY);

	tb_JW_start = 1;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	tb_JW_start = 0;
	
	@(posedge tb_clk);
	#(CHECK_DELAY);
	@(posedge tb_clk);
	#(CHECK_DELAY);
	@(posedge tb_clk);
	#(CHECK_DELAY);
	@(posedge tb_clk);
	#(CHECK_DELAY);
	tb_convert_done = 1;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	@(posedge tb_clk);
	#(CHECK_DELAY);
	
	tb_calc_done = 1;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	@(posedge tb_clk);
	#(CHECK_DELAY);
	@(posedge tb_clk);
	#(CHECK_DELAY);
	@(posedge tb_clk);
	#(CHECK_DELAY);

	tb_MC_busy = 0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	tb_MC_busy = 1;
	
	@(posedge tb_clk);
	#(CHECK_DELAY);
	
     end
   
endmodule
