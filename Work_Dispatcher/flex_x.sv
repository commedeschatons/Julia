// $Id: $
// File name:   flex_x.sv
// Created:     4/22/2016
// Author:      Alan Moretton
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: The x flex counter count the horizontal location


module flex_x
#(
parameter NUM_X_BITS = 4
)

(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [NUM_X_BITS-1:0] rollover_val,

	output reg [NUM_X_BITS-1:0] count_out, //x
	output reg rollover_flag
);
reg [NUM_X_BITS-1:0] next;

reg flag;

always_ff @ (posedge clk, negedge n_rst) //counter ff
begin
	if (n_rst == 1'b0)
		count_out <= '0;
	else
	begin

		if (clear == 1'b1)
			count_out <= '0;
		else
			count_out <= next;
		
	end
end

always_comb //counter
begin

	if (count_enable == 1'b1)
	begin
		if (count_out == rollover_val)
			next = 1;
		else
			next = count_out + 1;
	end
	else
		next = count_out;
		
end

always_ff @ (posedge clk, negedge n_rst)
begin

	if (n_rst == 1'b0)
		rollover_flag <=1'b0;
	else
	begin
		if (clear == 1'b1)
			rollover_flag <= 1'b0;
		else
		begin
			if (count_enable == 1'b0)
				rollover_flag <=rollover_flag;
			else
			begin
				if (count_out == rollover_val -1)
					rollover_flag <= 1'b1;
				else
					rollover_flag <= 1'b0;
			end
		end
		
	end

end


endmodule
