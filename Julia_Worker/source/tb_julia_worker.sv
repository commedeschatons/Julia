`timescale 1ns / 100ps

module tb_julia_worker ();

    // Define parameters
	// basic test bench parameters
   localparam	CLK_PERIOD	= 2.5;
   localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay

   localparam  ITERATIONS = 256;
   localparam  WIDTH = 22;
   localparam  FRACTIONAL = 11;
   localparam  INTEGRAL = 11;
   localparam  PIXELBITS = 4;

   reg tb_clk;
   reg tb_n_rst;
   reg [9:0] tb_x;
   reg [9:0] tb_y;
   reg 	     tb_JW_start = 0;
   reg 	     tb_MC_busy;
   reg 	     tb_JW_ready;
   reg 	     tb_JW_done;
   reg [7:0] tb_pixel;
   reg [WIDTH-1:0] tb_c_real_in;
   reg [WIDTH-1:0] tb_c_imag_in;

   integer testcase;

   julia_worker DUT
      (
       .clk(tb_clk),
       .n_rst(tb_n_rst),
       .x(tb_x),
       .y(tb_y),
       .JW_start(tb_JW_start),
       .MC_busy(tb_MC_busy),
       .JW_ready(tb_JW_ready),
       .JW_done(tb_JW_done),
       .pixel(tb_pixel),
       .c_real_in(tb_c_real_in),
       .c_imag_in(tb_c_imag_in)
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
	/*
	 testcase = 1;
	 tb_n_rst = 1;
	 //tb_x = 384;
	 //tb_y = 264;
	 tb_c_real_in = 22'd512;  // decimal -0.5
	 tb_c_imag_in = 22'd512;   // decimal  0.5

	 tb_JW_start = 0;
	 tb_MC_busy = 1;

	 @(posedge tb_clk);
	 #(CHECK_DELAY);
	 */
	testcase = 1;
	tb_n_rst = 1;
	tb_c_real_in = 22'd512;
	tb_c_imag_in = 22'd512;
	tb_x = 0;
	tb_y = 0;

	tb_MC_busy = 1;
	tb_n_rst = 0;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	tb_n_rst = 1;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	
	forever begin
	   if(tb_JW_ready == 1) begin
	      $info("JW_ready signal received");
	      break;
	   end
	end

	@(posedge tb_clk);
	#(CHECK_DELAY);
	
	tb_JW_start = 1;
	$info("JW_start signaled high");	

	@(posedge tb_clk);
	#(CHECK_DELAY);


	tb_JW_start = 0;

	forever begin
	   if(tb_JW_done == 1)begin
	      $info("JW_done signal received");
	      break;
	   end else begin
	      $info("JW_done signal not received");	      
	      @(posedge tb_clk);
	      #(CHECK_DELAY);
	   end
	end

	@(posedge tb_clk);
	#(CHECK_DELAY);
	
	tb_MC_busy = 0;
	$info("MC_busy signaled low");

	@(posedge tb_clk);
	#(CHECK_DELAY);
	@(posedge tb_clk);
	#(CHECK_DELAY);
	@(posedge tb_clk);
	#(CHECK_DELAY);

	testcase = 2;
	tb_x = 384;
	tb_y = 264;
	tb_MC_busy = 1;

	@(posedge tb_clk);
	#(CHECK_DELAY);
	
	forever begin
	   if(tb_JW_ready == 1) begin
	      $info("JW_ready signal received");
	      break;
	   end
	end

	@(posedge tb_clk);
	#(CHECK_DELAY);

	tb_JW_start = 1;
	$info("JW_start signaled high");	

	@(posedge tb_clk);
	#(CHECK_DELAY);

	tb_JW_start = 0;

	forever begin
	   if(tb_JW_done == 1)begin
	      $info("JW_done signal received");
	      break;
	   end else begin
	      $info("JW_done signal not received");	      
	      @(posedge tb_clk);
	      #(CHECK_DELAY);
	   end
	end

	@(posedge tb_clk);
	#(CHECK_DELAY);

	tb_MC_busy = 0;
	$info("MC_busy signaled low");

	@(posedge tb_clk);
	#(CHECK_DELAY);
	
	tb_MC_busy = 1;
	
     end

endmodule
