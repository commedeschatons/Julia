// $Id: $
// File name:   rcu.sv
// Created:     3/3/2016
// Author:      Chongjin Chua
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: rcu.sv

module rcu
  (
   input       clk,
   input       n_rst,
   input       d_edge,
   input       eop,
   input       shift_enable,
   input       byte_received,
   input [7:0] rcv_data,
   output reg  rcving,
   output reg  w_enable,
   output reg  r_error
   );

   typedef enum bit[3:0]
		{IDLE, RCV_SYNC, COMPARE, RCV_BITS, RCV_BYTE, EOP1, EOP2, EOP3, EOP4, EIDLE} rcu_state;

   rcu_state state;
   rcu_state next_state;

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
      rcving = 0;
      w_enable = 0;
      r_error = 0;

      case(state)
	
	IDLE: begin
	   if(d_edge == 1'b1) begin
	      next_state = RCV_SYNC;
	   end
	   else begin
	      next_state = IDLE;
	   end
	end
	
	RCV_SYNC: begin
	   rcving = 1'b1;
	   w_enable = 0;
	   r_error = 0;
	   if(byte_received == 1'b1) begin
	      next_state = COMPARE;
	   end
	   else begin
	      next_state = RCV_SYNC;
	   end
	end
	
	COMPARE: begin
	   rcving = 1'b1;
	   w_enable = 0;
	   r_error = 0;
	   if(rcv_data == 8'b10000000) begin
	      next_state = RCV_BITS;
	   end
	   else begin
	      next_state = EOP1;
	   end
	end

	RCV_BITS: begin
	   rcving = 1'b1;
	   w_enable = 0;
	   r_error = 0;
	   if(byte_received == 1'b1) begin
	      next_state = RCV_BYTE;
	   end
	   else if(eop == 1 && shift_enable == 1) begin
	      next_state = EOP2;
	   end
	end

	EOP1: begin
	   rcving = 1'b1;
	   w_enable = 0;
	   r_error = 1'b1;
	   if(shift_enable == 1 && eop == 1)
	      next_state = EOP2;
	end

	EOP2: begin
	   rcving = 1'b1;
	   w_enable = 0;
	   r_error = 1'b1;
	   if(d_edge == 1'b1)
	     next_state = EIDLE;
	end

	RCV_BYTE: begin
	   rcving = 1'b1;
	   w_enable = 1'b1;
	   r_error = 1'b0;
	   next_state = EOP3;
	end

	EOP3: begin
	   rcving = 1'b1;
	   w_enable = 1'b0;
	   r_error = 1'b0;
	   if(shift_enable == 1 && eop == 1)
	     next_state = EOP4;
	   else if(shift_enable == 1 && eop == 0)
	     next_state = RCV_BITS;
	end

	EOP4: begin
	   rcving = 1'b1;
	   w_enable = 1'b0;
	   r_error = 1'b0;
	   if(d_edge == 1'b1)
	     next_state = IDLE;
	end

	EIDLE: begin
	   r_error = 1'b1;
	   rcving = 0;
	   w_enable = 0;
	   if(d_edge == 1'b1)
	     next_state = RCV_SYNC;
	end
	
      endcase
   end
endmodule
