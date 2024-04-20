`timescale 1ns / 1ps
`include "CPU.v"
module tb_top();
 
  logic  [31:0] write_data [255:0]; 
  integer i ; 
  logic  clk = 0  ; 

 CPU u_CPU  (.clk (clk));

 always #1 clk = ~clk ; 


 initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
  for (i = 0 ; i < 256 ; i=i+1) begin
   u_CPU.u_InstructionMemory.ram[i] <= $urandom ; 
   #1000; 
   end
   $finish;
  end



endmodule






