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
	input wire release,
	output reg found,
	output reg [7:0] sel_data_syn,
	output reg [31:0] sel_address_syn,
	output reg [NUM_JULIA-1:0] mask
	);	
	
	reg [7:0] sel_data;
	reg [31:0] sel_address;

	reg shift_enable;
	//reg [NUM_JULIA -1:0] mask;
	
	//search state logic bloc
	
	
	mask_gen #(NUM_JULIA) mg (
		.clk(clk),
		.shift_enable(shift_enable &),
		.n_rst(n_rst), 
		.mask(mask)
	);
	
	
	
	always_ff @(posedge clk, negedge n_rst) begin
		if (n_rst == 0) begin
			sel_data_syn <= '0;
			sel_address_syn <= '0;
			found <= 0;
		end
		else begin
			sel_data_syn <= sel_data;
			sel_address_syn <= sel_address;
			
		end
	
	end
	//address and pixel muxing

	
	assign found = ~shift_enable
	
	
	//pretty sure this becomes a latch lololol.
	
	genvar k;
	always_comb begin
		sel_address = '1;
		sel_data = '1;
		shift_enable = 1;
		for (int k=0; k<NUM_JULIA; k=k+1) begin
			if ((mask & done) == 1<<k) begin
			
			sel_address[31:0] = cataddresses[k*32 +: 32];
				sel_data[7:0] = catpixels[k*8 +: 8];
				shift_enable = 0;
			
			end
		
		end
	
	end
	
			//genvar k;
	/*
	generate

	for (genvar k = 0; k < NUM_JULIA; k=k+1) begin
	always @(mask) begin
	sel_data = '1;
	sel_address = '1;
	shift_enable = 1;
	
			if ((mask & done) == 1<<k) begin
				
				sel_address[31:0] = cataddresses[k*32 +: 32];
				sel_data[7:0] = catpixels[k*8 +: 8];
    			//sel_data[7:0] = catpixels[8*(k+1) -1: k*8];
				shift_enable = 0;
			
			
			end
	end
	
	end
	endgenerate
	
	parameter X = 32;  

	reg [X-1:0] onehot;
	reg i_data [X];
	reg  o_data;

	always_comb begin
	o_data = 'z;
	for(int i = 0; i < X; i++) begin
  	if(onehot == (1 << i))
    o_data = cataddresses[32*i +: 32];
end
end

*/

	
endmodule
