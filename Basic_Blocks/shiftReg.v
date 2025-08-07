`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 07:46:41 AM
// Design Name: 
// Module Name: shiftReg
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

module shiftReg
(   input [3:0] I,
    output [3:0]Q,
    input clk
      );
     reg [3:0]  Q_next ,Q_reg;
   
                
        always@ (posedge clk)
        begin
            Q_reg <= Q_next ;
         end
        
        always @(I ,Q_reg) //compinatianal circuit
        begin
            //Shift Right
            Q_next = {I,Q_reg[3:1]} ;
            
            //ShiftLeft
            // Q_next = {Q_reg [2:0] , I}
        end
        
        assign Q = Q_reg  ;
        
endmodule
