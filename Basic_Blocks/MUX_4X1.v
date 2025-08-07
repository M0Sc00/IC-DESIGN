`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2025 03:03:18 AM
// Design Name: 
// Module Name: MUX_4X1
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


module MUX_4X1(
    input [3:0]X , [1:0]S ,
    output F
    );
        wire W1 , W2;
        MUX_2x1_gateLevel D1 (X[0] , X[1] , S[0] ,W1 );
        
        MUX_2X1_Behavior  D2 (
        .X1(X[2]),
        .X2(X[3]),
        .S(S[0]),
        .F(W2) );
        
        MUX_2x1_dataflow  D3 ( W1 , W2 , S[1] , F );
        
endmodule












