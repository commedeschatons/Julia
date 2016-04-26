`timescale 1ns / 100ps

module tb_real2imag ();

    // Define parameters
	// basic test bench parameters
   localparam	CLK_PERIOD	= 2.5;
   localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
   localparam  FRACTIONAL = 11;
   localparam  INTEGRAL = 11;
   localparam  WIDTH = 22;

   reg tb_clk;
   reg unsigned [9:0] tb_x;
   reg unsigned [9:0] tb_y;
   reg signed [WIDTH-1:0] tb_z_real_in;
   reg signed [WIDTH-1:0] tb_z_imag_in;      

   integer testcase;

   real2imag #(WIDTH,FRACTIONAL,INTEGRAL) DUT
     ( 
       .x( tb_x ),
       .y( tb_y ),
       .z_real_out( tb_z_real_in ),
       .z_imag_out( tb_z_imag_in )       
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
        //TEST CASE 1
	testcase = 1;
	tb_x = 0;
	tb_y = 0;
	//expected
	//real:-1
	//imag:-1.5
	
	@(posedge tb_clk);
	#(CHECK_DELAY);

	testcase = 2;
	tb_x = 10'd640;//640
	tb_y = 10'b0111100000; //480

	//expected
	//real:1.5
	//imag:1
	
        @(posedge tb_clk);
        #(CHECK_DELAY);
	
	testcase = 3;
	tb_x = 10'b0101000000;//320 
	tb_y = 10'b0011110000;//240

	//expected
	//real:0
	//imag:0

	@(posedge tb_clk);
        #(CHECK_DELAY);

     end
   
endmodule
