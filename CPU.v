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
    
     
    reg [7:0]  pc_q = 0	;      // Program Counter
    reg [31:0]  instruction_q	;      // Holds instruction binary     
    reg [1:0]   state_q = 0	;      // State of CPU
    



    // Instantiate decoder, Instruction Memory,
    // Data Memory, Register File and ALU
   Decoder u_decoder ()	    ;
   InstructionMemory u_InstructionMemory () ;
   DataMemory u_DataMemory ()		    ;
   RegisterFile u_RegisterFile()	    ;
   ALU u_ALU()				    ; 
    
   reg [2:0] opcode 	; 
   reg [4:0] reg_addr_0 ; 
   reg [4:0] reg_addr_1 ; 
   reg [4:0] reg_addr_2 ; 
   reg [15:0] addr 	;  
   reg [31:0] inst  	; 
   reg [31:0] ALU_RESULT;
   reg        write_en  ; 

   assign u_InstructionMemory.inst_address = pc_q  	   ; 
   assign u_decoder.inst 		   = instruction_q ; 
   assign u_ALU.ip_0			   = reg_addr_0    ; 
   assign u_ALU.ip_1			   = reg_addr_1    ; 
   assign u_ALU.opcode 			   = opcode        ; 
   assign u_RegisterFile.write_address_0   = addr	   ; 
   assign u_RegisterFile.write_data        = ALU_RESULT    ; 
   assign u_RegisterFile.write_en	   = write_en      ; 




   always @(posedge clk) begin
    if (state_q == 0) begin
        write_en <= 1'b0; 
        instruction_q <= u_InstructionMemory.read_data;
        pc_q <= pc_q + 1'b1; 
        state_q <= 2'b01; 
    end
    else if (state_q == 2'b01) begin 
        opcode <= u_decoder.opcode; // Store all data necessary for next stages in a register
        reg_addr_0 <= u_decoder.reg_addr_0;
        reg_addr_1 <= u_decoder.reg_addr_1;
        reg_addr_2 <= u_decoder.reg_addr_2;
        addr <= u_decoder.addr;
        state_q <= 2'b10; // Update state
    end
    else if (state_q == 2'b10) begin // Execute Stage
        // Perform ALU operations
        if (opcode == 3'd2 || opcode == 3'd3 || opcode == 3'd4 || opcode == 3'd5 || opcode == 3'd6 || opcode == 3'd7) begin
            ALU_RESULT <= u_ALU.op_0;
        end
        if (u_ALU.change_pc) begin
            pc_q <= addr;
        end
        state_q <= 2'b11; // Update state
    end
    else if (state_q == 2'b11) begin // Memory Stage
        if (opcode == 3'd0 || opcode == 3'd1) begin
            write_en <= 1'b1;
        end
        state_q <= 2'b00; // Update state
    end
end

endmodule
