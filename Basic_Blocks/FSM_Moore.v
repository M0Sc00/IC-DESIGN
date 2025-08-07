`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 06:38:45 AM
// Design Name: 
// Module Name: FSM_Moore
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


module FSM_Moore(
    input clk , reset , x ,
    output y
    );
    
 reg   [1:0] state_reg , state_next;
    
    always@(posedge clk , negedge reset)
    begin
        if(~reset)
        state_reg <= 0 ;
        else
        state_reg <= state_next ;
    end
    
    always@(*)
    begin
        state_next[0] =  ~x | (~state_reg[0] & state_reg[1]) ;
        state_next[1] = x & ( state_reg[0] ^ state_reg[1]) ;
    end
    
    assign y = state_reg[0] & state_reg[1] ;
endmodule

