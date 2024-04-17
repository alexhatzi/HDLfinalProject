`timescale 1ns / 1ps
`include "CPU.v"
module tb_top();
 
 logic  clk = 0  ; 

 CPU u_CPU  (.clk (clk));

 always #1 clk = ~clk ; 


 initial begin
   $dumpfile("dump.vcd"); 
   $dumpvars(0, tb_top);
   repeat(1000) begin
   u_CPU.instruction_q = $urandom; 
   #1 ; 
   end


  $finish;
 end



endmodule






