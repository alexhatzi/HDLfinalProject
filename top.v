module processor (
	input clk
	, input logic [31:0] inst
	, output logic [31:0] result
) ; 


 reg [2:0] opcode ; 
 reg [4:0] reg1   ; 
 reg [4:0] reg2   ; 
 reg [4:0] reg3   ; 
 reg [15:0] addr  ;
 reg [15:0] SinglePortRam [31:0] ;  // 256  - 32 bit registers 


assign opcode = inst [31:29] ; 
assign reg1   = inst [28:24] ; 
assign reg2   = inst [23:19] ; 
assign reg3   = inst [18:16] ; 
assign addr   = inst [15:0]  ; 



always_ff@(posedge clk) begin

	case (opcode) 

	4'b0001 : begin    // Load Word
	         reg1 <= SinglePortRam[addr] ;  
                end

	4'b0010 : begin   // Store Word
		 SinglePortRam[addr] <= reg1 ; 	
       		end

 	4'b0011 : begin   // Brance if Equal
		 if(SinglePortRam[] == 
		end


	endcase


end

