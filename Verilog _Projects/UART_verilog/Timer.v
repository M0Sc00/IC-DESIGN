`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/13/2025 05:56:22 AM
// Design Name: 
// Module Name: Timer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Timer
#(parameter Bits =4)
    (
    input clk , reset ,enable,
    input [Bits-1 : 0 ] FINAL_VALUE ,
    output DONE
    );
    
    reg [Bits-1 : 0] state_reg , state_next ;
    
    always@(posedge clk , negedge reset)
    begin
        if(~reset)
        state_reg <= 'b0 ;
        else if (enable)
        state_reg <= state_next ;
        else
        state_reg <= state_reg ;      
    end
    
    assign DONE = (state_reg == FINAL_VALUE) ;
    
    always@(*)
    assign state_next = DONE? 'b0 : state_reg + 1 ;

endmodule
