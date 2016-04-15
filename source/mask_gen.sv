/*

	Dimitri James
	generates the round-robin rotating mask ya know?
	just a wrapper
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


	flex_stp_sr #(NUM_WRK, 1) FSS (
		.clk(clk),
		.n_rst(n_rst),
		.serial_in(mask[NUM_WRK-1]),
		.shift_enable(shift_enable),
		.parallel_out(mask)
	
	);
	
endmodule
