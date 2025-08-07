`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2025 04:41:14 PM
// Design Name: 
// Module Name: TFF
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


module TFF(
    input T,
    input clk,
    input reset_n,
    output q
    );
   // localparam C2Q = 2 ; /*clk to Q delay*/
    wire Q_next ;
    reg Q_reg ;
    always@(posedge clk , negedge reset_n) // Synchronous reset.
        begin
          if(~reset_n)    // Asynchronous reset.
            Q_reg <= 'b0;
          else
     /*   #C2Q;*/    Q_reg <= Q_next ;
        end
        
    assign  Q_next = T? ~Q_reg : Q_reg ;
 
       
        assign q = Q_reg ;
endmodule
