`timescale 1ns / 1ps
`include "top.v"

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




initial begin

end



endmodule




