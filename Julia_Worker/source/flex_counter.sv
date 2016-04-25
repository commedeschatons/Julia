// $Id: $
// File name:   flex_counter.sv
// Created:     2/4/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: flex_counter.sv

module flex_counter
  #(
    parameter NUM_CNT_BITS = 4
    )
   (
    input wire clk, n_rst, clear, count_enable,
    input [NUM_CNT_BITS-1:0] rollover_val,
    output wire rollover_flag,
    output [NUM_CNT_BITS-1:0] count_out
    );

   reg [NUM_CNT_BITS-1:0]     current_count;
   reg [NUM_CNT_BITS-1:0]     next_count;
   reg 			      next_rollover_flag;
   reg 			      current_rollover_flag;
   
   assign count_out = current_count;
   assign rollover_flag = current_rollover_flag;

   always_ff @ (posedge clk, negedge n_rst) begin
      if(!n_rst) begin
	 current_count <= '0;
	 current_rollover_flag <= 1'b0;

      end else begin
	 current_count <= next_count;
	 current_rollover_flag <= next_rollover_flag;
      end
   end
   
   always_comb begin
      if(clear) begin
	 next_count = '0;
	 next_rollover_flag = 1'b0;
      end else begin
	 if(count_enable) begin
	    next_count = current_count + 1;
	    next_rollover_flag = 1'b0;
	    if(next_count == rollover_val) begin
	       next_rollover_flag = 1'b1;
	    end
	    if(next_count == (rollover_val + 1)) begin
	       next_count = 1;
	    end
	 end else begin
	    next_rollover_flag = current_rollover_flag;
	    next_count = current_count;
	 end
      end
   end

endmodule
   
