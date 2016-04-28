/*

	Dimitri James
	generates the round-robin rotating mask ya know?
	just a wrapper
*/

module mask_gen
#(
	NUM_WRK = 4 //NUMBER OF Julia workers
)
(	
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	output reg [(4-1):0] mask
	//todo input output
);


	flex_stp_sr #(4, 1) FSS (
		.clk(clk),
		.n_rst(n_rst),
		.serial_in(mask[4-1]),
		.shift_enable(shift_enable),
		.parallel_out(mask)
	
	);
	
endmodule
