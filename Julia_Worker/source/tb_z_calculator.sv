`timescale 1ns / 100ps

module tb_z_calculator ();

    // Define parameters
	// basic test bench parameters
   localparam	CLK_PERIOD	= 2.5;
   localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
   localparam  WIDTH = 22;
   localparam  FRACTIONAL = 11;
   localparam  INTEGRAL = 11;

   reg tb_clk;
   reg signed [WIDTH-1:0] tb_z_real_in;
   reg signed [WIDTH-1:0] tb_z_imag_in;
   reg signed [WIDTH-1:0] tb_c_real_in;
   reg signed [WIDTH-1:0] tb_c_imag_in;
   reg signed [WIDTH-1:0] tb_z_real_out;
   reg signed [WIDTH-1:0] tb_z_imag_out;
   reg signed [WIDTH-1:0] tb_size_squared_out;
   reg unsigned [7:0] tb_iteration_in;
   reg unsigned [7:0] tb_iteration_out;

   integer testcase;

   z_calculator #(WIDTH,FRACTIONAL,INTEGRAL) DUT
     ( 
       .z_real_in(tb_z_real_in),
       .z_imag_in(tb_z_imag_in),
       .c_real_in(tb_c_real_in),
       .c_imag_in(tb_c_imag_in),
       .z_real_out(tb_z_real_out),
       .z_imag_out(tb_z_imag_out),
       .size_squared_out(tb_size_squared_out),
       .iteration_in(tb_iteration_in),
       .iteration_out(tb_iteration_out)
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
	@(posedge tb_clk);
	#(CHECK_DELAY);

	testcase = 1;

	tb_z_real_in = 22'd2048;  // decimal  1.0
	tb_z_imag_in = 22'd1024;   // decimal  0.5
	tb_c_real_in = -22'd1024;  // decimal -0.5
	tb_c_imag_in = 22'd1024;   // decimal  0.5
	tb_iteration_in = 1;

	//expected output:
	//z_real_out = 0.25
	//z_imag_out = 1.5
	//size_squared = 2.3125
	//iteration_out = 1

        //TEST CASE 2
	@(posedge tb_clk);
	#(CHECK_DELAY);

	testcase = 2;

	tb_z_real_in = tb_z_real_out;
	tb_z_imag_in = tb_z_imag_out;
	tb_iteration_in = tb_iteration_out;

	//expected output:
	//z_real_out = -2.6875
	//z_imag_out = 1.25
	//size_squared = 8.785
	//iteration_out = 1

        //TEST CASE 3
	@(posedge tb_clk);
	#(CHECK_DELAY);

	testcase = 3;

	tb_z_real_in = tb_z_real_out;
	tb_z_imag_in = tb_z_imag_out;
	tb_iteration_in = tb_iteration_out;

        //TEST CASE 4
	@(posedge tb_clk);
	#(CHECK_DELAY);

	testcase = 4;

	tb_z_real_in = tb_z_real_out;
	tb_z_imag_in = tb_z_imag_out;
	tb_iteration_in = tb_iteration_out;

     end
   
endmodule
