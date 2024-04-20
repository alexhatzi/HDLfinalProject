`timescale 1ns / 1ps
/*
Instruction Module

A 2-d register array with one read port
*/



module  InstructionMemory(
    input [15:0] inst_address,
    output [31:0] read_data
    );
    
    reg [31:0] ram [255:0];

    // Initialize Instructions in the memory for testing
    initial begin
        ram[0] <= 32'h2000_0004; // Store instruction that reads registerFile[0] and write to dataMemory[4].
	ram[1] <= $urandom ; 
	ram[2] <= $urandom ; 
	ram[3] <= $urandom ; 
	ram[4] <= $urandom ; 
	ram[5] <= $urandom ; 
	ram[6] <= $urandom ; 
	ram[7] <= $urandom ; 
	ram[8] <= $urandom ; 
	ram[9] <= $urandom ; 
	ram[10]<= $urandom ; 
    end
    
    
    // Assign statement to read ram based on inst_address
    assign read_data = ram[inst_address] ; 

  
endmodule
