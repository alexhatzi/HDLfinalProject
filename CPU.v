`timescale 1ns / 1ps

/*
CPU Module

Top Module for CPU.

*/

`include "Decoder.v"
`include "ALU.v"
`include "InstructionMemory.v"
`include "DataMemory.v"
`include "RegisterFile.v"


module CPU( input clk
    );
    
     
    reg [15:0]  pc_q = 0;      // Program Counter
    reg [31:0]  instruction_q; // Holds instruction binary 
    reg [1:0]   state_q = 0;   // State of CPU
    
    // Instantiate decoder, Instruction Memory,
    // Data Memory, Register File and ALU
   Decoder u_decoder (.inst(inst));
   InstructionMemory u_InstructionMemory ();
   DataMemory u_DataMemory ();
   RegisterFile u_RegisterFile();
   ALU u_ALU(); 
    
   reg [2:0] opcode ; 
   reg [4:0] reg_addr_0 ; 
   reg [4:0] reg_addr_1 ; 
   reg [4:0] reg_addr_2 ; 
   reg [15:0] addr ;  
   reg [31:0] inst ; 

     
    always@(posedge clk)
    begin
        if(state_q == 0) begin // Fetch Stage
         instruction_q =  u_InstructionMemory.read_data ;   		 // Read instruction from instruction memory
         pc_q <=  pc_q + 1'b1 ; 						 // increment PC
         state_q <= 2'b1 ; 					   	         // increment state
        end else if(state_q == 1) begin  // Decode Stage       
            inst = instruction_q ; 			// Instruction Decode and read data from register/memory
            opcode <= u_decoder.opcode ;			// store all data necessary for next stages in a register
	    reg_addr_0 <=u_decoder.reg_addr_0 ; 
	    reg_addr_1 <=u_decoder.reg_addr_1 ; 
	    reg_addr_2 <=u_decoder.reg_addr_2 ; 
	    addr       <=u_decoder.addr	      ; 
	     
            state_q <= 2;  //update state
        end else if(state_q == 2) begin  // Execute Stage        
            // Perform ALU operations
	    
            state_q <= 3; //update state
        end else if(state_q == 3) begin  // Memory Stage
            // Access Memory and register file(for load)
            state_q <= 0;
        end    
    end
    
endmodule
