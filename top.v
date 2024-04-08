

module processor (
	input clk
	, input logic [63:0] inst
	, output logic [63:0] result
) ; 


 reg [2:0] opcode ; 
 reg [4:0] reg1   ; 
 reg [4:0] reg2   ; 
 reg [4:0] reg3   ; 
 reg [15:0] addr  ;
 reg [4:0] internalreg1 ; 
 reg [4:0] internalreg2 ;  

assign opcode = inst [31:29] ; 
assign reg1   = inst [28:24] ; 
assign reg2   = inst [23:19] ; 
assign reg3   = inst [18:16] ; 
assign addr   = inst [15:0]  ; 



always_ff@(posedge clk) begin

	case (opcode) 

	4'0001 : 



end

