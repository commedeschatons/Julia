// custom_master_slave module : Acts as an avalon slave to receive input commands from PCIE IP

module custom_master_slave #(
			     parameter MASTER_ADDRESSWIDTH = 32 ,  	// ADDRESSWIDTH specifies how many addresses the Master can address 
			     parameter SLAVE_ADDRESSWIDTH = 3 ,  	// ADDRESSWIDTH specifies how many addresses the slave needs to be mapped to. log(NUMREGS)
			     parameter DATAWIDTH = 32 ,    		// DATAWIDTH specifies the data width. Default 32 bits
			     parameter NUMREGS = 8 ,       		// Number of Internal Registers for Custom Logic
			     parameter REGWIDTH = 32       		// Data Width for the Internal Registers. Default 32 bits
			     )	
   (	
	input logic 			       clk,
	input logic 			       reset_n,
   
	// Interface to Top Level
	input logic 			       rdwr_cntl, // Control Read or Write to a slave module.
	input logic 			       n_action, // Trigger the Read or Write. Additional control to avoid continuous transactions. Not a required signal. Can and should be removed for actual application.
	input logic 			       add_data_sel, // Interfaced to switch. Selects either Data or Address to be displayed on the Seven Segment Displays.
	input logic [MASTER_ADDRESSWIDTH-1:0]  rdwr_address, // read_address if required to be sent from another block. Can be unused if consecutive reads are required.
	output logic [DATAWIDTH-1:0] 	       display_data,

	// Bus Slave Interface
        input logic [SLAVE_ADDRESSWIDTH-1:0]   slave_address,
        input logic [DATAWIDTH-1:0] 	       slave_writedata,
        input logic 			       slave_write,
        input logic 			       slave_read,
        input logic 			       slave_chipselect,
        output logic [DATAWIDTH-1:0] 	       slave_readdata,

	// Bus Master Interface
        output logic [MASTER_ADDRESSWIDTH-1:0] master_address,
        output logic [DATAWIDTH-1:0] 	       master_writedata,
        output logic 			       master_write,
        output logic 			       master_read,
        input logic [DATAWIDTH-1:0] 	       master_readdata,
        input logic 			       master_readdatavalid,
        input logic 			       master_waitrequest,

   output logic display_our_next_reset,
   output logic display_nxt_start,
   output logic display_slave_write_reg,
	output logic display_toplevel_reset
	);

   parameter START_BYTE = 32'hF00BF00B;
   parameter STOP_BYTE = 32'hDEADF00B;
   parameter SDRAM_ADDR = 32'h08000000;

   logic [MASTER_ADDRESSWIDTH-1:0] 	       address, nextAddress;
   logic [DATAWIDTH-1:0] 		       nextRead_data, read_data;
   logic [DATAWIDTH-1:0] 		       nextData, wr_data;
   logic [NUMREGS-1:0][REGWIDTH-1:0] 	       csr_registers;  		// Command and Status Registers (CSR) for custom logic 
   logic [NUMREGS-1:0] 			       reg_index, nextRegIndex;
   logic [NUMREGS-1:0][REGWIDTH-1:0] 	       read_data_registers;  //Store SDRAM read data for display
   logic 				       new_data_flag;

   logic [31:0] 			       debug = '0;

   //INPUT/OUTPUT LOGICS
   logic 				       start_sig;		//signal that tells the program to start
   logic 				       nxt_start;
   reg [21:0] 				       a_reg;
   reg [21:0] 				       b_reg;
   logic 				       our_reset;
   logic 				       our_next_reset;

   logic 				       slave_write_reg;
   logic 				       toplevel_reset;
   typedef enum bit
		{WAIT,ASSERT} stateType;

   stateType state;
   stateType next_state;
   
   assign display_data = debug;

   // Slave side 
   always_ff @ ( posedge clk,negedge toplevel_reset ) begin 

      if(!toplevel_reset)
  	begin
    	   slave_readdata <= 32'h0;
 	   csr_registers <= '0;
	   debug <= '0;
	   slave_write_reg <= '0;
	   state <= WAIT;
  	end
      else 
  	begin
 	   slave_write_reg <= slave_write;
	   our_reset <= our_next_reset;
	   start_sig <= nxt_start;
	   debug <= debug;
	   state <= next_state;

	   if(start_sig == 1)
	     debug <= debug+1;

  	   if(slave_write && slave_chipselect && (slave_address >= 0) && (slave_address < NUMREGS))
  	     begin
  	  	csr_registers[slave_address] <= slave_writedata;  // Write a value to a CSR register
  	     end
  	   else if(slave_read && slave_chipselect  && (slave_address >= 0) && (slave_address < NUMREGS)) // reading a CSR Register
  	     begin
  	    	slave_readdata <= csr_registers[slave_address];
  	     end
  	end
   end

   always_comb begin
      a_reg = {csr_registers[0][10:0],csr_registers[1][10:0]};
      b_reg = {csr_registers[2][10:0],csr_registers[3][10:0]};

      display_our_next_reset = our_next_reset;
      display_slave_write_reg = slave_write_reg;
      display_nxt_start = nxt_start;
      display_toplevel_reset = toplevel_reset;

      if(slave_address == 3'b011 && slave_write_reg == 0 && slave_write == 1)
	our_next_reset = 0;
      else
	our_next_reset = 1;	 
      
      if(our_reset == 0 && our_next_reset == 1) begin
	 nxt_start = 1;
      end else begin
	 nxt_start = 0;
      end

      next_state = WAIT;
      case(state)
	WAIT: begin
	   toplevel_reset = 0;
	   if(slave_write == 1)
	     next_state = ASSERT;
			  else
			    next_state = WAIT;
	end
	
	ASSERT: begin
	   toplevel_reset = 1;

	   next_state = ASSERT;
	end
      endcase
   end

   julia_wrapper JULIA
     (
      .clk(clk),
      .n_rst(our_reset),
      .start_sig(start_sig),
      .wait_request(master_waitrequest),
      .a(a_reg),
      .b(b_reg),
      .wr_addr(master_address),
      .wr_data(master_writedata),
      .wr_enable(master_write)
      );

endmodule

/*


      if(wr_flag == 3'b011) begin
	 our_next_reset = 0;
	 next_wr_flag = 0;
      end else begin
	 our_next_reset = 1;
	 next_wr_flag = wr_flag + 1;
      end


      if(slave_address == 3'b011 && slave_write_reg == 0 && slave_write == 1)
	our_next_reset = 0;
      else
	our_next_reset = 1;	 
      
      if(our_reset == 0 && our_next_reset == 1) begin
	 nxt_start = 1;
      end else begin
	 nxt_start = 0;
      end

      next_state = WAIT;
      case(state)
	WAIT: begin
	   toplevel_reset = 0;
	   if(slave_write == 1)
	     next_state = ASSERT;
	   else
	     next_state = WAIT;
	end

	ASSERT: begin
	   toplevel_reset = 1;

	   next_state = ASSERT;
	end
      endcase
*/ 
