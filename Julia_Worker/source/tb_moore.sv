`timescale 1ns / 100ps

module tb_moore ();

    // Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 2.5;
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
    localparam  NUM_CNT_BITS = 4;


    reg tb_clk;
    reg tb_n_rst;
    reg tb_i;
    reg tb_o;

    integer testcase;

    moore DUT
    ( 
        .clk( tb_clk ),
        .n_rst( tb_n_rst ),
        .i( tb_i ),
        .o( tb_o )
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
        //TEST CASE 1 - nRst
	testcase = 1;
	tb_n_rst		= 1'b0;		
	tb_i = 1'b1;

        @(posedge tb_clk);
        @(posedge tb_clk); 	
        #(CHECK_DELAY);
	
        if( tb_o == 0 )
            $info("Test case 1(n_Rst): PASSED");
        else 
            $error("Test case 1(n_Rst): FAILED");
        
        //TEST CASE 2 - '1
	testcase = 2;
	tb_n_rst		= 1'b1;		
	tb_i = 1'b1;

        @(posedge tb_clk);

        #(CHECK_DELAY);
	
        if( tb_o == 0 )
            $info("Test case 1('1): PASSED");
        else 
            $error("Test case 1('1): FAILED");

        //TEST CASE 3 - '110
	testcase = 3;
	tb_n_rst		= 1'b1;		
	tb_i = 1'b1;
	
        @(posedge tb_clk);
        @(posedge tb_clk);

	tb_i = 1'b0;
	@(posedge tb_clk);

        #(CHECK_DELAY);
	
        if( tb_o == 0 )
            $info("Test case 1('110): PASSED");
        else 
            $error("Test case 1('110): FAILED");

        //TEST CASE 4 - '1101
	testcase = 4;
	tb_n_rst		= 1'b1;		
	tb_i = 1'b1;
	
        @(posedge tb_clk);
        @(posedge tb_clk);

	tb_i = 1'b0;
	@(posedge tb_clk);

	tb_i = 1'b1;
	@(posedge tb_clk);
	
        #(CHECK_DELAY);
	
        if( tb_o == 1 )
            $info("Test case 1('1101): PASSED");
        else 
            $error("Test case 1('1101): FAILED");

        //TEST CASE 5 - '11011011
	testcase = 5;
	tb_n_rst		= 1'b0;
	tb_i = 1'b0;
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	
	tb_i = 1'b1;
        @(posedge tb_clk);
        @(posedge tb_clk);
	tb_i = 1'b0;
	@(posedge tb_clk);
	tb_i = 1'b1;
	@(posedge tb_clk);

        #(CHECK_DELAY);
	
        if( tb_o == 1 )
            $info("Test case 5.1('1101): PASSED");
        else 
            $error("Test case 5.1('1101): FAILED");

	
	@(posedge tb_clk);	
	tb_i = 1'b0;
	@(posedge tb_clk);
	tb_i = 1'b1;
	@(posedge tb_clk);

        #(CHECK_DELAY);
	
        if( tb_o == 1 )
            $info("Test case 5.2('1101): PASSED");
        else 
            $error("Test case 5.2('1101): FAILED");
		
     end
endmodule
