/*

When bae tells you to write the mem ctlr

*/

module mem
#(
NUM_JULIA = 16
)
(
	input wire clk,
	input wire n_rst,
	input wire wait_request,
	input wire [32*NUM_JULIA -1:0] cataddresses,
	input wire [32*NUM_JULIA -1:0] catpixels,
	input wire [NUM_JULIA -1:0] done,
	output reg [NUM_JULIA -1:0] free,
	output reg [31:0] write_address,
	output reg [31:0] write_data,
	output reg write_enable
	
);


//internal stuff
	reg [NUM_JULIA -1 :0] free_save;
	reg [NUM_JULIA -1: 0] mask;
	reg [31:0] sel_address_syn;
	reg [31:0] sel_data_syn;
	reg found;
	//reg release_search;
	typedef enum 	    bit [2:0] {NEXTDONE, ASSERT,ASSERT2, WRITE, DEASSERT} stateType;
	stateType state;
	stateType nextstate;
	reg [31:0] sel_address_save;
	reg [31:0] sel_data_save;
	
	always_ff @(posedge clk, negedge n_rst) begin
	
		if (n_rst ==0) begin
			
			state <= NEXTDONE;

			sel_address_save <='0;
			sel_data_save <= '0;
			free <= 0;
		end
		else begin
			state <= nextstate;
			//release_search <= 0;
			if (state == ASSERT) begin
				free <= mask; // save DATA immediately!
				sel_address_save <= sel_address_syn;
				sel_data_save <= sel_data_syn;
				
			end
		
		end
	
	end
	
	//NS/OUTPUT logic
	always_comb begin
		nextstate = state;
		write_data = '0;
		write_address = '0;
		write_enable = 0;
		//free = '0;
	//	release_search = 0;
		case (state)
			NEXTDONE: begin
				if (found)
					nextstate = ASSERT;
				
			end
			ASSERT: begin
			if (~wait_request)
					nextstate = WRITE; 
			else
			  nextstate = ASSERT2;
			   
				write_data = sel_data_save;
				write_address = sel_address_save;
				write_enable = 1'b1;
			  
			//	release_search = 1;
			end
		        ASSERT2: begin
			   if (~wait_request)
			     nextstate = WRITE;
			   
			   write_data = sel_data_save;
			   write_address = sel_address_save;
			   write_enable = 1'b1;
			   
	 
			end
			WRITE: begin
				nextstate = DEASSERT;
				write_data = sel_data_save;
				write_address = sel_address_save;
				write_enable = 1'b1;
			//	release_search = 1;
			end
			DEASSERT: begin
				//1clk
				nextstate = NEXTDONE; 
				
				//release_search =1;
				
			end
			
		endcase
		
	end
	
	
	search JANGO_FETT (
		.clk(clk),
		.n_rst(n_rst),
		.cataddresses(cataddresses),
		.catpixels(catpixels),
		.done(done),
		.found(found),
		//.release_search(.release_search);
		.sel_data(sel_data_syn),
		.sel_address(sel_address_syn),
		.mask(mask)
	);
endmodule	
	
	
