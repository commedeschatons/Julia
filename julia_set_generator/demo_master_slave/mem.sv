/*

	Memory Controller
	
	This block takes the data from ALL Julia workers (done signals, addresses, and pixels.
	When the search controller finds another done julia worker, the mem ctl will save its data immediately it can (It can be writing while Search ctl is searching for higher efficiency), and then free the worker (same signal as mask), to allow it too resume working immediately. 
	
	Now, an FSM handles intelligently supplying the data and enable signals to write to SRAM.
	
	Dimitri James

*/

module mem
#(
NUM_JULIA = 16
)
(
	input wire clk, 
	input wire n_rst,
	input wire wait_request,
	input wire [32*NUM_JULIA -1:0] cataddresses, //concatenated data line
	input wire [32*NUM_JULIA -1:0] catpixels, // ""
	input wire [NUM_JULIA -1:0] done, //done flags
	output reg [NUM_JULIA -1:0] free, //free flags (sends to julia worker to tell it can find another job)
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
			if (state == ASSERT) begin // this block will allow us to free a JULIA worker IMMEDIATELY instead of having it wait a huge amount of clock cycles and immeidately it can work on another job when dispatcher gives it job.
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
			ASSERT: begin // wait for wait request to go low, if it does go immediatley to write
			if (~wait_request)
					nextstate = WRITE; 
			else // otherwise go immediately to assert2.
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
	
	//Tried to Kill Mace Windu 
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
	
	
