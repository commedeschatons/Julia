/*

	(memory) Search controller uses round robin to generate a rotating mask. 
	The mask is constantly being compared to the concatenated done flags of all 16 julia workers (scales , though),
	
	When both high bits line up the search controller will pause the shifting and mux the data from the concatenated 32*NUM_JULIA data line for both pixels and addresses.
	
	(notice the for-loop brilliance),
	
	when it is determined, 


	http://stackoverflow.com/questions/19875899/how-to-define-a-parameterized-multiplexer-using-systemverilog
	
	http://stackoverflow.com/questions/12504837/verilog-generate-genvar-in-an-always-block3
	
	Dimitri James
*/

module search
#(
	NUM_JULIA = 16
)
(
	
	input wire clk,
	input wire n_rst,
	input wire [NUM_JULIA*32 -1:0] cataddresses, //concatenated data from ALL julia works
	input wire [NUM_JULIA*32 -1:0] catpixels, // same as above, but pixel data
	input wire [NUM_JULIA -1:0] done,
//	input wire release_search,
	output reg found,
	output reg [31:0] sel_data,
	output reg [31:0] sel_address,
	output reg [NUM_JULIA-1:0] mask //output
	);	
	
	//reg [31:0] sel_data;
	//reg [31:0] sel_address;

	reg shift_enable;
	//reg [NUM_JULIA -1:0] mask;
	
	//search state logic bloc
	
	
	mask_gen  mg (
		.clk(clk),
		.shift_enable(shift_enable),
		.n_rst(n_rst), 
		.mask(mask)
	);
	
	/*
	
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
	*/
	//address and pixel muxing

	
	assign found = (~shift_enable);
	
	
	//pretty sure this becomes a latch lololol.
	
	genvar k;
	always_comb begin
		sel_address = '1;
		sel_data = '1;
		shift_enable = 1;
		for (int k=0; k<NUM_JULIA; k=k+1) begin
			if ((mask & done) == 1<<k) begin
			
			sel_address[31:0] = cataddresses[k*32 +: 32]; //works!
				sel_data[31:0] = catpixels[k*32 +: 32]; //Wow!
				shift_enable = 0; //note that this will change when the Mem ctl changes the Free flag, because the done flag will fall then! and shifting will continue.
			
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
