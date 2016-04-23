// $Id: $
// File name:   moore.sv
// Created:     2/10/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: moore.sv

module moore
  (
   input wire clk,
   input wire n_rst,
   input wire i,
   output reg o
   );

   typedef enum bit [3:0]
		{STATE_1101,STATE_110,STATE_11,STATE_1,IDLE} moore_st;
   moore_st state;
   moore_st next_state;

   assign o = (state == STATE_1101);
   
   always_ff @ (negedge n_rst, posedge clk) begin
      if(n_rst == 1'b0)
	state <= IDLE;
      else
	state <= next_state;
   end

   always_comb begin
      next_state = state;
      case(state)
	
	IDLE: begin
	   if(i == 1'b0)
	     next_state = IDLE;
	   else
	     next_state = STATE_1;
	end
	
	STATE_1: begin
	   if(i == 1'b1)
	     next_state = STATE_11;
	   else
	     next_state = IDLE;
	end
	
	STATE_11: begin
	   if(i == 1'b0)
	     next_state = STATE_110;
	   else
	     next_state = STATE_11;
	end
	
	STATE_110: begin
	   if(i == 1'b1)
	     next_state = STATE_1101;
	   else
	     next_state = IDLE;
	end
	
	STATE_1101: begin
	   if(i == 1'b1)
	     next_state = STATE_11;
	   else
	     next_state = IDLE;
	end
	
	default: begin
	   next_state = IDLE;
	end
      endcase
   end

endmodule