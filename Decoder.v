`timescale 1ns / 1ps
/*
Decoder Module

Takes a 32-bit instruction as input and drives each
of the output based on the Instruction Set Architecture
given in the project instructions
*/


module  Decoder(
    input [31:0] inst, 
    output [2:0] opcode,
    output [4:0] reg_addr_0,
    output [4:0] reg_addr_1,
    output [4:0] reg_addr_2,
    output [15:0] addr
    );


    assign opcode     = inst[31:29] ;
    assign reg_addr_0 = inst[28:24] ;
	    

    assign reg_addr_1  =     (opcode == (3'd2||3'd3||3'd4||3'd5||3'd6)) ? (inst[23:19]) : 
			 	                    				 4'bXXXX  ; // Default unknown state

    assign reg_addr_2  =     (opcode == (3'd4||3'd5||3'd6||3'd7)) ? (inst[18:14]) 	  : 
			 	                     			         4'bXXXX  ; // Default unknown state

    assign addr        =     (opcode == (3'd0||3'd1)) 		  ? (inst[15:0])  	  : 
			     (opcode == (3'd2||3'd3)) 		  ? ({1'b0,inst[14:0]})   :
			     (opcode == (3'd4||3'd5||3'd6||3'd7)) ? ({2'b00,inst[13:0]})  :
				   					        15'd0     ; // Default state




endmodule






