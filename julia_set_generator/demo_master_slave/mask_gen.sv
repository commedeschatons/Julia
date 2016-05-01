/*

	Generates a Rotating 1-bit N-bit mask (for n bit julia workers), based on a slightly modified flexstpsr
	to be used in the Memory Search controller.

	james71@purdue.edu Dimitri James
	
	
*/

module mask_gen
#(
	NUM_WRK = 16 //NUMBER OF Julia workers
)
(	
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	output reg [(NUM_WRK-1):0] mask
	//todo input output
);


	flex_stp_sr #(16, 1) FSS (
		.clk(clk),
		.n_rst(n_rst),
		.serial_in(mask[NUM_WRK-1]),
		.shift_enable(shift_enable),
		.parallel_out(mask)
	
	);
	
endmodule
