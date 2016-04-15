/*
	when bae tells you she found the next available julia worker block
	
*/

module search
#(
	NUM_BITS = 8;
)
(
	input wire clk,
	input wire n_rst,
	input wire addresses
	input wire [NUM_BITS -1:0] done,
	output reg found,
	output reg [7:0] sel_data,
	output reg [31:0] sel_address
		
	);	
	
	reg shift_enable;
	reg [NUM_BITS -1] mask;
	
	//search state logic block
	assign found = shift_enable = 0;
	
	always_comb begin
		if (mask & done)
			shift_enable = 1;
		else
			shift_enable = 0;
	
	end
	
	mask_gen #(NUM_BITS) mg (
		.clk(clk),
		.shift_enable(shift_enable),
		.n_rst(n_rst), 
		.mask(mask)
	);
	
	
	//address muxing
	always_comb begin
	 for(int i = 0; i < X; i++) begin
  		if(onehot == (1 << i))
    		sel_address = address[i];
	end
	
	//pixel muxing
	always_comb begin
	
	end


endmodule
