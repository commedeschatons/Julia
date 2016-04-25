/*
	when bae tells you she found the next available julia worker block
	muxing based on <^v>
	http://stackoverflow.com/questions/19875899/how-to-define-a-parameterized-multiplexer-using-systemverilog
	
	http://stackoverflow.com/questions/12504837/verilog-generate-genvar-in-an-always-block3
*/

module search
#(
	NUM_JULIA = 8
)
(
	
	input wire clk,
	input wire n_rst,
	input wire [NUM_JULIA*32 -1:0] cataddresses,
	input wire [NUM_JULIA*8 -1:0] catpixels,
	input wire [NUM_JULIA -1:0] done,
	output reg found,
	output reg [7:0] sel_data,
	output reg [31:0] sel_address
		
	);	

	reg shift_enable;
	reg [NUM_JULIA -1:0] mask;
	
	//search state logic block
	assign found = ~shift_enable;
	
	
	mask_gen #(NUM_JULIA) mg (
		.clk(clk),
		.shift_enable(shift_enable),
		.n_rst(n_rst), 
		.mask(mask)
	);
	
	//address and pixel muxing
	genvar k;
	
	generate
	
	for (k = 0; k < NUM_JULIA; k=k+1) begin
	always @(mask) begin
	sel_data = '1;
	sel_address = '1;
	shift_enable = 1;
	
	
		
		
			if ((mask & done) == 1<<k) begin
				
				sel_address[31:0] = cataddresses[32*(k+1) -1: k*32];
    			sel_data[7:0] = catpixels[8*(k+1) -1: k*8];
				shift_enable = 0;
			end
		
		
	
	end
	
	end
	endgenerate


	
	
endmodule
