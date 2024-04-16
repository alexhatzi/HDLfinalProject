`timescale 1ns / 1ps
`include "CPU.v"
module tb_top();
 
 logic  clk ; 
 logic [31:0] inst ; 

  CPU u_CPU  (	.clk (clk));

always #1 clk = ~clk ; 

// enum {LOAD,STORE,BEQ,BLT,ADD,SUB,AND,OR} e_operation ;


//assign e_operation = inst[31:29] ; 

class TestVector ;

	rand bit [31:0] instr;

	constraint opcodes {instr dist {0:=10,1:=10,2:=10,3:=10,4:=10,5:=10,6:=10,7:=10 };}

endclass



 initial begin
   TestVector tv = new(); 
   $dumpvars(0, tb_top);
   $dumpfile("dump.vcd"); 

   repeat(1000) begin
   tv.randomize ; 
   u_CPU.instruction_q = tv.inst 
   operation = inst[31:29] ; 


   end
  $finish;
 end

endmodule






