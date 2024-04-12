`timescale 1ns / 1ps

/*
CPU Module

Top Module for CPU.

*/


module CPU(
    input clk
    );
    
     
    reg [15:0]  pc_q = 0;      // Program Counter
    reg [31:0]  instruction_q; // Holds instruction binary 
    reg [1:0]   state_q = 0;   // State of CPU
    
    // Instantiate decoder, Instruction Memory,
    // Data Memory, Register File and ALU
    
    
    
        
    always@(posedge clk)
    begin
        if(state_q == 0) begin // Fetch Stage
            // Read instruction from instruction memory
            // increment PC
            // increment state
        end else if(state_q == 1) begin  // Decode Stage       
            // Instruction Decode and read data from register/memory
            // store all data necessary for next stages in a register 
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
