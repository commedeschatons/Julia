/*

When bae tells you to write the mem ctlr

*/

module mem
#(
NUM_JULIA = 8;
)
(
	input wire clk,
	input wire n_rst,
	input wire wait_request,
	input wire [32*NUM_JULIA -1:0] cataddresses,
	input wire [8*NUM_JULIA -1:0] catpixels,
	input wire [NUM_JULIA -1:0] done,
	output reg [NUM_JULIA -1:0] free,
	output reg [31:0] write_address,
	output reg [7:0] write_data,
	output reg write_enable
	
)


//internal stuff

	reg [NUM_JULIA -1: 0] mask;
	reg [31:0] sel_address_syn;
	reg [7:0] sel_data_syn;
	reg found;

	typedef enum 	    bit [3:0] {NEXTDONE, ASSERT, WRITE, DEASSERT} stateType;
	stateType state;
	stateType nextstate;
	
	
	always_ff @(posedge clk, negedge n_rst) begin
	
		if (n_rst ==0) begin

			state <= IDLE;
		end
		else begin
			state <= nextstate;
		
		end
	
	end
	
	//NS/OUTPUT logic
	always_comb begin
		nextstate = state;
		write_data = '0;
		write_
		case (state)
			NEXTDONE: begin
				if (found)
					nextstate = ASSERT;
				
			end
			ASSERT: begin
				if (~wait_request)
					nextstate = WRITE; 
				
				write_data = sel_data_syn;
				write_address = sel_address_syn;
				write_enable = 1'b1;
			end
			WRITE: begin
				nextstate = DEASSERT;
				write_data = sel_data_syn;
				write_address = sel_address_syn;
				write_enable = 1'b1;
			end
			DEASSERT: begin
				//1clk
				nextstate = NEXTDONE; 
				
			end
			
		endcase
		
	end
	
	
	search #(NUM_JULIA) JANGO_FETT (
		.clk(clk),
		.n_rst(n_rst),
		.cataddresses(cataddresses),
		.catpixels(catpixels),
		.done(done),
		.found(found),
		.sel_data_syn(sel_data_syn),
		.sel_address_syn(sel_data_syn),
		.mask(mask)
	);
endmodule	
	
	
