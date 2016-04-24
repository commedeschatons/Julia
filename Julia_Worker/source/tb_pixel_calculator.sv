`timescale 1ns / 100ps

module tb_pixel_calculator ();

    // Define parameters
	// basic test bench parameters
   localparam	CLK_PERIOD	= 2.5;
   localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
   localparam  ITERATIONS = 256;
   localparam  WIDTH = 20;
   localparam  FRACTIONAL = 10;
   localparam  INTEGRAL = 10;

   reg tb_clk,tb_n_rst;
   reg signed [WIDTH-1:0] tb_z_real_in;
   reg signed [WIDTH-1:0] tb_z_imag_in;
   reg signed [WIDTH-1:0] tb_c_real_in;
   reg signed [WIDTH-1:0] tb_c_imag_in;
   reg signed [WIDTH-1:0] tb_z_real_out;
   reg signed [WIDTH-1:0] tb_z_imag_out;
   reg signed [WIDTH-1:0] tb_size_squared_out;
   reg unsigned [7:0] tb_iteration_in;
   reg unsigned [7:0] tb_pixel;

   integer testcase;

   pixel_calculator #(ITERATIONS,WIDTH,FRACTIONAL,INTEGRAL) DUT
      (
       .clk(tb_clk),
       .n_rst(tb_n_rst),
       .z_real_in(tb_z_real_in),
       .z_imag_in(tb_z_imag_in),
       .c_real_in(tb_c_real_in),
       .c_imag_in(tb_c_imag_in),
       .z_real_out(tb_z_real_out),
       .z_imag_out(tb_z_imag_out),
       .size_squared_out(tb_size_squared_out),
       .iteration_in(tb_iteration_in),
       .pixel(tb_pixel)
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
	tb_n_rst = 1'b1;
	
	@(posedge tb_clk);
	#(CHECK_DELAY);

	tb_z_real_in = 20'd1024;  // decimal  1.0
	tb_z_imag_in = 20'd512;   // decimal  0.5
	tb_c_real_in = -20'd512;  // decimal -0.5
	tb_c_imag_in = 20'd512;   // decimal  0.5
	tb_iteration_in = 0;

	tb_n_rst = 1'b0;
	
	@(posedge tb_clk);
	#(CHECK_DELAY);
	tb_n_rst = 1'b1;
	
        //TEST CASE 1	
	@(posedge tb_clk);
	#(CHECK_DELAY);

	//expected output:
	//z_real_out = 0.25
	//z_imag_out = 1.5
	//size_squared = 2.3125
	//pixel = 1

        //TEST CASE 2
	@(posedge tb_clk);
	#(CHECK_DELAY);

	//expected output:
	//z_real_out = -2.6875
	//z_imag_out = 1.25
	//size_squared = 8.785
	//pixel = 1


        //TEST CASE 3
	@(posedge tb_clk);
	#(CHECK_DELAY);

	//expected output:
	//pixel = 1


        //TEST CASE 4
	@(posedge tb_clk);
	#(CHECK_DELAY);

	//expected output:
	//pixel = 1
     end
   
endmodule
