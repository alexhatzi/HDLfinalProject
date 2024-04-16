`include "CPU.v"


 module processor (
         	input clk
	, input logic [31:0] inst
	, output logic [31:0] result
 ) ; 



 CPU u_CPU ();

 reg [2:0] opcode ; 
 reg [4:0] reg1   ; 
 reg [4:0] reg2   ; 
 reg [4:0] reg3   ; 
 reg [15:0] addr  ;
 reg [15:0] SinglePortRam [31:0] ;  // 256  - 32 bit registers 


 always@(posedge clk) begin


     opcode <= inst [31:29] ; 
     reg1   <= inst [28:24] ; 
     reg2   <= inst [23:19] ; 
     reg3   <= inst [18:16] ; 
     addr   <= inst [15:0]  ; 


	case (opcode) 

	3'b001 : begin    // Load Word
	         reg1 <= SinglePortRam[addr] ;  
                end

	3'b010 : begin   // Store Word
		 SinglePortRam[addr] <= reg1 ; 	
       		end

 	3'b011 : begin   // Brance if Equal
		 if(SinglePortRam[reg1] == SinglePortRam[reg2]) begin
			u_CPU.pc_q = u_CPU.pc_q + 1 ;
		  end 
		 end
	endcase

 end



endmodule




