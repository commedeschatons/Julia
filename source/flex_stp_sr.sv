// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/29/2016
// Author:      Dimitri James
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: 

//ONLY Modification is that it should reset 
module flex_stp_sr
#(
parameter NUM_BITS = 4,
parameter SHIFT_MSB = 1'b1
)
(
input wire clk,
input wire n_rst,
input wire shift_enable,
input wire serial_in,
output reg [(NUM_BITS-1):0] parallel_out

);

reg [NUM_BITS-1:0] q, d;
always_ff @ (posedge clk, negedge n_rst)
begin

	if (n_rst == 1'b0) begin
		parallel_out[(NUM_BITS-1):1] <= '0;
		parallel_out[0] <= 1'b1;
	end
	else
		parallel_out<=q;
		
end


always_comb
begin

	if (shift_enable == 1'b1)
	begin

	if (SHIFT_MSB == 1'b1)
		q[(NUM_BITS-1):0] = {parallel_out[(NUM_BITS-2):0],  serial_in};
	else
		q[(NUM_BITS-1):0] ={serial_in, parallel_out[(NUM_BITS-1):1]};
	end
	else
		q[(NUM_BITS-1):0] = parallel_out[(NUM_BITS-1):0];
end



endmodule
