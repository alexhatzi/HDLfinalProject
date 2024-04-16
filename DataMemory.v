`timescale 1ns / 1ps

/*
DataMemory Module

A 2-d register array with one read ports
and one write port
*/

module  DataMemory(
    input [14:0] data_address,
    input write_en,
    input [31:0] write_data,
    output [31:0] read_data
    );
    integer i;
    reg [31:0] ram [255:0];
    
    // Use a for loop to initialize each block in ram 
    // to its index. For example ram[0], ram[1], ram[2]
    // contains 0, 1, 2 respectively. 
    initial begin
	for(int i = 0 ; i <  4294967295 ; i=i+1) begin
		ram[i] <= 'i ; 	
	end
    end
    
    
    // Use assign statement to read ram based on 
    // data_address and drive the read_data output
    
    always @* begin
        if(write_en) begin
            // When write_en is high write the write_data 
            // to the ram based on address write_address_0 
        end
    end
    
endmodule
