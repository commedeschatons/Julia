// $Id: $
// File name:   wcu.sv
// Created:     4/24/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: takes input from work dispatcher and send output to memory controller

module wcu
  (
   input       clk,
   input       n_rst,
   input       JW_start,
   input       MC_busy,
   input calc_done,
   output reg      JW_ready ,
   output reg       JW_done,
   output reg calc_start
   );

   typedef enum bit[2:0]
		{IDLE, ASK_WAIT, CALC, WRITE_WAIT} wcu_state;

   wcu_state state;
   wcu_state next_state;

   always @(posedge clk,negedge n_rst) begin
      if(n_rst==1'b0) begin
	 state <= IDLE;
      end
      else begin
	 state <= next_state;
      end
   end

   always_comb begin
      next_state = state;
      JW_ready = 0;
      JW_done = 0;
      calc_start = 0;

      case(state)
	IDLE: begin
	   JW_ready = 0;
	   JW_done = 0;
	   calc_start = 0;

	   next_state = ASK_WAIT;
	end
	
	ASK_WAIT: begin
	   JW_ready = 1;
	   JW_done = 0;
	   calc_start = 0;

	   if(JW_start == 1'b1) begin
	      next_state = CALC;
	   end else begin
	      next_state = ASK_WAIT;
	   end
	end
	
	CALC: begin
	   JW_ready = 0;
	   JW_done = 0;
	   calc_start = 1;

	   if(calc_done == 1'b1) begin
	      next_state = WRITE_WAIT;
	   end
	   else begin
	      next_state = CALC;
	   end
	end

	WRITE_WAIT: begin
	   JW_ready = 0;
	   JW_done = 1;
	   calc_start = 1;

	   if(MC_busy == 1'b0) begin
	      next_state = ASK_WAIT;
	   end
	   else begin
	      next_state = WRITE_WAIT;
	   end
	end
      endcase
   end
endmodule
