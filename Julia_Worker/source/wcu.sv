// $Id: $
// File name:   wcu.sv
// Created:     4/24/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: takes input from work dispatcher and send output to memory controller

module wcu
  (
   input      clk,
   input      n_rst,
   input      JW_start,
   input      MC_busy,
   input      calc_done,
   input      convert_done,
   output reg convert_start, 
   output reg JW_ready ,
   output reg JW_done,
   output reg calc_start
   );

   typedef enum bit[2:0]
		{IDLE, ASK_WAIT, CONVERT, CALC1, CALC2, WRITE_WAIT} wcu_state;

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
	   convert_start = 0;
	   
	   next_state = ASK_WAIT;
	end
	
	ASK_WAIT: begin
	   JW_ready = 1;
	   JW_done = 0;
	   calc_start = 0;
	   convert_start = 0;
	   
	   if(JW_start == 1'b1) begin
	      next_state = CONVERT;
	   end else begin
	      next_state = ASK_WAIT;
	   end
	end

	CONVERT: begin
	   JW_ready = 0;
	   JW_done = 0;
	   calc_start = 0;
	   convert_start = 1;

	   if(convert_done == 1'b1) begin
	      next_state = CALC1;
	   end else begin
	      next_state = CONVERT;
	   end
	end
	
	CALC1: begin
	   JW_ready = 0;
	   JW_done = 0;
	   calc_start = 1;
	   convert_start = 0;
	   
	   next_state = CALC2;

	end

	CALC2: begin
	   JW_ready = 0;
	   JW_done = 0;
	   calc_start = 1;
	   convert_start = 0;
	   
	   if(calc_done == 1'b1) begin
	      next_state = WRITE_WAIT;
	   end
	   else begin
	      next_state = CALC2;
	   end
	end

	WRITE_WAIT: begin
	   JW_ready = 0;
	   JW_done = 1;
	   calc_start = 1;
	   convert_start = 0;	   

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
