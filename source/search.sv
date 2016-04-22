/*
	when bae tells you she found the next available julia worker block
	
*/

module search
#(
	NUM_BITS = 8;
	NUM_JULIA = 8;
)
(
	
	input wire clk,
	input wire n_rst,
	input wire [NUM_JULIA*32 -1:0] cataddresses
	input wire [NUM_JULIA*8 -1:0] catpixels
	input wire [NUM_JULIA -1:0] done,
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
	 for(int i = 0; i < NUM_JULIA-1; i++) begin
  		if(done == (1 << i)) begin
    		sel_address[31:0] = addresses[32*NUM_JULIA -1: i*32];
    		sel_data[7:0] = pixels[8*NUM_JULIA -1: i*8];
    	end	
	end
	
	//pixel muxing
	always_comb begin
		 for(int i = 0; i < NUM_JULIA-1; i++) begin
  		if(done == (1 << i)) begin
    		sel_address[31:0] = addresses[32*NUM_JULIA -1: i*32];
    		sel_data[7:0] = pixels[8*NUM_JULIA -1: i*8];
    	end	
		
	end


endmodule
