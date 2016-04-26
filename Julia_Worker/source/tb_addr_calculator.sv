`timescale 1ns / 100ps

module tb_addr_calculator ();

    // Define parameters
	// basic test bench parameters
   localparam	CLK_PERIOD	= 2.5;
   localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
   localparam  PIXELBITS = 4; //8 bits color

   reg tb_clk;
   reg unsigned [9:0] tb_x;
   reg unsigned [9:0] tb_y;
   reg unsigned [PIXELBITS-1:0] tb_pixel_size;
   reg unsigned [31:0] tb_offset;
   reg unsigned [31:0] tb_address;

   integer testcase;

   addr_calculator #(PIXELBITS) DUT
     ( 
       .x( tb_x ),
       .y( tb_y ),
       .pixel_size( tb_pixel_size ),
       .offset( tb_offset ),
       .address( tb_address )
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
	tb_pixel_size = 8;
	
        //TEST CASE 1
	testcase = 1;
	tb_x = 0;
	tb_y = 0;
	tb_offset = 32'h3E8; //'d1000

	//expected
	//address:'h3E8
	
	@(posedge tb_clk);
	#(CHECK_DELAY);

	testcase = 2;
	tb_x = 10'd2; //(1,2)
	tb_y = 10'd1;
	tb_offset = 32'h3E8;

	//expected
	//address:'h1800
	
        @(posedge tb_clk);
        #(CHECK_DELAY);
	
     end
   
endmodule
