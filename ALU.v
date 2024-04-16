`timescale 1ns / 1ps

/*
ALU Module

Performs arithmetic operations for add,
sub, and, or operations. Also performs 
comparison operation for beq, blt.
*/

module ALU(
    input wire [31:0] ip_0,
    input wire [31:0] ip_1,
    input wire [2:0] opcode,
    output wire [31:0] op_0,
    output wire change_pc
    );
    
    // Use assign statement to perform add, sub,
    // and, or operations on ip_0 and ip_1 based 
    // on the instruction/opcode
always@(*) begin    
   case(opcode) 
	3'd4 : op_0 = ip_0 + ip_1 ; 
	3'd5 : op_0 = ip_0 - ip_1 ;
	3'd6 : op_0 = ip_0 & ip_1 ; 
	3'd7 : op_0 = ip_0 | ip_1 ; 
	default: op_0 = ip_0;
   endcase
end

    
    
    // Change_pc is required for the branch operations for 
    // the two control instructions. If ip_0 and ip_1 are equal 
    //  when the instruction is "beq" or ip_0 < ip_1 when 
    // instruction is "blt", the change_pc goes high 
    
    assign change_pc = opcode == 2 ? (ip_0 == ip_1):(
                        opcode == 3 ? (ip_0 < ip_1) : 0);
    
    
endmodule
