`timescale 1ns / 1ps
`include "CPU.v"
module tb_top();
 
 logic  clk ; 

 CPU u_CPU  (.clk (clk));

 always #1 clk = ~clk ; 


 initial begin
   $dumpvars(0, tb_top);
   $dumpfile("dump.vcd"); 

   repeat(1000) begin
   u_CPU.instruction_q = $urandom; 
   end


  $finish;
 end



endmodule






