`timescale 1ns / 1ps
/*
Instruction Module

A 2-d register array with one read port
*/


module  InstructionMemory(
    input [15:0] inst_address,
    output [31:0] read_data
    );
    
        // Initialize Instructions in the memory for testing
    initial begin
        ram[0] <= 32'h2000_0004; // Store instruction that reads registerFile[0] and write to dataMemory[4].
    end
    
    reg [31:0] ram [255:0];
    
    // Assign statement to read ram based on inst_address
    
endmodule