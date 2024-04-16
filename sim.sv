`timescale 1ns / 1ps
`include "CPU.v"
module tb_top	 	(
            output 		clk
    	 ,  output logic [31:0] inst
         ,  input  logic [31:0] result
			);


  processor u_processor (
	.clk		 (clk)
	.inst		 (inst)
	.result		 (result)
			);

always #1 clk = ~clk ; 
enum reg [2:0] {"LOAD","STORE","BEQ","BLT","ADD","SUB","AND","OR"} operation; 


assign operation = inst[31:29] ; 

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
   inst = tv.inst 
   operation = inst[31:29] ; 



   end






  $finish;
 end

endmodule










