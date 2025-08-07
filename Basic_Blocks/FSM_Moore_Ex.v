`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 04:09:30 AM
// Design Name: 
// Module Name: FSM_Moore_Ex
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

//detect a 101 sequance.
module FSM_Moore_Ex(
    input clk,
    input reset,
    input x,
    output y
    );
    
   reg [1:0] state_next , state_reg ;
    localparam s0 = 0 ;
    localparam s1 = 1 ;
    localparam s2 = 2 ;
    localparam s3 = 3 ;
    
    always@(posedge clk , negedge reset)
    begin
        if (~reset)
        state_reg <= 'b0;
        else
        state_reg <= state_next ;
    end
    
    always@(*)
    begin
            case(state_reg)
            s0 : if(x) state_next = s1;
                 else state_next = s0 ;  
             
            s1 : if(x) state_next = s1;
                 else state_next = s2 ;
                 
            s2 : if(x) state_next = s3;
                 else state_next = s0 ;
                 
            s3 : if(x) state_next = s1;
                 else state_next = s2 ;
        default:   state_next = state_reg ;
        endcase
    end
    assign y = (state_reg == s2 ) & x ;      
             
   
endmodule