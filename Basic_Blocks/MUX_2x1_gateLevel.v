`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2025 06:47:05 PM
// Design Name: 
// Module Name: MUX_2x1_gateLevel
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


module MUX_2x1_gateLevel(
    input I0 , I1 , S ,
    output F );
    
    not G0(Sn ,S); // WE CAN GET RID OF IT.
    // and G1(W1,I0,~S); AND DON'T USE EXTERNAL NOT GATE.
    and G1(W1,I0,Sn);
    and G2(W2,I1,S );
    or G3(F,W1,W2);
    
endmodule
