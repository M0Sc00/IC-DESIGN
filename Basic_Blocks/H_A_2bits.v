`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2025 10:13:44 PM
// Design Name: 
// Module Name: H_A_2bits
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


module H_A_2bits(
    input x,y,
    output s,c
    );
    
    xor (s,x,y);
    and (c,x,y);
endmodule
