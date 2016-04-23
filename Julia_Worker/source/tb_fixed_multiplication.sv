`timescale 1ns / 100ps

module tb_fixed_multiplication ();

    // Define parameters
	// basic test bench parameters
   localparam	CLK_PERIOD	= 2.5;
   localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
   localparam  FRACTIONAL = 10;
   localparam  INTEGRAL = 10;   

   reg tb_clk;
   reg signed [19:0] tb_a;
   reg signed [19:0] tb_b;
   reg signed [19:0] tb_result;   

   integer testcase;

   fixed_multiplication DUT
     ( 
       .a( tb_a ),
       .b( tb_b ),
       .result( tb_result )
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
	tb_a = 0;
	tb_b = 0;
	tb_result = 0;
	@(posedge tb_clk);
	#(CHECK_DELAY);

	tb_a = -20'b0000000010011001101;
	tb_b = -20'b0000000010011001101;

        @(posedge tb_clk);
        #(CHECK_DELAY);
	
        if( tb_result == 20'b00000000010111000011 )
          $info("Test case 1(-1.2*-1.2): PASSED");
        else 
          $error("Test case 1(-1.2*-1.2): FAILED");

	@(posedge tb_clk);
        #(CHECK_DELAY);

        //TEST CASE 2
	testcase = 2;
	tb_a = 0;
	tb_b = 0;
	tb_result = 0;
	@(posedge tb_clk);
	#(CHECK_DELAY);

	tb_a = 20'b00000000010000000000;
	tb_b = 20'b00000000010000000000;

        @(posedge tb_clk);
        #(CHECK_DELAY);
	
        if( tb_result == 20'b00000000010000000000 )
          $info("Test case 2(1*1): PASSED");
        else 
          $error("Test case 2(1*1): FAILED");

	@(posedge tb_clk);
        #(CHECK_DELAY);
	

     end
   
endmodule
