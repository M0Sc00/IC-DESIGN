`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2025 10:36:16 PM
// Design Name: 
// Module Name: FULL_ADDER
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


module FULL_ADDER(
    input cin,
    input y,
    input x,
    output S,
    output C
    );
 
    wire w0 ,w1 ,w2;
    H_A_2bits_beh m0(
        .a(y),
        .b(x),
        .s(w0),
        .c(w1)
        );
        
         H_A_2bits_beh m1(
        .a(w0),
        .b(cin),
        .s(S),
        .c(w2)
        );

        assign C = w2|w1 ;
        
          
endmodule
