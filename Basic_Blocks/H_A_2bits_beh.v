`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2025 10:22:57 PM
// Design Name: 
// Module Name: H_A_2bits_beh
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


module H_A_2bits_beh(
    input a,
    input b,
    output s,
    output c
    );
    
    assign s = a^b;
    assign c= a&b;
endmodule
